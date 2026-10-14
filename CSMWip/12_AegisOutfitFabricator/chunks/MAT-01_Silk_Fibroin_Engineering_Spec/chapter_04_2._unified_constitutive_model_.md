## 2. Unified Constitutive Model for Silk Fibroin

### 2.1 Orthotropic Elasticity Tensor
Silk fibroin exhibits transverse isotropy in the fiber direction. The 6×6 stiffness matrix in Voigt notation:

```
C_ijkl = [ C₁₁  C₁₂  C₁₃   0    0    0  ]
         [ C₁₂  C₂₂  C₂₃   0    0    0  ]
         [ C₁₃  C₂₃  C₃₃   0    0    0  ]
         [  0    0    0   C₄₄   0    0  ]
         [  0    0    0    0   C₅₅   0  ]
         [  0    0    0    0    0   C₆₆ ]
```

Where for silk (transversely isotropic, 1 = fiber direction):
```
C₁₁ = E₁/(1-ν₁₂ν₂₁)          E₁ ≈ 10 GPa
C₂₂ = E₂/(1-ν₁₂ν₂₁)          E₂ ≈ 2-3 GPa
C₁₂ = ν₁₂E₂/(1-ν₁₂ν₂₁)       ν₁₂ ≈ 0.35
C₄₄ = G₁₂                    G₁₂ ≈ 1.5 GPa [TBD:RESEARCH - exact shear modulus]
ν₂₁ = ν₁₂ × E₂/E₁
```

**Compliance Matrix (S_ijkl = C_ijkl⁻¹):**
```
S_11 = 1/E₁
S_22 = 1/E₂
S_12 = -ν₁₂/E₁
S_44 = 1/G₁₂
```

### 2.2 Strain Energy Density Function (Yeoh Model for Orthotropic)
```
W = C₁₀(I₁ - 3) + C₂₀(I₁ - 3)² + C₃₀(I₁ - 3)³
    + (1/D₁)(J - 1)²
    + Σ Cᵢⱼ(I₄ - 1)ⁱ(I₆ - 1)ʲ  (fiber reinforcement terms)
```

Where:
- I₁ = tr(C), I₄ = a₀·Ca₀ (fiber direction), I₆ = b₀·Cb₀ (cross-fiber)
- a₀, b₀ = fiber direction unit vectors in reference configuration
- C₁₀, C₂₀, C₃₀ fitted to historical silk stress-strain data

**Right Cauchy-Green Tensor:**
```
C = F^T · F
```

**Orthotropic Invariants:**
```
I₁ = tr(C)
I₂ = ½[(tr C)² - tr(C²)]
I₄ = a₀ · C a₀ (warp/fiber direction)
I₆ = b₀ · C b₀ (weft/cross-fiber direction)
```

**2nd Piola-Kirchhoff Stress:**
```
S = 2 × ∂W/∂C + p × C⁻¹
```

**Cauchy Stress (True Stress):**
```
σ = (1/J) F · S · F^T
```

### 2.3 Parameter Identification for Silk Fibroin
From experimental data fitting (Research Doc 2 §5):
```
C₁₀ = μ/2 ≈ 2.5 GPa  (initial shear modulus)
C₂₀ = -C₁₀/2 ≈ -1.25 GPa
C₃₀ = C₁₀/6 ≈ 0.42 GPa
D₁ = 2/K ≈ 0.1 GPa⁻¹  (bulk modulus K ≈ 10 GPa)
Fiber terms: C₁₁ ≈ 10 GPa, C₂₂ ≈ 5 GPa (calibrated)
```
