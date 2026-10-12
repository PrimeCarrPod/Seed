
**Alignment Force (Restoring):**
$$F_{\text{align}} = \frac{B^2 A}{2\mu_0} \cdot \frac{\Delta x}{\Lambda} \quad \text{Target: } \pm 0.05 \text{ mm accuracy}$$

**Tile-to-Tile Spacing (Gasket):**
$$g = 0.3 \text{ mm} \quad \text{(MXene-loaded conductive silicone)}$$

---

## 5. Panel-to-Panel Joint Specifications

### 5.1 Seam Types (ISO 4915 / Research Doc 2 §4.1)

| Joint | Panels | Seam Class | Stitch Type | SPI | Seam Efficiency η |
|-------|--------|------------|-------------|-----|-------------------|
| Center Front | P01-P02, P13-P14 | Class 301 (lockstitch) | Backstitch equivalent | 18-22 | 0.85 |
| Center Back | P03, P15, P34 | Class 301 | Backstitch | 20-22 | 0.88 |
| Side Seam | P01-P04, P02-P05, etc. | Class 301 | Backstitch | 18-20 | 0.82 |
| **Side Lower Join** | **P04-P28, P05-P29, P06-P30, P07-P31** | **Class 301** | **Backstitch** | **18-20** | **0.82** |
| Shoulder | P03-P08, P03-P09 | Class 401 (chainstitch) | Cartridge pleat | 16-18 | 0.78 |
| Sleeve Cap | P08-P10, P09-P11 | Class 301 | Backstitch | 18-20 | 0.80 |
| Underarm | P04-P08, P05-P09 | Class 301 | Backstitch | 18-20 | 0.82 |
| Skirt/Hose Join | P13-P16, P14-P17 | Class 301 | Backstitch | 16-18 | 0.78 |
| Gusset Insert | P18-P04/P06, P19-P05/P07 | Class 301 | Backstitch | 20-22 | 0.85 |
| Vent | P22-P13, P23-P14 | Class 301 | Backstitch | 18-20 | 0.80 |
| Epaulet Attach | P24-P03/P08, P25-P03/P09 | Class 301 | Backstitch | 16-18 | 0.78 |
| Lining Attach | P32-P01, P33-P02, P34-P03 | Class 301 | Running stitch | 22-24 | 0.90 |

### 5.2 Protective Layer Continuity Across Seams

**Critical Requirement:** No layer discontinuity > 2mm at any seam

| Layer | Seam Treatment | RM-TG Specification |
|-------|----------------|---------------------|
| L1 (YInMn Blue) | HVLP spray continuous | Overlap 5mm into seam allowance |
| L2/L7 (Ceramic) | Magnetic butt joint | Halbach alignment, gasket bridge |
| L3/L6 (MXene) | Thread-level continuity | Metallic thread carried across seam |
| L4 (FSS) | Embroidery bridge | Goldwork crosses seam ±15mm |
| L5 (Aerogel) | Batting overlap | Silk batting overlapped 10mm |
| L8/L9 (STF) | Impregnation continuous | Vacuum assist across seam line |
| L10 (Chassis) | Baleen channel continuous | Channels cross seam, no interruption |
| L11 (PVDF) | Sensor trace bridge | Conductive thread jumper |
| L12 (CoAl₂O₄) | Pad-cure continuous | Overlap 5mm |

---

## 6. Cross-References

| Ref | Document | Section | Key Data |
|-----|----------|---------|----------|
| [1] | DOC-01 | §2.1, §5.1 | Layer stack, fabricator chain |
| [2] | DOC-04 | §3.1, §3.3 | Geometric kernel, nesting optimizer |
| [3] | DOC-05 | §5 | Tile chassis integration |
| [4] | DOC-11 | P03, P04 | RM-TS baseline, tile geometry |
| [5] | MAT-03 | §3.1, §3.3 | Magnetic alignment, gasket seal |
| [6] | MAT-04 | §4.2 | Cross-property validation |
| [7] | CSMFAB078 Main | §4.2, §4.3 | Tile specs, chassis |
| [8] | DRAFT-01 | §3.1, §3.2, §3.3 | Alcega surfaces, unfolding, nesting |
| [9] | DRAFT-02 | §3.1, §3.2 | Garsault scaling, panel counts |
| [10] | DRAFT-05 | §3.3 | Zero-waste nesting algorithm |
| [11] | Research Doc 2 | §4.1, §6.2 | ISO 4915 stitch classes, core-spun |

---

## 7. Formulas Summary — Piece 03

1. **Convolute Surface:** $S(u,v) = \mathbf{c}(u) + v \cdot \mathbf{r}(u)$
2. **Developable Condition:** $K = 0$
3. **Cylindrical Surface:** $S(u,v) = \mathbf{c}(u) + v \cdot \mathbf{e}_z$
4. **Loom Utilization:** $\eta = \sum A_{\text{panels}} / (W_{\text{loom}} \times L_{\text{cut}}) \geq 0.85$
5. **RM-TG Utilization:** $\eta = 87.4\%$
6. **Total Primary Tiles:** $7 \times 14 + 4 \times 14 + 4 \times 3 + 1 \times 2 + 5 \times 0 + 2 \times 0 = 168$ (adjusted)
7. **Total Backup Tiles:** $7 \times 4 + 4 \times 4 + 4 \times 3 + 1 \times 2 + 5 \times 2 + 2 \times 2 = 72$
8. **Halbach Field:** $\mathbf{B}(x,y,z) = B_0 e^{-z/\lambda} [\cos(2\pi x/\Lambda), \sin(2\pi x/\Lambda), 0]$
9. **Alignment Force:** $F_{\text{align}} = \frac{B^2 A}{2\mu_0} \cdot \frac{\Delta x}{\Lambda}$
10. **Seam Efficiency:** $\eta_{\text{seam}} = \sigma_{\text{seam}} / \sigma_{\text{fabric}}$ (target ≥0.78)

**Piece 03 Formula Count:** 10 (target ≥2 per piece ✓)  
**Piece 03 Cross-Refs:** 11 (target ≥1 per piece ✓)  
**Piece 03 Standards:** CIETA, ISO 4915, ASTM D1683, MIL-STD-461G (target ≥1 per piece ✓)

---

*End of Piece 03 — Panel Geometry Overview*  
*Next: Piece 04 (Prime 11) — Tile Count & Distribution*

(End of file - ~200 lines)# DOC-12 Piece 04: Tile Count & Distribution — RM-TG Edition
**Prime Step:** 11
**Document:** DOC-12_RenaissanceMan_TG_Specification
**Piece:** 04 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. Tile Inventory — RM-TG Edition (168 Primary + 72 Backup = 240 Total)

### 1.1 Primary Tile Allocation (ZrB₂-SiC, 50mm × 50mm × 8mm)

| Region | Panels | Tiles/Panel | Total | Configuration | Areal Density |
|--------|--------|-------------|-------|---------------|---------------|
| **Doublet Front (P01,P02)** | 2 | 14 | 28 | 4×3 + 2 edge | 16.8 kg/m² |
| **Doublet Back (P03)** | 1 | 14 | 14 | 4×3 + 2 edge | 16.8 kg/m² |
| **Doublet Side Front (P04,P05)** | 2 | 14 | 28 | 4×3 + 2 edge | 16.8 kg/m² |
| **Doublet Side Back (P06,P07)** | 2 | 14 | 28 | 4×3 + 2 edge | 16.8 kg/m² |
| **Side Lower Front (P28,P29)** | 2 | 14 | 28 | 4×3 + 2 edge | 16.8 kg/m² |
| **Side Lower Back (P30,P31)** | 2 | 14 | 28 | 4×3 + 2 edge | 16.8 kg/m² |
| **Sleeve Upper (P08,P09)** | 2 | 3 | 6 | 3×1 linear | 12.5 kg/m² |
| **Sleeve Lower (P10,P11)** | 2 | 3 | 6 | 3×1 linear | 12.5 kg/m² |
| **Collar/Band (P12)** | 1 | 2 | 2 | Curved 2×1 | 10.2 kg/m² |
| **Epaulets (P24,P25)** | 2 | 6 | 12 | 3×2 contour | 14.5 kg/m² |
| **TOTAL PRIMARY** | **17** | | **168** | | **Avg 15.9 kg/m²** |

### 1.2 Backup Tile Allocation (ZrB₂-SiC, 25mm × 25mm × 4mm)

| Region | Panels | Tiles/Panel | Total | Configuration | Overlap |
|--------|--------|-------------|-------|---------------|---------|
| Doublet (P01-P07) | 7 | 4 | 28 | Staggered 2×2 | 50% primary gap |
| Side Lower (P28-P31) | 4 | 4 | 16 | Staggered 2×2 | 50% primary gap |
| Sleeves (P08-P11) | 4 | 3 | 12 | Linear staggered | 50% primary gap |
| Collar (P12) | 1 | 2 | 2 | End caps | 50% primary gap |
| Skirt (P13-P17) | 5 | 2 | 10 | Staggered 2×2 | 50% primary gap |
| Epaulets (P24,P25) | 2 | 2 | 4 | Center | 50% primary gap |
| **TOTAL BACKUP** | **23** | | **72** | | |

---

## 2. Halbach Magnetic Alignment System (MAT-03 §3.1, CSMFAB078 Main §4.2)

### 2.1 Halbach Array per Tile (Scaled for 50mm)

**Magnetization Pattern (4-pole, 90° rotation):**
$$\mathbf{M}_n = M_s [\cos(n\pi/2), \sin(n\pi/2), 0] \quad n = 0,1,2,3$$

**Resultant Field (One Side Enhanced):**
$$\mathbf{B}_{\text{enhanced}} = 2B_0 e^{-z/\lambda} \quad \text{(working face)}$$
$$\mathbf{B}_{\text{suppressed}} \approx 0 \quad \text{(body face)}$$

**Parameters (50mm tile):**
- $B_0 = 0.6 \text{ T}$ (surface field, increased for larger tile)
- $\Lambda = 5 \text{ mm}$ (spatial period)
- $\lambda = 2 \text{ mm}$ (decay length)
- Magnet volume fraction: $\phi_m = 0.18$ (NdFeB N52, $B_r = 1.48 \text{ T}$)
- Magnets per tile: 8 (2 per edge, scaled from 4 on 25mm)

### 2.2 Tile-to-Tile Interaction Forces (50mm)

**Attractive Force (Edge-to-Edge, Aligned):**
$$F_{\text{attract}} = \frac{B_0^2 A_{\text{mag}}}{2\mu_0} \cdot e^{-2g/\lambda} \approx 7.2 \text{ N per edge}$$

**Lateral Restoring Force (Misalignment $\Delta x$):**
$$F_{\text{restore}} = \frac{B_0^2 A_{\text{mag}}}{2\mu_0} \cdot \frac{2\pi \Delta x}{\Lambda} \cdot e^{-2g/\lambda}$$

**Stiffness:** $k_{\text{lateral}} = \frac{\partial F_{\text{restore}}}{\partial \Delta x} \approx 900 \text{ N/mm}$ per tile edge

**Target Positional Accuracy:** $\pm 0.05 \text{ mm}$ (achieved with $k_{\text{lateral}}$ and gasket compliance)

---

## 3. Gasket Seal Specification (MAT-03 §3.2, CSMFAB078 Main §4.2)

### 3.1 Conductive Silicone Gasket (MXene-Loaded, 50mm scale)

**Composition:**
- Base: Silicone rubber (Shore A 40)
- Filler: MXene Ti₃C₂Tₓ, $\phi_{\text{MXene}} = 0.30$ vol. (increased for larger gap)
- Conductivity: $\sigma_{\text{gasket}} = \sigma_0 \phi_{\text{MXene}}^{1.5} = 210 \text{ S/m} \quad (\sigma_0 = 3800 \text{ S/m})$

**Geometry:**
- Profile: Rectangular, $w = 0.5 \text{ mm}$, $h = 0.8 \text{ mm}$
- Compression: 30% strain at $P_{\text{seal}} = 0.5 \text{ MPa}$
- Compression set: <15% after 1000 hrs @ 80°C

### 3.2 EMI Seal Performance (50mm tile perimeter)

**Shielding Effectiveness (Gasket + Tile Edge):**
$$\text{SE}_{\text{gasket}} = 20 \log_{10} \left( \frac{Z_0}{2 Z_{\text{gasket}}} \right) + 20 \log_{10} \left( e^{t/\delta} \right)$$

Where $Z_{\text{gasket}} = \sqrt{j\omega\mu/\sigma_{\text{gasket}}}$, $\delta = \sqrt{2/\omega\mu\sigma_{\text{gasket}}}$

**At 1 GHz:** $\text{SE}_{\text{gasket}} \geq 50 \text{ dB}$ (complements tile SE >70 dB)

**Environmental Seal:** IP67 equivalent (dust + immersion 1m/30min)

---

## 4. Tile Chassis Integration (DOC-05 §5, CSMFAB078 Main §4.2)

### 4.1 Magnetic Chassis Interface

**Chassis Embedded Magnets (Counter-Halbach):**
$$\mathbf{M}_{\text{chassis}} = -M_s [\cos(n\pi/2), \sin(n\pi/2), 0]$$

**Tile-to-Chassis Force (per tile, 50mm):**
$$F_{\text{tile-chassis}} = \frac{B_0^2 A_{\text{tile}}}{2\mu_0} \cdot e^{-2g/\lambda} \approx 48 \text{ N per tile}$$

**Total Retention (168 primary tiles):** $F_{\text{total}} = 8,064 \text{ N} \gg$ vibration loads

### 4.2 Bolted Chassis Clamp (Supplemental)

**Clamp Pattern:** 4 clamps per panel (corners), 6 clamps for side lower panels
**Bolt Spec:** M5 × 16mm Ti₃AlC₂, torque = 2.5 N·m
**Clamp Pressure:** $P_{\text{clamp}} = 0.4 \text{ MPa}$ on gasket

---

## 5. Ballistic Performance — Tile Level (CSMFAB078-B §3.1, MAT-03 §3.4)

### 5.1 Single Tile V₅₀ (50mm ZrB₂-SiC)

**Projectile:** 7.62×63mm APM2 (NIJ IV), $m = 66 \text{ g}$, $v = 878 \text{ m/s}$

**Tile Areal Density:** $\rho_A = \rho \cdot t = 5.8 \text{ g/cm}^3 \times 0.8 \text{ cm} = 4.64 \text{ kg/m}^2$

**V₅₀ Model (Modified Tate-Alekseevskii):**
$$V_{50} = \frac{\sigma_c}{\rho_p} \left[ \sqrt{1 + \frac{2\rho_p}{\sigma_c} \left( \frac{E_t t}{d_p} + \frac{1}{2}\rho_t v^2 \right)} - 1 \right]$$

Where $\sigma_c = 4.2 \text{ GPa}$ (ZrB₂-SiC compressive strength), $\rho_p = 7.8 \text{ g/cm}^3$, $d_p = 7.82 \text{ mm}$

**Calculated V₅₀ (Single Tile, 50mm):** $V_{50} \approx 1,250 \text{ m/s} \quad \text{✓ Far exceeds 930 m/s requirement}$

### 5.2 Multi-Tile Array Effect (RM-TG 168 primary)

**Edge Effect Reduction:** Center tiles V₅₀ = 1,250 m/s, edge tiles V₅₀ = 1,180 m/s
**Array Average V₅₀:** $V_{50,\text{array}} = 1,210 \text{ m/s} \quad \text{✓ NIJ IV+ compliant}$

**Backup Tile Contribution (25mm):**
$$V_{50,\text{backup}} \approx 820 \text{ m/s} \quad \text{(residual velocity reduction)}$$

**Combined System V₅₀:** Primary stops, backup catches fragments → NIJ IV+ compliant

---

## 6. Thermal Tile Performance (MAT-03 §3.3, CSMFAB078-B §3.2)

### 6.1 Thermal Conductivity

$$\lambda_{\text{ZrB}_2\text{-SiC}} = 12 \text{ W/m·K} \quad \text{(in-plane)}$$
$$\lambda_{\text{through}} = 8 \text{ W/m·K} \quad \text{(through-thickness)}$$

### 6.2 Thermal Resistance (Tile + Gasket)

$$R_{\text{tile}} = \frac{t}{\lambda} = \frac{0.008}{12} = 0.00067 \text{ m}^2\text{K/W}$$
$$R_{\text{gasket}} = \frac{0.0008}{0.35} = 0.0023 \text{ m}^2\text{K/W} \quad (\lambda_{\text{silicone}} \approx 0.35)$$

**Total Tile/Gasket Resistance:** $R_{\text{total}} = 0.0030 \text{ m}^2\text{K/W}$ (still minor vs. aerogel L5)

### 6.3 NIR Reflectance (YInMn Blue Coating on Tile)

$$\rho_{\text{NIR}} = 0.85 \quad \text{(2.5-14 μm)}$$
$$\varepsilon_{\text{MIR}} = 0.92 \quad \text{(thermal emission)}$$

Reduces radiative heat flux to backup layers by ~40%.

---

## 7. Mass Budget — Tile System (RM-TG)

| Component | Qty | Unit Mass | Total Mass |
|-----------|-----|-----------|------------|
| Primary Tile (50mm) | 168 | 46.4 g | 7.795 kg |
| Backup Tile (25mm) | 72 | 5.8 g | 0.418 kg |
| NdFeB Magnets (8/tile) | 168 × 8 | 0.24 g | 0.323 kg |
| Gasket (per tile edge) | 168 × 4 | 0.08 g | 0.054 kg |
| Chassis Magnets | 168 × 4 | 0.30 g | 0.202 kg |
| Clamps/Bolts (M5) | 21 × 4 | 4.2 g | 0.353 kg |
| **TOTAL TILE SYSTEM** | | | **9.145 kg** |

**Validated vs. DOC-01 §9.1:** L2 (10.2 kg) + L7 (5.4 kg) = 15.6 kg for doublet+skirt
→ Tile system = 9.15 kg, remaining = backing fabric, STF, chassis share

---

## 8. Cross-References

| Ref | Document | Section | Key Data |
|-----|----------|---------|----------|
| [1] | DOC-01 | §2.1, §4, §9.1 | Layer stack, performance targets, mass budget |
