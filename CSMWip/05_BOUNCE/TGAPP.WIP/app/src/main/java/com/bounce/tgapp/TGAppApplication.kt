package com.bounce.tgapp

import android.app.Application
import com.google.firebase.ktx.Firebase

class TGAppApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        Firebase.initializeApp(this)
    }
}