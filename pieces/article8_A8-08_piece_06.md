# TGAPP_Monetization_Architecture — Piece 06/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 06 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# Architecture — Shared Library & API Interface (TG019-TG020)

## TG019: Shared Library (bounce-common)
- **Category:** Architecture | **Priority:** P1 | **Effort:** Medium | **Target:** 1.0.93
- **Description:** Common code between Bounce + TGAPP as AAR module
- **Structure:**
```
bounce-common/
├── src/main/java/com/carrpod/bounce/common/
│   ├── feature/
│   │   ├── FeatureGate.kt          # Feature gating logic
│   │   ├── FeatureConfig.kt        # Remote config definitions
│   │   └── FeatureTier.kt          # FREE/PRO/ENTERPRISE enum
│   ├── license/
│   │   ├── LicenseManager.kt       # JWT parsing, validation
│   │   ├── LicenseClaims.kt        # Data class for JWT claims
│   │   └── KeyStoreWrapper.kt      # Keystore abstraction
│   ├── mesh/
│   │   ├── MeshMessage.kt          # Protobuf message classes
│   │   ├── MeshProtocol.kt         # TTL, hop, dedup logic
│   │   └── FleetKeyManager.kt      # Key derivation, signing
│   ├── positioning/
│   │   ├── PositionEstimate.kt     # Unified position model
│   │   ├── AlgorithmType.kt        # KALMAN/PARTICLE/EKF/etc
│   │   └── PositioningConfig.kt    # Algorithm parameters
│   └── util/
│       ├── CryptoUtils.kt          # AES-256, Ed25519 helpers
│       └── NetworkUtils.kt         # HTTP, WebSocket helpers
```

## TG020: API Interface (Bounce↔TGAPP Contract)
- **Category:** Architecture | **Priority:** P0 | **Effort:** Medium | **Target:** 1.0.93
- **Description:** Define communication contract for version compatibility
- **Interface:** AIDL + Intent-based (backward compatible)

### AIDL Interface
```aidl
// IBounceTgappInterface.aidl
package com.carrpod.bounce.common;

interface IBounceTgappInterface {
    // License management
    boolean isLicenseValid();
    String getLicenseJwt();           // Encrypted JWT
    Bundle getFeatureList();          // Feature flags + expiry
    
    // Update delivery
    boolean hasUpdateAvailable();
    String getLatestVersionInfo();    // JSON: version, url, changelog
    boolean installUpdate(String apkPath);
    
    // Mesh/Fleet
    boolean isFleetMember();
    String getFleetId();
    void sendMeshMessage(in MeshMessage msg);
    
    // Callbacks
    void registerCallback(IBounceCallback callback);
    void unregisterCallback(IBounceCallback callback);
}
```

### Intent Actions (Broadcast)
```kotlin
// Bounce -> TGAPP
const val ACTION_REQUEST_LICENSE = "com.carrpod.tgapp.REQUEST_LICENSE"
const val ACTION_REQUEST_UPDATE = "com.carrpod.tgapp.REQUEST_UPDATE"
const val ACTION_SEND_MESH = "com.carrpod.tgapp.SEND_MESH"

// TGAPP -> Bounce
const val ACTION_LICENSE_STATUS = "com.carrpod.bounce.LICENSE_STATUS"
const val ACTION_UPDATE_AVAILABLE = "com.carrpod.bounce.UPDATE_AVAILABLE"
const val ACTION_MESH_RECEIVED = "com.carrpod.bounce.MESH_RECEIVED"
const val ACTION_FEATURES_CHANGED = "com.carrpod.bounce.FEATURES_CHANGED"
```

### Version Compatibility Strategy
| Bounce Version | TGAPP Version | Compatibility |
|----------------|---------------|---------------|
| 1.0.93 | 1.0.0 | Baseline |
| 1.0.94 | 1.0.0 | Backward compatible (new features ignored) |
| 1.0.95 | 1.0.1 | New API version (v2) |
| 1.0.96 | 1.0.1 | Fleet mesh v2 |

- **Rule:** TGAPP API version in `AndroidManifest.xml` `<meta-data>`
- **Fallback:** If AIDL fails, use Intent broadcast (always works)

---

## Build Integration

### settings.gradle.kts
```kotlin
include(":bounce", ":tgapp", ":bounce-common")
```

### bounce/build.gradle.kts
```kotlin
dependencies {
    implementation(project(":bounce-common"))
    // ...
}
```

### tgapp/build.gradle.kts
```kotlin
dependencies {
    implementation(project(":bounce-common"))
    implementation("com.android.billingclient:billing:6.2.1")
    implementation("com.google.firebase:firebase-functions-ktx:20.3.1")
    // ...
}
```

---

*End of Piece 06/13 — See Piece 07 for Security: Key Obfuscation, Signature Verification, Encryption*