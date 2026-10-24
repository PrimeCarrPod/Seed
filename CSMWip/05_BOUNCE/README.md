## Project Overview
# 05_BOUNCE

**Category:** CSMWip | **State:** Part of Another Project | **Files:** 5193

**Parent Project:** CSMWip

### Summary

# TODO.md \u2014 CSMWip/05_BOUNCE \u2014 Bounce TAF/DMV mesh network (5193 files, has TODO, has NEXT)

---
## Architecture & Design — Williams Heuristic
### System Boundaries

The **05_BOUNCE** project operates within the **CSMWip** domain, 
functioning as a **Part of Another Project** with 5193 files. 
It belongs to the CSMWip ecosystem.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
05_BOUNCE
├── Android App Module
│   ├── Java/Kotlin Source
│   ├── Resources (res/)
│   ├── Assets (WebView HTML/JS)
│   └── AndroidManifest.xml
├── Python Scripts/Automation
├── Web/Frontend Assets
├── FINAL_DELIVERABLES/
├── PROOF_OF_WORK/
├── TGAPP.WIP/
├── TGE_E1/
├── TGE_E2/
├── Documentation (Markdown)
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
| Version Control | Git | — | Source control |
| Documentation | write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
05_BOUNCE/
├── AndroidManifest.xml
├── build.sh
├── TGE_E1/build.gradle.kts
├── TGE_E1/gradlew
├── TGE_E1/gradlew.bat
├── FINAL_DELIVERABLES/
├── PROOF_OF_WORK/
├── TGAPP.WIP/
├── TGE_E1/
├── TGE_E2/
├── TGE_E3/
├── TGE_E4/
├── build/
├── README.md              # This file
├── AGENTS.md              # Project conventions
├── TODO.md                # Task hierarchy
├── memory/                # Daily session logs
├── README_chunks/         # Chapter chunks (auto-generated)
└── FinishedWork/          # Completed documents
```

### Configuration

Key project files:

- `AGENTS.md` — Project-specific conventions and commands
- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)
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
- **Applied Here**: Clear project categorization (CSMWip), 
explicit parent-child relationship (CSMWip)

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

- [ ] Set up `memory/` directory for session logging
- [ ] Complete README generation and validation

### Short Term (Next 5 Sessions)

- [ ] Implement heartbeat monitoring for this project
- [ ] Create `NEXT_runner_001.md` with first batch assignments

### Long Term (Ongoing)

- [ ] Integrate with parent project (CSMWip) workflows
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

- **Project Root**: `CSMWip/05_BOUNCE`
- **Chunks**: `CSMWip/05_BOUNCE/README_chunks/`
- **Manifest**: `CSMWip/05_BOUNCE/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMWip/05_BOUNCE/memory/`
- **Runner Files**: `CSMWip/05_BOUNCE/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 5193
- **File Types**: .class: 2277, .js: 632, .xml: 537, .java: 474, .html: 246, .diff: 231, .sh: 222, .md: 191, .apk: 102, .zip: 102
- **Languages**: JavaScript/TypeScript: 632, XML: 537, Java: 474, HTML: 246, Shell: 222, Markdown: 191, Kotlin: 21, JSON: 7, Python: 1
- **Key Directories**: 10

### Related Projects

- **Parent**: CSMWip (`CSMWip`)
- **Category Peers**: Other projects in CSMWip
- **File Count**: 5193 files

---

*README generated for 05_BOUNCE — Part of Another Project*
*Category: CSMWip | Files: 5193 | Parent: CSMWip*
*Generated using write_large_file.py IncrementalDocumentWriter*
