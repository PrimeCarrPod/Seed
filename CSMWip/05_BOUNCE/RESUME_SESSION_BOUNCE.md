# RESUME_SESSION_BOUNCE.md

## Session Context: CSMWip/05_BOUNCE

### Project State
- **Status**: Scaffold complete, build verification pending
- **Build System**: Custom No-Gradle (javac + aapt2 + d8 + zipalign + apksigner)
- **Package**: `com.csmlabs.bounce`
- **Target**: API 34, Min API 21

### What's Done
- [x] Project structure created
- [x] `build.py` — full build pipeline
- [x] `build.sh` — wrapper script
- [x] `AndroidManifest.xml` — configured
- [x] `res/values/strings.xml`, `colors.xml`, `styles.xml`
- [x] `res/layout/activity_main.xml` — FrameLayout with GameView + score/overlay
- [x] `src/com/csmlabs/bounce/MainActivity.java` — hooks GameView
- [x] `src/com/csmlabs/bounce/GameView.java` — bounce physics, touch control, game loop
- [x] `res/mipmap-*/ic_launcher.png` — placeholders
- [x] `res/mipmap-anydpi-v26/ic_launcher.xml` — adaptive icon
- [x] `TODO.md` — task tracking
- [x] `AGENTS.md` — project conventions

### What's Next
1. **Set ANDROID_SDK env vars** (point to your SDK)
2. **Run `python3 build.py build`** — verify APK builds
3. **Run `adb install -r bounce.apk`** — test on device
4. **Iterate on game logic** in `GameView.java`

### Known Issues / Blockers
- **Android SDK path** — must be configured per machine
- **Placeholder icons** — need proper assets
- **No sound/assets** — game is minimal

### Key Commands
```bash
# Build
cd /workspace/app/CSMWip/05_BOUNCE
python3 build.py build

# Clean
python3 build.py clean

# Install & test
adb install -r bounce.apk

# Logcat for debugging
adb logcat -s "Bounce:*" "AndroidRuntime:*"
```

### Related Workspace
- **Shared builder**: `__Python_Tools/build_apk.py` (for TGE_E5)
- **Root memory**: `../../MEMORY.md`
- **Root tools**: `../../TOOLS.md`

---

**Resume Command**:
```bash
cd /workspace/app/CSMWip/05_BOUNCE
cat NEXT_runner_001.md
cat RESUME_SESSION_BOUNCE.md
git status
```