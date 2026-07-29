package com.carrpod.vertebrae.ui;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

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

public class MainActivity extends AppCompatActivity implements
        SessionCommunicator.MessageListener {

    private static final int OVERLAY_PERMISSION_REQUEST = 1001;
    private static final String TAG = "MainActivity";

    private SessionStorageManager storage;
    private SessionCommunicator communicator;
    private Set<String> expandedGroups = new HashSet<>();

    private RecyclerView rvGroups;
    private RecyclerView rvSessions;
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

        setupToolbar();
        setupRecyclerViews();
        setupFab();
        checkOverlayPermission();
        loadData();
        communicator.connect();
    }

    private void setupToolbar() {
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayShowTitleEnabled(true);
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
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

    private void setupRecyclerViews() {
        rvGroups = findViewById(R.id.rv_groups);
        rvGroups.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false));
        groupsAdapter = new GroupsAdapter(this::onGroupClick, this::onGroupLongClick, expandedGroups);
        rvGroups.setAdapter(groupsAdapter);

        rvSessions = findViewById(R.id.rv_sessions);
        rvSessions.setLayoutManager(new LinearLayoutManager(this));
        sessionsAdapter = new SessionsAdapter(
                this::onSessionClick,
                this::onSessionLongClick,
                this::onSessionFocusChange
        );
        rvSessions.setAdapter(sessionsAdapter);

        emptyState = findViewById(R.id.empty_state);
    }

    private void setupFab() {
        findViewById(R.id.fab_add_session).setOnClickListener(v -> showNewSessionDialog());
    }

    private void loadData() {
        List<SessionGroup> groups = storage.loadAllGroups();
        groupsAdapter.submitList(groups);

        List<KilosSession> sessions;
        if (currentGroupFilter != null) {
            sessions = storage.loadSessionsByGroup(currentGroupFilter);
        } else {
            sessions = storage.loadAllSessions();
        }
        sessionsAdapter.submitList(sessions);
        updateEmptyState(sessions.isEmpty());
    }

    private void updateEmptyState(boolean isEmpty) {
        if (emptyState != null) {
            emptyState.setVisibility(isEmpty ? View.VISIBLE : View.GONE);
        }
        rvSessions.setVisibility(isEmpty ? View.GONE : View.VISIBLE);
    }

    private void onGroupClick(String groupId) {
        if (expandedGroups.contains(groupId)) {
            expandedGroups.remove(groupId);
        } else {
            expandedGroups.add(groupId);
        }
        groupsAdapter.notifyDataSetChanged();
    }

    private void onGroupLongClick(SessionGroup group) {
        showGroupOptions(group);
    }

    private void onSessionClick(KilosSession session) {
        openFloatingWindow(session);
    }

    private void onSessionLongClick(KilosSession session) {
        showSessionOptions(session);
    }

    private void onSessionFocusChange(KilosSession session, boolean focused) {
        KilosSession updated = session.copyWith(
                null, focused, null, null, null, null, null, null, null, null
        );
        storage.saveSession(updated);
        // Notify other windows
        communicator.sendFocusChange(session.getGroupId(), session.getId(), focused);
    }

    private void showNewSessionDialog() {
        EditText input = new EditText(this);
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
        KilosSession updated = session.copyWith(
                KilosSession.SessionStatus.DISCONNECTED, null, null, null, null, null, null, null, null, null
        );
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
        EditText input = new EditText(this);
        input.setText(group.getName());
        new AlertDialog.Builder(this)
                .setTitle("Rename Group")
                .setView(input)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                    SessionGroup updated = group.copyWith(
                            input.getText().toString(), null, null, null, null, null, null
                    );
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
                    SessionGroup updated = group.copyWith(null, null, colors[which], null, null, null, null);
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
        EditText input = new EditText(this);
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
        // TODO: Implement session import from file
        toast("Import not yet implemented");
    }

    private void exportSessions() {
        // TODO: Implement session export to file
        toast("Export not yet implemented");
    }

    private void showSettingsDialog() {
        // TODO: Implement settings
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

    // Adapters
    private static class GroupsAdapter extends RecyclerView.Adapter<GroupsAdapter.ViewHolder> {
        private final java.util.function.Consumer<String> onClick;
        private final java.util.function.Consumer<SessionGroup> onLongClick;
        private final Set<String> expandedGroups;
        private List<SessionGroup> groups = new ArrayList<>();

        GroupsAdapter(java.util.function.Consumer<String> onClick,
                      java.util.function.Consumer<SessionGroup> onLongClick,
                      Set<String> expandedGroups) {
            this.onClick = onClick;
            this.onLongClick = onLongClick;
            this.expandedGroups = expandedGroups;
        }

        void submitList(List<SessionGroup> newGroups) {
            groups.clear();
            groups.addAll(newGroups);
            notifyDataSetChanged();
        }

        @NonNull
        @Override
        public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            View view = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.item_group_chip, parent, false);
            return new ViewHolder(view);
        }

        @Override
        public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
            SessionGroup group = groups.get(position);
            boolean isExpanded = expandedGroups.contains(group.getId());

            holder.tvName.setText(group.getName());
            holder.tvName.setTextColor(group.getColor());
            holder.indicator.setBackgroundColor(group.getColor());

            holder.itemView.setOnClickListener(v -> onClick.accept(group.getId()));
            holder.itemView.setOnLongClickListener(v -> { onLongClick.accept(group); return true; });
        }

        @Override
        public int getItemCount() {
            return groups.size();
        }

        static class ViewHolder extends RecyclerView.ViewHolder {
            TextView tvName;
            View indicator;

            ViewHolder(View itemView) {
                super(itemView);
                tvName = itemView.findViewById(R.id.tv_group_name);
                indicator = itemView.findViewById(R.id.group_indicator);
            }
        }
    }

    private static class SessionsAdapter extends RecyclerView.Adapter<SessionsAdapter.ViewHolder> {
        private final java.util.function.Consumer<KilosSession> onClick;
        private final java.util.function.Consumer<KilosSession> onLongClick;
        private final java.util.function.BiConsumer<KilosSession, Boolean> onFocusChange;
        private List<KilosSession> sessions = new ArrayList<>();

        SessionsAdapter(java.util.function.Consumer<KilosSession> onClick,
                        java.util.function.Consumer<KilosSession> onLongClick,
                        java.util.function.BiConsumer<KilosSession, Boolean> onFocusChange) {
            this.onClick = onClick;
            this.onLongClick = onLongClick;
            this.onFocusChange = onFocusChange;
        }

        void submitList(List<KilosSession> newSessions) {
            sessions.clear();
            sessions.addAll(newSessions);
            notifyDataSetChanged();
        }

        @NonNull
        @Override
        public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            View view = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.item_session, parent, false);
            return new ViewHolder(view);
        }

        @Override
        public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
            KilosSession session = sessions.get(position);

            holder.tvName.setText(session.getDisplayName());
            holder.tvSessionId.setText("ses_" + (session.getSessionId().length() > 8 ?
                    session.getSessionId().substring(0, 8) : session.getSessionId()));
            holder.tvGroup.setText(session.getGroupId());
            holder.tvStatus.setText(session.getStatus().name());

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
            holder.statusIndicator.setBackgroundColor(statusColor);

            holder.btnFocus.setImageResource(
                    session.isFocused() ? android.R.drawable.star_on : android.R.drawable.star_off
            );
            holder.btnFocus.setOnClickListener(v ->
                    onFocusChange.accept(session, !session.isFocused())
            );

            holder.itemView.setOnClickListener(v -> onClick.accept(session));
            holder.itemView.setOnLongClickListener(v -> { onLongClick.accept(session); return true; });
        }

        @Override
        public int getItemCount() {
            return sessions.size();
        }

        static class ViewHolder extends RecyclerView.ViewHolder {
            TextView tvName;
            TextView tvSessionId;
            TextView tvGroup;
            TextView tvStatus;
            ImageButton btnFocus;
            View statusIndicator;

            ViewHolder(View itemView) {
                super(itemView);
                tvName = itemView.findViewById(R.id.tv_session_name);
                tvSessionId = itemView.findViewById(R.id.tv_session_id);
                tvGroup = itemView.findViewById(R.id.tv_group_name);
                tvStatus = itemView.findViewById(R.id.tv_session_status);
                btnFocus = itemView.findViewById(R.id.btn_focus);
                statusIndicator = itemView.findViewById(R.id.status_indicator);
            }
        }
    }
}