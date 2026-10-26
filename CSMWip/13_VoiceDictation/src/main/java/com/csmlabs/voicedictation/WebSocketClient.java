package com.csmlabs.voicedictation;

import android.util.Log;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import okhttp3.OkHttpClient.Builder;

public class WebSocketClient {
    private static final String TAG = "WSClient";
    
    private final OkHttpClient client;
    private WebSocket webSocket;
    private final Listener listener;
    private String serverUrl;
    private boolean isConnected = false;
    
    public interface Listener {
        void onConnected();
        void onDisconnected(int code, String reason);
        void onError(Exception e);
        void onMessageReceived(String text);
    }
    
    public WebSocketClient(Listener listener) {
        this.listener = listener;
        this.client = new Builder()
            .pingInterval(10, TimeUnit.SECONDS)
            .build();
    }
    
    public void connect(String host, int port) {
        if (webSocket != null) {
            disconnect();
        }
        serverUrl = Config.buildWsUrl(host, port);
        Log.d(TAG, "Connecting to " + serverUrl);
        
        Request request = new Request.Builder()
            .url(serverUrl)
            .build();
        
        webSocket = client.newWebSocket(request, new WebSocketListener() {
            @Override
            public void onOpen(WebSocket webSocket, okhttp3.Response response) {
                Log.d(TAG, "WebSocket connected");
                isConnected = true;
                if (listener != null) listener.onConnected();
            }
            
            @Override
            public void onMessage(WebSocket webSocket, String text) {
                Log.d(TAG, "Received: " + text);
                if (listener != null) listener.onMessageReceived(text);
            }
            
            @Override
            public void onMessage(WebSocket webSocket, okio.ByteString bytes) {
                // Ignore binary
            }
            
            @Override
            public void onClosing(WebSocket webSocket, int code, String reason) {
                Log.d(TAG, "Closing: " + code + " " + reason);
                webSocket.close(1000, null);
                isConnected = false;
                if (listener != null) listener.onDisconnected(code, reason);
            }
            
            @Override
            public void onClosed(WebSocket webSocket, int code, String reason) {
                Log.d(TAG, "Closed: " + code + " " + reason);
                isConnected = false;
                if (listener != null) listener.onDisconnected(code, reason);
            }
            
            @Override
            public void onFailure(WebSocket webSocket, Throwable t, okhttp3.Response response) {
                Log.e(TAG, "WebSocket error", t);
                isConnected = false;
                if (listener != null) listener.onError(t);
            }
        });
    }
    
    public void sendText(String text) {
        if (webSocket != null && isConnected) {
            String payload = "{\"type\":\"text\",\"payload\":\"" + escapeJson(text) + "\"}";
            webSocket.send(payload);
            Log.d(TAG, "Sent: " + payload);
        }
    }
    
    public void disconnect() {
        if (webSocket != null) {
            webSocket.close(1000, "Client disconnect");
            webSocket = null;
        }
        isConnected = false;
    }
    
    public boolean isConnected() {
        return isConnected;
    }
    
    private String escapeJson(String input) {
        return input.replace("\\", "\\\\")
                   .replace("\"", "\\\"")
                   .replace("\n", "\\n")
                   .replace("\r", "\\r")
                   .replace("\t", "\\t");
    }
}