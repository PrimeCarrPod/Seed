## Project Overview
# CSMWip

**Category:** TopLevel | **State:** Whole Project | **Files:** 10730

**Parent Project:** Top-Level

### Summary

CSMWip \u2014 Primary active work-in-progress (10,730 files); SubAtomic prime electron canonical, Caldera prime pi electron, legal enactment, BOUNCE (TAF/DMV mesh), Land of Lil, subatomic extensions, deep research, project tracking, prime electron synthesis, TGApp, Aegis outfit fabricator, CSMMinesMagnets

---
## Architecture & Design — Williams Heuristic
### System Boundaries

The **CSMWip** project operates within the **TopLevel** domain, 
functioning as a **Whole Project** with 10730 files. 
It is a top-level project.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
CSMWip
├── Android App Module
│   ├── Java/Kotlin Source
│   ├── Resources (res/)
│   ├── Assets (WebView HTML/JS)
│   └── AndroidManifest.xml
├── Python Scripts/Automation
├── Web/Frontend Assets
├── 01_SubAtomic_Prime_Electron_Canonical/
├── 02_Caldera_Prime_Pi_Electron/
├── 03_Legal_Enactment/
├── 05_BOUNCE/
├── 06_Land_of_Lil/
├── Documentation (Markdown)
├── Technical References (PDF)
├── Build System
└── Configuration
```

## Implementation — Keymaker Protocol
### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Platform | Android | API 24+ | Mobile application |
| Language | Java | 11+ | Core logic |
| Language | Python | 3.8+ | Scripting/Automation |
| Language | JavaScript/TypeScript | ES6+ | Frontend/Web |
| UI | HTML/CSS | WebView | Hybrid UI |
| Docs | Markdown | Latest | Documentation |
| Build | Custom (build.sh — No-Gradle) | — | Build automation |
| Distribution | ZIP/APK | — | Release artifacts |
| Reference | PDF | — | Technical docs |
| Version Control | Git | — | Source control |
| Documentation | write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
CSMWip/
├── 05_BOUNCE/AndroidManifest.xml
├── 05_BOUNCE/build.sh
├── 05_BOUNCE/TGE_E1/build.gradle.kts
├── 05_BOUNCE/TGE_E1/gradlew
├── 05_BOUNCE/TGE_E1/gradlew.bat
├── 01_SubAtomic_Prime_Electron_Canonical/
├── 02_Caldera_Prime_Pi_Electron/
├── 03_Legal_Enactment/
├── 05_BOUNCE/
├── 06_Land_of_Lil/
├── 07_SubAtomic_Extensions/
├── 08_DeepResearch_SubParticles/
├── 09_Project_Tracking/
├── README.md              # This file
├── AGENTS.md              # Project conventions
├── TODO.md                # Task hierarchy
├── memory/                # Daily session logs
├── README_chunks/         # Chapter chunks (auto-generated)
└── FinishedWork/          # Completed documents
```

### Configuration

Key project files:

- `AGENTS.md` — *To be created*: Project-specific conventions
- `TODO.md` — *To be created*: Task hierarchy
- `memory/` — *To be created*: Session logging directory
- `NEXT_runner_XXX.md` — Next session instructions

### Build System

This project uses **Custom (build.sh — No-Gradle)** for builds.

```bash
# Typical no-Gradle Android build flow:
./build.sh
```

## Operations — El Segundo Protocol
### Session Lifecycle

1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`
2. **Execution** — Process subtasks sequentially with 30s timeout guard
3. **Heartbeat** — Progress output every 2 minutes (120s interval)
4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask
5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`

### Build & Validation

```bash
# No-Gradle Android build
./build.sh

# Verify APK
aapt2 dump badging out/*.apk

# Document integrity (if using write_large_file.py)
python3 ../../__Python_Tools/write_large_file.py verify README_chunks/
```

### Quality Gates

- All reassembled documents must pass manifest verification
- Cross-reference validation across related documents
- APK must install and run on target Android version
- No-Gradle build must produce valid, signed APK
- Python tests pass (pytest/unittest)
- Type checking passes (mypy/pyright if configured)
- JS/TS type checking passes
- Lint passes (eslint)
- Mathematical consistency checks for synthesis documents
- Material property consistency for engineering specs

## Three-Pronged Heuristic Integration
This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define what the system *is* and *why* it exists
- **Method**: Boundary analysis, component mapping, dependency graphs
- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams
- **Applied Here**: Clear project categorization (TopLevel), 
explicit parent-child relationship (Top-Level)

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define *how* the system is built and validated
- **Method**: Reproducible builds, chapter-based authoring, manifest verification
- **Output**: `build.sh`, `write_large_file.py` pipelines, `MANIFEST.json`
- **Applied Here**: No-Gradle Android builds (aapt2 → javac → d8 → zipalign → apksigner), SHA256 verification

### El Segundo Protocol — Operational Excellence

- **Purpose**: Define *how* the system runs and evolves
- **Method**: Session resume, heartbeat monitoring, subtask granularity
- **Output**: `NEXT_runner_XXX.md`, `HEARTBEAT.md`, `memory/` logs
- **Applied Here**: 30s subtask limit, 2min heartbeat, auto-continue queue

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo |
|-------|----------|----------|------------|
| Design | Boundaries | Tech Stack | Session Model |
| Build | Components | Chunk Pipeline | 30s Timeout |
| Test | Interfaces | Manifest Verify | Heartbeat |
| Deploy | Contracts | Reproducible | Handoff |
| Evolve | Versioning | Migration | Resume |

## Roadmap & Future Work
### Immediate (Next 1-2 Sessions)

- [ ] Create project-specific `AGENTS.md` conventions
- [ ] Create initial `TODO.md` with milestone breakdown
- [ ] Set up `memory/` directory for session logging
- [ ] Complete README generation and validation

### Short Term (Next 5 Sessions)

- [ ] Implement heartbeat monitoring for this project
- [ ] Create `NEXT_runner_001.md` with first batch assignments
- [ ] Document project-specific workflows in `AGENTS.md`

### Long Term (Ongoing)

- [ ] Contribute to cross-project synthesis documents
- [ ] Maintain document currency with quarterly reviews
- [ ] Archive completed phases to `FinishedWork/` with compression

## Appendix — Quick Reference
### Key Commands

```bash
# Session startup
source ../../__Python_Tools/write_large_file.py  # Load utilities

# Document operations
python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>
python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py compress <file>

# No-Gradle Android Build
./build.sh

# Git workflow
git add -A && git commit -m '<type>: <description>' && git push
```

### File Locations

- **Project Root**: `CSMWip`
- **Chunks**: `CSMWip/README_chunks/`
- **Manifest**: `CSMWip/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMWip/memory/`
- **Runner Files**: `CSMWip/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 10730
- **File Types**: .md: 4482, .class: 2385, .js: 651, .xml: 579, .zip: 554, .java: 539, .gz: 303, .sh: 274, .html: 255, .diff: 231
- **Languages**: Markdown: 4482, JavaScript/TypeScript: 651, XML: 579, Java: 539, Shell: 274, HTML: 255, Kotlin: 30, JSON: 24, Python: 16
- **Key Directories**: 15

### Related Projects

- **Category Peers**: Other projects in TopLevel
- **File Count**: 10730 files

---

*README generated for CSMWip — Whole Project*
*Category: TopLevel | Files: 10730 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
