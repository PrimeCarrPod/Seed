package com.carrpod.vertebrae.network;

import android.content.Context;
import android.util.Log;

import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.storage.SessionStorageManager;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class WebSocketManager {

    private static final String TAG = "WebSocketManager";
    private static WebSocketManager instance;

    private final Context context;
    private final SessionStorageManager storage;
    private final Map<String, KilosWebSocketClient> clients = new ConcurrentHashMap<>();
    private final ExecutorService executor = Executors.newSingleThreadExecutor();

    private WebSocketManager(Context context) {
        this.context = context.getApplicationContext();
        this.storage = SessionStorageManager.getInstance();
    }

    public static synchronized void initialize(Context context) {
        if (instance == null) {
            instance = new WebSocketManager(context);
        }
    }

    public static WebSocketManager getInstance() {
        if (instance == null) {
            throw new IllegalStateException("WebSocketManager not initialized");
        }
        return instance;
    }

    public void connectSession(KilosSession session) {
        if (clients.containsKey(session.getId())) {
            return;
        }

        KilosWebSocketClient client = new KilosWebSocketClient(session.getSessionId(), new KilosWebSocketClient.WebSocketListener() {
            @Override
            public void onOpen(String sessionId) {
                updateSessionStatus(session.getId(), KilosSession.SessionStatus.CONNECTED);
            }

            @Override
            public void onMessage(String sessionId, String text) {
                // Handle incoming messages from kilo.ai
            }

            @Override
            public void onBinaryMessage(String sessionId, byte[] bytes) {
                // Handle binary messages
            }

            @Override
            public void onClosed(String sessionId, int code, String reason) {
                clients.remove(session.getId());
                updateSessionStatus(session.getId(), KilosSession.SessionStatus.DISCONNECTED);
            }

            @Override
            public void onError(String sessionId, String error) {
                Log.e(TAG, "WS Error for " + session.getId() + ": " + error);
                updateSessionStatus(session.getId(), KilosSession.SessionStatus.ERROR);
            }
        });

        clients.put(session.getId(), client);
        client.connect();
    }

    public void disconnectSession(String sessionId) {
        KilosWebSocketClient client = clients.remove(sessionId);
        if (client != null) {
            client.close();
        }
        updateSessionStatus(sessionId, KilosSession.SessionStatus.DISCONNECTED);
    }

    public void disconnectAll() {
        for (KilosWebSocketClient client : clients.values()) {
            client.close();
        }
        clients.clear();
    }

    public void sendToSession(String sessionId, String text) {
        KilosWebSocketClient client = clients.get(sessionId);
        if (client != null) {
            client.send(text);
        }
    }

    public void sendToAllSessions(String text) {
        for (KilosWebSocketClient client : clients.values()) {
            client.send(text);
        }
    }

    public void sendHeartbeat(String sessionId) {
        KilosWebSocketClient client = clients.get(sessionId);
        if (client != null) {
            client.sendHeartbeat();
            client.sendBrowserHeartbeat();
        }
    }

    public boolean isSessionConnected(String sessionId) {
        KilosWebSocketClient client = clients.get(sessionId);
        return client != null && client.isConnected();
    }

    private void updateSessionStatus(String sessionId, KilosSession.SessionStatus status) {
        executor.execute(() -> {
            KilosSession session = storage.loadSession(sessionId);
            if (session != null) {
                KilosSession updated = session.copyWithStatus(status);
                storage.saveSession(updated);
            }
        });
    }

    public void shutdown() {
        disconnectAll();
        executor.shutdown();
    }
}