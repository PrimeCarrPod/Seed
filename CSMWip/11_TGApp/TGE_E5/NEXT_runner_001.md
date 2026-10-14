# NEXT_runner_001 — TGE_E5

## Immediate Next Steps (Priority Order)

### 1. Link Shared Keystore
```bash
cd /workspace/app/CSMWip/11_TGApp/TGE_E5
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
```

### 2. Create Manifest & Resources
- [ ] `AndroidManifest.xml` with package `com.csmlabs.tge.e5`
- [ ] `res/values/strings.xml` — app_name="TGE Episode 5"
- [ ] `res/values/colors.xml` — TGE theme
- [ ] `res/layout/activity_main.xml` — episode layout
- [ ] `src/com/csmlabs/tge/e5/MainActivity.java` — minimal activity

### 3. Test Shared Build System
```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0

python3 ../../__Python_Tools/build_apk.py \
    --project . \
    --package com.csmlabs.tge.e5 \
    --output tge_e5.apk
```

### 4. Verify Install
```bash
adb install -r tge_e5.apk
```

## Key Files to Create
| File | Template From |
|------|---------------|
| `AndroidManifest.xml` | 05_BOUNCE/AndroidManifest.xml |
| `res/values/strings.xml` | 05_BOUNCE/res/values/strings.xml |
| `res/values/colors.xml` | 05_BOUNCE/res/values/colors.xml (modify colors) |
| `res/layout/activity_main.xml` | 05_BOUNCE/res/layout/activity_main.xml |
| `src/com/csmlabs/tge/e5/MainActivity.java` | 05_BOUNCE/src/com/csmlabs/bounce/MainActivity.java |

## Environment Setup (Same as 05_BOUNCE)
```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
export PATH=$PATH:$BUILD_TOOLS:$ANDROID_SDK/platform-tools
```

---

**Last Updated**: 2026-10-14
**Session**: Project scaffolded — manifest & resources next