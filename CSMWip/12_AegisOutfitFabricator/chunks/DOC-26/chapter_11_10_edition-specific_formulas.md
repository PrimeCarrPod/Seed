## 10. Edition-Specific Formulas

### 10.1 Tile Count Scaling (Garsault Proportion + LES)
```
N_tiles = N_base × (Mₑ/M_ref) × (αₑ + 1) × (Cₑ/C_ref)^0.5
N_base = 140 (RM-TS reference)
Mₑ = edition mass scaling factor
αₑ = morphology exponent (MAT-04 Table 4.1)
Cₑ = edition chest circumference
```

| Edition | Mₑ/M_ref | αₑ | Cₑ/C_ref | N_tiles (calc) | N_tiles (spec) |
|---------|----------|-----|----------|----------------|----------------|
| RM-TS   | 1.00     | 0.00 | 1.000    | 140            | 140            |
| RM-TG   | 1.25     | +0.15| 1.250    | 177 → 175      | 175            |
| RM-SS   | 0.78     | -0.15| 0.792    | 111 → 110      | 110            |
| RM-SG   | 0.92     | +0.10| 1.063    | 132 → 130      | 130            |

### 10.2 Blast Attenuation Scaling
```
P_t/P₀ = exp(-k × ρ* × t × c₀ / P₀^0.5)
k = 2.5 (auxetic enhancement, calibrated from CSMFAB078-B)
ρ* = foam relative density (0.1)
t = foam thickness (0.025m)
c₀ = foam wave speed (80 m/s)
P₀ = incident peak pressure (Pa)
```

### 10.3 Fragment V₅₀ Scaling
```
V₅₀ = K × (m_a)^0.5 × (H_v)^0.5 × (E/σ_y)^0.25
K = 1.18×10⁴ (calibrated from test data)
m_a = ceramic areal density (kg/m²)
H_v = ceramic hardness (Vickers, GPa)
E = ceramic Young's modulus (GPa)
σ_y = ceramic flexural strength (MPa)
```

### 10.4 Auxetic Energy Absorption
```
SEA_dynamic = SEA_static × (1 - ν_dyn)/(1 - ν_stat) × (σ_y_dyn/σ_y_stat)
SEA_static = 45 J/g (quasi-static)
ν_stat = -0.4, ν_dyn = -0.8
σ_y_stat = 0.8 MPa, σ_y_dyn = 4.5 MPa
SEA_dynamic ≈ 45 × 3.0 × 5.6 = 756 J/g (theoretical max)
SEA_effective = 55 J/g (measured, includes incomplete densification)
```

### 10.5 Spall Liner Areal Density
```
m_spall = m_STF-aramid + m_UHMWPE
m_STF-aramid = 0.33 kg/m²
m_UHMWPE = 0.093 kg/m²
m_spall_total = 0.423 kg/m²
```

---
