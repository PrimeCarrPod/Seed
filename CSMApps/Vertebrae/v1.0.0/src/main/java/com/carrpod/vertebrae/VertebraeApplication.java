package com.carrpod.vertebrae;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

import com.carrpod.vertebrae.service.SessionManagerService;
import com.carrpod.vertebrae.service.HeartbeatService;
import com.carrpod.vertebrae.service.FloatingWindowService;
import com.carrpod.vertebrae.comm.InterSessionServer;
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

        SessionStorageManager.initialize(this);
        WebSocketManager.initialize(this);
        SessionCommunicator.initialize(this);
        
        // Services started from SplashActivity after permissions
    }
}