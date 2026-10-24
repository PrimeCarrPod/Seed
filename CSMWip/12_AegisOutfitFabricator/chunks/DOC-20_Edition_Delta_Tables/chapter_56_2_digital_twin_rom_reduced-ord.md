## 2. Digital Twin ROM (Reduced-Order Model) Deltas

### 2.1 ROM Training Data by Edition

| ROM Type | RM-TS | RM-TG | RM-SS | RM-SG | RW-TS | RW-TG | RW-SS | RW-SG |
|----------|-------|-------|-------|-------|-------|-------|-------|-------|
| **Thermal ROM** | 500 sims | 500 sims | 500 sims | 500 sims | 500 sims | 500 sims | 500 sims | 500 sims |
| **Structural ROM** | 300 sims | 300 sims | 300 sims | 300 sims | 300 sims | 300 sims | 300 sims | 300 sims |
| **EMI ROM** | 400 sims | 400 sims | 400 sims | 400 sims | 400 sims | 400 sims | 400 sims | 400 sims |
| **Mobility ROM** | 200 sims | 200 sims | 200 sims | 200 sims | 200 sims | 200 sims | 200 sims | 200 sims |
| **RUL Estimator** | Field data | Field data | Field data | Field data | Field data | Field data | Field data | Field data |

### 2.2 ROM Shared Components by Edition

| ROM Type | Shared % | Edition-Specific Parameters |
|----------|----------|----------------------------|
| **Thermal ROM** | 95% | Material props, geometry |
| **Structural ROM** | 90% | Geometry, mass |
| **EMI ROM** | 85% | Geometry, tile layout |
| **Mobility ROM** | 80% | Mass, inertia, ROM |
| **RUL Estimator** | 75% | Degradation models |

### 2.3 ROM Delta by Transition

| Transition | Thermal ROM Δ | Structural ROM Δ | EMI ROM Δ | Mobility ROM Δ | RUL Δ |
|------------|---------------|------------------|-----------|----------------|-------|
| **RM-TS → RM-TG** | Geometry, props | Geometry, mass | Geometry, tile layout | Mass, inertia | Degradation models |
| **RM-TS → RM-SS** | Geometry, props | Geometry, mass | Geometry, tile layout | Mass, inertia | Degradation models |
| **RW-TS → RW-TG** | Geometry, props | Geometry, mass | Geometry, tile layout | Mass, inertia | Degradation models |
| **RW-TS → RW-SS** | Geometry, props | Geometry, mass | Geometry, tile layout | Mass, inertia | Degradation models |
| **Cross-Gender (RM ↔ RW)** | Major (geometry) | Major (mass/inertia) | Major (geometry) | Major (mass/inertia) | Major (degradation) |

---

