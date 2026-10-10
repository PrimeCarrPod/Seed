# AegisOutfitFabricator MASTER TODO LIST — PART C: GITHUB INTEGRATION, QUALITY GATES & DELIVERY
**Project:** AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Phase:** 9-12 — Version Control, Quality Assurance, Final Delivery  
**Branch:** `kilo/aegis-outfit-fabricator-wip`

---

## 🎯 PHASE 7: GITHUB HANDLER INTEGRATION & VERIFICATION

### 7.1 GitHub Handler Configuration
- [ ] Configure REPO_ROOT environment variable for github_handler.sh
- [ ] Initialize .github_handler/ directory structure (difficulty_log.json, methods_log.json, merge_queue.json, splits/)
- [ ] Test gh_init() function — creates all required directories and log files
- [ ] Verify difficulty assessment thresholds: Easy≤100, Medium≤500, Hard≤2000, Extreme>2000 lines
- [ ] Verify strategy counts: Easy=3, Medium=6, Hard=9, Extreme=13 strategies
- [ ] Test gh_assess_difficulty() on sample documents
- [ ] Test gh_split_file() with 500-line max — produces numbered parts + manifest.json
- [ ] Test gh_join_files() — reassembles from manifest to clean output
- [ ] Test gh_save_file() end-to-end with all 13 strategies
- [ ] Test gh_process_queue() for merge queue processing

### 7.2 17-Way GitHub Verification Protocol
**For EVERY piece pushed to GitHub, verify via ALL 17 methods:**

| # | Verification Method | Tool/Command | Success Criteria |
|---|---------------------|--------------|------------------|
| 1 | Local file exists | `ls -la piece_file` | File present, non-zero size |
| 2 | Local checksum | `sha256sum piece_file` | Matches expected hash |
| 3 | Git status | `git status --porcelain` | Shows staged/committed |
| 4 | Git log | `git log --oneline -1` | Shows commit with piece message |
| 5 | Git diff | `git diff HEAD~1 -- piece_file` | Shows expected changes |
| 6 | GitHub API: file contents | `curl -H "Accept: application/vnd.github.v3.raw" <raw_url>` | Returns file content |
| 7 | GitHub API: file metadata | `curl -H "Accept: application/vnd.github.v3+json" <api_url>` | Returns size, sha, encoding |
| 8 | Raw GitHub URL | `curl -s <raw.githubusercontent.com/...>` | Returns exact file content |
| 9 | GitHub web UI | Manual browser check | File visible in repo tree |
| 10 | Clone verification | `git clone <repo> /tmp/verify && diff` | Cloned file matches local |
| 11 | Worktree verification | `git worktree add /tmp/wt <branch> && diff` | Worktree file matches |
| 12 | Subtree verification | `git subtree split --prefix=path && diff` | Subtree content matches |
| 13 | Patch verification | `git format-patch -1 && git apply --check` | Patch applies cleanly |
| 14 | LFS verification (if large) | `git lfs ls-files | grep piece_file` | Shows LFS pointer or file |
| 15 | PR verification (strat 4) | `gh pr list --head <branch>` | PR exists, checks pass |
| 16 | Merge queue status | `cat .github_handler/merge_queue.json` | Item status = "completed" |
| 17 | Difficulty log entry | `cat .github_handler/difficulty_log.json | jq .files["piece_file"]` | Entry exists with success_method |

- [ ] Automate 17-way verification script: `verify_github_17ways.sh <piece_file>`
- [ ] Run verification for ALL 150 documents × 13 pieces = 1,950 verifications
- [ ] Log all verification results in `.github_handler/verification_log.json`
- [ ] Alert on ANY failed verification — stop and investigate

### 7.3 Branch Management & Push Protocol
- [ ] Create feature branch: `kilo/aegis-outfit-fabricator-wip` from `main`/`master`
- [ ] Configure upstream tracking: `git push -u origin kilo/aegis-outfit-fabricator-wip`
- [ ] Push Framework files first (MASTER_TODO_A/B/C, heartbeat.sh, RESUME_SESSION.md, NEXT_RUNNER_001.md, README.md)
- [ ] Push Research documents (read-only, reference)
- [ ] Push documents in batches of 10 — verify each batch completely before next
- [ ] Tag major milestones: `v0.1-foundation`, `v0.2-research`, `v0.3-core50`, `v0.4-rm50`, `v0.5-rw50`, `v1.0-complete`
- [ ] Maintain clean commit history: conventional commits, signed commits, GPG verification

---

## 🎯 PHASE 8: QUALITY GATES & CONTINUOUS VALIDATION

### 8.1 Document Quality Standards
- [ ] **Technical Depth**: Minimum 150 lines, target 300+ lines per document
- [ ] **Mathematical Rigor**: All formulas in LaTeX/Unicode, units SI, derivations shown
- [ ] **Industry Terminology**: CIETA, ASTM, NIJ, NFPA, MIL-STD, ISO, IEC standards cited
- [ ] **Cross-References**: Every document references ≥3 other documents by ID
- [ ] **Traceability**: Every specification traces to Research Doc 1, 2, or CSMFAB078
- [ ] **No Conflation**: Historical ≠ Modern clearly delineated; no invented history
- [ ] **No Guessing**: Every value sourced or calculated; unknowns marked [TBD:RESEARCH]
- [ ] **Image Prompt Compliance**: Follows CSM_GEN_IMAGE_07_MASTER_COMPOSITION_GUIDE exactly

### 8.2 Automated Quality Checks (Per Document)
- [ ] Line count check: `wc -l` ≥ 150
- [ ] Formula density: ≥ 1 mathematical formula per 20 lines
- [ ] Reference density: ≥ 1 cross-reference per 30 lines
- [ ] Terminology check: grep for CIETA/ASTM/NIJ/NFPA/MIL-STD/ISO/IEC
- [ ] Traceability check: grep for "Research/" or "CSMFAB078" references
- [ ] Conflation scan: grep for "medieval"/"Victorian" in Renaissance docs (flag)
- [ ] Piece reassembly diff: `diff original reassembled` = empty
- [ ] Zip integrity: `unzip -t Pieces/DOC_XXX_pieces.zip` = OK

### 8.3 Session Quality Gates
- [ ] **Pre-session**: Run `verify_environment` from RESUME_SESSION.md
- [ ] **Mid-session**: Heartbeat every 30 min, log to logs/heartbeat.log
- [ ] **Post-session**: Run `session_log` function, commit all changes, push
- [ ] **Inter-session**: NEXT_RUNNER_XXX.md created with exact next steps

### 8.4 Forensic Cleanliness Verification
- [ ] No "Piece X of Y" markers in FinishedWork/ documents
- [ ] No "---" section separators from piece boundaries
- [ ] No duplicate headers from piece joins
- [ ] Continuous line numbering in final document
- [ ] Single cohesive narrative voice throughout
- [ ] Metadata embedded: generation seed, document ID, timestamp, spec hash

---

## 🎯 PHASE 9: FINAL DELIVERY & ARCHIVAL

### 9.1 Delivery Package Assembly
- [ ] **Framework/** — All scripts, configs, MASTER_TODO_A/B/C, logs
- [ ] **Research/** — Seed documents (2), analysis reports (3 synthesized)
- [ ] **Pieces/** — 1,950 piece files + 150 manifests + 150 zip archives
- [ ] **FinishedWork/** — 150 clean, reassembled documents
- [ ] **CSMFAB0??_Aegis RenaissanceMan/** — 50 fabrication documents + 5 image prompts
- [ ] **CSMFAB0??_Aegis RenaissanceWoMan/** — 50 fabrication documents + 5 image prompts
- [ ] **Logs/** — Heartbeat logs, session logs, verification logs, difficulty logs

### 9.2 Final Verification Suite
- [ ] Complete 150-document manifest: `FINAL_MANIFEST.json` with all IDs, paths, checksums
- [ ] Cross-reference integrity: Build dependency graph, verify no broken links
- [ ] Terminology consistency: Automated scan for standardized terms across all docs
- [ ] Mathematical consistency: Unit analysis, dimensional analysis on all formulas
- [ ] Historical accuracy audit: Expert review of Research Doc 1 alignment
- [ ] Protection efficacy audit: Expert review of CSMFAB078 technology transfer
- [ ] Image prompt completeness: All 10 prompts follow Master Composition Guide
- [ ] GitHub completeness: All 1,950 pieces + 150 zips + Framework verified 17 ways

### 9.3 Archival & Handoff
- [ ] Create release tarball: `AegisOutfitFabricator_v1.0_Complete.tar.gz`
- [ ] Generate SHA3-512 manifest for all files
- [ ] Push final tag: `git tag -a v1.0-complete -m "AegisOutfitFabricator Complete - 150 Documents"`
- [ ] Push tags: `git push origin --tags`
- [ ] Create GitHub Release with assets: tarball, manifest, verification report
- [ ] Document handoff package: `HANDOFF_PACKAGE.md` with runbooks, contacts, maintenance

---

## 🎯 PHASE 10: PROJECT CLOSURE & LESSONS LEARNED

### 10.1 Retrospective Documentation
- [ ] **LESSONS_LEARNED.md** — Technical, process, tooling, collaboration insights
- [ ] **METRICS_REPORT.md** — Lines written, pieces created, GitHub pushes, verification pass rate, time
- [ ] **PROCESS_IMPROVEMENTS.md** — What worked, what failed, next-time recommendations
- [ ] **TOOLING_UPDATES.md** — github_handler.sh improvements, new scripts needed

### 10.2 Knowledge Transfer
- [ ] Update AGENTS.md with AegisOutfitFabricator patterns
- [ ] Update TOOLS.md with github_handler.sh usage patterns
- [ ] Update MEMORY.md with project context for future sessions
- [ ] Brief successor session via NEXT_RUNNER_FINAL.md

---

## 📋 DEFINITION OF DONE — PHASE 7-10
- [ ] All 1,950 pieces pushed to GitHub, verified 17 ways each
- [ ] All 150 documents reassembled in FinishedWork/ — forensically clean
- [ ] All quality gates passed for every document
- [ ] Complete delivery package assembled and verified
- [ ] GitHub release created with all assets
- [ ] Retrospective documents complete
- [ ] Knowledge transferred to AGENTS.md, TOOLS.md, MEMORY.md
- [ ] Project marked COMPLETE in MASTER_TODO_A/B/C

---

## 🔗 GITHUB HANDLER REFERENCE — STRATEGY DETAILS

### Strategies 1-13 (Auto-Selected by Difficulty)
| Strat | Name | Method | Use Case |
|-------|------|--------|----------|
| 1 | Direct | `git add → commit → push` | Easy, clean history |
| 2 | Staged | `git add -A → commit → push` | Multiple files |
| 3 | Force | `push --force-with-lease` | History rewrite needed |
| 4 | PR | Create branch → PR → merge | Review required |
| 5 | Rebase | Fetch → rebase → push | Upstream changes |
| 6 | Ours | Merge -s ours → amend → push | Conflict resolution |
| 7 | Cherry-pick | Temp branch → cherry-pick → push | Selective commit |
| 8 | Subtree | Clone sub-repo → copy → push | Isolated push |
| 9 | Worktree | Add worktree → commit → push | Parallel work |
| 10 | Patch | Generate patch → apply → push | Diff-based |
| 11 | API | GitHub REST API (needs token) | Large files |
| 12 | LFS | `git lfs track → push` | Binary/large files |
| 13 | Manual | Queue for human | All auto failed |

### Difficulty → Strategy Mapping
- **Easy (≤100 lines)**: Strategies 1-3
- **Medium (≤500 lines)**: Strategies 1-6
- **Hard (≤2000 lines)**: Strategies 1-9
- **Extreme (>2000 lines)**: Strategies 1-13 (auto-split first)

---

## 📊 PROJECT METRICS TARGETS

| Metric | Target | Measurement |
|--------|--------|-------------|
| Total Documents | 150 | Count in FinishedWork/ |
| Total Lines | ~45,000+ | `wc -l FinishedWork/*.md` |
| Total Pieces | 1,950 | 150 × 13 |
| Total Zip Archives | 150 | 1 per document |
| GitHub Verification Pass Rate | 100% | 17-way × 1,950 pieces |
| Piece Reassembly Diff | 0 bytes | `diff` per document |
| Image Prompts | 10 | 5 per variant |
| Cross-References | ≥450 | 3+ per document |
| Mathematical Formulas | ≥2,250 | 15+ per document |
| Research Traceability | 100% | All specs traced |

---

*Part C of 3 — GitHub Integration, Quality Gates & Delivery*
*Previous: MASTER_TODO_B.md — Document Fabrication Pipeline*
*Complete MASTER_TODO Suite: A + B + C = Full Project Roadmap*