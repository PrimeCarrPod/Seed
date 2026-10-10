## 🔬 MAT-01: SILK FIBROIN ENGINEERING SPECIFICATION — TEMPLATE (CONTINUED)

### 1.4 Unified Constitutive Model

**Orthotropic Elasticity Tensor for Silk Fibroin:**
```
C_ijkl = [ C₁₁ C₁₂ C₁₃  0   0   0  ]
         [ C₁₂ C₂₂ C₂₃  0   0   0  ]
         [ C₁₃ C₂₃ C₃₃  0   0   0  ]
         [  0   0   0  C₄₄  0   0  ]
         [  0   0   0   0  C₅₅  0  ]
         [  0   0   0   0   0  C₆₆ ]
```

Where for silk (transversely isotropic in fiber direction):
- C₁₁ = E₁/(1-ν₁₂ν₂₁), C₂₂ = E₂/(1-ν₁₂ν₂₁)
- C₁₂ = ν₁₂E₂/(1-ν₁₂ν₂₁), C₄₄ = G₁₂
- E₁ (fiber direction) ≈ 10 GPa, E₂ (transverse) ≈ 2-3 GPa
- ν₁₂ ≈ 0.35, ν₂₁ = ν₁₂E₂/E₁
- G₁₂ ≈ 1.5 GPa [TBD:RESEARCH - exact shear modulus]

**Strain Energy Density Function (Yeoh Model for Orthotropic):**
```
W = C₁₀(I₁ - 3) + C₂₀(I₁ - 3)² + C₃₀(I₁ - 3)³
    + (1/D₁)(J - 1)²
    + Σ Cᵢⱼ(I₄ - 1)ⁱ(I₆ - 1)ʲ  (fiber reinforcement terms)
```

Where:
- I₁ = tr(C), I₄ = a₀·Ca₀ (fiber direction), I₆ = b₀·Cb₀ (cross-fiber)
- a₀, b₀ = fiber direction unit vectors in reference configuration
- C₁₀, C₂₀, C₃₀ fitted to historical silk stress-strain data

### 1.5 Modern Core-Spun Correlation (Research Doc 2 §3.3)

**Poly-Cotton Core-Spun Architecture:**
- PET core: 65% cross-sectional mass, HTY > 8 g/den, melt 252°C
- Cotton sheath: 35% mass, 38mm staple, hydrophilic swelling
- Manufacturing: Z-twist single → S-twist plied (prevents untwisting)

**Thermal Protection Mechanism:**
- Needle friction heat flux: q = β × μ × F_n × v_slip (β = 0.958)
- Cotton sheath thermal conductivity: k_cotton ≈ 0.04 W/mK (vs PET 0.15 W/mK)
- Sheath absorbs/dissipates heat, prevents PET core reaching melt temp

**Equivalent Silk Core-Spun Design:**
- Silk fibroin core (historical) + cotton/linen sheath (historical)
- Beeswax coating = natural lubricant + thermal sink (Research Doc 1 §6.1, Research Doc 2 §4)
- Thermal conductivity: silk ≈ 0.15 W/mK, beeswax ≈ 0.25 W/mK