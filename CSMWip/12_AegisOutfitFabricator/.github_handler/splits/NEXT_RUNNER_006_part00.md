# AegisOutfitFabricator NEXT_RUNNER_006 — PART A: SESSION 006 BOOTSTRAP & CORE DOCUMENT BATCH 2 INITIATION

**Project:** AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Session Target:** Complete Core Document Batch 2 (DOC-11 through DOC-20)  
**Branch:** `kilo/aegis-outfit-fabricator-wip`  
**Created:** 2026-10-11  
**Depends On:** DOC-01 through DOC-10 complete and verified (per CSMFAB078 Main, SYNTH-01, MAT-01..04, DRAFT-01..05)  

---

## 🚀 SESSION 006 — IMMEDIATE BOOTSTRAP CHECKLIST

### 0. Pre-Session Environment Verification (MANDATORY - Run First)

```bash
cd /workspace/app/CSMWip/12_AegisOutfitFabricator
./Framework/heartbeat.sh "Session 006 start - environment verification"

# Verify framework files exist
ls -la Framework/
# Should show: heartbeat.sh, RESUME_SESSION.md, NEXT_RUNNER_001_A.md, NEXT_RUNNER_001_B.md, NEXT_RUNNER_001_C.md, README.md, MASTER_TODO_A.md, MASTER_TODO_B.md, MASTER_TODO_C.md
# Updated scripts: process_document.sh (17 pieces), verify_github_17ways.sh, verify_reassembly.sh, check_doc_quality.sh

# Verify research files (Research Doc 1, Research Doc 2)
ls -la Research/
# Should show: Historical Dress Construction Analysis.md, Advanced Textile Stitching and Automation.md

# Verify CSMFAB078 reference
ls -la /workspace/app/CSMFAB/CSMFAB078_AegisIronMan/
# Should show 10+ files including CSM_GEN_IMAGE_PROMPTS/

# Verify Session 004/005 deliverables exist
ls -la FinishedWork/
# Should show: DOC-01 through DOC-10
```

### 1. Git Branch Verification

```bash
cd /workspace/app/CSMWip/12_AegisOutfitFabricator

# Check current branch
git branch --show-current
# Should be: kilo/aegis-outfit-fabricator-wip

