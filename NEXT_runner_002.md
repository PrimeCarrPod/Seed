# NEXT_runner_002 — TGApp.WIP.V3 Only (Prime Electron Worldline WebGL 3D)

## Status: ⚠️ APK EXISTS BUT CRASHES ON STARTUP (2026-10-14)

**Active Project**: `CSMWip/11_TGApp/TGApp.WIP.V3` — WebGL 3D with three.js + Landolil electron physics

### Verified Environment
```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
export PATH=$PATH:$BUILD_TOOLS:$ANDROID_SDK/platform-tools
```

### Build Command (Shared build_apk.py)
```bash
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
python3 ../../__Python_Tools/build_apk.py --project . --package com.tgapp.electron.v3 --output tgapp_electron_v3.apk
```

### Verify & Install
```bash
# Verify signature
$BUILD_TOOLS/apksigner verify tgapp_electron_v3.apk

# Install on device (replaces old crashing version)
adb install -r tgapp_electron_v3.apk
```

### Critical Fix Required Before Rebuild
**CrashLogger.java:44, 96** has wrong package name:
```java
// CURRENT (buggy):
bw.write("Package: com.tgapp.electron\n");

// SHOULD BE:
bw.write("Package: com.tgapp.electron.v3\n");
```

### Known Crash (Fixed in Source, Need Rebuild)
```
Caused by: java.lang.NullPointerException: Attempt to invoke virtual method 
'android.view.WindowInsetsController com.android.internal.policy.DecorView.getWindowInsetsController()' 
on a null object reference
    at com.tgapp.electron.MainActivity.setupFullscreen(MainActivity.java:89)
```
**Root cause**: `setupFullscreen()` called before `setContentView()` in old APK. Current `MainActivity.java` has the fix (lines 86-90).

### Assets (Auto-included by build_apk.py)
- `assets/three.min.js` (three.js r158)
- `assets/tge_electron.html` (WebGL 3D electron simulation)
- `assets/Tile00.prime`, `Tile01.prime` (prime data tiles)

### Features Working After Rebuild
- WebGL 3D with three.js (Landolil/v7b physics: Berry phase, Zitterbewegung, axion coupling, Larmor/Thomas precession)
- Clean UI toggle (hides ALL menus via CLEAN button)
- HUD: X/Y/Z position & velocity, reflections, prime gaps crossed, steps
- Prime gaps from prime tiles (Tile00/01.prime)
- Sensor integration (accelerometer/gyroscope → electron velocity)
- CrashLogger with log file in Android/data + public Downloads mirror

### Large File Handling (Replaces pieces/)
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

### Heartbeat Check
```bash
./CSMWipScripts/heartbeat.sh "V3 WebGL 3D - rebuild with build_apk.py + CrashLogger fix" "PENDING" "Fix CrashLogger package name, rebuild APK, test on device"
```

---

**Last Updated**: 2026-10-14  
**Session**: V3-only workflow, shared build_apk.py, fix CrashLogger package name, rebuild & test