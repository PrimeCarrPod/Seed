## 8. Thread Material Science (SYNTH-01 §9)

### 8.1 Historical Thread Materials

| Material | Tenacity | Thermal Limit | Application |
|----------|----------|---------------|-------------|
| Linen (flax) | High tensile, low abrasion | 250°C (chars) | Structural seams, framework lacing |
| Silk | High tensile, good abrasion | 250°C (chars) | Decorative seams, embroidery |
| Beeswax-coated linen | Lubricated, thermal sink | 60-80°C (wax melt) | All structural hand-stitching |
| Metallic gilded thread | AuHg on silk core | 200°C (AuHg stable) | Brocade, EMI shielding |

### 8.2 Modern Protective Thread Equivalents (Research Doc 2 §3)

| Modern Thread | Core/Sheath | Thermal Limit | Historical Analog |
|---------------|-------------|---------------|-------------------|
| Poly-Cotton Core-Spun | PET core (65%) + Cotton sheath (35%) | Protects PET to 252°C | Silk core + beeswax + cotton sheath |
| PTFE-Fiberglass | PTFE-coated fiberglass | 537°C | Synthetic baleen candidate |
| PTFE-Quartz | PTFE-coated quartz | 1093°C | Extreme thermal protection |
| Para-Aramid + SS | Aramid core + SS sheath | >500°C retained | Spiral steel substitute |

### 8.3 Needle Thermodynamics for Hand-Stitch Simulation (SYNTH-01 §10)

```
Machine conditions (for reference):
- 3000-4000 RPM → needle temp 300-400°C
- PET loses >50% strength at 250°C

Heat flux equation: q_thread = β × μ × F_n × v_slip
  β = 0.958 (partition ratio)
  μ = 0.3 (friction coefficient)
  F_n = normal force
  v_slip = slip velocity

Thread temperature rise: ΔT ∝ 1/(ρ × c × k)
  ρ = 1400 kg/m³, c = 750 J/kgK, k = 0.15 W/mK (silk)
  Thermal bottleneck: low conductivity prevents heat dissipation

Historical mitigation (beeswax coating):
- Reduces μ (kinetic friction coefficient)
- Thermal sink: absorbs/dissipates heat
- Binds fibers: prevents torque-induced fraying
```

**Needle Heat Flux (Johnson-Cook Thermal):**
```
$q_{thread} = \beta \mu F_n v_{slip}$  where $\beta = 0.958$, $\mu = 0.3$
```
```
\Delta T = \frac{q_{thread}}{2 \pi k_{eff}} \ln\left(\frac{r_{out}}{r_{in}}\right)$  (cylindrical heat flow)
```
```
\frac{1}{k_{eff}} = \frac{1}{k_{silk}} + \frac{1}{k_{wax}} + \frac{1}{k_{cotton}}$  (series thermal resistance)
```
