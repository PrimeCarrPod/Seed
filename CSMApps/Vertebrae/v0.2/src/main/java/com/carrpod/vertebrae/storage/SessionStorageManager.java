package com.carrpod.vertebrae.storage;

import android.content.Context;
import android.util.Log;

import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.model.SessionGroup;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class SessionStorageManager {

    private static final String TAG = "SessionStorageManager";
    private static SessionStorageManager instance;
    private final Context context;
    private final Map<String, KilosSession> sessionsCache = new ConcurrentHashMap<>();
    private final Map<String, SessionGroup> groupsCache = new ConcurrentHashMap<>();

    private SessionStorageManager(Context context) {
        this.context = context.getApplicationContext();
        loadCache();
    }

    public static synchronized void initialize(Context context) {
        if (instance == null) {
            instance = new SessionStorageManager(context);
        }
    }

    public static SessionStorageManager getInstance() {
        if (instance == null) {
            throw new IllegalStateException("SessionStorageManager not initialized");
        }
        return instance;
    }

    private void loadCache() {
        // Ensure default group exists
        if (!groupsCache.containsKey("default")) {
            SessionGroup defaultGroup = new SessionGroup("default", "Default Group", 0xFF74B9FF);
            groupsCache.put("default", defaultGroup);
        }
    }

    public void saveSession(KilosSession session) {
        sessionsCache.put(session.getId(), session);
    }

    public KilosSession loadSession(String id) {
        return sessionsCache.get(id);
    }

    public List<KilosSession> loadAllSessions() {
        return new ArrayList<>(sessionsCache.values());
    }

    public List<KilosSession> loadSessionsByGroup(String groupId) {
        List<KilosSession> result = new ArrayList<>();
        for (KilosSession session : sessionsCache.values()) {
            if (groupId.equals(session.getGroupId())) {
                result.add(session);
            }
        }
        return result;
    }

    public void deleteSession(String id) {
        sessionsCache.remove(id);
    }

    public void saveGroup(SessionGroup group) {
        groupsCache.put(group.getId(), group);
    }

    public SessionGroup loadGroup(String id) {
        return groupsCache.get(id);
    }

    public List<SessionGroup> loadAllGroups() {
        return new ArrayList<>(groupsCache.values());
    }

    public void deleteGroup(String id) {
        if (!"default".equals(id)) {
            groupsCache.remove(id);
            // Move sessions to default group
            for (KilosSession session : sessionsCache.values()) {
                if (id.equals(session.getGroupId())) {
                    KilosSession updated = session.copyWithGroupId("default");
                    sessionsCache.put(session.getId(), updated);
                }
            }
        }
    }

    public File getSessionStorageDir(String sessionId) {
        File dir = new File(context.getExternalFilesDir(null), "Vertebrae/Sessions/session_" + sessionId);
        dir.mkdirs();
        return dir;
    }

    public File getGroupStorageDir(String groupId) {
        File dir = new File(context.getExternalFilesDir(null), "Vertebrae/Sessions/group_" + groupId);
        dir.mkdirs();
        return dir;
    }
}