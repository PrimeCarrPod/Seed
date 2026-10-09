# TGApp MASTER TODO LIST
**Project:** TGApp (Tardigradia App Updater) - BOUNCE Ecosystem Monetization App  
**Created:** 2026-10-09  
**Status:** Iteration 1 - Background Animation + Overlay  
**Branch:** kilo/tgapp-wip

---

## 🎯 CURRENT ITERATION: v1.0.0 - Foundation (NO MENUS, NO BUTTONS)

### ✅ COMPLETED - Infrastructure Setup
- [x] Create CSMWip/11_TGApp/TGApp.WIP directory structure
- [x] Copy and customize APP_TEMPLATE_TGApp.md
- [x] Copy NEW_APP_RUNNER_TGApp.md
- [x] Create AndroidManifest.xml with fullscreen, internet permissions
- [x] Create strings.xml, themes.xml, activity_main.xml
- [x] Create TGAppApplication.kt
- [x] Create MainActivity.kt with dual WebView architecture
- [x] Create build.sh (command-line, non-Gradle)
- [x] Create MASTER_TODO.md (this file)
- [x] Create RESUME_SESSION.sh
- [x] Create RUNNER_TGApp.md
- [x] Create session log
- [x] Create heartbeat script

### 🔄 IN PROGRESS - Core Functionality
- [ ] Test build.sh compiles without errors
- [ ] Verify APK installs on device/emulator
- [ ] Verify Antikythera animation loads from antikytherian.com
- [ ] Verify TGHC.pro overlay loads (8 google.com windows)
- [ ] Test screen rotation (portrait ↔ landscape adaptation)
- [ ] Test network offline handling (fallback to google.com)
- [ ] Verify LICENSE_UPDATED broadcast receiver registered

### ⏳ PENDING - Iteration 1 Polish
- [ ] Create debug keystore for testing
- [ ] Test WebView hardware acceleration for smooth 60fps animation
- [ ] Verify transparent overlay WebView renders correctly
- [ ] Test on various screen sizes (phone, tablet)
- [ ] Document known issues/limitations

---

## 🚀 FUTURE ITERATIONS (Post v1.0.0)

### Iteration 2: Pro Features Unlock (FP018-FP020)
- [ ] Implement BillingClient integration (Play Store)
- [ ] License validation (JWT RS256 verification)
- [ ] FeatureGate class (shared with BOUNCE)
- [ ] Pro feature gating:
  - [ ] Animation speed control (faster/slower)
  - [ ] Animation pause/resume
  - [ ] Custom animation URL input
  - [ ] Multi-window management (resize, reposition 8 windows)
- [ ] Purchase verification flow
- [ ] Offline license caching

### Iteration 3: APK Delivery & Fleet (FP021)
- [ ] Firebase Functions for APK delivery
- [ ] Firebase App Distribution integration
- [ ] Fleet key provisioning (QR code)
- [ ] Remote config for animation URLs
- [ ] Delta update support (future)

### Iteration 4: Polish & Launch
- [ ] Play Store listing assets
- [ ] Privacy policy / Terms of service
- [ ] Crashlytics integration
- [ ] CI/CD pipeline (GitHub Actions)
- [ ] Monitoring/alerting
- [ ] Beta testing program

---

## 🐛 KNOWN ISSUES / RISKS

| Issue | Severity | Mitigation |
|-------|----------|------------|
| antikytherian.com may block WebView | High | Test early; have local fallback HTML |
| tghc.pro 8-window layout may not render in WebView | Medium | Test overlay rendering; may need JS injection |
| No release keystore yet | Medium | Create debug keystore for testing; generate release later |
| WebView memory usage (2 WebViews) | Low | Monitor; use LAYER_TYPE_HARDWARE |
| Screen rotation may reload WebViews | Low | configChanges handles this |

---

## 📋 DEFINITION OF DONE (Iteration 1)
- [ ] APK builds successfully with `./build.sh all`
- [ ] APK installs on Android 9+ (API 28+)
- [ ] Antikythera gears animation visible as full-screen background
- [ ] 8 google.com windows visible as overlay (from tghc.pro)
- [ ] Rotation between portrait/landscape works without crash
- [ ] No menus, no buttons - pure WebView experience
- [ ] LICENSE_UPDATED broadcast receiver active
- [ ] Session log created in framework/logs/

---

## 🔗 DEPENDENCIES / REFERENCES
- BOUNCE Evolution: CSMWip/05_BOUNCE/FINAL_DELIVERABLES/
- Template: APP_TEMPLATE_TGApp.md
- Runner: NEW_APP_RUNNER_TGApp.md
- Build reference: CSMWip/05_BOUNCE/PROOF_OF_WORK/build_artifacts/
- Keystore reference: CSMWip/05_BOUNCE/PROOF_OF_WORK/build_artifacts/v92/debug.keystore
- GitHub Handler: csmpieces/05_scripts_tools/GitHub_handler.sh

---

## 📝 NOTES
- **First iteration constraint:** NO menus, NO buttons - just WebViews
- **Background:** antikytherian.com (Antikythera mechanism HTML5 animation)
- **Overlay:** tghc.pro (displays 8 websites → all google.com for now)
- **Architecture:** FrameLayout with 2 WebViews (background + transparent overlay)
- **Build:** Pure command-line (aapt2, d8, zipalign, apksigner) - NO Gradle
- **Integration:** Shares keystore with BOUNCE for APK updates
- **Monetization:** Pro features gated by license JWT (future iterations)