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
