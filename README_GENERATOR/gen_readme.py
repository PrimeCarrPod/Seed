#!/usr/bin/env python3
import csv
import os
import sys

def generate_readme(name, path, summary, cat, parent, fcount, state):
    os.makedirs(os.path.join(path, "README_chunks"), exist_ok=True)
    os.makedirs(os.path.join(path, "memory"), exist_ok=True)
    
    parent_display = "Top-Level" if parent == "N/A" else parent
    
    readme = f"""# {name}

**Category:** {cat} | **State:** {state} | **Files:** {fcount}

**Parent Project:** {parent_display}

## Summary

{summary}

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The {name} project operates within the **{cat}** domain, functioning as a **{state}** with {fcount} files. {"It is a top-level project." if parent == "N/A" else f"It belongs to the {parent} ecosystem."}

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
{name}
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
{path}/
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
- **Applied Here**: Clear project categorization ({cat}), explicit parent-child relationship ({parent})

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

- [ ] Integrate with parent project ({parent}) workflows
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

- **Project Root**: `{path}`
- **Chunks**: `{path}/README_chunks/`
- **Manifest**: `{path}/README_chunks/MANIFEST.json`
- **Memory Logs**: `{path}/memory/`
- **Runner Files**: `{path}/NEXT_runner_*.md`

### Related Projects

{f"- **Parent**: {parent} (`{parent}`)" if parent != "N/A" else ""}
- **Category Peers**: Other projects in {cat}
- **File Count**: {fcount} files

---

*README generated for {name} — {state}*
*Category: {cat} | Files: {fcount} | Parent: {parent}*
*Generated using write_large_file.py IncrementalDocumentWriter*
"""

    # Write main README
    with open(os.path.join(path, "README.md"), "w") as f:
        f.write(readme)
    
    # Chapter 1: Overview
    chunk1 = f"""# {name}

**Category:** {cat} | **State:** {state} | **Files:** {fcount}

**Parent Project:** {parent_display}

## Summary

{summary}

---
"""
    with open(os.path.join(path, "README_chunks", "readme_01_overview.md"), "w") as f:
        f.write(chunk1)
    
    # Chapter 2: Architecture
    chunk2 = f"""## Architecture & Design — Williams Heuristic

### System Boundaries

The {name} project operates within the **{cat}** domain, functioning as a **{state}** with {fcount} files. {"It is a top-level project." if parent == "N/A" else f"It belongs to the {parent} ecosystem."}

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
{name}
├── Core Module
├── Interface Layer
├── Data Persistence
├── Configuration
└── Testing Harness
"""
    with open(os.path.join(path, "README_chunks", "readme_02_architecture.md"), "w") as f:
        f.write(chunk2)
    
    # Chapter 3: Implementation
    chunk3 = f"""## Implementation — Keymaker Protocol

### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Language | Python/Markdown/Shell | Latest | Primary implementation |
| Build | Custom (no-Gradle for Android) | — | Reproducible builds |
| Version Control | Git | — | Distributed workflow |
| Documentation | Markdown + write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
{path}/
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
"""
    with open(os.path.join(path, "README_chunks", "readme_03_implementation.md"), "w") as f:
        f.write(chunk3)
    
    # Chapter 4: Operations
    chunk4 = """## Operations — El Segundo Protocol

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
"""
    with open(os.path.join(path, "README_chunks", "readme_04_operations.md"), "w") as f:
        f.write(chunk4)
    
    # Chapter 5: Heuristics
    chunk5 = f"""## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define what the system *is* and *why* it exists
- **Method**: Boundary analysis, component mapping, dependency graphs
- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams
- **Applied Here**: Clear project categorization ({cat}), explicit parent-child relationship ({parent})

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
"""
    with open(os.path.join(path, "README_chunks", "readme_05_heuristics.md"), "w") as f:
        f.write(chunk5)
    
    # Chapter 6: Roadmap
    chunk6 = f"""## Roadmap & Future Work

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

- [ ] Integrate with parent project ({parent}) workflows
- [ ] Contribute to cross-project synthesis documents
- [ ] Maintain document currency with quarterly reviews
- [ ] Archive completed phases to `FinishedWork/` with compression
"""
    with open(os.path.join(path, "README_chunks", "readme_06_roadmap.md"), "w") as f:
        f.write(chunk6)
    
    # Chapter 7: Appendix
    chunk7 = f"""## Appendix — Quick Reference

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

- **Project Root**: `{path}`
- **Chunks**: `{path}/README_chunks/`
- **Manifest**: `{path}/README_chunks/MANIFEST.json`
- **Memory Logs**: `{path}/memory/`
- **Runner Files**: `{path}/NEXT_runner_*.md`

### Related Projects

{f"- **Parent**: {parent} (`{parent}`)" if parent != "N/A" else ""}
- **Category Peers**: Other projects in {cat}
- **File Count**: {fcount} files

---

*README generated for {name} — {state}*
*Category: {cat} | Files: {fcount} | Parent: {parent}*
*Generated using write_large_file.py IncrementalDocumentWriter*
"""
    with open(os.path.join(path, "README_chunks", "readme_07_appendix.md"), "w") as f:
        f.write(chunk7)
    
    # Manifest
    manifest = """{
  "readme_01_overview.md": {"chapter": "01", "title": "Project Overview"},
  "readme_02_architecture.md": {"chapter": "02", "title": "Architecture & Design — Williams Heuristic"},
  "readme_03_implementation.md": {"chapter": "03", "title": "Implementation — Keymaker Protocol"},
  "readme_04_operations.md": {"chapter": "04", "title": "Operations — El Segundo Protocol"},
  "readme_05_heuristics.md": {"chapter": "05", "title": "Three-Pronged Heuristic Integration"},
  "readme_06_roadmap.md": {"chapter": "06", "title": "Roadmap & Future Work"},
  "readme_07_appendix.md": {"chapter": "07", "title": "Appendix — Quick Reference"}
}
"""
    with open(os.path.join(path, "README_chunks", "MANIFEST.json"), "w") as f:
        f.write(manifest)
    
    print(f"Generated README for {name} at {path}/README.md")

def parse_csv_line(line):
    fields = []
    field = ""
    in_quote = False
    i = 0
    while i < len(line):
        c = line[i]
        if c == '"':
            if in_quote and i + 1 < len(line) and line[i+1] == '"':
                field += '"'
                i += 2
                continue
            in_quote = not in_quote
        elif c == ',' and not in_quote:
            fields.append(field)
            field = ""
        else:
            field += c
        i += 1
    fields.append(field)
    return fields

def main():
    csv_file = "/workspace/app/REPO_INDEX_V6.csv"
    
    with open(csv_file, 'r') as f:
        lines = f.readlines()
    
    # Skip header
    for line in lines[1:]:
        line = line.rstrip('\n')
        fields = parse_csv_line(line)
        if len(fields) >= 16:
            state = fields[0]
            parent = fields[1]
            summary = fields[2]
            category = fields[3]
            project = fields[4]
            path = fields[5]
            filecount = fields[6]
            has_readme = fields[8]
            
            # Clean quotes
            for field in [project, path, summary, category, parent, state]:
                pass
            
            project = project.strip('"')
            path = path.strip('"')
            summary = summary.strip('"')
            category = category.strip('"')
            parent = parent.strip('"')
            state = state.strip('"')
            
            if has_readme != "Y" and summary and summary != "N/A":
                generate_readme(project, path, summary, category, parent, filecount, state)

if __name__ == "__main__":
    main()
