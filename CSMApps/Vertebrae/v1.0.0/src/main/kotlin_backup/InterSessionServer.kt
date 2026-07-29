package com.carrpod.vertebrae.service

import android.app.Service
import android.content.Intent
import android.net.LocalServerSocket
import android.net.LocalSocket
import android.os.IBinder
import android.util.Log
import com.carrpod.vertebrae.model.InterSessionMessage
import com.carrpod.vertebrae.model.KilosSession
import com.carrpod.vertebrae.storage.SessionStorageManager
import kotlinx.coroutines.*
import kotlinx.coroutines.channels.Channel
import java.io.*

class InterSessionServer : Service() {

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val storage = SessionStorageManager.getInstance()
    private val messageChannel = Channel<InterSessionMessage>(Channel.UNLIMITED)
    private var serverSocket: LocalServerSocket? = null
    private val clientSockets = mutableMapOf<String, LocalSocket>()

    override fun onCreate() {
        super.onCreate()
        startServer()
        startMessageProcessor()
    }

    private fun startServer() {
        scope.launch {
            try {
                serverSocket = LocalServerSocket("vertebrae_intersession")
                Log.d("InterSession", "Server started on vertebrae_intersession")
                while (!scope.coroutineContext[Job]?.isCancelled == true) {
                    val client = serverSocket?.accept() ?: break
                    handleClient(client)
                }
            } catch (e: Exception) {
                Log.e("InterSession", "Server error", e)
            }
        }
    }

    private fun handleClient(socket: LocalSocket) {
        scope.launch(Dispatchers.IO) {
            val input = BufferedReader(InputStreamReader(socket.inputStream))
            val output = BufferedWriter(OutputStreamWriter(socket.outputStream))
            var sessionId: String? = null

            try {
                while (true) {
                    val line = input.readLine() ?: break
                    if (line.isEmpty()) continue

                    if (sessionId == null) {
                        // First message should be registration
                        sessionId = line.trim()
                        if (sessionId.startsWith("REGISTER:")) {
                            sessionId = sessionId.substringAfter("REGISTER:")
                            clientSockets[sessionId] = socket
                            Log.d("InterSession", "Client registered: $sessionId")
                            // Send pending messages
                            sendPendingMessages(sessionId!!, output)
                        }
                        continue
                    }

                    // Parse message
                    val message = com.google.gson.Gson().fromJson(line, InterSessionMessage::class.java)
                    if (message != null) {
                        if (message.requiresAck) {
                            // Store for delivery confirmation
                        }
                        // Deliver to target
                        deliverMessage(message, output)
                    }
                }
            } catch (e: Exception) {
                Log.e("InterSession", "Client error", e)
            } finally {
                sessionId?.let { clientSockets.remove(it) }
                try { socket.close() } catch (e: Exception) {}
            }
        }
    }

    private fun deliverMessage(message: InterSessionMessage, senderOutput: BufferedWriter) {
        scope.launch(Dispatchers.IO) {
            // Store message for offline delivery
            storage.saveMessage(message).await()

            // Try immediate delivery if target is online
            message.toSessionId?.let { targetId ->
                clientSockets[targetId]?.let { targetSocket ->
                    try {
                        val output = BufferedWriter(OutputStreamWriter(targetSocket.outputStream))
                        output.write(com.google.gson.Gson().toJson(message))
                        output.newLine()
                        output.flush()
                    } catch (e: Exception) {
                        Log.e("InterSession", "Delivery failed to $targetId", e)
                    }
                }
            } ?: run {
                // Broadcast to all in group except sender
                clientSockets.forEach { (sid, socket) ->
                    if (sid != message.fromSessionId) {
                        try {
                            val output = BufferedWriter(OutputStreamWriter(socket.outputStream))
                            output.write(com.google.gson.Gson().toJson(message))
                            output.newLine()
                            output.flush()
                        } catch (e: Exception) {}
                    }
                }
            }
        }
    }

    private fun sendPendingMessages(sessionId: String, output: BufferedWriter) {
        scope.launch(Dispatchers.IO) {
            val sessions = storage.loadAllSessions().await()
            val session = sessions.find { it.id == sessionId }
            session?.let {
                val messages = storage.loadMessages(it.groupId, it.lastHeartbeat).await()
                messages.filter { it.isForSession(sessionId) }.forEach { msg ->
                    try {
                        output.write(com.google.gson.Gson().toJson(msg))
                        output.newLine()
                        output.flush()
                    } catch (e: Exception) {}
                }
            }
        }
    }

    private fun startMessageProcessor() {
        scope.launch {
            for (message in messageChannel) {
                // Process queued messages
            }
        }
    }

    fun sendMessage(message: InterSessionMessage) {
        messageChannel.trySend(message)
    }

    fun sendToSession(sessionId: String, message: InterSessionMessage) {
        clientSockets[sessionId]?.let { socket ->
            scope.launch(Dispatchers.IO) {
                try {
                    val output = BufferedWriter(OutputStreamWriter(socket.outputStream))
                    output.write(com.google.gson.Gson().toJson(message))
                    output.newLine()
                    output.flush()
                } catch (e: Exception) {
                    Log.e("InterSession", "Send failed to $sessionId", e)
                }
            }
        }
    }

    override fun onDestroy() {
        scope.cancel()
        serverSocket?.close()
        clientSockets.values.forEach { try { it.close() } catch (e: Exception) {} }
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    companion object {
        const val SOCKET_NAME = "vertebrae_intersession"
    }
}