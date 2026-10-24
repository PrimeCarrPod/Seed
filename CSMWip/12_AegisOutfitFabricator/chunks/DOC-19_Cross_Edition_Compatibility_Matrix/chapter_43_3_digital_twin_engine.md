## 3. Digital Twin Engine

### 3.1 Engine Version Matrix

| Edition | Engine Version | Physics Models | Edition ROMs | ML Models | Cloud API |
|---------|----------------|----------------|--------------|-----------|-----------|
| **RM-TS** | v3.1 | Shared 90% | Edition-specific | Shared 80% | Identical |
| **RM-TG** | v3.1 | Shared 90% | Edition-specific | Shared 80% | Identical |
| **RM-SS** | v2.8 | Shared 90% | Edition-specific | Shared 80% | Identical |
| **RM-SG** | v2.9 | Shared 90% | Edition-specific | Shared 80% | Identical |
| **RW-TS** | v3.1 | Shared 90% | Edition-specific | Shared 80% | Identical |
| **RW-TG** | v3.1 | Shared 90% | Edition-specific | Shared 80% | Identical |
| **RW-SS** | v2.8 | Shared 90% | Edition-specific | Shared 80% | Identical |
| **RW-SG** | v2.9 | Shared 90% | Edition-specific | Shared 80% | Identical |

### 3.2 Shared Engine Components

| Component | Lines of Code | Shared % | Edition-Specific |
|-----------|---------------|----------|------------------|
| **FEM Solver Interface** | 24,600 | 100% | — |
| **Thermal ROM** | 18,400 | 100% | Material props |
| **EMI ROM** | 15,200 | 100% | Geometry |
| **Multibody Dynamics** | 22,800 | 100% | Mass/inertia |
| **Kalman Filter** | 8,600 | 100% | Noise params |
| **RUL Estimator** | 12,400 | 80% | Degradation models |
| **Anomaly Detector** | 9,800 | 80% | Thresholds |
| **TOTAL** | **111,800** | **89%** | **11%** |

### 3.3 Digital Twin Update Compatibility

| Update Type | Compatibility | Notes |
|-------------|---------------|-------|
| **ROM Update** | Per edition | Downloaded on edition detect |
| **ML Model Update** | All editions | Shared models auto-update |
| **Physics Model** | All editions | Version-controlled |
| **Cross-Edition ROM** | Not supported | Factory load only |

---

