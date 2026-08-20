/**
 * Vertebrae Sidebar - Session & Group Management UI
 * Communicates with background script via runtime messaging
 */

(function() {
    'use strict';

    // State
    let sessions = [];
    let groups = [];
    let selectedGroupId = 'default';
    let selectedColor = '#74B9FF';

    // DOM Elements
    const elements = {
        groupsList: document.getElementById('groups-list'),
        sessionsList: document.getElementById('sessions-list'),
        groupCount: document.getElementById('group-count'),
        emptyState: document.getElementById('empty-state'),
        connectionStatus: document.getElementById('connection-status'),
        sessionCount: document.getElementById('session-count'),
        version: document.getElementById('version'),
        
        // Modals
        newSessionModal: document.getElementById('new-session-modal'),
        newGroupModal: document.getElementById('new-group-modal'),
        newSessionForm: document.getElementById('new-session-form'),
        newGroupForm: document.getElementById('new-group-form'),
        sessionIdInput: document.getElementById('session-id'),
        sessionNameInput: document.getElementById('session-name'),
        sessionGroupSelect: document.getElementById('session-group'),
        groupNameInput: document.getElementById('group-name'),
        groupColorInput: document.getElementById('group-color'),
        colorPicker: document.getElementById('group-color-picker'),
        
        // Buttons
        btnNewSession: document.getElementById('btn-new-session'),
        btnNewGroup: document.getElementById('btn-new-group'),
        btnImport: document.getElementById('btn-import'),
        btnExport: document.getElementById('btn-export'),
        btnSettings: document.getElementById('btn-settings'),
        emptyNewSession: document.getElementById('empty-new-session'),
        
        // Modal buttons
        cancelNewSession: document.getElementById('cancel-new-session'),
        cancelNewGroup: document.getElementById('cancel-new-group'),
        
        // Color picker
        colorPickerContainer: document.getElementById('group-color-picker'),
        groupColorInput: document.getElementById('group-color')
    };

    // Initialize
    function init() {
        bindEvents();
        loadData();
        setupMessageListener();
        updateVersion();
    }

    function bindEvents() {
        // Modal triggers
        elements.btnNewSession.addEventListener('click', () => openModal(elements.newSessionModal));
        elements.btnNewGroup.addEventListener('click', () => openModal(elements.newGroupModal));
        elements.emptyNewSession.addEventListener('click', () => openModal(elements.newSessionModal));
        
        // Modal close buttons
        elements.cancelNewSession.addEventListener('click', () => closeModal(elements.newSessionModal));
        elements.cancelNewGroup.addEventListener('click', () => closeModal(elements.newGroupModal));
        
        // Form submissions
        elements.newSessionForm.addEventListener('submit', handleNewSession);
        elements.newGroupForm.addEventListener('submit', handleNewGroup);
        
        // Color picker
        document.querySelectorAll('.color-option').forEach(btn => {
            btn.addEventListener('click', () => selectColor(btn.dataset.color));
        });
        
        // Import/Export
        document.getElementById('btn-import').addEventListener('click', handleImport);
        document.getElementById('btn-export').addEventListener('click', handleExport);
        document.getElementById('btn-settings').addEventListener('click', handleSettings);
        
        // Close modals on backdrop click
        [elements.newSessionModal, elements.newGroupModal].forEach(modal => {
            modal.addEventListener('click', (e) => {
                if (e.target === modal) closeModal(modal);
            });
        });
        
        // Close on Escape
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                if (elements.newSessionModal.open) closeModal(elements.newSessionModal);
                if (elements.newGroupModal.open) closeModal(elements.newGroupModal);
            }
        });
    }

    function setupMessageListener() {
        browser.runtime.onMessage.addListener((message) => {
            switch (message.type) {
                case 'sessions_list':
                    renderSessions(message.payload);
                    break;
                case 'groups_list':
                    renderGroups(message.payload);
                    break;
                case 'session_status':
                    updateSessionStatus(message.payload.sessionId, message.payload.status);
                    break;
                case 'session_updated':
                    updateSessionInList(message.payload.sessionId, message.payload.updates);
                    break;
                case 'group_created':
                case 'group_updated':
                    loadGroups();
                    break;
                case 'group_deleted':
                    loadGroups();
                    break;
                case 'ws_message':
                    updateSessionActivity(message.payload.sessionId);
                    break;
                case 'session_status':
                    updateSessionStatus(message.payload.sessionId, message.payload.status);
                    break;
                case 'session_updated':
                    updateSessionInList(message.payload.sessionId, message.payload.updates);
                    break;
            }
        });
    }

    // Data loading
    async function loadData() {
        try {
            await Promise.all([
                browser.runtime.sendMessage({ type: 'get_sessions' }),
                browser.runtime.sendMessage({ type: 'get_groups' })
            ]).then(([sessionsData, groupsData]) => {
                if (sessionsData) renderSessions(sessionsData);
                if (groupsData) renderGroups(groupsData);
            });
        } catch (error) {
            console.error('[Sidebar] Failed to load data:', error);
        }
    }

    // Rendering
    function renderGroups(groupsData) {
        groups = groupsData || [];
        const container = document.getElementById('groups-list');
        if (!container) return;
        
        container.innerHTML = groups.map(group => {
            const isSelected = group.id === selectedGroupId;
            return `
                <div class="group-chip ${group.id === 'default' ? 'default' : ''} ${group.id === selectedGroupId ? 'selected' : ''}" 
                     data-group-id="${group.id}" 
                     role="listitem"
                     aria-selected="${group.id === selectedGroupId}"
                     tabindex="0">
                    <span class="group-indicator" style="background:${group.color}"></span>
                    <span class="group-name">${escapeHtml(group.name)}</span>
                    <span class="group-session-count">${group.sessionIds.length}</span>
                    ${group.id !== 'default' ? `
                        <button class="group-action" data-action="edit" aria-label="Edit group" title="Edit">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5a2.121 2.121 0 0 1 3 3L22 10.5"/>
                            </svg>
                        </button>
                        <button class="group-action danger" data-action="delete" aria-label="Delete group" title="Delete">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="3 6 5 6 21 6"/>
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/>
                            </svg>
                        </button>
                    ` : ''}
                </div>
            `;
        }).join('');
        
        document.getElementById('group-count').textContent = groups.length;
        
        // Bind events
        container.querySelectorAll('.group-chip').forEach(chip => {
            chip.addEventListener('click', (e) => {
                if (!e.target.closest('.group-action')) {
                    selectGroup(chip.dataset.groupId);
                }
            });
            chip.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    selectGroup(chip.dataset.groupId);
                }
            });
        });
        
        container.querySelectorAll('.group-action[data-action="edit"]').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.stopPropagation();
                const groupId = btn.closest('.group-chip').dataset.groupId;
                editGroup(groupId);
            });
        });
        
        container.querySelectorAll('.group-action[data-action="delete"]').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.stopPropagation();
                const groupId = btn.closest('.group-chip').dataset.groupId;
                deleteGroup(groupId);
            });
        });
    }

    function renderSessions(sessionsData) {
        sessions = sessionsData || [];
        const container = document.getElementById('sessions-list');
        const emptyState = document.getElementById('empty-state');
        
        // Filter by selected group
        const filtered = sessions.filter(s => s.groupId === selectedGroupId);
        
        if (filtered.length === 0) {
            document.getElementById('sessions-list').innerHTML = '';
            document.getElementById('empty-state').hidden = false;
        } else {
            document.getElementById('empty-state').hidden = true;
            document.getElementById('sessions-list').innerHTML = filtered.map(session => `
                <div class="session-card ${session.status === 'connected' || session.status === 'heartbeat_active' ? 'connected' : ''}" 
                     data-session-id="${session.id}"
                     role="listitem"
                     tabindex="0">
                    <div class="session-header">
                        <div class="session-info">
                            <span class="status-indicator ${getStatusClass(session.status)}"></span>
                            <span class="session-name">${escapeHtml(session.displayName)}</span>
                            <span class="session-id">${session.sessionId}</span>
                            <span class="session-group">${escapeHtml(getGroupName(session.groupId))}</span>
                        </div>
                        <span class="session-status ${getStatusClass(session.status)}">${formatStatus(session.status)}</span>
                    </div>
                    <div class="session-actions">
                        <button class="btn-icon ${session.isFocused ? 'active' : ''}" 
                                data-action="focus" 
                                aria-label="${session.isFocused ? 'Unfocus' : 'Focus'}"
                                title="${session.isFocused ? 'Unfocus' : 'Focus'}">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="${session.isFocused ? 'currentColor' : 'none'}" stroke="currentColor" stroke-width="2">
                                <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 9 8.26 12 2"/>
                            </svg>
                        </button>
                        <button class="btn-icon" data-action="open" aria-label="Open Terminal" title="Open Terminal">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M15 3h6a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-6a2 2 0 0 1-2-2v-6"/>
                                <polyline points="15 3 9 9 15 15"/>
                            </svg>
                        </button>
                        <button class="btn-icon danger" data-action="delete" aria-label="Delete Session" title="Delete">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="3 6 5 6 21 6"/>
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/>
                            </svg>
                        </button>
                    </div>
                </div>
            `).join('');
        
        bindSessionEvents();
        updateSessionCount();
    }

    function getStatusClass(status) {
        switch (status) {
            case 'connected':
            case 'heartbeat_active':
                return 'connected';
            case 'connecting':
            case 'reconnecting':
                return 'connecting';
            case 'error':
            case 'heartbeat_failed':
                return 'error';
            default:
                return 'disconnected';
        }
    }

    function formatStatus(status) {
        switch (status) {
            case 'heartbeat_active': return '● Active';
            case 'connected': return '● Connected';
            case 'connecting': return '◐ Connecting';
            case 'reconnecting': return '⟳ Reconnecting';
            case 'heartbeat_failed': return '✗ Heartbeat Failed';
            case 'error': return '✗ Error';
            default: return '○ Disconnected';
        }
    }

    function getGroupName(groupId) {
        const group = groups.find(g => g.id === groupId);
        return group ? group.name : groupId;
    }

    function updateSessionCount() {
        const count = sessions.length;
        const filtered = sessions.filter(s => s.groupId === selectedGroupId).length;
        document.getElementById('session-count').textContent = 
            sessions.length === filtered.length ? 
                `${count} session${count !== 1 ? 's' : ''}` : 
                `${filtered} of ${count} sessions`;
    }

    function updateSessionStatus(sessionId, status) {
        const card = document.querySelector(`.session-card[data-session-id="${sessionId}"]`);
        if (card) {
            card.classList.toggle('connected', status === 'connected' || status === 'heartbeat_active');
            const statusEl = card.querySelector('.session-status');
            if (statusEl) {
                statusEl.textContent = formatStatus(status);
                statusEl.className = `session-status ${getStatusClass(status)}`;
            }
        }
    }

    function updateSessionInList(sessionId, updates) {
        const card = document.querySelector(`.session-card[data-session-id="${sessionId}"]`);
        if (card && updates.displayName) {
            card.querySelector('.session-name').textContent = updates.displayName;
        }
        if (updates.groupId) {
            card.querySelector('.session-group').textContent = getGroupName(updates.groupId);
        }
    }

    function updateSessionActivity(sessionId) {
        const card = document.querySelector(`.session-card[data-session-id="${sessionId}"]`);
        if (card) {
            card.classList.add('activity');
            setTimeout(() => card.classList.remove('activity'), 500);
        }
    }

    function bindSessionEvents() {
        document.querySelectorAll('.session-card').forEach(card => {
            card.addEventListener('click', (e) => {
                if (!e.target.closest('.btn-icon')) {
                    // Could add click to select/focus
                }
            });
            
            card.querySelectorAll('.btn-icon[data-action="focus"]').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    const sessionId = btn.closest('.session-card').dataset.sessionId;
                    focusSession(sessionId);
                });
            });
            
            card.querySelectorAll('.btn-icon[data-action="open"]').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    const sessionId = btn.closest('.session-card').dataset.sessionId;
                    openSessionInTab(sessionId);
                });
            });
            
            card.querySelectorAll('.btn-icon[data-action="delete"]').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    const sessionId = btn.closest('.session-card').dataset.sessionId;
                    deleteSession(sessionId);
                });
            });
        });
    }

    // Actions
    function selectGroup(groupId) {
        selectedGroupId = groupId;
        document.querySelectorAll('.group-chip').forEach(chip => {
            chip.classList.toggle('selected', chip.dataset.groupId === groupId);
        });
        loadData(); // Re-filter sessions
    }

    async function createSession(sessionId, displayName, groupId) {
        const id = await browser.runtime.sendMessage({
            type: 'create_session',
            sessionId,
            displayName,
            groupId
        });
        if (id) {
            loadData();
        }
    }

    async function deleteSession(sessionId) {
        if (confirm('Delete this session?')) {
            await browser.runtime.sendMessage({ type: 'delete_session', sessionId });
            loadData();
        }
    }

    async function focusSession(sessionId) {
        await browser.runtime.sendMessage({
            type: 'focus_session',
            sessionId
        });
    }

    async function openSessionInTab(sessionId) {
        const session = sessions.find(s => s.id === sessionId);
        if (session) {
            browser.tabs.create({ url: session.url });
        }
    }

    // Group actions
    async function editGroup(groupId) {
        const group = groups.find(g => g.id === groupId);
        if (!group) return;
        
        document.getElementById('group-name').value = group.name;
        selectColor(group.color);
        document.getElementById('new-group-form').dataset.editId = groupId;
        document.querySelector('#new-group-modal h3').textContent = 'Edit Group';
        document.querySelector('#new-group-form button[type="submit"]').textContent = 'Save Changes';
        openModal(document.getElementById('new-group-modal'));
    }

    async function deleteGroup(groupId) {
        if (confirm('Delete this group? Sessions will move to Default.')) {
            await browser.runtime.sendMessage({ type: 'delete_group', groupId });
            loadData();
        }
    }

    async function handleNewSession(e) {
        e.preventDefault();
        const sessionId = document.getElementById('session-id').value.trim();
        const displayName = document.getElementById('session-name').value.trim();
        const groupId = document.getElementById('session-group').value;
        
        if (!sessionId) return;
        
        await browser.runtime.sendMessage({
            type: 'create_session',
            sessionId,
            displayName,
            groupId
        });
        
        closeModal(document.getElementById('new-session-modal'));
        document.getElementById('new-session-form').reset();
        loadData();
    }

    async function handleNewGroup(e) {
        e.preventDefault();
        const name = document.getElementById('group-name').value.trim();
        const color = document.getElementById('group-color').value;
        const editId = e.target.dataset.editId;
        
        if (!name) return;
        
        if (editId) {
            await browser.runtime.sendMessage({
                type: 'update_group',
                groupId: editId,
                updates: { name, color }
            });
        } else {
            await browser.runtime.sendMessage({
                type: 'create_group',
                name,
                color
            });
        }
        
        closeModal(document.getElementById('new-group-modal'));
        document.getElementById('new-group-form').reset();
        document.getElementById('new-group-form').dataset.editId = '';
        document.querySelector('#new-group-modal h3').textContent = 'New Group';
        document.querySelector('#new-group-form button[type="submit"]').textContent = 'Create Group';
        loadData();
    }

    // Modal management
    function openModal(modal) {
        modal.showModal();
        const input = modal.querySelector('input');
        if (input) setTimeout(() => input.focus(), 100);
    }

    function closeModal(modal) {
        modal.close();
        if (modal.id === 'new-group-modal') {
            document.getElementById('new-group-form').dataset.editId = '';
            document.querySelector('#new-group-modal h3').textContent = 'New Group';
            document.querySelector('#new-group-form button[type="submit"]').textContent = 'Create Group';
        }
    }

    function selectColor(color) {
        document.querySelectorAll('.color-option').forEach(btn => {
            btn.classList.toggle('selected', btn.dataset.color === color);
        });
        document.getElementById('group-color').value = color;
    }

    // Import/Export
    async function handleImport() {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = '.json';
        input.onchange = async (e) => {
            const file = e.target.files[0];
            if (!file) return;
            
            const text = await file.text();
            try {
                const data = JSON.parse(text);
                if (data.sessions) {
                    for (const session of data.sessions) {
                        await browser.runtime.sendMessage({
                            type: 'create_session',
                            sessionId: session.sessionId,
                            displayName: session.displayName,
                            groupId: session.groupId
                        });
                    }
                }
                if (data.groups) {
                    for (const group of data.groups) {
                        await browser.runtime.sendMessage({
                            type: 'create_group',
                            name: group.name,
                            color: group.color
                        });
                    }
                }
                loadData();
                alert('Import successful!');
            } catch (error) {
                alert('Import failed: ' + error.message);
            }
        };
        input.click();
    }

    async function handleExport() {
        try {
            const [sessionsData, groupsData] = await Promise.all([
                browser.runtime.sendMessage({ type: 'get_sessions' }),
                browser.runtime.sendMessage({ type: 'get_groups' })
            ]);
            
            const data = {
                version: '1.0',
                exportedAt: new Date().toISOString(),
                sessions: sessionsData || [],
                groups: groupsData || []
            };
            
            const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `vertebrae-export-${new Date().toISOString().split('T')[0]}.json`;
            a.click();
            URL.revokeObjectURL(url);
        } catch (error) {
            alert('Export failed: ' + error.message);
        }
    }

    function handleSettings() {
        alert('Settings panel coming soon!');
    }

    function updateVersion() {
        const manifest = browser.runtime.getManifest();
        document.getElementById('version').textContent = `v${manifest.version}`;
    }

    // Utility
    function escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    // Initialize
    document.addEventListener('DOMContentLoaded', init);
})();