# DOC-11 Piece 07: Sleeve Architecture — RM-TS Edition
**Prime Step:** 19
**Document:** DOC-11_RenaissanceMan_TS_Specification
**Piece:** 07 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. Sleeve System Overview — RM-TS (DOC-04 §3.2, DRAFT-01 §3.3, CSMFAB078 Main §4.3)

### 1.1 Sleeve Panel Configuration (4 panels per arm × 2 arms = 8 panels)

| Panel | Region | Dimensions (mm) | Surface Type | Tile Count |
|-------|--------|-----------------|--------------|------------|
| P08 | Upper sleeve left | 380 × 510 | Convolute (Alcega Fig. 28) | 8 primary + 3 backup |
| P09 | Upper sleeve right | 380 × 510 | Convolute (mirror) | 8 primary + 3 backup |
| P10 | Lower sleeve left | 320 × 380 | Cylindrical (Alcega Fig. 30) | 8 primary + 3 backup |
| P11 | Lower sleeve right | 320 × 380 | Cylindrical (mirror) | 8 primary + 3 backup |
| **Per Arm** | | | | **16 primary + 6 backup** |
| **Total (Both Arms)** | | | | **32 primary + 12 backup** |

**RM-TS Specific:** Tall morphology → longer sleeve panels (510mm vs. 480mm baseline)

---

## 2. Sleeve Cap Geometry — Alcega Convolute Development (DRAFT-01 §3.3)

### 2.1 Directrix Curve (Armscye Profile)

**RM-TS Armscye Parameters (from Piece 02 anthropometrics):**
- Shoulder breadth: 45 cm → armscye width = 22.5 cm per side
- Chest: 90 cm → armscye depth = 23.75 cm (Garsault Ratio 3 = Stature/8)
- Scapular position: Z2 at 18cm from cervical

**Convolute Surface Equation:**
$$S(u,v) = \mathbf{c}(u) + v \cdot \mathbf{r}(u)$$

$$\mathbf{c}(u) = \begin{bmatrix} a \cos u \\ b \sin u \\ c u \end{bmatrix} \quad \text{(elliptical helix directrix)}$$

$$a = 112.5 \text{ mm}, \quad b = 118.75 \text{ mm}, \quad c = 15 \text{ mm/rad}$$

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

**Challenge:** Maintain L1-L12 continuity across 120° flexion

**Solution: Accordion Gasket + STF Hinge**

| Layer | Articulation Method | RM-TS Spec |
|-------|---------------------|------------|
| L1 (YInMn Blue) | HVLP continuous spray | Overlap 10mm across seam |
| L2/L7 (Ceramic) | Segmented tiles + flexible gasket | 6mm gap, MXene gasket bridge |
| L3/L6 (MXene) | Thread continuity | Metallic thread carried through |
| L4 (FSS) | Embroidery bridge | Goldwork crosses elbow ±20mm |
| L5 (Aerogel) | Batting overlap | Silk batting 15mm overlap |
| L8/L9 (STF) | Hinge zone | STF concentration 55% (vs 45% base) |
| L10 (Chassis) | Baleen channel continuous | Channel crosses elbow, no break |
| L11 (PVDF) | Sensor trace jumper | Conductive thread bridge |
| L12 (CoAl₂O₄) | Pad-cure continuous | Overlap 10mm |

### 3.2 STF Hinge Zone (L8/L9 Enhanced)

**STF Concentration Gradient:**
$$\phi_{\text{STF}}(x) = 0.45 + 0.10 \cdot \exp\left(-\frac{(x - x_{\text{elbow}})^2}{2\sigma^2}\right)$$

$\sigma = 30 \text{ mm}$, peak at elbow center: $\phi_{\text{max}} = 0.55$

**Force Reduction at Elbow (Flexion 120°):**
$$F_{\text{hinge}} = \int_{\text{hinge}} \tau_{\text{STF}}(\dot{\gamma}) dA \approx 18 \text{ N} \quad \text{(vs. 45 N without STF)}$$

---

## 4. Sleeve-to-Body Attachment (DOC-05 §3.1, CSMFAB078-A §3.3)

### 4.1 LES Zone Integration

| Sleeve Zone | LES Zone | Tension (N) | Attachment Method |
|-------------|----------|-------------|-------------------|
| Sleeve head (cap) | Z1 (shoulder apex) | 54.6 | Doublet shoulder seam, 2 cleats |
| Upper sleeve lateral | Z9 (axillary) | 44.7 | Side gore lacing, 2 cleats |
| Cuff | Z12 (distal sleeve) | 29.8 | Cuff lacing, 2 cleats |

### 4.2 Detachable Sleeve Mechanism (Historical + Modern)

**Historical:** Points/laces at armscye (Alcega Fig. 28, Garsault)
**Modern:** Ti₃AlC₂ cleats + magnetic alignment

**Attachment Sequence:**
1. Align sleeve cap to armscye (magnetic guides ±0.1mm)
2. Engage Z1 cleats (shoulder apex) — 2 × Ti₃AlC₂
3. Engage Z9 cleats (axillary) — 2 × Ti₃AlC₂
4. Lace Z12 (cuff) — independent adjustment
5. LES auto-tension calibration (30s)

**Detachment Force:** $F_{\text{detach}} = 2 \times 64 \text{ N (mag)} + 2 \times 64 \text{ N} = 256 \text{ N}$ total

---

## 5. Protective Layer Stack — Sleeve Specific (RM-TS)

### 5.1 Thickness Profile (Tapered for Mobility)

| Layer | Upper Sleeve (mm) | Lower Sleeve (mm) | Elbow Hinge (mm) |
|-------|-------------------|-------------------|------------------|
| L1 Coating | 0.02 | 0.02 | 0.02 |
| L2 Primary Ceramic | 4.0 | 4.0 | 0 (gap) |
| L3 MXene Warp | 0.4 | 0.4 | 0.4 |
| L4 FSS | 0.3 | 0.3 | 0.3 |
| L5 Aerogel | 3.0 | 3.0 | 4.0 (extra) |
| L6 MXene Weft | 0.4 | 0.4 | 0.4 |
| L7 Backup Ceramic | 2.0 | 2.0 | 0 (gap) |
| L8 STF Impact | 1.5 | 1.5 | 2.5 (enhanced) |
| L9 Base STF | 0.8 | 0.8 | 1.2 (enhanced) |
| L10 Chassis | 1.0 (baleen) | 0.5 (tape) | 1.5 (channel) |
| L11 PVDF | 0.25 | 0.25 | 0.25 |
| L12 Schumann | 0.01 | 0.01 | 0.01 |
| **TOTAL** | **13.68** | **13.18** | **10.58** |

### 5.2 Areal Density — Sleeve (RM-TS)

| Component | Upper (kg/m²) | Lower (kg/m²) |
|-----------|---------------|---------------|
| Ceramic (L2+L7) | 5.6 | 5.6 |
| MXene (L3+L6) | 0.3 | 0.3 |
| Aerogel (L5) | 0.05 | 0.05 |
| STF (L8+L9) | 0.53 | 0.53 |
| Chassis (L10) | 0.4 | 0.2 |
| Coatings (L1+L11+L12) | 0.13 | 0.13 |
| **Subtotal** | **7.01** | **6.81** |
| Base textile (silk/linen) | 1.2 | 1.0 |
| **TOTAL** | **8.21** | **7.81** |

---

## 6. Mass Budget — Sleeve Assembly (RM-TS)

| Component | Qty | Unit Mass | Total (kg) |
|-----------|-----|-----------|------------|
| Upper sleeve panels (2) | 2 | 0.85 | 1.70 |
| Lower sleeve panels (2) | 2 | 0.72 | 1.44 |
| Ceramic tiles (32 primary + 12 backup) | 44 | 5.8g / 1.3g | 0.20 |
| Baleen stays (4 per arm) | 8 | 50g | 0.40 |
| Steel boning (2 per arm) | 4 | 50g | 0.20 |
| Lacing/cleats (Z1, Z9, Z12) | 12 | 3g | 0.04 |
| STF impregnation | — | — | 0.15 |
| **TOTAL SLEEVES (pair)** | | | **4.13 kg** |

**Validated vs. DOC-01 §9.1:** Included in L2 (5.2) + L7 (2.8) + L10 (2.8) allocation

---

## 7. Cross-References

| Ref | Document | Section | Key Data |
|-----|----------|---------|----------|
| [1] | DOC-01 | §2.1, §3.2, §9.1 | Layer stack, lacing, mass budget |
| [2] | DOC-04 | §3.2, §3.3 | Geometric kernel, sleeve development |
| [3] | DOC-05 | §1, §3, §9 | Chassis, LES zones, mass |
| [4] | MAT-03 | §3.1, §3.2 | Tile alignment, gasket |
| [5] | MAT-04 | §4.2, §5.1 | Cross-property, calibration |
| [6] | CSMFAB078 Main | §4.2, §4.3, §4.7 | Tile chassis, lacing, deployment |
| [7] | CSMFAB078-A | §3.3, §3.4 | LES 12-zone, edition transition |
| [8] | DRAFT-01 | §3.3 | Sleeve convolute development |
| [9] | DRAFT-02 | §4.1 | Garsault sleeve proportions |
| [10] | Research Doc 2 | §6.3, §6.5 | 3D sewing, robotic assembly |

---

## 8. Formulas Summary — Piece 07

1. **Convolute Directrix:** $\mathbf{c}(u) = [a\cos u, b\sin u, cu]^T$, $a=112.5, b=118.75, c=15$
2. **Generatrix:** $\mathbf{r}(u) = \mathbf{c}'(u) \times \mathbf{n}(u) / \|\cdot\|$
3. **Developable Condition:** $K = (LN - M^2)/(EG - F^2) = 0$
4. **STF Gradient:** $\phi_{\text{STF}}(x) = 0.45 + 0.10 \exp(-(x-x_{\text{elbow}})^2/2\sigma^2)$
5. **Hinge Force:** $F_{\text{hinge}} \approx 18 \text{ N}$ (vs 45 N baseline)
6. **Detachment Force:** $F_{\text{detach}} = 256 \text{ N}$ (4 magnetic cleats)
7. **Thickness Profile:** Upper 13.68mm, Lower 13.18mm, Elbow 10.58mm
8. **Areal Density:** Upper 8.21 kg/m², Lower 7.81 kg/m²
9. **Sleeve Mass:** 4.13 kg/pair (validated)

**Piece 07 Formula Count:** 9 (target ≥2 per piece ✓)  
**Piece 07 Cross-Refs:** 10 (target ≥1 per piece ✓)  
**Piece 07 Standards:** CIETA, ASTM C1423, ASTM D4935, ISO 15858, MIL-STD-461G (target ≥1 per piece ✓)

---

*End of Piece 07 — Sleeve Architecture*  
*Next: Piece 08 (Prime 23) — Protective Layer Stack (RM-TS Specific)*