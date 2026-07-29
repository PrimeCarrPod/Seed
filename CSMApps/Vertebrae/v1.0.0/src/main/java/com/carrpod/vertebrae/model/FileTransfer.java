package com.carrpod.vertebrae.model;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONObject;

import java.io.Serializable;
import java.util.UUID;

public class FileTransfer implements Parcelable, Serializable {

    public enum TransferStatus {
        PENDING, SENDING, RECEIVING, COMPLETED, FAILED, CANCELLED
    }

    private String id;
    private String fromSessionId;
    private String toSessionId;
    private String fileName;
    private String filePath;
    private long fileSize;
    private String mimeType;
    private TransferStatus status;
    private float progress;
    private long startedAt;
    private long completedAt;

    public FileTransfer() {
        this.id = UUID.randomUUID().toString();
        this.fromSessionId = "";
        this.toSessionId = "";
        this.fileName = "";
        this.filePath = "";
        this.fileSize = 0;
        this.mimeType = "";
        this.status = TransferStatus.PENDING;
        this.progress = 0f;
        this.startedAt = System.currentTimeMillis();
        this.completedAt = 0;
    }

    public FileTransfer(String fromSessionId, String toSessionId, String fileName,
                        String filePath, long fileSize, String mimeType) {
        this();
        this.fromSessionId = fromSessionId;
        this.toSessionId = toSessionId;
        this.fileName = fileName;
        this.filePath = filePath;
        this.fileSize = fileSize;
        this.mimeType = mimeType;
    }

    protected FileTransfer(Parcel in) {
        id = in.readString();
        fromSessionId = in.readString();
        toSessionId = in.readString();
        fileName = in.readString();
        filePath = in.readString();
        fileSize = in.readLong();
        mimeType = in.readString();
        status = TransferStatus.valueOf(in.readString());
        progress = in.readFloat();
        startedAt = in.readLong();
        completedAt = in.readLong();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(id);
        dest.writeString(fromSessionId);
        dest.writeString(toSessionId);
        dest.writeString(fileName);
        dest.writeString(filePath);
        dest.writeLong(fileSize);
        dest.writeString(mimeType);
        dest.writeString(status.name());
        dest.writeFloat(progress);
        dest.writeLong(startedAt);
        dest.writeLong(completedAt);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<FileTransfer> CREATOR = new Creator<FileTransfer>() {
        @Override
        public FileTransfer createFromParcel(Parcel in) {
            return new FileTransfer(in);
        }

        @Override
        public FileTransfer[] newArray(int size) {
            return new FileTransfer[size];
        }
    };

    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getFromSessionId() { return fromSessionId; }
    public void setFromSessionId(String fromSessionId) { this.fromSessionId = fromSessionId; }

    public String getToSessionId() { return toSessionId; }
    public void setToSessionId(String toSessionId) { this.toSessionId = toSessionId; }

    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public long getFileSize() { return fileSize; }
    public void setFileSize(long fileSize) { this.fileSize = fileSize; }

    public String getMimeType() { return mimeType; }
    public void setMimeType(String mimeType) { this.mimeType = mimeType; }

    public TransferStatus getStatus() { return status; }
    public void setStatus(TransferStatus status) { this.status = status; }

    public float getProgress() { return progress; }
    public void setProgress(float progress) { this.progress = progress; }

    public long getStartedAt() { return startedAt; }
    public void setStartedAt(long startedAt) { this.startedAt = startedAt; }

    public long getCompletedAt() { return completedAt; }
    public void setCompletedAt(long completedAt) { this.completedAt = completedAt; }

    // JSON serialization
    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        try {
            json.put("id", id);
            json.put("fromSessionId", fromSessionId);
            json.put("toSessionId", toSessionId);
            json.put("fileName", fileName);
            json.put("filePath", filePath);
            json.put("fileSize", fileSize);
            json.put("mimeType", mimeType);
            json.put("status", status.name());
            json.put("progress", progress);
            json.put("startedAt", startedAt);
            json.put("completedAt", completedAt);
        } catch (Exception e) {
            // Ignore
        }
        return json;
    }
}