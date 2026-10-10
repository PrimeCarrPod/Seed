│  2. QUALITY CHECK                                              │
│     ./Framework/check_doc_quality.sh DOC.md                   │
│     Gates: lines≥300, formulas≥15, refs≥10, standards≥5,      │
│     conflation=0, traceability=yes                            │
│                                                                │
│  3. SPLIT                                                      │
│     gh_split_file "FinishedWork/DOC.md" 500                   │
│     → Creates 13 pieces in Pieces/ + manifest.json            │
│                                                                │
│  4. ZIP                                                        │
│     cd Pieces && zip DOC_pieces.zip DOC_piece_*.md manifest   │
│                                                                │
│  5. PUSH TO GITHUB (13 strategies per piece)                  │
│     for p in Pieces/DOC_piece_*.md; do                        │
│       gh_save_file "$p" "Piece: DOC" "kilo/aegis-outfit-..."  │
│     done                                                       │
│     gh_save_file "Pieces/DOC_pieces.zip" "Archive: DOC" ...   │
│                                                                │
│  6. VERIFY REASSEMBLY                                          │
│     gh_join_files "Pieces/DOC_manifest.json" "verify.md"      │
│     diff FinishedWork/DOC.md verify.md  # MUST BE 0 BYTES     │
│                                                                │
│  7. 17-WAY GITHUB VERIFICATION (sample piece)                 │
│     ./Framework/verify_github_17ways.sh Pieces/DOC_piece_01.md│
│                                                                │
│  8. HEARTBEAT LOG                                              │
│     ./Framework/heartbeat.sh "Completed DOC - verified"       │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

## 5.2 Piece Management Protocol

### Naming Convention
- **Pieces**: `DOC_XXX_piece_01.md` through `DOC_XXX_piece_13.md`
- **Manifest**: `DOC_XXX_manifest.json` (part list, checksums, timestamps)
- **Archive**: `DOC_XXX_pieces.zip` (all pieces + manifest)

### Manifest Structure
```json
{
  "original": "FinishedWork/DOC_XXX.md",
  "parts": ["DOC_XXX_piece_01.md", "...", "DOC_XXX_piece_13.md"],
  "created": "2026-10-10T06:07:32Z",
  "checksums": {"DOC_XXX_piece_01.md": "sha256:...", ...}
}
```

## 5.3 GitHub Handler Strategies (13 Total)

| Strat | Name | Method | Trigger |
|-------|------|--------|---------|
| 1 | Direct | `git add → commit → push` | Easy (≤100 lines) |
| 2 | Staged | `git add -A → commit → push` | Multiple files |
| 3 | Force | `push --force-with-lease` | History rewrite |
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

**Difficulty → Strategy Count**: Easy=3, Medium=6, Hard=9, Extreme=13 (auto-split first)

## 5.4 17-Way GitHub Verification

For EVERY piece pushed, verify via ALL 17 methods:

1. Local file exists
2. Local checksum matches
3. Git status shows file
4. Git log has commit
5. Git diff shows changes
6. GitHub API raw content accessible
7. GitHub API metadata returns sha/size
8. Raw GitHub URL returns content
9. GitHub web UI (manual)
10. Clone verification
11. Worktree verification
12. Subtree verification
13. Patch verification
14. LFS verification
15. PR verification
16. Merge queue status = completed
17. Difficulty log entry exists with success_method

**Target**: 100% pass rate on 1,950 pieces × 17 = 33,150 verifications# 6. FRAMEWORK & TOOLING

## 6.1 Framework Directory Structure

```
