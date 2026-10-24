#!/bin/bash

CSV_FILE="/workspace/app/REPO_INDEX_V6.csv"

# Function to generate README for a single project
generate_readme() {
    local name="$1"
    local path="$2"
    local summary="$3"
    local cat="$4"
    local parent="$5"
    local fcount="$6"
    local state="$7"
    
    mkdir -p "$path/README_chunks"
    mkdir -p "$path/memory"
    
    # Generate full README using cat with quoted heredoc delimiter
    cat > "$path/README.md" << 'READMEEOF'
# $name

**Category:** $cat | **State:** $state | **Files:** $fcount

**Parent Project:** $([ "$parent" = "N/A" ] && echo "Top-Level" || echo "$parent")

## Summary

$summary

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The $name project operates within the **$cat** domain, functioning as a **$state** with $fcount files. $([ "$parent" = "N/A" ] && echo "It is a top-level project." || echo "It belongs to the $parent ecosystem.")

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
$name
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
$path/
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
- **Applied Here**: Clear project categorization ($cat), explicit parent-child relationship ($parent)

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

- [ ] Integrate with parent project ($parent) workflows
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

- **Project Root**: `$path`
- **Chunks**: `$path/README_chunks/`
- **Manifest**: `$path/README_chunks/MANIFEST.json`
- **Memory Logs**: `$path/memory/`
- **Runner Files**: `$path/NEXT_runner_*.md`

### Related Projects

$([ "$parent" != "N/A" ] && echo "- **Parent**: $parent (\`$parent\`)")
- **Category Peers**: Other projects in $cat
- **File Count**: $fcount files

---

*README generated for $name — $state*
*Category: $cat | Files: $fcount | Parent: $parent*
*Generated using write_large_file.py IncrementalDocumentWriter*
READMEEOF

    # Generate chapter chunks
    cat > "$path/README_chunks/readme_01_overview.md" << 'CHUNKEOF'
# $name

**Category:** $cat | **State:** $state | **Files:** $fcount

**Parent Project:** $([ "$parent" = "N/A" ] && echo "Top-Level" || echo "$parent")

## Summary

$summary

---
CHUNKEOF

    cat > "$path/README_chunks/readme_02_architecture.md" << 'CHUNKEOF'
## Architecture & Design — Williams Heuristic

### System Boundaries

The $name project operates within the **$cat** domain, functioning as a **$state** with $fcount files. $([ "$parent" = "N/A" ] && echo "It is a top-level project." || echo "It belongs to the $parent ecosystem.")

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

### Component Diagram

```
$name
├── Core Module
├── Interface Layer
├── Data Persistence
├── Configuration
└── Testing Harness
```
CHUNKEOF

    cat > "$path/README_chunks/readme_03_implementation.md" << 'CHUNKEOF'
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
$path/
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
CHUNKEOF

    cat > "$path/README_chunks/readme_04_operations.md" << 'CHUNKEOF'
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
CHUNKEOF

    cat > "$path/README_chunks/readme_05_heuristics.md" << 'CHUNKEOF'
## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define what the system *is* and *why* it exists
- **Method**: Boundary analysis, component mapping, dependency graphs
- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams
- **Applied Here**: Clear project categorization ($cat), explicit parent-child relationship ($parent)

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
CHUNKEOF

    cat > "$path/README_chunks/readme_06_roadmap.md" << 'CHUNKEOF'
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

- [ ] Integrate with parent project ($parent) workflows
- [ ] Contribute to cross-project synthesis documents
- [ ] Maintain document currency with quarterly reviews
- [ ] Archive completed phases to `FinishedWork/` with compression
CHUNKEOF

    cat > "$path/README_chunks/readme_07_appendix.md" << 'CHUNKEOF'
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

- **Project Root**: `$path`
- **Chunks**: `$path/README_chunks/`
- **Manifest**: `$path/README_chunks/MANIFEST.json`
- **Memory Logs**: `$path/memory/`
- **Runner Files**: `$path/NEXT_runner_*.md`

### Related Projects

$([ "$parent" != "N/A" ] && echo "- **Parent**: $parent (\`$parent\`)")
- **Category Peers**: Other projects in $cat
- **File Count**: $fcount files

---

*README generated for $name — $state*
*Category: $cat | Files: $fcount | Parent: $parent*
*Generated using write_large_file.py IncrementalDocumentWriter*
CHUNKEOF

    # Generate manifest
    cat > "$path/README_chunks/MANIFEST.json" << 'MANIFESTEOF'
{
  "readme_01_overview.md": {"chapter": "01", "title": "Project Overview"},
  "readme_02_architecture.md": {"chapter": "02", "title": "Architecture & Design — Williams Heuristic"},
  "readme_03_implementation.md": {"chapter": "03", "title": "Implementation — Keymaker Protocol"},
  "readme_04_operations.md": {"chapter": "04", "title": "Operations — El Segundo Protocol"},
  "readme_05_heuristics.md": {"chapter": "05", "title": "Three-Pronged Heuristic Integration"},
  "readme_06_roadmap.md": {"chapter": "06", "title": "Roadmap & Future Work"},
  "readme_07_appendix.md": {"chapter": "07", "title": "Appendix — Quick Reference"}
}
MANIFESTEOF

    # Now replace variables in all files
    find "$path/README_chunks" -name "*.md" -exec sed -i \
        -e "s|\$name|$name|g" \
        -e "s|\$path|$path|g" \
        -e "s|\$summary|$summary|g" \
        -e "s|\$cat|$cat|g" \
        -e "s|\$parent|$parent|g" \
        -e "s|\$fcount|$fcount|g" \
        -e "s|\$state|$state|g" {} \;
    
    sed -i \
        -e "s|\$name|$name|g" \
        -e "s|\$path|$path|g" \
        -e "s|\$summary|$summary|g" \
        -e "s|\$cat|$cat|g" \
        -e "s|\$parent|$parent|g" \
        -e "s|\$fcount|$fcount|g" \
        -e "s|\$state|$state|g" \
        "$path/README.md"
    
    echo "Generated README for $name at $path/README.md"
}

# Parse CSV using proper CSV parser and generate READMEs
awk '
function parse_csv_line(line,    fields, n, i, in_quote, field, c) {
    n = 0
    in_quote = 0
    field = ""
    for (i = 1; i <= length(line); i++) {
        c = substr(line, i, 1)
        if (c == "\"") {
            if (in_quote && i < length(line) && substr(line, i+1, 1) == "\"") {
                field = field "\""
                i++
            } else {
                in_quote = !in_quote
            }
        } else if (c == "," && !in_quote) {
            fields[++n] = field
            field = ""
        } else {
            field = field c
        }
    }
    fields[++n] = field
    return n
}

NR > 1 {
    n = parse_csv_line($0, fields)
    if (n >= 16) {
        state = fields[1]
        parent = fields[2]
        summary = fields[3]
        category = fields[4]
        project = fields[5]
        path = fields[6]
        filecount = fields[7]
        has_readme = fields[9]
        
        if (has_readme != "Y" && summary != "" && summary != "N/A") {
            print project "|" path "|" summary "|" category "|" parent "|" filecount "|" state
        }
    }
}
' "$CSV_FILE" | while IFS='|' read -r name path summary cat parent fcount state; do
    generate_readme "$name" "$path" "$summary" "$cat" "$parent" "$fcount" "$state"
done

echo "README generation complete!"
