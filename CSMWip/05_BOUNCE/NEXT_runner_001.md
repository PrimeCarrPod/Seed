# NEXT_runner_001 — CSMWip/05_BOUNCE

## Immediate Next Steps (Priority Order)

### 1. Verify Build System Works
```bash
cd /workspace/app/CSMWip/05_BOUNCE
export ANDROID_SDK=/opt/android-sdk  # Adjust to your SDK path
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
python3 build.py build
```

**Expected**: `bounce.apk` created in project root

### 2. Test on Device/Emulator
```bash
adb install -r bounce.apk
# Launch app, verify bounce game works
```

### 3. If Build Fails - Debug Checklist
- [ ] Android SDK installed at `$ANDROID_SDK`
- [ ] Build tools 34.0.0 present
- [ ] Platform android-34 present
- [ ] `aapt2`, `d8`, `zipalign`, `apksigner` in `$BUILD_TOOLS`
- [ ] Java 8+ available (`javac -version`)

### 4. Once Build Works - Next Features
- [ ] Add proper app icons (replace placeholders in mipmap-*)
- [ ] Add sound effects (res/raw/)
- [ ] Add high score persistence (SharedPreferences)
- [ ] Add settings screen
- [ ] Polish physics/visuals

## Key Files to Reference
| File | Purpose |
|------|---------|
| `build.py` | Main build script |
| `AndroidManifest.xml` | App config |
| `src/com/csmlabs/bounce/GameView.java` | Game logic |
| `src/com/csmlabs/bounce/MainActivity.java` | Entry point |
| `res/layout/activity_main.xml` | UI layout |

## Environment Setup (Add to ~/.bashrc)
```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
export PATH=$PATH:$BUILD_TOOLS:$ANDROID_SDK/platform-tools
```

## Shared Build for TGE_E5
Once 05_BOUNCE builds successfully:
```bash
# Test shared builder
cd /workspace/app/CSMWip/11_TGApp/TGE_E5
python3 ../../__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5 --output tge_e5.apk
```

---

**Last Updated**: 2026-10-14
**Session**: Initial scaffold complete — build verification next