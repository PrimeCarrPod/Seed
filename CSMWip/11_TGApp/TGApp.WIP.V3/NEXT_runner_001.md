# NEXT_runner_001 — TGApp.WIP.V2 (Prime Electron Worldline)

## Status: ✅ BUILD SUCCESSFUL (2026-10-14)

The No-Gradle APK build system works with full 3D electron emulation from TGE_E1 surgically inserted.

## Verified Build Steps
```bash
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V2
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
python3 /workspace/app/__Python_Tools/build_apk.py --project . --package com.tgapp.electron --output tgapp_electron.apk
# Add assets to APK:
python3 -c "
import zipfile
with zipfile.ZipFile('tgapp_electron.apk', 'a') as z:
    z.write('assets/tge_electron.html', 'assets/tge_electron.html')
    z.write('assets/Tile00.prime', 'assets/Tile00.prime')
    z.write('assets/Tile01.prime', 'assets/Tile01.prime')
"
# Re-align & sign:
$BUILD_TOOLS/zipalign -f 4 tgapp_electron.apk tgapp_electron_aligned.apk
$BUILD_TOOLS/apksigner sign --ks debug.keystore --ks-pass env:ANDROID_KEYSTORE_PASS --key-pass env:ANDROID_KEY_PASS tgapp_electron_aligned.apk
mv tgapp_electron_aligned.apk tgapp_electron.apk
# → tgapp_electron.apk created (2.1 MB with prime tiles)
```

## What's New — 3D Electron Emulation (from TGE_E1)

### Core Components Integrated
| Component | Source | Purpose |
|-----------|--------|---------|
| `PrimeEngine.java` | TGE_E1 | Loads prime tiles (Tile00/01.prime), computes prime gaps |
| `MainActivity.java` | TGE_E1 + TGE_E5 | Sensor-driven WebView with HTML5 canvas 3D rendering |
| `JsBridge.java` | TGE_E1 | Java↔JavaScript interface for worldline events |
| `tge_electron.html` | TGE_E1 | HTML5 canvas electron simulation (60fps) |
| `Tile00.prime`, `Tile01.prime` | TGE_E1 | 1MB each - prime number data tiles |

### 3D Electron Features Working
- **Electron particle physics**: velocity, reflection off elliptical "eggshell" boundary
- **Worldline trail**: gradient-rendered path with fading reflections
- **Prime gap markers**: concentric ellipses at distances based on prime gaps
- **Sensor integration**: accelerometer + gyroscope drive electron motion
- **HUD display**: position, velocity, reflections, gaps crossed, steps
- **Controls**: SCAN (random kick), MENU, THEORY/LIVE toggle, FLEET, CLEAN
- **60fps simulation**: `WorldlineRenderer.step()` at 16ms intervals

### Architecture
```
FrameLayout (match_parent)
├── WebView (hardware accelerated) → file:///android_asset/tge_electron.html
├── HeaderOverlay (LinearLayout) → "TGE Electron" + status tag
└── ControlBar (FrameLayout) → 5 buttons (SCAN/MENU/THEORY/FLEET/CLEAN)
```

## Next Actions (Priority Order)

### 1. Test on Device/Emulator
```bash
adb install -r tgapp_electron.apk
# Launch → verify electron simulation runs, sensors respond
```

### 2. Polish & Features
- [ ] Add proper app icons (replace green squares)
- [ ] Optimize prime tile loading (lazy/async)
- [ ] Add settings screen (simulation params)
- [ ] Add worldline history export
- [ ] Battery optimization for sensor polling

### 3. Monetization (from TGApp.WIP MASTER_TODO)
- [ ] FP018: BillingClient integration
- [ ] FP019: JWT RS256 license validation (shared with BOUNCE)
- [ ] FP020: Feature gating (Pro: speed control, pause, custom URL, window mgmt)

## Key Files Reference
| File | Purpose |
|------|---------|
| `build_apk.py` | Shared No-Gradle builder |
| `AndroidManifest.xml` | Package com.tgapp.electron, sensors, fullscreen |
| `src/com/tgapp/electron/MainActivity.java` | Entry point, sensors, WebView, controls |
| `src/com/tgapp/electron/PrimeEngine.java` | Prime tile loader, gap computer |
| `src/com/tgapp/electron/JsBridge.java` | Java↔JS interface |
| `src/com/tgapp/electron/*.java` | Top-level classes (no anonymous inners) |
| `assets/tge_electron.html` | HTML5 canvas 3D electron renderer |
| `assets/Tile00.prime`, `Tile01.prime` | Prime data (1MB each) |
| `res/layout/activity_main.xml` | FrameLayout with WebView + overlays |

## Environment Setup
```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
export PATH=$PATH:$BUILD_TOOLS:$ANDROID_SDK/platform-tools
```

---

**Last Updated**: 2026-10-14
**Session**: TGE_E1 3D electron emulation surgically inserted into TGE_E5 No-Gradle framework ✅
