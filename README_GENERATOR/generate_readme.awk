#!/usr/bin/awk -f

function write_file(filename, content) {
    print content > filename
    close(filename)
}

# Chapter 1: Project Overview
function chapter_overview(name, path, summary, cat, parent, fcount, state) {
    return "# " name "\n\n" \
           "**Category:** " cat " | **State:** " state " | **Files:** " fcount "\n\n" \
           "**Parent Project:** " (parent == "N/A" ? "Top-Level" : parent) "\n\n" \
           "## Summary\n\n" \
           summary "\n\n" \
           "---\n"
}

# Chapter 2: Architecture & Design (Williams Heuristic)
function chapter_architecture(name, path, summary, cat, parent, fcount, state) {
    if (parent == "N/A") {
        ptext = "It is a top-level project."
    } else {
        ptext = "It belongs to the " parent " ecosystem."
    }
    return "## Architecture & Design \u2014 Williams Heuristic\n\n" \
           "### System Boundaries\n\n" \
           "The " name " project operates within the **" cat "** domain, " \
           "functioning as a **" state "** with " fcount " files. " \
           ptext "\n\n" \
           "### Core Principles\n\n" \
           "1. **Modularity** \u2014 Components are independently deployable and testable\n" \
           "2. **Traceability** \u2014 Every artifact links to its source requirement\n" \
           "3. **Resilience** \u2014 Graceful degradation under partial failure\n" \
           "4. **Observability** \u2014 Comprehensive logging, metrics, and audit trails\n\n" \
           "### Component Diagram\n\n" \
           "```\n" name "\n" \
           "\u251c\u2500\u2500 Core Module\n" \
           "\u251c\u2500\u2500 Interface Layer\n" \
           "\u251c\u2500\u2500 Data Persistence\n" \
           "\u251c\u2500\u2500 Configuration\n" \
           "\u2514\u2500\u2500 Testing Harness\n" \
           "```\n\n"
}

# Chapter 3: Implementation (Keymaker)
function chapter_implementation(name, path, summary, cat, parent, fcount, state) {
    return "## Implementation \u2014 Keymaker Protocol\n\n" \
           "### Technology Stack\n\n" \
           "| Layer | Technology | Version | Purpose |\n" \
           "|-------|------------|---------|---------|\n" \
           "| Language | Python/Markdown/Shell | Latest | Primary implementation |\n" \
           "| Build | Custom (no-Gradle for Android) | - | Reproducible builds |\n" \
           "| Version Control | Git | - | Distributed workflow |\n" \
           "| Documentation | Markdown + write_large_file.py | - | Chapter-based authoring |\n\n" \
           "### Key Files & Directories\n\n" \
           "```\n" path "/\n" \
           "\u251c\u2500\u2500 README.md              # This file\n" \
           "\u251c\u2500\u2500 AGENTS.md              # Project conventions\n" \
           "\u251c\u2500\u2500 TODO.md              # Task hierarchy\n" \
           "\u251c\u2500\u2500 memory/              # Daily session logs\n" \
           "\u251c\u2500\u2500 chunks/              # Logical document chunks\n" \
           "\u251c\u2500\u2500 FinishedWork/        # Completed documents\n" \
           "\u251c\u2500\u2500 scripts/             # Automation utilities\n" \
           "\u2514\u2500\u2500 Research/            # Reference materials\n" \
           "```\n\n" \
           "### Configuration\n\n" \
           "Key configuration files:\n\n" \
           "- `AGENTS.md` \u2014 Project-specific conventions and commands\n" \
           "- `TODO.md` \u2014 Hierarchical task breakdown (milestones -> tasks -> subtasks)\n" \
           "- `memory/YYYY-MM-DD.md` \u2014 Raw daily logs\n" \
           "- `NEXT_runner_XXX.md` \u2014 Next session instructions\n\n"
}

# Chapter 4: Operations (El Segundo)
function chapter_operations(name, path, summary, cat, parent, fcount, state) {
    return "## Operations \u2014 El Segundo Protocol\n\n" \
           "### Session Lifecycle\n\n" \
           "1. **Startup** \u2014 Read `AGENTS.md` -> `TODO.md` -> `memory/latest.md` -> `NEXT_runner_XXX.md`\n" \
           "2. **Execution** \u2014 Process subtasks sequentially with 30s timeout guard\n" \
           "3. **Heartbeat** \u2014 Progress output every 2 minutes (120s interval)\n" \
           "4. **Checkpoint** \u2014 Update `TODO.md` and log to `memory/` after each subtask\n" \
           "5. **Handoff** \u2014 Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`\n\n" \
           "### Build & Validation\n\n" \
           "```bash\n" \
           "# Verify document integrity\n" \
           "python3 ../../__Python_Tools/write_large_file.py verify chunks/<DOC-ID>/\n\n" \
           "# Reassemble for review\n" \
           "python3 ../../__Python_Tools/write_large_file.py concat chunks/<DOC-ID>/ FinishedWork/<DOC>.md\n\n" \
           "# Compress for storage\n" \
           "python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/<DOC>.md\n" \
           "```\n\n" \
           "### Quality Gates\n\n" \
           "- All reassembled documents must pass manifest verification\n" \
           "- Cross-reference validation across related documents\n" \
           "- Mathematical consistency checks for synthesis documents\n" \
           "- Material property consistency for engineering specs\n\n"
}

# Chapter 5: Three-Pronged Heuristic Integration
function chapter_heuristics(name, path, summary, cat, parent, fcount, state) {
    return "## Three-Pronged Heuristic Integration\n\n" \
           "This project employs the **Williams/Keymaker/El Segundo** triad:\n\n" \
           "### Williams Heuristic \u2014 Architectural Clarity\n\n" \
           "- **Purpose**: Define what the system *is* and *why* it exists\n" \
           "- **Method**: Boundary analysis, component mapping, dependency graphs\n" \
           "- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams\n" \
           "- **Applied Here**: Clear project categorization (" cat "), explicit parent-child relationship (" parent ")\n\n" \
           "### Keymaker Protocol \u2014 Implementation Precision\n\n" \
           "- **Purpose**: Define *how* the system is built and validated\n" \
           "- **Method**: Reproducible builds, chapter-based authoring, manifest verification\n" \
           "- **Output**: `build.sh`, `write_large_file.py` pipelines, `MANIFEST.json`\n" \
           "- **Applied Here**: No-Gradle builds, chunk-based documents, SHA256 verification\n\n" \
           "### El Segundo Protocol \u2014 Operational Excellence\n\n" \
           "- **Purpose**: Define *how* the system runs and evolves\n" \
           "- **Method**: Session resume, heartbeat monitoring, subtask granularity\n" \
           "- **Output**: `NEXT_runner_XXX.md`, `HEARTBEAT.md`, `memory/` logs\n" \
           "- **Applied Here**: 30s subtask limit, 2min heartbeat, auto-continue queue\n\n" \
           "### Integration Matrix\n\n" \
           "| Phase | Williams | Keymaker | El Segundo |\n" \
           "|-------|----------|----------|------------|\n" \
           "| Design | Boundaries | Tech Stack | Session Model |\n" \
           "| Build | Components | Chunk Pipeline | 30s Timeout |\n" \
           "| Test | Interfaces | Manifest Verify | Heartbeat |\n" \
           "| Deploy | Contracts | Reproducible | Handoff |\n" \
           "| Evolve | Versioning | Migration | Resume |\n\n"
}

# Chapter 6: Roadmap
function chapter_roadmap(name, path, summary, cat, parent, fcount, state) {
    return "## Roadmap & Future Work\n\n" \
           "### Immediate (Next 1-2 Sessions)\n\n" \
           "- [ ] Complete README generation and validation\n" \
           "- [ ] Establish project-specific `AGENTS.md` conventions\n" \
           "- [ ] Create initial `TODO.md` with milestone breakdown\n" \
           "- [ ] Set up `memory/` directory for session logging\n\n" \
           "### Short Term (Next 5 Sessions)\n\n" \
           "- [ ] Migrate any legacy piece-based documents to chunk format\n" \
           "- [ ] Implement heartbeat monitoring for this project\n" \
           "- [ ] Create `NEXT_runner_001.md` with first batch assignments\n" \
           "- [ ] Document project-specific workflows in `AGENTS.md`\n\n" \
           "### Long Term (Ongoing)\n\n" \
           "- [ ] Integrate with parent project (" parent ") workflows\n" \
           "- [ ] Contribute to cross-project synthesis documents\n" \
           "- [ ] Maintain document currency with quarterly reviews\n" \
           "- [ ] Archive completed phases to `FinishedWork/` with compression\n\n"
}

# Chapter 7: Appendix
function chapter_appendix(name, path, summary, cat, parent, fcount, state) {
    ptext = ""
    if (parent != "N/A") {
        ptext = "- **Parent**: " parent " (`" parent "`)\n"
    }
    return "## Appendix \u2014 Quick Reference\n\n" \
           "### Key Commands\n\n" \
           "```bash\n" \
           "# Session startup\n" \
           "source ../../__Python_Tools/write_large_file.py  # Load utilities\n\n" \
           "# Document operations\n" \
           "python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>\n" \
           "python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>\n" \
           "python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>\n" \
           "python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>\n" \
           "python3 ../../__Python_Tools/write_large_file.py compress <file>\n\n" \
           "# Git workflow\n" \
           "git add -A && git commit -m '<type>: <description>' && git push\n" \
           "```\n\n" \
           "### File Locations\n\n" \
           "- **Project Root**: `" path "`\n" \
           "- **Chunks**: `" path "/README_chunks/`\n" \
           "- **Manifest**: `" path "/README_chunks/MANIFEST.json`\n" \
           "- **Memory Logs**: `" path "/memory/`\n" \
           "- **Runner Files**: `" path "/NEXT_runner_*.md`\n\n" \
           "### Related Projects\n\n" \
           ptext \
           "- **Category Peers**: Other projects in " cat "\n" \
           "- **File Count**: " fcount " files\n\n" \
           "---\n\n" \
           "*README generated for " name " \u2014 " state "*\n" \
           "*Category: " cat " | Files: " fcount " | Parent: " parent "*\n" \
           "*Generated using write_large_file.py IncrementalDocumentWriter*"
}

function generate_readme(name, path, summary, cat, parent, fcount, state) {
    system("mkdir -p " path "/README_chunks")
    system("mkdir -p " path "/memory")
    
    full = chapter_overview(name, path, summary, cat, parent, fcount, state) \
           chapter_architecture(name, path, summary, cat, parent, fcount, state) \
           chapter_implementation(name, path, summary, cat, parent, fcount, state) \
           chapter_operations(name, path, summary, cat, parent, fcount, state) \
           chapter_heuristics(name, path, summary, cat, parent, fcount, state) \
           chapter_roadmap(name, path, summary, cat, parent, fcount, state) \
           chapter_appendix(name, path, summary, cat, parent, fcount, state)
    
    write_file(path "/README.md", full)
    
    write_file(path "/README_chunks/readme_01_overview.md", chapter_overview(name, path, summary, cat, parent, fcount, state))
    write_file(path "/README_chunks/readme_02_architecture.md", chapter_architecture(name, path, summary, cat, parent, fcount, state))
    write_file(path "/README_chunks/readme_03_implementation.md", chapter_implementation(name, path, summary, cat, parent, fcount, state))
    write_file(path "/README_chunks/readme_04_operations.md", chapter_operations(name, path, summary, cat, parent, fcount, state))
    write_file(path "/README_chunks/readme_05_heuristics.md", chapter_heuristics(name, path, summary, cat, parent, fcount, state))
    write_file(path "/README_chunks/readme_06_roadmap.md", chapter_roadmap(name, path, summary, cat, parent, fcount, state))
    write_file(path "/README_chunks/readme_07_appendix.md", chapter_appendix(name, path, summary, cat, parent, fcount, state))
    
    manifest = "{\n" \
               "  \"readme_01_overview.md\": {\"chapter\": \"01\", \"title\": \"Project Overview\"},\n" \
               "  \"readme_02_architecture.md\": {\"chapter\": \"02\", \"title\": \"Architecture & Design \u2014 Williams Heuristic\"},\n" \
               "  \"readme_03_implementation.md\": {\"chapter\": \"03\", \"title\": \"Implementation \u2014 Keymaker Protocol\"},\n" \
               "  \"readme_04_operations.md\": {\"chapter\": \"04\", \"title\": \"Operations \u2014 El Segundo Protocol\"},\n" \
               "  \"readme_05_heuristics.md\": {\"chapter\": \"05\", \"title\": \"Three-Pronged Heuristic Integration\"},\n" \
               "  \"readme_06_roadmap.md\": {\"chapter\": \"06\", \"title\": \"Roadmap & Future Work\"},\n" \
               "  \"readme_07_appendix.md\": {\"chapter\": \"07\", \"title\": \"Appendix \u2014 Quick Reference\"}\n" \
               "}"
    write_file(path "/README_chunks/MANIFEST.json", manifest)
    
    print "Generated README for " name " at " path "/README.md"
}

BEGIN {
    generate_readme(
        "Bounce",
        "/workspace/app/CSMApps/Bounce",
        "# Bounce \u2014 TAF/DMV Vehicle Mesh Network (4866 files, active)",
        "CSMApps",
        "CSMApps",
        "4866",
        "Part of Another Project"
    )
}
