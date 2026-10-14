## 5. Marker Efficiency Metrics

### 5.1 Primary Metrics
```
Marker Efficiency: η = Σ Area(P_i) / (W × L) × 100%
Target: η > 85%

Fabric Waste: Waste = W × L - Σ Area(P_i) - Σ Area(Remnants)
Waste % = Waste / (W × L) × 100%
Target: Waste < 5%

Remnant Utilization: ρ = Σ Area(Used_Remnants) / Σ Area(All_Remnants)
Target: ρ > 70%
```

### 5.2 Secondary Metrics
```
Number of Remnants: N_rem (minimize)
Largest Remnant: A_max (maximize for reuse)
Grain Compliance: % pieces with correct grain orientation
Pattern Match Score: Alignment quality for repeats
```

### 5.3 Edition-Specific Targets
| Edition | Pieces | η Target | Waste Target | ρ Target |
|---------|--------|----------|--------------|----------|
| RM-TS | 45 | 88% | <4% | 75% |
| RM-TG | 55 | 87% | <4% | 72% |
| RM-SS | 40 | 89% | <3% | 78% |
| RM-SG | 60 | 86% | <5% | 70% |
| RW-TS | 45 | 88% | <4% | 75% |
| RW-TG | 55 | 87% | <4% | 72% |
| RW-SS | 40 | 89% | <3% | 78% |
| RW-SG | 60 | 86% | <5% | 70% |
