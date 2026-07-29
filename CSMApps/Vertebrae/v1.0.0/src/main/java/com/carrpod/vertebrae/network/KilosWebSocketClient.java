package com.carrpod.vertebrae.network;

import android.util.Log;

import com.carrpod.vertebrae.model.KilosSession;

import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import okio.ByteString;

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
    private final OkHttpClient client;
    private WebSocket webSocket;
    private boolean isConnecting = false;

    public KilosWebSocketClient(String sessionId, WebSocketListener listener) {
        this.sessionId = sessionId;
        this.listener = listener;
        this.client = new OkHttpClient.Builder()
                .pingInterval(15, TimeUnit.SECONDS)
                .build();
    }

    public void connect() {
        if (isConnecting || webSocket != null) return;
        isConnecting = true;

        String wsUrl = "wss://app.kilo.ai/cloud/chat?sessionId=" + sessionId;
        Request request = new Request.Builder()
                .url(wsUrl)
                .addHeader("User-Agent", "Mozilla/5.0 (Linux; Android 13) Vertebrae/1.0 KiloAI-Client")
                .addHeader("Origin", "https://app.kilo.ai")
                .addHeader("Sec-WebSocket-Protocol", "chat.kilo.ai")
                .build();

        webSocket = client.newWebSocket(request, new okhttp3.WebSocketListener() {
            @Override
            public void onOpen(WebSocket webSocket, okhttp3.Response response) {
                isConnecting = false;
                Log.d(TAG, "Connected: " + sessionId);
                listener.onOpen(sessionId);
            }

            @Override
            public void onMessage(WebSocket webSocket, String text) {
                listener.onMessage(sessionId, text);
            }

            @Override
            public void onMessage(WebSocket webSocket, ByteString bytes) {
                listener.onBinaryMessage(sessionId, bytes.toByteArray());
            }

            @Override
            public void onClosing(WebSocket webSocket, int code, String reason) {
                webSocket.close(1000, null);
                listener.onClosed(sessionId, code, reason);
            }

            @Override
            public void onClosed(WebSocket webSocket, int code, String reason) {
                Log.d(TAG, "Closed: " + sessionId + " - " + code + " " + reason);
                listener.onClosed(sessionId, code, reason);
            }

            @Override
            public void onFailure(WebSocket webSocket, Throwable t, okhttp3.Response response) {
                isConnecting = false;
                Log.e(TAG, "Error: " + sessionId, t);
                listener.onError(sessionId, t.getMessage() != null ? t.getMessage() : "Connection failed");
            }
        });
    }

    public void send(String text) {
        if (webSocket != null) {
            webSocket.send(text);
        } else {
            listener.onError(sessionId, "Not connected");
        }
    }

    public void send(byte[] bytes) {
        if (webSocket != null) {
            webSocket.send(ByteString.of(bytes));
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
            webSocket.close(1000, "Client disconnect");
            webSocket = null;
        }
        isConnecting = false;
        listener.onClosed(sessionId, 1000, "Client disconnect");
    }

    public boolean isConnected() {
        return webSocket != null;
    }
}