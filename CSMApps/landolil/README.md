## Project Overview
# landolil

**Category:** CSMApps | **State:** Part of Another Project | **Files:** 241

**Parent Project:** CSMApps

### Summary

landolil \u2014 Subproject with 241 files (active Oct 2026)

---
## Architecture & Design — Williams Heuristic
### System Boundaries

The **landolil** project operates within the **CSMApps** domain, 
functioning as a **Part of Another Project** with 241 files. 
It belongs to the CSMApps ecosystem.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
landolil
├── Android App Module
│   ├── Java/Kotlin Source
│   ├── Resources (res/)
│   ├── Assets (WebView HTML/JS)
│   └── AndroidManifest.xml
├── Python Scripts/Automation
├── Web/Frontend Assets
├── batch_zipper.app/
├── v6b/
├── v6bv2/
├── v6bv3/
├── v7/
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
landolil/
├── v6b/build.sh
├── v6b/src/main/AndroidManifest.xml
├── batch_zipper.app/
├── v6b/
├── v6bv2/
├── v6bv3/
├── v7/
├── v7b/
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
- **Applied Here**: Clear project categorization (CSMApps), 
explicit parent-child relationship (CSMApps)

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

- [ ] Integrate with parent project (CSMApps) workflows
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

- **Project Root**: `CSMApps/landolil`
- **Chunks**: `CSMApps/landolil/README_chunks/`
- **Manifest**: `CSMApps/landolil/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMApps/landolil/memory/`
- **Runner Files**: `CSMApps/landolil/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 241
- **File Types**: .class: 109, .js: 30, .xml: 21, .java: 18, .zip: 13, .apk: 12, .sh: 6, .txt: 4, .html: 4, .dex: 4
- **Languages**: JavaScript/TypeScript: 30, XML: 21, Java: 18, Shell: 6, HTML: 4, Python: 3, Markdown: 2
- **Key Directories**: 6

### Related Projects

- **Parent**: CSMApps (`CSMApps`)
- **Category Peers**: Other projects in CSMApps
- **File Count**: 241 files

---

*README generated for landolil — Part of Another Project*
*Category: CSMApps | Files: 241 | Parent: CSMApps*
*Generated using write_large_file.py IncrementalDocumentWriter*
