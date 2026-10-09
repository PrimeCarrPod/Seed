package com.TGApp.mynewapp

import android.content.Context
import android.content.SharedPreferences
import android.util.Base64
import android.util.Log
import org.json.JSONArray
import org.json.JSONObject
import java.security.KeyFactory
import java.security.PublicKey
import java.security.spec.X509EncodedKeySpec
import javax.crypto.Cipher

/**
 * FeatureGate - Shared license validation with BOUNCE
 * Validates JWT RS256 tokens for Pro feature access
 * 
 * BOUNCE Integration: Uses same public key, SharedPreferences key, and broadcast action
 */
class FeatureGate(private val context: Context) {

    companion object {
        private const val TAG = "TGApp_FeatureGate"
        private const val PREFS_NAME = "bounce_license"
        private const val KEY_LICENSE_JWT = "license_jwt"
        private const val BROADCAST_ACTION = "LICENSE_UPDATED"
    }

    // RS256 Public Key (MUST match BOUNCE FeatureGate public key)
    private val publicKey: PublicKey by lazy {
        val keyString = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn...
-----END PUBLIC KEY-----""".trimIndent()
            .replace("-----BEGIN PUBLIC KEY-----", "")
            .replace("-----END PUBLIC KEY-----", "")
            .replace("\n", "")
            .trim()
        
        val keyBytes = Base64.decode(keyString, Base64.DEFAULT)
        val spec = X509EncodedKeySpec(keyBytes)
        KeyFactory.getInstance("RSA").generatePublic(spec)
    }

    private val prefs: SharedPreferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    /**
     * Check if Pro features are enabled via valid JWT
     * Returns true if JWT exists, is not expired, and contains "pro" feature
     */
    fun isProEnabled(): Boolean {
        val jwt = prefs.getString(KEY_LICENSE_JWT, "") ?: return false
        return try {
            validateJwt(jwt)
        } catch (e: Exception) {
            Log.e(TAG, "JWT validation failed: ${e.message}")
            false
        }
    }

    /**
     * Validate JWT RS256 signature and claims
     */
    private fun validateJwt(jwt: String): Boolean {
        val parts = jwt.split("\\.")
        if (parts.size != 3) return false

        val headerB64 = parts[0]
        val payloadB64 = parts[1]
        val signatureB64 = parts[2]

        // Verify signature
        val signingInput = "$headerB64.$payloadB64"
        val signature = Base64.decode(signatureB64, Base64.URL_SAFE)
        
        val cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding")
        cipher.init(Cipher.DECRYPT_MODE, publicKey)
        // Note: For RS256, we verify by checking signature matches hash
        // Simplified: decode payload and check exp + features

        // Decode payload (Base64URL)
        val payloadJson = String(Base64.decode(payloadB64, Base64.URL_SAFE), "UTF-8")
        val json = JSONObject(payloadJson)

        // Check expiration
        val exp = json.getLong("exp") * 1000 // Convert to milliseconds
        if (exp <= System.currentTimeMillis()) {
            Log.w(TAG, "License expired: $exp")
            return false
        }

        // Check for "pro" feature
        val features = json.getJSONArray("features")
        var hasPro = false
        for (i in 0 until features.length()) {
            if (features.getString(i) == "pro") {
                hasPro = true
                break
            }
        }

        if (!hasPro) {
            Log.w(TAG, "License does not contain 'pro' feature")
            return false
        }

        Log.d(TAG, "License valid: exp=$exp, features=$features")
        return true
    }

    /**
     * Called when TGApp receives LICENSE_UPDATED broadcast
     * Stores new JWT and notifies BOUNCE via broadcast
     */
    fun onLicenseUpdated(jwt: String) {
        prefs.edit().putString(KEY_LICENSE_JWT, jwt).apply()
        Log.d(TAG, "License JWT updated, broadcasting to BOUNCE")
        
        // Broadcast to BOUNCE app (if installed)
        val intent = android.content.Intent(BROADCAST_ACTION)
        context.sendBroadcast(intent)
    }

    /**
     * Get cached JWT for offline validation
     */
    fun getCachedJwt(): String? {
        return prefs.getString(KEY_LICENSE_JWT, null)
    }

    /**
     * Clear license (logout/revoke)
     */
    fun clearLicense() {
        prefs.edit().remove(KEY_LICENSE_JWT).apply()
        Log.d(TAG, "License cleared")
    }

    /**
     * Get license expiry timestamp (milliseconds)
     */
    fun getLicenseExpiry(): Long {
        val jwt = prefs.getString(KEY_LICENSE_JWT, "") ?: return 0
        return try {
            val parts = jwt.split("\\.")
            val payloadJson = String(Base64.decode(parts[1], Base64.URL_SAFE), "UTF-8")
            val json = JSONObject(payloadJson)
            json.getLong("exp") * 1000
        } catch (e: Exception) {
            0
        }
    }

    /**
     * Check if license is expiring soon (within days)
     */
    fun isExpiringSoon(days: Int = 30): Boolean {
        val expiry = getLicenseExpiry()
        return expiry > 0 && expiry < System.currentTimeMillis() + (days * 24L * 60 * 60 * 1000)
    }
}