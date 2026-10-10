## 🔬 MAT-02: STRUCTURAL FOUNDATION MATERIALS — TEMPLATE

```markdown
# MAT-02: Structural Foundation Materials
## AegisOutfitFabricator Material Science Bridge Document 2

## 1. Baleen (Keratin) Full Tensor Properties

### 1.1 Mechanical Properties (Research Doc 1 §5.1, Lines 65-68)
From Research Doc 1: Baleen is keratinous plate from *Balaena mysticetus*
- Young's modulus: E = 2-6 GPa (hydrated), varies with hydration & temperature
- Thermoplastic transition: 60-80°C (yields to body heat)
- Density: ρ ≈ 1.3-1.4 g/cm³
- Tensile strength: σ_uts ≈ 150-250 MPa (longitudinal)
- Compressive strength: σ_comp ≈ 200-300 MPa

### 1.2 Orthotropic Elasticity Tensor for Baleen
Baleen has tubular microstructure → transverse isotropy:
```
C_ijkl(baleen) = [ C₁₁ C₁₂ C₁₃  0   0   0  ]
                 [ C₁₂ C₂₂ C₂₃  0   0   0  ]
                 [ C₁₃ C₂₃ C₃₃  0   0   0  ]
                 [  0   0   0  C₄₄  0   0  ]
                 [  0   0   0   0  C₅₅  0  ]
                 [  0   0   0   0   0  C₆₆ ]
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

### 1.3 Yield Criteria (Pressure-Dependent)
Baleen exhibits different yield in tension vs compression:
- von Mises equivalent: σ_vm = √(3J₂) (for pressure-insensitive)
- Drucker-Prager: √(J₂) + α I₁ = k (pressure-sensitive, α > 0)
- α ≈ 0.1-0.2 for keratinous materials [TBD:RESEARCH]

### 1.4 Euler Critical Load for Stay Buckling (Research Doc 1 §5.1, Line 68)
```
P_cr = π² E I / L²
```
Where:
- E = 2-6 GPa (hydrated baleen modulus)
- I = b × h³ / 12 (rectangular cross-section, b=width, h=thickness)
- L = stay length (typically 100-200 mm)
- End conditions: pinned-pinned (K=1) for laced stays

**Typical Stay Dimensions:**
- Width: 6-8 mm, Thickness: 1.5-2.5 mm
- I ≈ (7 × 2³) / 12 = 4.67 mm⁴ = 4.67×10⁻¹² m⁴
- L ≈ 150 mm = 0.15 m
- P_cr ≈ π² × 4×10⁹ × 4.67×10⁻¹² / 0.15² ≈ 8.2 N per stay

With 20-30 stays per corset: Total buckling resistance ≈ 160-250 N