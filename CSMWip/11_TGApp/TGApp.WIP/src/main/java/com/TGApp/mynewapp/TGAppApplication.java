package com.TGApp.mynewapp;

import android.app.Application;
import android.util.Log;
import android.webkit.WebView;

public class TGAppApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        
        WebView.setWebContentsDebuggingEnabled(true);
        
        Log.d("TGApp", "TGApp Application started");
    }
}
