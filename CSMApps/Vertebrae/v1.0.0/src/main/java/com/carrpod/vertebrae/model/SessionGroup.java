package com.carrpod.vertebrae.model;

import android.os.Parcel;
import android.os.Parcelable;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class SessionGroup implements Parcelable, Serializable {

    private String id;
    private String name;
    private String description;
    private int color;
    private long createdAt;
    private long updatedAt;
    private List<String> sessionIds;
    private String storagePath;
    private boolean expanded;
    private int sortOrder;

    public SessionGroup() {
        this.id = UUID.randomUUID().toString();
        this.name = "Default Group";
        this.description = "";
        this.color = 0xFF74B9FF;
        this.createdAt = System.currentTimeMillis();
        this.updatedAt = System.currentTimeMillis();
        this.sessionIds = new ArrayList<>();
        this.storagePath = "";
        this.expanded = true;
        this.sortOrder = 0;
    }

    public SessionGroup(String name) {
        this();
        this.name = name;
    }

    public SessionGroup(String id, String name, int color) {
        this(name);
        this.id = id;
        this.color = color;
    }

    protected SessionGroup(Parcel in) {
        id = in.readString();
        name = in.readString();
        description = in.readString();
        color = in.readInt();
        createdAt = in.readLong();
        updatedAt = in.readLong();
        sessionIds = new ArrayList<>();
        in.readStringList(sessionIds);
        storagePath = in.readString();
        expanded = in.readByte() != 0;
        sortOrder = in.readInt();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(id);
        dest.writeString(name);
        dest.writeString(description);
        dest.writeInt(color);
        dest.writeLong(createdAt);
        dest.writeLong(updatedAt);
        dest.writeStringList(sessionIds);
        dest.writeString(storagePath);
        dest.writeByte((byte) (expanded ? 1 : 0));
        dest.writeInt(sortOrder);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<SessionGroup> CREATOR = new Creator<SessionGroup>() {
        @Override
        public SessionGroup createFromParcel(Parcel in) {
            return new SessionGroup(in);
        }

        @Override
        public SessionGroup[] newArray(int size) {
            return new SessionGroup[size];
        }
    };

    // Copy with modifications
    public SessionGroup copyWith(
            String name,
            String description,
            Integer color,
            List<String> sessionIds,
            String storagePath,
            Boolean expanded,
            Integer sortOrder
    ) {
        SessionGroup copy = new SessionGroup();
        copy.id = this.id;
        copy.name = name != null ? name : this.name;
        copy.description = description != null ? description : this.description;
        copy.color = color != null ? color : this.color;
        copy.createdAt = this.createdAt;
        copy.updatedAt = System.currentTimeMillis();
        copy.sessionIds = sessionIds != null ? new ArrayList<>(sessionIds) : new ArrayList<>(this.sessionIds);
        copy.storagePath = storagePath != null ? storagePath : this.storagePath;
        copy.expanded = expanded != null ? expanded : this.expanded;
        copy.sortOrder = sortOrder != null ? sortOrder : this.sortOrder;
        return copy;
    }

    public void addSessionId(String sessionId) {
        if (!sessionIds.contains(sessionId)) {
            sessionIds.add(sessionId);
            updatedAt = System.currentTimeMillis();
        }
    }

    public void removeSessionId(String sessionId) {
        sessionIds.remove(sessionId);
        updatedAt = System.currentTimeMillis();
    }

    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; updatedAt = System.currentTimeMillis(); }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; updatedAt = System.currentTimeMillis(); }

    public int getColor() { return color; }
    public void setColor(int color) { this.color = color; updatedAt = System.currentTimeMillis(); }

    public long getCreatedAt() { return createdAt; }
    public void setCreatedAt(long createdAt) { this.createdAt = createdAt; }

    public long getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(long updatedAt) { this.updatedAt = updatedAt; }

    public List<String> getSessionIds() { return sessionIds; }
    public void setSessionIds(List<String> sessionIds) { this.sessionIds = sessionIds; updatedAt = System.currentTimeMillis(); }

    public String getStoragePath() { return storagePath; }
    public void setStoragePath(String storagePath) { this.storagePath = storagePath; updatedAt = System.currentTimeMillis(); }

    public boolean isExpanded() { return expanded; }
    public void setExpanded(boolean expanded) { this.expanded = expanded; updatedAt = System.currentTimeMillis(); }

    public int getSortOrder() { return sortOrder; }
    public void setSortOrder(int sortOrder) { this.sortOrder = sortOrder; updatedAt = System.currentTimeMillis(); }
}