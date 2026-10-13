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

