# DOC-11 Framework: RenaissanceMan Tall-Skinny (RM-TS) Edition Specification
**Document ID:** DOC-11
**Prime Step:** 2
**Project:** AegisOutfitFabricator
**Branch:** kilo/aegis-outfit-fabricator-wip
**Target Pieces:** 17 (prime-tracked)
**Lines per Piece:** ~200 max
**Total Target Lines:** ~3400

---

## 1. DOCUMENT STRUCTURE SPECIFICATION

### 1.1 Required Sections (17 pieces mapped to prime steps)

| Piece | Prime | Section | Content Focus | Est. Lines |
|-------|-------|---------|---------------|------------|
| 01 | 3 | Executive Summary | RM-TS overview, mission, key specs | 200 |
| 02 | 5 | Anthropometric Baseline | TS morphology, measurements, proportions | 200 |
| 03 | 7 | Panel Geometry Overview | 30 panels, layout, developable surfaces | 200 |
| 04 | 11 | Tile Count & Distribution | 180 tiles, magnetic alignment, Halbach | 200 |
| 05 | 13 | Lacing Topology | 12-zone LES, Dyneema-silk routing | 200 |
| 06 | 17 | Chassis Integration | Baleen/steel hybrid, 2.80 kg budget | 200 |
| 07 | 19 | Farthingale/Pannier | N/A for RM (stays only) | 200 |
| 08 | 23 | Sleeve Architecture | Detachable, protective integration | 200 |
| 09 | 29 | Watteau Back | N/A for RM (RW only) | 200 |
| 10 | 31 | Protective Layer Stack | 12-layer RM-TS specific | 200 |
| 11 | 37 | Thermal Management | Aerogel, NIR coating, YInMn Blue | 200 |
| 12 | 41 | EMI Shielding | MXene warp/weft, fractal FSS | 200 |
| 13 | 43 | Ballistic Protection | ZrB₂-SiC primary + backup tiles | 200 |
| 14 | 47 | Force Trauma | STF layers, MR fluid bladder | 200 |
| 15 | 53 | Mass Budget Detail | 16.47 kg validated breakdown | 200 |
| 16 | 59 | Quality Gates | Fit, protection, authenticity metrics | 200 |
| 17 | 61 | Traceability & Risk | Cross-refs, risk register SF-01..05 | 200 |

### 1.2 Prime Step Mapping for Pipeline Actions

| Pipeline Stage | Prime Range | Actions |
|----------------|-------------|---------|
| Framework Creation | 2 | Write framework file |
| Authoring | 3-61 | Write 17 pieces to FinishedWork/ |
| Split | 67-97 | Split into 17 pieces via gh_split_file |
| Verify | 101-127 | Reassembly diff = 0 bytes |
| Package | 131-151 | Zip + GitHub push + 17-way verify |
| Heartbeat | 157 | Log completion |

---

## 2. TECHNICAL CONTENT SPECIFICATION

### 2.1 RM-TS Key Parameters (from DOC-01, DOC-05, MASTER_TODO_B)

| Parameter | Value | Source |
|-----------|-------|--------|
| Height | 185-195 cm | DOC-01 Table 1.1 |
| Chest | 85-95 cm | DOC-01 Table 1.1 |
| Waist | 70-80 cm | DOC-01 Table 1.1 |
| Panel Count | 30 | MASTER_TODO_B DOC-11 |
| Tile Count | 180 | MASTER_TODO_B DOC-11 |
| Target Mass | 16.47 kg | DOC-01 Table 9.1 |
| LES Zones | 12 | DOC-05 Table 3.1 |
| Baleen Stays | 24 | DOC-05 Table 9 |

### 2.2 Required Cross-References (minimum 10)

- DOC-01 (System Architecture, Layer Stack, Mass Budget)
- DOC-02 (Historical Context, Alcega/Garsault)
- DOC-03 (Material Systems, Silk Fibroin)
- DOC-04 (Geometric Patterns, Alcega Engine)
- DOC-05 (Structural Framework, Baleen/Steel)
- MAT-01 (Silk Fibroin Engineering)
- MAT-02 (Structural Foundation Materials)
- MAT-03 (Protective Layer Integration)
- MAT-04 (Cross-Property Validation)
- CSMFAB078 Main (§4.2, §4.3, §4.4, §4.5, §4.7)
- CSMFAB078-A (§3.3 LES, §3.4 Deployment)
- CSMFAB078-B (§3 Test Protocols)
- DRAFT-01 (Alcega Developable Surface)
- DRAFT-02 (Garsault Proportional Scaling)
- DRAFT-04 (Farthingale/Pannier - for comparison)
- SYNTH-01 (Unified Theory)

### 2.3 Required Formulas (minimum 15)

1. Panel geometry: developable surface unfolding
2. Tile magnetic alignment force (Halbach)
3. LES tension calibration per zone
4. Baleen Euler buckling (RM-TS specific)
5. Spiral steel spring rate
6. Thermal resistance stack (RM-TS)
7. EMI SE double-layer (RM-TS)
8. Ballistic V₅₀ ceramic tile
9. STF force reduction
10. Mass budget summation
11. HAS/PES Pareto for RM-TS
12. Aglet dielectric properties
13. Dyneema-silk lace tensile
14. Deployment dynamics
15. Risk mitigation formulas

### 2.4 Required Standards (minimum 5)

- CIETA (textile typology)
- ASTM D3822 (silk tensile)
- ASTM C1423 (ceramic)
- ASTM D4935 (EMI)
- NIJ STD-0101.06 (ballistic)
- ISO 15858 (ergonomics)
- MIL-STD-461G (EMI)

### 2.5 Zero Conflation Check

- No mixing RM-TS with RM-TG/SS/SG parameters
- No mixing RM with RW specifications
- Each formula tagged to RM-TS edition
- Clear edition boundaries in all tables

---

## 3. QUALITY GATES (Prime 3-61 Authoring)

### 3.1 Per-Piece Gates
- [ ] ≥ 150 lines (dense technical)
- [ ] ≥ 2 formulas per piece
- [ ] ≥ 1 cross-reference per piece
- [ ] ≥ 1 standard cited per piece
- [ ] 0 conflation (RM-TS only)
- [ ] Prime step logged in header

### 3.2 Document Gates (Prime 67+)
- [ ] Total ≥ 300 lines
- [ ] Total ≥ 15 formulas
- [ ] Total ≥ 10 cross-refs
- [ ] Total ≥ 5 standards
- [ ] 0 conflation
- [ ] 17 pieces exactly
- [ ] Reassembly = 0 bytes diff

---

## 4. PRIME LOG TEMPLATE

Each piece file header must include:
```
# DOC-11 Piece XX: [Section Title]
**Prime Step:** [prime]
**Document:** DOC-11_RM-TS_Specification
**Piece:** XX of 17
**Status:** AUTHORED
```

---

## 5. NEXT ACTIONS (Prime Sequence)

1. **Prime 2** ✅ Framework created
2. **Prime 3** → Write Piece 01 (Executive Summary)
3. **Prime 5** → Write Piece 02 (Anthropometric Baseline)
... continue through Prime 61
4. **Prime 67** → worldline_split
5. **Prime 101** → worldline_verify
6. **Prime 131** → worldline_package
7. **Prime 157** → heartbeat

---

*Framework complete. Ready for prime-tracked authoring.*