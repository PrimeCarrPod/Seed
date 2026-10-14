## 3. Spiral Steel Boning Mechanics

### 3.1 Properties (Research Doc 1 §5.3, Lines 76-77)
- Spiral steel: 2D bending within curved channels, longitudinal rigidity
- Spring steel: E ≈ 200 GPa, σ_y ≈ 1200-1500 MPa
- Wire diameter: 1.5-2.5 mm, spiral pitch: 3-5 mm

### 3.2 Spring Rate (Lateral Bending)
```
k_lateral = 3 E I / L³  (cantilever)
k_axial = E A / L       (longitudinal, very high)
```

**Spiral Geometry Effects:**
```
Effective lateral stiffness: k_eff = k_lateral × cos²(θ)
θ = spiral angle ≈ 15-25°
k_eff ≈ 0.8-0.9 × k_lateral
```

### 3.3 Hysteresis & Fatigue
- Hysteresis loss: ~5-10% per cycle (elastic-plastic transition at tips)
- Fatigue life: >10⁶ cycles at 50% yield stress
- Corrosion: stainless steel 316L recommended for sweat resistance

**Goodman Diagram for Fatigue:**
```
σ_a/σ_f + σ_m/σ_u = 1
σ_f ≈ 600 MPa (fatigue strength at 10⁶ cycles)
σ_u ≈ 1500 MPa (ultimate strength)
```

### 3.4 Comparison to Baleen
| Aspect | Baleen | Spiral Steel |
|--------|--------|--------------|
| Longitudinal E | 2-6 GPa | 200 GPa |
| Lateral Flexibility | High (thermoplastic) | Medium (spiral geometry) |
| Buckling Resistance | Self-limiting (yields) | Catastrophic if exceeded |
| Body Heat Response | Softens at 60-80°C | None |
| Weight | Light | Heavy (×5 density) |

### 3.5 Spring Steel Thermomechanical Properties
**Spring Rate Temperature Dependence:**
```
k(T) = k₀ × (1 - α_k × (T - T₀))
α_k ≈ 0.001/°C (for spring steel)
```

**Residual Stress Distribution:**
```
σ_res(r) = σ_max × (1 - r/R)  (from coiling process)
σ_max ≈ 0.3-0.5 × σ_y
```
