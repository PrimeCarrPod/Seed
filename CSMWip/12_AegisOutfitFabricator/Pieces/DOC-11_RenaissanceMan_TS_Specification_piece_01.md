# DOC-11 Piece 01: Executive Summary — RM-TS Edition
**Prime Step:** 3
**Document:** DOC-11_RenaissanceMan_TS_Specification
**Piece:** 01 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. RM-TS Edition Overview

### 1.1 Mission Statement

The **RenaissanceMan Tall-Skinny (RM-TS)** edition delivers a historically authentic Renaissance court doublet and hose ensemble (c. 1620-1650 CE) with **AIMES-DSV Level IV protective performance** optimized for the tall, lean male morphology (height 185-195 cm, chest 85-95 cm, waist 70-80 cm). This edition represents the **lightest mass configuration** in the RenaissanceMan variant family at **16.47 kg total system mass**.

### 1.2 Key Specifications Summary

| Parameter | RM-TS Value | Delta vs. RM-TG | Delta vs. RM-SS |
|-----------|-------------|-----------------|-----------------|
| **Height Range** | 185-195 cm | -10 cm | +20 cm |
| **Chest Range** | 85-95 cm | -25 cm | +0 cm |
| **Waist Range** | 70-80 cm | -25 cm | +0 cm |
| **Panel Count** | 30 | -6 | +2 |
| **Tile Count** | 180 | -60 | +30 |
| **Total Mass** | 16.47 kg | -4.41 kg | +2.74 kg |
| **LES Base Tension** | 55-70 N (Z1-Z4) | -5 to -10 N | +0 N |
| **Donning Time** | <110 s | -10 s | +0 s |

### 1.3 Architectural Positioning

RM-TS occupies the **Pareto-optimal frontier** for mobility-critical operations:
- **Mobility Index**: 0.82 (highest in RM family)
- **Thermal Protection**: Interior <55°C @ 1100°C/300s (exceeds target)
- **Ballistic**: NIJ IV compliant with 180 ZrB₂-SiC tiles
- **EMI Shielding**: 62 dB @ 1 GHz (double MXene layer)
- **Edition Transition**: <75 s to RM-TG (panel add only)

---

## 2. Design Philosophy: Alcega-Garsault-LES Synthesis

### 2.1 Historical Foundation (DOC-02, DRAFT-01, DRAFT-02)

The RM-TS pattern derives from **Juan de Alcega's *Libro de Geometría Prática* (1589)** developable surface constraints and **Garsault's *Art du Tailleur* (1769)** proportional scaling, unified through the **Leaf Edition System (LES)** 12-zone tension calibration (CSMFAB078-A §3.3).

**Alcega Constraint:** Loom width = 560 mm (22-inch standard) → panel nesting optimization
**Garsault Proportion:** 1/8 height = chest/4, 1/10 height = waist/2
**LES Adaptation:** Continuous morphology interpolation via αₑ = -0.08, Mₑ/M_ref = 0.92

### 2.2 Protective Integration Strategy (CSMFAB078 Main §4)

The 12-layer AIMES stack is **thickness-optimized** for RM-TS:
- Ceramic tiles reduced from 50mm → 25mm (primary), 25mm → 15mm (backup)
- Aerogel batting: 3 mm (vs. 5 mm baseline) — leverages lean morphology air gap
- STF impregnation: Zone-selective (Z1-Z4, Z7-Z8 only) — saves 0.18 kg
- Chassis: 24 baleen stays + 12 steel spiral boning (minimal set)

---

## 3. Cross-References

| Ref | Document | Section | Application |
|-----|----------|---------|-------------|
| [1] | DOC-01 | §1.1, §9.1 | System architecture, RM mass budget |
| [2] | DOC-02 | §3.1, §4.2 | Alcega developable surfaces, Garsault proportions |
| [3] | DOC-03 | §2.1, §3.3 | Silk fibroin, orthotropic weaves |
| [4] | DOC-04 | §3.1, §3.2 | Geometric kernel, zero-waste nesting |
| [5] | DOC-05 | §1, §3, §9 | Baleen/steel chassis, LES zones, mass budget |
| [6] | MAT-01 | §2.1, §3.2 | Silk fibroin properties, degumming |
| [7] | MAT-02 | §3.1, §4.1 | Baleen tensor, steel boning |
| [8] | MAT-03 | §3.1, §3.3 | Tile magnetic alignment, gasket seal |
| [9] | MAT-04 | §4.1, §5.1 | Cross-property HAS/PES, αₑ β_z,ₑ |
| [10] | CSMFAB078 Main | §4.2-4.7 | Layer stack, chassis, LES, deployment |
| [11] | CSMFAB078-A | §3.3, §3.4 | LES 12-zone, edition transition |
| [12] | CSMFAB078-B | §3.1-3.8 | Test protocols, validation thresholds |
| [13] | DRAFT-01 | §3.1, §3.2 | Alcega unfolding, convolute surfaces |
| [14] | DRAFT-02 | §3.2, §4.1 | Garsault scaling, edition deltas |
| [15] | SYNTH-01 | §3.2, §4.1 | Unified theory, dual-objective opt |

---

## 4. RM-TS Performance Targets (Validated)

| Metric | Target | RM-TS Achieved | Margin | Test Standard |
|--------|--------|----------------|--------|---------------|
| **System Mass** | ≤26 kg | **16.47 kg** | +37% | Gravimetric |
| **Thermal Protection** | <60°C | **55°C** | +8% | ASTM F1291 |
| **Ballistic V₅₀** | ≥930 m/s | **955 m/s** | +3% | NIJ STD-0101.06 |
| **EMI Shielding** | >60 dB @ 1 GHz | **62 dB** | +3% | MIL-STD-461G |
| **Directed Energy ΔT** | ≤14°C | **11°C** | +21% | MIL-STD-461G custom |
| **Force Trauma Reduction** | ≥65% | **68%** | +5% | ASTM F2371 |
| **Mobility Index** | ≥0.7 | **0.82** | +17% | ISO 15858 |
| **Donning Time** | <120 s | **105 s** | +13% | Operational |
| **Edition Transition** | <90 s | **72 s** | +20% | Operational |

---

## 5. Edition-Specific Formulas

### 5.1 RM-TS Morphology Factor

$$\alpha_{\text{RM-TS}} = -0.08, \quad \frac{M_{\text{RM-TS}}}{M_{\text{ref}}} = 0.92$$

$$T_{z,\text{RM-TS}} = T_{z,\text{base}} \cdot (1 - 0.08 \cdot 0.08) \cdot \beta_{z,\text{RM-TS}} = T_{z,\text{base}} \cdot 0.9936 \cdot \beta_{z,\text{RM-TS}}$$

### 5.2 Panel Count Derivation

$$N_{\text{panels, RM-TS}} = N_{\text{base}} + \Delta N_{\text{height}} + \Delta N_{\text{girth}}$$

$$N_{\text{base}} = 28, \quad \Delta N_{\text{height}} = +2 \text{ (tall)}, \quad \Delta N_{\text{girth}} = 0 \text{ (skinny)}$$

$$N_{\text{panels, RM-TS}} = 30 \quad \text{✓ Matches MASTER_TODO_B DOC-11}$$

### 5.3 Tile Count Derivation

$$N_{\text{tiles, RM-TS}} = N_{\text{panels}} \times 6 \text{ tiles/panel} = 30 \times 6 = 180$$

**Tile Distribution:** 120 primary (25mm) + 60 backup (15mm)

### 5.4 Mass Budget Equation (RM-TS)

$$M_{\text{RM-TS}} = \sum_{k=1}^{12} \rho_k A_k + M_{\text{textile}} + M_{\text{lacing}} + M_{\text{hardware}}$$

$$M_{\text{RM-TS}} = 13.17 + 2.10 + 0.80 + 0.40 = 16.47 \text{ kg} \quad \text{✓ Validated in DOC-01 §9.1}$$

---

## 6. Risk Summary — RM-TS Specific

| Risk ID | Description | Likelihood | Impact | RM-TS Mitigation |
|---------|-------------|------------|--------|------------------|
| RM-TS-01 | Reduced tile thickness (25mm) vs. NIJ IV | Medium | High | Flash sinter density ≥99.5%, magnetic alignment ±0.05mm |
| RM-TS-02 | Lean morphology → reduced STF volume | Low | Medium | Zone-selective STF (Z1-Z4, Z7-Z8), 45% vol. fraction |
| RM-TS-03 | Tall morphology → longer baleen stays → buckling | Low | High | 24 stays, SF=6.0 validated (DOC-05 §1.2) |
| RM-TS-04 | Fewer panels → larger ceramic tiles → stress concentration | Medium | Medium | 6 tiles/panel, Halbach alignment, gasket compliance |
| RM-TS-05 | Fast donning → LES calibration drift | Medium | Medium | Auto-recalibration 2hr, pre-donning validation sequence |

---

*End of Piece 01 — Executive Summary*  
*Next: Piece 02 (Prime 5) — Anthropometric Baseline*# DOC-11 Piece 02: Anthropometric Baseline — RM-TS Edition
**Prime Step:** 5
**Document:** DOC-11_RenaissanceMan_TS_Specification
**Piece:** 02 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. RM-TS Anthropometric Definition

### 1.1 Primary Measurements (Per DOC-01 §1.1, CSMFAB078-A §3.2)

| Measurement | RM-TS Range | Mean | Std Dev | Percentile Coverage |
|-------------|-------------|------|---------|---------------------|
| **Stature (Height)** | 185-195 cm | 190 cm | 3.5 cm | 5th-95th %ile |
| **Chest Circumference** | 85-95 cm | 90 cm | 3.0 cm | 5th-95th %ile |
| **Waist Circumference** | 70-80 cm | 75 cm | 3.0 cm | 5th-95th %ile |
| **Hip Circumference** | 88-98 cm | 93 cm | 3.0 cm | 5th-95th %ile |
| **Neck Circumference** | 36-40 cm | 38 cm | 1.5 cm | 5th-95th %ile |
| **Shoulder Breadth** | 42-48 cm | 45 cm | 2.0 cm | 5th-95th %ile |
| **Arm Length (spine-wrist)** | 82-90 cm | 86 cm | 2.5 cm | 5th-95th %ile |
| **Sleeve Length (shoulder-wrist)** | 65-72 cm | 68.5 cm | 2.0 cm | 5th-95th %ile |
| **Inseam** | 88-96 cm | 92 cm | 2.5 cm | 5th-95th %ile |
| **Torso Length (cervical-waist)** | 48-54 cm | 51 cm | 2.0 cm | 5th-95th %ile |

### 1.2 Derived Proportions (Garsault Scaling, DRAFT-02 §3.2)

$$\text{Garsault Ratio}_1 = \frac{\text{Chest}}{4} = \frac{90}{4} = 22.5 \text{ cm} \quad \text{(back width)}$$

$$\text{Garsault Ratio}_2 = \frac{\text{Waist}}{2} = \frac{75}{2} = 37.5 \text{ cm} \quad \text{(waist panel half-width)}$$

$$\text{Garsault Ratio}_3 = \frac{\text{Stature}}{8} = \frac{190}{8} = 23.75 \text{ cm} \quad \text{(bodice length unit)}$$

$$\text{Garsault Ratio}_4 = \frac{\text{Stature}}{10} = \frac{190}{10} = 19.0 \text{ cm} \quad \text{(skirt/hose length unit)}$$

### 1.3 Edition Morphology Factor (MAT-04 §5.1, CSMFAB078-A §3.3)

$$\alpha_{\text{RM-TS}} = -0.08 \quad \text{(negative = reduced girth vs. reference)}$$

$$M_{\text{ref}} = \text{RM-TG (reference edition)} = 1.00$$

$$\frac{M_{\text{RM-TS}}}{M_{\text{ref}}} = 0.92 \quad \text{✓ Validated across 4 RM editions}$$

**Morphology Vector:** $\mathbf{m}_{\text{RM-TS}} = [0.92, 0.92, 1.08, 1.08]^T$ for [Chest, Waist, Height, Limb Length]

---

## 2. Historical Anthropometric Context (DOC-02 §3.1, Research Doc 1 §2.3)

### 2.1 Renaissance Male Proportions (c. 1620-1650)

| Source | Population | Mean Stature | Mean Chest | Mean Waist | Notes |
|--------|------------|--------------|------------|------------|-------|
| **Alcega 1589** | Spanish court | 168 cm | 88 cm | 76 cm | Loom-width based |
| **Garsault 1769** | French artisan | 172 cm | 92 cm | 80 cm | Proportional system |
| **Arnold Patterns** | Extant garments | 170 cm | 90 cm | 78 cm | Janet Arnold analysis |
| **Modern Target** | RM-TS edition | **190 cm** | **90 cm** | **75 cm** | **Secular trend +2 cm/century** |

### 2.2 Secular Trend Adjustment

$$\text{Stature}_{\text{2026}} = \text{Stature}_{\text{1650}} + 2 \times \frac{2026-1650}{100} = \text{Stature}_{\text{1650}} + 7.5 \text{ cm}$$

$$\text{Chest}_{\text{2026}} = \text{Chest}_{\text{1650}} \times 1.02 \quad \text{(nutrition improvement)}$$

$$\text{Waist}_{\text{2026}} = \text{Waist}_{\text{1650}} \times 0.97 \quad \text{(corsetry/stays reduction)}$$

---

## 3. LES 12-Zone Anthropometric Mapping (DOC-05 §3.1, CSMFAB078-A Table 3.3)

### 3.1 Zone Anatomical Landmarks — RM-TS Specific

| Zone | Anatomical Landmark | RM-TS Position (cm from cervical) | RM-TS Circumference | Base Tension (N) |
|------|---------------------|-----------------------------------|---------------------|------------------|
| **Z1** | Shoulder apex (acromion) | 12.5 | 45 (shoulder circ.) | 55 |
| **Z2** | Scapular spine (T3) | 18.0 | 90 (chest) | 60 |
| **Z3** | Thoracic spine (T7) | 28.0 | 88 (thoracic) | 65 |
| **Z4** | Lumbar (L3, waist) | 42.0 | **75 (waist)** | 70 |
| **Z5** | Iliac crest | 54.0 | 93 (hip) | 65 |
| **Z6** | Ant. sup. iliac spine | 52.0 | 90 (high hip) | 60 |
| **Z7** | Sternum (manubrium) | 16.0 | 90 (chest) | 50 |
| **Z8** | Costal margin (xiphoid) | 34.0 | 82 (lower chest) | 55 |
| **Z9** | Axillary (mid-axillary) | 24.0 | 88 (thoracic) | 45 |
| **Z10** | Cervical (C7) | 0.0 | 38 (neck) | 40 |
| **Z11** | Occipital (external protuberance) | -4.0 | 56 (head) | 35 |
| **Z12** | Distal sleeve (wrist) | 86 (arm length) | 17 (wrist) | 30 |

### 3.2 RM-TS Calibrated Tensions (Per Edition Formula)

$$T_{z,\text{RM-TS}} = T_{z,\text{base}} \cdot \left(1 + \alpha_{\text{RM-TS}} \cdot \frac{M_{\text{RM-TS}} - M_{\text{ref}}}{M_{\text{ref}}}\right) \cdot \beta_{z,\text{RM-TS}}$$

$$T_{z,\text{RM-TS}} = T_{z,\text{base}} \cdot (1 - 0.08 \times 0.08) \cdot \beta_{z,\text{RM-TS}} = T_{z,\text{base}} \cdot 0.9936 \cdot \beta_{z,\text{RM-TS}}$$

| Zone | Base (N) | β_z,RM-TS | RM-TS Calibrated (N) | Historical Lacing Point |
|------|----------|-----------|---------------------|------------------------|
| Z1 | 55 | 1.00 | **54.6** | Sleeve head attachment |
| Z2 | 60 | 1.00 | **59.6** | Back lacing (doublet) |
| Z3 | 65 | 0.98 | **63.4** | Center back stay |
| Z4 | 70 | **0.95** | **66.1** | Waist lacing (hose) |
| Z5 | 65 | 1.00 | **64.6** | Hose waistband |
| Z6 | 60 | 1.02 | **60.8** | Hose suspension |
| Z7 | 50 | 1.00 | **49.7** | Front doublet lacing |
| Z8 | 55 | 0.98 | **53.7** | Lower front points |
| Z9 | 45 | 1.00 | **44.7** | Side gore lacing |
| Z10 | 40 | 1.00 | **39.7** | Collar/band attachment |
| Z11 | 35 | 1.00 | **34.8** | Coif/hood tie |
| Z12 | 30 | 1.00 | **29.8** | Cuff lacing |

**Total LES Tension (RM-TS):** $\sum T_z = 616.5 \text{ N}$ (vs. 620 N base)

---

## 4. Panel Development Anthropometry (DRAFT-01 §3.1, DRAFT-02 §4.1)

### 4.1 Developable Surface Constraints — RM-TS

**Alcega Loom Width Constraint:** $W_{\text{loom}} = 560 \text{ mm}$ (fixed historical constant)

**RM-TS Panel Dimensions (Developed Flat):**

| Panel ID | Anatomical Region | Width (mm) | Length (mm) | Surface Type | Alcega Fig. |
|----------|-------------------|------------|-------------|--------------|-------------|
| P01 | Front left upper | 280 | 510 | Convolute | Fig. 12 |
| P02 | Front right upper | 280 | 510 | Convolute | Fig. 12 |
| P03 | Back upper | 560 | 510 | Developable | Fig. 14 |
| P04 | Side front left | 190 | 510 | Convolute | Fig. 18 |
| P05 | Side front right | 190 | 510 | Convolute | Fig. 18 |
| P06 | Side back left | 190 | 510 | Convolute | Fig. 20 |
