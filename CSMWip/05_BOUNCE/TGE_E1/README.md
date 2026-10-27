# TGE_E1 (The Grid Episode 1 — Prime Electron Worldline Emulator)

**Category:** CSMWip/05_BOUNCE | **State:** Part of Another Project | **Files:** ~2200+

**Parent Project:** CSMWip/05_BOUNCE

## Summary

# LESSONS_LEARNED.md — CSMWip/05_BOUNCE/TGE_E1 — TGE Episode 1: Prime Electron Worldline Emulator (No-Gradle APK build, 40-piece pipeline, Kotlin→Java conversion, ~1.2MB APK, ready for install test)

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The TGE_E1 project operates within the **CSMWip/05_BOUNCE** domain, functioning as a **Part of Another Project** with ~2200+ files. It is the first episode in **The Grid (TGE)** series — an interactive Android visualization of the Prime Electron Worldline, where a single electron traverses an eggshell geometry with prime gap thresholds derived from PrimeBookOne tiles.

### Core Principles

1. **Modularity** — Components independently deployable (Java, HTML, assets)
2. **Traceability** — 40-piece pipeline with manifest verification (0-byte diff reassembly)
3. **Resilience** — No-Gradle build survives SDK/environment variations
4. **Observability** — Real-time HUD: position, velocity, reflections, gaps crossed
5. **Reproducibility** — Identical APK from source via `build_nogradle.sh`

### Component Diagram

```
TGE_E1
├── Android App (com.tge.e1)
│   ├── MainActivity.java          # Java (converted from Kotlin)
│   ├── PrimeEngine                # Singleton: primes, gaps, worldline
│   ├── SensorEventListener        # Accelerometer → electron velocity
│   └── WebView (JavascriptInterface) # HTML5 canvas renderer
├── Assets
│   ├── Tile00.prime (1MB)         # PrimeBookOne tile 0
│   ├── Tile01.prime (1MB)         # PrimeBookOne tile 1
│   └── tge_e1.html (17KB)         # Canvas visualization
├── Build System (No-Gradle)
│   ├── build_nogradle.sh          # aapt2 → javac → d8 → zipalign → apksigner
│   ├── build.gradle.kts           # Legacy Gradle (unused)
│   └── gradle/wrapper             # Gradle wrapper (unused)
├── 40-Piece Pipeline
│   ├── pieces/MainActivity_piece_01-13.java
│   ├── pieces/tge_e1_piece_01-14.html
│   ├── pieces/MASTER_TODO_piece_01-13.md
│   └── ALL_PIECES_manifest.json
└── Framework
    ├── MASTER_TODO.md             # 40-piece spec
    ├── build.sh                   # Wrapper
    ├── heartbeat.sh               # Session logging
    ├── process_document.sh        # Pipeline orchestration
    ├── verify_reassembly.sh       # 0-byte diff verification
    └── verify_github_17ways.sh    # 17-way git verification
```

---

## Implementation — Keymaker Protocol

### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Language | Java | 11 source/target | Primary (converted from Kotlin) |
| Language (Legacy) | Kotlin | 1.8 | Original MainActivity.kt |
| Build | Custom No-Gradle | aapt2/d8 | Reproducible APK builds |
| UI | Android WebView | API 24+ | HTML5 canvas renderer |
| Assets | PrimeBookOne | Tile00/Tile01 | 500K+ primes |
| Sensors | Android SensorManager | API 24+ | Accelerometer input |
| Version Control | Git | — | 40-piece tracking |
| Documentation | Markdown | — | 40-piece + lessons |

### Key Files & Directories

```
./CSMWip/05_BOUNCE/TGE_E1/
├── app/
│   ├── src/main/java/com/tge/e1/MainActivity.java   # 449 lines, 13 pieces
│   ├── src/main/assets/tge_e1.html                   # 14 pieces
│   ├── src/main/res/values/themes.xml                # Fixed for aapt2
│   ├── src/main/AndroidManifest.xml                  # Package com.tge.e1
│   └── TGE_E1-v1.0.0-E1.apk                          # Built APK (1.2MB)
├── framework/
│   ├── MASTER_TODO.md                                # 40-piece spec
│   ├── build_nogradle.sh                             # Working no-Gradle build
│   ├── build.sh                                      # Wrapper
│   ├── heartbeat.sh                                  # Session logging
│   ├── process_document.sh                           # Pipeline orchestration
│   ├── verify_reassembly.sh                          # 0-byte diff verification
│   └── verify_github_17ways.sh                       # 17-way git verification
├── pieces/                                           # 40 pieces + manifest
│   ├── MainActivity_piece_01-13.java
│   ├── tge_e1_piece_01-14.html
│   ├── MASTER_TODO_piece_01-13.md
│   └── ALL_PIECES_manifest.json
├── build.gradle.kts / settings.gradle.kts            # Legacy Gradle
├── gradlew / gradle/wrapper                          # Legacy Gradle
├── LESSONS_LEARNED.md                                # This project's lessons
└── .gitignore
```

### Build Commands

```bash
# No-Gradle build (preferred)
cd /workspace/app/CSMWip/05_BOUNCE/TGE_E1
./build_nogradle.sh

# Output: out/TGE_E1-v1.0.0-E1-<timestamp>.apk (~1.2MB)

# Install on device
adb install -r out/TGE_E1-v1.0.0-E1-*.apk

# Launch
adb shell am start -n com.tge.e1/.MainActivity
```

### Environment Variables

```bash
export ANDROID_HOME=/workspace/app/CSMScripts/.sdk/android-sdk
export BUILD_TOOLS_VERSION=33.0.1
export COMPILE_SDK=33
export TARGET_SDK=33
export MIN_SDK=24
```

### No-Gradle Build Pipeline (7 Steps)

```bash
# 1. aapt2 compile — Process resources
aapt2 compile --dir app/src/main/res -o obj/resources.zip

# 2. aapt2 link — Generate base APK + R.java
aapt2 link -o out/TGE_E1-base.apk -I android.jar \
    --manifest app/src/main/AndroidManifest.xml \
    --java gen --min-sdk-version 24 --target-sdk-version 33 \
    --version-code 1 --version-name "1.0.0-E1" obj/resources.zip

# 2b. Assets — Inject PrimeBookOne tiles + HTML
cp PrimeBookOne/Tile00.prime app/src/main/assets/
cp PrimeBookOne/Tile01.prime app/src/main/assets/
# zip inject into base.apk

# 3. javac — Compile Java (source/target 11)
javac -source 11 -target 11 -classpath android.jar \
    -d obj -sourcepath app/src/main/java:gen $(find ... -name "*.java")

# 4. d8 — Convert to dex bytecode
d8 --lib android.jar --min-api 24 --output obj $(find obj -name "*.class")

# 5. Package — Inject dex into APK
cp out/TGE_E1-base.apk out/TGE_E1-dexed.apk
zip out/TGE_E1-dexed.apk classes.dex

# 6. zipalign — Align APK
zipalign -p -f 4 out/TGE_E1-dexed.apk out/TGE_E1-aligned.apk

# 7. apksigner — Sign APK
apksigner sign --ks keystore/debug.keystore --ks-pass env:ANDROID_KEYSTORE_PASS \
    --out out/TGE_E1-v1.0.0-E1.apk out/TGE_E1-aligned.apk
```

---

## Operations — El Segundo Protocol

### Session Lifecycle

1. **Startup** — Read `LESSONS_LEARNED.md` → `framework/MASTER_TODO.md` → `NEXT_RUNNER.sh`
2. **Execution** — Run `build_nogradle.sh`, verify 40-piece reassembly
3. **Heartbeat** — `framework/heartbeat.sh` logs progress every 2 min
4. **Checkpoint** — Update `LESSONS_LEARNED.md`, commit pieces to Git
5. **Handoff** — `NEXT_RUNNER.sh` preserves session state for resume

### Build & Validation

```bash
# Verify 40-piece reassembly
./framework/verify_reassembly.sh

# Verify Git integrity (17 ways)
./framework/verify_github_17ways.sh

# Full pipeline orchestration
./framework/process_document.sh

# APK verification
aapt2 dump badging out/TGE_E1-v1.0.0-E1-*.apk
```

### Quality Gates

- 40-piece pipeline: 0-byte diff reassembly for all pieces
- Git verification: All 17 checks pass
- APK installs and launches on API 24+ device
- WebView loads `tge_e1.html` from assets
- PrimeEngine initializes 500K+ primes from Tile00/Tile01
- Accelerometer → electron velocity mapping works
- Real-time HUD updates at 60fps (16ms Handler.postDelayed)

---

## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Visualize Prime Electron Worldline with prime gap physics
- **Method**: Eggshell geometry boundary; electron reflects, leaves worldline trail
- **Output**: `LESSONS_LEARNED.md` architecture section; 40-piece component map
- **Applied Here**: Clear episode structure (E1→E2→E3→E4 evolution)

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define how the 40-piece APK is built and verified
- **Method**: No-Gradle aapt2/javac/d8 pipeline; 40-piece chunking with manifest
- **Output**: `build_nogradle.sh`, `verify_reassembly.sh`, `ALL_PIECES_manifest.json`
- **Applied Here**: Kotlin→Java conversion; aapt2 XML strictness fixes; asset injection

### El Segundo Protocol — Operational Excellence

- **Purpose**: Define how the episode development runs and evolves
- **Method**: 40-piece granularity; session heartbeat; `NEXT_RUNNER.sh` continuity
- **Output**: `heartbeat.sh`, `NEXT_RUNNER.sh`, `process_document.sh`
- **Applied Here**: 30s subtask limit via piece granularity; 2min heartbeat; auto-resume

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo |
|-------|----------|----------|------------|
| Design | Eggshell Worldline | 40-Piece Spec | Piece Granularity |
| Build | Kotlin→Java | aapt2 Pipeline | 30s Piece Build |
| Test | Sensor+HUD Verify | 0-Byte Diff | Heartbeat Monitor |
| Deploy | APK Sign/Install | Manifest Verify | NEXT_RUNNER Handoff |
| Evolve | E1→E2 Migration | Piece Reuse | Session Resume |

---

## Episode 1 Specifics

### Prime Electron Worldline Physics

- **Geometry**: Elliptical eggshell boundary (blue), electron (cyan) at center
- **Motion**: Accelerometer → velocity kick → elastic reflection off boundary
- **Trail**: Worldline history rendered as fading line segments
- **Prime Gaps**: Rings appear when electron crosses prime gap thresholds
- **Primes**: 500K+ loaded from PrimeBookOne Tile00.prime + Tile01.prime
- **Gaps**: Computed on init from prime differences

### UI Controls (Bottom Bar)

| Button | Function |
|--------|----------|
| SCAN | Random velocity kick to electron |
| MENU | Fullscreen modal (7 options) |
| THEORY | Prime gap theory explanation |
| FLEET | Multi-electron mode (stub) |
| CLEAN | Clear worldline trail |

### MENU Modal Options (7)

1. Worldline Theory
2. Prime Gap Physics
3. Eggshell Geometry
4. Sensor Calibration
5. Fleet Configuration
6. Export Data
7. About TGE E1

### Asset Details

| Asset | Size | Source | Purpose |
|-------|------|--------|---------|
| Tile00.prime | 1MB | PrimeBookOne | Primes 0-250K |
| Tile01.prime | 1MB | PrimeBookOne | Primes 250K-500K |
| tge_e1.html | 17KB | pieces/ (14) | Canvas renderer |

---

## Roadmap & Future Work

### Immediate (Next 1-2 Sessions)

- [ ] Test APK on device/emulator (API 24+)
- [ ] Verify WebView loads, sensors respond, primes initialize
- [ ] Push to `kilo/tge-e1-wip` branch, create PR
- [ ] Remove unused Gradle files (`gradlew`, `gradle/wrapper`, `build.gradle.kts`)

### Short Term (Next 5 Sessions)

- [ ] Add ProGuard/R8 for release build optimization
- [ ] Implement Fleet mode (multi-electron)
- [ ] Add export data functionality (worldline CSV)
- [ ] Document sensor calibration procedure

### Medium Term (Episodes 2-4)

- [ ] TGE_E2: Fleet mode + 39-piece pipeline (27 Java + 12 HTML)
- [ ] TGE_E3: Advanced worldline physics
- [ ] TGE_E4: Narrative integration + Land of Lil bridge
- [ ] Unify piece pipeline across all episodes

### Long Term (Ongoing)

- [ ] Extract build to shared `__Python_Tools/build_apk.py`
- [ ] CI/CD pipeline for automated builds
- [ ] Cross-episode state synchronization
- [ ] Publish to CSMPublished when release-ready

---

## Appendix — Quick Reference

### Key Commands

```bash
# Session startup
cd /workspace/app/CSMWip/05_BOUNCE/TGE_E1
cat LESSONS_LEARNED.md
cat framework/NEXT_RUNNER.sh
git status

# Build
./build_nogradle.sh

# Install & test
adb install -r out/TGE_E1-v1.0.0-E1-*.apk
adb shell am start -n com.tge.e1/.MainActivity

# Verify pieces
./framework/verify_reassembly.sh
./framework/verify_github_17ways.sh

# Document operations
python3 ../../__Python_Tools/write_large_file.py verify pieces/
python3 ../../__Python_Tools/write_large_file.py concat pieces/ FinishedWork/TGE_E1.md

# Git workflow
git add -A && git commit -m 'tge_e1: <description>' && git push
```

### File Locations

- **Project Root**: `./CSMWip/05_BOUNCE/TGE_E1`
- **Parent**: `./CSMWip/05_BOUNCE`
- **APK Output**: `./out/TGE_E1-v1.0.0-E1-*.apk`
- **Built APK Copy**: `/workspace/app/TGE_E1-v1.0.0-E1.apk`
- **DropBox Copy**: `/workspace/app/CSMDropBox/TGE_E1-v1.0.0-E1.apk`
- **PrimeBookOne Tiles**: `/workspace/app/PrimeBookOne/Tile00.prime`, `Tile01.prime`
- **Framework**: `./framework/`
- **Pieces**: `./pieces/`

### Related Projects

- **Parent**: 05_BOUNCE (`../05_BOUNCE`)
- **Episode 2**: TGE_E2 (`../TGE_E2`) — Fleet mode, 39 pieces
- **Episode 3**: TGE_E3 (`../TGE_E3`)
- **Episode 4**: TGE_E4 (`../TGE_E4`)
- **Episode 5**: TGE_E5 (`../../11_TGApp/TGE_E5`) — Shared No-Gradle build
- **PrimeBookOne**: Prime tiles (`/workspace/app/PrimeBookOne/`)
- **Build Reference**: LandOLil v7b, Bounce v1.0.79

---

*README generated for TGE_E1 — Part of Another Project*
*Category: CSMWip/05_BOUNCE | Files: ~2200+ | Parent: CSMWip/05_BOUNCE*
*Generated following 05_BOUNCE/TGE_E5 pattern using write_large_file.py IncrementalDocumentWriter*