C₁₃ = (ν₃₁+ν₂₁ν₃₂)E₁/Δ
C₂₃ = (ν₃₂+ν₁₂ν₃₁)E₂/Δ
C₄₄ = G₂₃
C₅₅ = G₁₃
C₆₆ = G₁₂
```

### 1.3 Yield Criteria (Pressure-Dependent)
Baleen exhibits different yield in tension vs compression:
- von Mises equivalent: σ_vm = √(3J₂) (for pressure-insensitive)
- Drucker-Prager: √(J₂) + α I₁ = k (pressure-sensitive, α > 0)
- α ≈ 0.1-0.2 for keratinous materials [TBD:RESEARCH]

**Modified Drucker-Prager for Baleen:**
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

