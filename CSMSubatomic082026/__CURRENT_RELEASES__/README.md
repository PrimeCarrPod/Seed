## Project Overview
# __CURRENT_RELEASES__

**Category:** CSMSubatomic082026 | **State:** Archive (verify before removal) | **Files:** 5

**Parent Project:** Top-Level

## Summary

Current releases archive (5 files)

---
## Architecture & Design — Williams Heuristic
## Architecture & Design — Williams Heuristic

### System Boundaries

The __CURRENT_RELEASES__ project operates within the **CSMSubatomic082026** domain, 
functioning as a **Archive (verify before removal)** with 5 files. 
It is a top-level project.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
__CURRENT_RELEASES__
├── Core Module
├── Interface Layer
├── Data Persistence
├── Configuration
└── Testing Harness
```

## Implementation — Keymaker Protocol
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
./CSMSubatomic082026/__CURRENT_RELEASES__/
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

Key environment variables and configuration files:

- `AGENTS.md` — Project-specific conventions and commands
- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)
- `memory/YYYY-MM-DD.md` — Raw daily logs
- `NEXT_runner_XXX.md` — Next session instructions

## Operations — El Segundo Protocol
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
## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define what the system *is* and *why* it exists
- **Method**: Boundary analysis, component mapping, dependency graphs
- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams
- **Applied Here**: Clear project categorization (CSMSubatomic082026), 
explicit parent-child relationship (N/A)

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

- [ ] Integrate with parent project ({self.parent}) workflows
- [ ] Contribute to cross-project synthesis documents
- [ ] Maintain document currency with quarterly reviews
- [ ] Archive completed phases to `FinishedWork/` with compression

## Appendix — Quick Reference
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

- **Project Root**: `./CSMSubatomic082026/__CURRENT_RELEASES__`
- **Chunks**: `./CSMSubatomic082026/__CURRENT_RELEASES__/README_chunks/`
- **Manifest**: `./CSMSubatomic082026/__CURRENT_RELEASES__/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMSubatomic082026/__CURRENT_RELEASES__/memory/`
- **Runner Files**: `./CSMSubatomic082026/__CURRENT_RELEASES__/NEXT_runner_*.md`

### Related Projects

- **Category Peers**: Other projects in CSMSubatomic082026
- **File Count**: 5 files

---

*README generated for __CURRENT_RELEASES__ — Archive (verify before removal)*
*Category: CSMSubatomic082026 | Files: 5 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
