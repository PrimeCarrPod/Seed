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
ω_n = √(K/M) ≈ 5-10 Hz (well above step freq)
```

### 6.4 Fatigue Life Analysis
**Stress Range per Cycle:**
```
Δσ = σ_max - σ_min (from walking motion)
Δσ ≈ 50-100 MPa (depending on edition)
```

**S-N Curve (Spring Steel):**
```
N_f = C × (Δσ)^(-m)
m ≈ 3-5, C ≈ 10¹²-10¹⁵
Target: N_f > 10⁶ cycles
```


