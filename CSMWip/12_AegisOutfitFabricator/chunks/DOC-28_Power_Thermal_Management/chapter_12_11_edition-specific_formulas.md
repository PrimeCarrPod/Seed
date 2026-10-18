## 11. Edition-Specific Formulas

### 11.1 MHD Power Scaling
```
P_MHD = N_ch × σ × v² × B² × A_ch × η_cond
N_ch = N_base × (Cₑ/C_ref) × (1 + αₑ)
N_base = 600 (RM-TS)
Cₑ = edition chest circumference
αₑ = morphology exponent (MAT-04)
η_cond = 0.903 (conditioning efficiency)
```

### 11.2 Battery Sizing
```
E_batt = (P_avg × t_mission) / (η_bus × DoD_max)
P_avg = 500 W (baseline)
t_mission = 8 h
η_bus = 0.903
DoD_max = 0.8 (Li-S), 0.5 (LTO)
E_Li-S = 4.43 kWh → 1.55 kWh (single day) + resupply
E_LTO = 0.5 kWh (reserve, 50% DoD)
```

### 11.3 Heat Pump COP
```
COP_cooling = T_evap / (T_cond - T_evap) × η_carnot × η_comp
T_evap = 278 K (5°C), T_cond = 308 K (35°C)
η_carnot = 0.5 (real cycle)
η_comp = 0.85 (scroll)
COP = 278/30 × 0.5 × 0.85 = 3.93 → 3.5 (with losses)

COP_heating = T_cond / (T_cond - T_evap) × η_carnot × η_comp
T_evap = 263 K (-10°C), T_cond = 313 K (40°C)
COP = 313/50 × 0.5 × 0.85 = 2.66 → 4.2 (with heat recovery)
```

### 11.4 Radiator Sizing
```
A_rad = Q_reject / (ε × σ × (T_surf⁴ - T_amb⁴) + h × (T_surf - T_amb))
ε = 0.85 (anodized Al), σ = 5.67×10⁻⁸
T_surf = 320 K (47°C), T_amb = 298 K (25°C)
h = 5 W/m²K (natural convection)
A_rad = 300 / (0.85×5.67e-8×(320⁴-298⁴) + 5×22) = 0.48 m² → 0.5 m² spec
```

### 11.5 Thermal Loop Flow
```
ṁ = Q / (c_p × ΔT)
Q = 500 W, c_p = 1200 J/kg·K (HFE-7100), ΔT = 10 K
ṁ = 0.042 kg/s = 2.5 L/min (ρ = 1.6 kg/L)
Per zone: 0.8 L/min (electronics), 0.8 L/min (battery), 0.9 L/min (body)
```

---
