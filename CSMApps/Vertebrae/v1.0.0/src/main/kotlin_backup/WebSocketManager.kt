package com.carrpod.vertebrae.network

import android.content.Context
import com.carrpod.vertebrae.model.KilosSession
import com.carrpod.vertebrae.storage.SessionStorageManager
import kotlinx.coroutines.*

class WebSocketManager private constructor(private val context: Context) {

    private val storage = SessionStorageManager(context)
    private val sessions = mutableMapOf<String, KilosWebSocketClient>()
    private val job = SupervisorJob()
    private val scope = CoroutineScope(Dispatchers.IO + job)
    private val heartbeatInterval = 30_000L // 30 seconds

    private var heartbeatJob: Job? = null

    fun connectSession(session: KilosSession) {
        val client = KilosWebSocketClient.getOrCreate(session.sessionId, context, object : KilosWebSocketClient.Listener {
            override fun onOpen(sid: String) {
                updateSessionStatus(session.id, KilosSession.SessionStatus.CONNECTED)
            }

            override fun onMessage(sid: String, text: String) {
                // Handle incoming messages from kilo.ai
            }

            override fun onBinaryMessage(sid: String, bytes: ByteArray) {
                // Handle binary messages
            }

            override fun onClosed(sid: String, code: Int, reason: String) {
                updateSessionStatus(session.id, KilosSession.SessionStatus.DISCONNECTED)
            }

            override fun onError(sid: String, error: String) {
                updateSessionStatus(session.id, KilosSession.SessionStatus.ERROR)
            }
        })
        sessions[session.id] = client
        client.connect()
    }

    fun disconnectSession(sessionId: String) {
        sessions.remove(sessionId)?.close()
        KilosWebSocketClient.remove(sessionId)
        updateSessionStatus(sessionId, KilosSession.SessionStatus.DISCONNECTED)
    }

    fun sendToSession(sessionId: String, text: String) {
        sessions[sessionId]?.send(text)
    }

    fun sendToAllSessions(text: String) {
        sessions.values.forEach { it.send(text) }
    }

    fun startHeartbeat() {
        heartbeatJob?.cancel()
        heartbeatJob = scope.launch {
            while (true) {
                delay(heartbeatInterval)
                sessions.values.forEach { it.send("""{"type":"heartbeat","t":${System.currentTimeMillis()}}""") }
            }
        }
    }

    fun stopHeartbeat() {
        heartbeatJob?.cancel()
    }

    fun shutdown() {
        stopHeartbeat()
        sessions.values.forEach { it.close() }
        KilosWebSocketClient.closeAll()
        job.cancel()
    }

    private fun updateSessionStatus(sessionId: String, status: KilosSession.SessionStatus) {
        scope.launch {
            storage.loadSession(sessionId)?.let { session ->
                storage.saveSession(session.copyWith(status = status))
            }
        }
    }

    fun isSessionConnected(sessionId: String): Boolean {
        return sessions[sessionId]?.isConnected() == true
    }

    companion object {
        @Volatile private var INSTANCE: WebSocketManager? = null

        fun initialize(context: Context) {
            if (INSTANCE == null) {
                synchronized(this) {
                    if (INSTANCE == null) {
                        INSTANCE = WebSocketManager(context.applicationContext)
                    }
                }
            }
        }

        fun getInstance(): WebSocketManager {
            return INSTANCE ?: throw IllegalStateException("WebSocketManager not initialized. Call initialize() first.")
        }
    }
}