# README_GENERATOR (Documentation Generation Toolkit)

**Category:** TopLevel | **State:** Whole Project | **Files:** 20

**Parent Project:** N/A (Top-Level)

## Summary

# README_GENERATOR — Automated README.md generation toolkit using 3-pronged Williams/Keymaker/El Segundo heuristics. Parses REPO_INDEX_V6.csv and generates comprehensive 300-900 line READMEs with chapter-based chunking via write_large_file.py IncrementalDocumentWriter. Includes shell (bash) and Python implementations, CSV parser with quote handling, radio compilation scripts, and manifest verification.

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The README_GENERATOR project operates within the **TopLevel** domain, functioning as a **Whole Project** with 20 files. It is a top-level project that serves as the documentation infrastructure for the entire workspace, generating consistent README.md files across 100+ sub-projects.

### Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every generated README links to its source REPO_INDEX entry
3. **Resilience** — Graceful degradation when project directories missing
4. **Observability** — Comprehensive generation logs and manifest verification
5. **Reproducibility** — Identical README structure from same CSV input

### Component Diagram

```
README_GENERATOR
├── CSV Parser Layer          # REPO_INDEX_V6.csv → project metadata
├── Template Engine           # 7-chapter README structure
├── Shell Generator           # generate_readme_final.sh, fix_and_regenerate.sh
├── Python Generator          # generate_readme.py (IncrementalDocumentWriter)
├── Chunk Manager             # 7 logical chapters + MANIFEST.json
├── Radio Compiler            # compile_radio*.sh (Aegis GitHub README radio)
├── Markdown/HTML Converter   # md_to_html.py, md_to_html.awk
├── Validation Utilities      # update_hasreadme.awk, parse_and_generate.sh
└── Logging & Debug           # generation_log.txt
```

---

## Implementation — Keymaker Protocol

### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Parser | AWK (GAWK) | 5.x | CSV parsing with quote handling |
| Generator (Shell) | Bash | 5.x | Template-based README generation |
| Generator (Python) | Python 3 | 3.8+ | IncrementalDocumentWriter integration |
| Chunking | write_large_file.py | Custom | Chapter-based authoring, SHA256 manifests |
| Markdown | Python markdown / AWK | — | MD → HTML conversion |
| Radio | Shell + Python | — | Audio README compilation |
| Version Control | Git | — | Distributed workflow |

### Key Files & Directories

```
./README_GENERATOR/
├── generate_readme_final.sh      # Main shell generator (template-based)
├── fix_and_regenerate.sh         # Enhanced shell generator with var substitution
├── generate_readme.py            # Python generator using IncrementalDocumentWriter
├── gen_readme.py                 # Alternate Python generator
├── generate_readme.awk           # AWK-based template processor
├── parse_and_generate.sh         # CSV parse + generate pipeline
├── update_hasreadme.awk          # REPO_INDEX HasREADME field updater
├── compile_radio.sh              # Radio README compiler v1
├── compile_radio_v2.sh           # Radio README compiler v2
├── compile_radio_v3.sh           # Radio README compiler v3 (current)
├── generate_all_readmes.sh       # Batch generation orchestrator
├── generate_readme_simple.sh     # Simplified generator
├── generate_readme_v2.sh         # Intermediate generator version
├── md_to_html.py                 # Markdown → HTML converter (Python)
├── md_to_html.awk                # Markdown → HTML converter (AWK)
├── generation_log.txt            # Generation run logs
├── README_chunks/                # Chapter chunks (auto-generated)
└── memory/                       # Session logs (auto-created)
```

### Configuration

Key configuration and data sources:

- **REPO_INDEX_V6.csv** — Master project registry (CSV with 16 columns)
- **write_large_file.py** — Shared chunking/verification utility
- **__Python_Tools/** — Shared build and document tools

### Generation Commands

```bash
# Generate all missing READMEs (shell version)
cd /workspace/app/README_GENERATOR
./fix_and_regenerate.sh

# Generate all missing READMEs (Python version)
python3 generate_readme.py --csv ../REPO_INDEX_V6.csv

# Generate single project README
python3 generate_readme.py \
    "ProjectName" \
    "/workspace/app/path/to/project" \
    "Project summary from REPO_INDEX" \
    "Category" \
    "ParentProject" \
    "42" \
    "Whole Project"

# Compile radio README
./compile_radio_v3.sh

# Convert markdown to HTML
python3 md_to_html.py input.md output.html

# Update HasREADME flags in REPO_INDEX
awk -f update_hasreadme.awk REPO_INDEX_V6.csv > REPO_INDEX_V6.csv.tmp && mv REPO_INDEX_V6.csv.tmp REPO_INDEX_V6.csv
```

### Environment Variables

```bash
export CSV_FILE=/workspace/app/REPO_INDEX_V6.csv
export PYTHONPATH=/workspace/app/__Python_Tools:$PYTHONPATH
export WRITE_LARGE_FILE=/workspace/app/__Python_Tools/write_large_file.py
```

---

## Operations — El Segundo Protocol

### Session Lifecycle

1. **Startup** — Read `generation_log.txt` → Check `REPO_INDEX_V6.csv` for missing READMEs
2. **Execution** — Run `fix_and_regenerate.sh` or Python generator batch
3. **Heartbeat** — Progress logged to `generation_log.txt` every project
4. **Checkpoint** — Update `HasREADME` column in REPO_INDEX via `update_hasreadme.awk`
5. **Handoff** — Review generated READMEs, commit to Git

### Build & Validation

```bash
# Verify generated README structure
python3 ../../__Python_Tools/write_large_file.py verify README_GENERATOR/README_chunks/

# Reassemble for review
python3 ../../__Python_Tools/write_large_file.py concat README_GENERATOR/README_chunks/ README.md

# Compress for storage
python3 ../../__Python_Tools/write_large_file.py compress README.md

# Validate all generated READMEs
find /workspace/app -name "README.md" -exec python3 -c "
import sys
with open(sys.argv[1]) as f:
    content = f.read()
    assert len(content) > 500, f'Too short: {sys.argv[1]}'
    assert 'Williams Heuristic' in content, f'Missing Williams: {sys.argv[1]}'
    assert 'Keymaker Protocol' in content, f'Missing Keymaker: {sys.argv[1]}'
    assert 'El Segundo Protocol' in content, f'Missing El Segundo: {sys.argv[1]}'
" {} \;
```

### Quality Gates

- All generated READMEs must contain 7 chapters (overview, architecture, implementation, operations, heuristics, roadmap, appendix)
- Each README must reference the 3 heuristics (Williams, Keymaker, El Segundo)
- Chapter chunks must pass `MANIFEST.json` SHA256 verification
- `HasREADME` column in REPO_INDEX must be updated to "Y"
- Generated READMEs must be 300-900 lines

---

## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define the documentation standard and its boundaries across the workspace
- **Method**: 7-chapter template derived from project taxonomy in REPO_INDEX
- **Output**: Consistent README structure for 100+ projects; `generate_readme.awk` schema
- **Applied Here**: Universal template adapts to any project category/state/parent

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define how READMEs are generated, chunked, and verified
- **Method**: Dual implementation (Bash + Python); `IncrementalDocumentWriter` for chunking; CSV parser with RFC4180 quote handling
- **Output**: `generate_readme.py` (modern), `fix_and_regenerate.sh` (legacy), `MANIFEST.json` per project
- **Applied Here**: SHA256 manifests; 7-chapter chunks; reproducible generation from CSV

### El Segundo Protocol — Operational Excellence

- **Purpose**: Define how the generation process runs and evolves
- **Method**: Batch processing with logging; `HasREADME` flag updates; session resume via log review
- **Output**: `generation_log.txt`; `update_hasreadme.awk`; `NEXT_runner_XXX.md` pattern for downstream
- **Applied Here**: Single-command batch generation; incremental re-generation; Git integration

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo |
|-------|----------|----------|------------|
| Design | 7-Chapter Template | CSV Schema | Batch Model |
| Generate | Template Expansion | Chunk Pipeline | Log Progress |
| Verify | Structure Check | Manifest SHA256 | HasREADME Flag |
| Deploy | Git Commit | Concat + Compress | Session Handoff |
| Evolve | Template Version | Python Migration | Auto-Continue |

---

## Generator Variants

### 1. Shell Template Generator (`fix_and_regenerate.sh`)
- **Approach**: Heredoc templates with `sed` variable substitution
- **Chapters**: 7 separate chunk files + manifest
- **Parser**: AWK RFC4180 CSV parser (handles quoted fields, embedded commas)
- **Output**: `README.md` + `README_chunks/readme_01-07.md` + `MANIFEST.json`

### 2. Python Incremental Generator (`generate_readme.py`)
- **Approach**: `IncrementalDocumentWriter` from `write_large_file.py`
- **Chapters**: 7 generator methods yielding lines incrementally
- **Parser**: Uses Python `csv` module (stdlib)
- **Output**: Same structure, better memory efficiency for large docs

### 3. Radio Compiler (`compile_radio_v3.sh`)
- **Purpose**: Generate audio-ready README content for Aegis GitHub Radio
- **Input**: Generated READMEs + custom scripts
- **Output**: Radio scripts, HTML variants

### 4. Markdown/HTML Converter (`md_to_html.py`, `md_to_html.awk`)
- **Purpose**: Convert generated READMEs to HTML for web publishing
- **Features**: Chapter-aware conversion, CSS embedding, TOC generation

---

## Roadmap & Future Work

### Immediate (Next 1-2 Sessions)

- [ ] Complete README_GENERATOR self-documentation (this file)
- [ ] Validate all 100+ generated READMEs pass quality gates
- [ ] Establish `memory/` directory for generation session logging
- [ ] Create `NEXT_runner_001.md` with next batch assignments

### Short Term (Next 5 Sessions)

- [ ] Migrate shell generator fully to Python `IncrementalDocumentWriter`
- [ ] Implement heartbeat monitoring during batch generation
- [ ] Add parallel generation for independent projects
- [ ] Document generator-specific workflows in `AGENTS.md`

### Medium Term (Next 10 Sessions)

- [ ] Add support for project-specific template overrides
- [ ] Implement cross-reference validation across generated READMEs
- [ ] Create web UI for monitoring generation status
- [ ] Integrate with CI/CD for automatic README updates on REPO_INDEX change

### Long Term (Ongoing)

- [ ] Maintain template currency with heuristic evolution
- [ ] Quarterly review of generated README quality
- [ ] Archive generation logs to `FinishedWork/` with compression
- [ ] Extend to generate `AGENTS.md`, `TODO.md`, `NEXT_runner_XXX.md` from templates

---

## Appendix — Quick Reference

### Key Commands

```bash
# Session startup
cd /workspace/app/README_GENERATOR
cat generation_log.txt
cat NEXT_runner_001.md
git status

# Full batch generation (shell)
./fix_and_regenerate.sh

# Full batch generation (Python)
python3 generate_readme.py --batch --csv ../REPO_INDEX_V6.csv

# Single project
python3 generate_readme.py "Project" "./path" "Summary" "Cat" "Parent" "42" "State"

# Radio compilation
./compile_radio_v3.sh

# Markdown → HTML
python3 md_to_html.py README.md README.html

# Update REPO_INDEX HasREADME flags
awk -f update_hasreadme.awk ../REPO_INDEX_V6.csv > ../REPO_INDEX_V6.csv.tmp && mv ../REPO_INDEX_V6.csv.tmp ../REPO_INDEX_V6.csv

# Document operations (shared)
python3 ../__Python_Tools/write_large_file.py split <input> <chunks_dir>
python3 ../__Python_Tools/write_large_file.py concat <chunks_dir> <output>
python3 ../__Python_Tools/write_large_file.py manifest <chunks_dir>
python3 ../__Python_Tools/write_large_file.py verify <chunks_dir>
python3 ../__Python_Tools/write_large_file.py compress <file>

# Git workflow
git add -A && git commit -m 'docs: regenerate READMEs from REPO_INDEX' && git push
```

### File Locations

- **Project Root**: `./README_GENERATOR`
- **Source CSV**: `../REPO_INDEX_V6.csv`
- **Chunk Output**: `./README_chunks/` (per project)
- **Shared Tools**: `../__Python_Tools/write_large_file.py`
- **Generation Log**: `./generation_log.txt`
- **Memory Logs**: `./memory/`

### Related Projects

- **Consumer**: All 100+ projects in workspace (CSMApps, CSMFAB, CSMWip, etc.)
- **Data Source**: REPO_INDEX_V6.csv (master project registry)
- **Shared Utils**: __Python_Tools/write_large_file.py
- **Output Target**: Every project's `README.md` and `README_chunks/`
- **File Count**: 20 generator files + 7 chunks per generated project

---

*README generated for README_GENERATOR — Whole Project*
*Category: TopLevel | Files: 20 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter (self-documenting)*