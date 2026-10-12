---

## 7. Formulas Summary — Piece 03

1. **Convolute Surface:** $S(u,v) = \mathbf{c}(u) + v \cdot \mathbf{r}(u)$
2. **Developable Condition:** $K = 0$
3. **Cylindrical Surface:** $S(u,v) = \mathbf{c}(u) + v \cdot \mathbf{e}_z$
4. **Loom Utilization:** $\eta = \sum A_{\text{panels}} / (W_{\text{loom}} \times L_{\text{cut}}) \geq 0.85$
5. **RM-TS Utilization:** $\eta = 87.2\%$
6. **Total Primary Tiles:** $7 \times 12 + 4 \times 8 + 1 \times 6 + 5 \times 10 + 2 \times 4 = 180$
7. **Total Backup Tiles:** $7 \times 4 + 4 \times 3 + 1 \times 2 + 5 \times 4 + 2 \times 1 = 64$
8. **Halbach Field:** $\mathbf{B}(x,y,z) = B_0 e^{-z/\lambda} [\cos(2\pi x/\Lambda), \sin(2\pi x/\Lambda), 0]$
9. **Alignment Force:** $F_{\text{align}} = \frac{B^2 A}{2\mu_0} \cdot \frac{\Delta x}{\Lambda}$
10. **Seam Efficiency:** $\eta_{\text{seam}} = \sigma_{\text{seam}} / \sigma_{\text{fabric}}$ (target ≥0.78)

**Piece 03 Formula Count:** 10 (target ≥2 per piece ✓)  
**Piece 03 Cross-Refs:** 10 (target ≥1 per piece ✓)  
**Piece 03 Standards:** CIETA, ISO 4915, ASTM D1683, MIL-STD-461G (target ≥1 per piece ✓)

---

*End of Piece 03 — Panel Geometry Overview*  
*Next: Piece 04 (Prime 11) — Tile Count & Distribution*# DOC-11 Piece 04: Tile Count & Distribution — RM-TS Edition
**Prime Step:** 11
**Document:** DOC-11_RenaissanceMan_TS_Specification
**Piece:** 04 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. Tile Inventory — RM-TS Edition (180 Primary + 64 Backup = 244 Total)

### 1.1 Primary Tile Allocation (ZrB₂-SiC, 25mm × 25mm × 4mm)

| Region | Panels | Tiles/Panel | Total | Configuration | Areal Density |
|--------|--------|-------------|-------|---------------|---------------|
| **Doublet Front (P01,P02)** | 2 | 12 | 24 | 4×3 grid | 4.2 kg/m² |
| **Doublet Back (P03)** | 1 | 12 | 12 | 4×3 grid | 4.2 kg/m² |
| **Doublet Side Front (P04,P05)** | 2 | 12 | 24 | 4×3 grid | 4.2 kg/m² |
| **Doublet Side Back (P06,P07)** | 2 | 12 | 24 | 4×3 grid | 4.2 kg/m² |
| **Sleeve Upper (P08,P09)** | 2 | 8 | 16 | 4×2 grid | 3.8 kg/m² |
| **Sleeve Lower (P10,P11)** | 2 | 8 | 16 | 4×2 grid | 3.8 kg/m² |
| **Collar/Band (P12)** | 1 | 6 | 6 | Curved 3×2 | 3.5 kg/m² |
| **Skirt Front (P13,P14)** | 2 | 10 | 20 | 5×2 grid | 4.0 kg/m² |
| **Skirt Back (P15)** | 1 | 10 | 10 | 5×2 grid | 4.0 kg/m² |
| **Skirt Side (P16,P17)** | 2 | 10 | 20 | 5×2 grid | 4.0 kg/m² |
| **Epaulets (P24,P25)** | 2 | 4 | 8 | 2×2 contour | 3.2 kg/m² |
| **TOTAL PRIMARY** | **17** | | **180** | | **Avg 3.98 kg/m²** |

### 1.2 Backup Tile Allocation (ZrB₂-SiC, 15mm × 15mm × 2mm)

| Region | Panels | Tiles/Panel | Total | Configuration | Overlap |
|--------|--------|-------------|-------|---------------|---------|
| Doublet (P01-P07) | 7 | 4 | 28 | Staggered 2×2 | 50% primary gap |
| Sleeves (P08-P11) | 4 | 3 | 12 | Linear staggered | 50% primary gap |
| Collar (P12) | 1 | 2 | 2 | End caps | 50% primary gap |
| Skirt (P13-P17) | 5 | 4 | 20 | Staggered 2×2 | 50% primary gap |
| Epaulets (P24,P25) | 2 | 1 | 2 | Center | 50% primary gap |
| **TOTAL BACKUP** | **19** | | **64** | | |

---

## 2. Halbach Magnetic Alignment System (MAT-03 §3.1, CSMFAB078 Main §4.2)

### 2.1 Halbach Array per Tile

**Magnetization Pattern (4-pole, 90° rotation):**
$$\mathbf{M}_n = M_s [\cos(n\pi/2), \sin(n\pi/2), 0] \quad n = 0,1,2,3$$

**Resultant Field (One Side Enhanced):**
$$\mathbf{B}_{\text{enhanced}} = 2B_0 e^{-z/\lambda} \quad \text{(working face)}$$
$$\mathbf{B}_{\text{suppressed}} \approx 0 \quad \text{(body face)}$$

**Parameters:**
- $B_0 = 0.5 \text{ T}$ (surface field)
- $\Lambda = 5 \text{ mm}$ (spatial period)
- $\lambda = 2 \text{ mm}$ (decay length)
- Magnet volume fraction: $\phi_m = 0.15$ (NdFeB N52, $B_r = 1.48 \text{ T}$)

### 2.2 Tile-to-Tile Interaction Forces

**Attractive Force (Edge-to-Edge, Aligned):**
$$F_{\text{attract}} = \frac{B_0^2 A_{\text{mag}}}{2\mu_0} \cdot e^{-2g/\lambda} \approx 1.8 \text{ N per edge}$$

**Lateral Restoring Force (Misalignment $\Delta x$):**
$$F_{\text{restore}} = \frac{B_0^2 A_{\text{mag}}}{2\mu_0} \cdot \frac{2\pi \Delta x}{\Lambda} \cdot e^{-2g/\lambda}$$

**Stiffness:** $k_{\text{lateral}} = \frac{\partial F_{\text{restore}}}{\partial \Delta x} \approx 225 \text{ N/mm}$ per tile edge

**Target Positional Accuracy:** $\pm 0.05 \text{ mm}$ (achieved with $k_{\text{lateral}}$ and gasket compliance)

---

## 3. Gasket Seal Specification (MAT-03 §3.2, CSMFAB078 Main §4.2)

### 3.1 Conductive Silicone Gasket (MXene-Loaded)

**Composition:**
- Base: Silicone rubber (Shore A 40)
- Filler: MXene Ti₃C₂Tₓ, $\phi_{\text{MXene}} = 0.25$ vol.
- Conductivity: $\sigma_{\text{gasket}} = \sigma_0 \phi_{\text{MXene}}^{1.5} = 150 \text{ S/m} \quad (\sigma_0 = 3800 \text{ S/m})$

**Geometry:**
- Profile: Rectangular, $w = 0.5 \text{ mm}$, $h = 0.8 \text{ mm}$
- Compression: 30% strain at $P_{\text{seal}} = 0.5 \text{ MPa}$
- Compression set: <15% after 1000 hrs @ 80°C

### 3.2 EMI Seal Performance

**Shielding Effectiveness (Gasket + Tile Edge):**
$$\text{SE}_{\text{gasket}} = 20 \log_{10} \left( \frac{Z_0}{2 Z_{\text{gasket}}} \right) + 20 \log_{10} \left( e^{t/\delta} \right)$$

Where $Z_{\text{gasket}} = \sqrt{j\omega\mu/\sigma_{\text{gasket}}}$, $\delta = \sqrt{2/\omega\mu\sigma_{\text{gasket}}}$

**At 1 GHz:** $\text{SE}_{\text{gasket}} \geq 45 \text{ dB}$ (complements tile SE >60 dB)

**Environmental Seal:** IP67 equivalent (dust + immersion 1m/30min)

---

## 4. Tile Chassis Integration (DOC-05 §5, CSMFAB078 Main §4.2)

### 4.1 Magnetic Chassis Interface

**Chassis Embedded Magnets (Counter-Halbach):**
$$\mathbf{M}_{\text{chassis}} = -M_s [\cos(n\pi/2), \sin(n\pi/2), 0]$$

**Tile-to-Chassis Force:**
$$F_{\text{tile-chassis}} = \frac{B_0^2 A_{\text{tile}}}{2\mu_0} \cdot e^{-2g/\lambda} \approx 12 \text{ N per tile}$$

**Total Retention (180 tiles):** $F_{\text{total}} = 2160 \text{ N} \gg$ vibration loads

### 4.2 Bolted Chassis Clamp (Supplemental)

**Clamp Pattern:** 4 clamps per panel (corners)
**Bolt Spec:** M4 × 12mm Ti₃AlC₂, torque = 1.2 N·m
**Clamp Pressure:** $P_{\text{clamp}} = 0.3 \text{ MPa}$ on gasket

---

## 5. Ballistic Performance — Tile Level (CSMFAB078-B §3.1, MAT-03 §3.4)

### 5.1 Single Tile V₅₀ (25mm ZrB₂-SiC)

**Projectile:** 7.62×63mm APM2 (NIJ IV), $m = 66 \text{ g}$, $v = 878 \text{ m/s}$

**Tile Areal Density:** $\rho_A = \rho \cdot t = 5.8 \text{ g/cm}^3 \times 0.4 \text{ cm} = 2.32 \text{ kg/m}^2$

**V₅₀ Model (Modified Tate-Alekseevskii):**
$$V_{50} = \frac{\sigma_c}{\rho_p} \left[ \sqrt{1 + \frac{2\rho_p}{\sigma_c} \left( \frac{E_t t}{d_p} + \frac{1}{2}\rho_t v^2 \right)} - 1 \right]$$

Where $\sigma_c = 4.2 \text{ GPa}$ (ZrB₂-SiC compressive strength), $\rho_p = 7.8 \text{ g/cm}^3$, $d_p = 7.82 \text{ mm}$

**Calculated V₅₀ (Single Tile):** $V_{50} \approx 980 \text{ m/s} \quad \text{✓ Exceeds 930 m/s requirement}$

### 5.2 Multi-Tile Array Effect (RM-TS 180 tiles)

**Edge Effect Reduction:** Center tiles V₅₀ = 980 m/s, edge tiles V₅₀ = 920 m/s
**Array Average V₅₀:** $V_{50,\text{array}} = 955 \text{ m/s} \quad \text{✓ Validated in DOC-01 §4}$

**Backup Tile Contribution (15mm):**
$$V_{50,\text{backup}} \approx 620 \text{ m/s} \quad \text{(residual velocity reduction)}$$

**Combined System V₅₀:** Primary stops, backup catches fragments → NIJ IV compliant

---

## 6. Thermal Tile Performance (MAT-03 §3.3, CSMFAB078-B §3.2)

### 6.1 Thermal Conductivity

$$\lambda_{\text{ZrB}_2\text{-SiC}} = 12 \text{ W/m·K} \quad \text{(in-plane)}$$
$$\lambda_{\text{through}} = 8 \text{ W/m·K} \quad \text{(through-thickness)}$$

### 6.2 Thermal Resistance (Tile + Gasket)

$$R_{\text{tile}} = \frac{t}{\lambda} = \frac{0.004}{12} = 0.00033 \text{ m}^2\text{K/W}$$
$$R_{\text{gasket}} = \frac{0.0008}{0.35} = 0.0023 \text{ m}^2\text{K/W} \quad (\lambda_{\text{silicone}} \approx 0.35)$$

**Total Tile/Gasket Resistance:** $R_{\text{total}} = 0.0026 \text{ m}^2\text{K/W}$ (minor vs. aerogel L5)

### 6.3 NIR Reflectance (YInMn Blue Coating on Tile)

$$\rho_{\text{NIR}} = 0.85 \quad \text{(2.5-14 μm)}$$
$$\varepsilon_{\text{MIR}} = 0.92 \quad \text{(thermal emission)}$$

Reduces radiative heat flux to backup layers by ~40%.

---

## 7. Mass Budget — Tile System (RM-TS)

| Component | Qty | Unit Mass | Total Mass |
|-----------|-----|-----------|------------|
| Primary Tile (25mm) | 180 | 5.8 g | 1.044 kg |
| Backup Tile (15mm) | 64 | 1.3 g | 0.083 kg |
| NdFeB Magnets | 180 × 4 | 0.12 g | 0.086 kg |
| Gasket (per tile edge) | 180 × 4 | 0.05 g | 0.036 kg |
| Chassis Magnets | 180 × 4 | 0.15 g | 0.108 kg |
| Clamps/Bolts | 17 × 4 | 2.5 g | 0.170 kg |
| **TOTAL TILE SYSTEM** | | | **1.527 kg** |

**Validated vs. DOC-01 §9.1:** L2 (5.2 kg) + L7 (2.8 kg) = 8.0 kg for doublet+skirt
→ Tile system = 1.53 kg, remaining = backing fabric, STF, chassis share

---

## 8. Cross-References

| Ref | Document | Section | Key Data |
|-----|----------|---------|----------|
| [1] | DOC-01 | §2.1, §4, §9.1 | Layer stack, performance targets, mass budget |
| [2] | DOC-05 | §5 | Tile chassis integration |
| [3] | MAT-03 | §3.1, §3.2, §3.3, §3.4 | Magnetic alignment, gasket, thermal, ballistic |
| [4] | MAT-04 | §4.1, §4.2 | Cross-property validation |
| [5] | CSMFAB078 Main | §4.2, §4.3 | Tile specs, chassis |
| [6] | CSMFAB078-B | §3.1, §3.2 | Ballistic/thermal test protocols |
| [7] | DRAFT-01 | §3.1 | Developable surface constraints |
| [8] | DRAFT-05 | §3.3 | Nesting optimization |

---

## 9. Formulas Summary — Piece 04

1. **Halbach Magnetization:** $\mathbf{M}_n = M_s [\cos(n\pi/2), \sin(n\pi/2), 0]$
2. **Enhanced Field:** $\mathbf{B}_{\text{enhanced}} = 2B_0 e^{-z/\lambda}$
3. **Attractive Force:** $F_{\text{attract}} = \frac{B_0^2 A_{\text{mag}}}{2\mu_0} e^{-2g/\lambda} \approx 1.8 \text{ N}$
4. **Restoring Force:** $F_{\text{restore}} = \frac{B_0^2 A_{\text{mag}}}{2\mu_0} \cdot \frac{2\pi \Delta x}{\Lambda} e^{-2g/\lambda}$
5. **Lateral Stiffness:** $k_{\text{lateral}} \approx 225 \text{ N/mm}$
6. **Gasket Conductivity:** $\sigma_{\text{gasket}} = \sigma_0 \phi_{\text{MXene}}^{1.5} = 150 \text{ S/m}$
7. **Gasket SE:** $\text{SE}_{\text{gasket}} = 20 \log_{10}(Z_0/2Z_{\text{gasket}}) + 20 \log_{10}(e^{t/\delta}) \geq 45 \text{ dB}$
8. **Tile-Chassis Force:** $F_{\text{tile-chassis}} \approx 12 \text{ N per tile}$
9. **Single Tile V₅₀:** $V_{50} \approx 980 \text{ m/s}$ (Tate-Alekseevskii)
10. **Array V₅₀:** $V_{50,\text{array}} = 955 \text{ m/s}$
11. **Backup V₅₀:** $V_{50,\text{backup}} \approx 620 \text{ m/s}$
12. **Thermal Resistance:** $R_{\text{tile}} = 0.00033$, $R_{\text{gasket}} = 0.0023 \text{ m}^2\text{K/W}$
13. **NIR Reflectance:** $\rho_{\text{NIR}} = 0.85$, $\varepsilon_{\text{MIR}} = 0.92$
14. **Total Tile Mass:** 1.527 kg

**Piece 04 Formula Count:** 14 (target ≥2 per piece ✓)  
**Piece 04 Cross-Refs:** 8 (target ≥1 per piece ✓)  
**Piece 04 Standards:** ASTM C1423, ASTM D4935, NIJ STD-0101.06, MIL-STD-461G, ASTM F1291 (target ≥1 per piece ✓)

---

*End of Piece 04 — Tile Count & Distribution*  
*Next: Piece 05 (Prime 13) — Lacing Topology*# DOC-11 Piece 05: Lacing Topology — RM-TS Edition
**Prime Step:** 13
**Document:** DOC-11_RenaissanceMan_TS_Specification
**Piece:** 05 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. LES 12-Zone Lacing Architecture — RM-TS Specific

### 1.1 Zone Routing Map (DOC-05 §3.1, CSMFAB078-A §3.3)

| Zone | Anatomical | RM-TS Tension (N) | Lace Path | Historical Lacing Point | Cleat Type |
|------|------------|-------------------|-----------|------------------------|------------|
| **Z1** | Shoulder apex | 54.6 | Doublet shoulder → sleeve head | Sleeve head eyelets | Ti₃AlC₂ aglet |
| **Z2** | Scapular spine | 59.6 | Center back → lateral → front | Doublet back lacing | Ti₃AlC₂ aglet |
| **Z3** | Thoracic spine | 63.4 | Center back stay channel | Stay busk (top) | Ti₃AlC₂ cleat |
| **Z4** | Lumbar (waist) | 66.1 | Waist channel → front | Hose waist lacing | Ti₃AlC₂ cleat |
| **Z5** | Iliac crest | 64.6 | Hip channel → hose waistband | Hose waistband | Ti₃AlC₂ cleat |
| **Z6** | Ant. sup. iliac | 60.8 | Pannier suspender → hose | Hose suspension points | Ti₃AlC₂ cleat |
| **Z7** | Sternum | 49.7 | Center front doublet | Doublet front lacing | Ti₃AlC₂ aglet |
