# NEXT_runner_001 — Workspace Root

## Immediate Next Steps (Priority Order)

### 1. Verify Android SDK Environment
```bash
# Check SDK location
ls /opt/android-sdk/build-tools/34.0.0/aapt2
ls /opt/android-sdk/platforms/android-34/android.jar

# If missing, install:
# sdkmanager "build-tools;34.0.0" "platforms;android-34"
```

### 2. Build 05_BOUNCE (Primary)
```bash
cd /workspace/app/CSMWip/05_BOUNCE
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
python3 build.py build
adb install -r bounce.apk
```

### 3. Once 05_BOUNCE Works → TGE_E5
```bash
cd /workspace/app/CSMWip/11_TGApp/TGE_E5
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore
# Create manifest, resources, MainActivity (see NEXT_runner_001.md)
python3 ../../__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5 --output tge_e5.apk
```

### 4. Migrate Pieces → Large File Strategy
```bash
# Example: reassemble a fragmented article
python3 __Python_Tools/write_large_file.py concat pieces/article1_A1-01_piece_01.md output.md
# Or compress large files
python3 __Python_Tools/write_large_file.py compress PRIME_ELECTRON_COMPLETE_RESEARCH.md
```

### 5. Heartbeat Check
```bash
./CSMWipScripts/heartbeat.sh
```

---

## Project Status Summary

| Project | Status | Next Action |
|---------|--------|-------------|
| `CSMWip/05_BOUNCE` | Scaffolded | Build & test |
| `TGE_E5` | Scaffolded | Create manifest/resources |
| `pieces/` | Legacy fragments | Migrate to chunks/compressed |
| `__Python_Tools/` | Active | Build tools ready |

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

# Large file handling
python3 __Python_Tools/write_large_file.py --help

# Heartbeat
./CSMWipScripts/heartbeat.sh
```

---

**Last Updated**: 2026-10-14
**Session**: Workspace structure + 05_BOUNCE/TGE_E5 scaffold complete