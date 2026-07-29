package com.carrpod.vertebrae.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.carrpod.vertebrae.R;
import com.carrpod.vertebrae.comm.SessionCommunicator;
import com.carrpod.vertebrae.model.InterSessionMessage;
import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.model.SessionGroup;
import com.carrpod.vertebrae.service.FloatingWindowService;
import com.carrpod.vertebrae.storage.SessionStorageManager;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MainActivity extends Activity implements SessionCommunicator.MessageListener {

    private static final int OVERLAY_PERMISSION_REQUEST = 1001;
    private static final String TAG = "MainActivity";

    private SessionStorageManager storage;
    private SessionCommunicator communicator;
    private Set<String> expandedGroups = new HashSet<>();

    private ListView lvGroups;
    private ListView lvSessions;
    private View emptyState;
    private GroupsAdapter groupsAdapter;
    private SessionsAdapter sessionsAdapter;
    private String currentGroupFilter = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        storage = SessionStorageManager.getInstance();
        communicator = SessionCommunicator.getInstance();
        communicator.addListener(this);

        setupViews();
        checkOverlayPermission();
        loadData();
        communicator.connect();
    }

    private void setupViews() {
        // Toolbar
        android.widget.Toolbar toolbar = findViewById(R.id.toolbar);
        toolbar.setTitle(R.string.app_name);
        toolbar.setSubtitle("Kilo.ai Session Manager");
        setActionBar(toolbar);

        // Groups ListView
        lvGroups = findViewById(R.id.lv_groups);
        groupsAdapter = new GroupsAdapter();
        lvGroups.setAdapter(groupsAdapter);
        lvGroups.setOnItemClickListener(this::onGroupClick);
        lvGroups.setOnItemLongClickListener(this::onGroupLongClick);

        // Sessions ListView
        lvSessions = findViewById(R.id.lv_sessions);
        sessionsAdapter = new SessionsAdapter();
        lvSessions.setAdapter(sessionsAdapter);
        lvSessions.setOnItemClickListener(this::onSessionClick);
        lvSessions.setOnItemLongClickListener(this::onSessionLongClick);

        emptyState = findViewById(R.id.empty_state);

        // FAB
        findViewById(R.id.fab_add_session).setOnClickListener(v -> showNewSessionDialog());
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_new_group) {
            showNewGroupDialog();
            return true;
        } else if (id == R.id.action_import_session) {
            showImportSessionDialog();
            return true;
        } else if (id == R.id.action_export_session) {
            exportSessions();
            return true;
        } else if (id == R.id.action_settings) {
            showSettingsDialog();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    private void loadData() {
        List<SessionGroup> groups = storage.loadAllGroups();
        groupsAdapter.setGroups(groups);

        List<KilosSession> sessions;
        if (currentGroupFilter != null) {
            sessions = storage.loadSessionsByGroup(currentGroupFilter);
        } else {
            sessions = storage.loadAllSessions();
        }
        sessionsAdapter.setSessions(sessions);
        updateEmptyState(sessions.isEmpty());
    }

    private void updateEmptyState(boolean isEmpty) {
        if (emptyState != null) {
            emptyState.setVisibility(isEmpty ? View.VISIBLE : View.GONE);
        }
        lvSessions.setVisibility(isEmpty ? View.GONE : View.VISIBLE);
    }

    private void onGroupClick(AdapterView<?> parent, View view, int position, long id) {
        SessionGroup group = groupsAdapter.getItem(position);
        if (expandedGroups.contains(group.getId())) {
            expandedGroups.remove(group.getId());
        } else {
            expandedGroups.add(group.getId());
        }
        groupsAdapter.notifyDataSetChanged();
    }

    private boolean onGroupLongClick(AdapterView<?> parent, View view, int position, long id) {
        SessionGroup group = groupsAdapter.getItem(position);
        showGroupOptions(group);
        return true;
    }

    private void onSessionClick(AdapterView<?> parent, View view, int position, long id) {
        KilosSession session = sessionsAdapter.getItem(position);
        if (session != null) {
            openFloatingWindow(session);
        }
    }

    private boolean onSessionLongClick(AdapterView<?> parent, View view, int position, long id) {
        KilosSession session = sessionsAdapter.getItem(position);
        if (session != null) {
            showSessionOptions(session);
        }
        return true;
    }

    private void showNewSessionDialog() {
        final EditText input = new EditText(this);
        input.setHint(getString(R.string.dialog_new_session_hint));
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT);

        new AlertDialog.Builder(this)
                .setTitle(R.string.dialog_new_session_title)
                .setView(input)
                .setPositiveButton(R.string.session_connect, (dialog, which) -> {
                    String sessionId = input.getText().toString().trim();
                    if (!TextUtils.isEmpty(sessionId)) {
                        createSession(sessionId);
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void createSession(String sessionId) {
        String groupId = currentGroupFilter != null ? currentGroupFilter : "default";
        String name = "Session " + (sessionId.length() > 8 ? sessionId.substring(sessionId.length() - 8) : sessionId);

        KilosSession session = new KilosSession(sessionId, groupId, name);
        storage.saveSession(session);
        loadData();

        // Auto-open floating window
        openFloatingWindow(session);
    }

    private void openFloatingWindow(KilosSession session) {
        if (!Settings.canDrawOverlays(this)) {
            requestOverlayPermission();
            return;
        }

        FloatingWindowService.createWindow(this, session.getId());
        Toast.makeText(this, "Opening floating window...", Toast.LENGTH_SHORT).show();
    }

    private void showSessionOptions(KilosSession session) {
        String[] options = {"Open Window", "Focus", "Disconnect", "Delete"};
        new AlertDialog.Builder(this)
                .setTitle(session.getDisplayName())
                .setItems(options, (dialog, which) -> {
                    switch (which) {
                        case 0: openFloatingWindow(session); break;
                        case 1: onSessionFocusChange(session, true); break;
                        case 2: disconnectSession(session); break;
                        case 3: deleteSession(session); break;
                    }
                })
                .show();
    }

    private void disconnectSession(KilosSession session) {
        FloatingWindowService.closeWindow(this, session.getId());
        KilosSession updated = session.copyWithStatus(KilosSession.SessionStatus.DISCONNECTED);
        storage.saveSession(updated);
        loadData();
    }

    private void deleteSession(KilosSession session) {
        FloatingWindowService.closeWindow(this, session.getId());
        storage.deleteSession(session.getId());
        loadData();
    }

    private void showGroupOptions(SessionGroup group) {
        String[] options = {"Rename", "Change Color", "Delete Group"};
        new AlertDialog.Builder(this)
                .setTitle(group.getName())
                .setItems(options, (dialog, which) -> {
                    switch (which) {
                        case 0: renameGroup(group); break;
                        case 1: changeGroupColor(group); break;
                        case 2: deleteGroup(group); break;
                    }
                })
                .show();
    }

    private void renameGroup(SessionGroup group) {
        final EditText input = new EditText(this);
        input.setText(group.getName());
        new AlertDialog.Builder(this)
                .setTitle("Rename Group")
                .setView(input)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                    SessionGroup updated = group.copyWithName(input.getText().toString());
                    storage.saveGroup(updated);
                    loadData();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void changeGroupColor(SessionGroup group) {
        int[] colors = {0xFF74B9FF, 0xFF00D4AA, 0xFFA29BFE, 0xFFFD79A8, 0xFFFF6B6B, 0xFFFDCB6E};
        String[] colorNames = {"Blue", "Teal", "Purple", "Pink", "Red", "Yellow"};

        new AlertDialog.Builder(this)
                .setTitle("Group Color")
                .setSingleChoiceItems(colorNames, 0, (dialog, which) -> {
                    SessionGroup updated = group.copyWithColor(colors[which]);
                    storage.saveGroup(updated);
                    loadData();
                    dialog.dismiss();
                })
                .show();
    }

    private void deleteGroup(SessionGroup group) {
        if ("default".equals(group.getId())) {
            toast("Cannot delete default group");
            return;
        }
        new AlertDialog.Builder(this)
                .setMessage("Delete group '" + group.getName() + "'? Sessions will move to Default.")
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                    storage.deleteGroup(group.getId());
                    loadData();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void showNewGroupDialog() {
        final EditText input = new EditText(this);
        input.setHint(getString(R.string.dialog_new_group_hint));
        new AlertDialog.Builder(this)
                .setTitle(R.string.dialog_new_group_title)
                .setView(input)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                    String name = input.getText().toString().trim();
                    if (!TextUtils.isEmpty(name)) {
                        SessionGroup group = new SessionGroup(name);
                        storage.saveGroup(group);
                        loadData();
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void showImportSessionDialog() {
        toast("Import not yet implemented");
    }

    private void exportSessions() {
        toast("Export not yet implemented");
    }

    private void showSettingsDialog() {
        toast("Settings not yet implemented");
    }

    private void checkOverlayPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !Settings.canDrawOverlays(this)) {
            toast(getString(R.string.toast_overlay_permission));
        }
    }

    private void requestOverlayPermission() {
        Intent intent = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                android.net.Uri.parse("package:" + getPackageName()));
        startActivityForResult(intent, OVERLAY_PERMISSION_REQUEST);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == OVERLAY_PERMISSION_REQUEST) {
            if (Settings.canDrawOverlays(this)) {
                toast("Overlay permission granted");
            }
        }
    }

    private void toast(String msg) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        communicator.removeListener(this);
    }

    // SessionCommunicator.MessageListener
    @Override
    public void onMessage(InterSessionMessage message) {
        // Handle inter-session messages
    }

    @Override
    public void onConnected() {
        runOnUiThread(() -> toast("Inter-session comms connected"));
    }

    @Override
    public void onDisconnected() {
        runOnUiThread(() -> toast("Inter-session comms disconnected"));
    }

    @Override
    public void onError(String error) {
        runOnUiThread(() -> Log.e(TAG, "Comm error: " + error));
    }

    private void onSessionFocusChange(KilosSession session, boolean focused) {
        KilosSession updated = session.copyWithFocused(focused);
        storage.saveSession(updated);
        communicator.sendFocusChange(session.getGroupId(), session.getId(), focused);
    }

    // Adapters
    private class GroupsAdapter extends ArrayAdapter<SessionGroup> {
        GroupsAdapter() {
            super(MainActivity.this, 0, new ArrayList<>());
        }

        void setGroups(List<SessionGroup> groups) {
            clear();
            addAll(groups);
            notifyDataSetChanged();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            SessionGroup group = getItem(position);
            boolean isExpanded = expandedGroups.contains(group.getId());

            if (convertView == null) {
                convertView = LayoutInflater.from(getContext()).inflate(R.layout.item_group_chip, parent, false);
            }

            TextView tvName = convertView.findViewById(R.id.tv_group_name);
            View indicator = convertView.findViewById(R.id.group_indicator);

            tvName.setText(group.getName());
            tvName.setTextColor(group.getColor());
            indicator.setBackgroundColor(group.getColor());

            return convertView;
        }
    }

    private class SessionsAdapter extends ArrayAdapter<KilosSession> {
        SessionsAdapter() {
            super(MainActivity.this, 0, new ArrayList<>());
        }

        void setSessions(List<KilosSession> sessions) {
            clear();
            addAll(sessions);
            notifyDataSetChanged();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            KilosSession session = getItem(position);

            if (convertView == null) {
                convertView = LayoutInflater.from(getContext()).inflate(R.layout.item_session, parent, false);
            }

            TextView tvName = convertView.findViewById(R.id.tv_session_name);
            TextView tvSessionId = convertView.findViewById(R.id.tv_session_id);
            TextView tvGroup = convertView.findViewById(R.id.tv_group_name);
            View statusIndicator = convertView.findViewById(R.id.status_indicator);
            android.widget.ImageButton btnFocus = convertView.findViewById(R.id.btn_focus);

            tvName.setText(session.getDisplayName());
            String shortId = session.getSessionId();
            if (shortId.length() > 8) shortId = shortId.substring(0, 8);
            tvSessionId.setText("ses_" + shortId);
            tvGroup.setText(session.getGroupId());

            int statusColor;
            switch (session.getStatus()) {
                case CONNECTED:
                case HEARTBEAT_ACTIVE:
                    statusColor = 0xFF3FB950; break;
                case CONNECTING:
                case RECONNECTING:
                    statusColor = 0xFFD29922; break;
                case ERROR:
                case HEARTBEAT_FAILED:
                    statusColor = 0xFFF85149; break;
                default:
                    statusColor = 0xFF8B949E;
            }
            statusIndicator.setBackgroundColor(statusColor);

            btnFocus.setImageResource(session.isFocused() ? android.R.drawable.star_on : android.R.drawable.star_off);
            btnFocus.setOnClickListener(v -> onSessionFocusChange(session, !session.isFocused()));

            return convertView;
        }
    }
}