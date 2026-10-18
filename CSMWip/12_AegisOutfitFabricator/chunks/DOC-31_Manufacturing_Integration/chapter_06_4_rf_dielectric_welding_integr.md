## 4. RF (Dielectric) Welding Integration

### 4.1 RF Welding Physics (Research Doc 2 §7.2)

Dielectric welding at 27.12 MHz excites polar molecules (PVC, polyurethane) for volumetric heating.

**System Configuration:**
```
Generator: 5 kW solid-state, 27.12 MHz ± 0.01%
Electrodes: Brass (C36000), water-cooled, 200×50 mm active area
Pressure: Pneumatic, 0.1-0.5 MPa, ±0.01 MPa
Matching network: Auto-tune π-network, VSWR < 1.2:1
```

**Energy Deposition Model:**

The penetration depth is $\delta_p = \sqrt{2/(\omega \mu \sigma)}$ for conductive materials.

```
Electric field: E = V_gap / d_gap  [V/m]
Power density: p = ω × ε_0 × ε''_r × |E|²  [W/m³]
ω = 2π × 27.12×10⁶ rad/s
ε_0 = 8.854×10⁻¹² F/m
ε''_r = loss factor (PVC ≈ 0.12, PU ≈ 0.08)

Temperature evolution:
ρ c_p ∂T/∂t = ∇·(k ∇T) + p
Boundary: -k ∇T = h(T - T_amb) + εσ(T⁴ - T_amb⁴)
```

The thermal diffusion time is $\tau_{th} = L^2/\alpha$ where $\alpha = k/(\rho c_p)$.

### 4.2 RF Weld Parameters for Hermetic Layers

| Seam ID | Layer Pair | Voltage | Power | Time | Pressure | Cooling |
|---------|------------|---------|-------|------|----------|---------|
| **RF-01** | L3-L3 (Ceramic edge) | 1.8 kV | 3.2 kW | 2.5 s | 0.2 MPa | 1.0 s |
| **RF-02** | L5-L5 (Faraday edge) | 1.5 kV | 2.8 kW | 3.0 s | 0.15 MPa | 1.5 s |
| **RF-03** | L9-L9 (Hermetic) | 2.0 kV | 4.0 kW | 4.0 s | 0.3 MPa | 2.0 s |
| **RF-04** | L9-L1 (Hermetic/Base) | 1.8 kV | 3.5 kW | 3.5 s | 0.25 MPa | 1.5 s |

**Hermetic Seal Validation:**
```
Helium leak test: Q_He < 1×10⁻⁹ mbar·L/s (ISO 15858)
Pressure decay: ΔP < 0.1 kPa over 300 s at 200 kPa gauge
Burst pressure: P_burst ≥ 500 kPa (5× operating)
```

---
