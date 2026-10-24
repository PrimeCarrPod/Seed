## 6. Impact Protection System (Layers 8 & 9)

### 6.1 STF Impregnation (SYNTH-02 §2.4, MAT-03 §4)

**STF Formulation:**
```
Silica nanoparticles: 20-50 nm (Stöber process)
Concentration: 55 wt% in PEG-400
Shear thickening onset: γ̇_c ≈ 10-50 s⁻¹
Viscosity jump: η_max / η₀ ≈ 100-1000×
Off-state viscosity: η₀ ≈ 0.8 Pa·s
On-state viscosity: η_max ≈ 85 Pa·s
```

**Vacuum Impregnation Protocol (MAT-03 §4.2):**
```
STF Bath: SiO₂ (20-50 nm) 55 wt% in PEG-400
  Viscosity: 50-100 mPa·s at 40°C
  Degassing: 10 mbar, 10 min

Impregnation Cycle:
  1. Fabric load: Silk/linen 150-250 g/m²
  2. Vacuum: 10-50 mbar, 30-60 min at 50°C
  3. Pressure release: 1 mbar/s (capillary penetration)
  4. Centrifuge: 500 rpm, 2 min
  5. Cure: 80°C, 2 hr

Add-on: 15-25% weight gain
Flexibility retention: >70%
```

### 6.2 Impact Performance (CSMFAB078-B §6.2)

**50J Impact Test (5kg drop mass, 1m):**
| Configuration | Peak Force | BFS | Reduction |
|---------------|------------|-----|-----------|
| Without STF | 8.2 kN | 38mm | Baseline |
| With STF (Layer 8) | 2.9 kN | 14mm | 65% force, 63% BFS |
| With STF (Layers 8+9) | 2.5 kN | 12mm | 69% force, 68% BFS |

**Shear Rate Transition:**
```
Normal movement: γ̇ < 5 s⁻¹ → η ≈ η₀ (flexible, comfortable)
Impact event: γ̇ > 500 s⁻¹ → η → η_max (rigid, protective)
Transition: γ̇_c ≈ 10-50 s⁻¹
Recovery: <100ms to off-state
```

**STF Viscosity Model (Hoffman-Lauritzen):**
```
$\eta(\dot{\gamma}) = \eta_0 \left[ 1 + \left( rac{\dot{\gamma}}{\dot{\gamma}_c} 
ight)^n 
ight]^{rac{m-1}{n}}$
```
**Force Reduction Efficiency:**
```
$\eta_F = 1 - rac{F_{STF}}{F_{baseline}}$  where target $\eta_F \ge 0.65$
```
**Backface Signature (BFS) Correlation:**
```
$BFS = k_1 V_{impact}^2 + k_2 rac{E_{abs}}{A} + k_3 \eta_{STF}$
```
