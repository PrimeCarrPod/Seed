# DOC-12 Piece 07: Sleeve Architecture — RM-TG Edition
**Prime Step:** 19
**Document:** DOC-12_RenaissanceMan_TG_Specification
**Piece:** 07 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. Sleeve System Overview — RM-TG (DOC-04 §3.2, DRAFT-01 §3.3, CSMFAB078 Main §4.3)

### 1.1 Sleeve Panel Configuration (4 panels per arm × 2 arms = 8 panels)

| Panel | Region | Dimensions (mm) | Surface Type | Tile Count |
|-------|--------|-----------------|--------------|------------|
| P08 | Upper sleeve left | 380 × 510 | Convolute (Alcega Fig. 28) | 3 primary + 3 backup |
| P09 | Upper sleeve right | 380 × 510 | Convolute (mirror) | 3 primary + 3 backup |
| P10 | Lower sleeve left | 320 × 380 | Cylindrical (Alcega Fig. 30) | 3 primary + 3 backup |
| P11 | Lower sleeve right | 320 × 380 | Cylindrical (mirror) | 3 primary + 3 backup |
| **Per Arm** | | | | **6 primary + 6 backup** |
| **Total (Both Arms)** | | | | **12 primary + 12 backup** |

**RM-TG Specific:** Same panel count as RM-TS, but 50mm tiles (vs 25mm) → fewer tiles per panel, thicker stack

---

## 2. Sleeve Cap Geometry — Alcega Convolute Development (DRAFT-01 §3.3)

### 2.1 Directrix Curve (Armscye Profile)

**RM-TG Armscye Parameters (from Piece 02 anthropometrics):**
- Shoulder breadth: 51 cm → armscye width = 25.5 cm per side
- Chest: 120 cm → armscye depth = 23.75 cm (Garsault Ratio 3 = Stature/8)
- Scapular position: Z2 at 18cm from cervical

**Convolute Surface Equation:**
$$S(u,v) = \mathbf{c}(u) + v \cdot \mathbf{r}(u)$$

$$\mathbf{c}(u) = \begin{bmatrix} a \cos u \\ b \sin u \\ c u \end{bmatrix} \quad \text{(elliptical helix directrix)}$$

$$a = 127.5 \text{ mm}, \quad b = 118.75 \text{ mm}, \quad c = 15 \text{ mm/rad}$$

**Generatrix (Ruling):**
$$\mathbf{r}(u) = \frac{\mathbf{c}'(u) \times \mathbf{n}(u)}{\|\mathbf{c}'(u) \times \mathbf{n}(u)\|} \quad \text{where } \mathbf{n}(u) = \text{surface normal}$$

### 2.2 Flat Development (Zero Gaussian Curvature)

$$K = \frac{LN - M^2}{EG - F^2} = 0 \quad \text{(Developable condition satisfied)}$$

**Unfolded Dimensions:**
- Cap height: 180 mm (from shoulder to bicep)
- Cap width at bicep: 380 mm (matches P08/P09 width)
- Seam allowance: 15 mm each edge

---

## 3. Articulation Engineering — Protective Layer Continuity

### 3.1 Elbow Articulation Zone (P08/P09 → P10/P11 Join)

**Challenge:** Maintain L1-L12 continuity across 120° flexion with 50mm tiles

**Solution: Articulated Tile Segments + STF Hinge + MR Bladder**

| Layer | Articulation Method | RM-TG Spec |
|-------|---------------------|------------|
| L1 (YInMn Blue) | HVLP continuous spray | Overlap 10mm across seam |
| L2/L7 (Ceramic) | **Segmented 50mm tiles + flexible gasket** | 8mm gap, MXene gasket bridge |
| L3/L6 (MXene) | Thread continuity | Metallic thread carried through |
| L4 (FSS) | Embroidery bridge | Goldwork crosses elbow ±20mm |
| L5 (Aerogel) | Batting overlap | Silk batting 15mm overlap |
| L8/L9 (STF) | **Hinge zone + MR bladder** | STF φ=0.55 + MR at Z13/Z14 |
| L10 (Chassis) | Baleen channel continuous | Channel crosses elbow, no break |
| L11 (PVDF) | Sensor trace jumper | Conductive thread bridge |
| L12 (CoAl₂O₄) | Pad-cure continuous | Overlap 10mm |

### 3.2 STF Hinge Zone (L8/L9 Enhanced)

**STF Concentration Gradient (Full Coverage φ=0.55):**
$$\phi_{\text{STF}}(x) = 0.55 \quad \text{(uniform, no zone-selective reduction)}$$

**Force Reduction at Elbow (Flexion 120°):**
$$F_{\text{hinge}} = \int_{\text{hinge}} \tau_{\text{STF}}(\dot{\gamma}) dA \approx 12 \text{ N} \quad \text{(vs. 45 N without STF)}$$

### 3.3 MR Fluid Bladder at Elbow (Z13/Z14 Extension)

**Bladder Location:** Posterior elbow, integrated into sleeve cap articulation
**Volume:** 8 mL per side
**Activation:** Proportional to Z13/Z14 tension (side lower panel engagement)
**Force Contribution:** Additional 45 N support at full flexion

---

## 4. Sleeve-to-Body Attachment (DOC-05 §3.1, CSMFAB078-A §3.3)

### 4.1 LES Zone Integration

| Sleeve Zone | LES Zone | Tension (N) | Attachment Method |
|-------------|----------|-------------|-------------------|
| Sleeve head (cap) | Z1 (shoulder apex) | 66.2 | Doublet shoulder seam, 2 cleats |
| Upper sleeve lateral | Z9 (axillary) | 56.0 | Side gore lacing, 2 cleats |
| Cuff | Z12 (distal sleeve) | 40.7 | Cuff lacing, 2 cleats |

### 4.2 Detachable Sleeve Mechanism (Historical + Modern)

**Historical:** Points/laces at armscye (Alcega Fig. 28, Garsault)
**Modern:** Ti₃AlC₂ cleats + magnetic alignment

**Attachment Sequence:**
1. Align sleeve cap to armscye (magnetic guides ±0.1mm)
2. Engage Z1 cleats (shoulder apex) — 2 × Ti₃AlC₂
3. Engage Z9 cleats (axillary) — 2 × Ti₃AlC₂
4. Lace Z12 (cuff) — independent adjustment
5. LES auto-tension calibration (30s)

**Detachment Force:** $F_{\text{detach}} = 2 \times 76 \text{ N (mag)} + 2 \times 76 \text{ N} = 304 \text{ N}$ total

---

## 5. Protective Layer Stack — Sleeve Specific (RM-TG)

### 5.1 Thickness Profile (50mm tiles, full STF)

| Layer | Upper Sleeve (mm) | Lower Sleeve (mm) | Elbow Hinge (mm) |
|-------|-------------------|-------------------|------------------|
| L1 Coating | 0.02 | 0.02 | 0.02 |
| L2 Primary Ceramic | 8.0 | 8.0 | 0 (gap) |
| L3 MXene Warp | 0.4 | 0.4 | 0.4 |
| L4 FSS | 0.3 | 0.3 | 0.3 |
| L5 Aerogel | 5.0 | 5.0 | 6.0 (extra) |
| L6 MXene Weft | 0.4 | 0.4 | 0.4 |
| L7 Backup Ceramic | 4.0 | 4.0 | 0 (gap) |
| L8 STF Impact | 2.0 | 2.0 | 3.0 (enhanced) |
| L9 Base STF | 1.0 | 1.0 | 1.5 (enhanced) |
| L10 Chassis | 1.2 (baleen) | 0.6 (tape) | 1.8 (channel) |
| L11 PVDF | 0.25 | 0.25 | 0.25 |
| L12 Schumann | 0.01 | 0.01 | 0.01 |
| **TOTAL** | **22.58** | **22.08** | **13.28** |

### 5.2 Areal Density — Sleeve (RM-TG)

| Component | Upper (kg/m²) | Lower (kg/m²) |
|-----------|---------------|---------------|
| Ceramic (L2+L7) | 16.8 | 16.8 |
| MXene (L3+L6) | 0.3 | 0.3 |
| Aerogel (L5) | 0.08 | 0.08 |
| STF (L8+L9) | 0.71 | 0.71 |
| Chassis (L10) | 0.5 | 0.25 |
| Coatings (L1+L11+L12) | 0.13 | 0.13 |
| **Subtotal** | **18.52** | **18.27** |
| Base textile (silk/linen) | 1.2 | 1.0 |
| **TOTAL** | **19.72** | **19.27** |

---

## 6. Mass Budget — Sleeve Assembly (RM-TG)

| Component | Qty | Unit Mass | Total (kg) |
|-----------|-----|-----------|------------|
| Upper sleeve panels (2) | 2 | 1.45 | 2.90 |
| Lower sleeve panels (2) | 2 | 1.25 | 2.50 |
| Ceramic tiles (12 primary + 12 backup) | 24 | 46.4g / 5.8g | 0.63 |
| Baleen stays (4 per arm) | 8 | 65g | 0.52 |
| Steel boning (2 per arm) | 4 | 75g | 0.30 |
| Lacing/cleats (Z1, Z9, Z12) | 12 | 4g | 0.05 |
| STF impregnation | — | — | 0.25 |
| MR bladder (elbow) | 2 | 15g | 0.03 |
| **TOTAL SLEEVES (pair)** | | | **7.18 kg** |

**Validated vs. DOC-01 §9.1:** Included in L2 (10.2) + L7 (5.4) + L10 (3.85) allocation

---

## 7. Cross-References

| Ref | Document | Section | Key Data |
|-----|----------|---------|----------|
| [1] | DOC-01 | §2.1, §3.2, §9.1 | Layer stack, lacing, mass budget |
| [2] | DOC-04 | §3.2, §3.3 | Geometric kernel, sleeve development |
| [3] | DOC-05 | §1, §3, §9 | Chassis, LES zones, mass |
| [4] | DOC-11 | P07, P09 | RM-TS baseline, transition |
| [5] | MAT-03 | §3.1, §3.2 | Tile alignment, gasket |
| [6] | MAT-04 | §4.2, §5.1 | Cross-property, calibration |
| [7] | CSMFAB078 Main | §4.2, §4.3, §4.7 | Tile chassis, lacing, deployment |
| [8] | CSMFAB078-A | §3.3, §3.4 | LES 12-zone, edition transition |
| [9] | DRAFT-01 | §3.3 | Sleeve convolute development |
| [10] | DRAFT-02 | §4.1 | Garsault sleeve proportions |
| [11] | Research Doc 2 | §6.3, §6.5 | 3D sewing, robotic assembly |

---

## 8. Formulas Summary — Piece 07

1. **Convolute Directrix:** $\mathbf{c}(u) = [a\cos u, b\sin u, cu]^T$, $a=127.5, b=118.75, c=15$
2. **Generatrix:** $\mathbf{r}(u) = \mathbf{c}'(u) \times \mathbf{n}(u) / \|\cdot\|$
3. **Developable Condition:** $K = (LN - M^2)/(EG - F^2) = 0$
4. **STF Uniform:** $\phi_{\text{STF}} = 0.55$ (no zone-selective reduction)
5. **Hinge Force:** $F_{\text{hinge}} \approx 12 \text{ N}$ (vs 45 N baseline)
6. **MR Bladder Force:** 45 N additional at elbow
7. **Detachment Force:** $F_{\text{detach}} = 304 \text{ N}$ (4 magnetic cleats)
8. **Thickness Profile:** Upper 22.58mm, Lower 22.08mm, Elbow 13.28mm
9. **Areal Density:** Upper 19.72 kg/m², Lower 19.27 kg/m²
10. **Sleeve Mass:** 7.18 kg/pair (validated)

**Piece 07 Formula Count:** 10 (target ≥2 per piece ✓)  
**Piece 07 Cross-Refs:** 11 (target ≥1 per piece ✓)  
**Piece 07 Standards:** CIETA, ASTM C1423, ASTM D4935, ISO 15858, MIL-STD-461G (target ≥1 per piece ✓)

---

*End of Piece 07 — Sleeve Architecture*  
*Next: Piece 08 (Prime 23) — Protective Layer Stack (RM-TG 12-Layer)*

(End of file - ~200 lines)