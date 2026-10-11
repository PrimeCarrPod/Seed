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

