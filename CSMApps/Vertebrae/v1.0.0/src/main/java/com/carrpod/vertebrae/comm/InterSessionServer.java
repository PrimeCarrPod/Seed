package com.carrpod.vertebrae.comm;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.net.LocalServerSocket;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.os.IBinder;
import android.util.Log;

import com.carrpod.vertebrae.model.InterSessionMessage;
import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.storage.SessionStorageManager;
import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class InterSessionServer extends Service {

    private static final String TAG = "InterSessionServer";
    public static final String SOCKET_NAME = "vertebrae_intersession";

    private final SessionStorageManager storage = SessionStorageManager.getInstance();
    private final Gson gson = new Gson();
    private final Map<String, LocalSocket> clientSockets = new ConcurrentHashMap<>();
    private LocalServerSocket serverSocket;
    private final ExecutorService executor = Executors.newCachedThreadPool();
    private boolean isRunning = false;

    @Override
    public void onCreate() {
        super.onCreate();
        startServer();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return START_STICKY;
    }

    private void startServer() {
        if (isRunning) return;
        isRunning = true;

        executor.execute(() -> {
            try {
                serverSocket = new LocalServerSocket(SOCKET_NAME);
                Log.d(TAG, "Server started on " + SOCKET_NAME);

                while (isRunning && !Thread.currentThread().isInterrupted()) {
                    try {
                        LocalSocket client = serverSocket.accept();
                        handleClient(client);
                    } catch (Exception e) {
                        if (isRunning) {
                            Log.e(TAG, "Accept error", e);
                        }
                    }
                }
            } catch (Exception e) {
                Log.e(TAG, "Server error", e);
            }
        });
    }

    private void handleClient(LocalSocket socket) {
        executor.execute(() -> {
            String sessionId = null;
            try {
                BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.isEmpty()) continue;

                    if (sessionId == null && line.startsWith("REGISTER:")) {
                        sessionId = line.substring("REGISTER:".length()).trim();
                        clientSockets.put(sessionId, socket);
                        Log.d(TAG, "Client registered: " + sessionId);
                        sendPendingMessages(sessionId, writer);
                        continue;
                    }

                    if (sessionId != null) {
                        InterSessionMessage message = gson.fromJson(line, InterSessionMessage.class);
                        if (message != null) {
                            deliverMessage(message, writer);
                        }
                    }
                }
            } catch (Exception e) {
                Log.e(TAG, "Client error", e);
            } finally {
                if (sessionId != null) {
                    clientSockets.remove(sessionId);
                }
                try { socket.close(); } catch (Exception ignored) {}
            }
        });
    }

    private void deliverMessage(InterSessionMessage message, BufferedWriter senderWriter) {
        executor.execute(() -> {
            // Store for offline delivery
            storage.saveReceivedFile(message.getGroupId(), message.getId() + ".json", 
                new java.io.ByteArrayInputStream(gson.toJson(message).getBytes()));

            // Try immediate delivery
            if (message.getToSessionId() != null) {
                LocalSocket target = clientSockets.get(message.getToSessionId());
                if (target != null) {
                    try {
                        BufferedWriter out = new BufferedWriter(new OutputStreamWriter(target.getOutputStream()));
                        out.write(gson.toJson(message));
                        out.newLine();
                        out.flush();
                    } catch (Exception e) {
                        Log.e(TAG, "Delivery failed to " + message.getToSessionId(), e);
                    }
                }
            } else {
                // Broadcast to group
                for (Map.Entry<String, LocalSocket> entry : clientSockets.entrySet()) {
                    if (!entry.getKey().equals(message.getFromSessionId())) {
                        try {
                            BufferedWriter out = new BufferedWriter(new OutputStreamWriter(entry.getValue().getOutputStream()));
                            out.write(gson.toJson(message));
                            out.newLine();
                            out.flush();
                        } catch (Exception e) {
                            Log.e(TAG, "Broadcast failed to " + entry.getKey(), e);
                        }
                    }
                }
            }
        });
    }

    private void sendPendingMessages(String sessionId, BufferedWriter writer) {
        executor.execute(() -> {
            try {
                KilosSession session = storage.loadSession(sessionId);
                if (session != null) {
                    // Load messages since last heartbeat
                    // This is simplified - in production you'd track per-session last read
                }
            } catch (Exception e) {
                Log.e(TAG, "Send pending error", e);
            }
        });
    }

    public void sendMessage(InterSessionMessage message) {
        deliverMessage(message, null);
    }

    @Override
    public void onDestroy() {
        isRunning = false;
        try {
            if (serverSocket != null) serverSocket.close();
        } catch (Exception ignored) {}
        for (LocalSocket socket : clientSockets.values()) {
            try { socket.close(); } catch (Exception ignored) {}
        }
        clientSockets.clear();
        executor.shutdown();
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}