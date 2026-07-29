package com.carrpod.vertebrae.model;

import android.os.Parcel;
import android.os.Parcelable;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class KilosSession implements Parcelable, Serializable {

    public enum SessionStatus {
        DISCONNECTED,
        CONNECTING,
        CONNECTED,
        HEARTBEAT_ACTIVE,
        HEARTBEAT_FAILED,
        ERROR,
        RECONNECTING
    }

    private String id;
    private String sessionId;
    private String displayName;
    private String groupId;
    private String url;
    private SessionStatus status;
    private long createdAt;
    private long lastConnectedAt;
    private long lastHeartbeatAt;
    private int heartbeatIntervalSeconds;
    private boolean isAutoReconnect;
    private boolean isFocused;
    private float windowX;
    private float windowY;
    private int windowWidth;
    private int windowHeight;
    private boolean isFloating;
    private Map<String, String> cookies;
    private Map<String, String> headers;

    public KilosSession() {
        this.id = UUID.randomUUID().toString();
        this.sessionId = "";
        this.displayName = "";
        this.groupId = "default";
        this.url = "https://app.kilo.ai/cloud/chat?sessionId=";
        this.status = SessionStatus.DISCONNECTED;
        this.createdAt = System.currentTimeMillis();
        this.lastConnectedAt = 0;
        this.lastHeartbeatAt = 0;
        this.heartbeatIntervalSeconds = 30;
        this.isAutoReconnect = true;
        this.isFocused = false;
        this.windowX = 0f;
        this.windowY = 0f;
        this.windowWidth = 800;
        this.windowHeight = 600;
        this.isFloating = true;
        this.cookies = new HashMap<>();
        this.headers = new HashMap<>();
    }

    public KilosSession(String sessionId, String groupId, String displayName) {
        this();
        this.sessionId = sessionId;
        this.groupId = groupId;
        this.displayName = displayName.isEmpty() ? "Session " + sessionId.substring(Math.max(0, sessionId.length() - 8)) : displayName;
        this.url = "https://app.kilo.ai/cloud/chat?sessionId=" + sessionId;
    }

    protected KilosSession(Parcel in) {
        id = in.readString();
        sessionId = in.readString();
        displayName = in.readString();
        groupId = in.readString();
        url = in.readString();
        status = SessionStatus.valueOf(in.readString());
        createdAt = in.readLong();
        lastConnectedAt = in.readLong();
        lastHeartbeatAt = in.readLong();
        heartbeatIntervalSeconds = in.readInt();
        isAutoReconnect = in.readByte() != 0;
        isFocused = in.readByte() != 0;
        windowX = in.readFloat();
        windowY = in.readFloat();
        windowWidth = in.readInt();
        windowHeight = in.readInt();
        isFloating = in.readByte() != 0;
        int cookieSize = in.readInt();
        cookies = new HashMap<>();
        for (int i = 0; i < cookieSize; i++) {
            cookies.put(in.readString(), in.readString());
        }
        int headerSize = in.readInt();
        headers = new HashMap<>();
        for (int i = 0; i < headerSize; i++) {
            headers.put(in.readString(), in.readString());
        }
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(id);
        dest.writeString(sessionId);
        dest.writeString(displayName);
        dest.writeString(groupId);
        dest.writeString(url);
        dest.writeString(status.name());
        dest.writeLong(createdAt);
        dest.writeLong(lastConnectedAt);
        dest.writeLong(lastHeartbeatAt);
        dest.writeInt(heartbeatIntervalSeconds);
        dest.writeByte((byte) (isAutoReconnect ? 1 : 0));
        dest.writeByte((byte) (isFocused ? 1 : 0));
        dest.writeFloat(windowX);
        dest.writeFloat(windowY);
        dest.writeInt(windowWidth);
        dest.writeInt(windowHeight);
        dest.writeByte((byte) (isFloating ? 1 : 0));
        dest.writeInt(cookies.size());
        for (Map.Entry<String, String> entry : cookies.entrySet()) {
            dest.writeString(entry.getKey());
            dest.writeString(entry.getValue());
        }
        dest.writeInt(headers.size());
        for (Map.Entry<String, String> entry : headers.entrySet()) {
            dest.writeString(entry.getKey());
            dest.writeString(entry.getValue());
        }
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<KilosSession> CREATOR = new Creator<KilosSession>() {
        @Override
        public KilosSession createFromParcel(Parcel in) {
            return new KilosSession(in);
        }

        @Override
        public KilosSession[] newArray(int size) {
            return new KilosSession[size];
        }
    };

    // Copy with modifications
    public KilosSession copyWith(
            SessionStatus status,
            Boolean isFocused,
            Long lastHeartbeatAt,
            Long lastConnectedAt,
            Float windowX,
            Float windowY,
            Integer windowWidth,
            Integer windowHeight,
            Map<String, String> cookies,
            Map<String, String> headers
    ) {
        KilosSession copy = new KilosSession();
        copy.id = this.id;
        copy.sessionId = this.sessionId;
        copy.displayName = this.displayName;
        copy.groupId = this.groupId;
        copy.url = this.url;
        copy.status = status != null ? status : this.status;
        copy.createdAt = this.createdAt;
        copy.lastConnectedAt = lastConnectedAt != null ? lastConnectedAt : this.lastConnectedAt;
        copy.lastHeartbeatAt = lastHeartbeatAt != null ? lastHeartbeatAt : this.lastHeartbeatAt;
        copy.heartbeatIntervalSeconds = this.heartbeatIntervalSeconds;
        copy.isAutoReconnect = this.isAutoReconnect;
        copy.isFocused = isFocused != null ? isFocused : this.isFocused;
        copy.windowX = windowX != null ? windowX : this.windowX;
        copy.windowY = windowY != null ? windowY : this.windowY;
        copy.windowWidth = windowWidth != null ? windowWidth : this.windowWidth;
        copy.windowHeight = windowHeight != null ? windowHeight : this.windowHeight;
        copy.isFloating = this.isFloating;
        copy.cookies = cookies != null ? cookies : this.cookies;
        copy.headers = headers != null ? headers : this.headers;
        return copy;
    }

    public String getWebSocketUrl() {
        String wsUrl = url.replace("https://", "wss://").replace("http://", "ws://");
        if (!wsUrl.endsWith("/")) {
            wsUrl += "/";
        }
        return wsUrl + "websocket";
    }

    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getSessionId() { return sessionId; }
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
        this.url = "https://app.kilo.ai/cloud/chat?sessionId=" + sessionId;
    }

    public String getDisplayName() { return displayName; }
    public void setDisplayName(String displayName) { this.displayName = displayName; }

    public String getGroupId() { return groupId; }
    public void setGroupId(String groupId) { this.groupId = groupId; }

    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }

    public SessionStatus getStatus() { return status; }
    public void setStatus(SessionStatus status) { this.status = status; }

    public long getCreatedAt() { return createdAt; }
    public void setCreatedAt(long createdAt) { this.createdAt = createdAt; }

    public long getLastConnectedAt() { return lastConnectedAt; }
    public void setLastConnectedAt(long lastConnectedAt) { this.lastConnectedAt = lastConnectedAt; }

    public long getLastHeartbeatAt() { return lastHeartbeatAt; }
    public void setLastHeartbeatAt(long lastHeartbeatAt) { this.lastHeartbeatAt = lastHeartbeatAt; }

    public int getHeartbeatIntervalSeconds() { return heartbeatIntervalSeconds; }
    public void setHeartbeatIntervalSeconds(int heartbeatIntervalSeconds) { this.heartbeatIntervalSeconds = heartbeatIntervalSeconds; }

    public boolean isAutoReconnect() { return isAutoReconnect; }
    public void setAutoReconnect(boolean autoReconnect) { isAutoReconnect = autoReconnect; }

    public boolean isFocused() { return isFocused; }
    public void setFocused(boolean focused) { isFocused = focused; }

    public float getWindowX() { return windowX; }
    public void setWindowX(float windowX) { this.windowX = windowX; }

    public float getWindowY() { return windowY; }
    public void setWindowY(float windowY) { this.windowY = windowY; }

    public int getWindowWidth() { return windowWidth; }
    public void setWindowWidth(int windowWidth) { this.windowWidth = windowWidth; }

    public int getWindowHeight() { return windowHeight; }
    public void setWindowHeight(int windowHeight) { this.windowHeight = windowHeight; }

    public boolean isFloating() { return isFloating; }
    public void setFloating(boolean floating) { isFloating = floating; }

    public Map<String, String> getCookies() { return cookies; }
    public void setCookies(Map<String, String> cookies) { this.cookies = cookies; }

    public Map<String, String> getHeaders() { return headers; }
    public void setHeaders(Map<String, String> headers) { this.headers = headers; }
}