## Project Overview
# CSMFAB

**Category:** TopLevel | **State:** Whole Project | **Files:** 8013

**Parent Project:** Top-Level

### Summary

# Seed \u2014 Massive fabrication research portfolio (8000+ files) covering Project AEGIS (Carrington event resilience), drone designs, smart materials, home hardening, and 100+ individual research projects

---
## Architecture & Design — Williams Heuristic
### System Boundaries

The **CSMFAB** project operates within the **TopLevel** domain, 
functioning as a **Whole Project** with 8013 files. 
It is a top-level project.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
CSMFAB
├── Web/Frontend Assets
├── BOM-REGISTRY/
├── CLOUD-NEST/
├── CSMAegisHome01 M1 Project AEGIS Foundational Research/
├── CSMAegisHome02 M1chrome Stellar-Chrome Dielectric Coating/
├── CSMFAB Master Cost Analysis and Market Viability Reports/
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
CSMFAB/
├── BOM-REGISTRY/
├── CLOUD-NEST/
├── CSMAegisHome01 M1 Project AEGIS Foundational Research/
├── CSMAegisHome02 M1chrome Stellar-Chrome Dielectric Coating/
├── CSMFAB Master Cost Analysis and Market Viability Reports/
├── CSMFAB Materials Study 5 Parts /
├── CSMFAB-INCURSION-CLASS/
├── CSMFAB-P001-Ceramic-Bridge-Bearings-500T/
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

- **Project Root**: `CSMFAB`
- **Chunks**: `CSMFAB/README_chunks/`
- **Manifest**: `CSMFAB/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMFAB/memory/`
- **Runner Files**: `CSMFAB/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 8013
- **File Types**: .md: 7755, .pdf: 256, .zip: 37, .html: 34, .sh: 20, .xlsx: 4, .csv: 1, .json: 1, .docx: 1
- **Languages**: Markdown: 7755, HTML: 34, Shell: 20, JSON: 1
- **Key Directories**: 97

### Related Projects

- **Category Peers**: Other projects in TopLevel
- **File Count**: 8013 files

---

*README generated for CSMFAB — Whole Project*
*Category: TopLevel | Files: 8013 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
