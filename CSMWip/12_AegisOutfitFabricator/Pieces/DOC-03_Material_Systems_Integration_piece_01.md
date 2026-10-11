# DOC-03: Material Systems Integration
## AegisOutfitFabricator Core Document 3

---

## 1. Silk Fibroin System (from MAT-01)

### 1.1 Degummed Silk Properties

**Mechanical Properties** (Research Doc 1 §2.1, Lines 12-16; MAT-01 §1.1):
```
Young's Modulus: E = 8-12 GPa (hydrated, longitudinal)
Ultimate Tensile Strength: σ_uts = 500-700 MPa
Breaking Strain: ε_break = 15-25%
Density: ρ = 1.3-1.4 g/cm³
Moisture Regain: 11% at 65% RH
```

**Sericin Removal Kinetics** (Research Doc 1 §2.1, Line 13):
```
Alkaline hydrolysis: Na₂CO₃ 0.5-1.0% w/v, 95-100°C, 60-90 min
Sericin removal: 96% target
Photochemical vulnerability: Complete removal → UV degradation rate k_uv ↑ 3×
```

### 1.2 Orthotropic Elasticity Tensor for Silk Fibroin

**Constitutive Model** (MAT-01 §1.4; Research Doc 2 §5):
```
C_ijkl(silk) = [ C₁₁ C₁₂ C₁₃  0   0   0  ]
               [ C₁₂ C₂₂ C₂₃  0   0   0  ]
               [ C₁₃ C₂₃ C₃₃  0   0   0  ]
               [  0   0   0  C₄₄  0   0  ]
               [  0   0   0   0  C₅₅  0  ]
               [  0   0   0   0   0  C₆₆ ]

Principal Directions:
1 = fiber direction (warp): E₁ ≈ 10 GPa
2 = transverse (weft): E₂ ≈ 2-3 GPa
3 = thickness: E₃ ≈ 1-2 GPa

Poisson's Ratios: ν₁₂ ≈ 0.35, ν₂₁ = ν₁₂·E₂/E₁, ν₁₃ = ν₁₂
Shear Moduli: G₁₂ ≈ 1.5 GPa, G₁₃ ≈ 1.2 GPa, G₂₃ ≈ 0.8 GPa
```

**Strain Energy Density (Yeoh Model for Orthotropic Silk)** (MAT-01 §1.4; Research Doc 2 §5):
```
W = C₁₀(I₁ - 3) + C₂₀(I₁ - 3)² + C₃₀(I₁ - 3)³
    + (1/D₁)(J - 1)²
    + Σ Cᵢⱼ(I₄ - 1)ⁱ(I₆ - 1)ʲ  (fiber reinforcement)
