# NEXT_RUNNER_TGApp.md — ITERATION 2 PLANNER
**Project:** TGApp (Tardigradia App Updater) - BOUNCE Ecosystem Monetization App  
**Current State:** Iteration 1 COMPLETE - APK builds successfully  
**Next Target:** Iteration 2 - Monetization Core (FP018-FP020)  
**Branch:** `kilo/tgapp-wip`  
**Created:** 2026-10-09

---

## 🎯 ITERATION 1 STATUS: ✅ COMPLETE

### Build Verification
- ✅ APK builds: `./build.sh all` → `out/TGApp-v1.0.0.apk` (21KB)
- ✅ Resources compile with AAPT2
- ✅ Kotlin compiles with kotlinc (R.java included)
- ✅ DEX compiles with D8
- ✅ APK packages with manual DEX injection
- ✅ APK aligns with zipalign
- ✅ APK signs with debug keystore (BOUNCE debug.keystore)
- ✅ APK verifies with apksigner

### Architecture Implemented
```
FrameLayout (match_parent)
├── background_webview → https://www.antikytherian.com (Antikythera gears)
└── overlay_webview  → https://www.tghc.pro (8× google.com, transparent)
```

### Features Working
- Sensor orientation (portrait/landscape auto-rotate)
- Fullscreen immersive mode (no status/nav bars)
- Hardware acceleration (LAYER_TYPE_HARDWARE)
- Network fallback (offline → google.com)
- LICENSE_UPDATED broadcast receiver registered
- Back button → WebView history → exit

---

## 🚀 ITERATION 2: MONETIZATION CORE (FP018-FP020)

### Priority 0: FP018 - TGApp Core (Billing)
- [ ] Add BillingClient 6.2.1 dependency
- [ ] Implement PurchaseHelper class
- [ ] Add queryProductDetailsAsync for subscription SKUs
- [ ] Implement launchBillingFlow
- [ ] Handle Purchase.PurchaseState.PURCHASED/PENDING
- [ ] Acknowledge purchases
- [ ] Test with Play Store test tracks (licensed testers)

### Priority 0: FP019 - License Validation (JWT RS256)
- [ ] Generate RSA key pair (2048-bit) for license signing
- [ ] Add public key to FeatureGate (shared with BOUNCE)
- [ ] Implement LicenseValidator class:
  - Verify JWT signature (RS256)
  - Check expiration (exp claim)
  - Verify features array contains "pro"
  - Cache valid JWT in SharedPreferences
- [ ] Add offline validation (cached JWT valid for 30 days)
- [ ] Handle revoked licenses (server check)

### Priority 0: FP020 - Feature Gating
- [ ] Implement FeatureGate class (shared with BOUNCE):
  - isProEnabled(): Boolean
  - onLicenseUpdated(jwt: String)
  - getEnabledFeatures(): Set<String>
- [ ] Gate Pro features:
  - Animation speed control (0.5x - 3x)
  - Pause/resume animation
  - Custom animation URL input
  - Window management (drag, resize 8 windows)
- [ ] Update MainActivity to check FeatureGate before enabling Pro UI
- [ ] Add Pro UI overlay (speed slider, pause button, URL input)

### Priority 1: FP021 - Split Updater (Future)
- [ ] Firebase Functions: deliverApk, validateReceipt
- [ ] Firebase App Distribution for BOUNCE APKs
- [ ] Fleet key provisioning via QR
- [ ] Remote config for animation URLs

---

## 🔧 TECHNICAL DEBT / FIXES NEEDED

### Build System
- [ ] Create release keystore (replace debug.keystore)
- [ ] Add version code/name auto-increment
- [ ] Add ProGuard/R8 obfuscation (optional)
- [ ] Add GitHub Actions CI/CD workflow

### Code Quality
- [ ] Fix deprecated API warnings (FLAG_FULLSCREEN, systemUiVisibility, onBackPressed)
- [ ] Add network security config (remove cleartextTraffic)
- [ ] Add WebView safe browsing
- [ ] Handle WebView crashes gracefully

### Testing
- [ ] Test on API 28, 29, 30, 31, 32, 33, 34
- [ ] Test rotation on tablet
- [ ] Test WebView memory leaks
- [ ] Test offline/online transitions

---

## 📋 NEXT SESSION CHECKLIST

```bash
# 1. Resume session
source CSMWip/11_TGApp/TGApp.WIP/framework/RESUME_SESSION.sh

# 2. Verify environment
verify_environment

# 3. Check current status
tgapp-status

# 4. Review MASTER_TODO.md for priorities
cat framework/MASTER_TODO.md

# 5. Start Iteration 2: Add BillingClient
# (Edit build.sh to include BillingClient JAR or use Gradle for this phase)
```

---

## 📦 DEPENDENCIES FOR ITERATION 2

### Required Libraries (download JARs or use Gradle)
| Library | Version | Purpose |
|---------|---------|---------|
| BillingClient | 6.2.1 | Play Store billing |
| Firebase BOM | 32.7.0 | Firebase integration |
| Firebase Functions | latest | Cloud functions |
| Kotlin Coroutines | 1.7.3 | Async operations |
| Gson / Kotlinx Serialization | latest | JSON parsing |
| Nimbus JOSE+JWT | 9.37 | JWT validation |

### Key Generation
```bash
# Generate RSA key pair for license signing
openssl genrsa -out private_key.pem 2048
openssl rsa -in private_key.pem -pubout -out public_key.pem
# Add public_key.pem to FeatureGate in both TGApp and BOUNCE
```

---

## 🔗 INTEGRATION POINTS (BOUNCE ECOSYSTEM)

### Shared with BOUNCE
| Component | TGApp Role | BOUNCE Role |
|-----------|------------|-------------|
| Keystore | Signs APKs | Verifies APK updates |
| LICENSE_UPDATED | Broadcasts | Receives, refreshes FeatureGate |
| FeatureGate | Validates JWT | Gates Pro features |
| JWT Public Key | Embedded | Embedded (same) |

### Firebase Project Setup
- Project: `tardigradia-tgapp-prod`
- Region: `us-central1`
- Functions: `validateReceipt`, `deliverApk`, `provisionFleetKey`
- App Distribution: BOUNCE testers group

---

## 📚 REFERENCE DOCUMENTS

| Document | Location |
|----------|----------|
| APP_TEMPLATE_TGApp.md | `/workspace/app/CSMWip/11_TGApp/TGApp.WIP/` |
| MASTER_TODO.md | `framework/MASTER_TODO.md` |
| RUNNER_TGApp.md | `framework/RUNNER_TGApp.md` |
| BOUNCE Section 7 (Roadmap) | `../../05_BOUNCE/FINAL_DELIVERABLES/sections/A7-07_Future_Progress_Roadmap_P0_P3.md` |
| BOUNCE Section 8 (Architecture) | `../../05_BOUNCE/FINAL_DELIVERABLES/sections/A8-08_TGAPP_Monetization_Architecture.md` |
| GitHub Handler | `../../csmpieces/05_scripts_tools/GitHub_handler.sh` |

---

## 🎯 DEFINITION OF DONE - ITERATION 2

- [ ] Play Store billing flow works (test purchase → license granted)
- [ ] License validation works (valid/expired/revoked)
- [ ] FeatureGate correctly gates Pro features
- [ ] Pro UI accessible (speed, pause, custom URL, window mgmt)
- [ ] Offline license check works (cached JWT)
- [ ] Unit tests for LicenseValidator, FeatureGate
- [ ] APK size < 5MB
- [ ] All deprecation warnings resolved

---

*Next Runner for TGApp — Iteration 2 Planning*
*Based on BOUNCE Evolution FP018-FP021 roadmap*
*Build system: Command-line (aapt2/d8/zipalign/apksigner/kotlinc)*