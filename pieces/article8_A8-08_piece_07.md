# TGAPP_Monetization_Architecture — Piece 07/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 07 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# Security — Key Obfuscation, Signature Verification, Encryption (TG021-TG023)

## TG021: Key Obfuscation (ProGuard/R8)
- **Category:** Security | **Priority:** P1 | **Effort:** Medium | **Target:** 1.0.0
- **Description:** Protect TGAPP license logic from reverse engineering
- **Configuration:**
```proguard
# proguard-rules.pro (TGAPP module)
# Keep licensing API but obfuscate implementation
-keep class com.carrpod.tgapp.license.** { *; }
-keepclassmembers class com.carrpod.tgapp.license.** { *; }

# Obfuscate everything else
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-verbose

# Protect JWT verification keys
-keep class com.carrpod.bounce.common.license.** { *; }

# R8 full mode
-optimizationpasses 5
-allowaccessmodification
-mergeinterfacesaggressively
-overloadaggressively
```

### Additional Hardening
- **Native Library:** Move critical crypto (Ed25519 verify) to C++ via JNI
- **String Encryption:** Use DexGuard or manual XOR for sensitive strings
- **Control Flow Flattening:** R8 `-optimize` + `-allowaccessmodification`
- **Anti-Debug:** `android:debuggable="false"` + runtime checks

## TG022: Signature Verification (CRITICAL)
- **Category:** Security | **Priority:** P0 | **Effort:** High | **Target:** 1.0.93
- **Description:** Verify Bounce APK signature before install (supply chain protection)
- **Implementation:**
```kotlin
// TGAPP - UpdateManager.kt
object SignatureVerifier {
    // Known Bounce signing certificate SHA-256 (from keystore)
    private val EXPECTED_CERT_SHA256 = "A1:B2:C3:D4:E5:F6:..." // 32 bytes hex
    
    fun verifyApkSignature(apkPath: String, context: Context): Boolean {
        val apkFile = File(apkPath)
        
        // Use ApkSignatureSchemeV2Verifier (API 28+) or PackageManager
        val packageInfo = context.packageManager.getPackageArchiveInfo(
            apkPath, 
            PackageManager.GET_SIGNING_CERTIFICATES
        )
        
        val certs = packageInfo.signingInfo.apkContentsSigners
            ?: packageInfo.signingInfo.signingCertificateHistory
        
        return certs?.any { cert ->
            val digest = MessageDigest.getInstance("SHA-256")
            val hash = digest.digest(cert.toByteArray())
            bytesToHex(hash).uppercase() == EXPECTED_CERT_SHA256
        } ?: false
    }
    
    // Also verify: same package name, versionCode > installed
    fun verifyApkIntegrity(apkPath: String, context: Context): VerificationResult {
        // 1. Signature match
        if (!verifyApkSignature(apkPath, context)) {
            return VerificationResult.SIGNATURE_MISMATCH
        }
        
        // 2. Package name match
        val pkgInfo = context.packageManager.getPackageArchiveInfo(apkPath, 0)
        if (pkgInfo.packageName != "com.carrpod.bounce") {
            return VerificationResult.PACKAGE_MISMATCH
        }
        
        // 3. Version code > installed
        val installed = context.packageManager.getPackageInfo("com.carrpod.bounce", 0)
        if (pkgInfo.versionCode <= installed.versionCode) {
            return VerificationResult.NOT_NEWER
        }
        
        return VerificationResult.VALID
    }
}
```

## TG023: Encrypted Communication
- **Category:** Security | **Priority:** P1 | **Effort:** Medium | **Target:** 1.0.93
- **Description:** Encrypt Bounce↔TGAPP data exchange (AES-256 + key exchange)
- **Protocol:**
  1. **Key Exchange:** ECDH (X25519) on first communication
  2. **Session Key:** HKDF-SHA256(shared_secret, "bounce-tgapp-session")
  3. **Encryption:** AES-256-GCM (authenticated encryption)
  4. **Rotation:** New session key every 24h or on license renewal

### Implementation
```kotlin
// bounce-common - CryptoUtils.kt
object CryptoUtils {
    private const val ALGORITHM = "AES/GCM/NoPadding"
    private const val KEY_SIZE = 256
    private const val IV_SIZE = 12  // GCM standard
    private const val TAG_SIZE = 16
    
    // Generate ephemeral key pair for ECDH
    fun generateKeyPair(): KeyPair {
        val generator = KeyPairGenerator.getInstance("X25519")
        return generator.generateKeyPair()
    }
    
    // Derive shared secret
    fun deriveSharedSecret(myPrivate: PrivateKey, theirPublic: PublicKey): SecretKey {
        val agreement = KeyAgreement.getInstance("X25519")
        agreement.init(myPrivate)
        agreement.doPhase(theirPublic, true)
        val sharedSecret = agreement.generateSecret("AES")
        return SecretKeySpec(sharedSecret.encoded, "AES")
    }
    
    // Encrypt with AES-GCM
    fun encrypt(data: ByteArray, key: SecretKey): EncryptedData {
        val cipher = Cipher.getInstance(ALGORITHM)
        val iv = ByteArray(IV_SIZE)
        SecureRandom().nextBytes(iv)
        
        val spec = GCMParameterSpec(TAG_SIZE * 8, iv)
        cipher.init(Cipher.ENCRYPT_MODE, key, spec)
        val encrypted = cipher.doFinal(data)
        
        return EncryptedData(iv, encrypted)
    }
    
    // Decrypt
    fun decrypt(encryptedData: EncryptedData, key: SecretKey): ByteArray {
        val cipher = Cipher.getInstance(ALGORITHM)
        val spec = GCMParameterSpec(TAG_SIZE * 8, encryptedData.iv)
        cipher.init(Cipher.DECRYPT_MODE, key, spec)
        return cipher.doFinal(encryptedData.ciphertext)
    }
    
    data class EncryptedData(
        val iv: ByteArray,
        val ciphertext: ByteArray
    ) {
        fun toByteArray(): ByteArray = iv + ciphertext
        companion object {
            fun fromByteArray(data: ByteArray): EncryptedData {
                val iv = data.copyOfRange(0, IV_SIZE)
                val ct = data.copyOfRange(IV_SIZE, data.size)
                return EncryptedData(iv, ct)
            }
        }
    }
}
```

---

## Security Checklist

| Control | TGAPP | Bounce | Status |
|---------|-------|--------|--------|
| ProGuard/R8 | ✅ Full | ✅ Standard | TG021 |
| Signature Verification | ✅ Critical | N/A | TG022 |
| Encrypted IPC | ✅ AES-GCM | ✅ AES-GCM | TG023 |
| Keystore Storage | ✅ StrongBox | ✅ StrongBox | TG003 |
| Play Integrity | ✅ Attestation | ✅ Verification | TG003 |
| Anti-Tamper | ✅ Native | ❌ | Future |
| Certificate Pinning | ✅ Backend | ❌ | Future |

---

*End of Piece 07/13 — See Piece 08 for Server: License Server & Analytics*