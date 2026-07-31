package com.carrpod.vertebrae.model;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class KilosSession implements Parcelable, Serializable {

    public enum SessionStatus {
        DISCONNECTED, CONNECTING, CONNECTED, HEARTBEAT_ACTIVE, HEARTBEAT_FAILED, ERROR, RECONNECTING
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

    // Convenience methods
    public KilosSession copyWithStatus(SessionStatus status) {
        KilosSession copy = copy();
        copy.status = status;
        return copy;
    }

    public KilosSession copyWithGroupId(String groupId) {
        KilosSession copy = copy();
        copy.groupId = groupId;
        return copy;
    }

    public KilosSession copyWithDisplayName(String name) {
        KilosSession copy = copy();
        copy.displayName = name;
        return copy;
    }

    public KilosSession copyWithWindow(float windowX, float windowY, int windowWidth, int windowHeight) {
        KilosSession copy = copy();
        copy.windowX = windowX;
        copy.windowY = windowY;
        copy.windowWidth = windowWidth;
        copy.windowHeight = windowHeight;
        return copy;
    }

    // Comprehensive copyWith for all fields (used by services)
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
        KilosSession copy = copy();
        if (status != null) copy.status = status;
        if (isFocused != null) copy.isFocused = isFocused;
        if (lastHeartbeatAt != null) copy.lastHeartbeatAt = lastHeartbeatAt;
        if (lastConnectedAt != null) copy.lastConnectedAt = lastConnectedAt;
        if (windowX != null) copy.windowX = windowX;
        if (windowY != null) copy.windowY = windowY;
        if (windowWidth != null) copy.windowWidth = windowWidth;
        if (windowHeight != null) copy.windowHeight = windowHeight;
        if (cookies != null) copy.cookies = cookies;
        if (headers != null) copy.headers = headers;
        return copy;
    }

    public KilosSession copyWithFocused(boolean focused) {
        KilosSession copy = copy();
        copy.isFocused = focused;
        return copy;
    }

    public KilosSession copy() {
        KilosSession copy = new KilosSession();
        copy.id = this.id;
        copy.sessionId = this.sessionId;
        copy.displayName = this.displayName;
        copy.groupId = this.groupId;
        copy.url = this.url;
        copy.status = this.status;
        copy.createdAt = this.createdAt;
        copy.lastConnectedAt = this.lastConnectedAt;
        copy.lastHeartbeatAt = this.lastHeartbeatAt;
        copy.heartbeatIntervalSeconds = this.heartbeatIntervalSeconds;
        copy.isAutoReconnect = this.isAutoReconnect;
        copy.isFocused = this.isFocused;
        copy.windowX = this.windowX;
        copy.windowY = this.windowY;
        copy.windowWidth = this.windowWidth;
        copy.windowHeight = this.windowHeight;
        copy.isFloating = this.isFloating;
        copy.cookies = new HashMap<>(this.cookies);
        copy.headers = new HashMap<>(this.headers);
        return copy;
    }

    public String getWebSocketUrl() {
        String wsUrl = url.replace("https://", "wss://").replace("http://", "ws://");
        if (!wsUrl.endsWith("/")) {
            wsUrl += "/";
        }
        return wsUrl + "websocket";
    }

    // JSON serialization
    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        try {
            json.put("id", id);
            json.put("sessionId", sessionId);
            json.put("displayName", displayName);
            json.put("groupId", groupId);
            json.put("url", url);
            json.put("status", status.name());
            json.put("createdAt", createdAt);
            json.put("lastConnectedAt", lastConnectedAt);
            json.put("lastHeartbeatAt", lastHeartbeatAt);
            json.put("heartbeatIntervalSeconds", heartbeatIntervalSeconds);
            json.put("isAutoReconnect", isAutoReconnect);
            json.put("isFocused", isFocused);
            json.put("windowX", windowX);
            json.put("windowY", windowY);
            json.put("windowWidth", windowWidth);
            json.put("windowHeight", windowHeight);
            json.put("isFloating", isFloating);
        } catch (Exception e) {
            // Ignore
        }
        return json;
    }

    public static KilosSession fromJson(JSONObject json) {
        KilosSession session = new KilosSession();
        try {
            session.id = json.optString("id", UUID.randomUUID().toString());
            session.sessionId = json.optString("sessionId", "");
            session.displayName = json.optString("displayName", "");
            session.groupId = json.optString("groupId", "default");
            session.url = json.optString("url", "https://app.kilo.ai/cloud/chat?sessionId=");
            session.status = SessionStatus.valueOf(json.optString("status", "DISCONNECTED"));
            session.createdAt = json.optLong("createdAt", System.currentTimeMillis());
            session.lastConnectedAt = json.optLong("lastConnectedAt", 0);
            session.lastHeartbeatAt = json.optLong("lastHeartbeatAt", 0);
            session.heartbeatIntervalSeconds = json.optInt("heartbeatIntervalSeconds", 30);
            session.isAutoReconnect = json.optBoolean("isAutoReconnect", true);
            session.isFocused = json.optBoolean("isFocused", false);
            session.windowX = (float) json.optDouble("windowX", 0);
            session.windowY = (float) json.optDouble("windowY", 0);
            session.windowWidth = json.optInt("windowWidth", 800);
            session.windowHeight = json.optInt("windowHeight", 600);
            session.isFloating = json.optBoolean("isFloating", true);
        } catch (Exception e) {
            // Ignore
        }
        return session;
    }

    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getSessionId() { return sessionId; }
    public void setSessionId(String sessionId) { this.sessionId = sessionId; }

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