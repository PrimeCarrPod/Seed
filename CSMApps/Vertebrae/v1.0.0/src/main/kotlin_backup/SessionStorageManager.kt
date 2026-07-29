package com.carrpod.vertebrae.storage

import android.content.Context
import com.carrpod.vertebrae.model.KilosSession
import com.carrpod.vertebrae.model.SessionGroup
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.lang.reflect.Type
import java.util.concurrent.ConcurrentHashMap

class SessionStorageManager(private val context: Context) {

    private val gson = Gson()
    private val baseDir: File
    private val sessionsFile: File
    private val groupsFile: File
    private val sessionsCache = ConcurrentHashMap<String, KilosSession>()
    private val groupsCache = ConcurrentHashMap<String, SessionGroup>()

    init {
        baseDir = File(context.getExternalFilesDir(null), "Vertebrae/Sessions").apply { mkdirs() }
        sessionsFile = File(baseDir, "sessions.json")
        groupsFile = File(baseDir, "groups.json")
        loadCache()
    }

    private fun loadCache() {
        if (sessionsFile.exists()) {
            val type = object : TypeToken<MutableList<KilosSession>>() {}.type
            val list = gson.fromJson(sessionsFile.readText(), type) ?: mutableListOf()
            list.forEach { sessionsCache[it.id] = it }
        }
        if (groupsFile.exists()) {
            val type = object : TypeToken<MutableList<SessionGroup>>() {}.type
            val list = gson.fromJson(groupsFile.readText(), type) ?: mutableListOf()
            list.forEach { groupsCache[it.id] = it }
        }
        // Ensure default group exists
        if (!groupsCache.containsKey("default")) {
            val defaultGroup = SessionGroup(id = "default", name = "Default Group", color = "#74B9FF")
            groupsCache["default"] = defaultGroup
            saveGroups()
        }
    }

    suspend fun saveSession(session: KilosSession) = withContext(Dispatchers.IO) {
        sessionsCache[session.id] = session
        saveSessions()
    }

    suspend fun loadSession(id: String): KilosSession? = withContext(Dispatchers.IO) {
        sessionsCache[id]
    }

    suspend fun loadAllSessions(): List<KilosSession> = withContext(Dispatchers.IO) {
        sessionsCache.values.toList()
    }

    suspend fun loadSessionsByGroup(groupId: String): List<KilosSession> = withContext(Dispatchers.IO) {
        sessionsCache.values.filter { it.groupId == groupId }.toList()
    }

    suspend fun deleteSession(id: String) = withContext(Dispatchers.IO) {
        sessionsCache.remove(id)
        saveSessions()
    }

    private fun saveSessions() {
        sessionsFile.writeText(gson.toJson(sessionsCache.values.toList()))
    }

    suspend fun saveGroup(group: SessionGroup) = withContext(Dispatchers.IO) {
        groupsCache[group.id] = group
        saveGroups()
    }

    suspend fun loadGroup(id: String): SessionGroup? = withContext(Dispatchers.IO) {
        groupsCache[id]
    }

    suspend fun loadAllGroups(): List<SessionGroup> = withContext(Dispatchers.IO) {
        groupsCache.values.toList()
    }

    suspend fun deleteGroup(id: String) = withContext(Dispatchers.IO) {
        if (id != "default") {
            groupsCache.remove(id)
            // Move sessions to default group
            sessionsCache.values.filter { it.groupId == id }
                .forEach { sessionsCache[it.id] = it.copyWith(groupId = "default") }
            saveGroups()
            saveSessions()
        }
    }

    private fun saveGroups() {
        groupsFile.writeText(gson.toJson(groupsCache.values.toList()))
    }

    suspend fun getSessionStorageDir(sessionId: String): File = withContext(Dispatchers.IO) {
        File(baseDir, "session_$sessionId").apply { mkdirs() }
    }

    suspend fun getGroupStorageDir(groupId: String): File = withContext(Dispatchers.IO) {
        File(baseDir, "group_$groupId").apply { mkdirs() }
    }

    companion object {
        @Volatile private var INSTANCE: SessionStorageManager? = null

        fun initialize(context: Context) {
            if (INSTANCE == null) {
                synchronized(this) {
                    if (INSTANCE == null) {
                        INSTANCE = SessionStorageManager(context.applicationContext)
                    }
                }
            }
        }

        fun getInstance(): SessionStorageManager {
            return INSTANCE ?: throw IllegalStateException("SessionStorageManager not initialized")
        }
    }
}