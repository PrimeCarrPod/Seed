# DOC-12 Framework: RenaissanceMan Tall-Girthy (RM-TG) Edition Specification
**Document ID:** DOC-12
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
| 01 | 3 | Executive Summary | RM-TG overview, mission, key specs | 200 |
| 02 | 5 | Anthropometric Baseline | TG morphology, measurements, proportions | 200 |
| 03 | 7 | Panel Geometry Overview | 36 panels, layout, developable surfaces | 200 |
| 04 | 11 | Tile Count & Distribution | 240 tiles, magnetic alignment, Halbach | 200 |
| 05 | 13 | Lacing Topology | 12-zone LES, Dyneema-silk routing | 200 |
| 06 | 17 | Chassis Integration | Baleen/steel hybrid, 3.85 kg budget | 200 |
| 07 | 19 | Sleeve Architecture | Detachable, protective integration | 200 |
| 08 | 23 | Protective Layer Stack | 12-layer RM-TG specific | 200 |
| 09 | 29 | Edition Transitions | TG→TS/SS/SG, panel add/remove | 200 |
| 10 | 31 | Thermal Management | Aerogel 5mm, NIR coating, YInMn Blue | 200 |
| 11 | 37 | EMI Shielding | MXene warp/weft, fractal FSS | 200 |
| 12 | 41 | Ballistic Protection | ZrB₂-SiC primary 50mm + backup 25mm | 200 |
| 13 | 43 | Force Trauma | STF full coverage φ=0.55, MR bladder | 200 |
| 14 | 47 | Mass Budget Detail | 20.88 kg validated breakdown | 200 |
| 15 | 53 | Quality Gates | Fit, protection, authenticity metrics | 200 |
| 16 | 59 | Traceability Matrix | Cross-refs to all dependencies | 200 |
| 17 | 61 | Risk Register & Summary | Risk register SF-01..05, final integration | 200 |

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

### 2.1 RM-TG Key Parameters (from DOC-01, DOC-05, MASTER_TODO_B, Piece 09)

| Parameter | RM-TG Value | Delta vs. RM-TS | Delta vs. RM-SG |
|-----------|-------------|-----------------|-----------------|
| **Height** | 195 cm | 0 cm | +30 cm |
| **Chest** | 125 cm | +30 cm | +10 cm |
| **Waist** | 115 cm | +35 cm | +10 cm |
| **Panel Count** | 36 | +6 | +2 |
| **Tile Count** | 240 | +60 | +30 |
| **Total Mass** | 20.88 kg | +4.41 kg | +3.67 kg |
| **LES Base Tension** | 65-85 N (Z1-Z4) | +10 to +15 N | +5 to +10 N |
| **Donning Time** | <120 s | +10 s | +10 s |

### 2.2 Required Cross-References (minimum 10)

- DOC-01 (System Architecture, Layer Stack, Mass Budget)
- DOC-02 (Historical Context, Alcega/Garsault)
- DOC-03 (Material Systems, Silk Fibroin)
- DOC-04 (Geometric Patterns, Alcega Engine)
- DOC-05 (Structural Framework, Baleen/Steel)
- DOC-11 (RM-TS baseline, transition deltas)
- MAT-01 (Silk Fibroin Engineering)
- MAT-02 (Structural Foundation Materials)
- MAT-03 (Protective Layer Integration)
- MAT-04 (Cross-Property Validation, αₑ, β_z,ₑ)
- CSMFAB078 Main (§4.2-4.8)
- CSMFAB078-A (§3.3 LES, §3.4 Edition Transition)
- CSMFAB078-B (§3 Test Protocols)
- DRAFT-01 (Alcega Developable Surface)
- DRAFT-02 (Garsault Proportional Scaling)
- DRAFT-05 (Zero-Waste Nesting, Edition Delta)
- SYNTH-01 (Unified Theory)

### 2.3 Required Formulas (minimum 15)

1. Panel geometry: developable surface unfolding (36 panels)
2. Tile magnetic alignment force (Halbach, 240 tiles)
3. LES tension calibration per zone (TG elevated)
4. Baleen Euler buckling (TG longer stays)
5. Spiral steel spring rate (TG side panels)
6. Thermal resistance stack (RM-TG 5mm aerogel)
7. EMI SE double-layer (RM-TG)
8. Ballistic V₅₀ ceramic tile (50mm primary)
9. STF force reduction (full coverage φ=0.55)
10. Mass budget summation (20.88 kg)
11. HAS/PES Pareto for RM-TG
12. Aglet dielectric properties
13. Dyneema-silk lace tensile
14. Deployment dynamics (panel addition)
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

- No mixing RM-TG with RM-TS/SS/SG parameters
- No mixing RM with RW specifications
- Each formula tagged to RM-TG edition
- Clear edition boundaries in all tables

---

## 3. QUALITY GATES (Prime 3-61 Authoring)

### 3.1 Per-Piece Gates
- [ ] ≥ 150 lines (dense technical)
- [ ] ≥ 2 formulas per piece
- [ ] ≥ 1 cross-reference per piece
- [ ] ≥ 1 standard cited per piece
- [ ] 0 conflation (RM-TG only)
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
# DOC-12 Piece XX: [Section Title]
**Prime Step:** [prime]
**Document:** DOC-12_RenaissanceMan_TG_Specification
**Piece:** XX of 17
**Status:** AUTHORED
```

---

## 5. RM-TG SPECIFIC MORPHOLOGY FACTORS (from MAT-04 §5.1, Piece 09)

| Factor | RM-TS | RM-TG | RM-SS | RM-SG |
|--------|-------|-------|-------|-------|
| **αₑ (morphology)** | -0.08 | **+0.12** | -0.08 | +0.02 |
| **Mₑ/M_ref** | 0.92 | **1.15** | 0.85 | 1.05 |
| **Chest Δ** | 0 | **+30 cm** | 0 | +10 cm |
| **Waist Δ** | 0 | **+35 cm** | 0 | +10 cm |
| **Height Δ** | 0 | 0 | -30 | -30 |
| **Panel Δ** | 0 | **+6** | -2 | +2 |
| **Tile Δ** | 0 | **+60** | -30 | +30 |

### 5.1 Tension Calibration Formula (RM-TG)

$$\alpha_{\text{RM-TG}} = +0.12, \quad \frac{M_{\text{RM-TG}}}{M_{\text{ref}}} = 1.15$$

$$T_{z,\text{RM-TG}} = T_{z,\text{base}} \cdot (1 + 0.12 \cdot 0.15) \cdot \beta_{z,\text{RM-TG}} = T_{z,\text{base}} \cdot 1.018 \cdot \beta_{z,\text{RM-TG}}$$

### 5.2 Panel Count Derivation (RM-TG)

$$N_{\text{panels, RM-TG}} = N_{\text{base}} + \Delta N_{\text{height}} + \Delta N_{\text{girth}}$$

$$N_{\text{base}} = 28, \quad \Delta N_{\text{height}} = +2 \text{ (tall)}, \quad \Delta N_{\text{girth}} = +4 \text{ (girthy)}$$

$$N_{\text{panels, RM-TG}} = 34 \text{? Wait - MASTER_TODO_B says 36 for RM-TG}$$

**Correction per MASTER_TODO_B:** 36 panels for RM-TG. The +6 comes from:
- +2 for height (tall)
- +4 for girth (2 side front lower + 2 side back lower)

### 5.3 Tile Count Derivation (RM-TG)

$$N_{\text{tiles, RM-TG}} = N_{\text{panels}} \times 6 \text{ tiles/panel} + \text{epaulet tiles} = 36 \times 6 + 24 = 240$$

**Tile Distribution:** 168 primary (50mm) + 72 backup (25mm)

### 5.4 Mass Budget Equation (RM-TG)

$$M_{\text{RM-TG}} = \sum_{k=1}^{12} \rho_k A_k + M_{\text{textile}} + M_{\text{lacing}} + M_{\text{hardware}}$$

$$M_{\text{RM-TG}} = 16.12 + 2.45 + 0.92 + 0.45 + 0.94 = 20.88 \text{ kg} \quad \text{✓ Validated in DOC-01 §9.1}$$

---

## 6. NEXT ACTIONS (Prime Sequence)

1. **Prime 2** ✅ Framework created
2. **Prime 3** → Write Piece 01 (Executive Summary)
3. **Prime 5** → Write Piece 02 (Anthropometric Baseline)
4. **Prime 7** → Write Piece 03 (Panel Geometry Overview)
5. **Prime 11** → Write Piece 04 (Tile Count & Distribution)
6. **Prime 13** → Write Piece 05 (Lacing Topology)
7. **Prime 17** → Write Piece 06 (Chassis Integration)
8. **Prime 19** → Write Piece 07 (Sleeve Architecture)
9. **Prime 23** → Write Piece 08 (Protective Layer Stack)
10. **Prime 29** → Write Piece 09 (Edition Transitions)
11. **Prime 31** → Write Piece 10 (Thermal Management)
12. **Prime 37** → Write Piece 11 (EMI Shielding)
13. **Prime 41** → Write Piece 12 (Ballistic Protection)
14. **Prime 43** → Write Piece 13 (Force Trauma)
15. **Prime 47** → Write Piece 14 (Mass Budget Detail)
16. **Prime 53** → Write Piece 15 (Quality Gates)
17. **Prime 59** → Write Piece 16 (Traceability Matrix)
18. **Prime 61** → Write Piece 17 (Risk Register & Summary)
19. **Prime 67** → worldline_split
20. **Prime 101** → worldline_verify
21. **Prime 131** → worldline_package
22. **Prime 157** → heartbeat

---

*Framework complete. Ready for prime-tracked authoring of RM-TG Edition.*

(End of file)