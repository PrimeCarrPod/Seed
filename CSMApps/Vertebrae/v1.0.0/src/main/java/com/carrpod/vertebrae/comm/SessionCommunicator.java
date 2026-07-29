package com.carrpod.vertebrae.comm;

import android.content.Context;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.util.Log;

import com.carrpod.vertebrae.model.InterSessionMessage;
import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.storage.SessionStorageManager;
import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
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
    private final Gson gson = new Gson();
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
                        InterSessionMessage message = gson.fromJson(line, InterSessionMessage.class);
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
                writer.write(gson.toJson(message));
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
        msg.setPayload(gson.toJson(new CommandPayload(command, params)));
        send(msg);
    }

    public void sendFile(String groupId, java.io.File file, String toSessionId) {
        executor.execute(() -> {
            try {
                java.security.MessageDigest digest = java.security.MessageDigest.getInstance("SHA-256");
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
                msg.setPayload(gson.toJson(attachment));
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
        msg.setPayload(gson.toJson(new SessionHeartbeatPayload(session.getId(), session.getStatus(), session.isFocused())));
        send(msg);
    }

    public void sendFocusChange(String groupId, String sessionId, boolean isFocused) {
        InterSessionMessage msg = new InterSessionMessage();
        msg.setFromSessionId(sessionId);
        msg.setToSessionId(null);
        msg.setGroupId(groupId);
        msg.setType(InterSessionMessage.MessageType.FOCUS_CHANGE);
        msg.setPayload(gson.toJson(new FocusPayload(isFocused)));
        send(msg);
    }

    public void sendWindowState(String groupId, String sessionId, com.carrpod.vertebrae.model.WindowState state) {
        InterSessionMessage msg = new InterSessionMessage();
        msg.setFromSessionId(sessionId);
        msg.setToSessionId(null);
        msg.setGroupId(groupId);
        msg.setType(InterSessionMessage.MessageType.WINDOW_STATE);
        msg.setPayload(gson.toJson(state));
        send(msg);
    }

    private void notifyConnected() {
        for (MessageListener listener : listeners) {
            try { listener.onConnected(); } catch (Exception e) {}
        }
    }

    private void notifyDisconnected() {
        for (MessageListener listener : listeners) {
            try { listener.onDisconnected(); } catch (Exception e) {}
        }
    }

    private void notifyMessage(InterSessionMessage message) {
        for (MessageListener listener : listeners) {
            try { listener.onMessage(message); } catch (Exception e) {}
        }
    }

    private void notifyError(String error) {
        for (MessageListener listener : listeners) {
            try { listener.onError(error); } catch (Exception e) {}
        }
    }

    public void destroy() {
        disconnect();
        executor.shutdown();
    }

    // Payload classes
    private static class CommandPayload {
        public String command;
        public java.util.Map<String, String> params;

        CommandPayload(String command, java.util.Map<String, String> params) {
            this.command = command;
            this.params = params;
        }
    }

    private static class SessionHeartbeatPayload {
        public String sessionId;
        public KilosSession.SessionStatus status;
        public boolean isFocused;

        SessionHeartbeatPayload(String sessionId, KilosSession.SessionStatus status, boolean isFocused) {
            this.sessionId = sessionId;
            this.status = status;
            this.isFocused = isFocused;
        }
    }

    private static class FocusPayload {
        public boolean focused;

        FocusPayload(boolean focused) {
            this.focused = focused;
        }
    }
}