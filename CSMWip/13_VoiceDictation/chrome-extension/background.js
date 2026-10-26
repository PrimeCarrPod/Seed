// VoiceDictation Chrome Extension - Background Service Worker
// Connects to local WebSocket server and relays messages to content scripts

const WS_URL = 'ws://localhost:8765';
let ws = null;
let reconnectTimer = null;
const RECONNECT_DELAY = 3000;

function connect() {
  if (ws && (ws.readyState === WebSocket.OPEN || ws.readyState === WebSocket.CONNECTING)) {
    return;
  }
  
  console.log('[VoiceDictation] Connecting to', WS_URL);
  ws = new WebSocket(WS_URL);
  
  ws.onopen = () => {
    console.log('[VoiceDictation] Connected to WS server');
    chrome.runtime.sendMessage({type: 'ws_status', connected: true});
    if (reconnectTimer) {
      clearTimeout(reconnectTimer);
      reconnectTimer = null;
    }
  };
  
  ws.onmessage = (event) => {
    try {
      const msg = JSON.parse(event.data);
      if (msg.type === 'text' && msg.payload) {
        // Broadcast to all content scripts
        chrome.tabs.query({}, (tabs) => {
          tabs.forEach(tab => {
            chrome.tabs.sendMessage(tab.id, {type: 'insert_text', text: msg.payload})
              .catch(() => {}); // Ignore errors for tabs without content script
          });
        });
      }
    } catch (e) {
      console.error('[VoiceDictation] Parse error:', e);
    }
  };
  
  ws.onclose = (event) => {
    console.log('[VoiceDictation] Disconnected:', event.code, event.reason);
    chrome.runtime.sendMessage({type: 'ws_status', connected: false});
    scheduleReconnect();
  };
  
  ws.onerror = (error) => {
    console.error('[VoiceDictation] WS error:', error);
  };
}

function scheduleReconnect() {
  if (reconnectTimer) return;
  reconnectTimer = setTimeout(() => {
    reconnectTimer = null;
    connect();
  }, RECONNECT_DELAY);
}

// Start connection
connect();

// Handle messages from popup
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.type === 'get_status') {
    sendResponse({connected: ws && ws.readyState === WebSocket.OPEN});
  }
  return true;
});