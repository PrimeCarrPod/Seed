# NEXT_runner_013 — AegisOutfitFabricator

## Continuation from NEXT_RUNNER_012

**Project**: AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Branch**: `kilo/aegis-outfit-fabricator-wip` (tracking origin/main)  
**Created**: 2026-10-14  
**Status**: Runner 013 — Phase 4 Batch 2 (DOC-13 through DOC-20) + Migration to Chunks

---

## 📍 CURRENT PROJECT STATE (as of 2026-10-14)

### ✅ COMPLETE — Phase 4 Batch 1 (Core Documents 01-12)
All 12 documents complete in FinishedWork/ with quality gates passed:
- DOC-01 through DOC-10: Core system specifications
- DOC-11: RenaissanceMan-TS Specification
- DOC-12: RenaissanceMan-TG Specification

### 🔄 IMMEDIATE NEXT — Phase 4 Batch 2 (DOC-13 through DOC-20)
| Doc | Title | Edition | Status |
|-----|-------|---------|--------|
| **DOC-13** | RenaissanceMan-SS Specification | RM-SS (H=165, C=880, W=720, 13.73kg) | **RUNNER 013 PRIORITY 1** |
| **DOC-14** | RenaissanceMan-SG Specification | RM-SG (H=165, C=1150, W=1050, 17.21kg) | **RUNNER 013 PRIORITY 2** |
| **DOC-15** | RenaissanceWoMan-TS Specification | RW-TS (H=175, B=920, W=650, H_p=950, 16.00kg) | **RUNNER 013 PRIORITY 3** |
| **DOC-16** | RenaissanceWoMan-TG Specification | RW-TG (H=175, B=1150, W=1000, H_p=1200, 20.13kg) | **RUNNER 013 PRIORITY 4** |
| **DOC-17** | RenaissanceWoMan-SS Specification | RW-SS (H=155, B=820, W=600, H_p=850, 13.22kg) | **RUNNER 013 PRIORITY 5** |
| **DOC-18** | RenaissanceWoMan-SG Specification | RW-SG (H=155, B=1050, W=950, H_p=1150, 16.78kg) | **RUNNER 013 PRIORITY 6** |
| **DOC-19** | Cross-Edition Compatibility Matrix | All 8 editions | **RUNNER 013 PRIORITY 7** |
| **DOC-20** | Edition Delta Tables (Historical Alteration) | All 28 transitions | **RUNNER 013 PRIORITY 8** |

### 🔧 INFRASTRUCTURE TASKS (Parallel with Batch 2)
| Task | Status |
|------|--------|
| Migrate Pieces/ → chunks/ (all 23 documents) | **RUNNER 013 INFRA 1** |
| Create heartbeat monitor (120s interval) | **RUNNER 013 INFRA 2** |
| Create task timer (30s guard) | **RUNNER 013 INFRA 3** |
| Verify write_large_file.py pipeline | **RUNNER 013 INFRA 4** |
| Update all manifests & master index | **RUNNER 013 INFRA 5** |

---

## 🚀 EXECUTION STRATEGY — CHUNK-BASED PIPELINE (Replaces 17-Piece)

### New Pipeline Per Document
```bash
# 1. Author full document (≥300 lines, ≥15 formulas, ≥10 refs, ≥5 standards, 0 conflation)
# 2. Split into LOGICAL CHAPTERS (not 17 arbitrary pieces):
#    python3 ../../__Python_Tools/write_large_file.py split \
#        FinishedWork/DOC-XX_*.md chunks/DOC-XX chapter .md
# 3. Verify: python3 ../../__Python_Tools/write_large_file.py verify chunks/DOC-XX
# 4. Compress: python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/DOC-XX_*.md
# 5. Log: heartbeat.sh "Completed DOC-XX"
# 6. Git: commit chunks + compressed FinishedWork
```

### Session Structure (Adapted for 2-min Heartbeat)
- **Station**: Author 1 document (target 45-60 min)
- **Coupling**: Split → Verify → Compress → Commit (5 min)
- **Heartbeat**: Terminal progress update every 120 seconds
- **Subtask Guard**: 30 seconds max — auto-split if exceeded
- **Auto-continue**: Queue next subtask immediately, no blocking
- **Velocity Target**: ≥0.8 docs/hour (faster than 17-piece)

---

## 🎯 IMMEDIATE RESUMPTION COMMANDS

```bash
# 1. Enter project
cd /workspace/app/CSMWip/12_AegisOutfitFabricator

# 2. Read context
cat NEXT_runner_013.md
cat RESUME_SESSION_AEGIS.md
git status

# 3. Configure environment
export PYTHONPATH=/workspace/app/__Python_Tools:$PYTHONPATH

# 4. Start heartbeat monitor (background)
python3 scripts/heartbeat_monitor.py --interval 120 &
HEARTBEAT_PID=$!

# 5. Verify write_large_file.py works
python3 ../../__Python_Tools/write_large_file.py --help

# 6. Begin infrastructure: Migrate Pieces → Chunks
python3 scripts/migrate_pieces.py --source Pieces --target chunks

# 7. Begin DOC-13 (RenaissanceMan-SS Specification)
# Target: H=165cm, C=880mm, W=720mm, 13.73kg
# Primary tiles: 150 × 25mm | Backup tiles: 75 × 15mm
# Dependencies: CSMFAB078-A §3.1, DOC-01..12, DRAFT-01..05, MAT-01..04, SYNTH-01
```

---

## 📋 QUALITY GATES — EVERY DOCUMENT MUST PASS

| Gate | Target | Verification |
|------|--------|--------------|
| Lines | ≥300 | `wc -l` |
| Formulas (LaTeX/Unicode) | ≥15 | `grep -c '\$\\|\\['` |
| Cross-references | ≥10 | `grep -c 'Research\|SYNTH\|MAT\|DRAFT\|CSMFAB078'` |
| Standards cited | ≥5 | `grep -ci 'CIETA\|ASTM\|NIJ\|NFPA\|MIL-STD\|ISO\|IEC'` |
| Conflation flags | 0 | `grep -ic 'medieval\|victorian\|edwardian\|regency\|rococo\|neoclassical\|empire\|19c\|20c\|pre-1600'` |
| TBD markers | Documented | `grep -c 'TBD:RESEARCH'` |
| Traceability Matrix | Present | `grep -c 'Traceability Matrix'` |
| Chunk reassembly diff | 0 bytes | `python3 ../../__Python_Tools/write_large_file.py concat chunks/DOC-XX /tmp/test.md && diff FinishedWork/DOC-XX_*.md /tmp/test.md` |
| Manifest checksums | PASS | `python3 ../../__Python_Tools/write_large_file.py verify chunks/DOC-XX` |

---

## 📚 KEY REFERENCE DOCUMENTS (Always Available)

| Document | Path | Purpose |
|----------|------|---------|
| CSMFAB078 Main | `/workspace/app/CSMFAB/CSMFAB078_AegisIronMan/CSMFAB078 Aegis Iron Man Adaptive Exosuit Fabrication Plan.md` | Master threat matrix, LES, 12-layer stack |
| CSMFAB078-A | `.../CSMFAB078-A Leaf Edition Mechanical Specification.md` | 8 editions, 12 zones, morphology params |
| CSMFAB078-B | `.../CSMFAB078-B Threat Protection Validation.md` | Ballistic, thermal, EMI, blast scaling |
| Research Doc 1 | `Research/Historical Dress Construction Analysis.md` | Alcega, Garsault, CIETA, baleen, cartridge pleating |
| Research Doc 2 | `Research/Advanced Textile Stitching and Automation.md` | ISO 4915 stitch mapping, Sewbo/KSL/TFP, ultrasonic/RF |
| SYNTH-01 | `FinishedWork/SYNTH-01_Unified_Historical_Modern_Textile_Engineering_Theory.md` | Unified textile theory |
| MAT-01..04 | `FinishedWork/MAT-0*_*.md` | Material specifications |
| DRAFT-01..05 | `FinishedWork/DRAFT-0*_*.md` | Geometric drafting kernels |
| MASTER_TODO_B.md | `Framework/MASTER_TODO_B.md` | Complete 150-doc pipeline |

---

## 🔄 HANDOFF PROTOCOL — RUNNER 013 END

At session end, create NEXT_runner_014.md:
```bash
cat > NEXT_runner_014.md << 'EOF'
# NEXT_runner_014 — AegisOutfitFabricator
## Continuation from Runner 013

### Completed in Runner 013
- [ ] DOC-13 through DOC-20: Authored, chunked, verified, compressed
- [ ] Pieces/ → chunks/ migration: Complete for all 23 documents
- [ ] Heartbeat monitor: Operational (120s interval)
- [ ] Task timer: Operational (30s guard)
- [ ] All manifests: Generated and verified

### Next Priority (Runner 014)
1. DOC-21: Ballistic Protection — Ceramic-Gilded Tile + Auxetic Metamaterial
2. DOC-22: Thermal/Fire Protection — UHTC Ceramic + Aerogel + NIR Pigments
3. ... (Phase 4 Batch 3: DOC-21..30)

### Infrastructure Status
- chunks/ directory: Populated with all 23 documents
- FinishedWork/: Compressed (.gz) originals
- Pieces/: Archived (read-only)
- Git: All changes committed, tagged runner-013-complete
EOF
```

---

## ⚡ GOLDEN RULES (Updated for Runner 013)

1. **NO CONFLATION** — Historical (1600-1700) vs Modern strictly separated
2. **NO GUESSING** — Every value sourced or [TBD:RESEARCH]
3. **MATHEMATICAL RIGOR** — SI units, LaTeX formulas, derivations shown
4. **TRACEABILITY** — Every spec traces to Research Doc 1, 2, or CSMFAB078
5. **LOGICAL CHUNKS** — Split by chapter/section, NOT 17 arbitrary pieces
6. **HEARTBEAT EVERY 2 MIN** — `python3 scripts/heartbeat_monitor.py --interval 120`
7. **SUBTASK ≤ 30 SEC** — Split further if exceeded
8. **VERIFY CHUNKS** — `write_large_file.py verify` = PASS
9. **AUTO-CONTINUE** — No blocking, queue next immediately
10. **COMMIT OFTEN** — After each document complete

---

## 📋 RUNNER 013 SUBTASK QUEUE (First 20)

| # | Subtask | Est. Time | Dependencies |
|---|---------|-----------|--------------|
| 1 | Migrate DOC-11 pieces → chunks/DOC-11 | 2 min | write_large_file.py |
| 2 | Migrate DOC-12 pieces → chunks/DOC-12 | 2 min | write_large_file.py |
| 3 | Migrate DOC-01 pieces → chunks/DOC-01 | 3 min | write_large_file.py |
| 4 | Migrate DOC-02 pieces → chunks/DOC-02 | 2 min | write_large_file.py |
| 5 | Migrate DOC-13 pieces → chunks/DOC-13 | 2 min | write_large_file.py |
| 6 | Migrate DOC-14 pieces → chunks/DOC-14 | 2 min | write_large_file.py |
| 7 | Migrate DOC-15 pieces → chunks/DOC-15 | 2 min | write_large_file.py |
| 8 | Migrate DOC-16 pieces → chunks/DOC-16 | 2 min | write_large_file.py |
| 9 | Migrate DOC-17 pieces → chunks/DOC-17 | 2 min | write_large_file.py |
| 10 | Migrate DOC-18 pieces → chunks/DOC-18 | 2 min | write_large_file.py |
| 11 | Migrate DOC-19 pieces → chunks/DOC-19 | 1 min | write_large_file.py |
| 12 | Migrate DOC-20 pieces → chunks/DOC-20 | 1 min | write_large_file.py |
| 13 | Migrate MAT-01..04 pieces → chunks/ | 2 min | write_large_file.py |
| 14 | Migrate SYNTH-01..03 pieces → chunks/ | 2 min | write_large_file.py |
| 15 | Migrate DRAFT-01..05 pieces → chunks/ | 2 min | write_large_file.py |
| 16 | Verify all chunk manifests | 3 min | write_large_file.py verify-all |
| 17 | Compress all FinishedWork/ originals | 2 min | write_large_file.py compress |
| 18 | Create master index: chunks/MASTER_INDEX.json | 1 min | Python script |
| 19 | Author DOC-13 RenaissanceMan-SS | 45 min | Research, CSMFAB078-A |
| 20 | Chunk & verify DOC-13 | 5 min | write_large_file.py |

---

**Worldline Status:** 🚂 Batch 1 complete (12/50) → Batch 2 loading (DOC-13 next) → Chunk pipeline active → Heartbeat monitoring → ∞  
**Electron Pulse:** Ready. One electron, logical chunks per document, 0 loss, 120s heartbeat.  
**Next Action:** Start migration script, then author DOC-13 RenaissanceMan-SS Specification.

---

*This NEXT_runner_013 supersedes NEXT_RUNNER_012. It adopts the new chunk-based workflow with 2-minute heartbeat and 30-second subtask guard. Execute immediately upon session start.*