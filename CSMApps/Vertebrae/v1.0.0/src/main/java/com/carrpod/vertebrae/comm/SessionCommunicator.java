package com.carrpod.vertebrae.comm;

import android.content.Context;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.util.Log;

import com.carrpod.vertebrae.model.InterSessionMessage;
import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.model.WindowState;
import com.carrpod.vertebrae.storage.SessionStorageManager;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class SessionCommunicator {

    private static final String TAG = "SessionCommunicator";
    private static SessionCommunicator instance;

    private final Context context;
    private final SessionStorageManager storage;
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final String localSessionId = "vertebrae_" + System.currentTimeMillis();
    private LocalSocket socket;
    private BufferedReader reader;
    private BufferedWriter writer;
    private boolean isConnected = false;
    private final List<MessageListener> listeners = new CopyOnWriteArrayList<>();

    public interface MessageListener {
        void onMessage(InterSessionMessage message);
        void onConnected();
        void onDisconnected();
        void onError(String error);
    }

    private SessionCommunicator(Context context) {
        this.context = context.getApplicationContext();
        this.storage = SessionStorageManager.getInstance();
    }

    public static synchronized void initialize(Context context) {
        if (instance == null) {
            instance = new SessionCommunicator(context);
        }
    }

    public static SessionCommunicator getInstance() {
        if (instance == null) {
            throw new IllegalStateException("SessionCommunicator not initialized");
        }
        return instance;
    }

    public void addListener(MessageListener listener) {
        listeners.add(listener);
    }

    public void removeListener(MessageListener listener) {
        listeners.remove(listener);
    }

    public void connect() {
        if (isConnected) return;

        executor.execute(() -> {
            try {
                socket = new LocalSocket();
                socket.connect(new LocalSocketAddress(InterSessionServer.SOCKET_NAME, LocalSocketAddress.Namespace.RESERVED));

                reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

                // Register this client
                writer.write("REGISTER:" + localSessionId + "\n");
                writer.flush();

                isConnected = true;
                notifyConnected();

                // Read loop
                String line;
                while (isConnected && (line = reader.readLine()) != null) {
                    if (line.isEmpty()) continue;

                    try {
                        InterSessionMessage message = InterSessionMessage.fromJson(new JSONObject(line));
                        if (message != null && message.isForSession(localSessionId)) {
                            notifyMessage(message);
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "Parse error", e);
                    }
                }
            } catch (Exception e) {
                Log.e(TAG, "Connection error", e);
                notifyError(e.getMessage() != null ? e.getMessage() : "Connection failed");
            } finally {
                disconnect();
            }
        });
    }

    public void disconnect() {
        isConnected = false;
        try { if (reader != null) reader.close(); } catch (Exception ignored) {}
        try { if (writer != null) writer.close(); } catch (Exception ignored) {}
        try { if (socket != null) socket.close(); } catch (Exception ignored) {}
        notifyDisconnected();
    }

    public void send(InterSessionMessage message) {
        if (!isConnected || writer == null) return;

        executor.execute(() -> {
            try {
                writer.write(message.toJson().toString());
                writer.newLine();
                writer.flush();
            } catch (Exception e) {
                Log.e(TAG, "Send failed", e);
            }
        });
    }

    public void sendText(String toSessionId, String groupId, String text) {
        InterSessionMessage msg = new InterSessionMessage();
        msg.setFromSessionId(localSessionId);
        msg.setToSessionId(toSessionId);
        msg.setGroupId(groupId);
        msg.setType(InterSessionMessage.MessageType.TEXT);
        msg.setPayload(text);
        send(msg);
    }

    public void sendCommand(String toSessionId, String groupId, String command, java.util.Map<String, String> params) {
        InterSessionMessage msg = new InterSessionMessage();
        msg.setFromSessionId(localSessionId);
        msg.setToSessionId(toSessionId);
        msg.setGroupId(groupId);
        msg.setType(InterSessionMessage.MessageType.COMMAND);
        try {
            JSONObject payload = new JSONObject();
            payload.put("command", command);
            payload.put("params", new JSONObject(params));
            msg.setPayload(payload.toString());
        } catch (Exception e) {
            Log.e(TAG, "Command payload error", e);
        }
        send(msg);
    }

    public void sendFile(String groupId, java.io.File file, String toSessionId) {
        executor.execute(() -> {
            try {
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hashBytes = digest.digest(java.nio.file.Files.readAllBytes(file.toPath()));
                StringBuilder hash = new StringBuilder();
                for (byte b : hashBytes) {
                    hash.append(String.format("%02x", b));
                }

                InterSessionMessage.FileAttachment attachment = new InterSessionMessage.FileAttachment(
                        file.getName(), file.getAbsolutePath(), file.length(),
                        context.getContentResolver().getType(android.net.Uri.fromFile(file)),
                        hash.toString()
                );

                // Save to shared storage
                storage.saveReceivedFile(groupId, file.getName(), new java.io.FileInputStream(file));

                InterSessionMessage msg = new InterSessionMessage();
                msg.setFromSessionId(localSessionId);
                msg.setToSessionId(toSessionId);
                msg.setGroupId(groupId);
                msg.setType(InterSessionMessage.MessageType.FILE_TRANSFER);
                msg.setPayload(attachment.toJson().toString());
                msg.setFileAttachment(attachment);
                send(msg);
            } catch (Exception e) {
                Log.e(TAG, "File send failed", e);
            }
        });
    }

    public void requestFile(String groupId, String fileName, String fromSessionId) {
        InterSessionMessage msg = new InterSessionMessage();
        msg.setFromSessionId(localSessionId);
        msg.setToSessionId(fromSessionId);
        msg.setGroupId(groupId);
        msg.setType(InterSessionMessage.MessageType.FILE_REQUEST);
        msg.setPayload(fileName);
        send(msg);
    }

    public void sendHeartbeat(String groupId, KilosSession session) {
        InterSessionMessage msg = new InterSessionMessage();
        msg.setFromSessionId(localSessionId);
        msg.setToSessionId(null);
        msg.setGroupId(groupId);
        msg.setType(InterSessionMessage.MessageType.HEARTBEAT);
        try {
            JSONObject payload = new JSONObject();
            payload.put("sessionId", session.getId());
            payload.put("status", session.getStatus().name());
            payload.put("isFocused", session.isFocused());
            msg.setPayload(payload.toString());
        } catch (Exception e) {
            Log.e(TAG, "Heartbeat payload error", e);
        }
        send(msg);
    }

    public void sendFocusChange(String groupId, String sessionId, boolean isFocused) {
        InterSessionMessage msg = new InterSessionMessage();
        msg.setFromSessionId(sessionId);
        msg.setToSessionId(null);
        msg.setGroupId(groupId);
        msg.setType(InterSessionMessage.MessageType.FOCUS_CHANGE);
        try {
            JSONObject payload = new JSONObject();
            payload.put("focused", isFocused);
            msg.setPayload(payload.toString());
        } catch (Exception e) {}
        send(msg);
    }

    public void sendWindowState(String groupId, String sessionId, com.carrpod.vertebrae.model.WindowState state) {
        InterSessionMessage msg = new InterSessionMessage();
        msg.setFromSessionId(sessionId);
        msg.setToSessionId(null);
        msg.setGroupId(groupId);
        msg.setType(InterSessionMessage.MessageType.WINDOW_STATE);
        msg.setPayload(state.toJson().toString());
        send(msg);
    }

    private void notifyConnected() {
        for (MessageListener l : listeners) {
            try { l.onConnected(); } catch (Exception e) {}
        }
    }

    private void notifyDisconnected() {
        for (MessageListener l : listeners) {
            try { l.onDisconnected(); } catch (Exception e) {}
        }
    }

    private void notifyMessage(InterSessionMessage message) {
        for (MessageListener l : listeners) {
            try { l.onMessage(message); } catch (Exception e) {}
        }
    }

    private void notifyError(String error) {
        for (MessageListener l : listeners) {
            try { l.onError(error); } catch (Exception e) {}
        }
    }

    public void destroy() {
        disconnect();
        executor.shutdown();
    }
}