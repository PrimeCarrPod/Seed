## 3. Orthotropic Elasticity Tensor for Silk Fibroin (SYNTH-01 §3)

### 3.1 Stiffness Matrix (Voigt Notation)

```
C_ijkl = [ C₁₁  C₁₂  C₁₃   0    0    0  ]
         [ C₁₂  C₂₂  C₂₃   0    0    0  ]
         [ C₁₃  C₂₃  C₃₃   0    0    0  ]
         [  0    0    0   C₄₄   0    0  ]
         [  0    0    0    0   C₅₅   0  ]
         [  0    0    0    0    0   C₆₆ ]

Transverse isotropy (1 = fiber direction):
C₁₁ = E₁/(1-ν₁₂ν₂₁)     E₁ ≈ 10 GPa
C₂₂ = E₂/(1-ν₁₂ν₂₁)     E₂ ≈ 2-3 GPa
C₁₂ = ν₁₂E₂/(1-ν₁₂ν₂₁)  ν₁₂ ≈ 0.35
C₄₄ = G₁₂               G₁₂ ≈ 1.5 GPa [TBD:RESEARCH]
ν₂₁ = ν₁₂ × E₂/E₁
```

### 3.2 Poisson's Ratio in Woven Matrices (Research Doc 1 §3.1)

```
ν = -ε_transverse / ε_longitudinal
Standard isotropic bounds: 0 ≤ ν ≤ 0.5
Woven silk (non-linear): ν fluctuates under load
Crimp geometry parameters:
- Yarn undulation radius (r)
- Crimp angle (θ)
- Pick spacing ratio
- Yarn diameter ratio
```

**Auxetic Potential (Research Doc 1 §3.1):**
```
Under biaxial loading: ν_effective can become negative
Transverse expansion when stretched longitudinally
Critical for pleated skirt drape over farthingales
Prevents catastrophic buckling under compressive loads
```

**Auxetic Condition for Woven Silk:**
```
$\nu_{eff} = -\frac{\varepsilon_{trans}}{\varepsilon_{long}} < 0 \quad \text{when} \quad \theta > \theta_{crit}$
```
```
$\theta_{crit} = \arcsin\left(\frac{r}{d/2}\right)$  where $r$ = yarn radius, $d$ = pick spacing
```
