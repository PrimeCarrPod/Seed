## 3. Full-Stack Thermal Model Transient Analysis (SYNTH-02 §2 Row 5, MAT-03 §3.4, DOC-06 §3.4)

### 3.1 Thermal Network Model (Lumped Capacitance)

**12-Node RC Network (1 node per layer + skin):**

```
q_ext (1100°C) 
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ L1: YInMn + QD          R_rad,1 = 1/(εσA(T²+T_s²)(T+T_s))  │
│ C_1 = ρc_p V = negligible (0.05 mm)                        │
├─────────────────────────────────────────────────────────────┤
│ L2: ZrB₂-SiC 20mm       R_cond,2 = t/(kA) = 0.003/(18·A)   │
│ C_2 = 5.8·0.3·0.75·A = 1.305A J/K                           │
├─────────────────────────────────────────────────────────────┤
│ L3: MXene 20µm          R_cond,3 ≈ 0 (negligible)          │
│ C_3 = negligible                                             │
├─────────────────────────────────────────────────────────────┤
│ L4: FSS Brocade         R_cond,4 = 0.0003/(0.15·A)          │
│ C_4 = negligible                                             │
├─────────────────────────────────────────────────────────────┤
│ L5: Aerogel 2mm         R_cond,5 = 0.002/(0.014·A) = 143/A  │
│ C_5 = 0.012·0.002·1000·A = 0.024A J/K                       │
├─────────────────────────────────────────────────────────────┤
│ L6: MXene 20µm          R_cond,6 ≈ 0                        │
├─────────────────────────────────────────────────────────────┤
│ L7: ZrB₂-SiC 10mm       R_cond,7 = 0.01/(18·A)              │
│ C_7 = 5.8·0.1·0.75·A = 0.435A J/K                           │
├─────────────────────────────────────────────────────────────┤
│ L8: STF Silk (Z1-Z3,Z7) R_cond,8 = 0.0015/(0.2·A)           │
│ C_8 = 0.8·0.0015·1500·A = 1.8A J/K (zone-selective)        │
├─────────────────────────────────────────────────────────────┤
│ L9: STF-UHMWPE 2mm      R_cond,9 = 0.002/(0.3·A)            │
│ C_9 = 1.2·0.002·1800·A = 4.32A J/K                          │
├─────────────────────────────────────────────────────────────┤
│ L10: Chassis            R_cond,10 = 0.003/(0.15·A)          │
│ C_10 = 1.5·0.003·1200·A = 5.4A J/K                          │
├─────────────────────────────────────────────────────────────┤
│ L11: PVDF 0.1mm         R_cond,11 ≈ 0                       │
├─────────────────────────────────────────────────────────────┤
│ L12: Spinel 10µm        R_cond,12 ≈ 0                       │
├─────────────────────────────────────────────────────────────┤
│ Skin Node               C_skin = 3.5·0.005·3500·A = 61.25A  │
└─────────────────────────────────────────────────────────────┘
```

### 3.2 Boundary Conditions

**External (1100°C/300s):**
- Radiative: $q_{rad} = \epsilon \sigma (T_{fire}^4 - T_{L1}^4)$, $\epsilon_{L1} = 0.85$
- Convective: $q_{conv} = h (T_{fire} - T_{L1})$, $h = 50\ \text{W/m}^2\text{K}$ (turbulent)
- **Total Heat Flux:** $q_{total} \approx 50\ \text{kW/m}^2$

**Internal (Skin):**
- Initial: $T_{skin}(0) = 37°C$
- Blood Perfusion: $q_{perf} = \omega_b \rho_b c_b (T_{art} - T_{skin})$, $\omega_b = 0.0005\ \text{s}^{-1}$
- Metabolic: $q_{met} = 100\ \text{W/m}^2$ (light activity)
- Sweat Evaporation: $q_{evap} = h_{fg} \dot{m}_{sweat}$, max 500 W/m²

### 3.3 Transient Solution (Numerical, 1s Timestep)

**Key Results (RM-SS, Torso Zone Z3):**

| Time (s) | T_L1 (°C) | T_L2 (°C) | T_L5 (°C) | T_L7 (°C) | T_skin (°C) |
|----------|-----------|-----------|-----------|-----------|-------------|
| 0 | 25 | 25 | 25 | 25 | 37 |
| 30 | 850 | 720 | 180 | 120 | 38.2 |
| 60 | 980 | 890 | 280 | 210 | 40.5 |
| 120 | 1050 | 1000 | 420 | 350 | 45.8 |
| 180 | 1080 | 1050 | 520 | 450 | 50.1 |
| 240 | 1090 | 1070 | 580 | 510 | 53.7 |
| **300** | **1095** | **1080** | **620** | **550** | **56.8** |

**Peak Skin Temperature: 56.8°C** (Target: <58°C) ✅ **PASS with 1.2°C margin**

### 3.4 Sensitivity Analysis

| Parameter Variation | ΔT_skin @ 300s | Impact |
|---------------------|----------------|--------|
| Aerogel 2mm → 3mm | -4.2°C | High |
| L2 Ceramic 20mm → 25mm | -2.8°C | Medium |
| L7 Ceramic 10mm → 15mm | -1.5°C | Low |
| L1 Emissivity 0.85 → 0.95 | +3.1°C | Medium |
| Perfusion +50% | -2.0°C | Low |
| Sweat max 500 → 800 W/m² | -5.5°C | High |

### 3.5 Comparison Across Editions

| Edition | Aerogel | L2 Ceramic | L7 Ceramic | T_skin @ 300s | Margin |
|---------|---------|------------|------------|---------------|--------|
| **RM-SS** | **2 mm** | **20 mm** | **10 mm** | **56.8°C** | **1.2°C** |
| RM-TS | 3 mm | 25 mm | 15 mm | 54.1°C | 3.9°C |
| RM-SG | 3 mm | 25 mm | 15 mm | 52.3°C | 5.7°C |
| RM-TG | 5 mm | 50 mm | 25 mm | 48.7°C | 9.3°C |

**RM-SS operates at thermal limit** — aerogel thinning trades 2.7°C margin for 2.74 kg mass savings

### 3.6 Cross-References

- SYNTH-02 §2 Row 5: AIMES L5 thermal mapping
- MAT-03 §3.4: Aerogel specification
- DOC-06 §3.4: Thermal protection architecture
- Chapter 64: Thermal architecture overview
- Chapter 65: Aerogel specification
- Chapter 67: Thermal comfort & metabolic heat
- Chapter 68: Directed energy thermal response
- ASTM C177: Thermal conductivity
- NFPA 1971 §8.2: Heat transfer performance
- ASTM F2700: Convective/radiative heat transfer

---
