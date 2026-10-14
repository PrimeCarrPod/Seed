# NEXT_runner_001 — Workspace Root

## Status: ✅ FOUR PROJECTS BUILD SUCCESSFUL (2026-10-14)

### Android SDK Environment — ✅ VERIFIED
```bash
# SDK installed at /opt/android-sdk
# Build tools 34.0.0: aapt2, d8, zipalign, apksigner ✅
# Platform android-34: android.jar ✅
```

### 1. 05_BOUNCE (Primary) — ✅ COMPLETE
```bash
cd /workspace/app/CSMWip/05_BOUNCE
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
python3 build.py build
# → bounce.apk created (25KB)
```

### 2. TGE_E5 (Episode 5) — ✅ COMPLETE
```bash
cd /workspace/app/CSMWip/11_TGApp/TGE_E5
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
python3 /workspace/app/__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5 --output tge_e5.apk
# → tge_e5.apk created (17KB)
```

### 3. TGApp.WIP.V2 (Prime Electron Worldline - 2D Canvas) — ✅ COMPLETE
```bash
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V2
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
python3 /workspace/app/__Python_Tools/build_apk.py --project . --package com.tgapp.electron --output tgapp_electron.apk
# Add assets + re-sign
python3 -c "
import zipfile
with zipfile.ZipFile('tgapp_electron.apk', 'a') as z:
    z.write('assets/tge_electron.html', 'assets/tge_electron.html')
    z.write('assets/Tile00.prime', 'assets/Tile00.prime')
    z.write('assets/Tile01.prime', 'assets/Tile01.prime')
"
$BUILD_TOOLS/zipalign -f 4 tgapp_electron.apk tgapp_electron_aligned.apk
$BUILD_TOOLS/apksigner sign --ks debug.keystore --ks-pass pass:android --key-pass pass:android tgapp_electron_aligned.apk
mv tgapp_electron_aligned.apk tgapp_electron.apk
# → tgapp_electron.apk created (2.1 MB with prime tiles)
# Working 2D electron simulation with HUD, prime gaps, sensor integration
```

### 4. TGApp.WIP.V3 (Prime Electron Worldline - WebGL 3D) — 🚧 IN PROGRESS
```bash
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
# Uses three.js (downloaded to assets/three.min.js)
# WebGL 3D electron with three.js
# Clean UI toggle button (hides ALL menus)
python3 /workspace/app/__Python_Tools/build_apk.py --project . --package com.tgapp.electron.v3 --output tgapp_electron_v3.apk
```

### 5. Migrate Pieces → Large File Strategy
```bash
python3 __Python_Tools/write_large_file.py --help
```

### 6. Heartbeat Check
```bash
./CSMWipScripts/heartbeat.sh
```

---

## Project Status Summary

| Project | Status | APK Size | Next Action |
|---------|--------|----------|-------------|
| `CSMWip/05_BOUNCE` | ✅ Build verified | 25KB | Test on device, polish |
| `CSMWip/11_TGApp/TGE_E5` | ✅ Build verified | 17KB | Add episode content |
| `CSMWip/11_TGApp/TGApp.WIP.V2` | ✅ Build verified | 2.1 MB | 2D Canvas working |
| `CSMWip/11_TGApp/TGApp.WIP.V3` | 🚧 In progress | — | WebGL 3D + clean UI toggle |
| `pieces/` | Legacy fragments | — | Migrate to chunks/compressed |
| `__Python_Tools/` | Active | — | Build tools ready |

---

## Key Commands Reference

```bash
# Root resume
cat NEXT_runner_001.md
cat RESUME_SESSION_WORKSPACE.md
git status

# Build 05_BOUNCE
cd CSMWip/05_BOUNCE && python3 build.py build

# Build TGE_E5 (shared)
cd CSMWip/11_TGApp/TGE_E5 && python3 ../../__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5

# Build TGApp.WIP.V2 (2D Canvas)
cd CSMWip/11_TGApp/TGApp.WIP.V2 && python3 ../../__Python_Tools/build_apk.py --project . --package com.tgapp.electron

# Build TGApp.WIP.V3 (WebGL 3D)
cd CSMWip/11_TGApp/TGApp.WIP.V3 && python3 ../../__Python_Tools/build_apk.py --project . --package com.tgapp.electron.v3

# Large file handling
python3 __Python_Tools/write_large_file.py --help

# Heartbeat
./CSMWipScripts/heartbeat.sh
```

---

**Last Updated**: 2026-10-14
**Session**: V2 2D Canvas working ✅ — V3 WebGL 3D in progress
