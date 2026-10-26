// VoiceDictation Chrome Extension - Content Script
// Inserts received text into the currently focused editable element

let focusedElement = null;

function getFocusedEditable() {
  const active = document.activeElement;
  if (!active) return null;
  
  // Check if it's an editable element
  const tag = active.tagName.toLowerCase();
  const isInput = tag === 'input' && ['text', 'search', 'email', 'url', 'tel', 'password', ''].includes(active.type);
  const isTextarea = tag === 'textarea';
  const isContentEditable = active.isContentEditable;
  
  if (isInput || isTextarea || isContentEditable) {
    return active;
  }
  return null;
}

function insertText(element, text) {
  if (!element) return false;
  
  const tag = element.tagName.toLowerCase();
  
  if (element.isContentEditable) {
    // For contenteditable divs
    const selection = window.getSelection();
    if (selection.rangeCount > 0) {
      const range = selection.getRangeAt(0);
      range.deleteContents();
      range.insertNode(document.createTextNode(text));
      range.collapse(false);
      selection.removeAllRanges();
      selection.addRange(range);
    } else {
      element.textContent += text;
    }
    return true;
  }
  
  if (tag === 'input' || tag === 'textarea') {
    const start = element.selectionStart;
    const end = element.selectionEnd;
    const value = element.value;
    
    element.value = value.slice(0, start) + text + value.slice(end);
    element.selectionStart = element.selectionEnd = start + text.length;
    
    // Trigger input event for React/Vue/etc.
    element.dispatchEvent(new Event('input', {bubbles: true}));
    element.dispatchEvent(new Event('change', {bubbles: true}));
    return true;
  }
  
  return false;
}

// Track focused element
document.addEventListener('focusin', (e) => {
  focusedElement = getFocusedEditable();
}, true);

document.addEventListener('focusout', () => {
  focusedElement = null;
}, true);

// Listen for messages from background
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.type === 'insert_text' && message.text) {
    const target = focusedElement || getFocusedEditable();
    if (target) {
      const success = insertText(target, message.text);
      sendResponse({success});
    } else {
      sendResponse({success: false, reason: 'No focused editable element'});
    }
  }
  return true; // Async response
});

// Notify background we're ready
chrome.runtime.sendMessage({type: 'content_ready'});