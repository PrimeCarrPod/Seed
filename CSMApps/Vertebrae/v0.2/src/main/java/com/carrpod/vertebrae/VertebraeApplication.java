package com.carrpod.vertebrae;

import android.app.Application;

import com.carrpod.vertebrae.storage.SessionStorageManager;

public class VertebraeApplication extends Application {

    private static VertebraeApplication instance;

    public static VertebraeApplication getInstance() {
        return instance;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;

        SessionStorageManager.initialize(this);
    }
}