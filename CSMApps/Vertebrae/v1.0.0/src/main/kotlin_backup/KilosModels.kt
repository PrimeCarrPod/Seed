package com.carrpod.vertebrae.model

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize
import kotlinx.serialization.Serializable

@Parcelize
@Serializable
data class KilosSession(
    val id: String = java.util.UUID.randomUUID().toString(),
    val sessionId: String, // ses_xxxxxxx from kilo.ai
    val groupId: String = "default",
    val name: String = "New Session",
    val status: SessionStatus = SessionStatus.DISCONNECTED,
    val createdAt: Long = System.currentTimeMillis(),
    val lastHeartbeat: Long = 0,
    val lastActivity: Long = 0,
    val isFocused: Boolean = false,
    val windowX: Float = 0f,
    val windowY: Float = 0f,
    val windowWidth: Float = 400f,
    val windowHeight: Float = 600f,
    val heartbeatInterval: Long = 30000,
    val autoReconnect: Boolean = true,
) : Parcelable {

    enum class SessionStatus {
        DISCONNECTED, CONNECTING, CONNECTED, DISCONNECTED, ERROR, RECONNECTING
    }

    fun copyWith(
        sessionId: String? = null,
        groupId: String? = null,
        name: String? = null,
        status: SessionStatus? = null,
        lastHeartbeat: Long? = null,
        lastActivity: Long? = null,
        isFocused: Boolean? = null,
        windowX: Float? = null,
        windowY: Float? = null,
        windowWidth: Float? = null,
        windowHeight: Float? = null,
        heartbeatInterval: Long? = null,
        autoReconnect: Boolean? = null,
    ): KilosSession = copy(
        sessionId = sessionId ?: this.sessionId,
        groupId = groupId ?: this.groupId,
        name = name ?: this.name,
        status = status ?: this.status,
        lastHeartbeat = lastHeartbeat ?: this.lastHeartbeat,
        lastActivity = lastActivity ?: this.lastActivity,
        isFocused = isFocused ?: this.isFocused,
        windowX = windowX ?: this.windowX,
        windowY = windowY ?: this.windowY,
        windowWidth = windowWidth ?: this.windowWidth,
        windowHeight = windowHeight ?: this.windowHeight,
        heartbeatInterval = heartbeatInterval ?: this.heartbeatInterval,
        autoReconnect = autoReconnect ?: this.autoReconnect,
    )
}

@Parcelize
@Serializable
data class SessionGroup(
    val id: String = java.util.UUID.randomUUID().toString(),
    val name: String,
    val color: String = "#74B9FF",
    val sessionIds: MutableList<String> = mutableListOf(),
    val createdAt: Long = System.currentTimeMillis(),
    val sortOrder: Int = 0,
) : Parcelable

@Parcelize
@Serializable
data class InterSessionMessage(
    val id: String = java.util.UUID.randomUUID().toString(),
    val fromSessionId: String,
    val toSessionId: String?, // null = broadcast to group
    val groupId: String,
    val type: MessageType,
    val payload: String,
    val timestamp: Long = System.currentTimeMillis(),
    val isDelivered: Boolean = false,
) : Parcelable {

    enum class MessageType {
        TEXT, COMMAND, FILE, HEARTBEAT, STATUS, FOCUS_CHANGED, SESSION_CLOSED
    }
}

@Parcelize
@Serializable
data class FileTransfer(
    val id: String = java.util.UUID.randomUUID().toString(),
    val fromSessionId: String,
    val toSessionId: String,
    val fileName: String,
    val filePath: String,
    val fileSize: Long,
    val mimeType: String,
    val status: TransferStatus = TransferStatus.PENDING,
    val progress: Float = 0f,
    val startedAt: Long = System.currentTimeMillis(),
    val completedAt: Long = 0,
) : Parcelable {

    enum class TransferStatus {
        PENDING, SENDING, RECEIVING, COMPLETED, FAILED, CANCELLED
    }
}