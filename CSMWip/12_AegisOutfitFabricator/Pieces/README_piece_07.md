- **Phase 1**: De-tension (15s) — release all 12 zone levers
- **Phase 2**: Panel reconfiguration (45s) — add/remove tiles, magnetic alignment
- **Phase 3**: Re-tension (25s) — engage levers in sequence Z3→Z4→Z5→Z6→Z1→Z2→Z7→Z8→Z9→Z10→Z11→Z12
- **Phase 4**: Validation (5s) — SE spot-check, MR pressure, bio-acoustic baseline

**Renaissance Adaptation**:
- Lacing points map to historical cord eyelets
- Tile add/remove = garment alteration (historical practice)
- Transition time target: <90 seconds (same as AIMES)# 9. QUALITY GATES & VERIFICATION

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
