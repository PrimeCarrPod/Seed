// VoiceDictation Chrome Extension - Popup Script
document.addEventListener('DOMContentLoaded', () => {
  const statusEl = document.getElementById('status');
  const reconnectBtn = document.getElementById('reconnectBtn');
  
  function updateStatus(connected) {
    statusEl.textContent = connected ? 'Connected' : 'Disconnected';
    statusEl.className = 'status ' + (connected ? 'connected' : 'disconnected');
    reconnectBtn.disabled = connected;
  }
  
  // Get initial status
  chrome.runtime.sendMessage({type: 'get_status'}, (response) => {
    if (response) updateStatus(response.connected);
  });
  
  // Listen for status updates
  chrome.runtime.onMessage.addListener((message) => {
    if (message.type === 'ws_status') {
      updateStatus(message.connected);
    }
  });
  
  reconnectBtn.addEventListener('click', () => {
    chrome.runtime.sendMessage({type: 'reconnect'});
  });
});