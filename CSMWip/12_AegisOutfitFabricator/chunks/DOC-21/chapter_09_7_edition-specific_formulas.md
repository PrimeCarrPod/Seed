## 7. Edition-Specific Formulas

### 7.1 Tile Count Scaling (Garsault Proportion + LES)

```
N_tiles = N_base × (Mₑ/M_ref) × (αₑ + 1)
N_base = 180 (RM-TS reference)
Mₑ = edition mass scaling factor
M_ref = 1.0 (RM-TS)
αₑ = morphology exponent (from MAT-04 Table 4.1)
```

| Edition | Mₑ/M_ref | αₑ | N_tiles (calc) | N_tiles (spec) |
|---------|----------|-----|----------------|----------------|
| RM-TS | 1.00 | 0.00 | 180 | 180 |
| RM-TG | 1.25 | +0.15 | 219 → 210 | 210 |
| RM-SS | 0.78 | -0.15 | 140 → 150 | 150 |
| RM-SG | 0.92 | +0.10 | 172 → 165 | 165 |

### 7.2 Ballistic Mass Scaling

```
m_ballistic = N_tiles × m_tile × 2 (primary + backup) + A_auxetic × ρ_auxetic
m_tile = ρ_ceramic × L² × t
ρ_ceramic = 5600 kg/m³
t = 10mm (50mm tiles), 6mm (25mm tiles) [thinner for decorative proportion]
```

### 7.3 V₅₀ Scaling Law (MAT-03 Eq. 1.3.3)

```
V₅₀ = K × (m_a)^0.5 × (E/σ_y)^0.5
K = 1.24×10⁴ (calibrated from AIMES test data)
m_a = areal density (kg/m²)
E = ceramic Young's modulus (380 GPa)
σ_y = ceramic flexural strength (590-750 MPa by edition)
```

### 7.4 Auxetic Energy Absorption

```
E_abs = ρ_aux × V × SEA
SEA = 42 J/g (specific energy absorption)
V = A_impact × t_aux × 3.2 (densification factor)
A_impact = π × (d_projectile/2)² = 4.5 cm² (.30-06)
```

### 7.5 Magnetic Retention Safety Factor

```
SF_mag = F_mag_total / (m_tile × a_max)
a_max = 15,000g (peak deceleration, CSMFAB078-B)
F_mag_total = 9.6 N (4 pairs × 2.4 N)
m_tile = 14g (50mm) or 2.1g (25mm)
SF_mag (50mm) = 9.6 / (0.014 × 150,000) = 4.6
SF_mag (25mm) = 9.6 / (0.0021 × 150,000) = 30.5
```

---
