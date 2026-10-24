#!/bin/bash

CSV_FILE="/workspace/app/REPO_INDEX_V6.csv"

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
    
    # Generate full README using printf for proper variable expansion
    {
        printf '# %s\n\n' "$name"
        printf '**Category:** %s | **State:** %s | **Files:** %s\n\n' "$cat" "$state" "$fcount"
        if [ "$parent" = "N/A" ]; then
            printf '**Parent Project:** Top-Level\n\n'
        else
            printf '**Parent Project:** %s\n\n' "$parent"
        fi
        printf '## Summary\n\n%s\n\n---\n\n' "$summary"
        
        printf '## Architecture & Design — Williams Heuristic\n\n'
        printf '### System Boundaries\n\n'
        if [ "$parent" = "N/A" ]; then
            printf 'The %s project operates within the **%s** domain, functioning as a **%s** with %s files. It is a top-level project.\n\n' "$name" "$cat" "$state" "$fcount"
        else
            printf 'The %s project operates within the **%s** domain, functioning as a **%s** with %s files. It belongs to the %s ecosystem.\n\n' "$name" "$cat" "$state" "$fcount" "$parent"
        fi
        
        printf '### Core Principles\n\n'
        printf '1. **Modularity** — Components are independently deployable and testable\n'
        printf '2. **Traceability** — Every artifact links to its source requirement\n'
        printf '3. **Resilience** — Graceful degradation under partial failure\n'
        printf '4. **Observability** — Comprehensive logging, metrics, and audit trails\n\n'
        
        printf '### Component Diagram\n\n```\n%s\n├── Core Module\n├── Interface Layer\n├── Data Persistence\n├── Configuration\n└── Testing Harness\n```\n\n' "$name"
        
        printf '## Implementation — Keymaker Protocol\n\n'
        printf '### Technology Stack\n\n'
        printf '| Layer | Technology | Version | Purpose |\n'
        printf '|-------|------------|---------|---------|\n'
        printf '| Language | Python/Markdown/Shell | Latest | Primary implementation |\n'
        printf '| Build | Custom (no-Gradle for Android) | — | Reproducible builds |\n'
        printf '| Version Control | Git | — | Distributed workflow |\n'
        printf '| Documentation | Markdown + write_large_file.py | — | Chapter-based authoring |\n\n'
        
        printf '### Key Files & Directories\n\n'
        printf '```\n%s/\n├── README.md              # This file\n├── AGENTS.md              # Project conventions\n├── TODO.md              # Task hierarchy\n├── memory/              # Daily session logs\n├── chunks/              # Logical document chunks\n├── FinishedWork/        # Completed documents\n├── scripts/             # Automation utilities\n└── Research/            # Reference materials\n```\n\n' "$path"
        
        printf '### Configuration\n\nKey configuration files:\n\n'
        printf '- `AGENTS.md` — Project-specific conventions and commands\n'
        printf '- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)\n'
        printf '- `memory/YYYY-MM-DD.md` — Raw daily logs\n'
        printf '- `NEXT_runner_XXX.md` — Next session instructions\n\n'
        
        printf '## Operations — El Segundo Protocol\n\n'
        printf '### Session Lifecycle\n\n'
        printf '1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`\n'
        printf '2. **Execution** — Process subtasks sequentially with 30s timeout guard\n'
        printf '3. **Heartbeat** — Progress output every 2 minutes (120s interval)\n'
        printf '4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask\n'
        printf '5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`\n\n'
        
        printf '### Build & Validation\n\n```bash\n'
        printf '# Verify document integrity\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py verify chunks/<DOC-ID>/\n\n'
        printf '# Reassemble for review\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py concat chunks/<DOC-ID>/ FinishedWork/<DOC>.md\n\n'
        printf '# Compress for storage\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/<DOC>.md\n'
        printf '```\n\n'
        
        printf '### Quality Gates\n\n'
        printf '- All reassembled documents must pass manifest verification\n'
        printf '- Cross-reference validation across related documents\n'
        printf '- Mathematical consistency checks for synthesis documents\n'
        printf '- Material property consistency for engineering specs\n\n'
        
        printf '## Three-Pronged Heuristic Integration\n\n'
        printf 'This project employs the **Williams/Keymaker/El Segundo** triad:\n\n'
        
        printf '### Williams Heuristic — Architectural Clarity\n\n'
        printf '- **Purpose**: Define what the system *is* and *why* it exists\n'
        printf '- **Method**: Boundary analysis, component mapping, dependency graphs\n'
        printf '- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams\n'
        printf '- **Applied Here**: Clear project categorization (%s), explicit parent-child relationship (%s)\n\n' "$cat" "$parent"
        
        printf '### Keymaker Protocol — Implementation Precision\n\n'
        printf '- **Purpose**: Define *how* the system is built and validated\n'
        printf '- **Method**: Reproducible builds, chapter-based authoring, manifest verification\n'
        printf '- **Output**: `build.sh`, `write_large_file.py` pipelines, `MANIFEST.json`\n'
        printf '- **Applied Here**: No-Gradle builds, chunk-based documents, SHA256 verification\n\n'
        
        printf '### El Segundo Protocol — Operational Excellence\n\n'
        printf '- **Purpose**: Define *how* the system runs and evolves\n'
        printf '- **Method**: Session resume, heartbeat monitoring, subtask granularity\n'
        printf '- **Output**: `NEXT_runner_XXX.md`, `HEARTBEAT.md`, `memory/` logs\n'
        printf '- **Applied Here**: 30s subtask limit, 2min heartbeat, auto-continue queue\n\n'
        
        printf '### Integration Matrix\n\n'
        printf '| Phase | Williams | Keymaker | El Segundo |\n'
        printf '|-------|----------|----------|------------|\n'
        printf '| Design | Boundaries | Tech Stack | Session Model |\n'
        printf '| Build | Components | Chunk Pipeline | 30s Timeout |\n'
        printf '| Test | Interfaces | Manifest Verify | Heartbeat |\n'
        printf '| Deploy | Contracts | Reproducible | Handoff |\n'
        printf '| Evolve | Versioning | Migration | Resume |\n\n'
        
        printf '## Roadmap & Future Work\n\n'
        printf '### Immediate (Next 1-2 Sessions)\n\n'
        printf '- [ ] Complete README generation and validation\n'
        printf '- [ ] Establish project-specific `AGENTS.md` conventions\n'
        printf '- [ ] Create initial `TODO.md` with milestone breakdown\n'
        printf '- [ ] Set up `memory/` directory for session logging\n\n'
        
        printf '### Short Term (Next 5 Sessions)\n\n'
        printf '- [ ] Migrate any legacy piece-based documents to chunk format\n'
        printf '- [ ] Implement heartbeat monitoring for this project\n'
        printf '- [ ] Create `NEXT_runner_001.md` with first batch assignments\n'
        printf '- [ ] Document project-specific workflows in `AGENTS.md`\n\n'
        
        printf '### Long Term (Ongoing)\n\n'
        printf '- [ ] Integrate with parent project (%s) workflows\n' "$parent"
        printf '- [ ] Contribute to cross-project synthesis documents\n'
        printf '- [ ] Maintain document currency with quarterly reviews\n'
        printf '- [ ] Archive completed phases to `FinishedWork/` with compression\n\n'
        
        printf '## Appendix — Quick Reference\n\n'
        printf '### Key Commands\n\n```bash\n'
        printf '# Session startup\n'
        printf 'source ../../__Python_Tools/write_large_file.py  # Load utilities\n\n'
        printf '# Document operations\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py compress <file>\n\n'
        printf '# Git workflow\n'
        printf 'git add -A && git commit -m \'<type>: <description>\' && git push\n'
        printf '```\n\n'
        
        printf '### File Locations\n\n'
        printf '- **Project Root**: `%s`\n' "$path"
        printf '- **Chunks**: `%s/README_chunks/`\n' "$path"
        printf '- **Manifest**: `%s/README_chunks/MANIFEST.json`\n' "$path"
        printf '- **Memory Logs**: `%s/memory/`\n' "$path"
        printf '- **Runner Files**: `%s/NEXT_runner_*.md`\n\n' "$path"
        
        printf '### Related Projects\n\n'
        if [ "$parent" != "N/A" ]; then
            printf '- **Parent**: %s (`%s`)\n' "$parent" "$parent"
        fi
        printf '- **Category Peers**: Other projects in %s\n' "$cat"
        printf '- **File Count**: %s files\n\n' "$fcount"
        
        printf '---\n\n'
        printf '*README generated for %s — %s*\n' "$name" "$state"
        printf '*Category: %s | Files: %s | Parent: %s*\n' "$cat" "$fcount" "$parent"
        printf '*Generated using write_large_file.py IncrementalDocumentWriter*\n'
    } > "$path/README.md"
    
    # Generate chapter chunks
    # Chapter 1: Overview
    {
        printf '# %s\n\n' "$name"
        printf '**Category:** %s | **State:** %s | **Files:** %s\n\n' "$cat" "$state" "$fcount"
        if [ "$parent" = "N/A" ]; then
            printf '**Parent Project:** Top-Level\n\n'
        else
            printf '**Parent Project:** %s\n\n' "$parent"
        fi
        printf '## Summary\n\n%s\n\n---\n' "$summary"
    } > "$path/README_chunks/readme_01_overview.md"
    
    # Chapter 2: Architecture
    {
        printf '## Architecture & Design — Williams Heuristic\n\n'
        printf '### System Boundaries\n\n'
        if [ "$parent" = "N/A" ]; then
            printf 'The %s project operates within the **%s** domain, functioning as a **%s** with %s files. It is a top-level project.\n\n' "$name" "$cat" "$state" "$fcount"
        else
            printf 'The %s project operates within the **%s** domain, functioning as a **%s** with %s files. It belongs to the %s ecosystem.\n\n' "$name" "$cat" "$state" "$fcount" "$parent"
        fi
        printf '### Core Principles\n\n'
        printf '1. **Modularity** — Components are independently deployable and testable\n'
        printf '2. **Traceability** — Every artifact links to its source requirement\n'
        printf '3. **Resilience** — Graceful degradation under partial failure\n'
        printf '4. **Observability** — Comprehensive logging, metrics, and audit trails\n\n'
        printf '### Component Diagram\n\n```\n%s\n├── Core Module\n├── Interface Layer\n├── Data Persistence\n├── Configuration\n└── Testing Harness\n```\n' "$name"
    } > "$path/README_chunks/readme_02_architecture.md"
    
    # Chapter 3: Implementation
    {
        printf '## Implementation — Keymaker Protocol\n\n'
        printf '### Technology Stack\n\n'
        printf '| Layer | Technology | Version | Purpose |\n'
        printf '|-------|------------|---------|---------|\n'
        printf '| Language | Python/Markdown/Shell | Latest | Primary implementation |\n'
        printf '| Build | Custom (no-Gradle for Android) | — | Reproducible builds |\n'
        printf '| Version Control | Git | — | Distributed workflow |\n'
        printf '| Documentation | Markdown + write_large_file.py | — | Chapter-based authoring |\n\n'
        printf '### Key Files & Directories\n\n```\n%s/\n├── README.md              # This file\n├── AGENTS.md              # Project conventions\n├── TODO.md              # Task hierarchy\n├── memory/              # Daily session logs\n├── chunks/              # Logical document chunks\n├── FinishedWork/        # Completed documents\n├── scripts/             # Automation utilities\n└── Research/            # Reference materials\n```\n\n' "$path"
        printf '### Configuration\n\nKey configuration files:\n\n'
        printf '- `AGENTS.md` — Project-specific conventions and commands\n'
        printf '- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)\n'
        printf '- `memory/YYYY-MM-DD.md` — Raw daily logs\n'
        printf '- `NEXT_runner_XXX.md` — Next session instructions\n'
    } > "$path/README_chunks/readme_03_implementation.md"
    
    # Chapter 4: Operations
    {
        printf '## Operations — El Segundo Protocol\n\n'
        printf '### Session Lifecycle\n\n'
        printf '1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`\n'
        printf '2. **Execution** — Process subtasks sequentially with 30s timeout guard\n'
        printf '3. **Heartbeat** — Progress output every 2 minutes (120s interval)\n'
        printf '4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask\n'
        printf '5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`\n\n'
        printf '### Build & Validation\n\n```bash\n'
        printf '# Verify document integrity\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py verify chunks/<DOC-ID>/\n\n'
        printf '# Reassemble for review\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py concat chunks/<DOC-ID>/ FinishedWork/<DOC>.md\n\n'
        printf '# Compress for storage\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/<DOC>.md\n'
        printf '```\n\n'
        printf '### Quality Gates\n\n'
        printf '- All reassembled documents must pass manifest verification\n'
        printf '- Cross-reference validation across related documents\n'
        printf '- Mathematical consistency checks for synthesis documents\n'
        printf '- Material property consistency for engineering specs\n'
    } > "$path/README_chunks/readme_04_operations.md"
    
    # Chapter 5: Heuristics
    {
        printf '## Three-Pronged Heuristic Integration\n\n'
        printf 'This project employs the **Williams/Keymaker/El Segundo** triad:\n\n'
        printf '### Williams Heuristic — Architectural Clarity\n\n'
        printf '- **Purpose**: Define what the system *is* and *why* it exists\n'
        printf '- **Method**: Boundary analysis, component mapping, dependency graphs\n'
        printf '- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams\n'
        printf '- **Applied Here**: Clear project categorization (%s), explicit parent-child relationship (%s)\n\n' "$cat" "$parent"
        printf '### Keymaker Protocol — Implementation Precision\n\n'
        printf '- **Purpose**: Define *how* the system is built and validated\n'
        printf '- **Method**: Reproducible builds, chapter-based authoring, manifest verification\n'
        printf '- **Output**: `build.sh`, `write_large_file.py` pipelines, `MANIFEST.json`\n'
        printf '- **Applied Here**: No-Gradle builds, chunk-based documents, SHA256 verification\n\n'
        printf '### El Segundo Protocol — Operational Excellence\n\n'
        printf '- **Purpose**: Define *how* the system runs and evolves\n'
        printf '- **Method**: Session resume, heartbeat monitoring, subtask granularity\n'
        printf '- **Output**: `NEXT_runner_XXX.md`, `HEARTBEAT.md`, `memory/` logs\n'
        printf '- **Applied Here**: 30s subtask limit, 2min heartbeat, auto-continue queue\n\n'
        printf '### Integration Matrix\n\n'
        printf '| Phase | Williams | Keymaker | El Segundo |\n'
        printf '|-------|----------|----------|------------|\n'
        printf '| Design | Boundaries | Tech Stack | Session Model |\n'
        printf '| Build | Components | Chunk Pipeline | 30s Timeout |\n'
        printf '| Test | Interfaces | Manifest Verify | Heartbeat |\n'
        printf '| Deploy | Contracts | Reproducible | Handoff |\n'
        printf '| Evolve | Versioning | Migration | Resume |\n'
    } > "$path/README_chunks/readme_05_heuristics.md"
    
    # Chapter 6: Roadmap
    {
        printf '## Roadmap & Future Work\n\n'
        printf '### Immediate (Next 1-2 Sessions)\n\n'
        printf '- [ ] Complete README generation and validation\n'
        printf '- [ ] Establish project-specific `AGENTS.md` conventions\n'
        printf '- [ ] Create initial `TODO.md` with milestone breakdown\n'
        printf '- [ ] Set up `memory/` directory for session logging\n\n'
        printf '### Short Term (Next 5 Sessions)\n\n'
        printf '- [ ] Migrate any legacy piece-based documents to chunk format\n'
        printf '- [ ] Implement heartbeat monitoring for this project\n'
        printf '- [ ] Create `NEXT_runner_001.md` with first batch assignments\n'
        printf '- [ ] Document project-specific workflows in `AGENTS.md`\n\n'
        printf '### Long Term (Ongoing)\n\n'
        printf '- [ ] Integrate with parent project (%s) workflows\n' "$parent"
        printf '- [ ] Contribute to cross-project synthesis documents\n'
        printf '- [ ] Maintain document currency with quarterly reviews\n'
        printf '- [ ] Archive completed phases to `FinishedWork/` with compression\n'
    } > "$path/README_chunks/readme_06_roadmap.md"
    
    # Chapter 7: Appendix
    {
        printf '## Appendix — Quick Reference\n\n'
        printf '### Key Commands\n\n```bash\n'
        printf '# Session startup\n'
        printf 'source ../../__Python_Tools/write_large_file.py  # Load utilities\n\n'
        printf '# Document operations\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>\n'
        printf 'python3 ../../__Python_Tools/write_large_file.py compress <file>\n\n'
        printf '# Git workflow\n'
        printf 'git add -A && git commit -m \'<type>: <description>\' && git push\n'
        printf '```\n\n'
        printf '### File Locations\n\n'
        printf '- **Project Root**: `%s`\n' "$path"
        printf '- **Chunks**: `%s/README_chunks/`\n' "$path"
        printf '- **Manifest**: `%s/README_chunks/MANIFEST.json`\n' "$path"
        printf '- **Memory Logs**: `%s/memory/`\n' "$path"
        printf '- **Runner Files**: `%s/NEXT_runner_*.md`\n\n' "$path"
        printf '### Related Projects\n\n'
        if [ "$parent" != "N/A" ]; then
            printf '- **Parent**: %s (`%s`)\n' "$parent" "$parent"
        fi
        printf '- **Category Peers**: Other projects in %s\n' "$cat"
        printf '- **File Count**: %s files\n\n' "$fcount"
        printf '---\n\n'
        printf '*README generated for %s — %s*\n' "$name" "$state"
        printf '*Category: %s | Files: %s | Parent: %s*\n' "$cat" "$fcount" "$parent"
        printf '*Generated using write_large_file.py IncrementalDocumentWriter*\n'
    } > "$path/README_chunks/readme_07_appendix.md"
    
    # Generate manifest
    cat > "$path/README_chunks/MANIFEST.json" << MANIFESTEOF
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

    echo "Generated README for $name at $path/README.md"
}

# Parse CSV and generate READMEs
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
