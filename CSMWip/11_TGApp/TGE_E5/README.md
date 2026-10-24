# TGE_E5 (The Grid Episode 5)

**Category:** CSMWip | **State:** Part of Another Project | **Files:** 52

**Parent Project:** CSMWip/11_TGApp

## Summary

# TODO.md — CSMWip/11_TGApp/TGE_E5 — TGE Episode 5 Android app using shared No-Gradle build system (52 files, has TODO, has NEXT)

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The TGE_E5 project operates within the **CSMWip/11_TGApp** domain, functioning as a **Part of Another Project** with 52 files. It belongs to the TGE (The Grid Episodes) series, sharing the No-Gradle APK build system established by 05_BOUNCE.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails
5. **Reproducibility** — Identical builds from source using shared toolchain

### Component Diagram

```
TGE_E5
├── Core Module (MainActivity)
├── Resource Layer (strings, colors, layout)
├── Manifest & Config
├── Build System (shared via __Python_Tools)
├── Signing (shared debug.keystore)
└── Episode Content (narrative/visualization)
```

---

## Implementation — Keymaker Protocol

### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Language | Java | 1.8 source/target | Primary implementation |
| Build | Custom No-Gradle (aapt2 + javac + d8) | — | Reproducible APK builds |
| Resources | XML (values, layout, mipmap) | Android SDK | UI & assets |
| Manifest | XML | Android SDK | App configuration |
| Version Control | Git | — | Distributed workflow |
| Documentation | Markdown + write_large_file.py | — | Chapter-based authoring |
| Signing | apksigner | Android SDK | Debug keystore |

### Key Files & Directories

```
./CSMWip/11_TGApp/TGE_E5/
├── README.md                     # This file
├── AGENTS.md                     # Project conventions
├── TODO.md                       # Task hierarchy
├── memory/                       # Daily session logs
├── NEXT_runner_001.md            # Next session instructions
├── RESUME_SESSION_TGE_E5.md      # Resume context
├── AndroidManifest.xml           # App manifest (package: com.csmlabs.tge.e5)
├── debug.keystore                # Symlink to ../../05_BOUNCE/debug.keystore
├── build.py                      # Shared build wrapper
├── tge_e5.apk                    # Built APK (17KB)
├── tge_e5.aligned.apk.idsig      # APK signature
├── src/
│   └── com/csmlabs/tge/e5/
│       └── MainActivity.java     # Entry point (extends Activity)
└── res/
    ├── values/
    │   ├── strings.xml           # App name: "TGE Episode 5"
    │   ├── colors.xml            # TGE dark theme (#1A237E primary)
    │   └── styles.xml            # Material theme
    ├── layout/
    │   └── activity_main.xml     # Episode 5 layout
    ├── mipmap-*/                 # App icons (from 05_BOUNCE)
    └── mipmap-anydpi-v26/        # Adaptive icon
```

### Configuration

Key configuration files:

- `AGENTS.md` — Project-specific conventions and commands
- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)
- `memory/YYYY-MM-DD.md` — Raw daily logs
- `NEXT_runner_XXX.md` — Next session instructions
- `AndroidManifest.xml` — Package `com.csmlabs.tge.e5`, minSdk 21, targetSdk 34

### Build Commands

```bash
# From project root
python3 ../../__Python_Tools/build_apk.py \
    --project . \
    --package com.csmlabs.tge.e5 \
    --output tge_e5.apk

# Install on device
adb install -r tge_e5.apk
```

### Environment Variables (required)

```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
```

---

## Operations — El Segundo Protocol

### Session Lifecycle

1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`
2. **Execution** — Process subtasks sequentially with 30s timeout guard
3. **Heartbeat** — Progress output every 2 minutes (120s interval)
4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask
5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION_TGE_E5.md`

### Build & Validation

```bash
# Verify APK integrity
aapt2 dump badging tge_e5.apk

# Rebuild from source
python3 ../../__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5 --output tge_e5.apk

# Install and test
adb install -r tge_e5.apk
adb shell am start -n com.csmlabs.tge.e5/.MainActivity
```

### Quality Gates

- APK must build without errors via shared build script
- `aapt2 dump badging` must show correct package and activity
- APK must install and launch on API 21-34
- Manifest verification via `apksigner verify`

---

## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define what the system *is* and *why* it exists
- **Method**: Boundary analysis, component mapping, dependency graphs
- **Output**: `AGENTS.md` conventions, clear project categorization
- **Applied Here**: Explicit parent-child relationship (CSMWip/11_TGApp), episode-based structure

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define *how* the system is built and validated
- **Method**: Reproducible builds, shared toolchain, manifest verification
- **Output**: Shared `build_apk.py`, symlinked keystore, APK signature
- **Applied Here**: No-Gradle builds, chapter-based documents, SHA256 verification via `write_large_file.py`

### El Segundo Protocol — Operational Excellence

- **Purpose**: Define *how* the system runs and evolves
- **Method**: Session resume, heartbeat monitoring, subtask granularity
- **Output**: `NEXT_runner_XXX.md`, `HEARTBEAT.md`, `memory/` logs
- **Applied Here**: 30s subtask limit, 2min heartbeat, auto-continue queue

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo |
|-------|----------|----------|------------|
| Design | Boundaries | Tech Stack | Session Model |
| Build | Components | Shared Pipeline | 30s Timeout |
| Test | Interfaces | APK Verify | Device Test |
| Deploy | Contracts | Reproducible | Handoff |
| Evolve | Versioning | Migration | Resume |

---

## Episode 5 Specifics

### Narrative Context

TGE_E5 is the fifth episode in **The Grid** (TGE) interactive narrative series. It continues the story/visualization established in previous episodes, using the same No-Gradle Android framework.

### Content Structure

- **Theme**: Continuation of TGE narrative
- **Content Type**: Interactive story/visualization
- **Assets**: Images, audio — large media handled via `RESTART_PACKAGE/`
- **Navigation**: Scene-based progression
- **Persistence**: Save/restore progress

### Asset Management

Large media assets (exceeding APK size limits) should be stored in `RESTART_PACKAGE/` and loaded at runtime:

```bash
# Compress large assets
python3 ../../__Python_Tools/write_large_file.py compress <asset>

# Decompress at runtime
python3 ../../__Python_Tools/write_large_file.py decompress <asset.gz>
```

---

## Roadmap & Future Work

### Immediate (Next 1-2 Sessions)

- [ ] Test APK on device/emulator (API 21-34)
- [ ] Verify TGE Episode 5 displays correctly
- [ ] Establish project-specific `memory/` logging

### Short Term (Next 5 Sessions)

- [ ] Implement episode narrative/visualization content
- [ ] Add interactive elements (scene navigation)
- [ ] Add media assets (images, audio) via `RESTART_PACKAGE/`
- [ ] Implement save/restore progress
- [ ] Create TGE-branded app icon and splash screen

### Long Term (Ongoing)

- [ ] Performance optimization for low-end devices
- [ ] Extract build system to shared module when stable
- [ ] CI/CD pipeline for automated builds
- [ ] Cross-episode state synchronization
- [ ] Archive completed episodes to `FinishedWork/` with compression

---

## Appendix — Quick Reference

### Key Commands

```bash
# Session startup
cd /workspace/app/CSMWip/11_TGApp/TGE_E5
cat NEXT_runner_001.md
cat RESUME_SESSION_TGE_E5.md
git status

# Build
python3 ../../__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5 --output tge_e5.apk

# Install & test
adb install -r tge_e5.apk
adb shell am start -n com.csmlabs.tge.e5/.MainActivity

# Document operations (shared)
python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>
python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py compress <file>

# Git workflow
git add -A && git commit -m '<type>: <description>' && git push
```

### File Locations

- **Project Root**: `./CSMWip/11_TGApp/TGE_E5`
- **Parent Project**: `./CSMWip/11_TGApp`
- **Build Tools**: `../../__Python_Tools/build_apk.py`
- **Shared Keystore**: `../../05_BOUNCE/debug.keystore`
- **Memory Logs**: `./memory/`
- **Runner Files**: `./NEXT_runner_*.md`
- **APK Output**: `./tge_e5.apk`

### Related Projects

- **Parent**: CSMWip/11_TGApp (`./CSMWip/11_TGApp`)
- **Build System Reference**: 05_BOUNCE (`../../05_BOUNCE`)
- **Category Peers**: TGE_E1 through TGE_E4 (siblings in 11_TGApp)
- **File Count**: 52 files
- **APK Size**: ~17KB (baseline)

---

*README generated for TGE_E5 — Part of Another Project*
*Category: CSMWip/11_TGApp | Files: 52 | Parent: CSMWip/11_TGApp*
*Generated following 05_BOUNCE pattern using write_large_file.py IncrementalDocumentWriter*