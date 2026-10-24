## 2. Silk Fibroin Engineering Specification

### 2.1 Degummed Silk Fibroin Properties (MAT-01 §2.1, SYNTH-01 §2.1)

**Macromolecular Structure:**
```
Fibroin (structural core): 70-80% fiber mass
- Dominant amino acids: Glycine, Alanine, Serine
- Antiparallel β-sheet crystalline structures
- Crystallinity index: 60-70%

Sericin (envelope): 20-30% fiber mass (removed during degumming)
- Amorphous water-soluble globular protein
- Natural adhesive function
```

**Degumming Process (Research Doc 1 §2.1, MAT-01 §2.1):**
```
Method: Alkaline hydrolysis
Chemicals: Sodium carbonate / Marseilles soap (olive oil based)
Temperature: 95-100°C
Duration: 60-90 minutes
Sericin removal: 96% extraction efficiency
Post-degumming moisture regain: 11% at 65% RH
```

**Mechanical Properties (MAT-01 §2.1, SYNTH-01 §2.1):**
```
Young's Modulus: E = 8-12 GPa
Ultimate Tensile Stress: σ_uts = 500-700 MPa
Breaking Strain: ε_break = 15-25%
Density: ρ = 1.3-1.4 g/cm³
```

**Silk Fibroin Constitutive Equations:**
```
$E = \frac{\sigma}{\varepsilon}$  (Young's modulus definition)
```
```
$\nu = -\frac{\varepsilon_{transverse}}{\varepsilon_{longitudinal}}$  (Poisson's ratio)
```
```
$G = \frac{E}{2(1+\nu)}$  (Shear modulus)
```

**True Stress/True Strain Conversion:**
```
σ_true = σ_eng × (1 + ε_eng)
ε_true = ln(1 + ε_eng)
```

### 2.2 Elasto-Plastic Model with Isotropic Hardening (MAT-01 §2.2)

```
Yield stress evolution: σ_y = σ_y0 + H × ε_p
Initial yield stress: σ_y0 ≈ 0.4 × σ_uts = 200-280 MPa
Hardening modulus: H = 1.5-2.5 GPa [TBD:RESEARCH - exact value]
Plastic strain: ε_p = ε_true - σ_true/E
```

### 2.3 Strain-Rate Sensitivity (MAT-01 §2.3)

```
σ_y(ε̇) = σ_y0 × (1 + C × ln(ε̇/ε̇₀))
Reference strain rate: ε̇₀ = 10⁻³ s⁻¹ (quasi-static)
Strain-rate coefficient: C ≈ 0.05-0.08 for silk fibroin
Impact strain rate: ε̇_impact ≈ 10³ s⁻¹
Dynamic yield increase: 1.35-1.55× static yield
```

### 2.4 Environmental Aging Models (MAT-01 §2.4)

**UV Degradation:**
```
Chain scission rate: k_uv = A × exp(-E_a/RT) × I_uv
E_a ≈ 80-100 kJ/mol [TBD:RESEARCH]
Tensile retention: σ(t) = σ₀ × exp(-k_uv × t)
Sericin removal → UV vulnerability (complete removal = maximum degradation)
```

**Arrhenius Degradation Kinetics:**
```
$k_{uv} = A \exp\left(-\frac{E_a}{RT}\right) I_{uv}$
```
```
$\sigma(t) = \sigma_0 \exp(-k_{uv} t)$
```

**Humidity Effects:**
```
Moisture regain: 11% at 65% RH
Plasticization: E decreases ~15% at high humidity (>80% RH)
Swelling strain: ε_sw = β × ΔMC, β ≈ 0.003 per % moisture content
```

**Moisture-Dependent Modulus:**
```
$E(RH) = E_{dry} \left[ 1 - \alpha_E \left(\frac{RH}{100}\right)^\beta \right]$  where $\alpha_E \approx 0.15$
```
```
$\varepsilon_{sw} = \beta_{MC} \Delta MC$  where $\beta_{MC} \approx 0.003$
```

**Thermal Cycling:**
```
Glass transition: T_g ≈ 170-180°C (dry), decreases with moisture
Thermal degradation onset: ~250°C (chars, no melt)
Cycling fatigue: ΔE/E₀ = f(N_cycles, ΔT, T_max)
```
