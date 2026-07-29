package com.carrpod.vertebrae.network

import android.content.Context
import android.util.Log
import okhttp3.*
import okio.ByteString
import java.util.concurrent.TimeUnit

class KilosWebSocketClient private constructor(
    private val sessionId: String,
    private val context: Context,
    private val listener: Listener
) {

    interface Listener {
        fun onOpen(sessionId: String)
        fun onMessage(sessionId: String, text: String)
        fun onBinaryMessage(sessionId: String, bytes: ByteArray)
        fun onClosed(sessionId: String, code: Int, reason: String)
        fun onError(sessionId: String, error: String)
    }

    private var webSocket: WebSocket? = null
    private val client = OkHttpClient.Builder()
        .pingInterval(15, TimeUnit.SECONDS)
        .build()
    private val request = Request.Builder()
        .url("wss://app.kilo.ai/cloud/chat?sessionId=$sessionId")
        .addHeader("User-Agent", "Mozilla/5.0 (Linux; Android 13) Vertebrae/1.0")
        .addHeader("Origin", "https://app.kilo.ai")
        .addHeader("Sec-WebSocket-Protocol", "chat.kilo.ai")
        .build()

    fun connect() {
        webSocket = client.newWebSocket(request, object : WebSocketListener() {
            override fun onOpen(webSocket: WebSocket, response: Response) {
                Log.d("VertebraeWS", "Session $sessionId connected")
                listener.onOpen(sessionId)
            }

            override fun onMessage(webSocket: WebSocket, text: String) {
                listener.onMessage(sessionId, text)
            }

            override fun onMessage(webSocket: WebSocket, bytes: ByteString) {
                listener.onBinaryMessage(sessionId, bytes.toByteArray())
            }

            override fun onClosing(webSocket: WebSocket, code: Int, reason: String) {
                webSocket.close(1000, null)
                listener.onClosed(sessionId, code, reason)
            }

            override fun onClosed(webSocket: WebSocket, code: Int, reason: String) {
                Log.d("VertebraeWS", "Session $sessionId closed: $code - $reason")
                listener.onClosed(sessionId, code, reason)
            }

            override fun onFailure(webSocket: WebSocket, t: Throwable, response: Response?) {
                Log.e("VertebraeWS", "Session $sessionId error: ${t.message}")
                listener.onError(sessionId, t.message ?: "Unknown error")
            }
        })
    }

    fun send(text: String) {
        webSocket?.send(text)
    }

    fun send(bytes: ByteArray) {
        webSocket?.send(ByteString.of(bytes))
    }

    fun close() {
        webSocket?.close(1000, "Client closing")
    }

    fun isConnected(): Boolean {
        return webSocket != null
    }

    companion object {
        private val instances = mutableMapOf<String, KilosWebSocketClient>()

        fun getOrCreate(sessionId: String, context: Context, listener: Listener): KilosWebSocketClient {
            return instances.getOrPut(sessionId) {
                KilosWebSocketClient(sessionId, context.applicationContext, listener)
            }
        }

        fun remove(sessionId: String) {
            instances.remove(sessionId)?.close()
        }

        fun closeAll() {
            instances.values.forEach { it.close() }
            instances.clear()
        }
    }
}