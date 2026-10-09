# TGApp v1.0.1 Upgrade Plan — Robust Monetization App

## Overview
This document outlines the changes needed to upgrade TGApp from v1.0.0 (21KB minimal WebView shell) to v1.0.1 (robust monetization app with billing, license validation, and BOUNCE integration).

---

## Current State (v1.0.0)
- **APK Size:** 21 KB
- **Architecture:** Dual WebView (Antikythera background + TGHC overlay)
- **Permissions:** Internet, Network State, Wake Lock
- **Features:** None (just WebViews)
- **Integration:** LICENSE_UPDATED receiver only

---

## Target State (v1.0.1)
- **APK Size:** ~150-200 KB (with billing, crypto, ProGuard)
- **Architecture:** WebView + Billing + License Validation + Feature Gating
- **Permissions:** + Billing, Request Install Packages, Query All Packages, Foreground Service
- **Features:** Play Billing, JWT RS256 License Validation, Firebase Functions, Pro Feature Gating
- **Integration:** Full BOUNCE integration (shared keystore, FeatureGate, APK delivery ready)

---

## File Changes Required

### New Files
| File | Purpose |
|------|---------|
| `FeatureGate.kt` | JWT RS256 license validation (shared with BOUNCE) |
| `build.gradle.kts` | Project-level Gradle config |
| `app_build.gradle.kts` | Module-level Gradle config with dependencies |
| `settings.gradle.kts` | Gradle settings |
| `proguard-rules.pro` | ProGuard rules for release |
| `network_security_config.xml` | Network security (HTTPS enforcement) |
| `google-services.json` | Firebase config (template) |
| `FeatureGateTest.kt` | Unit tests for license validation |

### Modified Files
| File | Changes |
|------|---------|
| `MainActivity.kt` → `MainActivity_v101.kt` | Add billing, license check, JS bridge for purchase |
| `TGAppApplication.kt` → `TGAppApplication_v101.kt` | Add Firebase initialization |
| `AndroidManifest.xml` → `AndroidManifest_v101.xml` | Add billing, APK delivery, foreground service permissions |
| `build.sh` → `build_v101.sh` | Enhanced with Gradle option, better error handling |

---

## Dependencies Added (app_build.gradle.kts)

```kotlin
// Play Billing
implementation("com.android.billingclient:billing:6.2.1")

// Firebase
implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
implementation("com.google.firebase:firebase-functions-ktx")
implementation("com.google.firebase:firebase-analytics-ktx")
implementation("com.google.firebase:firebase-crashlytics-ktx")

// Coroutines
implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
implementation("org.jetbrains.kotlinx:kotlinx-coroutines-play-services:1.7.3")

// Testing
testImplementation("junit:junit:4.13.2")
testImplementation("org.mockito:mockito-core:5.7.0")
androidTestImplementation("androidx.test.ext:junit:1.1.5")
androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
```

---

## BOUNCE Integration Checklist

| Component | BOUNCE | TGApp v1.0.1 | Status |
|-----------|--------|--------------|--------|
| Shared Keystore | ✅ Exists | ⚠️ Copy needed | **Action Required** |
| LICENSE_UPDATED Broadcast | ✅ Sender | ✅ Receiver | ✅ Ready |
| FeatureGate Class | ✅ In BOUNCE | ✅ Added | ✅ Ready |
| JWT Public Key | ✅ Real key | ⚠️ Placeholder | **Action Required** |
| APK Delivery | ❌ Needs TGApp | ⚠️ Framework ready | **Next Sprint** |
| Feature List Sync | ❌ Needs TGApp | ⚠️ Framework ready | **Next Sprint** |

---

## Setup Steps for v1.0.1

### 1. Copy BOUNCE Keystore
```bash
# Copy release keystore from BOUNCE to TGApp
cp /workspace/app/CSMWip/05_BOUNCE/.../release.keystore \
   /workspace/app/CSMWip/11_TGApp/TGApp.WIP/keystore/release.keystore

# Set passwords in CI/CD secrets (not in code)
export KEYSTORE_PASS="your_keystore_password"
export KEY_PASS="your_key_password"
```

### 2. Configure Firebase Project
1. Create Firebase project: `tardigradia-tgapp-prod`
2. Add Android app: `com.TGApp.mynewapp`
3. Download `google-services.json` → `app/src/main/google-services.json`
4. Enable Functions (us-central1)
5. Deploy `validateReceipt` function (see below)

### 3. Create Firebase Function: validateReceipt
```javascript
// functions/index.js
const { onCall } = require("firebase-functions/v2/https");
const { google } = require("googleapis");

exports.validateReceipt = onCall(async (request) => {
  const { packageName, productId, purchaseToken, orderId } = request.data;
  
  // Verify with Google Play Developer API
  const auth = new google.auth.GoogleAuth({
    scopes: ["https://www.googleapis.com/auth/androidpublisher"],
  });
  const authClient = await auth.getClient();
  const androidpublisher = google.androidpublisher({ version: "v3", auth: authClient });
  
  try {
    const purchase = await androidpublisher.purchases.subscriptions.get({
      packageName,
      subscriptionId: productId,
      token: purchaseToken,
    });
    
    // Check if purchase is valid
    if (purchase.data.paymentState === 1) { // Payment received
      // Generate JWT for license
      const jwt = generateLicenseJwt("pro");
      return { valid: true, licenseJwt: jwt };
    }
    return { valid: false };
  } catch (error) {
    console.error("Validation failed:", error);
    return { valid: false };
  }
});

function generateLicenseJwt(feature) {
  // Use RS256 with private key matching BOUNCE public key
  // Implementation depends on key management strategy
  return "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...";
}
```

### 4. Configure Play Console
1. Create subscription products:
   - `pro_yearly_499` — $49.99/year
   - `pro_monthly_499` — $4.99/month
2. Add test accounts for internal testing
3. Publish to Internal Testing track

### 5. Build & Test
```bash
# Option A: Gradle (recommended)
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP
./gradlew assembleRelease

# Option B: Command-line
./build_v101.sh all

# Install
adb install -r APK/TGApp-v1.0.1.apk

# Test billing
adb shell am start -n com.TGApp.mynewapp/.MainActivity
```

---

## Testing Checklist

| Test | Command/Action | Expected |
|------|----------------|----------|
| License validation (no license) | Launch app | `isProEnabled()` = false |
| License validation (valid JWT) | Inject JWT via Firebase | `isProEnabled()` = true |
| Purchase flow | Tap "Upgrade to Pro" | Play Billing dialog opens |
| Server validation | Complete test purchase | JWT stored, broadcast sent |
| BOUNCE receives broadcast | Install BOUNCE + TGApp | BOUNCE unlocks Pro features |
| APK delivery | Trigger from TGApp | BOUNCE APK downloaded & verified |
| ProGuard release build | `./gradlew assembleRelease` | APK < 200KB, no crashes |
| Unit tests | `./gradlew test` | All pass |

---

## APK Size Comparison

| Component | v1.0.0 | v1.0.1 (est.) |
|-----------|--------|---------------|
| classes.dex | 12 KB | 80 KB (billing, crypto, firebase) |
| resources.arsc | 5 KB | 10 KB |
| Native libs | 0 | 0 |
| ProGuard overhead | N/A | -30 KB (shrink) |
| **Total** | **21 KB** | **~150 KB** |

---

## Rollback Plan
If v1.0.1 has critical issues:
1. Revert to v1.0.0 APK (21 KB)
2. Keep v1.0.1 source for debugging
3. Hotfix via Gradle patch version

---

## Next Steps (v1.0.2+)
1. **APK Delivery** (FP021) — Download & install BOUNCE updates
2. **Feature List Sync** — Tell BOUNCE which features unlocked
3. **Fleet Key Provisioning** (TG009) — QR code fleet setup
4. **Shared Library** (TG019) — Common code Bounce↔TGApp
5. **Delta Updates** (TG029) — Binary patches for smaller downloads

---

## References
- Lessons Learned: `LESSONS_LEARNED_TGApp.md`
- Template: `APP_TEMPLATE_TGApp.md`
- Runner: `NEW_APP_RUNNER_TGApp.md`
- BOUNCE Forensic: `CSMWip/05_BOUNCE/PROOF_OF_WORK/forensic_analysis/`