# RESUME_SESSION_TGE_E5.md

## Session Context: TGE_E5

### Project State
- **Status**: Scaffolded, needs manifest/resources
- **Build System**: Shared No-Gradle via `__Python_Tools/build_apk.py`
- **Package**: `com.csmlabs.tge.e5`
- **Target**: API 34, Min API 21
- **Keystore**: Symlink to `../../05_BOUNCE/debug.keystore`

### What's Done
- [x] Project structure created
- [x] `AGENTS.md` — project conventions
- [x] `TODO.md` — task tracking
- [x] `NEXT_runner_001.md` — next steps

### What's Next
1. **Create `AndroidManifest.xml`** (copy from 05_BOUNCE, change package)
2. **Create resource files** (strings, colors, layout)
3. **Create `MainActivity.java`** (minimal, extend AppCompatActivity)
4. **Run shared build** via `__Python_Tools/build_apk.py`
5. **Test on device**

### Key Commands
```bash
cd /workspace/app/CSMWip/11_TGApp/TGE_E5

# Link keystore (once)
ln -sf ../../05_BOUNCE/debug.keystore debug.keystore

# Build using shared builder
python3 ../../__Python_Tools/build_apk.py \
    --project . \
    --package com.csmlabs.tge.e5 \
    --output tge_e5.apk

# Install
adb install -r tge_e5.apk
```

### Dependencies
- **05_BOUNCE must build first** — validates the build system
- **Shared builder** at `../../__Python_Tools/build_apk.py`
- **Android SDK** configured via env vars

### Episode 5 Specifics (TODO)
- Narrative content structure
- Asset handling (large media → `RESTART_PACKAGE/`)
- Scene navigation
- Progress persistence

---

**Resume Command**:
```bash
cd /workspace/app/CSMWip/11_TGApp/TGE_E5
cat NEXT_runner_001.md
cat RESUME_SESSION_TGE_E5.md
git status
```