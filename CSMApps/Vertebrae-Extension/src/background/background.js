// Vertebrae Background Service Worker
// Handles WebSocket connections, heartbeats, session management, inter-session communication

const VERTEBRAE_VERSION = "1.0.0";
const KILO_AI_WS_URL = "wss://app.kilo.ai/cloud/chat";
const HEARTBEAT_INTERVAL = 15000; // 15 seconds

// State management
let sessions = new Map(); // sessionId -> { ws, sessionData, heartbeatTimer, status }
let sessionGroups = new Map(); // groupId -> { name, color, sessionIds }
let messagePorts = new Map(); // sessionId -> Port

// Initialize storage
async function initializeStorage() {
  const data = await browser.storage.local.get(["sessions", "groups", "settings"]);
  
  if (data.sessions) {
    for (const [id, session] of Object.entries(data.sessions)) {
      sessions.set(id, { ...session, ws: null, heartbeatTimer: null, status: "disconnected" });
    }
  }
  
  if (data.groups) {
    for (const [id, group] of Object.entries(data.groups)) {
      sessionGroups.set(id, group);
    }
  }
  
  // Ensure default group
  if (!sessionGroups.has("default")) {
    sessionGroups.set("default", {
      id: "default",
      name: "Default Group",
      color: "#74B9FF",
      sessionIds: [],
      createdAt: Date.now(),
      sortOrder: 0
    });
    await saveGroups();
  }
  
  // Reconnect auto-reconnect sessions
  for (const [id, session] of sessions.entries()) {
    if (session.autoReconnect && session.status !== "disconnected") {
      connectSession(id);
    }
  }
}

// Save to storage
async function saveSessions() {
  const sessionsObj = {};
  for (const [id, session] of sessions.entries()) {
    const { ws, heartbeatTimer, status, ...sessionData } = session;
    sessionsObj[id] = { ...sessionData, status };
  }
  await browser.storage.local.set({ sessions: sessionsObj });
}

async function saveGroups() {
  const groupsObj = {};
  for (const [id, group] of sessionGroups.entries()) {
    groupsObj[id] = group;
  }
  await browser.storage.local.set({ groups: groupsObj });
}

async function saveSettings(settings) {
  await browser.storage.local.set({ settings });
}

// WebSocket connection
function connectSession(sessionId) {
  const session = sessions.get(sessionId);
  if (!session) return;
  
  updateSessionStatus(sessionId, "connecting");
  
  const wsUrl = `${KILO_AI_WS_URL}?sessionId=${session.sessionId}`;
  
  try {
    const ws = new WebSocket(wsUrl);
    session.ws = ws;
    
    ws.onopen = () => {
      console.log(`[Vertebrae] Connected: ${sessionId}`);
      updateSessionStatus(sessionId, "connected");
      sendHeartbeat(sessionId);
      startHeartbeat(sessionId);
    };
    
    ws.onmessage = (event) => {
      handleWebSocketMessage(sessionId, event.data);
    };
    
    ws.onclose = (event) => {
      console.log(`[Vertebrae] Disconnected: ${sessionId} - ${event.code} ${event.reason}`);
      updateSessionStatus(sessionId, "disconnected");
      stopHeartbeat(sessionId);
      
      if (session.autoReconnect) {
        setTimeout(() => connectSession(sessionId), 5000);
      }
    };
    
    ws.onerror = (error) => {
      console.error(`[Vertebrae] WS Error: ${sessionId}`, error);
      updateSessionStatus(sessionId, "error");
    };
  } catch (error) {
    console.error(`[Vertebrae] Connection failed: ${sessionId}`, error);
    updateSessionStatus(sessionId, "error");
  }
}

function disconnectSession(sessionId) {
  const session = sessions.get(sessionId);
  if (!session) return;
  
  if (session.ws) {
    session.ws.close(1000, "Client disconnect");
  }
  stopHeartbeat(sessionId);
  updateSessionStatus(sessionId, "disconnected");
}

// Heartbeat system
function startHeartbeat(sessionId) {
  const session = sessions.get(sessionId);
  if (!session) return;
  
  stopHeartbeat(sessionId);
  
  session.heartbeatTimer = setInterval(() => {
    sendHeartbeat(sessionId);
  }, HEARTBEAT_INTERVAL);
}

function stopHeartbeat(sessionId) {
  const session = sessions.get(sessionId);
  if (session && session.heartbeatTimer) {
    clearInterval(session.heartbeatTimer);
    session.heartbeatTimer = null;
  }
}

function sendHeartbeat(sessionId) {
  const session = sessions.get(sessionId);
  if (!session || !session.ws || session.ws.readyState !== WebSocket.OPEN) return;
  
  // Browser-mimicking heartbeat
  session.ws.send(JSON.stringify({
    type: "heartbeat",
    sessionId: session.sessionId,
    t: Date.now()
  }));
  
  // Browser ping
  session.ws.send(JSON.stringify({
    type: "ping",
    data: { t: Date.now() }
  }));
  
  session.lastHeartbeat = Date.now();
}

// Message handling
function handleWebSocketMessage(sessionId, data) {
  const session = sessions.get(sessionId);
  if (!session) return;
  
  try {
    const message = JSON.parse(data);
    
    // Broadcast to UI
    broadcastToUI("ws_message", {
      sessionId,
      message,
      timestamp: Date.now()
    });
    
    // Handle specific message types
    switch (message.type) {
      case "terminal_output":
        // Forward to terminal
        broadcastToUI("terminal_output", { sessionId, data: message.data });
        break;
      case "session_status":
        updateSessionStatus(sessionId, message.status);
        break;
      case "inter_session":
        // Handle inter-session messages
        handleInterSessionMessage(sessionId, message);
        break;
    }
  } catch (error) {
    console.error("[Vertebrae] Message parse error:", error);
  }
}

function sendToSession(sessionId, data) {
  const session = sessions.get(sessionId);
  if (session && session.ws && session.ws.readyState === WebSocket.OPEN) {
    session.ws.send(JSON.stringify(data));
  }
}

// Inter-session communication
function handleInterSessionMessage(fromSessionId, message) {
  const { toSessionId, groupId, type, payload, broadcast } = message;
  
  if (broadcast && groupId) {
    const group = sessionGroups.get(groupId);
    if (group) {
      for (const sessionId of group.sessionIds) {
        if (sessionId !== fromSessionId) {
          sendToSession(sessionId, {
            type: "inter_session",
            from: fromSessionId,
            type: message.type,
            payload
          });
        }
      }
    }
  } else if (toSessionId) {
    sendToSession(toSessionId, {
      type: "inter_session",
      from: fromSessionId,
      type: message.type,
      payload
    });
  }
}

// Session management
async function createSession(sessionId, groupId = "default", displayName = "") {
  const id = `vertebrae_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  
  const session = {
    id,
    sessionId,
    displayName: displayName || `Session ${sessionId.slice(-8)}`,
    groupId,
    url: `https://app.kilo.ai/cloud/chat?sessionId=${sessionId}`,
    status: "disconnected",
    createdAt: Date.now(),
    lastConnectedAt: 0,
    lastHeartbeatAt: 0,
    heartbeatIntervalSeconds: 30,
    autoReconnect: true,
    isFocused: false,
    windowX: 0,
    windowY: 0,
    windowWidth: 800,
    windowHeight: 600,
    isFloating: true,
    cookies: {},
    headers: {}
  };
  
  sessions.set(id, { ...session, ws: null, heartbeatTimer: null, status: "disconnected" });
  
  // Add to group
  const group = sessionGroups.get(groupId);
  if (group) {
    group.sessionIds.push(id);
    await saveGroups();
  }
  
  await saveSessions();
  return id;
}

async function deleteSession(sessionId) {
  const session = sessions.get(sessionId);
  if (!session) return;
  
  disconnectSession(sessionId);
  
  // Remove from group
  const group = sessionGroups.get(session.groupId);
  if (group) {
    group.sessionIds = group.sessionIds.filter(id => id !== sessionId);
    await saveGroups();
  }
  
  sessions.delete(sessionId);
  await saveSessions();
}

async function updateSession(sessionId, updates) {
  const session = sessions.get(sessionId);
  if (!session) return;
  
  Object.assign(session, updates);
  await saveSessions();
  broadcastToUI("session_updated", { sessionId, updates });
}

function updateSessionStatus(sessionId, status) {
  const session = sessions.get(sessionId);
  if (!session) return;
  
  session.status = status;
  if (status === "connected") {
    session.lastConnectedAt = Date.now();
  }
  if (status === "disconnected") {
    stopHeartbeat(sessionId);
  }
  
  broadcastToUI("session_status", { sessionId, status });
  saveSessions();
}

// Group management
async function createGroup(name, color = "#74B9FF") {
  const id = `group_${Date.now()}`;
  const group = {
    id,
    name,
    color,
    createdAt: Date.now(),
    sessionIds: [],
    sortOrder: sessionGroups.size
  };
  
  sessionGroups.set(id, group);
  await saveGroups();
  broadcastToUI("group_created", { group });
  return id;
}

async function updateGroup(groupId, updates) {
  const group = sessionGroups.get(groupId);
  if (!group) return;
  
  Object.assign(group, updates);
  await saveGroups();
  broadcastToUI("group_updated", { groupId, updates });
}

async function deleteGroup(groupId) {
  if (groupId === "default") return;
  
  // Move sessions to default
  const group = sessionGroups.get(groupId);
  if (group) {
    for (const sessionId of group.sessionIds) {
      const session = sessions.get(sessionId);
      if (session) {
        session.groupId = "default";
        const defaultGroup = sessionGroups.get("default");
        if (defaultGroup && !defaultGroup.sessionIds.includes(sessionId)) {
          defaultGroup.sessionIds.push(sessionId);
        }
      }
    }
    await saveGroups();
  }
  
  sessionGroups.delete(groupId);
  await saveGroups();
  broadcastToUI("group_deleted", { groupId });
}

// Message broadcasting to UI
function broadcastToUI(type, payload) {
  // Send to sidebar
  browser.runtime.sendMessage({ type, payload }).catch(() => {});
  
  // Send to popups
  browser.runtime.sendMessage({ type, payload }).catch(() => {});
  
  // Send to content scripts
  browser.tabs.query({}, (tabs) => {
    for (const tab of tabs) {
      browser.tabs.sendMessage(tab.id, { type, payload }).catch(() => {});
    }
  });
  
  // Send to native messaging ports
  for (const port of messagePorts.values()) {
    port.postMessage({ type, payload });
  }
}

// Native messaging / Port connections
browser.runtime.onConnect.addListener((port) => {
  if (port.name === "vertebrae_session") {
    const sessionId = port.sender.tab?.id || port.name;
    messagePorts.set(sessionId, port);
    
    port.onMessage.addListener((msg) => {
      handlePortMessage(sessionId, msg);
    });
    
    port.onDisconnect.addListener(() => {
      messagePorts.delete(sessionId);
    });
  }
});

function handlePortMessage(sessionId, message) {
  const { type, payload } = message;
  
  switch (type) {
    case "terminal_input":
      sendToSession(sessionId, { type: "input", data: payload });
      break;
    case "terminal_resize":
      sendToSession(sessionId, { type: "resize", cols: payload.cols, rows: payload.rows });
      break;
    case "send_command":
      sendToSession(sessionId, { type: "command", command: payload.command, args: payload.args });
      break;
    case "get_sessions":
      port.postMessage({ type: "sessions_list", payload: getSessionsForUI() });
      break;
    case "get_groups":
      port.postMessage({ type: "groups_list", payload: getGroupsForUI() });
      break;
  }
}

function getSessionsForUI() {
  const result = [];
  for (const [id, session] of sessions.entries()) {
    const { ws, heartbeatTimer, ...sessionData } = session;
    result.push({ ...sessionData, id });
  }
  return result;
}

function getGroupsForUI() {
  const result = [];
  for (const [id, group] of sessionGroups.entries()) {
    result.push({ ...group });
  }
  return result;
}

// Alarm for periodic tasks
browser.alarms.onAlarm.addListener((alarm) => {
  if (alarm.name === "heartbeat_check") {
    // Check for stale heartbeats
    const now = Date.now();
    for (const [id, session] of sessions.entries()) {
      if (session.status === "connected" && session.lastHeartbeat) {
        if (now - session.lastHeartbeat > session.heartbeatIntervalSeconds * 2000) {
          console.log(`[Vertebrae] Heartbeat stale for ${id}, reconnecting`);
          disconnectSession(id);
          setTimeout(() => connectSession(id), 1000);
        }
      }
    }
  }
});

// Initialize
browser.runtime.onStartup.addListener(initializeStorage);
browser.runtime.onInstalled.addListener(initializeStorage);

// Periodic save
setInterval(() => {
  saveSessions();
  saveGroups();
}, 30000);

// Initialize on load
initializeStorage();

// Export for testing
if (typeof module !== "undefined") {
  module.exports = {
    sessions,
    sessionGroups,
    connectSession,
    disconnectSession,
    createSession,
    deleteSession,
    updateSession,
    createGroup,
    updateGroup,
    deleteGroup
  };
}