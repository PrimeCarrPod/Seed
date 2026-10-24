## Project Overview
# CSMEval

**Category:** CSMReach | **State:** Part of Another Project | **Files:** 358

**Parent Project:** CSMReach

### Summary

CSMEval — Evaluation, Testing, and Quality Assurance

---
## Architecture & Design — Williams Heuristic
### System Boundaries

The **CSMEval** project operates within the **CSMReach** domain, 
functioning as a **Part of Another Project** with 358 files. 
It belongs to the CSMReach ecosystem.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
CSMEval
├── Python Scripts/Automation
├── 01-Federal-State-Emergency-Management-Agencies/
├── 02-Electric-Grid-Reliability-Regulators-and-Agencies/
├── 03-NOAA-NASA-Space-Weather-and-Heliophysics/
├── 04-Department-of-Defense-Military-and-Procurement/
├── 05-State-DOTs-Bridge-Authorities-and-Highway-Agencies/
├── Documentation (Markdown)
├── Technical References (PDF)
├── Build System
└── Configuration
```

## Implementation — Keymaker Protocol
### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Language | Python | 3.8+ | Scripting/Automation |
| Docs | Markdown | Latest | Documentation |
| Reference | PDF | — | Technical docs |
| Version Control | Git | — | Source control |
| Documentation | write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
CSMEval/
├── 01-Federal-State-Emergency-Management-Agencies/
├── 02-Electric-Grid-Reliability-Regulators-and-Agencies/
├── 03-NOAA-NASA-Space-Weather-and-Heliophysics/
├── 04-Department-of-Defense-Military-and-Procurement/
├── 05-State-DOTs-Bridge-Authorities-and-Highway-Agencies/
├── 06-Nuclear-Regulatory-Commission-and-Plant-Operators/
├── 07-Federal-Railroad-Administration-Amtrak-and-Transit/
├── 08-Municipal-EM-Public-Works-and-Parks-Attraction-Safety/
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
- Python tests pass (pytest/unittest)
- Type checking passes (mypy/pyright if configured)
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

- **Project Root**: `CSMReach/CSMEval`
- **Chunks**: `CSMReach/CSMEval/README_chunks/`
- **Manifest**: `CSMReach/CSMEval/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMReach/CSMEval/memory/`
- **Runner Files**: `CSMReach/CSMEval/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 358
- **File Types**: .md: 321, .docx: 35, .pdf: 1, .py: 1
- **Languages**: Markdown: 321, Python: 1
- **Key Directories**: 41

### Related Projects

- **Parent**: CSMReach (`CSMReach`)
- **Category Peers**: Other projects in CSMReach
- **File Count**: 358 files

---

*README generated for CSMEval — Part of Another Project*
*Category: CSMReach | Files: 358 | Parent: CSMReach*
*Generated using write_large_file.py IncrementalDocumentWriter*
