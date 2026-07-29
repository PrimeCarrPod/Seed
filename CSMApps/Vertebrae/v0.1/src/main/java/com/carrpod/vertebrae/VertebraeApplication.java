package com.carrpod.vertebrae;

import android.app.Application;

public class VertebraeApplication extends Application {

    private static VertebraeApplication instance;

    public static VertebraeApplication getInstance() {
        return instance;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
    }
}