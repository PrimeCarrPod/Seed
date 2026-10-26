## Project Overview
# CSMMinesMagnets

**Category:** CSMWip | **State:** Part of Another Project | **Files:** 122

**Parent Project:** CSMWip

### Summary

Chilean Magnetic Minerals Brokerage Intelligence — 60-document strategic pipeline investigating Chilean magnetic mineral landscape, communities, and brokerage pathways for Tardigradia Holding Company Ventures within Carrington Storm Motors. 6 documents complete (DOC-01 through DOC-06), 2 in progress (DOC-07 Regulatory Navigation, DOC-08 Port & Logistics), 52 remaining. Runner-based workflow with CSMOPP heuristic personality synthesis (Williams, Keymaker, El Segundo, Baker Street, SHIELD). Quality gates: ≥900 lines, ≥20 formulas, ≥15 cross-refs, ≥8 standards per document.

---

## Architecture & Design — Williams Heuristic
### System Boundaries

The **CSMMinesMagnets** project operates within the **CSMWip** domain,
functioning as a **Part of Another Project** with 122 files.
It belongs to the CSMWip ecosystem as the strategic intelligence layer for Chilean magnetic mineral brokerage.

### Core Principles

1. **Broker-to-Owner Transition** — Facilitator mechanics converting to equity ownership via 7-trigger milestone system (DOC-04)
2. **Reciprocity Architecture** — Community value return via FBC (15-20% equity) + CDC (15% FCF) trusts exceeding Chilean legal minimums (DOC-03)
3. **Zero-Water Advantage** — Aegis-Forge thermal cascade inductive separation eliminates aqueous processing, simplifying Water Code, Environmental Law, and mine closure compliance (DOC-07)
4. **Strategic Corridor Designation** — CRMA (EU) 2024/1252 strategic project fast-track: 24-month permitting vs. 5-7 year standard (DOC-07, DOC-08)
5. **Heuristic Translation Layer** — Every document authored through 5 CSMOPP lenses producing "above pay-grade" brokerage intelligence (DOC-13)

### Component Diagram

```
CSMMinesMagnets/
├── Framework/                    # Core heuristics, protocols, personality synthesis
├── Research/                     # Inputs: Chile mining, magnets, communities, infrastructure
│   ├── Chilean_Law/              # Mining Code, Law 19,300, Law 19,253, Law 21,210, Law 20,551
│   ├── Magnet_Industry/          # CSMMagTech2026 V2.0, CSMMagEco2026 V2.0, E172, CSMEval25
│   ├── Infrastructure/           # FCAB, Ferronor, 5 ports, CPTPP digital trade
│   └── Communities/              # Atacameño, Diaguita, Aymara, Mapuche, Kawashkar, Yámana, Chango
├── chunks/                       # Logical document chapters (replaces Pieces/)
│   ├── DOC-01/ .. DOC-07/       # Chapter splits with MANIFEST.json (SHA256 + size)
│   ├── NEXT_runner_001/ .. 003/  # Runner handoff chunked references
│   └── MASTER_INDEX.json         # Cross-document chunk index
├── FinishedWork/                 # Compressed originals (.md.gz) + heuristic intros
│   ├── DOC-01 through DOC-08     # 900+ line documents
│   └── intros/                   # 5 heuristic variants per document
├── Logs/                         # Processing logs, heartbeat output
├── scripts/                      # Project-specific automation
│   ├── heartbeat_monitor.py      # 120s interval terminal progress
│   ├── generate_heuristic_intros.sh  # 5 CSMOPP variants
│   └── task_timer.py             # 30s subtask guard
├── Pieces/                       # Legacy fragmentation (migrate to chunks/)
├── AGENTS.md                     # Project conventions & commands
├── TODO.md                       # 60 docs × ~15 subtasks = ~900 subtasks hierarchical
├── NEXT_runner_004.md            # Current runner: DOC-07 & DOC-08
├── NEXT_runner_005.md            # Next runner: DOC-08 authoring
├── RESUME_SESSION_MAGNETS.md     # Full session resume context
├── HEARTBEAT_MAGNETS.md          # 2-minute heartbeat config
├── startup.sh                    # One-command startup (Python3, relative dir, heartbeat)
├── write_doc03_ch1.py .. ch8.py  # Chapter authors (Phase 1)
└── write_doc06.py                # Document generator (Phase 2)
```

### Publication Targets

| Output | Format | Audience | Status |
|--------|--------|----------|--------|
| 60 Research Documents | Markdown → .md.gz + chunks | Tardigradia Board, CSM Integration | 6/60 complete |
| Heuristic Intro Variants | Markdown | Internal translation layer | 5 per document |
| Chunk Manifests | JSON (SHA256) | Integrity verification | All verified |
| Brokerage Protocol (DOC-04) | Markdown | Legal/Finance teams | Complete |
| Port & Logistics Corridors (DOC-08) | Markdown | Operations/Logistics | Research complete, authoring next |
| Strategic Synthesis (DOC-56..60) | Markdown | Executive steering | Phase 7 |

---

## Implementation — Keymaker Protocol
### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Authoring | Markdown | Latest | Primary documentation format |
| Chunking | write_large_file.py | — | Chapter-based split/concat/manifest/verify/compress |
| Scripting | Python | 3.8+ | Automation, heartbeat, heuristic generation |
| Version Control | Git | — | Source control with tags per runner |
| Research | Web Search + Repository | Live | Chile law, magnet specs, port data, community data |
| Heuristics | CSMOPP Framework | 5 personalities | Williams, Keymaker, El Segundo, Baker Street, SHIELD |

### Key Files & Directories

```
CSMMinesMagnets/
├── Framework/
│   ├── Williams_Heuristic.md       # Constraint → Necessity → Commitment
│   ├── Keymaker_Protocol.md        # Lock → Key → Turn (bidirectional)
│   ├── El_Segundo_Protocol.md      # Mirror → Participation → Protocol
│   ├── Baker_Street_Heuristic.md   # Precision → Evidence → Deduction
│   └── SHIELD_Heuristic.md         # Calm → Resilience → Continuity
├── Research/
│   ├── Chilean_Mining_Code.txt
│   ├── Law_19300_Environmental.txt
│   ├── Law_19253_Indigenous.txt
│   ├── Law_21210_Royalty.txt
│   ├── Law_20551_Mine_Closure.txt
│   ├── DS_132_248_594_Safety.txt
│   ├── CRMA_2024_1252.txt
│   ├── FCAB_Annual_Report.pdf
│   ├── Puerto_Antofagasta_Specs.pdf
│   ├── IMDG_Code_Class9.txt
│   ├── CPTPP_Article_14.txt
│   └── MIL_STD_1540.txt
├── chunks/
│   ├── DOC-01/ .. DOC-07/          # 9-11 chapters each + MANIFEST.json
│   ├── NEXT_runner_001/ .. 003/    # Runner handoff documents chunked
│   └── MASTER_INDEX.json           # Cross-document mapping
├── FinishedWork/
│   ├── DOC-01_Chilean_Magnetic_Mineral_Landscape.md.gz      (19.5 KB)
│   ├── DOC-02_Lives_of_the_Extractors.md.gz                 (15.5 KB)
│   ├── DOC-03_Mutual_Benefit_Frameworks.md.gz               (22.7 KB)
│   ├── DOC-04_Brokerage_Protocol.md.gz                      (26.1 KB)
│   ├── DOC-05_Tardigradia_Holding_Company.md.gz             (74.1 KB / 22.7 KB compressed)
│   ├── DOC-06_Critical_Minerals_Diplomacy.md.gz             (22.0 KB)
│   ├── DOC-07_Chilean_Regulatory_Navigation.md.gz           (25.9 KB)
│   ├── DOC-08_Port_Logistics_Corridors.md                   (98.7 KB — uncompressed, authoring)
│   └── intros/
│       ├── DOC-XX_*_intro_williams.md
│       ├── DOC-XX_*_intro_keymaker.md
│       ├── DOC-XX_*_intro_elsegundo.md
│       ├── DOC-XX_*_intro_bakerstreet.md
│       └── DOC-XX_*_COMBINED_INTRO.md
├── scripts/
│   ├── heartbeat_monitor.py       # 120s interval, terminal progress
│   ├── generate_heuristic_intros.sh  # 5 CSMOPP variants
│   └── task_timer.py              # 30s subtask timeout guard
├── Logs/
│   └── heartbeat.log              # Continuous progress output
├── Pieces/                        # Legacy (to migrate)
├── AGENTS.md                      # This project's conventions
├── TODO.md                        # 372-line hierarchical task list
├── NEXT_runner_004.md             # Current runner instructions (291 lines)
├── NEXT_runner_005.md             # Next runner handoff (209 lines)
├── RESUME_SESSION_MAGNETS.md      # Full session context (161 lines)
├── HEARTBEAT_MAGNETS.md           # Heartbeat config
├── startup.sh                     # 25 KB one-command startup
└── write_doc03_ch1.py .. write_doc06.py  # Chapter authors
```

### Configuration

Key project files:

- `AGENTS.md` — Project conventions, document categories, quality gates, runner workflow
- `TODO.md` — Hierarchical task breakdown (60 docs × ~15 subtasks = ~900 subtasks across 8 phases)
- `memory/` — *Exists*: Daily session logs (YYYY-MM-DD.md) folded into project MEMORY.md
- `NEXT_runner_XXX.md` — Next session instructions (004 current, 005 ready)
- `RESUME_SESSION_MAGNETS.md` — Full resume context with research assets, dependencies
- `HEARTBEAT_MAGNETS.md` — 120s interval, 30s subtask guard, auto-continue
- `startup.sh` — Python3 install, relative dir change, heartbeat start, context display
- `chunks/MASTER_INDEX.json` — Cross-document chunk mapping (to be completed)

### Three Heuristics Applied

**Williams Heuristic (Architectural Clarity):**
- Boundary: Chilean magnetic minerals → Tardigradia brokerage → CSM motor integration
- 60 documents map to 8 phases: Foundation (3), Brokerage (12), Expanded (45), Synthesis (5)
- 7-trigger milestone system (DOC-04) provides clear derivation chain from geology to revenue

**Keymaker Protocol (Implementation Precision):**
- 60 documents × 9 chapters = 540 chunks + 300 heuristic intros + 60 manifests
- SHA256 manifest verification on every chunk directory
- Reproducible: write_large_file.py split/concat/verify/manifest/compress pipeline
- CSMOPP translation layer ensures each document reads as authoritative intelligence

**El Segundo Protocol (Operational Excellence):**
- Runner-based workflow: 3-5 docs per runner, 12 runners total
- 30s subtask timeout guard, 120s heartbeat interval, auto-continue queue
- Session resume: single command `bash startup.sh` from project root
- Git tags per runner completion (`runner-001-complete` through `runner-012-complete`)

---

## Operations — El Segundo Protocol
### Session Lifecycle

1. **Startup** — `cd CSMWip/CSMMinesMagnets && bash startup.sh` (Python3, relative dir, heartbeat, context)
2. **Research** — Web search + repository asset extraction for assigned documents
3. **Author** — Write full ≥900-line document with ≥20 formulas, ≥15 cross-refs, ≥8 standards
4. **Chunk & Verify** — `write_large_file.py split → verify → manifest` (0 bytes diff reassembly)
5. **Compress** — `write_large_file.py compress` → `.md.gz` for storage
6. **Heuristic Intros** — `generate_heuristic_intros.sh` → 5 variants (Williams, Keymaker, El Segundo, Baker Street, Combined)
7. **Git Commit** — Chunks + compressed + intros, tag `runner-XXX-complete`, push
8. **Handoff** — Create `NEXT_runner_XXX+1.md`, update `RESUME_SESSION_MAGNETS.md`

### Phase Status

| Phase | Description | Documents | Status | Runner |
|-------|-------------|-----------|--------|--------|
| 1 | Foundation Research | DOC-01, DOC-02, DOC-03 | ✅ Complete | 001 |
| 2 Batch 1 | Brokerage Core | DOC-04, DOC-05, DOC-06 | ✅ Complete | 002/003 |
| 2 Batch 2 | Regulatory + Logistics | DOC-07, DOC-08 | 🔄 In Progress | 004/005 |
| 3 | Technical Specs | DOC-09..15 | ⏳ Pending | 003 |
| 4 | Regional Deep Dives | DOC-16..25 | ⏳ Pending | 004-006 |
| 5 | Community-Specific | DOC-26..35 | ⏳ Pending | 007-008 |
| 6 | Technology Transfer | DOC-36..45 | ⏳ Pending | 009-010 |
| 7 | Strategic Synthesis | DOC-46..60 | ⏳ Pending | 011 |
| 8 | Final Integration | Pipeline verification | ⏳ Pending | 012 |

### Quality Gates (Every Document)

- **Lines**: ≥900 (enforced by line count verification)
- **Formulas/Technical specs**: ≥20 (LaTeX/Unicode — e.g., $C_{royalty} = \max(ad\_valorem, operating\_margin)$)
- **Cross-references**: ≥15 (to Research/, other DOCs, Chilean law, ISO, IEC, ASTM, NIJ, MIL-STD, DOE, CFR)
- **Standards cited**: ≥8 (Chilean Mining Code, Law 19,300, Law 19,253, Law 21,210, ISO 28000, ISO 9001, MIL-STD-1540, CPTPP)
- **Conflation flags**: 0 (no overlapping/contradictory content across docs — DOC-14 audit)
- **TBD markers**: Documented as `[TBD:RESEARCH]` with source needed
- **Traceability Matrix**: Chapter 9 in every document (maps each claim to source)
- **Chunk reassembly**: 0 bytes diff (verified by `write_large_file.py verify`)
- **Manifest checksums**: PASS (SHA256 + size in `MANIFEST.json`)
- **Heuristic intros**: 5 variants generated per document

---

## Three-Pronged Heuristic Integration
This project employs the **Williams/Keymaker/El Segundo** triad plus **CSMOPP personalities**:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define what the system *is* and *why* it exists
- **Method**: 8-phase boundary analysis, 60-document component mapping, 7-trigger dependency graph
- **Output**: `AGENTS.md` conventions, `TODO.md` hierarchy, Phase/Doc mapping matrix
- **Applied Here**: Explicit project categorization (CSMWip), parent-child (CSMWip), phase gates

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define *how* the system is built and validated
- **Method**: Chapter-based authoring, manifest verification, CSMOPP translation, reproducible pipeline
- **Output**: `write_large_file.py` pipelines, `MANIFEST.json` per chunk dir, 5 heuristic intros per doc
- **Applied Here**: Chunk-based documents (replaces Pieces/), SHA256 verification, heuristic generation

### El Segundo Protocol — Operational Excellence

- **Purpose**: Define *how* the system runs and evolves
- **Method**: Runner-based sequential processing, heartbeat monitoring, 30s subtask granularity
- **Output**: `NEXT_runner_XXX.md`, `HEARTBEAT_MAGNETS.md`, `memory/YYYY-MM-DD.md`, `startup.sh`
- **Applied Here**: 120s heartbeat, 30s guard, auto-continue, single-command resume, git tags

### CSMOPP Personality Framework (5 Heuristics)

| Heuristic | Role | Voice | Applied In |
|-----------|------|-------|------------|
| **Williams** | Constraint → Necessity → Commitment | "The lock, the key, the turn" — irreducible logic | Every document structure |
| **Keymaker** | Lock → Key → Turn (both directions) | Empirical lock, mathematical key, bidirectional validation | Chunk pipeline, manifest |
| **El Segundo** | Mirror → Participation → Protocol | Recursive self-measurement, witness, operational recursion | Runner workflow, heartbeat |
| **Baker Street** | Precision → Evidence → Deduction | Forensic detail, sourced claims, zero ambiguity | Traceability matrices, citations |
| **SHIELD** | Calm → Resilience → Continuity | Strategic posture, no panic, long horizon | Session resume, contingency |

These heuristics are NOT revealed in output. They shape each document's internal logic, structure, and tone — producing "industry-specific terms, above pay-grade understanding, above education-level strong documents" that read as authoritative brokerage intelligence.

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo | CSMOPP (5) |
|-------|----------|----------|------------|------------|
| Design | 8 phases, 60 docs | Chapter architecture | 12 runners | Personality assignment |
| Build | Doc categories | 540 chunks + 300 intros | 30s guard, 120s beat | 5 variants per doc |
| Test | Cross-ref matrices | SHA256 manifests | Heartbeat monitor | Conflation audit (DOC-14) |
| Deploy | Publication targets | Compressed .md.gz | Git tags per runner | Heuristic translation |
| Evolve | New phases/docs | Migration to chunks | Session resume | Personality refinement |

---

## Roadmap & Future Work
### Immediate (Next 1-2 Sessions)

- [ ] **Complete DOC-08 authoring** — Port & Logistics Corridors (research complete, 9 chapters)
- [ ] **Chunk & verify DOC-08** — `write_large_file.py split/verify/manifest chunks/DOC-08`
- [ ] **Compress DOC-08** — `write_large_file.py compress FinishedWork/DOC-08_Port_Logistics_Corridors.md`
- [ ] **Generate heuristic intros for DOC-08** — `./scripts/generate_heuristic_intros.sh`
- [ ] **Git commit + tag runner-005-complete** — Push chunks, compressed, intros
- [ ] **Create NEXT_runner_006.md** — Handoff for DOC-09 through DOC-12

### Short Term (Next 5 Sessions / Runner 003)

- [ ] **DOC-09**: Rare Earth & Critical Mineral Specifications (NdFeB N35-N52, SmCo 1:5/2:17, Fe₁₆N₂ 27 MGOe, MnBi 14 MGOe, REE oxide purity)
- [ ] **DOC-10**: Magnet Manufacturing Supply Chain (Mine → Aegis-Forge → Magnet Chile → Port → CSM)
- [ ] **DOC-11**: Geomagnetic Risk & Infrastructure Hardening (Carrington-class protection for Chilean grid)
- [ ] **DOC-12**: Financial Instruments (Offtake agreements, streaming, royalties, EIB/CPTPP/IRA 45X capital stack)
- [ ] **DOC-13**: CSMOPP Heuristic Personalities (Document the 5 personalities as translation layer)
- [ ] **DOC-14**: Document Conflation Audit (Cross-document conflict detection)
- [ ] **DOC-15**: Session Resume Framework (Elegant continuity for 60-doc pipeline)

### Long Term (Ongoing / Runners 004-012)

- [ ] **Phase 4**: Regional Deep Dives (DOC-16..25) — Norte Grande, Norte Chico, Zona Central, Sur, Austral
- [ ] **Phase 5**: Mineral-Specific (DOC-26..35) — Nd, Dy, Tb, Sm, Co, FeN, Cu-Au-Fe oxide
- [ ] **Phase 5**: Community-Specific (DOC-36..45) — Indigenous territories, mining towns, port cities, academic centers
- [ ] **Phase 6**: Technology Transfer (DOC-46..55) — Aegis-Forge separation, REE-free scaling, recycling, grid hardening
- [ ] **Phase 7**: Strategic Synthesis (DOC-56..60) — Steering the current, broker-to-owner, venture scaling
- [ ] **Phase 8**: Final Integration — Full pipeline verification, master index, handoff to operations
- [ ] **Archive** completed phases to `FinishedWork/` with compression
- [ ] **Maintain** document currency with quarterly reviews
- [ ] **Integrate** with parent project (CSMWip) workflows and cross-project synthesis

---

## Appendix — Quick Reference
### Key Commands

```bash
# Session startup (ONE COMMAND)
cd CSMWip/CSMMinesMagnets
bash startup.sh

# Manual resume
cat NEXT_runner_005.md
cat RESUME_SESSION_MAGNETS.md
git status
cat HEARTBEAT_MAGNETS.md

# Start heartbeat monitor (background)
python3 scripts/heartbeat_monitor.py --interval 120 --project-root . &

# Document operations (write_large_file.py)
python3 ../../__Python_Tools/write_large_file.py split \
    FinishedWork/DOC-XX_*.md \
    chunks/DOC-XX chapter .md
python3 ../../__Python_Tools/write_large_file.py verify chunks/DOC-XX
python3 ../../__Python_Tools/write_large_file.py manifest chunks/DOC-XX
python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/DOC-XX_*.md
python3 ../../__Python_Tools/write_large_file.py concat chunks/DOC-XX FinishedWork/DOC-XX_reassembled.md

# Heuristic intros
./scripts/generate_heuristic_intros.sh FinishedWork/DOC-XX_*.md

# Git workflow
git add chunks/DOC-XX/ FinishedWork/DOC-XX_*.md.gz FinishedWork/intros/DOC-XX_*.md
git commit -m "runnerXXX: DOC-XX complete - chunked, verified, compressed, intros"
git tag runner-XXX-complete
git push origin --tags
```

### File Locations

- **Project Root**: `CSMWip/CSMMinesMagnets`
- **Chunks**: `CSMWip/CSMMinesMagnets/chunks/`
- **Manifest**: `CSMWip/CSMMinesMagnets/chunks/DOC-XX/MANIFEST.json`
- **Finished Work**: `CSMWip/CSMMinesMagnets/FinishedWork/`
- **Heuristic Intros**: `CSMWip/CSMMinesMagnets/FinishedWork/intros/`
- **Memory Logs**: `CSMWip/CSMMinesMagnets/memory/`
- **Runner Files**: `CSMWip/CSMMinesMagnets/NEXT_runner_*.md`
- **Research Assets**: `CSMWip/CSMMinesMagnets/Research/`
- **Framework Docs**: `CSMWip/CSMMinesMagnets/Framework/`
- **Scripts**: `CSMWip/CSMMinesMagnets/scripts/`

### Project Statistics

- **Total Files**: 122
- **File Types**: .md: 147, .py: 11, .json: 11, .gz: 10, .sh: 2, .log: 1
- **Languages**: Markdown: 147, Python: 11, JSON: 11, Shell: 2
- **Key Directories**: 7 (Framework, Research, chunks, FinishedWork, Logs, scripts, Pieces)
- **Documents Complete**: 6/60 (DOC-01 through DOC-06)
- **Documents In Progress**: 2/60 (DOC-07 complete, DOC-08 authoring)
- **Total Content (compressed)**: ~200 KB across 7 .md.gz files
- **Total Content (uncompressed DOC-08)**: ~98 KB authoring
- **Heuristic Intros Generated**: 35 (5 variants × 7 documents)

### Related Projects

- **Parent**: CSMWip (`CSMWip`)
- **Category Peers**: Other CSMWip subprojects (01_SubAtomic, 02_Caldera, 05_BOUNCE, 10_Prime, 11_TGApp, 12_AegisOutfitFabricator)
- **Research Dependencies**:
  - `CSMReach/CSMEval/25-Rare-Earth-Critical-Minerals-Mining-and-Magnet-Industry/` — Industry landscape
  - `CSMReach/CSMGeneralOutreach-Global/CSMGlobal-037-Chile/` — Grid vulnerability, mining exposure
  - `CSMReach/CSMEmailOutgoing/July2026/BATCH-16-Untapped-Sectors/E172-NationalMining.md` — Aegis-Forge specs
  - `CSMPro/CSMMag/CSMMagTech2026/` — Fe₁₆N₂ 27 MGOe, MnBi 14 MGOe, EU CRMA 2024, CSM portfolio
  - `CSMPro/CSMMag/CSMMagEco2026/` — 12+ US magnet startups, DFARS 2027, recycling 12t/mo
  - `CSMFAB/CSMFAB0108/` — Aegis-Forge thermal cascade separator (referenced)

---

*README generated for CSMMinesMagnets — Part of Another Project*
*Category: CSMWip | Files: 122 | Parent: CSMWip*
*Generated using write_large_file.py IncrementalDocumentWriter*