#!/usr/bin/env python3
"""
Smart README Generator - Scans actual project content and generates tailored READMEs
Replaces the template-based generator with real project analysis
"""

import sys
import os
import subprocess
from pathlib import Path
from collections import Counter

sys.path.insert(0, '/workspace/app/__Python_Tools')
from write_large_file import IncrementalDocumentWriter


class SmartREADMEGenerator:
    def __init__(self, project_name, project_path, summary, category, parent, filecount, state):
        self.project_name = project_name
        self.project_path = Path(project_path)
        self.summary = summary
        self.category = category
        self.parent = parent
        self.filecount = int(filecount) if filecount and filecount.strip() else 0
        self.state = state
        self.output_path = self.project_path / "README.md"
        self.chunk_dir = self.project_path / "README_chunks"
        
        # Analysis results
        self.file_types = Counter()
        self.languages = Counter()
        self.key_dirs = []
        self.key_files = []
        self.build_system = None
        self.has_android = False
        self.has_java = False
        self.has_python = False
        self.has_js = False
        self.has_html = False
        self.has_markdown = False
        self.has_pdf = False
        self.has_zip = False
        self.tech_stack = []
        
    def analyze_project(self):
        """Scan project directory and detect actual tech stack, structure"""
        if not self.project_path.exists():
            return
            
        seen_key_files = set()
        top_level_dirs = set()
        
        for root, dirs, files in os.walk(self.project_path):
            # Skip hidden and chunk dirs
            dirs[:] = [d for d in dirs if not d.startswith('.') and d != 'README_chunks']
            
            rel_root = Path(root).relative_to(self.project_path)
            if rel_root != Path('.'):
                # Only track top-level directories (depth 1)
                parts = rel_root.parts
                if len(parts) == 1:
                    top_level_dirs.add(str(rel_root))
                self.key_dirs.append(str(rel_root))
                
            for f in files:
                ext = Path(f).suffix.lower()
                self.file_types[ext] += 1
                
                # Detect languages
                if ext in ['.java']:
                    self.has_java = True
                    self.languages['Java'] += 1
                elif ext in ['.py']:
                    self.has_python = True
                    self.languages['Python'] += 1
                elif ext in ['.js', '.ts', '.jsx', '.tsx']:
                    self.has_js = True
                    self.languages['JavaScript/TypeScript'] += 1
                elif ext in ['.html', '.htm']:
                    self.has_html = True
                    self.languages['HTML'] += 1
                elif ext in ['.md']:
                    self.has_markdown = True
                    self.languages['Markdown'] += 1
                elif ext in ['.pdf']:
                    self.has_pdf = True
                elif ext in ['.zip']:
                    self.has_zip = True
                elif ext in ['.kt']:
                    self.languages['Kotlin'] += 1
                elif ext in ['.cpp', '.cc', '.cxx', '.c', '.h', '.hpp']:
                    self.languages['C/C++'] += 1
                elif ext in ['.rs']:
                    self.languages['Rust'] += 1
                elif ext in ['.go']:
                    self.languages['Go'] += 1
                elif ext in ['.sh']:
                    self.languages['Shell'] += 1
                elif ext in ['.xml']:
                    self.languages['XML'] += 1
                elif ext in ['.json']:
                    self.languages['JSON'] += 1
                elif ext in ['.yaml', '.yml']:
                    self.languages['YAML'] += 1
                elif ext in ['.gradle']:
                    self.languages['Gradle'] += 1
                elif ext in ['.kt', '.kts']:
                    self.languages['Kotlin'] += 1
                    
                # Key files - deduplicate by basename
                if f in ['build.sh', 'build.gradle', 'build.gradle.kts', 'pom.xml', 'CMakeLists.txt', 
                         'package.json', 'requirements.txt', 'setup.py', 'pyproject.toml',
                         'AndroidManifest.xml', 'gradlew', 'gradlew.bat']:
                    if f not in seen_key_files:
                        seen_key_files.add(f)
                        self.key_files.append(str(rel_root / f))
                        
        self.key_dirs = sorted(top_level_dirs)
        
        # Detect build system - check root first, then search recursively
        build_sh_paths = list(self.project_path.rglob('build.sh'))
        if (self.project_path / 'build.sh').exists():
            self.build_system = 'Custom (build.sh — No-Gradle)'
        elif build_sh_paths:
            self.build_system = 'Custom (build.sh — No-Gradle)'
        elif (self.project_path / 'build.gradle').exists() or (self.project_path / 'build.gradle.kts').exists():
            self.build_system = 'Gradle'
        elif (self.project_path / 'pom.xml').exists():
            self.build_system = 'Maven'
        elif (self.project_path / 'CMakeLists.txt').exists():
            self.build_system = 'CMake'
        elif (self.project_path / 'package.json').exists():
            self.build_system = 'npm/Node.js'
        elif (self.project_path / 'requirements.txt').exists() or (self.project_path / 'pyproject.toml').exists():
            self.build_system = 'pip/Python'
            
        # Detect Android
        if self.has_java and (self.project_path / 'AndroidManifest.xml').exists() or any('AndroidManifest.xml' in f for f in self.key_files):
            self.has_android = True
            
        # Build tech stack summary
        self._build_tech_stack()
        
    def _build_tech_stack(self):
        """Build technology stack from analysis"""
        if self.has_android:
            self.tech_stack.append(('Platform', 'Android', 'API 24+', 'Mobile application'))
        if self.has_java:
            self.tech_stack.append(('Language', 'Java', '11+', 'Core logic'))
        if self.has_python:
            self.tech_stack.append(('Language', 'Python', '3.8+', 'Scripting/Automation'))
        if self.has_js:
            self.tech_stack.append(('Language', 'JavaScript/TypeScript', 'ES6+', 'Frontend/Web'))
        if self.has_html:
            self.tech_stack.append(('UI', 'HTML/CSS', 'WebView', 'Hybrid UI'))
        if self.has_markdown:
            self.tech_stack.append(('Docs', 'Markdown', 'Latest', 'Documentation'))
        if self.build_system:
            self.tech_stack.append(('Build', self.build_system, '—', 'Build automation'))
        if self.has_zip:
            self.tech_stack.append(('Distribution', 'ZIP/APK', '—', 'Release artifacts'))
        if self.has_pdf:
            self.tech_stack.append(('Reference', 'PDF', '—', 'Technical docs'))
            
        # Add common tools
        self.tech_stack.append(('Version Control', 'Git', '—', 'Source control'))
        self.tech_stack.append(('Documentation', 'write_large_file.py', '—', 'Chapter-based authoring'))
        
    def _chapter_overview(self):
        yield f"# {self.project_name}"
        yield ""
        yield f"**Category:** {self.category} | **State:** {self.state} | **Files:** {self.filecount}"
        yield ""
        yield f"**Parent Project:** {self.parent if self.parent != 'N/A' else 'Top-Level'}"
        yield ""
        yield "### Summary"
        yield ""
        yield self.summary
        yield ""
        yield "---"
        
    def _chapter_architecture(self):
        yield "### System Boundaries"
        yield ""
        yield f"The **{self.project_name}** project operates within the **{self.category}** domain, "
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
        yield self._generate_component_diagram()
        yield "```"
        yield ""
        
    def _generate_component_diagram(self):
        """Generate project-specific component diagram"""
        lines = [self.project_name]
        
        if self.has_android:
            lines.append("├── Android App Module")
            lines.append("│   ├── Java/Kotlin Source")
            lines.append("│   ├── Resources (res/)")
            lines.append("│   ├── Assets (WebView HTML/JS)")
            lines.append("│   └── AndroidManifest.xml")
        if self.has_python:
            lines.append("├── Python Scripts/Automation")
        if self.has_js or self.has_html:
            lines.append("├── Web/Frontend Assets")
        if self.key_dirs:
            # Add key subdirectories
            for d in sorted(set(self.key_dirs))[:5]:
                lines.append(f"├── {d}/")
        if self.has_markdown:
            lines.append("├── Documentation (Markdown)")
        if self.has_pdf:
            lines.append("├── Technical References (PDF)")
            
        lines.append("├── Build System")
        lines.append("└── Configuration")
        return "\n".join(lines)
        
    def _chapter_implementation(self):
        yield "### Technology Stack"
        yield ""
        yield "| Layer | Technology | Version | Purpose |"
        yield "|-------|------------|---------|---------|"
        
        for layer, tech, version, purpose in self.tech_stack:
            yield f"| {layer} | {tech} | {version} | {purpose} |"
        yield ""
        
        yield "### Key Files & Directories"
        yield ""
        yield "```"
        yield f"{self.project_path.name}/"
        if self.key_files:
            for kf in self.key_files[:10]:
                yield f"├── {kf}"
        if self.key_dirs:
            for kd in sorted(set(self.key_dirs))[:8]:
                yield f"├── {kd}/"
        yield "├── README.md              # This file"
        yield "├── AGENTS.md              # Project conventions"
        yield "├── TODO.md                # Task hierarchy"
        yield "├── memory/                # Daily session logs"
        yield "├── README_chunks/         # Chapter chunks (auto-generated)"
        yield "└── FinishedWork/          # Completed documents"
        yield "```"
        yield ""
        
        yield "### Configuration"
        yield ""
        yield "Key project files:"
        yield ""
        if (self.project_path / 'AGENTS.md').exists():
            yield "- `AGENTS.md` — Project-specific conventions and commands"
        else:
            yield "- `AGENTS.md` — *To be created*: Project-specific conventions"
        if (self.project_path / 'TODO.md').exists():
            yield "- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)"
        else:
            yield "- `TODO.md` — *To be created*: Task hierarchy"
        if (self.project_path / 'memory').exists():
            yield "- `memory/YYYY-MM-DD.md` — Raw daily session logs"
        else:
            yield "- `memory/` — *To be created*: Session logging directory"
        yield "- `NEXT_runner_XXX.md` — Next session instructions"
        yield ""
        
        if self.build_system:
            yield "### Build System"
            yield ""
            yield f"This project uses **{self.build_system}** for builds."
            if 'No-Gradle' in self.build_system:
                yield ""
                yield "```bash"
                yield "# Typical no-Gradle Android build flow:"
                yield "./build.sh"
                yield "```"
            yield ""
        
    def _chapter_operations(self):
        yield "### Session Lifecycle"
        yield ""
        yield "1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`"
        yield "2. **Execution** — Process subtasks sequentially with 30s timeout guard"
        yield "3. **Heartbeat** — Progress output every 2 minutes (120s interval)"
        yield "4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask"
        yield "5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`"
        yield ""
        
        if self.build_system:
            yield "### Build & Validation"
            yield ""
            yield "```bash"
            if 'No-Gradle' in self.build_system:
                yield "# No-Gradle Android build"
                yield "./build.sh"
                yield ""
                yield "# Verify APK"
                yield "aapt2 dump badging out/*.apk"
            elif 'Gradle' in self.build_system:
                yield "# Gradle build"
                yield "./gradlew assembleDebug"
            elif 'Maven' in self.build_system:
                yield "# Maven build"
                yield "mvn clean package"
            elif 'Python' in self.build_system:
                yield "# Python project"
                yield "pip install -r requirements.txt"
                yield "python -m pytest"
            yield ""
            yield "# Document integrity (if using write_large_file.py)"
            yield "python3 ../../__Python_Tools/write_large_file.py verify README_chunks/"
            yield "```"
            yield ""
            
        yield "### Quality Gates"
        yield ""
        yield "- All reassembled documents must pass manifest verification"
        yield "- Cross-reference validation across related documents"
        if self.has_android:
            yield "- APK must install and run on target Android version"
            yield "- No-Gradle build must produce valid, signed APK"
        if self.has_python:
            yield "- Python tests pass (pytest/unittest)"
            yield "- Type checking passes (mypy/pyright if configured)"
        if self.has_js:
            yield "- JS/TS type checking passes"
            yield "- Lint passes (eslint)"
        yield "- Mathematical consistency checks for synthesis documents"
        yield "- Material property consistency for engineering specs"
        yield ""
        
    def _chapter_heuristics(self):
        yield "This project employs the **Williams/Keymaker/El Segundo** triad:"
        yield ""
        
        yield "### Williams Heuristic — Architectural Clarity"
        yield ""
        yield "- **Purpose**: Define what the system *is* and *why* it exists"
        yield "- **Method**: Boundary analysis, component mapping, dependency graphs"
        yield "- **Output**: `AGENTS.md` conventions, `ARCHITECTURE.md` diagrams"
        yield f"- **Applied Here**: Clear project categorization ({self.category}), "
        yield f"explicit parent-child relationship ({self.parent if self.parent != 'N/A' else 'Top-Level'})"
        yield ""
        
        yield "### Keymaker Protocol — Implementation Precision"
        yield ""
        yield "- **Purpose**: Define *how* the system is built and validated"
        yield "- **Method**: Reproducible builds, chapter-based authoring, manifest verification"
        yield "- **Output**: `build.sh`, `write_large_file.py` pipelines, `MANIFEST.json`"
        if self.build_system and 'No-Gradle' in self.build_system:
            yield "- **Applied Here**: No-Gradle Android builds (aapt2 → javac → d8 → zipalign → apksigner), SHA256 verification"
        elif self.build_system and 'Gradle' in self.build_system:
            yield "- **Applied Here**: Gradle builds, chunk-based documents, manifest verification"
        elif self.build_system:
            yield f"- **Applied Here**: {self.build_system} builds, chunk-based documents, manifest verification"
        else:
            yield "- **Applied Here**: Chunk-based documents, SHA256 verification"
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
        yield "### Immediate (Next 1-2 Sessions)"
        yield ""
        if not (self.project_path / 'AGENTS.md').exists():
            yield "- [ ] Create project-specific `AGENTS.md` conventions"
        if not (self.project_path / 'TODO.md').exists():
            yield "- [ ] Create initial `TODO.md` with milestone breakdown"
        if not (self.project_path / 'memory').exists():
            yield "- [ ] Set up `memory/` directory for session logging"
        yield "- [ ] Complete README generation and validation"
        yield ""
        
        yield "### Short Term (Next 5 Sessions)"
        yield ""
        if self.has_markdown and not list(self.project_path.glob('README_chunks/*.md')):
            yield "- [ ] Migrate any legacy documents to chunk format"
        yield "- [ ] Implement heartbeat monitoring for this project"
        yield "- [ ] Create `NEXT_runner_001.md` with first batch assignments"
        if not (self.project_path / 'AGENTS.md').exists():
            yield "- [ ] Document project-specific workflows in `AGENTS.md`"
        yield ""
        
        yield "### Long Term (Ongoing)"
        yield ""
        if self.parent != 'N/A':
            yield f"- [ ] Integrate with parent project ({self.parent}) workflows"
        yield "- [ ] Contribute to cross-project synthesis documents"
        yield "- [ ] Maintain document currency with quarterly reviews"
        yield "- [ ] Archive completed phases to `FinishedWork/` with compression"
        yield ""
        
    def _chapter_appendix(self):
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
        if self.build_system and 'No-Gradle' in self.build_system:
            yield "# No-Gradle Android Build"
            yield "./build.sh"
        elif self.build_system and 'Gradle' in self.build_system:
            yield "# Gradle Build"
            yield "./gradlew assembleDebug"
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
        
        yield "### Project Statistics"
        yield ""
        yield f"- **Total Files**: {self.filecount}"
        yield f"- **File Types**: {', '.join(f'{ext}: {count}' for ext, count in self.file_types.most_common(10))}"
        yield f"- **Languages**: {', '.join(f'{lang}: {count}' for lang, count in self.languages.most_common())}"
        yield f"- **Key Directories**: {len(set(self.key_dirs))}"
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
        # First, analyze the project
        self.analyze_project()
        
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
    
    generator = SmartREADMEGenerator(project_name, project_path, summary, category, parent, filecount, state)
    manifest = generator.generate()
    print(f"Generated README for {project_name} at {generator.output_path}")
    print(f"Manifest: {generator.chunk_dir}/MANIFEST.json ({len(manifest)} chapters)")


if __name__ == "__main__":
    main()