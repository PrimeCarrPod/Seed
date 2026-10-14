# AGENTS.md — CSMWip/05_BOUNCE

## Project: Bounce (No-Gradle APK Build)

**Type**: Android app — pure Java + XML resources + Android SDK command-line tools
**Target API**: 34 (Android 14)
**Min API**: 21 (Android 5.0)
**Build System**: Custom (javac + aapt2 + d8 + zipalign + apksigner)

## Project Structure
```
05_BOUNCE/
├── AGENTS.md           # This file
├── memory/             # Daily notes
├── TODO.md             # Task list
├── build.sh            # Build entry point
├── build.py            # Python build (preferred)
├── src/                # Java source (package: com.csmlabs.bounce)
├── res/                # Android resources
│   ├── values/         # strings.xml, colors.xml, styles.xml
│   ├── layout/         # activity_main.xml, etc.
│   ├── drawable/       # icons, shapes
│   ├── xml/            # preferences, shortcuts
│   ├── anim/           # animations
│   └── raw/            # raw assets
├── AndroidManifest.xml # App manifest
├── debug.keystore      # Debug signing key
├── NEXT_runner_001.md  # Next session instructions
└── RESUME_SESSION_BOUNCE.md  # Resume context
```

## Build Commands
```bash
# From project root
./build.sh              # Full build → bounce.apk
./build.py              # Python version (better error handling)
./build.sh clean        # Clean build artifacts
./build.sh install      # Build + adb install -r
```

## Environment Variables (required)
```bash
export ANDROID_SDK=/path/to/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
```

## Java Conventions
- **Package**: `com.csmlabs.bounce`
- **Source compatibility**: 1.8
- **Target compatibility**: 1.8
- **No external deps** — only Android SDK classes
- **No AndroidX** — use framework classes directly
- **No Kotlin** — Java only

## Resource Conventions
- **strings.xml** — all user-facing text
- **colors.xml** — #ARGB format
- **styles.xml** — Theme.AppCompat base (framework)
- **layouts** — ConstraintLayout preferred, no Material Components

## Testing
- **Unit**: None (no test framework without Gradle)
- **Manual**: `adb install -r bounce.apk` → test on device/emulator
- **Lint**: `aapt2 link` catches resource errors

## Key Files to Maintain
| File | Purpose |
|------|---------|
| `AndroidManifest.xml` | Permissions, activities, services, receivers |
| `res/values/strings.xml` | All text content |
| `src/com/csmlabs/bounce/MainActivity.java` | Entry point |
| `build.py` | Build orchestration |

## Session Resume
```bash
cd CSMWip/05_BOUNCE
cat NEXT_runner_001.md
cat RESUME_SESSION_BOUNCE.md
git status
./build.sh  # verify build works
```

## Related Workspace Files
- Root `MEMORY.md` — cross-project context
- Root `TOOLS.md` — build tool details
- `__Python_Tools/build_apk.py` — shared build logic