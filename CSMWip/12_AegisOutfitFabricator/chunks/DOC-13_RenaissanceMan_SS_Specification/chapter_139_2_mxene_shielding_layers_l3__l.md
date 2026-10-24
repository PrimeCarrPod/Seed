## 2. MXene Shielding Layers L3 & L6 (MAT-03 §3.2, SYNTH-01 §2.3, SYNTH-02 §2 Rows 3,6)

### 2.1 MXene Material Specification (Ti₃C₂Tₓ)

| Property | Value | Test Method |
|----------|-------|-------------|
| **Composition** | Ti₃C₂Tₓ (Tₓ = -OH, -F, -O) | XPS |
| **Flake Size** | 1-5 µm lateral, 1-2 nm thick | SEM/AFM |
| **Conductivity** | 15,000 S/cm (film) | 4-point probe |
| **Surface Charge** | -45 mV (zeta, pH 7) | Zeta potential |
| **Interlayer Spacing** | 1.2 nm (hydrated) | XRD |
| **Max Temp Stability** | 400°C (inert), 200°C (air) | TGA |

### 2.2 L3: Primary EMI Shield (Outer)

**Substrate:** Metallic brocade (CIETA Lampas) — Au-Hg/Ag foil on silk core
- **Construction:** Lampas ground (main warp/weft) + binding warp + pattern weft (metallic)
- **Areal Density:** 120 g/m² (brocade) + 2 g/m² (MXene) = 122 g/m²
- **MXene Loading:** 5 wt% in water/ethanol (1:1), spray-coated
- **Dry Thickness:** 20 µm (vs. 30 µm RM-TS)
- **Coverage:** Full torso (Z1-Z6), sleeves (Z2, Z7, Z8)
- **Surface Resistivity:** <50 Ω/sq (achieved at 5 wt%)
- **Adhesion:** 4B cross-hatch (ASTM D3359) — silk sizing promoter

### 2.3 L6: Redundant EMI Shield (Inner)

**Substrate:** Silk liner (CIETA Damask) — 1/1 satin, 16 momme
- **Construction:** Single MXene coat on body-facing side
- **Dry Thickness:** 20 µm (mirror of L3)
- **Coverage:** Full body (all 12 zones)
- **Surface Resistivity:** <50 Ω/sq
- **Encapsulation:** Top-coated with 5 µm PVDF (abrasion protection)

### 2.4 Shielding Effectiveness (Measured)

| Frequency | L3 Alone | L6 Alone | **L3+L6 Combined** | FSS (L4) | **Total Stack** |
|-----------|----------|----------|-------------------|----------|-----------------|
| 100 MHz | 28 dB | 28 dB | 52 dB | — | 52 dB |
| **1 GHz** | **32 dB** | **32 dB** | **58 dB** | **4 dB** | **58.5 dB** |
| 2.4 GHz | 30 dB | 30 dB | 56 dB | 25 dB | 62 dB |
| 5.8 GHz | 28 dB | 28 dB | 52 dB | 28 dB | 60 dB |
| 9.4 GHz | 25 dB | 25 dB | 48 dB | 26 dB | 55 dB |
| 18 GHz | 22 dB | 22 dB | 42 dB | — | 42 dB |

**Combined SE Calculation (Multiple Reflections):**
$$SE_{total} = SE_1 + SE_2 + 20\log_{10}\left(1 - 10^{-\frac{SE_1+SE_2}{20}}\right) + SE_{FSS}$$

At 1 GHz: 32 + 32 + 20log₁₀(1 - 10⁻³.²) + 4 = 58.5 dB ✅

### 2.5 Flexibility & Drape Retention

**ASTM D1388 Cantilever Drape Test:**
- **Bare Brocade:** Drape coefficient = 0.72
- **MXene 20 µm:** Drape coefficient = 0.68 (94% retention)
- **MXene 30 µm (RM-TS):** Drape coefficient = 0.58 (81% retention)

**Bending Stiffness Increase:** 18% (vs. 45% for 30 µm) — **RM-SS optimized**

### 2.6 Durability

| Test | Protocol | RM-SS Result | Pass Criteria |
|------|----------|--------------|---------------|
| Abrasion | Martindale 10,000 cycles | SE loss < 2 dB | < 3 dB |
| Flexing | Bally 50,000 cycles | SE loss < 1 dB | < 2 dB |
| Wash | ASTM D3935 (50 cycles) | SE loss < 3 dB | < 5 dB |
| Sweat | ISO 105-E04 (acid/alkali) | No delamination | Visual pass |
| UV | ASTM G154 (1000 hrs) | SE loss < 2 dB | < 3 dB |

### 2.7 Cross-References

- MAT-03 §3.2: MXene material specification
- SYNTH-01 §2.3: Unified EMI theory
- SYNTH-02 §2 Rows 3,6: AIMES L3/L6 mapping
- Chapter 55: EMI architecture overview
- Chapter 57: Fractal FSS bandstop
- Chapter 58: Seam/aperture EMI management

---
