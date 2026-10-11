*Traceability: Research Doc 1 §2.1-2.2; Research Doc 2 §3.3-3.4; MAT-01 §1.1-1.6; MAT-03 §2; CSMFAB078-B §7*

---

## 2. Structural Foundation (from MAT-02)

### 2.1 Baleen (Keratin) Full Tensor Properties

**Mechanical Properties** (Research Doc 1 §5.1, Lines 65-68; MAT-02 §1.1):
```
Young's Modulus (hydrated): E = 2-6 GPa (longitudinal), 1-2 GPa (transverse)
Thermoplastic transition: 60-80°C (yields to body heat)
Density: ρ ≈ 1.3-1.4 g/cm³
Tensile strength: σ_uts ≈ 150-250 MPa (longitudinal)
Compressive strength: σ_comp ≈ 200-300 MPa
```

**Orthotropic Elasticity Tensor for Baleen** (MAT-02 §1.2):
```
C_ijkl(baleen) = [ C₁₁ C₁₂ C₁₃  0   0   0  ]
                 [ C₁₂ C₂₂ C₂₃  0   0   0  ]
                 [ C₁₃ C₂₃ C₃₃  0   0   0  ]
                 [  0   0   0  C₄₄  0   0  ]
                 [  0   0   0   0  C₅₅  0  ]
                 [  0   0   0   0   0  C₆₆ ]

E₁ (longitudinal) ≈ 4-6 GPa, E₂ (radial) ≈ 1-2 GPa, E₃ (tangential) ≈ 1-2 GPa
ν₁₂ ≈ 0.3-0.4, ν₂₃ ≈ 0.3-0.4, ν₁₃ = ν₁₂
G₁₂ = G₁₃ ≈ 0.8-1.2 GPa, G₂₃ ≈ 0.5-0.8 GPa
```

**Yield Criterion (Pressure-Dependent)** (MAT-02 §1.3):
```
Drucker-Prager: √(J₂) + α·I₁ = k
α ≈ 0.1-0.2 for keratinous materials [TBD:RESEARCH]
I₁ = first stress invariant, J₂ = second deviatoric invariant
```

**Euler Critical Load for Stay Buckling** (Research Doc 1 §5.1, Line 68; MAT-02 §1.4):
```
P_cr = π²·E·I / L²

Typical stay: width=7mm, thickness=2mm → I = 7×2³/12 = 4.67 mm⁴ = 4.67×10⁻¹² m⁴
L = 150 mm = 0.15 m, E = 4×10⁹ Pa (hydrated)
P_cr ≈ π² × 4×10⁹ × 4.67×10⁻¹² / 0.15² ≈ 8.2 N per stay
20-30 stays per corset → Total buckling resistance ≈ 160-250 N
```

### 2.2 Synthetic Baleen Alternatives Comparison

