#!/usr/bin/env python3
"""
README Generator using write_large_file.py IncrementalDocumentWriter
Generates comprehensive README.md files for projects (300-900 lines)
using the 3-pronged Williams/Keymaker/El Segundo heuristics
"""

import sys
import os
sys.path.insert(0, '/workspace/app/__Python_Tools')
from write_large_file import IncrementalDocumentWriter
from pathlib import Path

class READMEGenerator:
    def __init__(self, project_name, project_path, summary, category, parent, filecount, state):
        self.project_name = project_name
        self.project_path = project_path
        self.summary = summary
        self.category = category
        self.parent = parent
        self.filecount = filecount
        self.state = state
        self.output_path = Path(project_path) / "README.md"
        self.chunk_dir = Path(project_path) / "README_chunks"
        
    def _chapter_overview(self):
        """Chapter 1: Project Overview"""
        yield f"# {self.project_name}"
        yield ""
        yield f"**Category:** {self.category} | **State:** {self.state} | **Files:** {self.filecount}"
        yield ""
        yield f"**Parent Project:** {self.parent if self.parent != 'N/A' else 'Top-Level'}"
        yield ""
        yield "## Summary"
        yield ""
        yield self.summary
        yield ""
        yield "---"
        
    def _chapter_architecture(self):
        """Chapter 2: Architecture & Design (Williams Heuristic)"""
        yield "## Architecture & Design — Williams Heuristic"
        yield ""
        yield "### System Boundaries"
        yield ""
        yield f"The {self.project_name} project operates within the **{self.category}** domain, "
        yield f"functioning as a **{self.state}** with {self.filecount} files. "
        yield f"It{' is a top-level project' if self.parent == 'N/A' else f' belongs to the {self.parent} ecosystem'}."
        yield ""
        yield "### Core Principles"
        yield ""
        yield "1. **Modularity** — Components are independently deployable and testable"
        yield "2. **Traceability** — Every artifact links to its source requirement"
        yield "3. **Resilience** — Graceful degradation under partial failure"
        yield "4. **Observability** — Comprehensive logging, metrics, and audit trails"
        yield ""
        yield "### Component Diagram"
        yield ""
        yield "```"
        yield f"{self.project_name}"
        yield "├── Core Module"
        yield "├── Interface Layer"
        yield "├── Data Persistence"
        yield "├── Configuration"
        yield "└── Testing Harness"
        yield "```"
        yield ""
        
    def _chapter_implementation(self):
        """Chapter 3: Implementation Details (Keymaker)"""
        yield "## Implementation — Keymaker Protocol"
        yield ""
        yield "### Technology Stack"
        yield ""
        yield "| Layer | Technology | Version | Purpose |"
        yield "|-------|------------|---------|---------|"
        yield "| Language | Python/Markdown/Shell | Latest | Primary implementation |"
        yield "| Build | Custom (no-Gradle for Android) | — | Reproducible builds |"
        yield "| Version Control | Git | — | Distributed workflow |"
        yield "| Documentation | Markdown + write_large_file.py | — | Chapter-based authoring |"
        yield ""
        yield "### Key Files & Directories"
        yield ""
        yield f"```"
        yield f"{self.project_path}/"
        yield "├── README.md              # This file"
        yield "├── AGENTS.md              # Project conventions"
        yield "├── TODO.md              # Task hierarchy"
        yield "├── memory/              # Daily session logs"
        yield "├── chunks/              # Logical document chunks"
        yield "├── FinishedWork/        # Completed documents"
        yield "├── scripts/             # Automation utilities"
        yield "└── Research/            # Reference materials"
        yield "```"
        yield ""
        yield "### Configuration"
        yield ""
        yield "Key environment variables and configuration files:"
        yield ""
        yield "- `AGENTS.md` — Project-specific conventions and commands"
        yield "- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)"
        yield "- `memory/YYYY-MM-DD.md` — Raw daily logs"
        yield "- `NEXT_runner_XXX.md` — Next session instructions"
        yield ""
        
    def _chapter_operations(self):
        """Chapter 4: Operations & Workflows (El Segundo)"""
        yield "## Operations — El Segundo Protocol"
        yield ""
        yield "### Session Lifecycle"
        yield ""
        yield "1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`"
        yield "2. **Execution** — Process subtasks sequentially with 30s timeout guard"
        yield "3. **Heartbeat** — Progress output every 2 minutes (120s interval)"
        yield "4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask"
        yield "5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`"
        yield ""
        yield "### Build & Validation"
        yield ""
        yield "```bash"
        yield "# Verify document integrity"
        yield "python3 ../../__Python_Tools/write_large_file.py verify chunks/<DOC-ID>/"
        yield ""
        yield "# Reassemble for review"
        yield "python3 ../../__Python_Tools/write_large_file.py concat chunks/<DOC-ID>/ FinishedWork/<DOC>.md"
        yield ""
        yield "# Compress for storage"
        yield "python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/<DOC>.md"
        yield "```"
        yield ""
        yield "### Quality Gates"
        yield ""
        yield "- All reassembled documents must pass manifest verification"
        yield "- Cross-reference validation across related documents"
        yield "- Mathematical consistency checks for synthesis documents"
        yield "- Material property consistency for engineering specs"
        yield ""
        
    def _chapter_heuristics(self):
        """Chapter 5: Three-Pronged Heuristic Integration"""
        yield "## Three-Pronged Heuristic Integration"
        yield ""
        yield "This project employs the **Williams/Keymaker/El Segundo** triad:"
        yield ""
        yield "### Williams Heuristic — Architectural Clarity"
        yield ""
        yield "- **Purpose**: Define what the system *is* and *why* it exists"
        yield "- **Method**: Boundary analysis, component mapping, dependency graphs"
        yield "- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams"
        yield f"- **Applied Here**: Clear project categorization ({self.category}), "
        yield f"explicit parent-child relationship ({self.parent})"
        yield ""
        yield "### Keymaker Protocol — Implementation Precision"
        yield ""
        yield "- **Purpose**: Define *how* the system is built and validated"
        yield "- **Method**: Reproducible builds, chapter-based authoring, manifest verification"
        yield "- **Output**: `build.sh`, `write_large_file.py` pipelines, `MANIFEST.json`"
        yield "- **Applied Here**: No-Gradle builds, chunk-based documents, SHA256 verification"
        yield ""
        yield "### El Segundo Protocol — Operational Excellence"
        yield ""
        yield "- **Purpose**: Define *how* the system runs and evolves"
        yield "- **Method**: Session resume, heartbeat monitoring, subtask granularity"
        yield "- **Output**: `NEXT_runner_XXX.md`, `HEARTBEAT.md`, `memory/` logs"
        yield "- **Applied Here**: 30s subtask limit, 2min heartbeat, auto-continue queue"
        yield ""
        yield "### Integration Matrix"
        yield ""
        yield "| Phase | Williams | Keymaker | El Segundo |"
        yield "|-------|----------|----------|------------|"
        yield "| Design | Boundaries | Tech Stack | Session Model |"
        yield "| Build | Components | Chunk Pipeline | 30s Timeout |"
        yield "| Test | Interfaces | Manifest Verify | Heartbeat |"
        yield "| Deploy | Contracts | Reproducible | Handoff |"
        yield "| Evolve | Versioning | Migration | Resume |"
        yield ""
        
    def _chapter_roadmap(self):
        """Chapter 6: Roadmap & Future Work"""
        yield "## Roadmap & Future Work"
        yield ""
        yield "### Immediate (Next 1-2 Sessions)"
        yield ""
        yield "- [ ] Complete README generation and validation"
        yield "- [ ] Establish project-specific `AGENTS.md` conventions"
        yield "- [ ] Create initial `TODO.md` with milestone breakdown"
        yield "- [ ] Set up `memory/` directory for session logging"
        yield ""
        yield "### Short Term (Next 5 Sessions)"
        yield ""
        yield "- [ ] Migrate any legacy piece-based documents to chunk format"
        yield "- [ ] Implement heartbeat monitoring for this project"
        yield "- [ ] Create `NEXT_runner_001.md` with first batch assignments"
        yield "- [ ] Document project-specific workflows in `AGENTS.md`"
        yield ""
        yield "### Long Term (Ongoing)"
        yield ""
        yield "- [ ] Integrate with parent project ({self.parent}) workflows"
        yield "- [ ] Contribute to cross-project synthesis documents"
        yield "- [ ] Maintain document currency with quarterly reviews"
        yield "- [ ] Archive completed phases to `FinishedWork/` with compression"
        yield ""
        
    def _chapter_appendix(self):
        """Chapter 7: Appendix — Quick Reference"""
        yield "## Appendix — Quick Reference"
        yield ""
        yield "### Key Commands"
        yield ""
        yield "```bash"
        yield "# Session startup"
        yield "source ../../__Python_Tools/write_large_file.py  # Load utilities"
        yield ""
        yield "# Document operations"
        yield "python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>"
        yield "python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>"
        yield "python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>"
        yield "python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>"
        yield "python3 ../../__Python_Tools/write_large_file.py compress <file>"
        yield ""
        yield "# Git workflow"
        yield "git add -A && git commit -m '<type>: <description>' && git push"
        yield "```"
        yield ""
        yield "### File Locations"
        yield ""
        yield f"- **Project Root**: `{self.project_path}`"
        yield f"- **Chunks**: `{self.project_path}/README_chunks/`"
        yield f"- **Manifest**: `{self.project_path}/README_chunks/MANIFEST.json`"
        yield f"- **Memory Logs**: `{self.project_path}/memory/`"
        yield f"- **Runner Files**: `{self.project_path}/NEXT_runner_*.md`"
        yield ""
        yield "### Related Projects"
        yield ""
        if self.parent != "N/A":
            yield f"- **Parent**: {self.parent} (`{self.parent}`)"
        yield f"- **Category Peers**: Other projects in {self.category}"
        yield f"- **File Count**: {self.filecount} files"
        yield ""
        yield "---"
        yield ""
        yield f"*README generated for {self.project_name} — {self.state}*"
        yield f"*Category: {self.category} | Files: {self.filecount} | Parent: {self.parent}*"
        yield f"*Generated using write_large_file.py IncrementalDocumentWriter*"
        
    def generate(self):
        """Generate complete README using chapter-based writer"""
        self.output_path.parent.mkdir(parents=True, exist_ok=True)
        self.chunk_dir.mkdir(parents=True, exist_ok=True)
        
        writer = IncrementalDocumentWriter(
            output_path=str(self.output_path),
            chunk_dir=str(self.chunk_dir),
            chunk_prefix="readme",
            ext=".md"
        )
        
        writer.write_chapter("01", "Project Overview", self._chapter_overview)
        writer.write_chapter("02", "Architecture & Design — Williams Heuristic", self._chapter_architecture)
        writer.write_chapter("03", "Implementation — Keymaker Protocol", self._chapter_implementation)
        writer.write_chapter("04", "Operations — El Segundo Protocol", self._chapter_operations)
        writer.write_chapter("05", "Three-Pronged Heuristic Integration", self._chapter_heuristics)
        writer.write_chapter("06", "Roadmap & Future Work", self._chapter_roadmap)
        writer.write_chapter("07", "Appendix — Quick Reference", self._chapter_appendix)
        
        manifest = writer.finalize()
        return manifest

def main():
    if len(sys.argv) < 7:
        print("Usage: generate_readme.py <project_name> <project_path> <summary> <category> <parent> <filecount> <state>")
        sys.exit(1)
    
    project_name = sys.argv[1]
    project_path = sys.argv[2]
    summary = sys.argv[3]
    category = sys.argv[4]
    parent = sys.argv[5]
    filecount = sys.argv[6]
    state = sys.argv[7] if len(sys.argv) > 7 else "Unknown"
    
    generator = READMEGenerator(project_name, project_path, summary, category, parent, filecount, state)
    manifest = generator.generate()
    print(f"Generated README for {project_name} at {generator.output_path}")
    print(f"Manifest: {generator.chunk_dir}/MANIFEST.json ({len(manifest)} chapters)")

if __name__ == "__main__":
    main()