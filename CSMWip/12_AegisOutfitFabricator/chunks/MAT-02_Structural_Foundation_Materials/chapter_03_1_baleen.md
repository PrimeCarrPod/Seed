## 1. Baleen

**Keratin Mechanics:**
```
$E_{\text{wet}} = 2-6 \text{ GPa}$  (hydrated)
```
```
$\sigma_y = 50-80 \text{ MPa}$
```
```
$\varepsilon_{\text{break}} = 15-25\%$
```
```
$T_g = 60-80^\circ\text{C}$  (thermoplastic transition)
```

**Euler Buckling (Baleen Stays):**
```
$P_{cr} = \frac{\pi^2 E I}{(K L)^2}$  where $I = \frac{b h^3}{12}$
```

 (Keratin) Full Tensor Properties

### 1.1 Mechanical Properties (Research Doc 1 §5.1, Lines 65-68)
From Research Doc 1: Baleen

**Keratin Mechanics:**
```
$E_{\text{wet}} = 2-6 \text{ GPa}$  (hydrated)
```
```
$\sigma_y = 50-80 \text{ MPa}$
```
```
$\varepsilon_{\text{break}} = 15-25\%$
```
```
$T_g = 60-80^\circ\text{C}$  (thermoplastic transition)
```

**Euler Buckling (Baleen Stays):**
```
$P_{cr} = \frac{\pi^2 E I}{(K L)^2}$  where $I = \frac{b h^3}{12}$
```

 is keratinous plate from *Balaena mysticetus*
- Young's modulus: E = 2-6 GPa (hydrated), varies with hydration & temperature
- Thermoplastic transition: 60-80°C (yields to body heat)
- Density: ρ ≈ 1.3-1.4 g/cm³
- Tensile strength: σ_uts ≈ 150-250 MPa (longitudinal)
- Compressive strength: σ_comp ≈ 200-300 MPa

**Strain Rate Sensitivity of Baleen

**Keratin Mechanics:**
```
$E_{\text{wet}} = 2-6 \text{ GPa}$  (hydrated)
```
```
$\sigma_y = 50-80 \text{ MPa}$
```
```
$\varepsilon_{\text{break}} = 15-25\%$
```
```
$T_g = 60-80^\circ\text{C}$  (thermoplastic transition)
```

**Euler Buckling (Baleen Stays):**
```
$P_{cr} = \frac{\pi^2 E I}{(K L)^2}$  where $I = \frac{b h^3}{12}$
```

:**
```
σ_y(ε̇) = σ_y₀ × (1 + C_baleen × ln(ε̇/ε̇₀))
C_baleen ≈ 0.03-0.05 [TBD:RESEARCH]
ε̇₀ = 10⁻³ s⁻¹ (quasi-static reference)
```

**Hydration-Dependent Modulus:**
```
E(φ) = E_dry × (1 - β_h × φ)
β_h ≈ 0.6-0.8 (hydration sensitivity)
φ = moisture content (0-0.25)
E_dry ≈ 8-10 GPa, E_hydrated ≈ 2-6 GPa
```

### 1.2 Orthotropic Elasticity Tensor for Baleen

**Keratin Mechanics:**
```
$E_{\text{wet}} = 2-6 \text{ GPa}$  (hydrated)
```
```
$\sigma_y = 50-80 \text{ MPa}$
```
```
$\varepsilon_{\text{break}} = 15-25\%$
```
```
$T_g = 60-80^\circ\text{C}$  (thermoplastic transition)
```

**Euler Buckling (Baleen Stays):**
```
$P_{cr} = \frac{\pi^2 E I}{(K L)^2}$  where $I = \frac{b h^3}{12}$
```


Baleen

**Keratin Mechanics:**
```
$E_{\text{wet}} = 2-6 \text{ GPa}$  (hydrated)
```
```
$\sigma_y = 50-80 \text{ MPa}$
```
```
$\varepsilon_{\text{break}} = 15-25\%$
```
```
$T_g = 60-80^\circ\text{C}$  (thermoplastic transition)
```

**Euler Buckling (Baleen Stays):**
```
$P_{cr} = \frac{\pi^2 E I}{(K L)^2}$  where $I = \frac{b h^3}{12}$
```

 has tubular microstructure → transverse isotropy:

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
C₁₃ = (ν₃₁+ν₂₁ν₃₂)E₁/Δ
C₂₃ = (ν₃₂+ν₁₂ν₃₁)E₂/Δ
C₄₄ = G₂₃
C₅₅ = G₁₃
C₆₆ = G₁₂
```

### 1.3 Yield Criteria (Pressure-Dependent)
Baleen

**Keratin Mechanics:**
```
$E_{\text{wet}} = 2-6 \text{ GPa}$  (hydrated)
```
```
$\sigma_y = 50-80 \text{ MPa}$
```
```
$\varepsilon_{\text{break}} = 15-25\%$
```
```
$T_g = 60-80^\circ\text{C}$  (thermoplastic transition)
```

**Euler Buckling (Baleen Stays):**
```
$P_{cr} = \frac{\pi^2 E I}{(K L)^2}$  where $I = \frac{b h^3}{12}$
```

 exhibits different yield in tension vs compression:
- von Mises equivalent: σ_vm = √(3J₂) (for pressure-insensitive)
- Drucker-Prager: √(J₂) + α I₁ = k (pressure-sensitive, α > 0)
- α ≈ 0.1-0.2 for keratinous materials [TBD:RESEARCH]

**Modified Drucker-Prager for Baleen

**Keratin Mechanics:**
```
$E_{\text{wet}} = 2-6 \text{ GPa}$  (hydrated)
```
```
$\sigma_y = 50-80 \text{ MPa}$
```
```
$\varepsilon_{\text{break}} = 15-25\%$
```
```
$T_g = 60-80^\circ\text{C}$  (thermoplastic transition)
```

**Euler Buckling (Baleen Stays):**
```
$P_{cr} = \frac{\pi^2 E I}{(K L)^2}$  where $I = \frac{b h^3}{12}$
```

:**
```
f(σ) = √(J₂) + α I₁ - k(ε_p) = 0
k(ε_p) = k₀ + H × ε_p  (isotropic hardening)
H ≈ 50-200 MPa (hardening modulus)
```

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

**Buckling Mode Shapes:**
```
w(x) = A sin(nπx/L)  (n = 1, 2, 3...)
P_cr_n = n² π² E I / L²
```

### 1.5 Viscoelastic Relaxation (Time-Dependent Behavior)
**Prony Series Representation:**
```
E(t) = E_∞ + Σ E_i exp(-t/τ_i)
E_∞ ≈ 2 GPa (long-term modulus)
τ_i ∈ [0.1, 1, 10, 100] s (relaxation times)
```

**Creep Compliance:**
```
J(t) = 1/E_∞ + Σ (1/E_i)(1 - exp(-t/τ_i))
```

