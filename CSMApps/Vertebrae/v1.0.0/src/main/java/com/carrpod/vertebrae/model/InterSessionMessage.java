package com.carrpod.vertebrae.model;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONObject;

import java.io.Serializable;
import java.util.UUID;

public class InterSessionMessage implements Parcelable, Serializable {

    public enum MessageType {
        TEXT, COMMAND, FILE_TRANSFER, FILE_REQUEST, HEARTBEAT, SESSION_STATUS,
        FOCUS_CHANGE, WINDOW_STATE, BROADCAST, PING, PONG
    }

    private String id;
    private String fromSessionId;
    private String toSessionId;
    private String groupId;
    private MessageType type;
    private String payload;
    private long timestamp;
    private FileAttachment fileAttachment;
    private boolean requiresAck;
    private String ackId;

    public InterSessionMessage() {
        this.id = UUID.randomUUID().toString();
        this.fromSessionId = "";
        this.toSessionId = null;
        this.groupId = "default";
        this.type = MessageType.TEXT;
        this.payload = "";
        this.timestamp = System.currentTimeMillis();
        this.fileAttachment = null;
        this.requiresAck = false;
        this.ackId = null;
    }

    public InterSessionMessage(String fromSessionId, String toSessionId, String groupId,
                               MessageType type, String payload) {
        this();
        this.fromSessionId = fromSessionId;
        this.toSessionId = toSessionId;
        this.groupId = groupId;
        this.type = type;
        this.payload = payload;
    }

    protected InterSessionMessage(Parcel in) {
        id = in.readString();
        fromSessionId = in.readString();
        toSessionId = in.readString();
        groupId = in.readString();
        type = MessageType.valueOf(in.readString());
        payload = in.readString();
        timestamp = in.readLong();
        fileAttachment = in.readByte() != 0 ? in.readParcelable(FileAttachment.class.getClassLoader()) : null;
        requiresAck = in.readByte() != 0;
        ackId = in.readString();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(id);
        dest.writeString(fromSessionId);
        dest.writeString(toSessionId);
        dest.writeString(groupId);
        dest.writeString(type.name());
        dest.writeString(payload);
        dest.writeLong(timestamp);
        if (fileAttachment != null) {
            dest.writeByte((byte) 1);
            dest.writeParcelable(fileAttachment, flags);
        } else {
            dest.writeByte((byte) 0);
        }
        dest.writeByte((byte) (requiresAck ? 1 : 0));
        dest.writeString(ackId);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<InterSessionMessage> CREATOR = new Creator<InterSessionMessage>() {
        @Override
        public InterSessionMessage createFromParcel(Parcel in) {
            return new InterSessionMessage(in);
        }

        @Override
        public InterSessionMessage[] newArray(int size) {
            return new InterSessionMessage[size];
        }
    };

    public static class FileAttachment implements Parcelable, Serializable {
        private String name;
        private String path;
        private long size;
        private String mimeType;
        private String hash;

        public FileAttachment() {}

        public FileAttachment(String name, String path, long size, String mimeType, String hash) {
            this.name = name;
            this.path = path;
            this.size = size;
            this.mimeType = mimeType;
            this.hash = hash;
        }

        protected FileAttachment(Parcel in) {
            name = in.readString();
            path = in.readString();
            size = in.readLong();
            mimeType = in.readString();
            hash = in.readString();
        }

        @Override
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(name);
            dest.writeString(path);
            dest.writeLong(size);
            dest.writeString(mimeType);
            dest.writeString(hash);
        }

        @Override
        public int describeContents() {
            return 0;
        }

        public static final Creator<FileAttachment> CREATOR = new Creator<FileAttachment>() {
            @Override
            public FileAttachment createFromParcel(Parcel in) {
                return new FileAttachment(in);
            }

            @Override
            public FileAttachment[] newArray(int size) {
                return new FileAttachment[size];
            }
        };

        // JSON serialization
        public JSONObject toJson() {
            JSONObject json = new JSONObject();
            try {
                json.put("name", name);
                json.put("path", path);
                json.put("size", size);
                json.put("mimeType", mimeType);
                json.put("hash", hash);
            } catch (Exception e) {
                // Ignore
            }
            return json;
        }

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getPath() { return path; }
        public void setPath(String path) { this.path = path; }
        public long getSize() { return size; }
        public void setSize(long size) { this.size = size; }
        public String getMimeType() { return mimeType; }
        public void setMimeType(String mimeType) { this.mimeType = mimeType; }
        public String getHash() { return hash; }
        public void setHash(String hash) { this.hash = hash; }
    }

    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getFromSessionId() { return fromSessionId; }
    public void setFromSessionId(String fromSessionId) { this.fromSessionId = fromSessionId; }

    public String getToSessionId() { return toSessionId; }
    public void setToSessionId(String toSessionId) { this.toSessionId = toSessionId; }

    public String getGroupId() { return groupId; }
    public void setGroupId(String groupId) { this.groupId = groupId; }

    public MessageType getType() { return type; }
    public void setType(MessageType type) { this.type = type; }

    public String getPayload() { return payload; }
    public void setPayload(String payload) { this.payload = payload; }

    public long getTimestamp() { return timestamp; }
    public void setTimestamp(long timestamp) { this.timestamp = timestamp; }

    public FileAttachment getFileAttachment() { return fileAttachment; }
    public void setFileAttachment(FileAttachment fileAttachment) { this.fileAttachment = fileAttachment; }

    public boolean isRequiresAck() { return requiresAck; }
    public void setRequiresAck(boolean requiresAck) { this.requiresAck = requiresAck; }

    public String getAckId() { return ackId; }
    public void setAckId(String ackId) { this.ackId = ackId; }

    public boolean isForSession(String sessionId) {
        return toSessionId == null || toSessionId.equals(sessionId);
    }

    // JSON serialization
    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        try {
            json.put("id", id);
            json.put("fromSessionId", fromSessionId);
            json.put("toSessionId", toSessionId);
            json.put("groupId", groupId);
            json.put("type", type.name());
            json.put("payload", payload);
            json.put("timestamp", timestamp);
            json.put("requiresAck", requiresAck);
            json.put("ackId", ackId);
        } catch (Exception e) {
            // Ignore
        }
        return json;
    }

    public static InterSessionMessage fromJson(JSONObject json) {
        InterSessionMessage msg = new InterSessionMessage();
        try {
            msg.id = json.optString("id", UUID.randomUUID().toString());
            msg.fromSessionId = json.optString("fromSessionId", "");
            msg.toSessionId = json.optString("toSessionId", null);
            msg.groupId = json.optString("groupId", "default");
            msg.type = MessageType.valueOf(json.optString("type", "TEXT"));
            msg.payload = json.optString("payload", "");
            msg.timestamp = json.optLong("timestamp", System.currentTimeMillis());
            msg.requiresAck = json.optBoolean("requiresAck", false);
            msg.ackId = json.optString("ackId", null);
        } catch (Exception e) {
            // Ignore
        }
        return msg;
    }
}