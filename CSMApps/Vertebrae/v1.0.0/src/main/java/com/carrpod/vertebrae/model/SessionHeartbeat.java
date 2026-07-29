package com.carrpod.vertebrae.model;

import android.os.Parcel;
import android.os.Parcelable;

import java.io.Serializable;
import java.util.UUID;

public class SessionHeartbeat implements Parcelable, Serializable {

    private String sessionId;
    private long timestamp;
    private KilosSession.SessionStatus status;
    private boolean isFocused;
    private WindowState windowState;

    public SessionHeartbeat() {
        this.sessionId = "";
        this.timestamp = System.currentTimeMillis();
        this.status = KilosSession.SessionStatus.DISCONNECTED;
        this.isFocused = false;
        this.windowState = null;
    }

    public SessionHeartbeat(String sessionId, KilosSession.SessionStatus status, boolean isFocused) {
        this();
        this.sessionId = sessionId;
        this.status = status;
        this.isFocused = isFocused;
    }

    protected SessionHeartbeat(Parcel in) {
        sessionId = in.readString();
        timestamp = in.readLong();
        status = KilosSession.SessionStatus.valueOf(in.readString());
        isFocused = in.readByte() != 0;
        windowState = in.readParcelable(WindowState.class.getClassLoader());
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(sessionId);
        dest.writeLong(timestamp);
        dest.writeString(status.name());
        dest.writeByte((byte) (isFocused ? 1 : 0));
        dest.writeParcelable(windowState, flags);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<SessionHeartbeat> CREATOR = new Creator<SessionHeartbeat>() {
        @Override
        public SessionHeartbeat createFromParcel(Parcel in) {
            return new SessionHeartbeat(in);
        }

        @Override
        public SessionHeartbeat[] newArray(int size) {
            return new SessionHeartbeat[size];
        }
    };

    public String getSessionId() { return sessionId; }
    public void setSessionId(String sessionId) { this.sessionId = sessionId; }

    public long getTimestamp() { return timestamp; }
    public void setTimestamp(long timestamp) { this.timestamp = timestamp; }

    public KilosSession.SessionStatus getStatus() { return status; }
    public void setStatus(KilosSession.SessionStatus status) { this.status = status; }

    public boolean isFocused() { return isFocused; }
    public void setFocused(boolean focused) { isFocused = focused; }

    public WindowState getWindowState() { return windowState; }
    public void setWindowState(WindowState windowState) { this.windowState = windowState; }
}