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
import com.carrpod.vertebrae.comm.SessionCommunicator
import com.carrpod.vertebrae.model.KilosSession
import com.carrpod.vertebrae.network.WebSocketManager
import com.carrpod.vertebrae.storage.SessionStorageManager

class SessionManagerService : Service() {

    private lateinit var storage: SessionStorageManager
    private lateinit var wsManager: WebSocketManager
    private lateinit var comm: SessionCommunicator
    private val handler = Handler(Looper.getMainLooper())
    private var reconnectRunnable: Runnable? = null

    override fun onCreate() {
        super.onCreate()
        storage = SessionStorageManager(this)
        wsManager = WebSocketManager.getInstance()
        comm = SessionCommunicator.getInstance()

        createNotificationChannel()
        startForegroundService()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                "vertebrae_sessions",
                getString(R.string.notification_channel_name),
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = getString(R.string.notification_channel_desc)
                setShowBadge(false)
            }
            getSystemService(NotificationManager::class.java).createNotificationChannel(channel)
        }
    }

    private fun startForegroundService() {
        val notification = NotificationCompat.Builder(this, "vertebrae_sessions")
            .setContentTitle(getString(R.string.app_name))
            .setContentText(getString(R.string.service_running))
            .setSmallIcon(R.drawable.ic_vertebrae_foreground)
            .setOngoing(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setCategory(NotificationCompat.CATEGORY_SERVICE)
            .build()

        startForeground(1001, notification)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        restoreSessions()
        return START_STICKY
    }

    private fun restoreSessions() {
        val sessions = storage.loadAllSessions()
        val settings = storage.loadSettings()

        sessions.forEach { session ->
            if (session.isAutoReconnect && session.status != KilosSession.SessionStatus.DISCONNECTED) {
                reconnectSession(session)
            }
        }

        // Start periodic check
        reconnectRunnable = object : Runnable {
            override fun run() {
                checkSessions()
                handler.postDelayed(this, 30000) // 30 seconds
            }
        }
        handler.post(reconnectRunnable!!)
    }

    private fun checkSessions() {
        val sessions = storage.loadAllSessions()
        sessions.forEach { session ->
            when (session.status) {
                KilosSession.SessionStatus.CONNECTED,
                KilosSession.SessionStatus.HEARTBEAT_ACTIVE -> {
                    // Check if heartbeat is stale
                    if (System.currentTimeMillis() - session.lastHeartbeatAt > session.heartbeatIntervalSeconds * 2000L) {
                        wsManager.reconnectSession(session.id)
                    }
                }
                KilosSession.SessionStatus.HEARTBEAT_FAILED,
                KilosSession.SessionStatus.ERROR -> {
                    if (session.isAutoReconnect) {
                        reconnectSession(session)
                    }
                }
            }
        }
    }

    private fun reconnectSession(session: KilosSession) {
        val updated = session.copyWith(status = KilosSession.SessionStatus.RECONNECTING)
        storage.saveSession(updated)
        wsManager.connectSession(updated)
    }

    fun connectSession(session: KilosSession) {
        wsManager.connectSession(session)
    }

    fun disconnectSession(sessionId: String) {
        wsManager.disconnectSession(sessionId)
    }

    fun updateSession(session: KilosSession) {
        storage.saveSession(session)
    }

    override fun onDestroy() {
        super.onDestroy()
        reconnectRunnable?.let { handler.removeCallbacks(it) }
        wsManager.disconnectAll()
    }

    override fun onBind(intent: Intent?): IBinder? = null
}