- C ≈ 10-15 (GAB constant)
- K ≈ 0.8-0.9 (multilayer constant)
- a_w = water activity (0-1)

**Hysteresis Loop:** Adsorption branch > desorption branch due to silk's semi-crystalline structure

### 1.5 Silk-Silk Friction Coefficients
**Static friction (μ_s):** 0.35-0.45 (degummed silk on silk)
**Kinetic friction (μ_k):** 0.25-0.35
**With beeswax coating:** μ_s ≈ 0.15-0.20, μ_k ≈ 0.10-0.15
**Friction work:** W_f = μ × F_n × L_slip (energy dissipation per slip event)

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
