# DOC-05: Structural Framework Specification
## AegisOutfitFabricator Core Document 5

---

## 1. Baleen/Steel Hybrid Chassis

### 1.1 Baleen Tensor Properties & Structural Role

**Material Properties** (Research Doc 1 §5.1; MAT-02 §1):
```
Baleen (keratinous plate from Balaena mysticetus):
E_longitudinal = 2-6 GPa (hydrated), E_transverse = 1-2 GPa
Thermoplastic transition: 60-80°C (yields to body heat, conforms to torso)
Density: ρ ≈ 1.3-1.4 g/cm³
σ_uts_longitudinal = 150-250 MPa, σ_comp = 200-300 MPa
Orthotropic: ν₁₂ ≈ 0.3-0.4, G₁₂ ≈ 0.8-1.2 GPa
```

**Full Orthotropic Elasticity Tensor** (MAT-02 §1.2):
```
C_ijkl(baleen) = [ C₁₁ C₁₂ C₁₃  0   0   0  ]
                 [ C₁₂ C₂₂ C₂₃  0   0   0  ]
                 [ C₁₃ C₂₃ C₃₃  0   0   0  ]
                 [  0   0   0  C₄₄  0   0  ]
                 [  0   0   0   0  C₅₅  0  ]
                 [  0   0   0   0   0  C₆₆ ]

Principal Directions:
1 = longitudinal (along tubules): E₁ = 4-6 GPa
2 = radial: E₂ = 1-2 GPa
3 = tangential: E₃ = 1-2 GPa
ν₁₂ = ν₁₃ ≈ 0.3-0.4, ν₂₃ ≈ 0.3-0.4
G₁₂ = G₁₃ = 0.8-1.2 GPa, G₂₃ = 0.5-0.8 GPa
```

**Drucker-Prager Yield Criterion** (MAT-02 §1.3):
