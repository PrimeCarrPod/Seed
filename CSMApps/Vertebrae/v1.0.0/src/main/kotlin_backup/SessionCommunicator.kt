package com.carrpod.vertebrae.comm

import android.content.Context
import android.net.LocalSocket
import android.net.LocalSocketAddress
import android.util.Log
import com.carrpod.vertebrae.model.InterSessionMessage
import com.carrpod.vertebrae.model.KilosSession
import com.carrpod.vertebrae.storage.SessionStorageManager
import kotlinx.coroutines.*
import java.io.*

class SessionCommunicator private constructor(private val context: Context) {

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val storage = SessionStorageManager.getInstance()
    private var socket: LocalSocket? = null
    private var output: BufferedWriter? = null
    private var input: BufferedReader? = null
    private val sessionId = "vertebrae_${System.currentTimeMillis()}"
    private val listeners = mutableListOf<MessageListener>()
    private var isConnected = false

    interface MessageListener {
        fun onMessage(message: InterSessionMessage)
        fun onConnected()
        fun onDisconnected()
        fun onError(error: String)
    }

    fun addListener(listener: MessageListener) {
        listeners.add(listener)
    }

    fun removeListener(listener: MessageListener) {
        listeners.remove(listener)
    }

    fun connect() {
        if (isConnected) return
        scope.launch {
            try {
                socket = LocalSocket()
                socket?.connect(LocalSocketAddress(InterSessionServer.SOCKET_NAME, LocalSocketAddress.Namespace.RESERVED))
                output = BufferedWriter(OutputStreamWriter(socket!!.outputStream))
                input = BufferedReader(InputStreamReader(socket!!.inputStream))

                // Register this session
                output!!.write("REGISTER:$sessionId\n")
                output!!.flush()

                isConnected = true
                scope.launch(Dispatchers.Main) { listeners.forEach { it.onConnected() } }

                // Read loop
                while (isConnected) {
                    val line = input?.readLine() ?: break
                    if (line.isNotEmpty()) {
                        val msg = com.google.gson.Gson().fromJson(line, InterSessionMessage::class.java)
                        msg?.let { scope.launch(Dispatchers.Main) { listeners.forEach { it.onMessage(it) } } }
                    }
                }
            } catch (e: Exception) {
                Log.e("SessionComm", "Connection error", e)
                scope.launch(Dispatchers.Main) { listeners.forEach { it.onError(e.message ?: "Connection error") } }
            } finally {
                disconnect()
            }
        }
    }

    fun send(message: InterSessionMessage) {
        if (!isConnected) return
        scope.launch(Dispatchers.IO) {
            try {
                output?.write(com.google.gson.Gson().toJson(message))
                output?.newLine()
                output?.flush()
            } catch (e: Exception) {
                Log.e("SessionComm", "Send failed", e)
            }
        }
    }

    fun sendText(toSessionId: String?, groupId: String, text: String) {
        val msg = InterSessionMessage(
            fromSessionId = sessionId,
            toSessionId = toSessionId,
            groupId = groupId,
            type = InterSessionMessage.MessageType.TEXT,
            payload = text,
        )
        send(msg)
    }

    fun sendCommand(toSessionId: String?, groupId: String, command: String, params: Map<String, String>) {
        val payload = com.google.gson.Gson().toJson(mapOf("command" to command, "params" to params))
        val msg = InterSessionMessage(
            fromSessionId = sessionId,
            toSessionId = toSessionId,
            groupId = groupId,
            type = InterSessionMessage.MessageType.COMMAND,
            payload = payload,
        )
        send(msg)
    }

    fun sendFile(groupId: String, file: java.io.File, toSessionId: String? = null) {
        scope.launch(Dispatchers.IO) {
            try {
                val hash = file.digest("SHA-256").joinToString("") { "%02x".format(it) }
                val attachment = InterSessionMessage.FileAttachment(
                    name = file.name,
                    path = file.absolutePath,
                    size = file.length(),
                    mimeType = context.contentResolver.getType(android.net.Uri.fromFile(file)) ?: "application/octet-stream",
                    hash = hash,
                )
                // Copy to shared storage
                val stored = storage.saveReceivedFile(groupId, file.name, file.inputStream()).await()

                val msg = InterSessionMessage(
                    fromSessionId = sessionId,
                    toSessionId = toSessionId,
                    groupId = groupId,
                    type = InterSessionMessage.MessageType.FILE_TRANSFER,
                    payload = com.google.gson.Gson().toJson(attachment),
                    fileAttachment = attachment,
                )
                send(msg)
            } catch (e: Exception) {
                Log.e("SessionComm", "File send failed", e)
            }
        }
    }

    fun requestFile(groupId: String, fileName: String, fromSessionId: String?) {
        val msg = InterSessionMessage(
            fromSessionId = sessionId,
            toSessionId = fromSessionId,
            groupId = groupId,
            type = InterSessionMessage.MessageType.FILE_REQUEST,
            payload = fileName,
        )
        send(msg)
    }

    fun sendHeartbeat(groupId: String, session: KilosSession) {
        val msg = InterSessionMessage(
            fromSessionId = sessionId,
            toSessionId = null,
            groupId = groupId,
            type = InterSessionMessage.MessageType.HEARTBEAT,
            payload = com.google.gson.Gson().toJson(SessionHeartbeat(
                sessionId = session.id,
                status = session.status,
                isFocused = session.isFocused,
            )),
        )
        send(msg)
    }

    fun sendFocusChange(groupId: String, sessionId: String, isFocused: Boolean) {
        val msg = InterSessionMessage(
            fromSessionId = sessionId,
            toSessionId = null,
            groupId = groupId,
            type = InterSessionMessage.MessageType.FOCUS_CHANGE,
            payload = com.google.gson.Gson().toJson(mapOf("focused" to isFocused)),
        )
        send(msg)
    }

    fun sendWindowState(groupId: String, sessionId: String, state: WindowState) {
        val msg = InterSessionMessage(
            fromSessionId = sessionId,
            toSessionId = null,
            groupId = groupId,
            type = InterSessionMessage.MessageType.WINDOW_STATE,
            payload = com.google.gson.Gson().toJson(state),
        )
        send(msg)
    }

    fun disconnect() {
        isConnected = false
        try { input?.close() } catch (e: Exception) {}
        try { output?.close() } catch (e: Exception) {}
        try { socket?.close() } catch (e: Exception) {}
        scope.launch(Dispatchers.Main) { listeners.forEach { it.onDisconnected() } }
    }

    fun destroy() {
        disconnect()
        scope.cancel()
    }

    companion object {
        private var INSTANCE: SessionCommunicator? = null
        fun initialize(context: Context) {
            INSTANCE = SessionCommunicator(context.applicationContext)
        }
        fun getInstance(): SessionCommunicator = INSTANCE!!
    }
}