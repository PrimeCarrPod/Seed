- [ ] DOC-19_Cross_Edition_Compatibility_Matrix.md → FinishedWork/
- [ ] DOC-20_Edition_Delta_Tables_Historical_Alteration.md → FinishedWork/

### For EACH Deliverable (per process_document.sh, Framework/verify_reassembly.sh, Framework/verify_github_17ways.sh):

- [ ] Author complete document (300+ lines, dense technical)
- [ ] Quality check: `./Framework/check_doc_quality.sh "FinishedWork/DOC-XX.md"`
- [ ] Split: `gh_split_file "FinishedWork/DOC-XX.md" 500` → 17 pieces
- [ ] Zip: `cd Pieces && zip DOC-XX_pieces.zip DOC-XX_piece_*.md DOC-XX_manifest.json && cd ..`
- [ ] Push pieces: `for p in Pieces/DOC-XX_piece_*.md; do gh_save_file "$p" "Piece: DOC-XX" "kilo/aegis-outfit-fabricator-wip"; done`
- [ ] Push zip: `gh_save_file "Pieces/DOC-XX_pieces.zip" "Archive: DOC-XX" "kilo/aegis-outfit-fabricator-wip"`
- [ ] Verify reassembly: `gh_join_files "Pieces/DOC-XX_manifest.json" "FinishedWork/DOC-XX_verify.md" && diff FinishedWork/DOC-XX.md FinishedWork/DOC-XX_verify.md`
- [ ] 17-way GitHub check: `./Framework/verify_github_17ways.sh "Pieces/DOC-XX_piece_01.md"`
- [ ] Log: `./Framework/heartbeat.sh "Completed DOC-XX - verified clean reassembly"`

---

## 📊 SESSION 006 SUCCESS CRITERIA (per MASTER_TODO_A.md, MASTER_TODO_B.md, Framework/README.md)

| Metric | Target | Verification |
|--------|--------|--------------|
| DOC documents authored | 10 | FinishedWork/ count |
| Lines per document | ≥300 | wc -l |
| Formulas per document | ≥15 | grep count |
| Cross-refs per document | ≥10 | grep count |
| Standards per document | ≥5 | grep count |
| Conflation flags | 0 | grep count |
| TBD markers | Documented | grep count |
| Traceability matrix | Present | grep count |
| GitHub pieces per doc | 17 | ls Pieces/ |
| Zip archive per doc | 1 | ls Pieces/*_pieces.zip |
| Reassembly diff | 0 bytes | diff output |
| 17-way verification | PASS | verify_github_17ways.sh |
| Heartbeat logs | ≥10 per session | Logs/heartbeat.log |
| Train velocity | ≥0.7 docs/h | docs / hours |
| Loop completion | 10 docs | Batch 2 done |

---

## 🔄 SESSION 006 END — HANDOFF TO SESSION 007 (per Framework/RESUME_SESSION.md, Framework/heartbeat.sh)

### Session Log Template

```bash
cat > Logs/csmlogs/session_$(date -u +%Y%m%d_%H%M%S).md << 'EOF'
