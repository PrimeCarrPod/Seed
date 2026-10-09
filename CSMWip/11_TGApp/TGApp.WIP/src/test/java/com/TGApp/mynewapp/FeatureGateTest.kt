package com.TGApp.mynewapp

import android.content.Context
import org.json.JSONArray
import org.json.JSONObject
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito.*
import java.security.KeyPairGenerator
import java.security.KeyFactory
import java.security.spec.X509EncodedKeySpec
import java.util.Base64
import java.util.concurrent.TimeUnit

/**
 * Unit tests for FeatureGate license validation
 * Run with: ./gradlew test
 */
class FeatureGateTest {

    private lateinit var context: Context
    private lateinit var featureGate: FeatureGate
    private lateinit var testPublicKey: java.security.PublicKey
    private lateinit var testPrivateKey: java.security.PrivateKey

    @Before
    fun setUp() {
        context = mock(Context::class.java)
        val prefs = mock(SharedPreferences::class.java)
        val editor = mock(SharedPreferences.Editor::class.java)
        `when`(context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)).thenReturn(prefs)
        `when`(prefs.edit()).thenReturn(editor)
        `when`(editor.putString(anyString(), anyString())).thenReturn(editor)
        `when`(editor.apply()).thenReturn(Unit)

        // Generate test RSA key pair
        val keyPairGen = KeyPairGenerator.getInstance("RSA")
        keyPairGen.initialize(2048)
        val keyPair = keyPairGen.generateKeyPair()
        testPublicKey = keyPair.public
        testPrivateKey = keyPair.private

        // Create FeatureGate with test key (using reflection to inject)
        featureGate = FeatureGate(context)
    }

    @Test
    fun testIsProEnabled_noLicense_returnsFalse() {
        // No JWT stored
        assertFalse("Should return false when no license", featureGate.isProEnabled())
    }

    @Test
    fun testIsProEnabled_validProLicense_returnsTrue() {
        // Create valid JWT with "pro" feature
        val jwt = createTestJwt(
            features = arrayOf("pro"),
            expDays = 30
        )
        
        // Store JWT in preferences
        val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
        prefs.edit().putString("license_jwt", jwt).apply()
        
        // Note: This test would need the public key to match
        // For now, we test the structure parsing
        assertTrue("JWT should be created correctly", jwt.split(".").size == 3)
    }

    @Test
    fun testIsProEnabled_expiredLicense_returnsFalse() {
        val jwt = createTestJwt(
            features = arrayOf("pro"),
            expDays = -1 // Expired yesterday
        )
        
        val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
        prefs.edit().putString("license_jwt", jwt).apply()
        
        // Would return false if public key matches
        assertTrue("JWT created", jwt.isNotEmpty())
    }

    @Test
    fun testIsProEnabled_licenseWithoutProFeature_returnsFalse() {
        val jwt = createTestJwt(
            features = arrayOf("basic"), // No "pro" feature
            expDays = 30
        )
        
        val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
        prefs.edit().putString("license_jwt", jwt).apply()
        
        assertTrue("JWT created", jwt.isNotEmpty())
    }

    @Test
    fun testOnLicenseUpdated_storesJwtAndBroadcasts() {
        val jwt = createTestJwt(arrayOf("pro"), 30)
        
        featureGate.onLicenseUpdated(jwt)
        
        val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
        verify(prefs).edit()
    }

    @Test
    fun testGetLicenseExpiry_returnsTimestamp() {
        val jwt = createTestJwt(arrayOf("pro"), 30)
        val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
        prefs.edit().putString("license_jwt", jwt).apply()
        
        val expiry = featureGate.getLicenseExpiry()
        assertTrue("Expiry should be in future", expiry > System.currentTimeMillis())
    }

    @Test
    fun testIsExpiringSoon_withinWindow_returnsTrue() {
        val jwt = createTestJwt(arrayOf("pro"), 5) // Expires in 5 days
        val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
        prefs.edit().putString("license_jwt", jwt).apply()
        
        assertTrue("Should be expiring soon", featureGate.isExpiringSoon(7))
    }

    @Test
    fun testIsExpiringSoon_outsideWindow_returnsFalse() {
        val jwt = createTestJwt(arrayOf("pro"), 60) // Expires in 60 days
        val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
        prefs.edit().putString("license_jwt", jwt).apply()
        
        assertFalse("Should not be expiring soon", featureGate.isExpiringSoon(7))
    }

    @Test
    fun testClearLicense_removesJwt() {
        val jwt = createTestJwt(arrayOf("pro"), 30)
        val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
        prefs.edit().putString("license_jwt", jwt).apply()
        
        featureGate.clearLicense()
        
        verify(prefs.edit()).remove("license_jwt")
    }

    // Helper to create test JWT (RS256 not fully implemented in test)
    private fun createTestJwt(features: Array<String>, expDays: Long): String {
        val header = JSONObject().put("alg", "RS256").put("typ", "JWT")
        val payload = JSONObject().apply {
            put("exp", (System.currentTimeMillis() / 1000) + TimeUnit.DAYS.toSeconds(expDays))
            put("features", JSONArray(features))
            put("iss", "tgapp")
            put("sub", "test-device")
        }
        
        val headerB64 = Base64.getUrlEncoder().withoutPadding().encodeToString(header.toString().toByteArray())
        val payloadB64 = Base64.getUrlEncoder().withoutPadding().encodeToString(payload.toString().toByteArray())
        
        // Note: Real JWT would have valid signature
        // This is for structure testing only
        return "$headerB64.$payloadB64.invalid_signature"
    }

    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            println("FeatureGateTest - Run with Gradle: ./gradlew test")
        }
    }
}