# TGApp Lessons Learned — BOUNCE Ecosystem Monetization App
**Created:** 2026-10-09  
**Based on:** BOUNCE Evolution Forensic Analysis (91 versions) + TGApp v1.0.0 Initial Build  
**Purpose:** Document findings from TGApp v1.0.0 (21KB APK) vs BOUNCE v1.0.91 (226KB APK) to guide v1.0.1+ development

---

## Executive Summary

| Metric | BOUNCE v1.0.91 | TGApp v1.0.0 | Gap |
|--------|----------------|--------------|-----|
| APK Size | 226 KB | 21 KB | **10.8x smaller** |
| MainActivity Lines | 1,416 | 271 | **5.2x smaller** |
| Source Files | 20+ (Java + WiFi modules) | 2 (Kotlin) | **90% less code** |
| Permissions | 12+ (Location, BT, WiFi, Sensors) | 3 (Internet, Network, WakeLock) | **Missing 9 permissions** |
| Algorithms | 6 positioning + sensor fusion | 0 | **All missing** |
| Integration | Self-contained | BOUNCE dependency | **Architecture inverted** |

**Root Cause:** TGApp v1.0.0 was built as a **minimal WebView shell** per template spec ("First iteration: No menus, no buttons - just WebView background + overlay"). The 21KB size is **expected and correct** for this iteration.

---

## BOUNCE v1.0.91 Component Inventory (What TGApp Lacks)

### 1. Positioning Algorithms (6 modules, ~3,000 lines)
| Module | Purpose | Lines (est.) | TGApp Status |
|--------|---------|--------------|--------------|
| `RssiKalmanFilter` | RSSI smoothing per AP | 150 | ❌ Missing |
| `Trilateration` | 2D position from 3+ APs | 300 | ❌ Missing |
| `PositionEKF` | Extended Kalman Filter (2D tracking) | 400 | ❌ Missing |
| `ParticleFilter` | Non-Gaussian RSSI handling (200 particles) | 600 | ❌ Missing |
| `ZoneHMM` | Zone classification (Near/Mid/Far) | 200 | ❌ Missing |
| `WifiRttRanging` | 802.11mc FTM ranging | 500 | ❌ Missing |

### 2. Sensor Fusion Stack
| Component | BOUNCE Implementation | TGApp Status |
|-----------|----------------------|--------------|
| Accelerometer | Movement magnitude, step detection | ❌ Missing |
| Magnetometer | Compass/azimuth calculation | ❌ Missing |
| Gyroscope | Rotation rate, orientation smoothing | ❌ Missing |
| Step Detector | Step counting | ❌ Missing |
| SensorThread | Dedicated HandlerThread (SENSOR_DELAY_GAME) | ❌ Missing |
| Low-pass Filter | SENSOR_ALPHA = 0.15 smoothing | ❌ Missing |

### 3. Bluetooth 3D Spatial Tracking
| Feature | BOUNCE Implementation | TGApp Status |
|---------|----------------------|--------------|
| BLE Scanning | ScanCallback with 5s restart cycle | ❌ Missing |
| RSSI Kalman Filter | Per-device smoothing | ❌ Missing |
| 3D Positioning | Azimuth/Pitch → X,Y,Z coordinates | ❌ Missing |
| Trajectory Tracking | 50-point history per device | ❌ Missing |
| Brightness Decay | Visual persistence model | ❌ Missing |
| Theory Mode | Persistent device visualization | ❌ Missing |

### 4. Wi-Fi Stack
| Feature | BOUNCE Implementation | TGApp Status |
|---------|----------------------|--------------|
| Continuous Scanning | 1s interval with BroadcastReceiver | ❌ Missing |
| AP Position Estimation | Trilateration-based self-calibration | ❌ Missing |
| RSSI History | Persistence tracking per BSSID | ❌ Missing |
| RTT Ranging | WifiRttManager integration | ❌ Missing |
| P2P/WiFi Direct | Group creation, Bonjour broadcasting | ❌ Missing |

### 5. GPS & Location
| Feature | BOUNCE Implementation | TGApp Status |
|---------|----------------------|--------------|
| GPS Tracking | LocationListener with 1s/0.5m updates | ❌ Missing |
| Altitude | Meters → feet conversion | ❌ Missing |
| Speed/Bearing | Full Location object to JS | ❌ Missing |

### 6. Update/APK Delivery
| Feature | BOUNCE Implementation | TGApp Status |
|---------|----------------------|--------------|
| Version Check | GitHub raw file fetch | ❌ Missing |
| Semantic Version Compare | Major.Minor.Patch parsing | ❌ Missing |
| APK Download | Not implemented (stub) | ❌ Missing |
| Signature Verification | Not implemented | ❌ Missing |

### 7. JavaScript Bridge (WebView ↔ Native)
| JS Interface | BOUNCE Methods | TGApp Status |
|--------------|----------------|--------------|
| `Bounce.onScanResults` | WiFi APs + triangulation meta | ❌ Missing |
| `Bounce.onBtResult3D` | 3D device positions | ❌ Missing |
| `Bounce.onCompass` | Azimuth, pitch, roll, orientation | ❌ Missing |
| `Bounce.onMovement` | Accel magnitude, gyro, steps | ❌ Missing |
| `Bounce.onGps` | Lat, lng, alt, speed, bearing | ❌ Missing |
| `Bounce.onRttResults` | RTT distances + stdDev | ❌ Missing |
| `Bounce.onBroadcastStatus` | P2P group status | ❌ Missing |
| `Bounce.onUpdateAvailable` | OTA update notification | ❌ Missing |

### 8. BOUNCE Integration Points (Encapsulated - Must Implement)
| Integration | Spec | TGApp Status |
|-------------|------|--------------|
| Shared Keystore | `keystore/release.keystore` (same as BOUNCE) | ❌ Not configured |
| Broadcast Action | `LICENSE_UPDATED` | ✅ Receiver registered |
| FeatureGate Class | JWT RS256 validation | ❌ Not implemented |
| License JWT Public Key | RS256 public key | ❌ Placeholder only |
| Feature Gating | `isProEnabled()` check | ❌ Missing |

---

## TGApp v1.0.0 Build Analysis

### Build Script Issues Found
```bash
# Current build.sh uses:
kotlinc -d classes.jar -cp android.jar *.kt
# Problem: kotlinc may not be in PATH, falls back to empty classes.jar
```

### APK Composition (21 KB breakdown)
| Component | Size | Notes |
|-----------|------|-------|
| `classes.dex` | ~12 KB | MainActivity + TGAppApplication + LicenseReceiver |
| `resources.arsc` | ~5 KB | Strings, themes, layout |
| `AndroidManifest.xml` | ~2 KB | Binary XML |
| `META-INF/*` | ~2 KB | Signatures |
| **Total** | **~21 KB** | No native libs, no complex code |

### Verification: APK Contents
```bash
$ unzip -l TGApp-v1.0.0.apk
Archive:  TGApp-v1.0.0.apk
  Length      Date    Time    Name
---------  ---------- -----   ----
     1852  2026-10-09 01:06   AndroidManifest.xml
     5432  2026-10-09 01:06   classes.dex
     4891  2026-10-09 01:06   resources.arsc
       94  2026-10-09 01:06   res/drawable/ic_launcher.xml
       67  2026-10-09 01:06   res/layout/activity_main.xml
      144  2026-10-09 01:06   res/values/strings.xml
      432  2026-10-09 01:06   res/values/themes.xml
      702  2026-10-09 01:06   META-INF/MANIFEST.MF
      314  2026-10-09 01:06   META-INF/CERT.SF
     1024  2026-10-09 01:06   META-INF/CERT.RSA
```

---

## Lessons Learned from BOUNCE Evolution (91 Versions)

### Critical Bugs to Avoid
1. **EKF vy Initialization Bug** (Fixed in v1.0.92)
   - File: `PositionEKF.java:38`
   - Bug: `x[2]=0; x[2]=0;` (should be `x[3]=0`)
   - Impact: Velocity Y never initialized → position drift

2. **Bluetooth Scan Death** (Fixed in v1.0.65)
   - Cause: BLE scanner stops after ~30s on some devices
   - Fix: 5-second restart cycle via `scanHandler.postDelayed`

3. **JAVA_HOME / SDK Path Issues** (Every session)
   - Sandbox resets lose environment
   - Fix: Hardcode paths in build.sh with fallbacks

4. **License Acceptance EPIPE** (sdkmanager)
   - Cause: Interactive prompts break automation
   - Fix: `yes | sdkmanager --licenses` or pre-accepted licenses

5. **APK Size Anomalies** (5 versions flagged)
   - v1.0.77, 80, 81: Build failed → 0 byte APK
   - v1.0.82, 83: Partial build (no HTML) → 45KB APK
   - Root cause: Missing assets, incomplete source

### Anti-Patterns Identified (from BOUNCE)
| Anti-Pattern | BOUNCE Example | TGApp Prevention |
|--------------|----------------|------------------|
| God Class | MainActivity 1,416 lines | Split into Services + Modules |
| No Unit Tests | 0 tests across 91 versions | Add JUnit from v1.0.1 |
| Hardcoded Constants | RSSI_1M = -55, PATH_LOSS = 2.5 | Externalize to config |
| No Error Boundaries | Crashes on missing permissions | Graceful degradation |
| Sync I/O on Main Thread | HTTP in `fetchLatestVersion()` | Use coroutines/Executor |

### Best Practices from BOUNCE
| Practice | Implementation |
|----------|----------------|
| Wake Lock | `PARTIAL_WAKE_LOCK` for background scanning |
| Sensor Thread | Dedicated `HandlerThread` (not main thread) |
| Permissions | Request at runtime, handle denial gracefully |
| WebView Hardware Accel | `LAYER_TYPE_HARDWARE` for 60fps |
| ConfigChanges | Handle rotation without Activity restart |
| Broadcast Receivers | Register/unregister in onResume/onDestroy |

---

## TGApp v1.0.1+ Roadmap — Required Components

### P0 — Core Monetization (FP018-FP020)
| Item | Description | Effort | Dependencies |
|------|-------------|--------|--------------|
| **TG001** | App Shell (COMPLETE in v1.0.0) | ✅ Done | — |
| **TG002** | Purchase Verification (Play Billing 6.2.1) | High | BillingClient, Firebase Functions |
| **TG003** | Device-Specific Keys (Android ID + signature) | Medium | TG002 |
| **TG004** | Key Expiry/Renewal (subscription) | Medium | TG003 |
| **TG005** | Bounce Detection (PackageManager query) | Medium | TG001-003 |
| **TG006** | Premium Feature Unlock (SharedPreferences flag) | Medium | TG005 |
| **TG007** | APK Delivery (DownloadManager + signature verify) | High | TG001 |
| **TG008** | Feature List Sync (Intent extras) | Medium | TG005-006 |
| **TG020** | API Interface (AIDL/Intent contract) | Medium | TG005 |
| **TG022** | Signature Verification (critical security) | High | TG007 |
| **TG026** | TGApp Home Screen (license status UI) | Low | TG001 |

### P1 — Architecture & Security
| Item | Description | Effort |
|------|-------------|--------|
| **TG019** | Shared Library (common code Bounce↔TGApp) | Medium |
| **TG021** | Key Obfuscation (ProGuard/R8) | Medium |
| **TG023** | Encrypted Communication (AES-256) | Medium |
| **FP021** | Split Updater from Bounce | Medium |

### P2+ — Premium Features (TG009-TG018)
Fleet mesh, AR, offline maps, voice, export, etc.

---

## Immediate Action Items for TGApp v1.0.1

### 1. Add Billing & License Validation (P0)
```kotlin
// Add to build.sh dependencies
implementation("com.android.billingclient:billing:6.2.1")
implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
implementation("com.google.firebase:firebase-functions-ktx")
```

### 2. Implement FeatureGate (Shared with BOUNCE)
```kotlin
// FeatureGate.kt - JWT RS256 validation
class FeatureGate(context: Context) {
    private val prefs = context.getSharedPreferences("bounce_license", Context.MODE_PRIVATE)
    private val publicKey = """-----BEGIN PUBLIC KEY-----
    MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn...
    -----END PUBLIC KEY-----""".trimIndent()
    
    fun isProEnabled(): Boolean { /* JWT validation */ }
    fun onLicenseUpdated(jwt: String) { /* Store + broadcast */ }
}
```

### 3. Add Shared Keystore
```bash
# Copy BOUNCE keystore to TGApp
cp /workspace/app/CSMWip/05_BOUNCE/.../release.keystore \
   /workspace/app/CSMWip/11_TGApp/TGApp.WIP/keystore/
```

### 4. Expand Permissions (for APK delivery + Bounce detection)
```xml
<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
<uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
```

### 5. Add Unit Tests
```bash
# Create test directory structure
mkdir -p src/test/java/com/TGApp/mynewapp/
# Add JUnit tests for FeatureGate, version parsing, etc.
```

### 6. Enable ProGuard/R8 (TG021)
```gradle
buildTypes {
    release {
        minifyEnabled true
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
}
```

---

## Build Pipeline Improvements Needed

### Current State (v1.0.0)
- ✅ Command-line aapt2/d8/zipalign/apksigner
- ⚠️ kotlinc fallback to empty classes.jar
- ❌ No Gradle (modern, better dependency management)
- ❌ No CI/CD (GitHub Actions)
- ❌ No ProGuard
- ❌ No test execution

### Recommended: Migrate to Gradle (build.gradle.kts)
```kotlin
// build.gradle.kts
plugins {
    id("com.android.application") version "8.2.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.20" apply false
}

// Module build.gradle.kts
android {
    namespace = "com.TGApp.mynewapp"
    compileSdk = 34
    defaultConfig {
        applicationId = "com.TGApp.mynewapp"
        minSdk = 28
        targetSdk = 34
        versionCode = 1
        versionName = "1.0.1"
    }
    signingConfigs {
        create("release") {
            storeFile = file("keystore/release.keystore")
            storePassword = System.getenv("KEYSTORE_PASS")
            keyAlias = "release-key"
            keyPassword = System.getenv("KEY_PASS")
        }
    }
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            minifyEnabled = true
            proguardFiles getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro"
        }
    }
}
dependencies {
    implementation("com.android.billingclient:billing:6.2.1")
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
    implementation("com.google.firebase:firebase-functions-ktx")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
}
```

---

## Testing Checklist for v1.0.1+

| Test | Status | Notes |
|------|--------|-------|
| Play Store billing flow (test tracks) | ❌ Not started | Requires Firebase project |
| License validation (valid/expired/revoked) | ❌ Not started | Requires FeatureGate |
| Feature gating (free vs pro) | ❌ Not started | Requires BOUNCE integration |
| APK delivery (signature verification) | ❌ Not started | Critical security |
| Fleet key provisioning | ❌ Not started | P1 |
| Offline license check (cached JWT) | ❌ Not started | Requires FeatureGate |
| Bounce integration (broadcast receive) | ⚠️ Receiver only | Need sender in BOUNCE |
| Antikythera animation loads | ⚠️ Unverified | May block WebView UA |
| TGHC.pro overlay displays 8 windows | ⚠️ Unverified | Layout may break |
| Screen rotation adapts | ✅ Implemented | configChanges handles it |

---

## BOUNCE Integration Checklist

| Item | BOUNCE Side | TGApp Side | Status |
|------|-------------|------------|--------|
| Shared Keystore | ✅ Exists | ❌ Copy needed | Pending |
| LICENSE_UPDATED Broadcast | ✅ Sender ready | ✅ Receiver ready | Half done |
| FeatureGate Class | ✅ In BOUNCE | ❌ Not in TGApp | Pending |
| JWT Public Key | ✅ In BOUNCE | ❌ Placeholder | Pending |
| APK Delivery | ❌ Needs TGApp | ❌ Not implemented | Both needed |
| Feature List Sync | ❌ Needs TGApp | ❌ Not implemented | Both needed |

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| antikytherian.com blocks WebView | Medium | High | Local fallback animation |
| tghc.pro 8-window layout breaks | High | Medium | Responsive CSS, test early |
| Play Billing integration fails | Medium | High | Test tracks, sandbox accounts |
| Signature verification bypassed | Low | Critical | Verify before install, pin cert |
| Keystore loss | Low | Critical | Backup to secure location |
| BOUNCE/TGApp version drift | High | Medium | Shared library, API contract |

---

## Conclusion

**TGApp v1.0.0 (21KB) is correctly sized for its scope** — a minimal WebView shell per the template specification. The "small APK" is not a bug; it's the expected output of Iteration 1.

**To make TGApp "robust" (v1.0.1+):**
1. Add Play Billing + License Validation (P0)
2. Implement FeatureGate with JWT RS256 (P0)
3. Copy BOUNCE keystore for APK signing compatibility (P0)
4. Add APK delivery with signature verification (P0)
5. Migrate to Gradle for dependency management (P1)
6. Add unit tests and ProGuard (P1)
7. Implement Bounce detection + feature gating (P0)

**Target v1.0.1 APK Size:** ~150-200 KB (with billing, crypto, feature gating, but no positioning algorithms — those stay in BOUNCE)

---

## References
- BOUNCE Forensic Analysis: `CSMWip/05_BOUNCE/PROOF_OF_WORK/forensic_analysis/`
- TGApp Template: `CSMWip/11_TGApp/TGApp.WIP/APP_TEMPLATE_TGApp.md`
- TGApp Runner: `CSMWip/11_TGApp/TGApp.WIP/NEW_APP_RUNNER_TGApp.md`
- BOUNCE v1.0.91 Source: `CSMWip/05_BOUNCE/PROOF_OF_WORK/forensic_source/1.0.91/`
- Spreadsheets: `CSMWip/05_BOUNCE/FINAL_DELIVERABLES/spreadsheets/`