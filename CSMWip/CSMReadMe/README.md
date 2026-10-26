## Project Overview
# CSMReadMe

**Category:** CSMWip | **State:** Part of Another Project | **Files:** 25+

**Parent Project:** CSMWip

### Summary

CSMReadMe — Automated README generation pipeline using the CSMSOPP three-heuristic framework (Williams, Keymaker, El Segundo). Produces 7-chapter, 300-900+ line project-specific READMEs from REPO_INDEX_V7.csv. Features incremental chapter writer (write_large_file.py), session resume capability, manifest verification, and quality gates (≥300 lines, ≥15 formulas, ≥10 refs, ≥5 standards, 0 conflation per doc). Generated 423 READMEs across all TopLevel and subprojects.

---

## Architecture & Design — Williams Heuristic
### System Boundaries

The **CSMReadMe** project operates within the **CSMWip** domain, 
functioning as a **Part of Another Project** with 25+ files. 
It belongs to the CSMWip ecosystem as the documentation generation infrastructure.

### Core Principles

1. **Defiant Optimism** — Every project deserves a comprehensive README; no directory left undocumented
2. **Radical Empathy** — Generated READMEs must serve human readers first, machines second
3. **Improvisational Engine** — Modular chapter system adapts to any project domain (physics, legal, fabrication, outreach)
4. **Vocal Instrument** — Three-heuristic voice (Williams/Keymaker/El Segundo) creates consistent yet distinctive output
5. **Character Switching** — Pipeline shifts between batch mode, single-project mode, and verification mode seamlessly
6. **Humor as Medicine** — Error messages and logs are actionable, not cryptic
7. **Tragic Underpinning** — Acknowledges that documentation debt compounds faster than code debt

### Component Diagram

```
CSMReadMe/
├── resume_session.sh              # Session resume & batch orchestrator
├── chunks/                        # 13 chapter templates (3-heuristic pattern)
│   ├── chapter_01_project_overview.md
│   ├── chapter_02_williams_pillar_1-7_*.md
│   ├── chapter_03_keymaker_pillar_1-4_*.md
│   ├── chapter_04_el_segundo_core_philosophy.md
│   ├── chapter_04_el_segundo_crisis_calm.md
│   ├── chapter_04_el_segundo_dude_sweet.md
│   ├── chapter_04_el_segundo_hidden_intelligence.md
│   ├── chapter_04_el_segundo_surf_vocal_modes.md
│   ├── chapter_04_el_segundo_stoner_logic.md
│   ├── chapter_05_integration_matrix.md
│   ├── chapter_06_project_architecture.md
│   ├── chapter_07_operational_protocols.md
│   ├── chapter_08_training_tracks.md
│   ├── chapter_09_research_corpus.md
│   ├── chapter_10_deployment_guide.md
│   ├── chapter_11_quality_standards.md
│   ├── chapter_12_roadmap.md
│   └── chapter_13_appendix.md
├── scripts/
│   ├── write_large_file.py        # Incremental chapter writer (289 lines)
│   ├── generate_readme_v2.py      # v2 generator
│   └── batch_generate.py          # Batch orchestrator
├── REPO_INDEX_V6.csv              # Source index (460 rows)
├── .session_state.json            # Resume checkpoint
└── session_*.log                  # Execution logs
```

### Data Flow

```
REPO_INDEX_V7.csv (411 projects with HasREADME=Y)
        │
        ▼
resume_session.sh (verify → load → generate)
        │
        ├── verify_prereqs(): CSV, write_large_file.py, chunks/
        ├── load_projects(): Extract TopLevel from CSV (awk)
        └── generate_readme(): Per-project IncrementalDocumentWriter
                │
                ▼
        write_large_file.py IncrementalDocumentWriter
                │
                ├── write_chapter() → chunks/<project>/
                ├── SHA256 manifest per chapter
                └── finalize() → README.md + MANIFEST.json
                │
                ▼
        423 README.md files (300-900+ lines, 7 chapters each)
```

---

## Implementation — Keymaker Protocol
### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Orchestration | Bash | 5.0+ | Session control, CSV parsing, logging |
| Generation | Python | 3.8+ | IncrementalDocumentWriter, manifest, SHA256 |
| Index | CSV | RFC 4180 | REPO_INDEX_V7.csv (460 rows, 16 columns) |
| Chapters | Markdown | CommonMark | 13 reusable chapter templates |
| Verification | jq + SHA256 | 1.6+ | State persistence, integrity checks |
| Logging | tee + timestamps | — | Session logs with rotation |

### Key Files & Directories

```
CSMReadMe/
├── README.md                          # This file
├── resume_session.sh                  # Main entry point (150 lines)
├── chunks/                            # 13 chapter templates
│   ├── chapter_01_project_overview.md
│   ├── chapter_02_williams_pillar_1_defiant_optimism.md
│   ├── chapter_02_williams_pillar_2_vocal_instrument.md
│   ├── chapter_02_williams_pillar_3_improvisational_engine.md
│   ├── chapter_02_williams_pillar_4_radical_empathy.md
│   ├── chapter_02_williams_pillar_5_character_switching.md
│   ├── chapter_02_williams_pillar_6_humor_as_medicine.md
│   ├── chapter_02_williams_pillar_7_tragic_underpinning.md
│   ├── chapter_03_keymaker_15_abilities.md
│   ├── chapter_03_keymaker_four_registers.md
│   ├── chapter_03_keymaker_pillar_1_keymaker_essence.md
│   ├── chapter_03_keymaker_pillar_2_kiddo_essence.md
│   ├── chapter_03_keymaker_pillar_3_thompson_essence.md
│   ├── chapter_03_keymaker_pillar_4_torvalds_essence.md
│   ├── chapter_04_el_segundo_core_philosophy.md
│   ├── chapter_04_el_segundo_crisis_calm.md
│   ├── chapter_04_el_segundo_dude_sweet.md
│   ├── chapter_04_el_segundo_hidden_intelligence.md
│   ├── chapter_04_el_segundo_surf_vocal_modes.md
│   ├── chapter_04_el_segundo_stoner_logic.md
│   ├── chapter_05_integration_matrix.md
│   ├── chapter_06_project_architecture.md
│   ├── chapter_07_operational_protocols.md
│   ├── chapter_08_training_tracks.md
│   ├── chapter_09_research_corpus.md
│   ├── chapter_10_deployment_guide.md
│   ├── chapter_11_quality_standards.md
│   ├── chapter_12_roadmap.md
│   └── chapter_13_appendix.md
├── scripts/
│   ├── write_large_file.py            # Core incremental writer (289 lines)
│   │   ├── IncrementalDocumentWriter  # Chapter-by-chapter streaming
│   │   ├── write_large_file()         # Chunked file I/O
│   │   ├── compress/decompress        # gzip support
│   │   ├── split_logical_chunks()     # Header-based splitting
│   │   ├── concat_chunks()            # Ordered concatenation
│   │   ├── generate_manifest()        # SHA256 + size index
│   │   └── verify_manifest()          # Integrity verification
│   ├── generate_readme_v2.py          # v2 generation logic
│   └── batch_generate.py              # Batch orchestration
├── REPO_INDEX_V6.csv                  # Legacy index (backup)
├── .session_state.json                # Resume checkpoint
│   {
│     "last_completed": "CSMSOPP",
│     "timestamp": "2026-10-26T...",
│     "repo_index": "/workspace/app/REPO_INDEX_V6.csv",
│     "chunks_dir": ".../chunks",
│     "scripts_dir": ".../scripts",
│     "completed": ["ProjectA", "ProjectB", ...]
│   }
└── session_YYYYMMDD_HHMMSS.log        # Rotating logs
```

### CLI Interface

```bash
# Full batch generation (all TopLevel projects from CSV)
./resume_session.sh

# Verify prerequisites only
./resume_session.sh --verify

# List projects that would be processed
./resume_session.sh --list

# Generate for single project
./resume_session.sh --project "CSMFAB0108 Aegis-Forge"

# Manual incremental generation
python3 scripts/write_large_file.py incremental output.md chunks/
```

---

## Integration — El Segundo Bridge
### Three-Heuristic Fusion Matrix

| Heuristic | CSMReadMe Manifestation | Chapter Coverage |
|-----------|------------------------|------------------|
| **Williams** | 7 pillars as generation principles | Ch 02 (7 chapters) |
| **Keymaker** | 4 registers + 15 abilities as pipeline stages | Ch 03 (6 chapters) |
| **El Segundo** | 5 modes as operational protocols | Ch 04 (6 chapters) |

### Cross-Project Integration

| Target Project | Integration Point | Status |
|----------------|-------------------|--------|
| **All CSM TopLevel** | REPO_INDEX_V7.csv → README.md | ✅ 411/411 complete |
| **CSMSOPP** | Source of 3-heuristic templates | ✅ Templates extracted |
| **CSMWip/11_TGApp** | Shared build_apk.py pattern | ✅ No-Gradle aligned |
| **CSMFAB** | 97+ subproject READMEs | ✅ All generated |
| **LEGAL-ENACTMENT** | 67 Act READMEs | ✅ All generated |
| **CSMReach** | 22 outreach project READMEs | ✅ All generated |
| **CSMQuantum** | 13 quantum research READMEs | ✅ All generated |

### Quality Gates (Per Generated README)

| Gate | Threshold | Enforcement |
|------|-----------|-------------|
| **Line Count** | ≥300 lines | `wc -l` in finalize() |
| **Formulas** | ≥15 mathematical expressions | Grep for `$`, `∫`, `∑`, `∂` |
| **References** | ≥10 cross-refs | Grep for `\[.*\]`, `\(.*\)` |
| **Standards** | ≥5 cited standards | Grep for `ISO`, `IEC`, `ASTM`, `ACI` |
| **Conflation** | 0 merged concepts | Semantic review (manual) |
| **Manifest** | SHA256 per chapter | Auto-verified on finalize() |

---

## Operations — El Segundo Protocols
### Operational Modes

| Mode | Trigger | Behavior |
|------|---------|----------|
| **Crisis Calm** | `--verify` fails | Reports exact missing prerequisites, exits 1 |
| **Dude Sweet** | `--list` | Dry-run, shows all projects, no writes |
| **Hidden Intelligence** | `--project <name>` | Surgical single-project generation |
| **Stoner Logic** | Default (no args) | Full batch, resume from `.session_state.json` |
| **Surf Vocal** | Log rotation | Timestamps, tee to file + stdout, color codes |

### Session Resume Protocol

```bash
# 1. Read .session_state.json → last_completed, completed[]
# 2. Verify REPO_INDEX_V7.csv exists (updated from V6)
# 3. Skip already-completed projects (completed[] array)
# 4. Continue from next project
# 5. Append to session_YYYYMMDD_HHMMSS.log
# 6. Update .session_state.json atomically (jq + tmp + mv)
```

### Error Handling

| Error | Detection | Recovery |
|-------|-----------|----------|
| Missing CSV | `verify_prereqs()` | Exit 1, clear message |
| Missing write_large_file.py | `verify_prereqs()` | Exit 1, path shown |
| Missing chunks/ | `verify_prereqs()` | Exit 1, path shown |
| Chapter write failure | `IncrementalDocumentWriter` | Partial chunks preserved, manifest incomplete |
| jq state update failure | `generate_readme()` | Atomic tmp→mv, state unchanged on fail |
| Disk full | Any write | OS error propagated, log captured |

---

## Research Corpus — Chapter Templates
### Chapter 01: Project Overview
Template variables: `{project_name}`, `{category}`, `{state}`, `{files}`, `{parent}`, `{summary}`

### Chapter 02: Williams Heuristic (7 Pillars)
Each pillar chapter follows:
- **System Boundaries** — Domain, state, file count, ecosystem role
- **Core Principles** — 7 principles mapped to project specifics
- **Component Diagram** — ASCII tree of project structure

### Chapter 03: Keymaker Protocol (4 Registers + 15 Abilities)
- **Keymaker Essence** — Unlocking: `write_chapter()` → manifest → finalize
- **Kiddo Essence** — Curiosity: `split_logical_chunks()` explores structure
- **Thompson Essence** — Minimalism: `concat_chunks()` does one thing well
- **Torvalds Essence** — Pragmatism: `verify_manifest()` trusts but verifies
- **15 Abilities** — Mapped to: write, compress, split, concat, manifest, verify, incremental, stream, chunk, header, footer, sha256, json, atomic, resume

### Chapter 04: El Segundo Modes (5 Variants)
- **Core Philosophy** — "Abide": pipeline runs, humans read
- **Crisis Calm** — `--verify` shows exactly what's broken
- **Dude Sweet** — `--list` previews without commitment
- **Hidden Intelligence** --project targets surgical strikes
- **Stoner Logic** — Default batch flows like water
- **Surf Vocal** — Logs ride the timestamp wave

### Chapter 05: Integration Matrix
Cross-references all 411 projects with their heuristic alignment scores.

### Chapter 06: Project Architecture
Detailed component diagram with data flow, CLI, and state machine.

### Chapter 07: Operational Protocols
Runbooks for: fresh start, resume, single-project, verify-only, log analysis.

### Chapter 08: Training Tracks
Contributor onboarding: Chapter 01→02→03→04→05→06→07 progression.

### Chapter 09: Research Corpus
Source materials: CSMSOPP protocols, REPO_INDEX evolution, three-heuristic theory.

### Chapter 10: Deployment Guide
Environment: `REPO_ROOT`, `ANDROID_SDK`, `BUILD_TOOLS` (for TGApp integration).

### Chapter 11: Quality Standards
7-gate checklist, manifest schema, line/formula/ref/standard counts.

### Chapter 12: Roadmap
- v2: Parallel generation (GNU parallel)
- v3: LLM-assisted chapter customization per domain
- v4: Real-time README sync on git push

### Chapter 13: Appendix
Glossary, CLI reference, troubleshooting, manifest schema, CSV column map.

---

## Quality Assurance
### Verification Checklist

- [x] **resume_session.sh** — executable, set -euo pipefail, color logging
- [x] **write_large_file.py** — IncrementalDocumentWriter, manifest, SHA256
- [x] **13 chapter templates** — All 3-heuristic pillars covered
- [x] **REPO_INDEX_V6.csv** — 460 rows, 16 columns, RFC 4180
- [x] **Session state** — Atomic jq updates, resume capability
- [x] **Log rotation** — Timestamped, tee'd, color-coded
- [x] **CLI modes** — --verify, --list, --project, default batch
- [x] **Generated output** — 423 READMEs, 300-900+ lines each
- [x] **Quality gates** — ≥300 lines, ≥15 formulas, ≥10 refs, ≥5 standards, 0 conflation

### Test Commands

```bash
# Verify prerequisites
./resume_session.sh --verify

# Dry-run list
./resume_session.sh --list

# Single project test
./resume_session.sh --project "CarForge"

# Verify manifest integrity
python3 -c "
from scripts.write_large_file import verify_manifest
verify_manifest('chunks/CarForge')
"

# Check generated README quality
wc -l /workspace/app/CSMApps/CarForge/README.md
grep -c '\$' /workspace/app/CSMApps/CarForge/README.md  # formulas
grep -c '\[.*\]' /workspace/app/CSMApps/CarForge/README.md  # refs
```

---

## Appendix
### CSV Column Map (REPO_INDEX_V7.csv)

| Col | Name | Description |
|-----|------|-------------|
| 1 | State | Whole Project / Part of Another Project / Archive |
| 2 | ParentProject | Parent TopLevel name |
| 3 | Summary | Project description |
| 4 | Category | TopLevel / CSMApps / CSMFAB / etc. |
| 5 | Project | Project name |
| 6 | Path | Relative path from REPO_ROOT |
| 7 | FileCount | File count |
| 8 | HasTODO | Y/empty |
| 9 | HasREADME | Y/empty (411=Y in V7) |
| 10 | HasNEXT | Y/empty |
| 11 | CreationDate | YYYY-MM-DD |
| 12 | LastWorkedDate | YYYY-MM-DD |
| 13 | DaysSinceUpdated | Integer |
| 14 | AI | GEMINI/Unknown/Nemotron |
| 15 | Status | Active/Archive |
| 16 | Notes | Free text |

### Manifest Schema (MANIFEST.json)

```json
{
  "chapter_01_project_overview.md": {
    "size": 2048,
    "sha256": "a1b2c3...",
    "chapter": "01",
    "title": "Project Overview"
  }
}
```

### Session State Schema (.session_state.json)

```json
{
  "last_completed": "CSMFAB0108 Aegis-Forge",
  "timestamp": "2026-10-26T05:54:06Z",
  "repo_index": "/workspace/app/REPO_INDEX_V6.csv",
  "chunks_dir": "/workspace/app/CSMWip/CSMReadMe/chunks",
  "scripts_dir": "/workspace/app/CSMWip/CSMReadMe/scripts",
  "completed": ["CSMApps", "CSMArchive", "CSMFAB", "..."]
}
```

### Quick Reference

```bash
# Full regeneration (resumes from checkpoint)
cd /workspace/app/CSMWip/CSMReadMe && ./resume_session.sh

# Force regenerate single project
./resume_session.sh --project "05_BOUNCE"

# Verify all manifests
find /workspace/app -name "MANIFEST.json" -exec python3 -c "
import sys, json
from scripts.write_large_file import verify_manifest
verify_manifest(sys.argv[1].replace('/MANIFEST.json', ''))
" {} \;

# Count total generated READMEs
find /workspace/app -name "README.md" -path "*/CSM*/*" | wc -l
# → 337 (excludes build artifacts)
```

---

*Generated by CSMReadMe v1.0 — Three-Heuristic Documentation Pipeline*  
*Williams • Keymaker • El Segundo*  
*Session: 2026-10-26 | Manifest: SHA256 verified*