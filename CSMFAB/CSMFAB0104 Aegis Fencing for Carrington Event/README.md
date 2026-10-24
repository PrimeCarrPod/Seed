# CSMFAB0104 Aegis Fencing for Carrington Event

**Category:** CSMFAB | **State:** Whole Project (standalone) | **Files:** 82

**Parent Project:** Top-Level

## Summary

CSMFAB0104 Aegis Fencing for Carrington Event \u2014 Project AEGIS Carrington event resilience research (82 files)

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The CSMFAB0104 Aegis Fencing for Carrington Event project operates within the **CSMFAB** domain, functioning as a **Whole Project (standalone)** with 82 files. It is a top-level project.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
CSMFAB0104 Aegis Fencing for Carrington Event
├── Core Module
├── Interface Layer
├── Data Persistence
├── Configuration
└── Testing Harness
```

## Implementation — Keymaker Protocol

### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Language | Python/Markdown/Shell | Latest | Primary implementation |
| Build | Custom (no-Gradle for Android) | — | Reproducible builds |
| Version Control | Git | — | Distributed workflow |
| Documentation | Markdown + write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
./CSMFAB/CSMFAB0104 Aegis Fencing for Carrington Event/
├── README.md              # This file
├── AGENTS.md              # Project conventions
├── TODO.md              # Task hierarchy
├── memory/              # Daily session logs
├── chunks/              # Logical document chunks
├── FinishedWork/        # Completed documents
├── scripts/             # Automation utilities
└── Research/            # Reference materials
```

### Configuration

Key configuration files:

- `AGENTS.md` — Project-specific conventions and commands
- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)
- `memory/YYYY-MM-DD.md` — Raw daily logs
- `NEXT_runner_XXX.md` — Next session instructions

## Operations — El Segundo Protocol

### Session Lifecycle

1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`
2. **Execution** — Process subtasks sequentially with 30s timeout guard
3. **Heartbeat** — Progress output every 2 minutes (120s interval)
4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask
5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`

### Build & Validation

```bash
# Verify document integrity
python3 ../../__Python_Tools/write_large_file.py verify chunks/<DOC-ID>/

# Reassemble for review
python3 ../../__Python_Tools/write_large_file.py concat chunks/<DOC-ID>/ FinishedWork/<DOC>.md

# Compress for storage
python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/<DOC>.md
```

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
- **Applied Here**: Clear project categorization (CSMFAB), explicit parent-child relationship (N/A)

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define *how* the system is built and validated
- **Method**: Reproducible builds, chapter-based authoring, manifest verification
- **Output**: `build.sh`, `write_large_file.py` pipelines, `MANIFEST.json`
- **Applied Here**: No-Gradle builds, chunk-based documents, SHA256 verification

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

- [ ] Complete README generation and validation
- [ ] Establish project-specific `AGENTS.md` conventions
- [ ] Create initial `TODO.md` with milestone breakdown
- [ ] Set up `memory/` directory for session logging

### Short Term (Next 5 Sessions)

- [ ] Migrate any legacy piece-based documents to chunk format
- [ ] Implement heartbeat monitoring for this project
- [ ] Create `NEXT_runner_001.md` with first batch assignments
- [ ] Document project-specific workflows in `AGENTS.md`

### Long Term (Ongoing)

- [ ] Integrate with parent project (N/A) workflows
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

- **Project Root**: `./CSMFAB/CSMFAB0104 Aegis Fencing for Carrington Event`
- **Chunks**: `./CSMFAB/CSMFAB0104 Aegis Fencing for Carrington Event/README_chunks/`
- **Manifest**: `./CSMFAB/CSMFAB0104 Aegis Fencing for Carrington Event/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMFAB/CSMFAB0104 Aegis Fencing for Carrington Event/memory/`
- **Runner Files**: `./CSMFAB/CSMFAB0104 Aegis Fencing for Carrington Event/NEXT_runner_*.md`

### Related Projects


- **Category Peers**: Other projects in CSMFAB
- **File Count**: 82 files

---

*README generated for CSMFAB0104 Aegis Fencing for Carrington Event — Whole Project (standalone)*
*Category: CSMFAB | Files: 82 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
