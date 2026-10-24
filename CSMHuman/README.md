## Project Overview
# CSMHuman

**Category:** TopLevel | **State:** Whole Project | **Files:** 157

**Parent Project:** Top-Level

### Summary

# Seed \u2014 Human frequency interaction research: 40+ deep research projects on vibration/EMF-body interactions, resonance frequencies, ultrasonic vibrometry, and neurological impacts

---
## Architecture & Design — Williams Heuristic
### System Boundaries

The **CSMHuman** project operates within the **TopLevel** domain, 
functioning as a **Whole Project** with 157 files. 
It is a top-level project.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
CSMHuman
├── Web/Frontend Assets
├── CSMHuman00000000001 Mirror Fascination_ Brain's Deep Dive/
├── CSMHuman00000000002 Mirror Gazing_ Neurological & Psychological Deep Dive/
├── CSMHuman00000000010 Human Body Frequency Interaction Research/
├── CSMHuman00000000011 Frequency-Body Interaction Research Synthesis/
├── CSMHuman00000000012 Deep Research Article_ Frequency Body Interaction/
├── Documentation (Markdown)
├── Technical References (PDF)
├── Build System
└── Configuration
```

## Implementation — Keymaker Protocol
### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| UI | HTML/CSS | WebView | Hybrid UI |
| Docs | Markdown | Latest | Documentation |
| Distribution | ZIP/APK | — | Release artifacts |
| Reference | PDF | — | Technical docs |
| Version Control | Git | — | Source control |
| Documentation | write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
CSMHuman/
├── CSMHuman00000000001 Mirror Fascination_ Brain's Deep Dive/
├── CSMHuman00000000002 Mirror Gazing_ Neurological & Psychological Deep Dive/
├── CSMHuman00000000010 Human Body Frequency Interaction Research/
├── CSMHuman00000000011 Frequency-Body Interaction Research Synthesis/
├── CSMHuman00000000012 Deep Research Article_ Frequency Body Interaction/
├── CSMHuman00000000013 Vibration's Impact on Vision Research/
├── CSMHuman00000000014 Deep Dive Human Frequency Interaction/
├── CSMHuman00000000015 Deep Research_ Human Body Frequency Interaction/
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

## Operations — El Segundo Protocol
### Session Lifecycle

1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`
2. **Execution** — Process subtasks sequentially with 30s timeout guard
3. **Heartbeat** — Progress output every 2 minutes (120s interval)
4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask
5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`

### Quality Gates

- All reassembled documents must pass manifest verification
- Cross-reference validation across related documents
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
- **Applied Here**: Chunk-based documents, SHA256 verification

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


# Git workflow
git add -A && git commit -m '<type>: <description>' && git push
```

### File Locations

- **Project Root**: `CSMHuman`
- **Chunks**: `CSMHuman/README_chunks/`
- **Manifest**: `CSMHuman/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMHuman/memory/`
- **Runner Files**: `CSMHuman/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 157
- **File Types**: .md: 115, .pdf: 38, .html: 37, .htm: 4, .zip: 1
- **Languages**: Markdown: 115, HTML: 41
- **Key Directories**: 38

### Related Projects

- **Category Peers**: Other projects in TopLevel
- **File Count**: 157 files

---

*README generated for CSMHuman — Whole Project*
*Category: TopLevel | Files: 157 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
