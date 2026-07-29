package com.carrpod.vertebrae.model;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONObject;

import java.io.Serializable;

public class WindowState implements Parcelable, Serializable {

    private float x;
    private float y;
    private int width;
    private int height;
    private boolean isVisible;
    private boolean isFocused;
    private int zOrder;

    public WindowState() {
        this.x = 0;
        this.y = 0;
        this.width = 800;
        this.height = 600;
        this.isVisible = true;
        this.isFocused = false;
        this.zOrder = 0;
    }

    public WindowState(float x, float y, int width, int height, boolean isVisible, boolean isFocused, int zOrder) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.isVisible = isVisible;
        this.isFocused = isFocused;
        this.zOrder = zOrder;
    }

    protected WindowState(Parcel in) {
        x = in.readFloat();
        y = in.readFloat();
        width = in.readInt();
        height = in.readInt();
        isVisible = in.readByte() != 0;
        isFocused = in.readByte() != 0;
        zOrder = in.readInt();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeFloat(x);
        dest.writeFloat(y);
        dest.writeInt(width);
        dest.writeInt(height);
        dest.writeByte((byte) (isVisible ? 1 : 0));
        dest.writeByte((byte) (isFocused ? 1 : 0));
        dest.writeInt(zOrder);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<WindowState> CREATOR = new Creator<WindowState>() {
        @Override
        public WindowState createFromParcel(Parcel in) {
            return new WindowState(in);
        }

        @Override
        public WindowState[] newArray(int size) {
            return new WindowState[size];
        }
    };

    public float getX() { return x; }
    public void setX(float x) { this.x = x; }

    public float getY() { return y; }
    public void setY(float y) { this.y = y; }

    public int getWidth() { return width; }
    public void setWidth(int width) { this.width = width; }

    public int getHeight() { return height; }
    public void setHeight(int height) { this.height = height; }

    public boolean isVisible() { return isVisible; }
    public void setVisible(boolean visible) { isVisible = visible; }

    public boolean isFocused() { return isFocused; }
    public void setFocused(boolean focused) { isFocused = focused; }

    public int getZOrder() { return zOrder; }
    public void setZOrder(int zOrder) { this.zOrder = zOrder; }

    // JSON deserialization
    public static WindowState fromJson(JSONObject json) {
        WindowState ws = new WindowState();
        try {
            ws.x = (float) json.optDouble("x", 0);
            ws.y = (float) json.optDouble("y", 0);
            ws.width = json.optInt("width", 800);
            ws.height = json.optInt("height", 600);
            ws.isVisible = json.optBoolean("isVisible", true);
            ws.isFocused = json.optBoolean("isFocused", false);
            ws.zOrder = json.optInt("zOrder", 0);
        } catch (Exception e) {}
        return ws;
    }

    // JSON serialization
    public JSONObject toJson() {
        JSONObject json = new JSONObject();
        try {
            json.put("x", x);
            json.put("y", y);
            json.put("width", width);
            json.put("height", height);
            json.put("isVisible", isVisible);
            json.put("isFocused", isFocused);
            json.put("zOrder", zOrder);
        } catch (Exception e) {
            // Ignore
        }
        return json;
    }
}