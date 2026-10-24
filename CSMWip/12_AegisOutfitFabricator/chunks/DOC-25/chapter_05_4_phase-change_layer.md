## 4. Phase-Change Layer

### 4.1 Material Selection and Properties
The phase-change layer absorbs thermal energy through latent heat of fusion:

```
Selected PCM: Paraffin wax (C₂₅H₅₂) with graphite nanoparticles
Melting Point: 58°C ±2°C
Latent Heat: 200 kJ/kg
Specific Heat (solid): 2.5 kJ/kg·K
Specific Heat (liquid): 3.2 kJ/kg·K
Density: 900 kg/m³
Thermal Conductivity: 0.4 W/m·K (with 5wt% graphite)
```

### 4.2 Thermal Protection Mechanism
Energy absorption occurs during phase transition:

```
Energy Absorbed: Q = m * L  (where L = latent heat)
Temperature Stabilization: T ≈ T_melt during phase change
Heat Flux Handling: q_max = (k * ΔT) / d  (conduction through layer)
```
For 5 mm thickness and ΔT = 50°C, q_max ≈ 4 kW/cm² (conduction limit).

### 4.3 Nanoparticle Enhancement
Graphite nanoparticles improve thermal conductivity and stability:

```
Thermal Conductivity Increase: k_eff = k_m * (1 + 3φ*(k_p - k_m)/(k_p + 2k_m))
where φ = nanoparticle volume fraction (0.05)
k_p = 1500 W/m·K (graphite), k_m = 0.2 W/m·K (paraffin)
k_eff ≈ 0.4 W/m·K (100% increase)
```
Prevents localized overheating and improves heat spreading.
