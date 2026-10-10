/workspace/app/CSMWip/12_AegisOutfitFabricator/
├── Framework/                    # All scripts, configs, documentation
│   ├── MASTER_TODO_A.md         # Phase 0-3: Foundation, Research, Materials, Geometry
│   ├── MASTER_TODO_B.md         # Phase 4-6: 150 Document Production Pipeline
│   ├── MASTER_TODO_C.md         # Phase 7-10: GitHub, Quality, Delivery, Closure
│   ├── heartbeat.sh             # Session progress logging (executable)
│   ├── RESUME_SESSION.md        # Session restoration guide
│   ├── NEXT_RUNNER_001.md       # Next session task breakdown (13 pieces)
│   ├── README.md                # This document
│   ├── check_doc_quality.sh     # Document quality gate script
│   ├── verify_github_17ways.sh  # 17-way GitHub verification script
│   ├── verify_reassembly.sh     # Piece reassembly verification
│   ├── process_document.sh      # Complete document pipeline script
│   └── csmlogs/                 # Session logs (auto-generated)
├── Logs/                         # Project logs
│   ├── heartbeat.log            # Continuous heartbeat log
│   └── csmlogs/                 # Session logs
├── Pieces/                       # Document pieces (13 per doc)
│   ├── *_piece_01.md ... *_piece_13.md
│   ├── *_manifest.json
│   └── *_pieces.zip
├── FinishedWork/                 # Clean reassembled documents (150)
│   ├── DOC_01.md ... DOC_50.md
│   ├── FAB-RM-01.md ... FAB-RM-25.md
│   ├── IMG-RM-01.md ... IMG-RM-05.md
│   ├── FAB-RW-01.md ... FAB-RW-25.md
│   ├── IMG-RW-01.md ... IMG-RW-05.md
│   ├── SYNTH-01.md ... SYNTH-03.md
│   ├── MAT-01.md ... MAT-04.md
│   └── DRAFT-01.md ... DRAFT-05.md
├── Research/                     # Seed research documents
│   ├── Historical Dress Construction Analysis.md
│   └── Advanced Textile Stitching and Automation.md
├── CSMFAB001_Aegis_RenaissanceMan/    # RenaissanceMan fabrication workspace
└── CSMFAB002_Aegis_RenaissanceWoMan/  # RenaissanceWoMan fabrication workspace
```

## 6.2 Core Scripts

### 6.2.1 heartbeat.sh
**Purpose**: Continuous session progress logging
**Usage**: `./Framework/heartbeat.sh "Optional note"`
**Logs to**: `Logs/heartbeat.log` + `Logs/csmlogs/session_YYYYMMDD_HHMMSS.md`
**Captures**: Git status, document pipeline counts, framework file presence, research/CSMFAB078 availability

### 6.2.2 RESUME_SESSION.md
**Purpose**: Complete session restoration guide
**Contains**: Environment verification, project structure, required pre-reading, session commands, troubleshooting, escalation criteria

### 6.2.3 NEXT_RUNNER_001.md (13 pieces)
**Purpose**: Next session immediate execution plan
**Parts**: A (Bootstrap), B (Research Extraction), C (Quality Gates + Roadmap)
**Split**: 13 pieces × ~100 lines each + manifest + zip

### 6.2.4 check_doc_quality.sh
**Purpose**: Automated quality gate for every document
**Gates**: 
- Lines ≥ 300
- Formulas ≥ 15 (LaTeX/Unicode)
- Cross-refs ≥ 10 (Research/ + CSMFAB078)
- Standards ≥ 5 (CIETA, ASTM, NIJ, NFPA, MIL-STD, ISO, IEC)
- Conflation = 0 (no medieval/Victorian/Edwardian in Renaissance docs)
- Traceability matrix present

### 6.2.5 verify_github_17ways.sh
**Purpose**: Comprehensive GitHub presence verification
**Methods**: 17 independent verification techniques (see Section 5.4)
**Sample**: Run on first piece of each document

### 6.2.6 verify_reassembly.sh
**Purpose**: Ensure piece reassembly produces byte-identical document
**Check**: `diff original reassembled` = 0 bytes

### 6.2.7 process_document.sh
**Purpose**: End-to-end document pipeline automation
**Sequence**: Quality → Split → Zip → Push → Verify Reassembly → 17-way Check → Heartbeat

## 6.3 GitHub Handler Integration

**Location**: `/workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh`
**Modules**: 
- `03a_github_handler_core.sh` — Config, difficulty assessment, logging, split/join
- `03b_github_handler_strategies.sh` — 13 strategies + main save function

**Key Functions**:
- `gh_init()` — Initialize .github_handler/ directory structure
- `gh_assess_difficulty(file)` — Returns: easy/medium/hard/extreme
- `gh_split_file(file, max_lines)` — Splits into pieces + manifest
- `gh_join_files(manifest, output)` — Reassembles from pieces
- `gh_save_file(file, msg, branch)` — Tries strategies 1-N until success
- `gh_process_queue()` — Processes manual merge queue

**Log Files** (in `.github_handler/`):
- `difficulty_log.json` — Per-file difficulty, line count, strategy count
- `methods_log.json` — Per-strategy success/failure history
