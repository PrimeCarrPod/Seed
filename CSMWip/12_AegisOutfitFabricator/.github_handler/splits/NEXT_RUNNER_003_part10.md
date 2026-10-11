- [ ] DRAFT-05_Zero_Waste_Nesting_Optimizer.md → FinishedWork/

### For EACH Deliverable:
- [ ] Author complete document (300+ lines, dense technical)
- [ ] Quality check: `./Framework/check_doc_quality.sh "FinishedWork/DRAFT-XX.md"`
- [ ] Split: `gh_split_file "FinishedWork/DRAFT-XX.md" 500` → 13 pieces
- [ ] Zip: `cd Pieces && zip DRAFT-XX_pieces.zip DRAFT-XX_piece_*.md DRAFT-XX_manifest.json && cd ..`
- [ ] Push pieces: `for p in Pieces/DRAFT-XX_piece_*.md; do gh_save_file "$p" "Piece: DRAFT-XX" "kilo/aegis-outfit-fabricator-wip"; done`
- [ ] Push zip: `gh_save_file "Pieces/DRAFT-XX_pieces.zip" "Archive: DRAFT-XX" "kilo/aegis-outfit-fabricator-wip"`
- [ ] Verify reassembly: `gh_join_files "Pieces/DRAFT-XX_manifest.json" "FinishedWork/DRAFT-XX_verify.md" && diff FinishedWork/DRAFT-XX.md FinishedWork/DRAFT-XX_verify.md`
- [ ] 17-way GitHub check: `./Framework/verify_github_17ways.sh "Pieces/DRAFT-XX_piece_01.md"`
- [ ] Log: `./Framework/heartbeat.sh "Completed DRAFT-XX - verified clean reassembly"`

---

## 📊 SESSION 003 SUCCESS CRITERIA

| Metric | Target | Verification |
|--------|--------|--------------|
| DRAFT documents authored | 5 | FinishedWork/ count |
| Lines per document | ≥300 | wc -l |
| Formulas per document | ≥15 | grep count |
| Cross-refs per document | ≥10 | grep count |
| Standards per document | ≥5 | grep count |
| Conflation flags | 0 | grep count |
| TBD markers | Documented | grep count |
| Traceability matrix | Present | grep count |
| GitHub pieces per doc | 13 | ls Pieces/ |
| Zip archive per doc | 1 | ls Pieces/*_pieces.zip |
| Reassembly diff | 0 bytes | diff output |
| 17-way verification | PASS | verify_github_17ways.sh |
| Heartbeat logs | ≥3 per session | Logs/heartbeat.log |

---

