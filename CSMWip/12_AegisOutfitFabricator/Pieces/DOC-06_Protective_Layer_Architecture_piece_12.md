### 8.2 CoAl₂O₄ Spinel Schumann Absorption (Layer 12)

**Coating Application (SYNTH-02 §2.6, MAT-03 §6):**
```
Process: Pad-dry-cure
Coating: CoAl₂O₄ nanoparticles (50-100nm) + acrylic binder + silane
Pickup: 60-80%
Dry: 120°C, 3 min
Cure: 160°C, 2 min
Add-on: 150μm coating, ~30 g/m²
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
