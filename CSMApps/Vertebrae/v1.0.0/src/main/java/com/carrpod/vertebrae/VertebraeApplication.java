package com.carrpod.vertebrae;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

public class VertebraeApplication extends Application {

    private static VertebraeApplication instance;

    public static VertebraeApplication getInstance() {
        return instance;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;

        // Initialize core services
        startCoreServices();
    }

    private void startCoreServices() {
        Intent sessionManagerIntent = new Intent(this, SessionManagerService.class);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(sessionManagerIntent);
        } else {
            startService(sessionManagerIntent);
        }

        Intent heartbeatIntent = new Intent(this, HeartbeatService.class);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(heartbeatIntent);
        } else {
            startService(heartbeatIntent);
        }

        Intent floatingIntent = new Intent(this, FloatingWindowService.class);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(floatingIntent);
        } else {
            startService(floatingIntent);
        }

        Intent interSessionIntent = new Intent(this, InterSessionServer.class);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(interSessionIntent);
        } else {
            startService(interSessionIntent);
        }
    }
}