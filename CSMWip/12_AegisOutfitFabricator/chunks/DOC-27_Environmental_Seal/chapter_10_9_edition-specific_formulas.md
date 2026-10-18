## 9. Edition-Specific Formulas

### 9.1 Seal Groove Scaling (Garsault)
```
Groove_Width = k_w × Cₑ/100
Groove_Depth = k_d × Cₑ/100
k_w = 0.3 (neck), 0.25 (wrist), 0.2 (hip)
k_d = 0.3 (all)
Cₑ = edition circumference (mm)
```

### 9.2 MOF Sizing
```
m_MOF = (Q_CO₂ × t_cycle) / (C_MOF × η_util)
Q_CO₂ = 0.84 L/min × 1.96 g/L × 60 min/h × 24 h = 2.37 kg/day
t_cycle = 4 h
C_MOF = 9.2 mmol/g = 0.405 g CO₂/g MOF
η_util = 0.75 (utilization factor)
m_MOF = (2.37 × 4/24) / (0.405 × 0.75) = 2.2 kg/bed → 2.5 kg spec
```

### 9.3 O₂ Generation Sizing
```
m_O₂ = Q_O₂ × t_mission
Q_O₂ = 0.84 L/min × 1.43 g/L = 1.2 kg/day (metabolic)
t_mission = 8h primary + 72h backup
m_primary = 0.4 kg (8h SOEC)
m_backup = 2.0 kg (cryogenic)
```

### 9.4 Water Recovery Sizing
```
m_H₂O = (m_metabolic + m_condensate) × η_recovery
m_metabolic = 2.5 L/day (urine + insensible)
m_condensate = 1.2 L/day (exhaled)
η_recovery = 0.85 (urine) + 0.90 (condensate)
m_potable = 2.5 × 0.85 + 1.2 × 0.90 = 3.2 L/day → 3.0 L reserve
```

### 9.5 Thermal Rejection Sizing
```
Q_reject = Q_metabolic + Q_environmental + Q_electronics
Q_metabolic = 200 W (continuous)
Q_environmental = 150 W (vacuum) / 50 W (atmospheric)
Q_electronics = 100 W (peak) / 30 W (continuous)
Q_peak = 450 W (vacuum) / 300 W (atmospheric)
```

---
