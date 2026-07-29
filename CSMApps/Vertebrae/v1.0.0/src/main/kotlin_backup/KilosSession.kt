package com.carrpod.vertebrae.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize
import java.io.Serializable
import java.util.*

@Parcelize
data class KilosSession(
    val id: String = UUID.randomUUID().toString(),
    val sessionId: String,
    val displayName: String = "",
    val groupId: String = "default",
    val url: String = "https://app.kilo.ai/cloud/chat?sessionId=$sessionId",
    val status: SessionStatus = SessionStatus.DISCONNECTED,
    val createdAt: Long = System.currentTimeMillis(),
    val lastConnectedAt: Long = 0,
    val lastHeartbeatAt: Long = 0,
    val heartbeatIntervalSeconds: Int = 30,
    val isAutoReconnect: Boolean = true,
    val isFocused: Boolean = false,
    val windowX: Float = 0f,
    val windowY: Float = 0f,
    val windowWidth: Int = 800,
    val windowHeight: Int = 600,
    val isFloating: Boolean = true,
    val cookies: Map<String, String> = emptyMap(),
    val headers: Map<String, String> = emptyMap(),
) : Parcelable {

    enum class SessionStatus {
        DISCONNECTED,
        CONNECTING,
        CONNECTED,
        HEARTBEAT_ACTIVE,
        HEARTBEAT_FAILED,
        ERROR,
        RECONNECTING
    }

    fun copyWith(
        status: SessionStatus? = null,
        isFocused: Boolean? = null,
        lastHeartbeatAt: Long? = null,
        lastConnectedAt: Long? = null,
        windowX: Float? = null,
        windowY: Float? = null,
        windowWidth: Int? = null,
        windowHeight: Int? = null,
        cookies: Map<String, String>? = null,
        headers: Map<String, String>? = null,
    ): KilosSession = copy(
        status = status ?: this.status,
        isFocused = isFocused ?: this.isFocused,
        lastHeartbeatAt = lastHeartbeatAt ?: this.lastHeartbeatAt,
        lastConnectedAt = lastConnectedAt ?: this.lastConnectedAt,
        windowX = windowX ?: this.windowX,
        windowY = windowY ?: this.windowY,
        windowWidth = windowWidth ?: this.windowWidth,
        windowHeight = windowHeight ?: this.windowHeight,
        cookies = cookies ?: this.cookies,
        headers = headers ?: this.headers,
    )

    fun getWebSocketUrl(): String = url.replace("https://", "wss://").replace("http://", "ws://")
        .let { if (it.endsWith("/")) it else "$it/" } + "websocket"
}