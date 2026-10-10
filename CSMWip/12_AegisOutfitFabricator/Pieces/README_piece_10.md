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
