```

**Schumann Attenuation Physics (CSMFAB078 §5.3, MAT-03 §6.2):**
```
Complex permeability: μ* = μ' - jμ''
At 7.83 Hz: μ'' peak → magnetic loss tangent tan δ_m = μ''/μ'
Power absorption: P_abs = ½ ω μ₀ μ'' H²
Attenuation: A = 8.686 α d
α = ω √(με/2) [√(1 + tan²δ) - 1]^(1/2)

BFRP dielectric chassis (ε_r ≈ 4-6) → impedance matching
Combined reflection + absorption > 78 dB @ 7.83 Hz
```

**Verification (CSMFAB078 §5.3):**
```
Test: Vibrometer measurement per CSMFAB011 protocol
Pass criteria: >78 dB @ 7.83 Hz and harmonics (14.1, 20.3, 26.4, 32.5 Hz)
```

