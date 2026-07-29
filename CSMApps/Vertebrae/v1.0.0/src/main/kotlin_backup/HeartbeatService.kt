package com.carrpod.vertebrae.service

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.util.Log
import androidx.core.app.NotificationCompat
import com.carrpod.vertebrae.R
import com.carrpod.vertebrae.model.KilosSession
import com.carrpod.vertebrae.network.WebSocketManager
import com.carrpod.vertebrae.storage.SessionStorageManager

class HeartbeatService : Service() {

    private lateinit var storage: SessionStorageManager
    private lateinit var wsManager: WebSocketManager
    private val handler = Handler(Looper.getMainLooper())
    private var heartbeatRunnable: Runnable? = null
    private val HEARTBEAT_INTERVAL = 15000L // 15 seconds default

    override fun onCreate() {
        super.onCreate()
        storage = SessionStorageManager(this)
        wsManager = WebSocketManager.getInstance()

        createNotificationChannel()
        startForegroundService()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                "vertebrae_heartbeat",
                getString(R.string.heartbeat_channel_name),
                NotificationManager.IMPORTANCE_MIN
            ).apply {
                description = getString(R.string.heartbeat_channel_desc)
                setShowBadge(false)
            }
            getSystemService(NotificationManager::class.java).createNotificationChannel(channel)
        }
    }

    private fun startForegroundService() {
        val notification = NotificationCompat.Builder(this, "vertebrae_heartbeat")
            .setContentTitle(getString(R.string.heartbeat_service_title))
            .setContentText(getString(R.string.heartbeat_service_running))
            .setSmallIcon(R.drawable.ic_vertebrae_foreground)
            .setOngoing(true)
            .setPriority(NotificationCompat.PRIORITY_MIN)
            .setCategory(NotificationCompat.CATEGORY_SERVICE)
            .build()

        startForeground(1002, notification)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        startHeartbeatLoop()
        return START_STICKY
    }

    private fun startHeartbeatLoop() {
        heartbeatRunnable = object : Runnable {
            override fun run() {
                sendHeartbeats()
                handler.postDelayed(this, HEARTBEAT_INTERVAL)
            }
        }
        handler.post(heartbeatRunnable!!)
    }

    private fun sendHeartbeats() {
        val sessions = storage.loadAllSessions()
        sessions.forEach { session ->
            if (session.status == KilosSession.SessionStatus.CONNECTED ||
                session.status == KilosSession.SessionStatus.HEARTBEAT_ACTIVE) {

                wsManager.sendHeartbeat(session.id) { success ->
                    val updated = if (success) {
                        session.copyWith(
                            status = KilosSession.SessionStatus.HEARTBEAT_ACTIVE,
                            lastHeartbeatAt = System.currentTimeMillis()
                        )
                    } else {
                        session.copyWith(
                            status = KilosSession.SessionStatus.HEARTBEAT_FAILED
                        )
                    }
                    storage.saveSession(updated)
                }
            }
        }
    }

    fun forceHeartbeat(sessionId: String) {
        val session = storage.loadSession(sessionId)
        session?.let {
            wsManager.sendHeartbeat(it.id) { success ->
                val updated = if (success) {
                    it.copyWith(
                        status = KilosSession.SessionStatus.HEARTBEAT_ACTIVE,
                        lastHeartbeatAt = System.currentTimeMillis()
                    )
                } else {
                    it.copyWith(status = KilosSession.SessionStatus.HEARTBEAT_FAILED)
                }
                storage.saveSession(updated)
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        heartbeatRunnable?.let { handler.removeCallbacks(it) }
    }

    override fun onBind(intent: Intent?): IBinder? = null
}