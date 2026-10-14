## 1. Historical Degummed Silk Stress-Strain Curve

### 1.1 True Stress/True Strain to Failure
From Research Doc 1 §2.1 (Lines 12-16):
- Degummed silk fibroin: E = 8-12 GPa, σ_uts = 500-700 MPa, ε_break = 15-25%
- Elasto-plastic model with isotropic hardening: σ_y = f(ε_p)
- Sericin removal: 95-100°C, 60-90 min, alkaline hydrolysis, 96% removal

**Stress-Strain Relationship (Engineering):**
```
σ_eng = F / A₀
ε_eng = ΔL / L₀
```

**True Stress/True Strain Conversion:**
```
σ_true = σ_eng (1 + ε_eng)
ε_true = ln(1 + ε_eng)
```

**Failure Envelope (Historical Silk):**
```
σ_uts ∈ [500, 700] MPa
ε_break ∈ [0.15, 0.25]
E ∈ [8, 12] GPa
```

### 1.2 Strain-Rate Sensitivity
Quasi-static (10⁻³ s⁻¹) vs impact (10³ s⁻¹) loading:
- Silk fibroin exhibits positive strain-rate sensitivity
- Yield stress increase: σ_y(ε̇) = σ_y₀ (1 + C ln(ε̇/ε̇₀))
- C ≈ 0.05-0.08 for silk fibroin [TBD:RESEARCH - exact value from literature]

### 1.3 Environmental Aging Models
**UV Degradation** (Research Doc 1 §2.1, Line 16):
- Complete sericin removal → UV vulnerability
- Photochemical degradation: chain scission rate k_uv = A exp(-E_a/RT) × I_uv
- Tensile strength retention: σ(t) = σ₀ exp(-k_uv × t)

**Humidity Effects:**
- Silk moisture regain: 11% at 65% RH
- Plasticization effect: E decreases ~15% at high humidity
- Swelling strain: ε_sw = β × ΔMC (β ≈ 0.003 per % moisture content)

**Thermal Cycling:**
- Glass transition: T_g ≈ 170-180°C (dry), decreases with moisture
- Thermal degradation onset: ~250°C (chars, no melt)
- Cycling fatigue: ΔE/E₀ = f(N_cycles, ΔT, T_max)

### 1.4 Moisture Sorption Isotherms
**GAB Model (Guggenheim-Anderson-de Boer):**
```
M = (M₀ × C × K × a_w) / ((1 - K × a_w) × (1 - K × a_w + C × K × a_w))
```
Where:
- M = moisture content (g water/g dry silk)
- M₀ = monolayer capacity ≈ 0.11 g/g (at 25°C)
- C ≈ 10-15 (GAB constant)
- K ≈ 0.8-0.9 (multilayer constant)
- a_w = water activity (0-1)

**Hysteresis Loop:** Adsorption branch > desorption branch due to silk's semi-crystalline structure

### 1.5 Silk-Silk Friction Coefficients
**Static friction (μ_s):** 0.35-0.45 (degummed silk on silk)
**Kinetic friction (μ_k):** 0.25-0.35
**With beeswax coating:** μ_s ≈ 0.15-0.20, μ_k ≈ 0.10-0.15
**Friction work:** W_f = μ × F_n × L_slip (energy dissipation per slip event)
