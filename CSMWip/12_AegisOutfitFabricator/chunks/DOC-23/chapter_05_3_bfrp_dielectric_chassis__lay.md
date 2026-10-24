## 3. BFRP Dielectric Chassis — Layer 10 (MAT-02 §3.1, CSMFAB078 §4.3)

### 3.1 BFRP Material Specification

```
Fiber: Continuous basalt fiber (Kamenny Vek, 17 μm Ø, 4.8 GPa tensile)
Matrix: Epoxy vinyl ester (Derakane 8084) + 2% nano-silica
Fiber volume fraction: V_f = 0.55-0.60
Layup: [0/±45/90]₂s quasi-isotropic
Thickness: 3mm (RM-SS/SG, RW-SS/SG), 5mm (RM-TS/TG, RW-TS/TG)
```

**Electrical Properties:**
| Property | Value | Test Method |
|----------|-------|-------------|
| Volume resistivity | ≥10¹⁴ Ω·cm | ASTM D257 |
| Surface resistivity | ≥10¹³ Ω/sq | ASTM D257 |
| Dielectric strength | ≥25 kV/mm | ASTM D149 |
| Dielectric constant (1 MHz) | 4.2 ± 0.3 | ASTM D150 |
| Loss tangent (1 MHz) | 0.015 ± 0.003 | ASTM D150 |
| Arc resistance | ≥180 s | ASTM D495 |

**Thermal Properties:**
| Property | Value |
|----------|-------|
| Glass transition (T_g) | 145°C |
| Decomposition (T_d) | 380°C |
| CTE (0-100°C) | 8.5 × 10⁻⁶ /°C |
| Thermal conductivity | 0.35 W/m·K |

### 3.2 GIC Current Path Analysis (CSMFAB078-B §4.3)

**Carrington-Class Event (dB/dt = 5000 nT/s):**
```
Induced electric field: E = -dΦ/dt = -A × dB/dt
A = suit loop area ≈ 1.5 m² (torso circumference × height)
E = 1.5 × 5000×10⁻⁹ = 7.5 μV/m

Without protection: I_GIC = E × σ_suit × A_cross
σ_suit (textile) ≈ 10 S/m (damp silk)
I_GIC ≈ 7.5×10⁻⁶ × 10 × 0.01 = 0.75 μA (negligible)

WITH PROTECTION (BFRP chassis as primary path):
R_BFRP = ρ × L/A = 10¹⁴ Ω·cm × 150 cm / 15 cm² = 10¹⁵ Ω
I_GIC = V_induced / R_BFRP = (7.5 μV/m × 1.5 m) / 10¹⁵ Ω = 1.1×10⁻²⁰ A
```

**Protection Strategy — Shunt to Ground:**
```
BFRP chassis provides HIGH resistance path (open circuit to GIC)
Metallic thread layers provide LOW resistance shunt path (parallel)
Ground reference: Conductive heel contact → earth
GIC current diverted through Layer 3/6 Faraday cage → heel contact

Shunt resistance (Layer 3): R_shunt = L/(σ × A) 
L = 150 cm, A = 25μm × 4.7 stitches/cm × 150 cm = 1.76 cm²
R_shunt = 150 / (3.5×10⁷ × 1.76×10⁻⁴) = 0.024 Ω
```

**GIC Current Division:**
```
R_BFRP = 10¹⁵ Ω, R_shunt = 0.024 Ω
I_shunt / I_total = R_BFRP / (R_BFRP + R_shunt) ≈ 1.0
→ 99.999...% of GIC current flows through Faraday cage to ground
→ Suit interior sees <1 pA induced current
```

---
