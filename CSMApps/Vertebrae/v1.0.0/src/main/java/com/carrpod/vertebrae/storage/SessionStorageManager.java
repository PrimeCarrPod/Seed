package com.carrpod.vertebrae.storage;

import android.content.Context;
import android.util.Log;

import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.model.SessionGroup;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Type;
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
    private final Gson gson = new Gson();

    private final File baseDir;
    private final File sessionsFile;
    private final File groupsFile;

    private final Map<String, KilosSession> sessionsCache = new ConcurrentHashMap<>();
    private final Map<String, SessionGroup> groupsCache = new ConcurrentHashMap<>();

    private SessionStorageManager(Context context) {
        this.context = context.getApplicationContext();
        this.baseDir = new File(context.getExternalFilesDir(null), "Vertebrae/Sessions");
        this.sessionsFile = new File(baseDir, "sessions.json");
        this.groupsFile = new File(baseDir, "groups.json");
        baseDir.mkdirs();
        loadCache();
    }

    public static synchronized void initialize(Context context) {
        if (instance == null) {
            instance = new SessionStorageManager(context);
        }
    }

    public static SessionStorageManager getInstance() {
        if (instance == null) {
            throw new IllegalStateException("SessionStorageManager not initialized. Call initialize() first.");
        }
        return instance;
    }

    private void loadCache() {
        try {
            if (sessionsFile.exists()) {
                Type listType = new TypeToken<ArrayList<KilosSession>>() {}.getType();
                List<KilosSession> sessions = gson.fromJson(readFile(sessionsFile), listType);
                if (sessions != null) {
                    for (KilosSession session : sessions) {
                        sessionsCache.put(session.getId(), session);
                    }
                }
            }

            if (groupsFile.exists()) {
                Type listType = new TypeToken<ArrayList<SessionGroup>>() {}.getType();
                List<SessionGroup> groups = gson.fromJson(readFile(groupsFile), listType);
                if (groups != null) {
                    for (SessionGroup group : groups) {
                        groupsCache.put(group.getId(), group);
                    }
                }
            }

            // Ensure default group exists
            if (!groupsCache.containsKey("default")) {
                SessionGroup defaultGroup = new SessionGroup("default", "Default Group", 0xFF74B9FF);
                groupsCache.put("default", defaultGroup);
                saveGroups();
            }
        } catch (Exception e) {
            Log.e(TAG, "Error loading cache", e);
        }
    }

    private String readFile(File file) {
        try {
            FileInputStream fis = new FileInputStream(file);
            byte[] data = new byte[(int) file.length()];
            fis.read(data);
            fis.close();
            return new String(data, "UTF-8");
        } catch (Exception e) {
            Log.e(TAG, "Error reading file: " + file.getName(), e);
            return "";
        }
    }

    private void writeFile(File file, String content) {
        try {
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(content.getBytes("UTF-8"));
            fos.close();
        } catch (Exception e) {
            Log.e(TAG, "Error writing file: " + file.getName(), e);
        }
    }

    // Session methods
    public void saveSession(KilosSession session) {
        sessionsCache.put(session.getId(), session);
        saveSessions();
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
        saveSessions();
    }

    private void saveSessions() {
        try {
            String json = gson.toJson(new ArrayList<>(sessionsCache.values()));
            writeFile(sessionsFile, json);
        } catch (Exception e) {
            Log.e(TAG, "Error saving sessions", e);
        }
    }

    // Group methods
    public void saveGroup(SessionGroup group) {
        groupsCache.put(group.getId(), group);
        saveGroups();
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
                    KilosSession updated = session.copyWith(null, null, null, null, null, null, null, null, null, null);
                    updated.setGroupId("default");
                    sessionsCache.put(session.getId(), updated);
                }
            }
            saveGroups();
            saveSessions();
        }
    }

    private void saveGroups() {
        try {
            String json = gson.toJson(new ArrayList<>(groupsCache.values()));
            writeFile(groupsFile, json);
        } catch (Exception e) {
            Log.e(TAG, "Error saving groups", e);
        }
    }

    // File storage for inter-session transfers
    public File getSessionStorageDir(String sessionId) {
        File dir = new File(baseDir, "session_" + sessionId);
        dir.mkdirs();
        return dir;
    }

    public File getGroupStorageDir(String groupId) {
        File dir = new File(baseDir, "group_" + groupId);
        dir.mkdirs();
        return dir;
    }

    public File saveReceivedFile(String groupId, String fileName, InputStream inputStream) {
        File targetFile = new File(getGroupStorageDir(groupId), fileName);
        try {
            FileOutputStream fos = new FileOutputStream(targetFile);
            byte[] buffer = new byte[8192];
            int len;
            while ((len = inputStream.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }
            fos.close();
        } catch (Exception e) {
            Log.e(TAG, "Error saving file", e);
        }
        return targetFile;
    }

    public File getFile(String groupId, String fileName) {
        File file = new File(getGroupStorageDir(groupId), fileName);
        return file.exists() ? file : null;
    }

    public List<File> listFiles(String groupId) {
        File dir = getGroupStorageDir(groupId);
        File[] files = dir.listFiles();
        return files != null ? new ArrayList<>(List.of(files)) : new ArrayList<>();
    }

    // Settings
    public static class Settings {
        public int heartbeatIntervalSeconds = 30;
        public int interSessionPort = 8888;
        public boolean autoReconnect = true;
        public boolean keepScreenOn = true;
        public boolean showNotifications = true;
        public String storagePath = "";
    }

    private final File settingsFile = new File(baseDir, "settings.json");

    public void saveSettings(Settings settings) {
        writeFile(settingsFile, gson.toJson(settings));
    }

    public Settings loadSettings() {
        if (settingsFile.exists()) {
            return gson.fromJson(readFile(settingsFile), Settings.class);
        }
        return new Settings();
    }
}