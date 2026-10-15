# RESUME_SESSION_WORKSPACE — 2026-10-14 (V3 Only)

## Session State Summary

### Current Workspace: /workspace/app
### Active Branch: kilo/active-vertex-nla (pushed to origin)
### Git Status: Clean (all changes committed)
### **ACTIVE PROJECT**: CSMWip/11_TGApp/TGApp.WIP.V3 (WebGL 3D with Landolil electron physics)

---

## Android SDK Environment (✅ VERIFIED)

```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
export PATH=$PATH:$BUILD_TOOLS:$ANDROID_SDK/platform-tools
```

**Tools available:**
- `/opt/android-sdk/build-tools/34.0.0/aapt2`
- `/opt/android-sdk/build-tools/34.0.0/d8`
- `/opt/android-sdk/build-tools/34.0.0/zipalign`
- `/opt/android-sdk/build-tools/34.0.0/apksigner`
- `/opt/android-sdk/platforms/android-34/android.jar`

---

## TGApp.WIP.V3 — ⚠️ APK BUILT BUT CRASHES ON STARTUP (NEEDS REBUILD)

- **APK**: `tgapp_electron_v3.apk` (1.4 MB) — EXISTS but is stale (crashes)
- **Location**: `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/tgapp_electron_v3.apk`
- **Package**: `com.tgapp.electron.v3` (different from V2's `com.tgapp.electron`)
- **Features**: 
  - WebGL 3D with three.js (three.min.js r158)
  - **Landolil/v7b electron physics**: Berry phase accumulation, Zitterbewegung oscillation, axion field coupling, Larmor precession, Thomas precession, Schwinger pair production threshold
  - Clean UI toggle (hides ALL menus)
  - HUD with X/Y/Z position and velocity
  - Prime gaps from prime tiles (Tile00.prime, Tile01.prime)
  - Sensor integration (accelerometer/gyroscope → electron velocity)
  - CrashLogger with log file in Android/data
- **Keystore**: Symlink to `../../05_BOUNCE/debug.keystore`
- **Assets**: `three.min.js`, `tge_electron.html`, `Tile00.prime`, `Tile01.prime`
- **Log file**: `/storage/emulated/0/Android/data/com.tgapp.electron.v3/files/Download/tge_electron_crash_log.txt` (also mirrored to public Downloads)
- **Build script**: Use shared `../../__Python_Tools/build_apk.py` (NOT local build.py)

### CRASH DETAILS (Fixed in Source, Need Rebuild)
```
Caused by: java.lang.NullPointerException: Attempt to invoke virtual method 
'android.view.WindowInsetsController com.android.internal.policy.DecorView.getWindowInsetsController()' 
on a null object reference
    at com.tgapp.electron.MainActivity.setupFullscreen(MainActivity.java:89)
```
**Fix applied in MainActivity.java**: `setContentView()` now called before `setupFullscreen()` (lines 86-90). Rebuild required.

### BUG: CrashLogger.java Wrong Package Name
- **File**: `src/com/tgapp/electron/v3/CrashLogger.java:44` and line 96
- **Current**: `Package: com.tgapp.electron`
- **Should be**: `Package: com.tgapp.electron.v3`

---

## Build Commands (V3 Only — Shared build_apk.py)

```bash
# === TGApp.WIP.V3 (WebGL 3D) ===
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
python3 ../../__Python_Tools/build_apk.py --project . --package com.tgapp.electron.v3 --output tgapp_electron_v3.apk

# Verify
export BUILD_TOOLS=/opt/android-sdk/build-tools/34.0.0
$BUILD_TOOLS/apksigner verify tgapp_electron_v3.apk

# Install on device (replaces crashing version)
adb install -r tgapp_electron_v3.apk
```

---

## Key Files

| File | Purpose |
|------|---------|
| `/workspace/app/NEXT_runner_002.md` | V3-only build commands + crash fix notes |
| `/workspace/app/RESUME_SESSION_WORKSPACE.md` | This file - session state |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/` | **Active project** - WebGL 3D |
| `/workspace/app/__Python_Tools/build_apk.py` | Shared No-Gradle builder (USE THIS) |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/src/com/tgapp/electron/v3/CrashLogger.java` | **FIX NEEDED**: package name lines 44, 96 |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/src/com/tgapp/electron/v3/MainActivity.java` | Fixed: setContentView before setupFullscreen |

---

## Git State

```bash
git status  # Clean
git branch  # kilo/active-vertex-nla
```

---

## Heartbeat

```bash
./CSMWipScripts/heartbeat.sh "V3 WebGL 3D - rebuild with build_apk.py + CrashLogger fix" "PENDING" "Fix CrashLogger package name, rebuild APK, test on device"
```

---

**Session saved**: 2026-10-14T23:56:00Z  
**Active project**: TGApp.WIP.V3 — Fix CrashLogger package name, rebuild with build_apk.py, test on device