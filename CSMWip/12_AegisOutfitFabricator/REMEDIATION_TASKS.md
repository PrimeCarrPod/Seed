# REMEDIATION TASKS — AegisOutfitFabricator Quality Gate Compliance

**Generated**: 2026-10-22  
**Based on**: Full corpus quality verification (60 documents)  
**Status**: 16/60 PASS, 44/60 FAIL

---

## QUALITY GATE REQUIREMENTS (Per Document)

| Gate | Target | Verification |
|------|--------|--------------|
| Lines | ≥300 | `wc -l` |
| Formulas (LaTeX/Unicode) | ≥15 | `grep -c '\$\\|\\['` |
| Cross-references | ≥10 | `grep -c 'Research\|SYNTH\|MAT\|DRAFT\|CSMFAB078'` |
| Standards cited | ≥5 | `grep -ci 'CIETA\|ASTM\|NIJ\|NFPA\|MIL-STD\|ISO\|IEC\|DoDI\|SAE'` |
| Conflation flags | 0 | `grep -ic 'medieval\|victorian\|edwardian\|regency\|rococo\|neoclassical\|empire\|19c\|20c\|pre-1600'` |
| TBD markers | Documented | `grep -c 'TBD:RESEARCH'` |
| Traceability Matrix | Present | `grep -c 'Traceability Matrix'` |

---

## REMEDIATION TASK BREAKDOWN

### PHASE A: Formula Injection (34 documents need ≥15 formulas)

#### Priority 1: Core Architecture (DOC-06..10) — 5 docs, 0-4 formulas each
- [ ] **TASK-A1**: DOC-06 Protective Layer Architecture — Add 15+ formulas (layer impedance, ballistic limit, thermal resistance, EMI SE)
- [ ] **TASK-A2**: DOC-07 Textile Engineering — Add 15+ formulas (tensile modulus, shear stiffness, permeability, stitch density)
- [ ] **TASK-A3**: DOC-08 Manufacturing Process — Add 15+ formulas (cycle time, yield rate, ultrasonic energy, nesting efficiency)
- [ ] **TASK-A4**: DOC-09 QA Testing — Add 15+ formulas (sample size, confidence intervals, defect rates, reliability growth)
- [ ] **TASK-A5**: DOC-10 Deployment Ops — Add 15+ formulas (donning time, MTTR, logistics footprint, readiness metrics)

#### Priority 2: Threat Protection Suite (DOC-21..29, 33..34) — 12 docs, 0-3 formulas each
- [ ] **TASK-A6**: DOC-21 Ballistic Protection — Add 15+ formulas (V50, BL(P), areal density, ceramic fracture)
- [ ] **TASK-A7**: DOC-22 Thermal/Fire — Add 13+ formulas (heat flux, thermal penetration, ablation rate, NIR reflectance)
- [ ] **TASK-A8**: DOC-23 Electrical/GIC — Add 15+ formulas (Faraday attenuation, surge clamping, ground impedance)
- [ ] **TASK-A9**: DOC-24 Chem/Bio — Add 15+ formulas + 56 lines (breakthrough time, permeation, neutralization kinetics)
- [ ] **TASK-A10**: DOC-25 Directed Energy — Add 15+ formulas (fluence threshold, ablation depth, phase change)
- [ ] **TASK-A11**: DOC-26 Blast/Frag — Add 15+ formulas (impulse mitigation, spall velocity, auxetic Poisson)
- [ ] **TASK-A12**: DOC-27 Environmental Seal — Add 15+ formulas (leak rate, pressure delta, O2/CO2 balance)
- [ ] **TASK-A13**: DOC-28 Power/Thermal — Add 15+ formulas (MHD efficiency, COP, thermal resistance network)
- [ ] **TASK-A14**: DOC-29 Sensor Suite — Add 15+ formulas (FBG sensitivity, SNR, spatial resolution)
- [ ] **TASK-A15**: DOC-33 Deployment Integration — Add 15+ formulas (assembly torque, activation sequence timing)
- [ ] **TASK-A16**: DOC-34 Maintenance — Add 12+ formulas (inspection intervals, RUL prediction, SLEP criteria)

#### Priority 3: Later Docs (DOC-31, 42, 44, 46) — 4 docs, 6-14 formulas each
- [ ] **TASK-A17**: DOC-31 Manufacturing Integration — Add 1+ formula (cell takt time, yield)
- [ ] **TASK-A18**: DOC-42 Config Management — Add 3+ formulas (change impact, baseline drift)
- [ ] **TASK-A19**: DOC-44 Data Management — Add 9+ formulas (storage growth, transfer latency)
- [ ] **TASK-A20**: DOC-46 ESOH — Add 4+ formulas (exposure limits, risk scores)

#### Priority 4: Foundation Documents (DRAFT, MAT, SYNTH) — 12 docs, 0-1 formulas each
- [ ] **TASK-A21**: DRAFT-01 Alcega Engine — Add 15+ formulas (developable surface, Gaussian curvature)
- [ ] **TASK-A22**: DRAFT-02 Garsault Scaling — Add 15+ formulas (proportional ratios, grading rules)
- [ ] **TASK-A23**: DRAFT-03 Pleating Kernel — Add 15+ formulas (pleat geometry, fold angles, compression)
- [ ] **TASK-A24**: DRAFT-04 Farthingale Hoop — Add 15+ formulas (hoop stress, buckling, deployment)
- [ ] **TASK-A25**: DRAFT-05 Nesting Optimizer — Add 15+ formulas (packing efficiency, waste %, guillotine cuts)
- [ ] **TASK-A26**: MAT-01 Silk Fibroin — Add 15+ formulas (modulus, degradation kinetics, crystallinity)
- [ ] **TASK-A27**: MAT-02 Structural — Add 14+ formulas (yield, fatigue, creep, CTE)
- [ ] **TASK-A28**: MAT-03 Protective Integration — Add 14+ formulas (interfacial shear, delamination)
- [ ] **TASK-A29**: MAT-04 Cross-Property — Add 14+ formulas (correlation matrices, PCA)
- [ ] **TASK-A30**: SYNTH-01 Unified Theory — Add 15+ formulas (constitutive models, homogenization)
- [ ] **TASK-A31**: SYNTH-02 AIMES Adaptation — Add 15+ formulas (threat scaling, layer mapping)
- [ ] **TASK-A32**: SYNTH-03 Drafting Kernel — Add 15+ formulas (surface parametrization, flattening)

---

### PHASE B: Conflation Removal (10 documents)

| Document | Flags | Terms to Replace |
|----------|-------|------------------|
| DOC-02 Historical Context | 13 | Replace period-specific terms with "historical reference (1600-1700)" |
| DOC-11 RM TS | 6 | Remove "Renaissance" as period label, use "RM-edition" |
| DOC-12 RM TG | 6 | Same |
| DOC-13 RM SS | 3 | Same |
| DOC-14 RM SG | 3 | Same |
| DOC-15 RW TS | 3 | Same |
| DOC-16 RW TG | 7 | Same |
| DOC-17 RW SS | 7 | Same |
| DOC-18 RW SG | 7 | Same |
| DOC-19 Cross-Edition | 4 | Same |
| DOC-20 Delta Tables | 17 | Same |

- [ ] **TASK-B1**: DOC-02 — Systematic replacement of conflation terms with neutral historical references
- [ ] **TASK-B2**: DOC-11 through DOC-18 (8 docs) — Replace "Renaissance"/"medieval"/etc with edition-neutral terminology
- [ ] **TASK-B3**: DOC-19 Cross-Edition Matrix — Clean terminology
- [ ] **TASK-B4**: DOC-20 Delta Tables — Clean terminology (17 occurrences)

---

### PHASE C: DOC-48 Completion (Incomplete Document)

**Current State**: 89 lines, 2 formulas, 8 refs, 4 chapters (missing 8 chapters from manifest)

- [ ] **TASK-C1**: Author missing chapters for DOC-48:
  - Chapter 4: Simulation Infrastructure & Compute Requirements
  - Chapter 5: Synthetic Training Environment Generation
  - Chapter 6: Curriculum Integration & Management
  - Chapter 7: Instructor & Assessment Systems
  - Chapter 8: Distributed Mission Operations
  - Chapter 9: Traceability Matrix (expand)
  - Chapter 10: Formulas Reference (expand to 15+)
  - Chapter 11: Standards Compliance Summary
  - Chapter 12: TBD Markers
- [ ] **TASK-C2**: Target: ≥300 lines, ≥15 formulas, ≥10 refs, ≥5 standards
- [ ] **TASK-C3**: Regenerate chunks and manifest for DOC-48

---

### PHASE D: Verification & Regression Testing

- [ ] **TASK-D1**: Re-run full corpus verification after each phase
- [ ] **TASK-D2**: Update MASTER_COMPENDIUM.md after remediation
- [ ] **TASK-D3**: Git commit per document remediated (or per batch)
- [ ] **TASK-D4**: Final quality gate report

---

## ESTIMATED EFFORT

| Phase | Tasks | Est. Docs/Hour | Est. Hours |
|-------|-------|----------------|------------|
| A: Formulas | 32 | 0.5 (complex) | ~64 |
| B: Conflation | 4 | 2.0 (search/replace) | ~5 |
| C: DOC-48 | 3 | 0.3 (authoring) | ~10 |
| D: Verification | 4 | - | ~4 |
| **Total** | **43** | | **~83 hours** |

---

## EXECUTION STRATEGY

### Batch Approach (Recommended)
1. **Batch 1**: TASK-A1..A5 (Core Architecture) — 5 docs
2. **Batch 2**: TASK-A6..A16 (Threat Protection) — 11 docs  
3. **Batch 3**: TASK-A17..A20 (Later Docs) — 4 docs
4. **Batch 4**: TASK-A21..A32 (Foundation) — 12 docs
5. **Batch 5**: TASK-B1..B4 (Conflation) — 11 docs
6. **Batch 6**: TASK-C1..C3 (DOC-48) — 1 doc
7. **Batch 6**: TASK-D1..D4 (Verification) — validation

### Per-Document Workflow
```bash
# 1. Decompress original
python3 ../../__Python_Tools/write_large_file.py decompress FinishedWork/DOC-XX_*.md.gz /tmp/DOC-XX.md

# 2. Edit /tmp/DOC-XX.md (add formulas, fix conflation)

# 3. Re-chunk
python3 ../../__Python_Tools/write_large_file.py split /tmp/DOC-XX.md chunks/DOC-XX chapter .md

# 4. Verify
python3 ../../__Python_Tools/write_large_file.py verify chunks/DOC-XX

# 5. Compress back to FinishedWork
python3 ../../__Python_Tools/write_large_file.py compress /tmp/DOC-XX.md FinishedWork/DOC-XX_*.md.gz

# 6. Update master index
python3 update_master_index.py  # (for that doc)

# 7. Git commit
git add chunks/DOC-XX/ FinishedWork/DOC-XX_*.md.gz chunks/MASTER_INDEX.json
git commit -m "remediation: DOC-XX quality gates - formulas/conflation"
```

---

## TRACKING

| Task | Document | Status | Assigned | Completed |
|------|----------|--------|----------|-----------|
| A1 | DOC-06 | ⬜ Pending | | |
| A2 | DOC-07 | ⬜ Pending | | |
| A3 | DOC-08 | ⬜ Pending | | |
| A4 | DOC-09 | ⬜ Pending | | |
| A5 | DOC-10 | ⬜ Pending | | |
| A6 | DOC-21 | ⬜ Pending | | |
| A7 | DOC-22 | ⬜ Pending | | |
| A8 | DOC-23 | ⬜ Pending | | |
| A9 | DOC-24 | ⬜ Pending | | |
| A10 | DOC-25 | ⬜ Pending | | |
| A11 | DOC-26 | ⬜ Pending | | |
| A12 | DOC-27 | ⬜ Pending | | |
| A13 | DOC-28 | ⬜ Pending | | |
| A14 | DOC-29 | ⬜ Pending | | |
| A15 | DOC-33 | ⬜ Pending | | |
| A16 | DOC-34 | ⬜ Pending | | |
| A17 | DOC-31 | ⬜ Pending | | |
| A18 | DOC-42 | ⬜ Pending | | |
| A19 | DOC-44 | ⬜ Pending | | |
| A20 | DOC-46 | ⬜ Pending | | |
| A21 | DRAFT-01 | ⬜ Pending | | |
| A22 | DRAFT-02 | ⬜ Pending | | |
| A23 | DRAFT-03 | ⬜ Pending | | |
| A24 | DRAFT-04 | ⬜ Pending | | |
| A25 | DRAFT-05 | ⬜ Pending | | |
| A26 | MAT-01 | ⬜ Pending | | |
| A27 | MAT-02 | ⬜ Pending | | |
| A28 | MAT-03 | ⬜ Pending | | |
| A29 | MAT-04 | ⬜ Pending | | |
| A30 | SYNTH-01 | ⬜ Pending | | |
| A31 | SYNTH-02 | ⬜ Pending | | |
| A32 | SYNTH-03 | ⬜ Pending | | |
| B1 | DOC-02 | ⬜ Pending | | |
| B2 | DOC-11..18 | ⬜ Pending | | |
| B3 | DOC-19 | ⬜ Pending | | |
| B4 | DOC-20 | ⬜ Pending | | |
| C1 | DOC-48 chapters | ⬜ Pending | | |
| C2 | DOC-48 quality | ⬜ Pending | | |
| C3 | DOC-48 rechunk | ⬜ Pending | | |

---

## NEXT ACTIONS

1. **Immediate**: Begin TASK-A1 (DOC-06) — highest impact, core architecture
2. **Parallel**: TASK-B1 (DOC-02) — conflation cleanup is mechanical
3. **Parallel**: TASK-C1 (DOC-48) — author missing chapters
4. **Track**: Update this file with completion status per task

---

**Note**: This remediation addresses the quality gate gaps identified in the 2026-10-22 verification. The later documents (DOC-35..47) already pass and should not be modified unless regression is detected.
