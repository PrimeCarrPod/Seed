## 2. Digital Twin Commonality

### 2.1 Digital Twin Architecture

| Layer | RM Editions | RW Editions | Commonality |
|-------|-------------|-------------|-------------|
| **Physical Asset** | Sensored ensemble | Sensored ensemble | 100% |
| **Digital Model** | Shared physics (90%) | Shared physics (90%) | 90% |
| **Data Integration** | BLE 5.0 Mesh → Edge → Cloud | Same | 100% |
| **Analytics** | RUL, anomaly, optimization | Same | 95% |
| **Services** | Wrist display, base, command | Same | 100% |

### 2.2 Reduced-Order Models (ROMs)

| ROM | Training Data | Shared % | Edition-Specific |
|-----|---------------|----------|------------------|
| **Thermal ROM** | 500 sims × 8 editions | 95% | Material props |
| **Structural ROM** | 300 sims × 8 editions | 90% | Geometry |
| **EMI ROM** | 400 sims × 8 editions | 85% | Geometry |
| **Mobility ROM** | 200 sims × 8 editions | 80% | Mass/inertia |
| **RUL Estimator** | Field data × 8 editions | 75% | Degradation models |

### 2.3 Real-Time Digital Twin Update

```python