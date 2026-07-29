package com.carrpod.vertebrae.receiver

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import com.carrpod.vertebrae.service.HeartbeatService
import com.carrpod.vertebrae.service.SessionManagerService
import com.carrpod.vertebrae.service.FloatingWindowService

class BootReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == Intent.ACTION_BOOT_COMPLETED ||
            intent.action == Intent.ACTION_QUICKBOOT_POWERON) {
            
            Log.d("VertebraeBoot", "Boot completed, starting services")
            
            // Start core services
            val services = arrayOf(
                SessionManagerService::class.java,
                HeartbeatService::class.java,
                FloatingWindowService::class.java,
            )
            
            services.forEach { service ->
                val serviceIntent = Intent(context, service)
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                    context.startForegroundService(serviceIntent)
                } else {
                    context.startService(serviceIntent)
                }
            }
        }
    }
}