| Property | Historical Baleen | PTFE-Fiberglass | PTFE-Quartz | Para-Aramid + SS |
|----------|------------------|-----------------|-------------|------------------|
| **E_long (GPa)** | 2-6 (hydrated) | 70-85 | 70-75 | 80-100 + 200 |
| **E_trans (GPa)** | 1-2 | 15-20 | 15-18 | 5-8 |
| **σ_uts (MPa)** | 150-250 | 1500-2000 | 1200-1500 | 3000-3500 |
| **ε_break (%)** | 15-25 | 3-5 | 2-4 | 2-3 / 15-20 |
| **Thermal Limit** | 60-80°C | 537°C | 1093°C | >500°C |
| **Density (g/cm³)** | 1.3-1.4 | 2.1-2.2 | 2.2-2.3 | 1.44 / 7.9 |
| **Flexibility** | High (thermoplastic) | Low (brittle) | Very Low | Medium-High |
| **Cost** | N/A (extinct) | $50-100/kg | $100-200/kg | $200-500/kg |

**Recommendation**: Hybrid approach — PTFE-fiberglass for high-heat zones, para-aramid/SS for structural stays requiring flexibility, historical baleen replication for visible elements (MAT-02 §2).

### 2.3 Spiral Steel Boning Mechanics

**Properties** (Research Doc 1 §5.3, Lines 76-77; MAT-02 §3):
```
Spring steel: E ≈ 200 GPa, σ_y ≈ 1200-1500 MPa
Wire diameter: 1.5-2.5 mm, spiral pitch: 3-5 mm

Spring rate (lateral): k_lateral = 3·E·I / L³ (cantilever)
Spring rate (axial): k_axial = E·A / L (very high)
Hysteresis loss: ~5-10% per cycle
Fatigue life: >10⁶ cycles at 50% yield stress
Corrosion: 316L stainless recommended for sweat resistance
```

### 2.4 Cage Crinoline / Farthingale Hoop Architecture

**Hoop Geometry** (Research Doc 1 §5.3, Lines 77-78; MAT-02 §4):
```
Moment of inertia: I = π·r³·t (thin-walled cylinder)
Hoop stress: σ_θ = P·r / t (internal pressure from skirt weight)

Radius progression: r₁ < r₂ < ... < r_n (ellipses, not circles)
Typical: 4-6 hoops, r_max ≈ 500-800 mm (skirt hem)
Wall thickness: t ≈ 1-2 mm spring steel wire
Elliptical hoop: x²/a² + y²/b² = 1, a > b for front-fullness
```

**Tape Suspension (Catenary)** (MAT-02 §4):
```
Catenary curve: y(x) = a·cosh(x/a), where a = H / w
H = horizontal tension, w = weight per unit length

Tension distribution: N vertical tapes sharing total skirt weight W
Ideal: T = W / N per tape
Actual: T_i varies with hoop angle, friction at waistband
```

