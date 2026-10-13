
**Magnetic Loss Mechanism (CSMFAB078-B §5.3):**
```
Complex permeability: μ* = μ' - jμ''
At 7.83 Hz: μ'' peak → magnetic loss tangent tan δ_m = μ''/μ'
Power absorption: P_abs = ½ ω μ₀ μ'' H²
Attenuation: A = 20 log₁₀(e^(αd)) = 8.686 α d
Where α = ω √(με/2) [√(1 + tan²δ) - 1]^(1/2)
```

**BFRP Dielectric Chassis Impedance Matching:**
```
Z_BFRP = √(μ/ε) ≈ √(1/4.5) Z₀ ≈ 188 Ω
Z_air = 377 Ω
Reflection coefficient: Γ = (Z_BFRP - Z_air) / (Z_BFRP + Z_air) ≈ -0.33
With CoAl₂O₄ coating: Z_match → Z_air, Γ → 0
Transmission into coating → absorption >78 dB
```

**Verification Protocol (CSMFAB078 §5.3):**
```
- Vibrometer measurement per CSMFAB011 protocol
- Pass: >78 dB @ 7.83 Hz and harmonics (14.1, 20.3, 26.4, 32.5 Hz)
- Test: 3-axis accelerometer on thermal manikin
- Frequency range: 0.1-100 Hz
