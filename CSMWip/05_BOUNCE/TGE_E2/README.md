# TGE_E2 (The Grid Episode 2 — Prime Electron Worldline Emulator v2)

**Category:** CSMWip/05_BOUNCE | **State:** Part of Another Project | **Files:** ~2000+

**Parent Project:** CSMWip/05_BOUNCE

## Summary

# LESSONS_LEARNED.md — CSMWip/05_BOUNCE/TGE_E2 — TGE Episode 2: Prime Electron Worldline Emulator v2 (No-Gradle APK build, 39-piece pipeline, native Java, Fleet mode, ~1.2MB APK, ready for install test)

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The TGE_E2 project operates within the **CSMWip/05_BOUNCE** domain, functioning as a **Part of Another Project** with ~2000+ files. It is the second episode in **The Grid (TGE)** series — evolving from TGE_E1 with Fleet mode (multi-electron simulation), native Java implementation (no Kotlin), and a 39-piece verification pipeline (27 Java + 12 HTML pieces).

### Core Principles

1. **Modularity** — Components independently deployable (Java, HTML, assets)
2. **Traceability** — 39-piece pipeline with manifest verification (0-byte diff reassembly)
3. **Resilience** — No-Gradle build survives SDK/environment variations
4. **Observability** — Real-time HUD + Fleet status; Worldline steps executor
5. **Reproducibility** — Identical APK from source via `build_nogradle.sh`
6. **Continuity** — `NEXT_RUNNER.sh` enables session resume across restarts

### Component Diagram

```
TGE_E2
├── Android App (com.tge.e2)
│   ├── MainActivity.java          # Native Java (535 lines, 27 pieces)
│   ├── PrimeEngine                # Singleton: primes, gaps, worldline
│   ├── SensorEventListener        # Accelerometer → electron velocity
│   ├── FleetManager               # Multi-electron coordination
│   └── WebView (JavascriptInterface) # HTML5 canvas renderer
├── Assets
│   ├── Tile00.prime (1MB)         # PrimeBookOne tile 0
│   ├── Tile01.prime (1MB)         # PrimeBookOne tile 1
│   └── tge_e2.html (1141 lines)   # Canvas visualization (12 pieces)
├── Build System (No-Gradle)
│   ├── build_nogradle.sh          # aapt2 → javac → d8 → zipalign → apksigner
│   └── build.sh                   # Wrapper
├── 39-Piece Pipeline
│   ├── pieces/MainActivity_piece_01-27.java
│   ├── pieces/tge_e2_piece_01-12.html
│   └── ALL_PIECES_manifest.json
└── Framework
    ├── MASTER_TODO.md             # 39-piece spec
    ├── WORLD_LINE_STEPS.sh        # 17-step worldline executor
    ├── VERIFY_39_WAYS.sh          # 39-method verification
    ├── build_nogradle.sh          # No-Gradle build
    ├── verify_reassembly.sh       # 0-byte diff verification
    ├── verify_github_17ways.sh    # 17-way git verification
    ├── process_document.sh        # Pipeline orchestration
    ├── heartbeat.sh               # Session logging
    └── NEXT_RUNNER.sh             # Session continuity
```

---

## Implementation — Keymaker Protocol

### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Language | Java | 11 source/target | Native implementation (no Kotlin) |
| Build | Custom No-Gradle | aapt2/d8 | Reproducible APK builds |
| UI | Android WebView | API 24+ | HTML5 canvas renderer |
| Assets | PrimeBookOne | Tile00/Tile01 | 500K+ primes |
| Sensors | Android SensorManager | API 24+ | Accelerometer input |
| Fleet | Custom Manager | Java | Multi-electron coordination |
| Version Control | Git | — | 39-piece tracking |
| Documentation | Markdown | — | 39-piece + lessons |

### Key Files & Directories

```
./CSMWip/05_BOUNCE/TGE_E2/
├── app/
│   ├── src/main/java/com/tge/e2/MainActivity.java   # 535 lines, 27 pieces
│   ├── src/main/assets/tge_e2.html                   # 1141 lines, 12 pieces
│   ├── src/main/res/values/themes.xml                # Fixed for aapt2
│   ├── src/main/AndroidManifest.xml                  # Package com.tge.e2
│   └── out/TGE_E2-v2.0.0-E2.apk                      # Built APK (~1.2MB)
├── framework/
│   ├── MASTER_TODO.md                                # 39-piece spec
│   ├── WORLD_LINE_STEPS.sh                           # 17-step executor
│   ├── VERIFY_39_WAYS.sh                             # 39-method verification
│   ├── build_nogradle.sh                             # Working no-Gradle build
│   ├── verify_reassembly.sh                          # 0-byte diff verification
│   ├── verify_github_17ways.sh                       # 17-way git verification
│   ├── process_document.sh                           # Pipeline orchestration
│   ├── heartbeat.sh                                  # Session logging
│   └── NEXT_RUNNER.sh                                # Session continuity
├── pieces/                                           # 39 pieces + manifest
│   ├── MainActivity_piece_01-27.java
│   ├── tge_e2_piece_01-12.html
│   └── ALL_PIECES_manifest.json
├── build.sh                                          # Build wrapper
├── .gitignore
└── LESSONS_LEARNED.md                                # This project's lessons
```

### Build Commands

```bash
# No-Gradle build (preferred)
cd /workspace/app/CSMWip/05_BOUNCE/TGE_E2
./build_nogradle.sh

# Output: out/TGE_E2-v2.0.0-E2-<timestamp>.apk (~1.2MB)

# Install on device
adb install -r out/TGE_E2-v2.0.0-E2-*.apk

# Launch
adb shell am start -n com.tge.e2/.MainActivity
```

### Environment Variables

```bash
export ANDROID_HOME=/workspace/app/CSMScripts/.sdk/android-sdk
export BUILD_TOOLS_VERSION=33.0.1
export COMPILE_SDK=33
export TARGET_SDK=33
export MIN_SDK=24
```

### No-Gradle Build Pipeline (Same as TGE_E1, package: com.tge.e2)

```bash
# 1. aapt2 compile — Process resources
aapt2 compile --dir app/src/main/res -o obj/resources.zip

# 2. aapt2 link — Generate base APK + R.java
aapt2 link -o out/TGE_E2-base.apk -I android.jar \
    --manifest app/src/main/AndroidManifest.xml \
    --java gen --min-sdk-version 24 --target-sdk-version 33 \
    --version-code 2 --version-name "2.0.0-E2" obj/resources.zip

# 2b. Assets — Inject PrimeBookOne tiles + HTML
# (Same as TGE_E1)

# 3-7. javac → d8 → Package → zipalign → apksigner
# (Same pipeline, different package/version)
```

---

## Operations — El Segundo Protocol

### Session Lifecycle

1. **Startup** — Read `LESSONS_LEARNED.md` → `framework/MASTER_TODO.md` → `NEXT_RUNNER.sh`
2. **Execution** — Run `build_nogradle.sh`, verify 39-piece reassembly
3. **Heartbeat** — `framework/heartbeat.sh` logs progress every 2 min
4. **Checkpoint** — Update `LESSONS_LEARNED.md`, commit pieces to Git
5. **Handoff** — `NEXT_RUNNER.sh` preserves session state for resume

### Build & Validation

```bash
# Verify 39-piece reassembly
./framework/verify_reassembly.sh

# Verify Git integrity (17 ways)
./framework/verify_github_17ways.sh

# 39-method verification gate
./framework/VERIFY_39_WAYS.sh

# 17-step worldline execution
./framework/WORLD_LINE_STEPS.sh

# Full pipeline orchestration
./framework/process_document.sh

# APK verification
aapt2 dump badging out/TGE_E2-v2.0.0-E2-*.apk
```

### Quality Gates

- 39-piece pipeline: 0-byte diff reassembly for all pieces
- 39-method verification: All VERIFY_39_WAYS.sh checks pass
- Git verification: All 17 checks pass
- 17-step worldline: WORLD_LINE_STEPS.sh completes
- APK installs and launches on API 24+ device
- WebView loads `tge_e2.html` from assets
- PrimeEngine initializes 500K+ primes from Tile00/Tile01
- Fleet mode: Multi-electron coordination works
- Accelerometer → electron velocity mapping works
- Real-time HUD updates at 60fps (16ms Handler.postDelayed)

---

## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Visualize Prime Electron Worldline with Fleet multi-electron physics
- **Method**: Eggshell geometry boundary; multiple electrons reflect, leave worldline trails
- **Output**: `LESSONS_LEARNED.md` architecture; 39-piece component map; Fleet mode design
- **Applied Here**: Clear E1→E2 evolution (Kotlin→Java, Fleet added, pieces 40→39)

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define how the 39-piece APK is built and verified
- **Method**: No-Gradle aapt2/javac/d8 pipeline; 39-piece chunking; VERIFY_39_WAYS gate
- **Output**: `build_nogradle.sh`, `VERIFY_39_WAYS.sh`, `ALL_PIECES_manifest.json`
- **Applied Here**: Native Java (no conversion); aapt2 XML fixes from E1; WORLD_LINE_STEPS

### El Segundo Protocol — Operational Excellence

- **Purpose**: Define how the episode development runs and evolves
- **Method**: 39-piece granularity; session heartbeat; `NEXT_RUNNER.sh` continuity
- **Output**: `heartbeat.sh`, `NEXT_RUNNER.sh`, `WORLD_LINE_STEPS.sh`, `process_document.sh`
- **Applied Here**: 30s subtask limit via piece granularity; 2min heartbeat; auto-resume

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo |
|-------|----------|----------|------------|
| Design | Fleet Worldline | 39-Piece Spec | Piece Granularity |
| Build | Native Java | aapt2 Pipeline | 30s Piece Build |
| Test | Fleet+Sensor Verify | 0-Byte Diff + 39-Way | Heartbeat Monitor |
| Deploy | APK Sign/Install | Manifest Verify | NEXT_RUNNER Handoff |
| Evolve | E2→E3 Migration | Piece Reuse | Session Resume |

---

## Episode 2 Specifics

### Fleet Mode (New in E2)

- **Multi-Electron**: Up to N electrons simultaneously in eggshell
- **Coordination**: FleetManager assigns unique IDs, tracks each worldline
- **Interaction**: Electrons can collide (elastic) or pass through
- **Visualization**: Each electron gets distinct color/trail
- **Controls**: FLEET button activates; MENU adds fleet options

### Worldline Steps Executor (WORLD_LINE_STEPS.sh)

17-step automated execution:
1. Initialize PrimeEngine
2. Load Tile00.prime + Tile01.prime
3. Compute prime gaps
4. Spawn electron(s) at center
5. Initialize SensorEventListener
6. Start 60fps game loop
7. Process accelerometer events
8. Apply velocity to electron(s)
9. Check boundary collisions
10. Reflect & record worldline points
11. Check prime gap crossings
12. Render prime gap rings
13. Update HUD (position, velocity, reflections, gaps)
14. Fleet coordination step
15. Check exit conditions
16. Export worldline data
17. Cleanup & shutdown

### VERIFY_39_WAYS.sh — Merge Gate

39 independent verification methods:
- 27 Java piece integrity checks
- 12 HTML piece integrity checks
- Manifest SHA256 validation
- Reassembly byte-diff verification
- APK structure validation
- Manifest signing verification
- ... (17 Git + 22 build/asset checks)

### Asset Details

| Asset | Size | Source | Purpose |
|-------|------|--------|---------|
| Tile00.prime | 1MB | PrimeBookOne | Primes 0-250K |
| Tile01.prime | 1MB | PrimeBookOne | Primes 250K-500K |
| tge_e2.html | ~40KB | pieces/ (12) | Canvas renderer (enhanced) |

---

## Roadmap & Future Work

### Immediate (Next 1-2 Sessions)

- [ ] Commit missing framework files (WORLD_LINE_STEPS.sh, NEXT_RUNNER.sh, LESSONS_LEARNED.md)
- [ ] Push to `kilo/prime-voxel-vx8` branch, create PR
- [ ] Test APK on device/emulator (API 24+)
- [ ] Verify Fleet mode, WebView, sensors, primes

### Short Term (Next 5 Sessions)

- [ ] Add ProGuard/R8 for release build optimization
- [ ] Enhance Fleet collision physics
- [ ] Add export data functionality (worldline CSV per electron)
- [ ] Document sensor calibration procedure

### Medium Term (Episodes 3-4)

- [ ] TGE_E3: Advanced worldline physics
- [ ] TGE_E4: Narrative integration + Land of Lil bridge
- [ ] Unify piece pipeline across all episodes
- [ ] Extract common framework to shared module

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
cd /workspace/app/CSMWip/05_BOUNCE/TGE_E2
cat LESSONS_LEARNED.md
cat framework/NEXT_RUNNER.sh
cat framework/WORLD_LINE_STEPS.sh
git status

# Build
./build_nogradle.sh

# Install & test
adb install -r out/TGE_E2-v2.0.0-E2-*.apk
adb shell am start -n com.tge.e2/.MainActivity

# Verify pieces
./framework/verify_reassembly.sh
./framework/VERIFY_39_WAYS.sh
./framework/verify_github_17ways.sh

# Worldline execution
./framework/WORLD_LINE_STEPS.sh

# Full pipeline
./framework/process_document.sh

# Document operations
python3 ../../__Python_Tools/write_large_file.py verify pieces/
python3 ../../__Python_Tools/write_large_file.py concat pieces/ FinishedWork/TGE_E2.md

# Git workflow
git add -A && git commit -m 'tge_e2: <description>' && git push
```

### File Locations

- **Project Root**: `./CSMWip/05_BOUNCE/TGE_E2`
- **Parent**: `./CSMWip/05_BOUNCE`
- **APK Output**: `./out/TGE_E2-v2.0.0-E2-*.apk`
- **Built APK Copy**: `/workspace/app/TGE_E2-v2.0.0-E2.apk`
- **PrimeBookOne Tiles**: `/workspace/app/PrimeBookOne/Tile00.prime`, `Tile01.prime`
- **Framework**: `./framework/`
- **Pieces**: `./pieces/`

### Related Projects

- **Parent**: 05_BOUNCE (`../05_BOUNCE`)
- **Episode 1**: TGE_E1 (`../TGE_E1`) — 40 pieces, Kotlin→Java
- **Episode 3**: TGE_E3 (`../TGE_E3`)
- **Episode 4**: TGE_E4 (`../TGE_E4`)
- **Episode 5**: TGE_E5 (`../../11_TGApp/TGE_E5`) — Shared No-Gradle build
- **PrimeBookOne**: Prime tiles (`/workspace/app/PrimeBookOne/`)
- **Build Reference**: LandOLil v7b, Bounce v1.0.79

---

*README generated for TGE_E2 — Part of Another Project*
*Category: CSMWip/05_BOUNCE | Files: ~2000+ | Parent: CSMWip/05_BOUNCE*
*Generated following 05_BOUNCE/TGE_E5 pattern using write_large_file.py IncrementalDocumentWriter*