package com.carrpod.vertebrae;

import android.app.Application;

import com.carrpod.vertebrae.storage.SessionStorageManager;
import com.carrpod.vertebrae.network.WebSocketManager;
import com.carrpod.vertebrae.comm.SessionCommunicator;

public class VertebraeApplication extends Application {

    private static VertebraeApplication instance;

    public static VertebraeApplication getInstance() {
        return instance;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;

        // Initialize managers only - DO NOT start services here
        // Services are started from SplashActivity after permissions granted
        SessionStorageManager.initialize(this);
        WebSocketManager.initialize(this);
        SessionCommunicator.initialize(this);
    }
}