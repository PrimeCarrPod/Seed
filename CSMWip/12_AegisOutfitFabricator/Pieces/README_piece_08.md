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
