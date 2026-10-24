## Project Overview
# ACS-CommonwealthFusion-FusionEnergy

**Category:** CSMReach | **State:** Part of Another Project | **Files:** 16

**Parent Project:** CSMReach

### Summary

ACS-CommonwealthFusion FusionEnergy \u2014 Corporate partnership profile for CommonwealthFusion FusionEnergy (16 files)

---
## Architecture & Design — Williams Heuristic
### System Boundaries

The **ACS-CommonwealthFusion-FusionEnergy** project operates within the **CSMReach** domain, 
functioning as a **Part of Another Project** with 16 files. 
It belongs to the CSMReach ecosystem.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
ACS-CommonwealthFusion-FusionEnergy
├── 01-Executive-Summary/
├── 02-Corporate-Profile/
├── 03-Technical-Framework/
├── 04-Financial-Analysis/
├── 05-Implementation-Roadmap/
├── Documentation (Markdown)
├── Build System
└── Configuration
```

## Implementation — Keymaker Protocol
### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Docs | Markdown | Latest | Documentation |
| Version Control | Git | — | Source control |
| Documentation | write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
ACS-CommonwealthFusion-FusionEnergy/
├── 01-Executive-Summary/
├── 02-Corporate-Profile/
├── 03-Technical-Framework/
├── 04-Financial-Analysis/
├── 05-Implementation-Roadmap/
├── 06-Research-Archive/
├── 07-Appendices/
├── 08-USB-Content/
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
- **Applied Here**: Clear project categorization (CSMReach), 
explicit parent-child relationship (CSMReach)

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

- [ ] Integrate with parent project (CSMReach) workflows
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

- **Project Root**: `CSMReach/ACS-CommonwealthFusion-FusionEnergy`
- **Chunks**: `CSMReach/ACS-CommonwealthFusion-FusionEnergy/README_chunks/`
- **Manifest**: `CSMReach/ACS-CommonwealthFusion-FusionEnergy/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMReach/ACS-CommonwealthFusion-FusionEnergy/memory/`
- **Runner Files**: `CSMReach/ACS-CommonwealthFusion-FusionEnergy/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 16
- **File Types**: .md: 16, .txt: 1
- **Languages**: Markdown: 16
- **Key Directories**: 8

### Related Projects

- **Parent**: CSMReach (`CSMReach`)
- **Category Peers**: Other projects in CSMReach
- **File Count**: 16 files

---

*README generated for ACS-CommonwealthFusion-FusionEnergy — Part of Another Project*
*Category: CSMReach | Files: 16 | Parent: CSMReach*
*Generated using write_large_file.py IncrementalDocumentWriter*
