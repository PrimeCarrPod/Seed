
```
C_ijkl(baleen) = [ C₁₁  C₁₂  C₁₃   0    0    0  ]
                 [ C₁₂  C₂₂  C₂₃   0    0    0  ]
                 [ C₁₃  C₂₃  C₃₃   0    0    0  ]
                 [  0    0    0   C₄₄   0    0  ]
                 [  0    0    0    0   C₅₅   0  ]
                 [  0    0    0    0    0   C₆₆ ]
```

**Principal Directions:**
- 1 = longitudinal (along tubules, E₁ ≈ 4-6 GPa)
- 2 = radial (E₂ ≈ 1-2 GPa)
- 3 = tangential (E₃ ≈ 1-2 GPa)

**Poisson's Ratios:**
- ν₁₂ ≈ 0.3-0.4 (longitudinal-radial)
- ν₂₃ ≈ 0.3-0.4 (radial-tangential)
- ν₁₃ = ν₁₂ (transverse isotropy)

**Shear Moduli:**
- G₁₂ = G₁₃ ≈ 0.8-1.2 GPa
- G₂₃ ≈ 0.5-0.8 GPa

**Stiffness Components (Voigt Notation):**
```
C₁₁ = E₁(1-ν₂₃ν₃₂)/Δ     Δ = 1-ν₁₂ν₂₁-ν₂₃ν₃₂-ν₃₁ν₁₃-2ν₁₂ν₂₃ν₃₁
C₂₂ = E₂(1-ν₁₃ν₃₁)/Δ
C₃₃ = E₃(1-ν₁₂ν₂₁)/Δ
C₁₂ = (ν₂₁+ν₃₁ν₂₃)E₁/Δ
