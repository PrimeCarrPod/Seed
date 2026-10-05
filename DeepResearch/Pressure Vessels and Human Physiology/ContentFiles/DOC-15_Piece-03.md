# DOC-15: Biomedical PFC Variants — Comparative Physicochemical Tables
## Document 15 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 12801-12900 | Piece 3 of 9 | ~100 Lines

---

#### 15.3 Thermophysical & Transport Properties

**15.3.1 Density, Viscosity & Surface Tension at 25°C & 37°C**

| Property | C₁₀F₂₀ (Oxycyte) | C₁₀F₁₈ (Decalin, cis) | C₈F₁₇Br (PFOB) | C₈F₁₈ (n-Octane) | C₆F₁₄ (n-Hexane) |
|----------|------------------|------------------------|----------------|------------------|------------------|
| **Density [g/cm³] 25°C** | 1.97 | 1.92 | 1.93 | 1.76 | 1.68 |
| **Density [g/cm³] 37°C** | 1.93 | 1.88 | 1.89 | 1.72 | 1.64 |
| **Dynamic Viscosity η [mPa·s] 25°C** | 5.38 | 5.41 | 5.4 | 1.2 | 0.60 |
| **Dynamic Viscosity η [mPa·s] 37°C** | 3.8 | 3.7 | 3.6 | 0.85 | 0.42 |
| **Kinematic Viscosity ν [cSt] 25°C** | 2.73 | 2.82 | 2.80 | 0.68 | 0.36 |
| **Kinematic Viscosity ν [cSt] 37°C** | 1.97 | 1.97 | 1.91 | 0.49 | 0.26 |
| **Surface Tension γ [mN/m] 25°C** | 15–18 | 18 | 7.3 | 12.5 | 12.0 |
| **Surface Tension γ [mN/m] 37°C** | 13–16 | 16 | 6.8 | 11.5 | 11.0 |

**Viscosity Ranking (37°C, lowest to highest):**
C₆F₁₄ (0.42) < C₈F₁₈ (0.85) < C₁₀F₂₀/C₁₀F₁₈/C₈F₁₇Br (3.6–3.8)

**Surface Tension Ranking (lowest to highest):**
PFOB (7.3) < C₈F₁₈ (12.5) < C₆F₁₄ (12) < C₁₀F₂₀ (15–18) < C₁₀F₁₈ (18)

**15.3.2 Thermal Properties**

| Property | C₁₀F₂₀ | C₁₀F₁₈ | C₈F₁₇Br | C₈F₁₈ | C₆F₁₄ |
|----------|--------|--------|---------|-------|-------|
| **Thermal Conductivity k [W/m·K] 25°C** | 0.062 | 0.062 | 0.061 | 0.058 | 0.055 |
| **Specific Heat c_p [J/g·K]** | 1.02 | 1.01 | 1.00 | 0.99 | 0.98 |
| **Thermal Diffusivity α [mm²/s]** | 0.031 | 0.031 | 0.031 | 0.033 | 0.035 |
| **Prandtl Number Pr** | 65 | 65 | 65 | 35 | 20 |
| **Thermal Expansion Coeff. α [10⁻⁴ K⁻¹]** | 1.2 | 1.1 | 1.1 | 1.3 | 1.5 |

**All PFCs: Thermal insulators (k ≈ 0.06), low c_p (~1.0), high Pr (viscous diffusion dominates).**

**15.3.3 Vapor Pressure & Volatility (Critical for Clearance)**

| Temperature | C₁₀F₂₀ (Oxycyte) | C₁₀F₁₈ (cis) | C₈F₁₇Br (PFOB) | C₈F₁₈ | C₆F₁₄ |
|-------------|------------------|--------------|----------------|-------|-------|
| **Vapor Pressure [mmHg] 25°C** | 3.8 | 10–20 | 7.3 | 3.5 | 38 |
| **Vapor Pressure [mmHg] 37°C** | ~10 | ~30 | ~20 | ~10 | ~100 |
| **Boiling Point [°C]** | 147 | 142 | 142 | 103 | 56 |
| **Enthalpy of Vaporization ΔH_vap [kJ/mol]** | 38 | 36 | 37 | 32 | 26 |

**Clearance Implications:**
- **C₆F₁₄:** VP = 100 mmHg at 37°C → **Rapid pulmonary clearance** (minutes)
- **C₈F₁₈/C₁₀F₁₈/C₁₀F₂₀/C₈F₁₇Br:** VP = 10–30 mmHg → **Slow clearance** (hours)
- **C₆F₁₄ unsuitable for TLV** (excessive loss, rapid clearance)

**15.3.4 Thermal Conductivity & Heat Capacity — TLV Heat Exchanger Design**

| Property | Value | Impact on TLV |
|----------|-------|---------------|
| **Thermal Conductivity k** | 0.06 W/m·K | 10× worse than water — large HX needed |
| **Specific Heat c_p** | 1.0 J/g·K | 4× lower than water — 4× flow for same ΔT |
| **Prandtl Number Pr** | 65 | Viscous diffusion dominates |
| **Heat Transfer Coefficient h (forced, 1 m/s)** | ~200 W/m²K | vs. water ~2,000 — 10× lower |

**Heat Exchanger Sizing (TLV Loop, 500 W cooling):**
- **Water:** Area ~0.05 m², Flow 0.1 L/s
- **PFC:** Area ~0.5 m², Flow 0.4 L/s
- **Factor: ~10× larger, 4× flow rate**

---

*End of Piece 3 — DOC-15 Lines 12801-12900*
*Next: Piece 4 — Section 15.4 Biocompatibility, Toxicology & Clearance Kinetics*