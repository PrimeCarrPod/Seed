TS: 1.0mm, TG: 1.2mm, SS: 1.0mm, SG: 1.4mm
```

### 5.4 Hoop Radius Grading Function
```
r_i = r_1 + (r_N - r_1) × ((i-1)/(N-1))^p
p = 1.0 (linear) to 1.5 (accelerated at hem)
```

## 6. Structural Analysis

### 6.1 Vertical Load Path
```
Skirt weight → Tapes → Waistband → Body
Hoop compression: C_hoop = T_tape × sin(α)
α = tape angle from vertical
```

### 6.2 Lateral Stability
**Hoop as Ring on Elastic Foundation:**
```
Foundation modulus: k_f = T_tape / (r × Δθ)
Critical buckling load: P_cr = 2 √(E I k_f)
```

### 6.3 Dynamic Response (Walking)
**Step Frequency: f_step ≈ 1-2 Hz**
```
Forced vibration: M ü + C u̇ + K u = F₀ sin(ωt)
Resonance check: ω_n ≠ 2π f_step
