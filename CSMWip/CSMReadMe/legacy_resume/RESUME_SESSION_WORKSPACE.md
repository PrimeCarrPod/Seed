# RESUME_SESSION_WORKSPACE — 2026-10-15 (V3 Only)

## Session State Summary

### Current Workspace: /workspace/app
### Active Branch: kilo/live-badger-lpf (pushed to origin)
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

## TGApp.WIP.V3 — ✅ APK BUILT, TESTED, WORKING — v3.014

- **APK**: `tgapp_electron_v3_014.apk` (1.4 MB) — **CURRENT WORKING VERSION**
- **Location**: `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/tgapp_electron_v3_014.apk`
- **Package**: `com.tgapp.electron.v3`
- **Features**: 
  - WebGL 3D with three.js (Landolil/v7b physics: Berry phase, Zitterbewegung, axion coupling, Larmor precession, Thomas precession, Schwinger pair production)
  - Control Bar: SCAN | MENU | THEORY | HIDE/SHOW | ZOOM+ | ZOOM- | CLEAN | LOGS
  - HUD: X/Y/Z position & velocity, reflections, prime gaps crossed, steps, mode, zoom, Berry phase, axion field, spin (x/y/z), Schwinger count
  - Prime gaps from prime tiles (Tile00.prime, Tile01.prime) — 524,288 primes loaded
  - Sensor integration (accelerometer/gyroscope → electron velocity)
  - CrashLogger with log file in Android/data + public Downloads mirror
  - Touch: pinch zoom, two-finger rotate, mouse drag/rotate
  - **ARITHMETIC PHYSICS Sub-Menu**: 10 detailed sections with Williams/El Segundo/Keymaker personas
  - State persistence (SharedPreferences)
- **Keystore**: Symlink to `../../05_BOUNCE/debug.keystore`
- **Build script**: Local `build.py` (includes assets in APK)
- **Log file**: `/storage/emulated/0/Android/data/com.tgapp.electron.v3/files/Download/tge_electron_crash_log.txt` (also mirrored to public Downloads)

### Crash Fixes Applied (Verified Working)
- ✅ CrashLogger.java:44, 96 — package name fixed to `com.tgapp.electron.v3`
- ✅ MainActivity.java:86-90 — `setContentView()` before `setupFullscreen()` (NPE fixed)

### Version History
- `tgapp_electron_v3_010.apk` — HIDE/SHOW button for HUD
- `tgapp_electron_v3_011.apk` — ZOOM+/ZOOM- buttons, pinch zoom, mouse rotate
- `tgapp_electron_v3_012.apk` — Two-finger rotation (horizontal + elevation)
- `tgapp_electron_v3_013.apk` — Full 3D physics: ellipsoidal reflection, Zitterbewegung, Berry phase, axion field, Larmor/Thomas precession, Schwinger threshold
- `tgapp_electron_v3_014.apk` — **CURRENT** — ARITHMETIC PHYSICS sub-menu with 10 detailed explainer sections

---

## Build Commands (V3 Only — Local build.py)

```bash
# === TGApp.WIP.V3 (WebGL 3D) ===
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
python3 build.py build

# Verify
export BUILD_TOOLS=/opt/android-sdk/build-tools/34.0.0
$BUILD_TOOLS/apksigner verify tgapp_electron_v3_014.apk

# Install on device (replaces old version)
adb install -r tgapp_electron_v3_014.apk
```

---

## Large File Handling (Replaces pieces/)

```bash
# Compress large markdown/text files
python3 __Python_Tools/write_large_file.py compress PRIME_ELECTRON_COMPLETE_RESEARCH.md

# Split logical chapters
python3 __Python_Tools/write_large_file.py split bigfile.md output_dir chapter .md

# Concat, manifest, verify
python3 __Python_Tools/write_large_file.py concat chunk_dir output.md
python3 __Python_Tools/write_large_file.py manifest chunk_dir MANIFEST.json
python3 __Python_Tools/write_large_file.py verify chunk_dir MANIFEST.json
```

---

## Heartbeat

```bash
./CSMWipScripts/heartbeat.sh "V3.014 Arithmetic Physics complete" "OK" "Full 3D physics + 10-section explainer menu deployed"
```

---

## Key Files

| File | Purpose |
|------|---------|
| `/workspace/app/NEXT_runner_002.md` | V3-only build commands + version notes |
| `/workspace/app/RESUME_SESSION_WORKSPACE.md` | This file - session state |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/` | **Active project** - WebGL 3D |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/build.py` | Local No-Gradle builder (USE THIS) |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/assets/tge_electron.html` | Main simulation + physics + ARITHMETIC PHYSICS menu |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/src/com/tgapp/electron/v3/CrashLogger.java` | **FIXED**: package name lines 44, 96 |
| `/workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3/src/com/tgapp/electron/v3/MainActivity.java` | Fixed: setContentView before setupFullscreen |

---

## Git State

```bash
git status  # Clean
git branch  # kilo/live-badger-lpf
```

---

**Session saved**: 2026-10-15T03:33:00Z  
**Active project**: TGApp.WIP.V3 — v3.014 deployed with Arithmetic Physics sub-menu