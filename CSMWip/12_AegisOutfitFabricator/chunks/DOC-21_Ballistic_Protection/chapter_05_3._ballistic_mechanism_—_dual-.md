## 3. Ballistic Mechanism — Dual-Layer Ceramic + Auxetic Cladding

### 3.1 Impact Sequence (from CSMFAB078-B §2.1)

```
IMPACT SEQUENCE (.30-06 APM2, 878 m/s, 63 J/mm²):

t=0μs:    Projectile strikes ZrB₂-SiC outer lamina (Layer 2)
         └─ Radial cracking from impact point (Hertzian cone)
         └─ Stress wave propagation: c ≈ 9,000 m/s (ZrB₂-SiC)
         
t=5μs:    Ceramic comminution → fine particulate (5-50μm)
         └─ Kinetic energy → fracture surface energy (85% absorption)
         └─ Projectile tip erosion (WC core → ceramic abrasion)
         └─ Radial crack velocity: v_crack ≈ 1,200 m/s
         
t=15μs:   Comminuted ceramic + projectile fragments → auxetic cladding
         └─ Auxetic densification (ν=-0.3 → ν=-0.8 under strain rate)
         └─ Lateral material draw-in → 3.2× areal density at impact zone
         └─ Shear band formation at unit cell hinges
         
t=30μs:   Residual fragments → inner ZrB₂-SiC lamina (Layer 7, backup)
         └─ Final arrest, zero penetration
         └─ Backup tile flexural response: σ_f = 590 MPa (AIMES) / 650-750 MPa (Renaissance)
         
t=50μs:   MR fluid bladder activation (magnetic field from impact sensor)
         └─ Stiffening → trauma mitigation (BFS reduction 44% → 24mm)
         └─ Pressure wave propagation in MR fluid: c ≈ 1,500 m/s
```

### 3.2 Auxetic Metamaterial Cladding Specification (CSMFAB078-B §2.2)

| Parameter | Value | Test Method | Source |
|-----------|-------|-------------|--------|
| **Unit cell geometry** | Re-entrant hexagon (3D printed Ti₃AlC₂) | µCT verification | CSMFAB078-B |
| **Relative density** | 0.15 | Archimedes | CSMFAB078-B |
| **Quasi-static yield** | 4.2 MPa | ASTM E9 | CSMFAB078-B |
| **Dynamic yield (10³/s)** | 18.7 MPa | Split Hopkinson | CSMFAB078-B |
| **Poisson's ratio (static)** | -0.32 | DIC measurement | CSMFAB078-B |
| **Poisson's ratio (dynamic)** | -0.78 | High-speed DIC | CSMFAB078-B |
| **Specific energy absorption** | 42 J/g | Compression test | CSMFAB078-B |
| **Thickness** | 3mm (2 unit cells) | Caliper | CSMFAB078-B |
| **Areal density** | 0.19 kg/m² | Scale | CSMFAB078-B |

**Manufacturing:** Laser powder bed fusion (LPBF) Ti₃AlC₂, 50μm layer, argon atmosphere
**Attachment:** ZrO₂ ceramic adhesive bond to ZrB₂-SiC tile exterior face

**Auxetic Densification Mechanism:**
```
Under impact (ε̇ > 10³/s):
  Initial: ν = -0.32, unit cells open
  Loading: Hinges rotate → cells close laterally
  Densified: ν → -0.8, material draws IN toward impact
  Areal density amplification: ρ* = ρ₀ × (1 - ν_dyn) / (1 - ν_stat) ≈ 3.2×
```

### 3.3 Ballistic Performance Scaling (MAT-03 §1.3)

**Areal Density Reduction with Scale:**
```
m_a = ρ × t
t_ren = t_aimes × s (thickness scales linearly for decorative proportion)
m_a_ren = m_a_aimes × s
```

**NIJ IV Threat Scaling Law (.30-06 APM2):**
```
V₅₀ = K × (m_a)^n × (E/σ_y)^m
n ≈ 0.5, m ≈ 0.5 (ceramic scaling laws, MAT-03 Eq. 1.3.3)
```

**Renaissance Edition V₅₀ Predictions:**
| Edition | Tile Size | Areal Density (kg/m²) | Predicted V₅₀ (m/s) | Margin vs 878 |
|---------|-----------|----------------------|---------------------|---------------|
| AIMES (ref) | 150mm | 56.0 | 930 (baseline) | +5.9% |
| RM-TS/TG | 50mm | 18.7 | 942 | +7.3% |
| RM-SS/SG | 25mm | 5.6 | 942 | +7.3% |
| RW variants | matched | matched | 940-945 | +7% |

*Note: Higher specific strength of miniaturized tiles compensates for reduced areal density.*

---
