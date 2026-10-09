# TGApp RUNNER — TARDIGRADIA APP UPDATER
**Project:** TGApp (Tardigradia App Updater) - BOUNCE Ecosystem Monetization App  
**Template:** BOUNCE Evolution Forensic Analysis (91 versions, 13 sections)  
**Target Location:** `CSMWip/11_TGApp/TGApp.WIP/`  
**Branch Strategy:** `kilo/tgapp-wip` → PR → `main`  
**Created:** 2026-10-09  
**Source:** BOUNCE Evolution + Custom Requirements

---

## QUICK START — NEW SESSION

```bash
# 1. Navigate to workspace
cd /workspace/app

# 2. Source the resume script (sets up environment, aliases, verification)
source CSMWip/11_TGApp/TGApp.WIP/framework/RESUME_SESSION.sh

# 3. Build and test
tgapp-build          # Full build pipeline
tgapp-install        # Install to device
tgapp-logcat         # Monitor logs
```

---

## SESSION STARTUP CHECKLIST

- [ ] Run `source framework/RESUME_SESSION.sh`
- [ ] Verify environment: `verify_environment`
- [ ] Check git status: `tgapp-status`
- [ ] Review MASTER_TODO.md for current priorities
- [ ] Build APK: `tgapp-build`
- [ ] Test on device/emulator

---

## CORE ARCHITECTURE — ITERATION 1

### Dual WebView Design
```
┌─────────────────────────────────────┐
│           FrameLayout               │
│  ┌─────────────────────────────┐   │
│  │   background_webview        │   │  ← Antikythera animation
│  │   (antikytherian.com)       │   │     Full screen, opaque
│  │   LAYER_TYPE_HARDWARE       │   │
│  └─────────────────────────────┘   │
│  ┌─────────────────────────────┐   │
│  │   overlay_webview           │   │  ← 8 windows from tghc.pro
│  │   (tghc.pro → 8×google.com) │   │     Full screen, transparent
│  │   LAYER_TYPE_HARDWARE       │   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
```

### Key Features (Iteration 1)
| Feature | Implementation | Status |
|---------|----------------|--------|
| Antikythera Background | WebView → `https://www.antikytherian.com` | ✅ Code complete |
| TGHC.pro Overlay | WebView → `https://www.tghc.pro` (transparent) | ✅ Code complete |
| 8 Google Windows | tghc.pro renders 8 iframes → all google.com | ✅ By design |
| Screen Rotation | `configChanges` + FrameLayout match_parent | ✅ Code complete |
| Network Fallback | Offline → loads google.com directly | ✅ Code complete |
| License Broadcast | `LICENSE_UPDATED` receiver registered | ✅ Code complete |
| Fullscreen Immersive | WindowInsetsControllerCompat | ✅ Code complete |
| Hardware Acceleration | `LAYER_TYPE_HARDWARE` on both WebViews | ✅ Code complete |

### No Menus, No Buttons (Explicit Constraint)
- Pure WebView experience
- No ActionBar, no Toolbar, no FAB
- No touch handlers for controls (future iteration)
- Back button → WebView history → exit app

---

## BUILD SYSTEM — COMMAND LINE (NON-GRADLE)

### Build Script: `./build.sh`
```bash
# Full pipeline
./build.sh all

# Individual steps
./build.sh clean
./build.sh resources
./build.sh kotlin
./build.sh dex
./build.sh package
./build.sh align
./build.sh sign
./build.sh verify
```

### Toolchain (from BOUNCE Section 4)
| Tool | Version | Path |
|------|---------|------|
| JDK | 17+ (LTS) | `$JAVA_HOME` |
| Android SDK | 34 | `$ANDROID_HOME` |
| aapt2 | 34.0.0 | `build-tools/34.0.0/aapt2` |
| d8 | 34.0.0 | `build-tools/34.0.0/d8` |
| zipalign | 34.0.0 | `build-tools/34.0.0/zipalign` |
| apksigner | 34.0.0 | `build-tools/34.0.0/apksigner` |
| kotlinc | 1.9.20 | System PATH |

### Output
- **APK:** `out/TGApp-v1.0.0.apk`
- **Keystore:** `keystore/release.keystore` (or debug.keystore for testing)
- **Signed with:** Same keystore as BOUNCE for APK update compatibility

---

## ANDROID SOURCE STRUCTURE

```
src/main/
├── AndroidManifest.xml
├── java/com/TGApp/mynewapp/
│   ├── TGAppApplication.kt
│   └── MainActivity.kt
├── res/
│   ├── layout/
│   │   └── activity_main.xml
│   ├── values/
│   │   ├── strings.xml
│   │   └── themes.xml
│   └── xml/ (empty - for future network security config)
```

### Manifest Highlights
- `android:screenOrientation="sensor"` - Auto-rotate
- `android:configChanges="orientation|screenSize|screenLayout|keyboardHidden"` - No Activity recreate
- `android:theme="@style/Theme.TGApp.Fullscreen"` - Immersive
- `android:usesCleartextTraffic="true"` - For development (remove for prod)
- Permissions: INTERNET, ACCESS_NETWORK_STATE, WAKE_LOCK

---

## INTEGRATION POINTS (ENCAPSULATED FROM BOUNCE)

### Shared with BOUNCE
| Item | Value | Purpose |
|------|-------|---------|
| Keystore | `keystore/release.keystore` | APK updates signed same key |
| Broadcast Action | `LICENSE_UPDATED` | BOUNCE receives pro unlock |
| FeatureGate Class | `FeatureGate` | JWT validation (future) |
| JWT Public Key | RS256 (in template) | License verification |

### TGApp Responsibilities
- [ ] Play Store Billing (FP018)
- [ ] License Validation (FP019)
- [ ] Feature Gating (FP020)
- [ ] APK Delivery to BOUNCE (FP021)
- [ ] Fleet Key Management
- [ ] Remote Config

---

## TESTING CHECKLIST — ITERATION 1

### Functional
- [ ] APK builds without errors (`./build.sh all`)
- [ ] APK installs on API 28+ device
- [ ] Antikythera gears animation visible (full screen)
- [ ] 8 google.com windows visible in overlay
- [ ] Portrait ↔ Landscape rotation works
- [ ] No crash on rapid rotation
- [ ] Back button: WebView history → exit

### Network
- [ ] Online: loads antikytherian.com + tghc.pro
- [ ] Offline: falls back to google.com for both
- [ ] Network change: resumes loading on reconnect

### Performance
- [ ] 60fps animation (hardware accelerated)
- [ ] Memory < 200MB (2 WebViews)
- [ ] Cold start < 3 seconds
- [ ] No ANR on rotation

### Integration
- [ ] `LICENSE_UPDATED` broadcast received
- [ ] Keystore signing works
- [ ] APK verifies with `apksigner verify`

---

## KNOWN LIMITATIONS — ITERATION 1

1. **antikytherian.com may block WebView** - Some sites deny WebView user agent
   - *Mitigation:* Test early; prepare local HTML fallback
   
2. **tghc.pro 8-window layout** - May not render correctly in WebView
   - *Mitigation:* May need JS injection to force layout
   
3. **No release keystore** - Using debug keystore for testing
   - *Action:* Generate release keystore before Play Store
   
4. **Cleartext traffic enabled** - For development only
   - *Action:* Remove `usesCleartextTraffic` for production

---

## FUTURE ITERATIONS ROADMAP

### Iteration 2: Monetization Core (FP018-FP020)
- BillingClient 6.2.1 integration
- Purchase flow (monthly_499 / yearly_499)
- JWT RS256 license validation
- FeatureGate class (shared with BOUNCE)
- Pro features unlock:
  - Animation speed slider
  - Pause/resume button
  - Custom animation URL input
  - Window management (drag, resize 8 windows)

### Iteration 3: Delivery & Fleet (FP021)
- Firebase Functions: `deliverApk`, `validateReceipt`
- Firebase App Distribution for BOUNCE APKs
- Fleet key provisioning via QR
- Remote config for animation URLs

### Iteration 4: Launch Ready
- Play Store assets
- Privacy/Terms URLs
- Crashlytics
- CI/CD (GitHub Actions)
- Beta program

---

## HEARTBEAT / LOGGING

### Session Logs
Location: `framework/csmlogs/session_YYYYMMDD_HHMMSS.md`
Created: `tgapp-session-log` command

### Heartbeat
```bash
# Run periodically to log progress
./framework/heartbeat.sh
```

### Proof of Work
- Build outputs in `out/`
- Logcat captures in session logs
- Git commits on each milestone
- APK archives in `out/` with version names

---

## GITHUB HANDLER WORKFLOW (Documentation)

```bash
# For each documentation section:
export ARTICLE_PREFIX=article1

# 1. Create 13 pieces
./csmpieces/05_scripts_tools/GitHub_handler.sh create-pieces 1 "App_Architecture_Overview" article1

# 2. Edit pieces/article1-XX_App_Architecture_Overview_Piece_XX.md

# 3. Concatenate
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh concat 1

# 4. Zip & Verify
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh zip-pieces 1
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh verify 1

# 5. Organize & Commit
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh organize 1
ARTICLE_PREFIX=article1 ./csmpieces/05_scripts_tools/GitHub_handler.sh commit-push 1 "Add TGApp Section 1: Architecture - 13 pieces"
```

### Planned Sections
| N | Section | ARTICLE_PREFIX |
|---|---------|----------------|
| 1 | App_Architecture_Overview | article1 |
| 2 | Billing_License_Integration | article2 |
| 3 | Feature_Gating_Implementation | article3 |
| 4 | APK_Delivery_Update_Pipeline | article4 |
| 5 | Fleet_Key_Management | article5 |
| 6 | Testing_Launch_Checklists | article6 |
| 7 | Future_Roadmap_P0_P3 | article7 |

---

## MERGE TO MAIN

```bash
# Recommended: PR Auto-Merge
gh pr create --base main --head kilo/tgapp-wip \
  --title "Add TGApp: Tardigradia App Updater" \
  --body "Monetization app for BOUNCE ecosystem. Iteration 1: Antikythera background + TGHC overlay." \
  && gh pr merge --auto

# Alternative: Direct push (if branch protection disabled)
git push origin kilo/tgapp-wip
```

---

## KEY REFERENCES

| File | Location |
|------|----------|
| App Template | `APP_TEMPLATE_TGApp.md` |
| Master TODO | `framework/MASTER_TODO.md` |
| Resume Script | `framework/RESUME_SESSION.sh` |
| Build Script | `build.sh` |
| Session Logs | `framework/csmlogs/` |
| BOUNCE Reference | `../05_BOUNCE/FINAL_DELIVERABLES/` |
| GitHub Handler | `../../csmpieces/05_scripts_tools/GitHub_handler.sh` |

---

## CONTACT / SUPPORT

- **Project:** TGApp (Tardigradia App Updater)
- **Ecosystem:** BOUNCE Evolution
- **Purpose:** Monetization layer for BOUNCE positioning app
- **Architecture:** Dual WebView (animation background + web overlay)
- **Build:** Pure command-line Android SDK (no Gradle)

---

*Runner file for TGApp — Encapsulates all session startup, build, test, and documentation workflows.*
*All patterns derived from BOUNCE Evolution 91-version forensic analysis.*
*Iteration 1: Foundation - No menus, no buttons, pure WebView experience.*