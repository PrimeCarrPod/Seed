package com.bounce.tgapp

import android.content.Context
import android.content.SharedPreferences
import android.util.Base64
import android.util.Log
import java.nio.charset.StandardCharsets
import org.json.JSONObject

class FeatureGate(private val context: Context) {

    private val prefs: SharedPreferences =
        context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)

    private val publicKey = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn...
-----END PUBLIC KEY-----""".trimIndent()

    fun isProEnabled(): Boolean {
        val jwt = prefs.getString("license_jwt", "") ?: return false
        return try {
            val parts = jwt.split("\\.")
            if (parts.size != 3) return false

            val payload = String(Base64.decode(parts[1], Base64.URL_SAFE), StandardCharsets.UTF_8)
            val json = JSONObject(payload)

            val exp = json.getLong("exp") * 1000
            val now = System.currentTimeMillis()

            if (exp <= now) return false

            val features = json.getJSONArray("features")
            for (i in 0 until features.length()) {
                if (features.getString(i) == "pro") return true
            }
            false
        } catch (e: Exception) {
            Log.e("FeatureGate", "License validation failed", e)
            false
        }
    }

    fun onLicenseUpdated(jwt: String) {
        prefs.edit().putString("license_jwt", jwt).apply()
        context.sendBroadcast(android.content.Intent("LICENSE_UPDATED"))
    }

    fun getLicenseExpiry(): Long? {
        val jwt = prefs.getString("license_jwt", "") ?: return null
        return try {
            val parts = jwt.split("\\.")
            val payload = String(Base64.decode(parts[1], Base64.URL_SAFE), StandardCharsets.UTF_8)
            val json = JSONObject(payload)
            json.getLong("exp") * 1000
        } catch (e: Exception) { null }
    }

    fun getLicenseFeatures(): List<String> {
        val jwt = prefs.getString("license_jwt", "") ?: return emptyList()
        return try {
            val parts = jwt.split("\\.")
            val payload = String(Base64.decode(parts[1], Base64.URL_SAFE), StandardCharsets.UTF_8)
            val json = JSONObject(payload)
            val features = json.getJSONArray("features")
            (0 until features.length()).map { features.getString(it) }
        } catch (e: Exception) { emptyList() }
    }

    fun clearLicense() {
        prefs.edit().remove("license_jwt").apply()
        context.sendBroadcast(android.content.Intent("LICENSE_UPDATED"))
    }
}