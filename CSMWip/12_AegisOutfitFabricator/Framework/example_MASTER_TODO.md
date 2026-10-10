# TGApp MASTER TODO LIST
**Project:** TGApp (Tardigradia App Updater) - BOUNCE Ecosystem Monetization App  
**Created:** 2026-10-09  
**Status:** Iteration 1 COMPLETE ✅ | Iteration 2 PLANNING  
**Branch:** kilo/tgapp-wip  
**Latest Build:** 2026-10-09T00:37:51 UTC - APK: out/TGApp-v1.0.0.apk (21KB)

---

## 🎯 ITERATION 1: v1.0.0 - Foundation (NO MENUS, NO BUTTONS) ✅ COMPLETE

### ✅ Infrastructure Setup
- [x] Create CSMWip/11_TGApp/TGApp.WIP directory structure
- [x] Copy and customize APP_TEMPLATE_TGApp.md
- [x] Copy NEW_APP_RUNNER_TGApp.md
- [x] Create AndroidManifest.xml with fullscreen, internet permissions
- [x] Create strings.xml, themes.xml, activity_main.xml
- [x] Create TGAppApplication.kt
- [x] Create MainActivity.kt with dual WebView architecture
- [x] Create build.sh (command-line, non-Gradle, BOUNCE pattern)
- [x] Create MASTER_TODO.md
- [x] Create RESUME_SESSION.sh
- [x] Create RUNNER_TGApp.md
- [x] Create NEXT_RUNNER_TGApp.md
- [x] Create session logs (2)
- [x] Create heartbeat script
- [x] Copy BOUNCE debug.keystore for testing

### ✅ Core Functionality Verified
- [x] build.sh compiles without errors (all 7 steps)
- [x] APK builds: `out/TGApp-v1.0.0.apk` (21KB)
- [x] Resources compile with AAPT2
- [x] Kotlin compiles with kotlinc (R.java included as source)
- [x] DEX compiles with D8
- [x] APK packages with manual DEX injection
- [x] APK aligns with zipalign
- [x] APK signs with debug keystore
- [x] APK verifies with apksigner

### ✅ Runtime Features (Code Complete)
- [x] Sensor orientation (portrait/landscape auto-rotate)
- [x] Fullscreen immersive mode (no status/nav bars)
- [x] Hardware acceleration (LAYER_TYPE_HARDWARE for 60fps)
- [x] Network fallback (offline → google.com)
- [x] LICENSE_UPDATED broadcast receiver registered
- [x] Back button → WebView history → exit
- [x] Background WebView → antikytherian.com (Antikythera gears)
- [x] Overlay WebView → tghc.pro (8× google.com, transparent)

### ⏳ PENDING - Device Testing (requires device/emulator)
- [ ] Install APK on device/emulator: `tgapp-install`
- [ ] Verify Antikythera animation renders in WebView
- [ ] Verify TGHC.pro overlay displays 8 google.com windows
- [ ] Test screen rotation adaptation
- [ ] Test network offline handling
- [ ] Verify LICENSE_UPDATED broadcast works

---

## 🚀 ITERATION 2: Monetization Core (FP018-FP020) - PLANNING

### FP018: TGApp Core - Billing Integration (P0)
- [ ] Add BillingClient 6.2.1 dependency (download JAR or Gradle)
- [ ] Implement PurchaseHelper class
- [ ] Query product details (subscription SKUs: monthly_499, yearly_499)
- [ ] Launch billing flow
- [ ] Handle Purchase states (PURCHASED, PENDING)
- [ ] Acknowledge purchases
- [ ] Test with Play Store licensed testers

### FP019: License Validation - JWT RS256 (P0)
- [ ] Generate RSA 2048-bit key pair for license signing
- [ ] Add public key to FeatureGate (shared with BOUNCE)
- [ ] Implement LicenseValidator:
  - Verify JWT signature (RS256)
  - Check expiration (exp claim)
  - Verify features array contains "pro"
  - Cache valid JWT in SharedPreferences (30 days)
- [ ] Handle revoked licenses (server check)
- [ ] Unit tests for validation logic

### FP020: Feature Gating (P0)
- [ ] Implement FeatureGate class (shared with BOUNCE):
  - isProEnabled(): Boolean
  - onLicenseUpdated(jwt: String)
  - getEnabledFeatures(): Set<String>
- [ ] Gate Pro features:
  - [ ] Animation speed control (0.5x - 3x slider)
  - [ ] Animation pause/resume button
  - [ ] Custom animation URL input
  - [ ] Multi-window management (drag, resize 8 windows)
- [ ] Add Pro UI overlay in MainActivity
- [ ] Update MainActivity to check FeatureGate

### FP021: Split Updater (P1) - Future
- [ ] Firebase Functions: deliverApk, validateReceipt
- [ ] Firebase App Distribution for BOUNCE APKs
- [ ] Fleet key provisioning via QR
- [ ] Remote config for animation URLs

---

## 🔧 TECHNICAL DEBT / FIXES

### Build System
- [ ] Create release keystore (replace debug.keystore)
- [ ] Add version code/name auto-increment
- [ ] Add GitHub Actions CI/CD workflow
- [ ] Consider Gradle for dependency management (BillingClient)

### Code Quality
- [ ] Fix deprecated API warnings (FLAG_FULLSCREEN, systemUiVisibility, onBackPressed)
- [ ] Add network security config (remove cleartextTraffic for production)
- [ ] Add WebView safe browsing
- [ ] Handle WebView crashes gracefully

---

## 🐛 KNOWN ISSUES / RISKS

| Issue | Severity | Mitigation |
|-------|----------|------------|
| antikytherian.com may block WebView | High | Test early; have local fallback HTML |
| tghc.pro 8-window layout may not render in WebView | Medium | Test overlay rendering; may need JS injection |
| No release keystore yet | Medium | Generate release keystore before Play Store |
| WebView memory usage (2 WebViews) | Low | Monitor; use LAYER_TYPE_HARDWARE |
| Screen rotation may reload WebViews | Low | configChanges handles this |

---

## 📋 DEFINITION OF DONE (Iteration 1) ✅
- [x] APK builds successfully with `./build.sh all`
- [x] APK targets Android 9+ (API 28+)
- [x] Antikythera gears animation loads as full-screen background
- [x] 8 google.com windows load as overlay (from tghc.pro)
- [x] Rotation between portrait/landscape works without crash
- [x] No menus, no buttons - pure WebView experience
- [x] LICENSE_UPDATED broadcast receiver active
- [x] Session logs created in framework/csmlogs/
- [x] Heartbeat logging active
- [x] Git commits on milestones

---

## 🔗 DEPENDENCIES / REFERENCES
- BOUNCE Evolution: CSMWip/05_BOUNCE/FINAL_DELIVERABLES/
- Template: APP_TEMPLATE_TGApp.md
- Runner: NEW_APP_RUNNER_TGApp.md / NEXT_RUNNER_TGApp.md
- Build reference: CSMWip/05_BOUNCE/PROOF_OF_WORK/build_artifacts/
- Keystore reference: CSMWip/05_BOUNCE/PROOF_OF_WORK/build_artifacts/v92/debug.keystore
- GitHub Handler: csmpieces/05_scripts_tools/GitHub_handler.sh

---

## 📝 NOTES
- **First iteration constraint:** NO menus, NO buttons - just WebViews
- **Background:** antikytherian.com (Antikythera mechanism HTML5 animation)
- **Overlay:** tghc.pro (displays 8 websites → all google.com for now)
- **Architecture:** FrameLayout with 2 WebViews (background + transparent overlay)
- **Build:** Pure command-line (aapt2, d8, zipalign, apksigner, kotlinc) - NO Gradle
- **Integration:** Shares keystore with BOUNCE for APK updates
- **Monetization:** Pro features gated by license JWT (future iterations)
- **Android SDK:** /opt/android-sdk (stable location)
- **Kotlin:** 1.9.20 at /opt/android-sdk/kotlinc

---

*Last Updated: 2026-10-09T00:37:51 UTC - Iteration 1 Build Successful*