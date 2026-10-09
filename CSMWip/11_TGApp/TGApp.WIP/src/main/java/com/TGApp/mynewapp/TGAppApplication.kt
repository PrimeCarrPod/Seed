package com.TGApp.mynewapp

import android.app.Application
import android.util.Log
import android.webkit.WebView

class TGAppApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        
        // Enable WebView debugging for development
        WebView.setWebContentsDebuggingEnabled(true)
        
        Log.d("TGApp", "TGApp Application started")
    }
}