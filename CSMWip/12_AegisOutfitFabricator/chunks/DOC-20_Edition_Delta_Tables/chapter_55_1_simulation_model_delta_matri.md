## 1. Simulation Model Delta Matrix

### 1.1 FEM Model Size & Complexity by Edition

| Edition | Structural FEM | Thermal FEM | EMI/EMC | Drape/Mobility |
|---------|----------------|-------------|---------|----------------|
| **RM-TS** | 2.8M elements | 450K elements | 2.2M hex | 12 zones |
| **RM-TG** | 3.2M elements | 520K elements | 2.5M hex | 12 zones |
| **RM-SS** | 2.5M elements | 420K elements | 2.0M hex | 12 zones |
| **RM-SG** | 2.8M elements | 450K elements | 2.2M hex | 12 zones |
| **RW-TS** | 2.8M elements | 450K elements | 2.2M hex | 12 zones |
| **RW-TG** | 3.2M elements | 520K elements | 2.5M hex | 12 zones |
| **RW-SS** | 2.5M elements | 420K elements | 2.0M hex | 12 zones |
| **RW-SG** | 2.8M elements | 450K elements | 2.2M hex | 12 zones |

### 1.2 Simulation Time & Resource Deltas

| Transition | Structural FEM Δ | Thermal FEM Δ | EMI/EMC Δ | Drape/Mobility Δ | Compute Time Δ |
|------------|------------------|---------------|-----------|------------------|----------------|
| **RM-TS → RM-TG** | +0.4M elements | +70K elements | +0.3M hex | 0 | +18% |
| **RM-TS → RM-SS** | -0.3M elements | -30K elements | -0.2M hex | 0 | -15% |
| **RM-TS → RM-SG** | 0 | 0 | 0 | 0 | 0% |
| **RM-TG → RM-SS** | -0.7M elements | -100K elements | -0.5M hex | 0 | -28% |
| **RW-TS → RW-TG** | +0.4M elements | +70K elements | +0.3M hex | 0 | +18% |
| **RW-TS → RW-SS** | -0.3M elements | -30K elements | -0.2M hex | 0 | -15% |
| **RW-TS → RW-SG** | 0 | 0 | 0 | 0 | 0% |

---

