/**
 * VoiceDictation WebSocket Bridge Server
 * 
 * Runs on Windows. Relays messages from Android clients to Chrome extension clients.
 * 
 * Protocol:
 * - Android connects, sends: {"type":"text","payload":"recognized words"}
 * - Server broadcasts to all Chrome extension clients
 * - Chrome extension connects as "receiver" type
 */

const WebSocket = require('ws');

const PORT = process.env.PORT || 8765;
const HOST = process.env.HOST || '0.0.0.0'; // Listen on all interfaces for LAN

const wss = new WebSocket.Server({ host: HOST, port: PORT });

const androidClients = new Set();
const chromeClients = new Set();

console.log(`[VoiceDictation] WS Server starting on ws://${HOST}:${PORT}`);

wss.on('listening', () => {
  console.log(`[VoiceDictation] Listening on ws://${HOST}:${PORT}`);
  console.log(`[VoiceDictation] Android should connect to ws://<WINDOWS_IP>:${PORT}/dictation`);
  console.log(`[VoiceDictation] Chrome extension connects to ws://localhost:${PORT}`);
});

wss.on('connection', (ws, req) => {
  const clientIp = req.socket.remoteAddress;
  console.log(`[VoiceDictation] New connection from ${clientIp}`);
  
  let clientType = null; // 'android' or 'chrome'
  
  ws.on('message', (data) => {
    try {
      const msg = JSON.parse(data.toString());
      
      // Identify client type on first message
      if (!clientType) {
        if (msg.clientType === 'android' || msg.type === 'text') {
          clientType = 'android';
          androidClients.add(ws);
          console.log(`[VoiceDictation] Registered Android client (${androidClients.size} total)`);
        } else if (msg.clientType === 'chrome') {
          clientType = 'chrome';
          chromeClients.add(ws);
          console.log(`[VoiceDictation] Registered Chrome client (${chromeClients.size} total)`);
        }
      }
      
      // Handle text messages from Android
      if (clientType === 'android' && msg.type === 'text' && msg.payload) {
        console.log(`[VoiceDictation] Relaying text: "${msg.payload}"`);
        broadcastToChrome(msg);
      }
      
    } catch (e) {
      console.error('[VoiceDictation] Parse error:', e.message);
    }
  });
  
  ws.on('close', () => {
    if (clientType === 'android') {
      androidClients.delete(ws);
      console.log(`[VoiceDictation] Android disconnected (${androidClients.size} remaining)`);
    } else if (clientType === 'chrome') {
      chromeClients.delete(ws);
      console.log(`[VoiceDictation] Chrome disconnected (${chromeClients.size} remaining)`);
    } else {
      console.log('[VoiceDictation] Unknown client disconnected');
    }
  });
  
  ws.on('error', (err) => {
    console.error('[VoiceDictation] Client error:', err.message);
  });
});

function broadcastToChrome(message) {
  const payload = JSON.stringify(message);
  chromeClients.forEach(client => {
    if (client.readyState === WebSocket.OPEN) {
      client.send(payload);
    }
  });
}

// Graceful shutdown
process.on('SIGINT', () => {
  console.log('\n[VoiceDictation] Shutting down...');
  wss.close(() => {
    console.log('[VoiceDictation] Server closed');
    process.exit(0);
  });
});