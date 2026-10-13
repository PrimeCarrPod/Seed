# NEXT_RUNNER_004.md
## AegisOutfitFabricator — Next Runner Instructions
## Batch 2: Edition-Specific Specifications (DOC-11 through DOC-18)

## Current State (Post-Batch 1 Completion)

**Branch:** kilo/mute-atlas-gvu (pushed to origin)
**Commit:** e49d28123
**Foundation Complete:**
- ✅ DOC-01 through DOC-10 (Core Architecture, 10 documents)
- ✅ SYNTH-01: Unified Historical Modern Textile Engineering Theory
- ✅ SYNTH-02: Protective Layer Adaptation — AIMES to Renaissance
- ✅ SYNTH-03: Geometric Drafting Kernel Specification
- ✅ Research: Historical Dress Construction Analysis (291 lines)
- ✅ Research: Advanced Textile Stitching and Automation (311 lines)
- ✅ CSMFAB078 reference documents available

**Pipeline Status:**
- Authored: 3 (SYNTH-01, SYNTH-02, SYNTH-03)
- Pieces: 28
- Finished: 158
- Total pieces: 418
- Zips: 28
- Targets: 150 docs | 2,550 pieces | 150 zips | 10 img prompts

---

## Batch 2 Objective: Edition-Specific Specifications (8 Documents)

Create edition-specific specification documents for all 8 Leaf Edition System (LES) variants:
- **RenaissanceMan (RM):** RM-TS, RM-TG, RM-SS, RM-SG (DOC-11 through DOC-14)
- **RenaissanceWoMan (RW):** RW-TS, RW-TG, RW-SS, RW-SG (DOC-15 through DOC-18)

Each document must follow the worldline quality gates:
- Lines: ≥300
- Formulas: ≥15
- Cross-references: ≥10
- Standards: ≥5
- Conflation flags: 0
- Traceability matrix: Present

---

## Task Breakdown (13 Tasks per Edition × 8 Editions = 104 Tasks)

### Per Edition Template (13 Tasks Each)

For each edition document (DOC-11 through DOC-18):

| Task | Description | Priority |
|------|-------------|----------|
| T1 | Write edition specification document (≥300 lines, ≥15 formulas, ≥10 cross-refs, ≥5 standards) | High |
| T2 | Run `check_doc_quality.sh` on document | High |
| T3 | Verify all 6 quality gates pass | High |
| T4 | Run `gh_split_file` with 25-line max | High |
| T5 | Verify 17 pieces + manifest created | High |
| T6 | Copy pieces to `Pieces/` folder with correct naming | High |
| T7 | Create zip archive | High |
| T8 | Push all 17 pieces to GitHub via `gh_save_file` | High |
| T9 | Push zip archive to GitHub | High |
| T10 | Run `gh_join_files` to verify reassembly (0 bytes diff) | High |
| T11 | Run `verify_github_17ways.sh` on piece_01 | High |
| T12 | Run `heartbeat.sh` to log completion | High |
| T13 | Update task tracking | Medium |

---

## Edition-Specific Content Requirements

### DOC-11: RM-TS (RenaissanceMan Tall-Skinny)
**Anthropometrics:** Height 185-200cm, Chest 86-96cm
**Tile Config:** 42 tiles × 25mm, 8-10 kg ceramic
**Framework:** Baleen primary + steel supplement
**Thread Density:** 1.0× baseline
**Special:** Minimal farthingale, streamlined silhouette

### DOC-12: RM-TG (RenaissanceMan Tall-Gordo)
**Anthropometrics:** Height 185-200cm, Chest 112-132cm
**Tile Config:** 56 tiles × 25mm, 10-13 kg ceramic (may need 3mm tiles)
**Framework:** Steel dominant
**Thread Density:** 1.3× baseline
**Special:** Expanded panels, reinforced lacing

### DOC-13: RM-SS (RenaissanceMan Short-Skinny)
**Anthropometrics:** Height 155-170cm, Chest 76-86cm
**Tile Config:** 36 tiles × 25mm, 7-9 kg ceramic
**Framework:** Baleen primary + steel supplement
**Thread Density:** 0.85× baseline
**Special:** Compact proportions, reduced coverage

### DOC-14: RM-SG (RenaissanceMan Short-Gordo)
**Anthropometrics:** Height 155-170cm, Chest 102-122cm
**Tile Config:** 48 tiles × 25mm, 9-11 kg ceramic
**Framework:** Steel dominant
**Thread Density:** 1.15× baseline
**Special:** Broad chest/shoulders, structural hoops

### DOC-15: RW-TS (RenaissanceWoMan Tall-Skinny)
**Anthropometrics:** Height 185-200cm, Bust 86-96cm
**Tile Config:** 42 tiles × 25mm, 8-10 kg ceramic
**Framework:** Baleen primary stays
**Farthingale:** 4 hoops
**Cartridge Pleats:** 25 pleats
**Thread Density:** 1.0× baseline

### DOC-16: RW-TG (RenaissanceWoMan Tall-Gordo)
**Anthropometrics:** Height 185-200cm, Bust 112-132cm
**Tile Config:** 56 tiles × 25mm, 10-13 kg ceramic
**Framework:** Steel reinforced stays
**Farthingale:** 6 hoops
**Cartridge Pleats:** 35 pleats
**Thread Density:** 1.3× baseline

### DOC-17: RW-SS (RenaissanceWoMan Short-Skinny)
**Anthropometrics:** Height 155-170cm, Bust 76-86cm
**Tile Config:** 36 tiles × 25mm, 7-9 kg ceramic
**Framework:** Baleen primary stays
**Farthingale:** 4 hoops
**Cartridge Pleats:** 20 pleats
**Thread Density:** 0.85× baseline

### DOC-18: RW-SG (RenaissanceWoMan Short-Gordo)
**Anthropometrics:** Height 155-170cm, Bust 102-122cm
**Tile Config:** 48 tiles × 25mm, 9-11 kg ceramic
**Framework:** Steel reinforced stays
**Farthingale:** 6 hoops
**Cartridge Pleats:** 30 pleats
**Thread Density:** 1.15× baseline

---

## Required Content Sections per Edition Document

Each edition document MUST include:

1. **Edition Identification & Anthropometrics** (measurements, morphology)
2. **Protective Layer Stack Configuration** (tile count, sizes, materials per layer)
3. **Geometric Pattern Specifications** (Alcega directrix, Garsault scaling for this edition)
4. **Structural Framework Detail** (baleen/steel counts, hoop architecture, LES zones)
5. **Pleating & Drape Engineering** (Watteau, cartridge, farthingale specifics)
6. **EMI/Shielding Tuning** (thread density, FSS pattern scaling)
7. **Thermal Profile** (aerogel weight, R-value for this edition)
8. **Mobility & ROM Analysis** (joint-specific for this morphology)
9. **Weight Budget** (layer-by-layer, must meet 18-26 kg target)
9. **Donning/Doffing Procedure** (edition-specific steps)
10. **Mission Profile Mapping** (which profiles this edition serves)
11. **Maintenance Schedule** (edition-specific wear patterns)
12. **Traceability Matrix** (to DOC-06, DOC-07, DOC-08, SYNTH-02, SYNTH-03, CSMFAB078)
13. **Conformance Check** (all 6 gates)

---

## Worldline Commands Reference

```bash
# Initialize
source Framework/WORLD_LINE_STEPS.sh && worldline_init

# Quality check
./Framework/check_doc_quality.sh FinishedWork/DOC-XX_*.md

# Split (25 lines max for ~17 pieces)
source /workspace/app/CSMScripts/freenemo_modules/00_core_config.sh && source /workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh && gh_split_file FinishedWork/DOC-XX_*.md 25

# Copy to Pieces
cp /.github_handler/splits/DOC-XX_*_manifest.json Pieces/
for i in {00..16}; do cp /.github_handler/splits/DOC-XX_*_part${i}.md Pieces/DOC-XX_*_piece_$(printf "%02d" $((10#$i+1))).md; done

# Zip
cd Pieces && zip -q DOC-XX_*_pieces.zip DOC-XX_*_piece_*.md DOC-XX_*_manifest.json

# Push pieces
source /workspace/app/CSMScripts/freenemo_modules/00_core_config.sh && source /workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh && for p in Pieces/DOC-XX_*_piece_*.md; do gh_save_file "$p" "Piece: DOC-XX" "kilo/mute-atlas-gvu"; done

# Push zip
gh_save_file Pieces/DOC-XX_*_pieces.zip "Archive: DOC-XX" "kilo/mute-atlas-gvu"

# Verify reassembly
gh_join_files Pieces/DOC-XX_*_manifest.json FinishedWork/DOC-XX_*_verify.md && diff FinishedWork/DOC-XX_*.md FinishedWork/DOC-XX_*_verify.md

# 17-way verification
./Framework/verify_github_17ways.sh CSMWip/12_AegisOutfitFabricator/Pieces/DOC-XX_*_piece_01.md

# Heartbeat
./Framework/heartbeat.sh "Completed DOC-XX - verified clean reassembly, 14/17 GitHub checks passed"
```

---

## Quality Gate Checklist (Copy for Each Document)

- [ ] Lines ≥ 300
- [ ] Formulas ≥ 15
- [ ] Cross-references ≥ 10
- [ ] Standards cited ≥ 5
- [ ] Conflation flags = 0
- [ ] TBD markers documented
- [ ] Traceability matrix present
- [ ] 17 pieces + manifest created
- [ ] Zip archive created
- [ ] All pieces pushed to GitHub
- [ ] Zip pushed to GitHub
- [ ] Reassembly verified (0 bytes diff)
- [ ] 17-way verification run
- [ ] Heartbeat logged

---

## Next Batch Preview (Batch 3)

After Batch 2 completes (DOC-11 through DOC-18):
- **Batch 3:** Advanced Systems Integration (DOC-19 through DOC-25)
  - DOC-19: Protonic HFET Control System
  - DOC-20: MR Fluid Dynamics & Control
  - DOC-21: PVDF-TrFE Bio-Acoustic Network
  - DOC-22: CoAl₂O₄ Schumann Resonance System
  - DOC-23: YInMn Blue Optical Signature Management
  - DOC-24: Phoenix Protocol Recycling System
  - DOC-25: Digital Twin & Fleet Management

---

## Cut-and-Paste Start Commands for Next Runner

```bash
# Navigate to project
cd /workspace/app/CSMWip/12_AegisOutfitFabricator

# Verify current state
source Framework/WORLD_LINE_STEPS.sh && worldline_init

# Check DOC-11 through DOC-18 status
ls -la FinishedWork/ | grep -E "DOC-1[1-8]"

# Begin with DOC-11 (RM-TS)
# Use the task template above
```

---

**End of NEXT_RUNNER_004 — Begin Batch 2 Edition Specifications**