# 9. QUALITY GATES & VERIFICATION

## 9.1 Document Quality Standards

Every document in the AegisOutfitFabricator project must meet these minimum standards:

### 9.1.1 Technical Depth Requirements
| Metric | Minimum | Target | Verification |
|--------|---------|--------|--------------|
| Line count | 300 | 400-600 | `wc -l` |
| Mathematical formulas | 15 | 25+ | `grep -c '\\$\\|\\\\['` |
| Cross-references | 10 | 20+ | `grep -c 'Research\\|CSMFAB078'` |
| Industry standards cited | 5 | 10+ | `grep -ci 'CIETA\\|ASTM\\|NIJ\\|NFPA\\|MIL-STD\\|ISO\\|IEC'` |
| Conflation flags | 0 | 0 | `grep -ic 'medieval\\|victorian\\|edwardian'` |

### 9.1.2 Content Integrity Rules
- **No Conflation**: Historical (1600-1700 Renaissance) ≠ Modern — clearly delineated in every document
- **No Guessing**: Every numerical value sourced or calculated; unknowns marked `[TBD:RESEARCH]`
- **Mathematical Rigor**: All formulas in LaTeX/Unicode, SI units, derivations shown
- **Traceability**: Every specification traces to Research Doc 1, Research Doc 2, or CSMFAB078
- **Terminology**: CIETA, ASTM, NIJ, NFPA, MIL-STD, ISO, IEC standards properly cited

### 9.1.3 Forensic Cleanliness (FinishedWork/)
Final reassembled documents must show **zero fabrication artifacts**:
- No "Piece X of Y" markers
- No "---" section separators from piece boundaries
- No duplicate headers from piece joins
- Continuous line numbering
- Single cohesive narrative voice
- Embedded metadata: generation seed, document ID, timestamp, spec hash

## 9.2 Automated Quality Checks

### 9.2.1 Per-Document Checks (check_doc_quality.sh)
```bash
./Framework/check_doc_quality.sh FinishedWork/DOC_XX.md
```
**Gates**: All 6 criteria must PASS for document to be accepted.

### 9.2.2 Per-Session Checks
- **Pre-session**: `./Framework/heartbeat.sh` + `verify_environment()` from RESUME_SESSION.md
- **Mid-session**: Heartbeat every 30 minutes minimum
- **Post-session**: Session log creation, commit all changes, push to GitHub

### 9.2.3 Pipeline Checks (process_document.sh)
1. Quality check → 2. Split → 3. Zip → 4. Push → 5. Verify reassembly → 6. 17-way GitHub check → 7. Heartbeat

## 9.3 Verification Protocols

### 9.3.1 Reassembly Verification (verify_reassembly.sh)
```bash
./Framework/verify_reassembly.sh FinishedWork/DOC_XX.md Pieces/DOC_XX_manifest.json
```
**Pass Criteria**: `diff` output = empty (0 bytes difference)

### 9.3.2 17-Way GitHub Verification (verify_github_17ways.sh)
```bash
./Framework/verify_github_17ways.sh Pieces/DOC_XX_piece_01.md
```
**Pass Criteria**: All 17 methods return success (1 manual = auto-pass)

### 9.3.3 Cross-Reference Integrity
- Build dependency graph across all 150 documents
- Verify no broken references
- Validate terminology consistency (automated scan)
- Mathematical consistency: unit analysis, dimensional analysis

## 9.4 Quality Metrics Targets

| Metric | Target | Measurement |
|--------|--------|-------------|
| Document quality pass rate | 100% | All 150 docs pass check_doc_quality.sh |
| Reassembly perfection | 100% | All 150 docs: diff = 0 bytes |
| GitHub verification pass rate | 100% | 1,950 pieces × 17 ways = 33,150 checks |
| Cross-reference integrity | 100% | Zero broken links in dependency graph |
| Terminology consistency | 100% | Standardized terms across all docs |
| Mathematical consistency | 100% | Unit/dimensional analysis clean |
| Historical accuracy audit | Pass | Expert review vs Research Doc 1 |
| Protection efficacy audit | Pass | Expert review vs CSMFAB078 transfer |

---

# 10. GITHUB INTEGRATION

## 10.1 Branch Strategy

**Working Branch**: `kilo/aegis-outfit-fabricator-wip`
**Base Branch**: `main` (or `master`)
**Remote**: `origin` (GitHub: PrimeCarrPod/Seed)

### 10.1.1 Branch Lifecycle
```bash
# Create branch
git checkout -b kilo/aegis-outfit-fabricator-wip main

# Push with upstream tracking
git push -u origin kilo/aegis-outfit-fabricator-wip

# Verify tracking
git branch -vv | grep kilo/aegis-outfit-fabricator-wip
```

### 10.1.2 Milestone Tags
| Tag | Milestone | Criteria |
|-----|-----------|----------|
| `v0.1-foundation` | Framework complete | All 7 framework files + dirs |
| `v0.2-research` | Synthesis complete | SYNTH-01,02,03 + MAT-01-04 |
| `v0.3-drafting` | Drafting kernel complete | DRAFT-01 through DRAFT-05 |
| `v0.4-core50` | Core 50 docs complete | DOC-01 through DOC-50 |
| `v0.5-rm50` | RenaissanceMan 50 complete | FAB-RM-01-25 + IMG-RM-01-05 |
| `v0.6-rw50` | RenaissanceWoMan 50 complete | FAB-RW-01-25 + IMG-RW-01-05 |
| `v1.0-complete` | All 150 docs + verified | Full delivery package |

## 10.2 Push Protocol

### 10.2.1 Framework First
```bash
# Push all framework files first
for f in Framework/MASTER_TODO_A.md Framework/MASTER_TODO_B.md Framework/MASTER_TODO_C.md \
         Framework/heartbeat.sh Framework/RESUME_SESSION.md Framework/NEXT_RUNNER_001.md \
         Framework/README.md; do
  gh_save_file "$f" "Framework: $(basename $f)" "kilo/aegis-outfit-fabricator-wip"
done
```

### 10.2.2 Document Batches
Push documents in batches of 10 — verify each batch completely before next batch.

### 10.2.3 Research Documents (Read-Only)
Research docs are reference only — not modified, but pushed for completeness.

## 10.3 GitHub Handler Configuration

**Script**: `/workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh`
**Log Directory**: `.github_handler/`
**Key Files**:
- `difficulty_log.json` — Per-file difficulty assessment
- `methods_log.json` — Strategy success/failure history
- `merge_queue.json` — Manual intervention queue
- `splits/` — Temporary split files

### 10.3.2 Difficulty Thresholds
| Difficulty | Lines | Strategies |
|------------|-------|------------|
| Easy | ≤100 | 3 (1-3) |
| Medium | ≤500 | 6 (1-6) |
| Hard | ≤2000 | 9 (1-9) |
| Extreme | >2000 | 13 (1-13) + auto-split |

### 10.3.3 Auto-Split Trigger
Files > 2000 lines (HARD_THRESHOLD) are automatically split into 500-line pieces before push.

## 10.4 Verification Automation

### 10.4.1 17-Way Verification Script
Created at `Framework/verify_github_17ways.sh` — runs all 17 verification methods.

### 10.4.2 Verification Logging
All verification results logged to `.github_handler/verification_log.json`:
```json
{
  "file": "Pieces/DOC_XX_piece_01.md",
  "timestamp": "2026-10-10T06:07:32Z",
  "results": {"method_1": true, "method_2": true, ..., "method_17": true},
  "pass": 17,
  "fail": 0
}
```

### 10.4.3 Alert on Failure
ANY failed verification → STOP → Investigate → Do not proceed until resolved.

---

# 11. SESSION MANAGEMENT

## 11.1 Session Lifecycle

### 11.1.1 Session Start
```bash
cd /workspace/app/CSMWip/12_AegisOutfitFabricator
./Framework/heartbeat.sh "Session start - environment verification"
source /workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh
cat Framework/NEXT_RUNNER_XXX.md  # Read current runner
```

### 11.1.2 During Session
- Heartbeat every 30 minutes: `./Framework/heartbeat.sh "Progress note"`
- Commit frequently (atomic per document piece)
- Push after each document completion
- Log blockers immediately in session log

### 11.1.3 Session End
```bash
# Create session log
cat > Logs/csmlogs/session_$(date -u +%Y%m%d_%H%M%S).md << 'EOF'
# AegisOutfitFabricator Session Log - $(date -u)
## Context
- Branch: kilo/aegis-outfit-fabricator-wip
- Commit: $(git rev-parse --short HEAD)
- Duration: [START] to $(date -u)

## Work Completed
- [ ] Task 1: Description
- [ ] Task 2: Description

## Documents Advanced
- Authored: DOC_XX, DOC_YY
- Pieces pushed: DOC_XX_piece_01-13, DOC_YY_piece_01-13
- Verified: 17-way GitHub verification passed

## Blockers / Questions for Human
1. Question about...
2. Decision needed on...

## Next Session Priority
1. Next task from NEXT_RUNNER_XXX.md
2. ...

## Heartbeat Final Entry
$(./Framework/heartbeat.sh "Session end - log created")
EOF

# Commit and push
git add -A && git commit -m "Session log: $(date -u +%Y%m%d_%H%M%S)" && git push
```

## 11.2 Required Pre-Reading (Every Session)

1. **RESUME_SESSION.md** — This guide
2. **NEXT_RUNNER_XXX.md** — Exact next steps
3. **MASTER_TODO_A.md** — Phase 0-3 status
4. **Research/Historical Dress Construction Analysis.md**
5. **Research/Advanced Textile Stitching and Automation.md**
6. **CSMFAB078 Main Plan** — `/workspace/app/CSMFAB/CSMFAB078_AegisIronMan/CSMFAB078 Aegis Iron Man Adaptive Exosuit Fabrication Plan.md`
7. **CSMFAB078-A Leaf Edition** — Mechanical specification
8. **CSMFAB078-B Threat Protection** — Materials & tests
9. **CSMFAB078 Image Prompts** — Master Composition Guide
10. **GitHub Handler** — `/workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh`

## 11.3 Escalation Criteria

**STOP AND ASK HUMAN CONDUCTOR FOR:**
- Naming decisions (project names, edition names)
- Creative direction (image prompt era vernacular, toxic elements)
- Mathematical formula validation (historical/modern bridge)
- Scope changes (document count, edition count, protection level)
- GitHub strategy failures after 3+ attempts
- Priority conflicts between MASTER_TODO phases
- Any "above pay grade" technical decisions

**DO NOT GUESS** — Human conductor is co-creator. Interaction keeps session alive and ensures quality.

---

# 12. PROJECT ROADMAP

## 12.1 Phase Summary

| Phase | Sessions | Focus | Deliverables |
|-------|----------|-------|--------------|
| **0** | 001 | Foundation & Framework | 7 framework files, dirs, git branch |
| **1** | 001-002 | Research Synthesis | SYNTH-01,02,03 |
| **2** | 002-003 | Material Science Bridge | MAT-01,02,03,04 |
| **3** | 003-004 | Geometric Drafting Kernel | DRAFT-01 through DRAFT-05 |
| **4** | 004-008 | Core 50 Documents | DOC-01 through DOC-50 |
| **5** | 009 | RenaissanceMan 50 Docs | FAB-RM-01-25 + IMG-RM-01-05 |
| **6** | 010 | RenaissanceWoMan 50 Docs | FAB-RW-01-25 + IMG-RW-01-05 |
| **7** | 011 | GitHub Integration | 17-way verification on all pieces |
| **8-10** | 012 | Quality, Delivery, Closure | Final package, retrospective, handoff |

**Total Estimated Sessions**: 12

## 12.2 Session 001 Detailed Plan (Current)

| Time | Activity |
|------|----------|
| 0:00-0:30 | Environment verification, git setup, handler source |
| 0:30-2:30 | Deep read Research Doc 1 (Historical Dress) |
| 2:30-3:00 | Break / heartbeat |
| 3:00-5:00 | Deep read Research Doc 2 (Textile Automation) |
| 5:00-5:30 | Break / heartbeat |
| 5:30-7:30 | Write SYNTH-01 (Unified Theory) |
| 7:30-8:00 | Break / heartbeat |
| 8:00-9:30 | Write SYNTH-02 (Protective Layer Adaptation) |
| 9:30-10:30 | Write SYNTH-03 (Drafting Kernel) |
| 10:30-11:00 | Split, zip, push SYNTH docs |
| 11:00-11:30 | Verify, session log, create NEXT_RUNNER_002 |

## 12.3 Critical Path Dependencies

```
Research (2) → Synthesis (3) → Materials (4) → Drafting (5)
                                                    ↓
Core 50 (10) ←─────────────────────────────────────┘
    ↓
RM 50 (25) + RW 50 (25) [parallelizable]
    ↓
GitHub Verification (all 1,950 pieces)
    ↓
Final Delivery
```

---

# 13. APPENDICES

## 13.1 Key File Locations Quick Reference

| Category | Path |
|----------|------|
| Project Root | `/workspace/app/CSMWip/12_AegisOutfitFabricator/` |
| Framework | `./Framework/` |
| Logs | `./Logs/` |
| Pieces | `./Pieces/` |
| FinishedWork | `./FinishedWork/` |
| Research | `./Research/` |
| RenaissanceMan | `./CSMFAB001_Aegis_RenaissanceMan/` |
| RenaissanceWoMan | `./CSMFAB002_Aegis_RenaissanceWoMan/` |
| CSMFAB078 Reference | `/workspace/app/CSMFAB/CSMFAB078_AegisIronMan/` |
| GitHub Handler | `/workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh` |

## 13.2 Critical Commands Quick Reference

```bash
# Environment verification
./Framework/heartbeat.sh "check"

# Source GitHub handler
source /workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh

# Process a document (full pipeline)
./Framework/process_document.sh FinishedWork/DOC_XX.md "Commit message"

# Quality check only
./Framework/check_doc_quality.sh FinishedWork/DOC_XX.md

# Verify reassembly
./Framework/verify_reassembly.sh FinishedWork/DOC_XX.md Pieces/DOC_XX_manifest.json

# 17-way GitHub check
./Framework/verify_github_17ways.sh Pieces/DOC_XX_piece_01.md

# Git status
git status && git log --oneline -5

# Create session log
./Framework/heartbeat.sh "Session end"
```

## 13.3 Document ID Registry

| Prefix | Project | Count | Range |
|--------|---------|-------|-------|
| DOC- | AegisOutfitFabricator Core | 50 | DOC-01 to DOC-50 |
| FAB-RM- | RenaissanceMan Fabrication | 25 | FAB-RM-01 to FAB-RM-25 |
| IMG-RM- | RenaissanceMan Image Prompts | 5 | IMG-RM-01 to IMG-RM-05 |
| FAB-RW- | RenaissanceWoMan Fabrication | 25 | FAB-RW-01 to FAB-RW-25 |
| IMG-RW- | RenaissanceWoMan Image Prompts | 5 | IMG-RW-01 to IMG-RW-05 |
| SYNTH- | Research Synthesis | 3 | SYNTH-01 to SYNTH-03 |
| MAT- | Material Science Bridge | 4 | MAT-01 to MAT-04 |
| DRAFT- | Geometric Drafting Kernel | 5 | DRAFT-01 to DRAFT-05 |
| **TOTAL** | | **150** | |

## 13.4 Image Prompt Era Vernacular Assignments

| Document | Era | Vernacular Style |
|----------|-----|------------------|
| IMG-RM-01 | 1960s | NASA press kit, General Dynamics/Convair brochure, LIFE magazine |
| IMG-RM-02 | 1950s | Atomic Energy Commission declassified, Atlas missile press kit |
| IMG-RM-03 | 1940s | V-2 Peenemünde test stand telemetry, wartime ration card typography |
| IMG-RM-04 | 1930s | Zeppelin travel poster, Goddard liquid rocket patent drawings |
| IMG-RM-05 | Master | All eras simultaneously — palimpsest of typographic history |
| IMG-RW-01 | 1890s | Lilienthal engineering notebook, Berliner Handelsblatt technical supplement |
| IMG-RW-02 | 1870s | Jules Verne manuscript hand, industrial exhibition medal |
| IMG-RW-03 | 1850s | Crystal Palace exhibition guide, scientific society proceedings |
| IMG-RW-04 | 1860s | Civil War telegraphic brevity, Mathew Brady caption format |
| IMG-RW-05 | Master | All eras simultaneously — palimpsest of typographic history |

## 13.5 Contact & Authority

**Project Authority**: Human Conductor (Author/Co-creator)
**Technical Execution**: Kilo (AI Assistant)
**Organization**: Carrington Storm Motors / Safe Pod Engineering Company
**Repository**: PrimeCarrPod/Seed (GitHub)
**Branch**: `kilo/aegis-outfit-fabricator-wip`

---

*README.md — Complete Project Documentation*
*150 Documents | 1,950 Pieces | 150 Archives | 10 Image Prompts*
*Historical Renaissance Protective Outfit Fabrication System*
*Carrington Storm Motors / Safe Pod Engineering Company*
*October 2026*