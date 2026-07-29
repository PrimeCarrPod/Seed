package com.carrpod.vertebrae.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize
import java.io.Serializable
import java.util.*

@Parcelize
data class SessionGroup(
    val id: String = UUID.randomUUID().toString(),
    val name: String = "Default Group",
    val description: String = "",
    val color: Int = 0xFF00D4AA,
    val createdAt: Long = System.currentTimeMillis(),
    val updatedAt: Long = System.currentTimeMillis(),
    val sessionIds: MutableList<String> = mutableListOf(),
    val storagePath: String = "",
    val isExpanded: Boolean = true,
    val sortOrder: Int = 0,
) : Parcelable {

    fun copyWith(
        name: String? = null,
        description: String? = null,
        color: Int? = null,
        sessionIds: MutableList<String>? = null,
        storagePath: String? = null,
        isExpanded: Boolean? = null,
        sortOrder: Int? = null,
    ): SessionGroup = copy(
        name = name ?: this.name,
        description = description ?: this.description,
        color = color ?: this.color,
        sessionIds = sessionIds ?: this.sessionIds,
        storagePath = storagePath ?: this.storagePath,
        isExpanded = isExpanded ?: this.isExpanded,
        sortOrder = sortOrder ?: this.sortOrder,
        updatedAt = System.currentTimeMillis(),
    )

    fun getStorageDir(basePath: String): java.io.File {
        val path = if (storagePath.isNotBlank()) storagePath else "$basePath/groups/$id"
        return java.io.File(path).apply { mkdirs() }
    }
}

@Parcelize
data class InterSessionMessage(
    val id: String = UUID.randomUUID().toString(),
    val fromSessionId: String,
    val toSessionId: String?, // null = broadcast to all in group
    val groupId: String,
    val type: MessageType,
    val payload: String,
    val timestamp: Long = System.currentTimeMillis(),
    val fileAttachment: FileAttachment? = null,
    val requiresAck: Boolean = false,
    val ackId: String? = null,
) : Parcelable {

    enum class MessageType {
        TEXT,
        COMMAND,
        FILE_TRANSFER,
        FILE_REQUEST,
        HEARTBEAT,
        SESSION_STATUS,
        FOCUS_CHANGE,
        WINDOW_STATE,
        BROADCAST,
        PING,
        PONG
    }

    @Parcelize
    data class FileAttachment(
        val name: String,
        val path: String,
        val size: Long,
        val mimeType: String,
        val hash: String,
    ) : Parcelable

    fun isForSession(sessionId: String): Boolean {
        return toSessionId == null || toSessionId == sessionId
    }
}

@Parcelize
data class SessionHeartbeat(
    val sessionId: String,
    val timestamp: Long = System.currentTimeMillis(),
    val status: KilosSession.SessionStatus,
    val isFocused: Boolean,
    val windowState: WindowState? = null,
) : Parcelable

@Parcelize
data class WindowState(
    val x: Float,
    val y: Float,
    val width: Int,
    val height: Int,
    val isVisible: Boolean,
    val isFocused: Boolean,
    val zOrder: Int,
) : Parcelable