// vertebares-terminal.js - Terminal WebView JavaScript
// Works with static HTML in terminal.html

(function() {
    'use strict';

    // Terminal state
    const terminal = {
        sessionId: null,
        isConnected: false,
        isFocused: false,
        buffer: [],
        maxBufferSize: 10000,
        cursorPosition: { row: 0, col: 0 },
        scrollback: 0,
        theme: 'dark',
    };

    // Message types
    const MessageType = {
        HEARTBEAT: 'heartbeat',
        TERMINAL_OUTPUT: 'terminal_output',
        TERMINAL_INPUT: 'terminal_input',
        RESIZE: 'resize',
        FOCUS_CHANGE: 'focus_change',
        SESSION_STATUS: 'session_status',
        COMMAND: 'command',
        FILE_TRANSFER: 'file_transfer',
        SETTINGS: 'settings',
        ERROR: 'error',
    };

    // DOM elements (cached)
    let screenEl = null;
    let inputEl = null;
    let toolbarEl = null;

    // Initialize terminal
    function initTerminal(sessionId) {
        terminal.sessionId = sessionId;
        cacheElements();
        setupEventListeners();
        setupNativeBridge();
        notifyNative('ready', { sessionId });
    }

    // Cache DOM elements
    function cacheElements() {
        screenEl = document.getElementById('terminal-screen');
        inputEl = document.getElementById('terminal-input');
        toolbarEl = document.getElementById('terminal-toolbar');
    }

    // Setup event listeners
    function setupEventListeners() {
        if (!inputEl) return;

        // Input handling
        inputEl.addEventListener('keydown', handleInputKeydown);
        inputEl.addEventListener('input', handleInputChange);
        inputEl.focus();

        // Toolbar buttons
        document.getElementById('btn-clear')?.addEventListener('click', () => clearTerminal());
        document.getElementById('btn-copy')?.addEventListener('click', () => copySelection());
        document.getElementById('btn-paste')?.addEventListener('click', () => pasteFromClipboard());
        document.getElementById('btn-send-ctrl-c')?.addEventListener('click', () => sendControlChar('c'));
        document.getElementById('btn-send-ctrl-d')?.addEventListener('click', () => sendControlChar('d'));
        document.getElementById('font-size')?.addEventListener('change', (e) => setFontSize(e.target.value));

        // Handle visibility change for focus
        document.addEventListener('visibilitychange', () => {
            terminal.isFocused = !document.hidden;
            notifyNative(MessageType.FOCUS_CHANGE, { focused: terminal.isFocused });
        });

        window.addEventListener('focus', () => {
            terminal.isFocused = true;
            notifyNative(MessageType.FOCUS_CHANGE, { focused: true });
        });

        window.addEventListener('blur', () => {
            terminal.isFocused = false;
            notifyNative(MessageType.FOCUS_CHANGE, { focused: false });
        });

        // Handle resize
        window.addEventListener('resize', debounce(() => {
            notifyNative(MessageType.RESIZE, {
                width: window.innerWidth,
                height: window.innerHeight,
            });
        }, 100));
    }

    function handleInputKeydown(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            const value = e.target.value;
            e.target.value = '';
            sendInput(value + '\n');
            addToBuffer(`$ ${value}`, 'command');
        } else if (e.key === 'Tab') {
            e.preventDefault();
        } else if (e.ctrlKey && e.key === 'c') {
            sendControlChar('c');
        } else if (e.ctrlKey && e.key === 'd') {
            sendControlChar('d');
        }
    }

    function handleInputChange(e) {
        // Real-time input preview if needed
    }

    function sendInput(text) {
        notifyNative(MessageType.TERMINAL_INPUT, { data: text });
    }

    function sendControlChar(char) {
        const ctrlCodes = { 'c': '\x03', 'd': '\x04', 'z': '\x1a' };
        sendInput(ctrlCodes[char] || '');
    }

    // Terminal output handling
    function writeOutput(data) {
        if (!screenEl) return;

        const processed = processAnsiCodes(data);
        const line = document.createElement('div');
        line.innerHTML = processed;
        screenEl.appendChild(line);

        // Maintain buffer limit
        while (screenEl.children.length > terminal.maxBufferSize) {
            screenEl.removeChild(screenEl.firstChild);
        }

        // Auto-scroll if at bottom
        if (terminal.scrollback === 0) {
            screenEl.scrollTop = screenEl.scrollHeight;
        }
    }

    function processAnsiCodes(text) {
        return text
            .replace(/&/g, '&')
            .replace(/</g, '<')
            .replace(/>/g, '>')
            .replace(/\x1b\[([0-9;]*)m/g, (match, codes) => {
                const classes = [];
                codes.split(';').forEach(code => {
                    switch(parseInt(code) || 0) {
                        case 0: classes.push('ansi-reset'); break;
                        case 1: classes.push('ansi-bold'); break;
                        case 4: classes.push('ansi-underline'); break;
                        case 31: classes.push('ansi-red'); break;
                        case 32: classes.push('ansi-green'); break;
                        case 33: classes.push('ansi-yellow'); break;
                        case 34: classes.push('ansi-blue'); break;
                        case 35: classes.push('ansi-magenta'); break;
                        case 36: classes.push('ansi-cyan'); break;
                        case 37: classes.push('ansi-white'); break;
                        case 90: classes.push('ansi-bright-black'); break;
                        case 91: classes.push('ansi-bright-red'); break;
                        case 92: classes.push('ansi-bright-green'); break;
                        case 93: classes.push('ansi-bright-yellow'); break;
                        case 94: classes.push('ansi-bright-blue'); break;
                        case 95: classes.push('ansi-bright-magenta'); break;
                        case 96: classes.push('ansi-bright-cyan'); break;
                        case 97: classes.push('ansi-bright-white'); break;
                    }
                });
                return classes.length ? `<span class="${classes.join(' ')}">` : '</span>';
            })
            .replace(/\x1b\[([0-9;]*)[A-H]/g, '') // Cursor movement
            .replace(/\n/g, '<br>');
    }

    function addToBuffer(text, type = 'output') {
        terminal.buffer.push({ text, type, timestamp: Date.now() });
        if (terminal.buffer.length > terminal.maxBufferSize) {
            terminal.buffer.shift();
        }
    }

    function clearTerminal() {
        const screen = document.getElementById('terminal-screen');
        if (screen) screen.innerHTML = '';
    }

    function copySelection() {
        const selection = window.getSelection();
        if (selection.rangeCount > 0) {
            navigator.clipboard.writeText(selection.toString());
        }
    }

    async function pasteFromClipboard() {
        try {
            const text = await navigator.clipboard.readText();
            sendInput(text);
        } catch (e) {
            console.warn('Paste failed:', e);
        }
    }

    function setFontSize(size) {
        const screen = document.getElementById('terminal-screen');
        if (screen) screen.style.fontSize = size + 'px';
    }

    // Native communication
    function notifyNative(type, payload) {
        if (window.VertebraeBridge) {
            window.VertebraeBridge.postMessage(JSON.stringify({ type, payload }));
        }
    }

    // Receive messages from native
    window.handleNativeMessage = function(message) {
        try {
            const { type, payload } = JSON.parse(message);
            switch (type) {
                case MessageType.TERMINAL_OUTPUT:
                    writeOutput(payload.data);
                    break;
                case MessageType.SESSION_STATUS:
                    terminal.isConnected = payload.connected;
                    updateConnectionIndicator(payload.connected);
                    break;
                case MessageType.SETTINGS:
                    applySettings(payload);
                    break;
                case MessageType.COMMAND:
                    executeCommand(payload);
                    break;
                case MessageType.HEARTBEAT:
                    // Respond to heartbeat
                    notifyNative(MessageType.HEARTBEAT, { timestamp: Date.now() });
                    break;
            }
        } catch (e) {
            console.error('Handle native message error:', e);
        }
    };

    function updateConnectionIndicator(connected) {
        const indicator = document.getElementById('connection-indicator');
        if (indicator) {
            indicator.style.background = connected ? '#3fb950' : '#f85149';
            indicator.title = connected ? 'Connected' : 'Disconnected';
        }
    }

    function applySettings(settings) {
        if (settings.fontSize) setFontSize(settings.fontSize);
        if (settings.theme) {
            terminal.theme = settings.theme;
            document.body.className = 'theme-' + settings.theme;
        }
    }

    function executeCommand(cmd) {
        // Execute local terminal commands
        switch (cmd.action) {
            case 'clear':
                clearTerminal();
                break;
            case 'resize':
                notifyNative(MessageType.RESIZE, { width: cmd.cols, height: cmd.rows });
                break;
        }
    }

    function debounce(fn, delay) {
        let timeoutId;
        return (...args) => {
            clearTimeout(timeoutId);
            timeoutId = setTimeout(() => fn(...args), delay);
        };
    }

    // Expose init function
    window.initTerminal = initTerminal;

    // Auto-init if sessionId in URL
    const urlParams = new URLSearchParams(window.location.search);
    const sessionId = urlParams.get('sessionId');
    if (sessionId) {
        document.addEventListener('DOMContentLoaded', () => initTerminal(sessionId));
    }
})();