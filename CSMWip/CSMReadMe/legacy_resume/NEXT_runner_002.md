# NEXT_runner_002 — TGApp.WIP.V3 Only (Prime Electron Worldline WebGL 3D)

## Status: ✅ APK BUILT, TESTED, WORKING — v3.014 (2026-10-15)

**Active Project**: `CSMWip/11_TGApp/TGApp.WIP.V3` — WebGL 3D with three.js + Landolil electron physics

### Verified Environment
```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
export PATH=$PATH:$BUILD_TOOLS:$ANDROID_SDK/platform-tools
```

### Build Command (Local build.py — includes assets)
```bash
cd /workspace/app/CSMWip/11_TGApp/TGApp.WIP.V3
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
python3 build.py build
```

### Current APK
- **File**: `tgapp_electron_v3_014.apk` (1.4 MB)
- **Package**: `com.tgapp.electron.v3`
- **Signed & verified** with debug.keystore

### Verify & Install
```bash
export BUILD_TOOLS=/opt/android-sdk/build-tools/34.0.0
$BUILD_TOOLS/apksigner verify tgapp_electron_v3_014.apk
adb install -r tgapp_electron_v3_014.apk
```

### Crash Fixes Applied (Working)
- ✅ CrashLogger.java:44, 96 — package name fixed to `com.tgapp.electron.v3`
- ✅ MainActivity.java:86-90 — `setContentView()` before `setupFullscreen()` (NPE fixed)

### Assets (Included by build.py)
- `assets/three.min.js` (three.js r158)
- `assets/tge_electron.html` (WebGL 3D electron simulation with full physics)
- `assets/Tile00.prime`, `Tile01.prime` (prime data tiles)

### Features Working (v3.014)
- **Control Bar**: SCAN | MENU | THEORY | HIDE/SHOW | ZOOM+ | ZOOM- | CLEAN | LOGS
- **HUD**: Position, Velocity, Reflections, Prime Gaps, Steps, Mode, Zoom, Berry Phase, Axion Field, Spin (x/y/z), Schwinger Count
- **3D Physics**: Ellipsoidal boundary with correct 3D reflection (gradient normal)
- **Zitterbewegung**: 1.55×10²¹ Hz trembling from even/odd gap interference
- **Berry Phase**: Geometric phase accumulation from gap ratios
- **Axion Field**: PQ symmetry from gap modulo-6 classes (1,5 mod 6)
- **Larmor Precession**: Spin precession in axion field (ω_L = eB/mₑ)
- **Thomas Precession**: Relativistic spin precession from acceleration (ω_T = a²/2c²)
- **Schwinger Pair Production**: Vacuum breakdown at E > 1.32×10¹⁸ V/m
- **Prime Gap Proper Time**: Δτₙ = κ·dₙ where κ = ℏ/(mₑc²)
- **Touch Controls**: Pinch zoom, two-finger rotate, mouse drag/rotate
- **ARITHMETIC PHYSICS Sub-Menu**: 10 detailed sections with Williams/El Segundo/Keymaker personas
- **State Persistence**: All toggle states saved to SharedPreferences

### Version Scheme
- APK naming: `tgapp_electron_v3_XXX.apk` (010, 011, 012, 013, 014...)
- Next version: `tgapp_electron_v3_015.apk`

### Large File Handling (Replaces pieces/)
```bash
python3 __Python_Tools/write_large_file.py compress PRIME_ELECTRON_COMPLETE_RESEARCH.md
python3 __Python_Tools/write_large_file.py split bigfile.md output_dir chapter .md
python3 __Python_Tools/write_large_file.py concat chunk_dir output.md
python3 __Python_Tools/write_large_file.py manifest chunk_dir MANIFEST.json
python3 __Python_Tools/write_large_file.py verify chunk_dir MANIFEST.json
```

### Heartbeat
```bash
./CSMWipScripts/heartbeat.sh "V3.014 Arithmetic Physics complete" "OK" "Full 3D physics + 10-section explainer menu deployed"
```

---

**Last Updated**: 2026-10-15  
**Session**: v3.014 — Arithmetic Physics sub-menu with 3-persona explanations, full 3D ellipsoidal physics