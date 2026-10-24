# TGE_E4 (The Grid Episode 4 — Prime Electron Worldline Emulator v4)

**Category:** CSMWip/05_BOUNCE | **State:** Part of Another Project | **Files:** ~2000+

**Parent Project:** CSMWip/05_BOUNCE

## Summary

# LESSONS_LEARNED.md — CSMWip/05_BOUNCE/TGE_E4 — TGE Episode 4: Prime Electron Worldline Emulator v4 (No-Gradle APK build, 39-piece pipeline, native Java, narrative integration + Land of Lil bridge, ~1.2MB APK, ready for install test)

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The TGE_E4 project operates within the **CSMWip/05_BOUNCE** domain, functioning as a **Part of Another Project** with ~2000+ files. It is the fourth episode in **The Grid (TGE)** series — the narrative culmination before TGE_E5, integrating the Prime Electron Worldline physics with the **Land of Lil** narrative universe. It bridges the SubAtomic Prime Electron framework with the Lil game engine, featuring story-driven worldline missions, character progression, and cross-project asset sharing.

### Core Principles

1. **Modularity** — Components independently deployable (Java, HTML, assets, narrative)
2. **Traceability** — 39-piece pipeline with manifest verification (0-byte diff reassembly)
3. **Resilience** — No-Gradle build survives SDK/environment variations
4. **Observability** — Real-time HUD + Narrative log + Character state; Worldline steps executor
5. **Reproducibility** — Identical APK from source via `build_nogradle.sh`
6. **Continuity** — `NEXT_RUNNER.sh` enables session resume across restarts
7. **Narrative Integration** — Physics serves story; Lil characters guide worldline journey

### Component Diagram

```
TGE_E4
├── Android App (com.tge.e4)
│   ├── MainActivity.java          # Native Java (535+ lines, 27 pieces)
│   ├── PrimeEngine                # Singleton: primes, gaps, worldline
│   ├── QuantumEngine              # Tunneling, relativistic corrections
│   ├── GeometryManager            # Multi-geometry support
│   ├── NarrativeEngine            # Story missions, character arcs
│   ├── LilBridge                  # Land of Lil character integration
│   ├── SensorEventListener        # Accelerometer → electron velocity
│   ├── FleetManager               # Multi-electron coordination
│   └── WebView (JavascriptInterface) # HTML5 canvas + narrative UI
├── Assets
│   ├── Tile00.prime (1MB)         # PrimeBookOne tile 0
│   ├── Tile01.prime (1MB)         # PrimeBookOne tile 1
│   ├── tge_e4.html (narrative)    # Canvas + story UI (12 pieces)
│   ├── lil_characters.json        # Character definitions
│   └── mission_data.json          # Story mission definitions
├── Build System (No-Gradle)
│   ├── build_nogradle.sh          # aapt2 → javac → d8 → zipalign → apksigner
│   └── build.sh                   # Wrapper
├── 39-Piece Pipeline
│   ├── pieces/MainActivity_piece_01-27.java
│   ├── pieces/tge_e4_piece_01-12.html
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
| UI | Android WebView | API 24+ | HTML5 canvas + narrative UI |
| Assets | PrimeBookOne | Tile00/Tile01 | 500K+ primes |
| Sensors | Android SensorManager | API 24+ | Accelerometer input |
| Physics | QuantumEngine + GeometryManager | Java | Advanced worldline physics |
| Narrative | NarrativeEngine + LilBridge | Java | Story + character integration |
| Fleet | Custom Manager | Java | Multi-electron coordination |
| Version Control | Git | — | 39-piece tracking |
| Documentation | Markdown | — | 39-piece + lessons |

### Key Files & Directories

```
./CSMWip/05_BOUNCE/TGE_E4/
├── app/
│   ├── src/main/java/com/tge/e4/MainActivity.java   # 535+ lines, 27 pieces
│   ├── src/main/assets/tge_e4.html                   # Narrative UI, 12 pieces
│   ├── src/main/assets/lil_characters.json           # Lil character defs
│   ├── src/main/assets/mission_data.json             # Story missions
│   ├── src/main/res/values/themes.xml                # Fixed for aapt2
│   ├── src/main/AndroidManifest.xml                  # Package com.tge.e4
│   └── out/TGE_E4-v4.0.0-E4.apk                      # Built APK (~1.2MB)
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
│   ├── tge_e4_piece_01-12.html
│   └── ALL_PIECES_manifest.json
├── build.sh                                          # Build wrapper
├── .gitignore
└── LESSONS_LEARNED.md                                # This project's lessons (copied from E2)
```

### Build Commands

```bash
# No-Gradle build (preferred)
cd /workspace/app/CSMWip/05_BOUNCE/TGE_E4
./build_nogradle.sh

# Output: out/TGE_E4-v4.0.0-E4-<timestamp>.apk (~1.2MB)

# Install on device
adb install -r out/TGE_E4-v4.0.0-E4-*.apk

# Launch
adb shell am start -n com.tge.e4/.MainActivity
```

### Environment Variables

```bash
export ANDROID_HOME=/workspace/app/CSMScripts/.sdk/android-sdk
export BUILD_TOOLS_VERSION=33.0.1
export COMPILE_SDK=33
export TARGET_SDK=33
export MIN_SDK=24
```

### No-Gradle Build Pipeline (Same pattern, package: com.tge.e4, version: 4.0.0-E4)

```bash
# 1. aapt2 compile — Process resources
aapt2 compile --dir app/src/main/res -o obj/resources.zip

# 2. aapt2 link — Generate base APK + R.java
aapt2 link -o out/TGE_E4-base.apk -I android.jar \
    --manifest app/src/main/AndroidManifest.xml \
    --java gen --min-sdk-version 24 --target-sdk-version 33 \
    --version-code 4 --version-name "4.0.0-E4" obj/resources.zip

# 2b. Assets — Inject PrimeBookOne tiles + HTML + Narrative assets
cp /workspace/app/PrimeBookOne/Tile00.prime app/src/main/assets/
cp /workspace/app/PrimeBookOne/Tile01.prime app/src/main/assets/
# Inject lil_characters.json, mission_data.json

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
aapt2 dump badging out/TGE_E4-v4.0.0-E4-*.apk
```

### Quality Gates

- 39-piece pipeline: 0-byte diff reassembly for all pieces
- 39-method verification: All VERIFY_39_WAYS.sh checks pass
- Git verification: All 17 checks pass
- 17-step worldline: WORLD_LINE_STEPS.sh completes
- APK installs and launches on API 24+ device
- WebView loads `tge_e4.html` + narrative UI from assets
- PrimeEngine initializes 500K+ primes from Tile00/Tile01
- QuantumEngine: Tunneling, relativistic corrections active
- GeometryManager: Multi-geometry switching works
- NarrativeEngine: Story missions, character progression work
- LilBridge: Land of Lil characters appear, guide player
- Fleet mode: Multi-electron coordination works
- Accelerometer → electron velocity mapping works
- Real-time HUD + Narrative log + Character state at 60fps

---

## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Unify Prime Electron physics with Land of Lil narrative
- **Method**: Worldline as hero's journey; prime gaps as narrative thresholds; Lil characters as guides
- **Output**: `LESSONS_LEARNED.md` architecture; 39-piece component map; Narrative/Lil integration
- **Applied Here**: Clear E1→E2→E3→E4 evolution (physics → fleet → quantum → narrative)

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define how the narrative+physics APK is built and verified
- **Method**: No-Gradle aapt2/javac/d8 pipeline; 39-piece chunking; VERIFY_39_WAYS gate
- **Output**: `build_nogradle.sh`, `VERIFY_39_WAYS.sh`, `ALL_PIECES_manifest.json`
- **Applied Here**: Native Java; NarrativeEngine/LilBridge added; WORLD_LINE_STEPS extended

### El Segundo Protocol — Operational Excellence

- **Purpose**: Define how the episode development runs and evolves
- **Method**: 39-piece granularity; session heartbeat; `NEXT_RUNNER.sh` continuity
- **Output**: `heartbeat.sh`, `NEXT_RUNNER.sh`, `WORLD_LINE_STEPS.sh`, `process_document.sh`
- **Applied Here**: 30s subtask limit via piece granularity; 2min heartbeat; auto-resume

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo |
|-------|----------|----------|------------|
| Design | Narrative Worldline | 39-Piece Spec | Piece Granularity |
| Build | Native Java + Story | aapt2 Pipeline | 30s Piece Build |
| Test | Story+Physics Verify | 0-Byte Diff + 39-Way | Heartbeat Monitor |
| Deploy | APK Sign/Install | Manifest Verify | NEXT_RUNNER Handoff |
| Evolve | E4→E5 Migration | Piece Reuse | Session Resume |

---

## Episode 4 Specifics

### Narrative Engine (New in E4)

- **Story Missions**: 7 chapters, each tied to prime gap milestones
- **Character Arcs**: Lil (protagonist), Prime (guide), Electron (player avatar)
- **Dialogue System**: Branching conversations at gap crossings
- **Progression**: Worldline distance unlocks lore entries
- **Endings**: 3 variants based on gaps crossed / path chosen

### Lil Bridge (New in E4)

| Lil Character | Role | Worldline Function |
|---------------|------|-------------------|
| Lil | Protagonist | Player avatar, makes choices at gaps |
| Prime | Guide | Explains prime physics, unlocks theory |
| Electron | Companion | Visualizes quantum state, reacts to player |
| Gap Warden | Guardian | Blocks unready players at major gaps |
| Memory Keeper | Archivist | Stores worldline history, exports data |

### Mission Data Structure (mission_data.json)

```json
{
  "missions": [
    {"id": 1, "title": "First Reflection", "gap": 2, "lil_dialogue": "..."},
    {"id": 2, "title": "Prime Threshold", "gap": 3, "lil_dialogue": "..."},
    {"id": 3, "title": "Tunneling Discovery", "gap": 5, "lil_dialogue": "..."},
    {"id": 4, "title": "Relativistic Limit", "gap": 7, "lil_dialogue": "..."},
    {"id": 5, "title": "Geometry Shift", "gap": 11, "lil_dialogue": "..."},
    {"id": 6, "title": "Fleet Convergence", "gap": 13, "lil_dialogue": "..."},
    {"id": 7, "title": "Worldline Complete", "gap": 17, "lil_dialogue": "..."}
  ]
}
```

### Extended Worldline Steps (WORLD_LINE_STEPS.sh — 20 steps + narrative)

1-17. (Same as TGE_E3 quantum steps)
18. Check narrative mission triggers at gap crossings
19. Render Lil character dialogue / guidance
20. Update character progression & lore unlocks
21. Check ending conditions (3 variants)
22. Export narrative + worldline + quantum data
23. Cleanup & shutdown

### Asset Details

| Asset | Size | Source | Purpose |
|-------|------|--------|---------|
| Tile00.prime | 1MB | PrimeBookOne | Primes 0-250K |
| Tile01.prime | 1MB | PrimeBookOne | Primes 250K-500K |
| tge_e4.html | ~50KB | pieces/ (12) | Canvas + narrative UI |
| lil_characters.json | ~5KB | assets/ | Character definitions |
| mission_data.json | ~8KB | assets/ | Story missions |

---

## Roadmap & Future Work

### Immediate (Next 1-2 Sessions)

- [ ] Commit framework files (WORLD_LINE_STEPS.sh, NEXT_RUNNER.sh, LESSONS_LEARNED.md)
- [ ] Add narrative assets (lil_characters.json, mission_data.json) to Git
- [ ] Push to GitHub branch, create PR
- [ ] Test APK on device/emulator (API 24+)
- [ ] Verify NarrativeEngine, LilBridge, all physics, WebView, sensors, primes

### Short Term (Next 5 Sessions)

- [ ] Add ProGuard/R8 for release build optimization
- [ ] Implement all 7 story missions with dialogue
- [ ] Add character portrait artwork
- [ ] Document narrative design document

### Medium Term (Episode 5 / TGE_E5)

- [ ] TGE_E5: Shared No-Gradle build via `__Python_Tools/build_apk.py`
- [ ] Cross-episode state sync (E1-E4 progress carries to E5)
- [ ] Unify piece pipeline across all episodes
- [ ] Extract common framework to shared module
- [ ] Full Land of Lil integration (shared assets, characters)

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
cd /workspace/app/CSMWip/05_BOUNCE/TGE_E4
cat LESSONS_LEARNED.md
cat framework/NEXT_RUNNER.sh
cat framework/WORLD_LINE_STEPS.sh
git status

# Build
./build_nogradle.sh

# Install & test
adb install -r out/TGE_E4-v4.0.0-E4-*.apk
adb shell am start -n com.tge.e4/.MainActivity

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
python3 ../../__Python_Tools/write_large_file.py concat pieces/ FinishedWork/TGE_E4.md

# Git workflow
git add -A && git commit -m 'tge_e4: <description>' && git push
```

### File Locations

- **Project Root**: `./CSMWip/05_BOUNCE/TGE_E4`
- **Parent**: `./CSMWip/05_BOUNCE`
- **APK Output**: `./out/TGE_E4-v4.0.0-E4-*.apk`
- **Built APK Copy**: `/workspace/app/TGE_E4-v4.0.0-E4.apk`
- **PrimeBookOne Tiles**: `/workspace/app/PrimeBookOne/Tile00.prime`, `Tile01.prime`
- **Framework**: `./framework/`
- **Pieces**: `./pieces/`
- **Land of Lil**: `/workspace/app/CSMApps/landolil/` (cross-reference)

### Related Projects

- **Parent**: 05_BOUNCE (`../05_BOUNCE`)
- **Episode 1**: TGE_E1 (`../TGE_E1`) — 40 pieces, Kotlin→Java
- **Episode 2**: TGE_E2 (`../TGE_E2`) — Fleet mode, 39 pieces
- **Episode 3**: TGE_E3 (`../TGE_E3`) — Quantum + Geometry
- **Episode 5**: TGE_E5 (`../../11_TGApp/TGE_E5`) — Shared No-Gradle build
- **Land of Lil**: CSMApps/landolil (`/workspace/app/CSMApps/landolil/`)
- **PrimeBookOne**: Prime tiles (`/workspace/app/PrimeBookOne/`)
- **Build Reference**: LandOLil v7b, Bounce v1.0.79

---

*README generated for TGE_E4 — Part of Another Project*
*Category: CSMWip/05_BOUNCE | Files: ~2000+ | Parent: CSMWip/05_BOUNCE*
*Generated following 05_BOUNCE/TGE_E5 pattern using write_large_file.py IncrementalDocumentWriter*