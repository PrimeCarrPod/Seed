# RESUME_SESSION_WORKSPACE — 2026-10-14

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

## TGApp.WIP.V3 — ✅ COMPLETE (WebGL 3D with Landolil electron physics)

- **APK**: `tgapp_electron_v3.apk` (1.4 MB)
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
- **Build script**: `build.py` (hard-coded V2 build process)

---

## Build Commands (V3 Only)

```bash
# === TGApp.WIP.V3 (WebGL 3D) ===
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
python3 build.py build

# Verify
export BUILD_TOOLS=/opt/android-sdk/build-tools/34.0.0
$BUILD_TOOLS/apksigner verify tgapp_electron_v3.apk

# Install on device
adb install -r tgapp_electron_v3.apk
```

---

## Key Files

| File | Purpose |
|------|---------|
| `/workspace/app/NEXT_runner_001.md` | Build commands + project status |
| `/workspace/app/RESUME_SESSION_WORKSPACE.md` | This file - session state |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/` | **Active project** - WebGL 3D |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/build.py` | V3 build script (V2 process) |
| `/workspace/app/__Python_Tools/build_apk.py` | Shared No-Gradle builder |

---

## Git State

```bash
git status  # Clean
git branch  # kilo/active-vertex-nla
```

---

## Heartbeat

```bash
./CSMWipScripts/heartbeat.sh "V3 WebGL 3D with Landolil physics" "OK" "tgapp_electron_v3.apk 1.4 MB verified"
```

---

**Session saved**: 2026-10-14T23:20:00Z
**Active project**: TGApp.WIP.V3 — APK on branch with Landolil electron physics integrated
