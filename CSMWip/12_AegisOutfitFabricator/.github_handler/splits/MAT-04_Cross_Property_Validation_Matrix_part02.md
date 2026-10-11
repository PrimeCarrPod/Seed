
**Edition-Specific Curves:**
- LE-TS: Higher HAS achievable (less material needed)
- LE-TG: Lower HAS for same PES (more coverage required)
- LE-SS: Highest HAS potential (smallest surface)
- LE-SG: Most constrained (large surface + high protection)

**Hypervolume Indicator:**
```
HV = ∫∫ I(HAS, PES) dHAS dPES
Reference point: (0, 0)
Target HV ≥ 0.7 × HV_max
```

### 1.3 Constraint Handling
**Weight Constraint Penalty:**
```
f_penalty = max(0, Weight - 26)² × 1000
```

**Cost Constraint:**
```
Cost = Σ (m_i × c_i) + C_labor + C_overhead
c_ceramic = $500/kg, c_textile = $100/kg, c_framework = $200/kg
```

## 2. Weight Budget Per Edition

### 2.1 AIMES Baseline (CSMFAB078 §3.3)
| Edition | Tiles | Tile Mass | Total System Mass |
