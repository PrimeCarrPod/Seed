package com.carrpod.vertebrae

import android.app.Application
import android.content.Context
import com.carrpod.vertebrae.service.VertebraeCoreService
import com.carrpod.vertebrae.storage.SessionStorage
import com.carrpod.vertebrae.network.WebSocketManager
import com.carrpod.vertebrae.comm.SessionCommunicator

class VertebraeApplication : Application() {

    companion object {
        lateinit var instance: VertebraeApplication
            private set
    }

    override fun onCreate() {
        super.onCreate()
        instance = this

        SessionStorage.initialize(this)
        WebSocketManager.initialize(this)
        SessionCommunicator.initialize(this)

        startCoreServices()
    }

    private fun startCoreServices() {
        val intent = android.content.Intent(this, VertebraeCoreService::class.java)
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            startForegroundService(intent)
        } else {
            startService(intent)
        }
    }
}