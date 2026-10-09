# TGApp (Tardigradia App Updater)

**BOUNCE Ecosystem Monetization App** - Iteration 1

## Overview
TGApp is the monetization layer for the BOUNCE positioning app ecosystem. It handles:
- Play Store billing & subscriptions
- License validation (JWT RS256)
- Feature gating (Free vs Pro)
- APK delivery to BOUNCE users via Firebase App Distribution
- Fleet key management for device provisioning

## Iteration 1: Foundation (Current)
**No menus, no buttons** - Pure WebView experience:
- **Background:** Antikythera mechanism animation from `https://www.antikytherian.com`
- **Overlay:** 8 web windows from `https://www.tghc.pro` (currently all google.com)
- **Architecture:** Dual WebView in FrameLayout (background opaque + overlay transparent)
- **Build:** Command-line Android SDK (aapt2, d8, zipalign, apksigner) - NO Gradle
- **Orientation:** Sensor-based auto-rotation with seamless layout adaptation

## Quick Start

```bash
# 1. Setup environment (requires Android SDK 34, JDK 17, Kotlin 1.9.20)
source framework/RESUME_SESSION.sh

# 2. Build APK
./build.sh all

# 3. Install to device
adb install -r out/TGApp-v1.0.0.apk

# 4. Monitor logs
adb logcat -s "TGApp_MainActivity" "TGApp" "WebView" "chromium"
```

## Directory Structure
```
TGApp.WIP/
├── src/main/                 # Android source code
│   ├── AndroidManifest.xml
│   ├── java/com/TGApp/mynewapp/
│   │   ├── TGAppApplication.kt
│   │   └── MainActivity.kt
│   └── res/
│       ├── layout/activity_main.xml
│       ├── values/strings.xml
│       └── values/themes.xml
├── build.sh                  # Command-line build script
├── framework/                # Session management
│   ├── MASTER_TODO.md        # Master task list
│   ├── RESUME_SESSION.sh     # Environment setup
│   ├── RUNNER_TGApp.md       # This documentation
│   ├── heartbeat.sh          # Progress logging
│   └── csmlogs/              # Session logs
├── keystore/                 # Release keystore (add before production)
├── out/                      # Signed APKs
├── build/                    # Build intermediates
├── pieces/                   # Documentation pieces (GitHub Handler)
├── sections/                 # Concatenated sections
├── logs/                     # Project logs
├── zip/                      # Piece archives
├── forensic/                 # Forensic analysis (optional)
└── csmlogs/                  # Session logs
```

## Key Files

| File | Purpose |
|------|---------|
| `APP_TEMPLATE_TGApp.md` | App configuration (identity, features, build, signing, backend) |
| `NEW_APP_RUNNER_TGApp.md` | BOUNCE template runner documentation |
| `build.sh` | Full build pipeline (clean→resources→kotlin→dex→package→align→sign→verify) |
| `framework/MASTER_TODO.md` | Master task list with iteration tracking |
| `framework/RESUME_SESSION.sh` | Session environment setup (source this) |
| `framework/RUNNER_TGApp.md` | Complete runner documentation |
| `framework/heartbeat.sh` | Periodic progress logging |

## Build Requirements
- **JDK 17+** (LTS)
- **Android SDK 34** (platforms; build-tools 34.0.0; cmdline-tools)
- **Kotlin 1.9.20** (kotlinc in PATH)
- **Environment variables:**
  - `JAVA_HOME` → JDK 17 path
  - `ANDROID_HOME` → Android SDK path
  - `KEYSTORE_PASS` / `KEY_PASS` → Keystore passwords (CI/CD only)

## Integration with BOUNCE
- **Shared keystore:** Same signing key for APK updates
- **Broadcast:** `LICENSE_UPDATED` → BOUNCE receives pro unlock
- **FeatureGate:** Shared class for JWT validation
- **JWT Algorithm:** RS256 with public key in template

## Future Iterations

| Iteration | Focus | Roadmap Items |
|-----------|-------|---------------|
| 2 | Monetization Core | FP018 (Billing), FP019 (License), FP020 (Feature Gates) |
| 3 | Delivery & Fleet | FP021 (Split Updater), Firebase Functions, Fleet Keys |
| 4 | Launch Ready | Play Store, CI/CD, Crashlytics, Beta Program |

## Pro Features (Planned)
- Animation speed control (faster/slower)
- Pause/resume animation
- Custom animation URL input
- Multi-window management (drag, resize 8 windows)
- Fleet key access
- Priority APK updates
- Remote config sync

## License
Part of BOUNCE Evolution ecosystem. See BOUNCE documentation for licensing.

---

*Generated from BOUNCE Evolution Template - 91 versions analyzed, 13 sections complete*
*Iteration 1: 2026-10-09*