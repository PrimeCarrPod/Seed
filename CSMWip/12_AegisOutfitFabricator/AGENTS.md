# AGENTS.md — CSMWip/12_AegisOutfitFabricator

## Project: Aegis Outfit Fabricator — Renaissance Textile Engineering Specifications

**Type**: Documentation/specification project — large markdown documents, historical research, engineering specs
**Output**: Unified specification documents (DOC-01 through DOC-15, MAT-01 through MAT-04, SYNTH-01 through SYNTH-03, DRAFT-01 through DRAFT-05)
**Workflow**: Runner-based sequential processing (NEXT_RUNNER_001 → NEXT_RUNNER_013+)

## Project Structure
```
12_AegisOutfitFabricator/
├── AGENTS.md                    # This file
├── memory/                      # Daily session logs
├── TODO.md                      # Hierarchical task list (200+ subtasks)
├── NEXT_runner_013.md           # Next runner instructions
├── RESUME_SESSION_AEGIS.md      # Session resume context
├── HEARTBEAT_AEGIS.md           # 2-minute heartbeat config
├── chunks/                      # Logical document chunks (replaces Pieces/)
├── Framework/                   # Core framework documents
├── Research/                    # Research inputs
├── Logs/                        # Processing logs
├── scripts/                     # Project-specific scripts
├── Pieces/                      # Legacy 17-piece fragmentation (migrate to chunks/)
└── FinishedWork/                # Completed full documents
```

## Document Categories

### Core Specifications (DOC-01 to DOC-15)
| Doc | Title | Size | Status |
|-----|-------|------|--------|
| DOC-01 | Executive System Architecture | 611K | Fragmented (17 pieces) |
| DOC-02 | Historical Context & Design Philosophy | 326K | Fragmented (17 pieces) |
| DOC-03 | Material Systems Integration | 15.8K | Fragmented (17 pieces) |
| DOC-04 | Geometric Pattern System | 13.4K | Fragmented (17 pieces) |
| DOC-05 | Structural Framework Specification | 12.9K | Fragmented (17 pieces) |
| DOC-06 | Protective Layer Architecture | 15.7K | Fragmented (17 pieces) |
| DOC-07 | Textile Engineering Specification | 13.4K | Fragmented (17 pieces) |
| DOC-08 | Manufacturing Process Plan | 12K | Fragmented (17 pieces) |
| DOC-09 | Quality Assurance Testing Protocol | 15.5K | Fragmented (17 pieces) |
| DOC-10 | Deployment Operational Procedures | 18.3K | Fragmented (17 pieces) |
| DOC-11 | RenaissanceMan TS Specification | 197K | Fragmented (17 pieces) |
| DOC-12 | RenaissanceMan TG Specification | 207K | Fragmented (17 pieces) |
| DOC-13 | RenaissanceMan SS Specification | 131K | Fragmented (17 pieces) |
| DOC-14 | RenaissanceMan SG Specification | ~150K | Fragmented (17 pieces) |
| DOC-15 | RenaissanceWoMan TS Specification | ~150K | Fragmented (17 pieces) |

### Material Specifications (MAT-01 to MAT-04)
| Doc | Title | Size | Status |
|-----|-------|------|--------|
| MAT-01 | Silk Fibroin Engineering Spec | 11K | Fragmented (11 pieces) |
| MAT-02 | Structural Foundation Materials | 11.4K | Fragmented (11 pieces) |
| MAT-03 | Protective Layer Integration | 14.1K | Fragmented (13 pieces) |
| MAT-04 | Cross Property Validation Matrix | 12.7K | Fragmented (12 pieces) |

### Synthesis Documents (SYNTH-01 to SYNTH-03)
| Doc | Title | Size | Status |
|-----|-------|------|--------|
| SYNTH-01 | Unified Historical Modern Textile Engineering Theory | 16K | Fragmented (13 pieces) |
| SYNTH-02 | Protective Layer Adaptation AIMES to Renaissance | 19K | Fragmented (17 pieces) |
| SYNTH-03 | Geometric Drafting Kernel Specification | 16.3K | Fragmented (17 pieces) |

### Draft Kernels (DRAFT-01 to DRAFT-05)
| Doc | Title | Size | Status |
|-----|-------|------|--------|
| DRAFT-01 | Alcega Developable Surface Engine | 10.5K | Fragmented (12 pieces) |
| DRAFT-02 | Garsault Proportional Scaling System | 10.7K | Fragmented (12 pieces) |
| DRAFT-03 | Pleating Kernel | 9.1K | Fragmented (11 pieces) |
| DRAFT-04 | Farthingale Pannier Hoop Architecture | 10.5K | Fragmented (13 pieces) |
| DRAFT-05 | Zero Waste Nesting Optimizer | 9.9K | Fragmented (11 pieces) |

### Runner Files
- NEXT_RUNNER_001 through NEXT_RUNNER_012 (in FinishedWork/)
- NEXT_RUNNER_002 is 691K (largest runner file)
- Each runner also fragmented into pieces

## Large File Strategy (Replaces 17-Piece Fragmentation)

**DO NOT** create 17-piece fragments. Use `__Python_Tools/write_large_file.py`:

```bash
# Split large document into logical chapters
python3 ../../__Python_Tools/write_large_file.py split \
    FinishedWork/DOC-01_Executive_System_Architecture.md \
    chunks/DOC-01 \
    chapter .md

# Compress for storage
python3 ../../__Python_Tools/write_large_file.py compress \
    FinishedWork/DOC-01_Executive_System_Architecture.md

# Generate manifest with checksums
python3 ../../__Python_Tools/write_large_file.py manifest chunks/DOC-01

# Verify integrity
python3 ../../__Python_Tools/write_large_file.py verify chunks/DOC-01

# Reassemble at publish time
python3 ../../__Python_Tools/write_large_file.py concat chunks/DOC-01 FinishedWork/DOC-01_Executive_System_Architecture.md
```

## Runner Workflow

Each runner processes a batch of documents:
1. **Read** current runner file (NEXT_RUNNER_XXX.md)
2. **Process** assigned documents (split → edit → reassemble)
3. **Write** output to FinishedWork/
4. **Create** next runner (NEXT_RUNNER_XXX+1.md)
5. **Update** TODO.md with completed subtasks
6. **Log** progress to memory/YYYY-MM-DD.md

## Heartbeat Requirements
- **Update interval**: ≤ 2 minutes (120 seconds)
- **Timeout guard**: ≤ 30 seconds per subtask
- **Auto-continue**: No blocking waits; queue next subtask immediately
- **Terminal output**: Print progress every subtask completion

## Session Resume Protocol
```bash
cd /workspace/app/CSMWip/12_AegisOutfitFabricator
cat NEXT_runner_013.md
cat RESUME_SESSION_AEGIS.md
git status
# Check heartbeat
cat HEARTBEAT_AEGIS.md
```

## Key Commands
```bash
# Migrate pieces to chunks (one-time)
python3 ../../__Python_Tools/write_large_file.py migrate Pieces/ chunks/

# Process next document batch
python3 scripts/process_batch.py --runner 13

# Heartbeat monitor (run in background)
python3 scripts/heartbeat_monitor.py --interval 120

# Verify all chunks
python3 ../../__Python_Tools/write_large_file.py verify-all chunks/
```

## Conventions
- **Chunk naming**: `chunks/<DOC-ID>/chapter_XX_<title>.md`
- **Manifest**: `chunks/<DOC-ID>/MANIFEST.json` (SHA256 + size)
- **Runner naming**: `NEXT_runner_XXX.md` (3-digit, matches NEXT_RUNNER_XXX)
- **Memory logs**: `memory/YYYY-MM-DD.md` (raw), folded into project MEMORY.md
- **No 17-piece splits** — use logical chapter chunks instead