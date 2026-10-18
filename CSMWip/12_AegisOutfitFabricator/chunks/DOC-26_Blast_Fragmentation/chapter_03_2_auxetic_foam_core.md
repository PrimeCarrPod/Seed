## 2. Auxetic Foam Core

### 2.1 Material Composition and Structure
The blast mitigation core utilizes open-cell auxetic polyurethane foam with re-entrant geometry:

```
[Exterior] Ceramic strike face array
          ↓
      Auxetic foam core (25mm)
          ↓
   Spall liner (aramid/STF composite, 3mm)
          ↓
[Interior] Structural chassis (BFRP)
```

### 2.2 Auxetic Geometry and Mechanics
Negative Poisson's ratio enables lateral expansion under compression, enhancing energy absorption:

```
Poisson's Ratio: ν = -0.4 to -0.6 (quasi-static), -0.7 to -0.9 (dynamic @ 10³/s)
Unit Cell: Re-entrant hexagonal honeycomb (θ = 60°-120° vertex angles)
Relative Density: ρ*/ρ_s = 0.05-0.15 (open-cell foam)
Specific Energy Absorption: SEA = 45-60 J/g (dynamic compression)
```

**Auxetic Enhancement Mechanism:**
```
Under blast compression (ε̇ > 10²/s):
  Initial: ν ≈ -0.4, cells open laterally
  Loading: Hinges rotate → cells draw material INWARD
  Densified: ν → -0.8, local areal density amplifies 3.5×
  Energy absorption: U = ∫ σ(ε) dε, where σ(ε) enhanced by auxetic draw-in
```

### 2.3 Material Properties
Engineered TPU-based auxetic foam with ceramic reinforcement:

```
Base Polymer: TPU 85A (polyester-based)
Ceramic Filler: Al₂O₃ hollow spheres (50-100μm, 20wt%)
Strut Geometry: Re-entrant angle 60°, thickness 0.2mm
Cell Size: 3-5mm (scales with Renaissance panel geometry)
Density: 120 kg/m³ (foam), 95 kg/m³ (effective with cells)
Compressive Yield (quasi-static): 0.8 MPa
Compressive Yield (dynamic @ 10³/s): 4.5 MPa
Plateau Stress: 1.2 MPa (quasi-static), 6.0 MPa (dynamic)
Densification Strain: 0.65-0.75
```

### 2.4 Blast Wave Interaction
The auxetic foam attenuates blast through multiple mechanisms:

```
Incident Blast Wave (P₀, t_d):
  1. Impedance mismatch at ceramic/foam interface → reflection
  2. Foam compression → auxetic lateral draw-in → momentum redistribution
  3. Pore collapse → gas pressurization → viscous dissipation
  4. Densification lock-up → rigid load transfer to spall liner

Transmitted Pressure: P_t = P₀ × exp(-α × ρ* × t_d × c₀)
α ≈ 2.5 (auxetic enhancement factor vs. conventional foam)
c₀ = √(E/ρ) ≈ 80 m/s (foam wave speed)
```
