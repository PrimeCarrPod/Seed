package com.carrpod.vertebrae.network;

import android.util.Log;

import com.carrpod.vertebrae.model.KilosSession;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.WebSocket;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.TimeUnit;

public class KilosWebSocketClient {

    private static final String TAG = "KilosWebSocketClient";

    public interface WebSocketListener {
        void onOpen(String sessionId);
        void onMessage(String sessionId, String text);
        void onBinaryMessage(String sessionId, byte[] bytes);
        void onClosed(String sessionId, int code, String reason);
        void onError(String sessionId, String error);
    }

    private final String sessionId;
    private final WebSocketListener listener;
    private final HttpClient httpClient;
    private WebSocket webSocket;
    private boolean isConnecting = false;

    public KilosWebSocketClient(String sessionId, WebSocketListener listener) {
        this.sessionId = sessionId;
        this.listener = listener;
        this.httpClient = HttpClient.newBuilder()
                .build();
    }

    public void connect() {
        if (isConnecting || webSocket != null) return;
        isConnecting = true;

        String wsUrl = "wss://app.kilo.ai/cloud/chat?sessionId=" + sessionId;
        
httpClient.newWebSocketBuilder()
                .buildAsync(URI.create(wsUrl), new WebSocket.Listener() {
                    public void onOpen(WebSocket webSocket) {
                        KilosWebSocketClient.this.webSocket = webSocket;
                        isConnecting = false;
                        Log.d(TAG, "Connected: " + sessionId);
                        listener.onOpen(sessionId);
                        webSocket.request(1);
                    }

                    public CompletionStage<?> onText(WebSocket webSocket, CharSequence data, boolean last) {
                        listener.onMessage(sessionId, data.toString());
                        webSocket.request(1);
                        return null;
                    }

                    public CompletionStage<?> onBinary(WebSocket webSocket, byte[] data, boolean last) {
                        listener.onBinaryMessage(sessionId, data);
                        webSocket.request(1);
                        return null;
                    }

                    public void onError(WebSocket webSocket, Throwable error) {
                        isConnecting = false;
                        Log.e(TAG, "Error: " + sessionId, error);
                        listener.onError(sessionId, error.getMessage() != null ? error.getMessage() : "Connection failed");
                    }

                    public CompletionStage<?> onClose(WebSocket webSocket, int statusCode, String reason) {
                        KilosWebSocketClient.this.webSocket = null;
                        listener.onClosed(sessionId, statusCode, reason);
                        return null;
                    }
                })
                .exceptionally(throwable -> {
                    isConnecting = false;
                    Log.e(TAG, "Connection failed: " + sessionId, throwable);
                    listener.onError(sessionId, throwable.getMessage() != null ? throwable.getMessage() : "Connection failed");
                    return null;
                });
    }

    public void send(String text) {
        if (webSocket != null) {
            webSocket.sendText(text, true);
        } else {
            listener.onError(sessionId, "Not connected");
        }
    }

    public void send(byte[] bytes) {
        if (webSocket != null) {
            webSocket.sendBinary(java.nio.ByteBuffer.wrap(bytes), true);
        } else {
            listener.onError(sessionId, "Not connected");
        }
    }

    public void sendHeartbeat() {
        send("{\"type\":\"heartbeat\",\"sessionId\":\"" + sessionId + "\",\"t\":" + System.currentTimeMillis() + "}");
    }

    public void sendBrowserHeartbeat() {
        send("{\"type\":\"ping\",\"data\":{\"t\":" + System.currentTimeMillis() + "}}");
    }

    public void close() {
        if (webSocket != null) {
            webSocket.sendClose(WebSocket.NORMAL_CLOSURE, "Client disconnect").join();
            webSocket = null;
        }
        isConnecting = false;
        listener.onClosed(sessionId, 1000, "Client disconnect");
    }

    public boolean isConnected() {
        return webSocket != null;
    }
}