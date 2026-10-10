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
C₂₂ = E₂/(1-ν₁₂ν₂₁)          E₂ ≈ 2–3 GPa
C₁₂ = ν₁₂E₂/(1-ν₁₂ν₂₁)       ν₁₂ ≈ 0.35
C₄₄ = G₁₂                    G₁₂ ≈ 1.5 GPa [TBD:RESEARCH]
ν₂₁ = ν₁₂ × E₂/E₁
```

**Poisson's Ratio in Woven Matrices** (Research Doc 1 §3.1, Line 36):
```
ν = -ε_transverse / ε_longitudinal
```

**Orthotropic Hooke's Law** (Research Doc 1 §3.1, Lines 38–39):
```
σ_x = E_x/(1-ν_xyν_yx) × (ε_x + ν_xy × ε_y)
σ_y = E_y/(1-ν_xyν_yx) × (ε_y + ν_yx × ε_x)
τ_xy = G_xy × γ_xy
```

## 4. CIETA Textile Typologies and Mechanical Characteristics
