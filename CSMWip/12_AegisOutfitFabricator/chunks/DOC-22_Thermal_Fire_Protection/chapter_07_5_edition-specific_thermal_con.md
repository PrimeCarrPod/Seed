## 5. Edition-Specific Thermal Configurations

### 5.1 Heat Flux Path Analysis (CSMFAB078-B §3.1)

```
EXTERNAL: 1100°C, 150 kW/m² (NFPA 1971 flash fire)
q_ext = h_conv(T_flame-T_surf) + εσ(T_flame⁴-T_surf⁴) + q_rad,flame

LAYER 1: YInMn+QD (230μm)
  q_reflected = 0.85 × q_rad,flame
  q_absorbed = 0.15 × q_rad,flame
  ΔT = -14°C

LAYER 2: ZrB₂-SiC (6mm, k=65 W/m·K)
  Quasi-steady: 300s ≪ L²/α (τ=1700s)
  q_cond = k × ΔT / L

LAYER 3-4: MXene + FSS (negligible thermal R)

LAYER 5: Aerogel batting (10-15mm, k=0.015 W/m·K)
  R_aerogel = 0.010-0.015/0.015 = 0.67-1.0 m²K/W
  ΔT = q × R = 150,000 × 0.67-1.0 = 100-150 K

LAYER 6-7: MXene + ZrB₂-SiC backup (negligible R)

LAYER 8: MR fluid (3mm, k≈0.15) + STF (2mm)

LAYER 9: PCM (4mm, 800 kJ/m² latent)
  Absorbs transient: T_skin stabilized

INTERIOR: T_skin ≤ 60°C (target)
```

### 5.2 Edition Thickness Scaling

| Edition | Aerogel Batting | PCM Layer | UHTC Coating | Total Thermal R |
|---------|-----------------|-----------|--------------|-----------------|
| RM-TS/TG | 15mm | 4mm | 230μm | 1.0 m²K/W |
| RM-SS/SG | 10mm | 4mm | 230μm | 0.67 m²K/W |
| RW-TS/TG | 15mm | 4mm | 230μm | 1.0 m²K/W |
| RW-SS/SG | 10mm | 4mm | 230μm | 0.67 m²K/W |

*Compact editions (SS/SG) reduce batting thickness; compensated by higher PCM density and MR fluid activation.*

### 5.3 Mass by Edition

| Edition | UHTC Coating | Aerogel Batting | PCM Layer | Total Thermal Mass |
|---------|--------------|-----------------|-----------|-------------------|
| RM-TS | 1.2 kg | 1.8 kg | 3.2 kg/m² × 1.8m² = 5.8 kg | 8.8 kg |
| RM-TG | 1.5 kg | 2.4 kg | 3.2 kg/m² × 2.4m² = 7.7 kg | 11.6 kg |
| RM-SS | 1.0 kg | 1.2 kg | 3.2 kg/m² × 1.2m² = 3.8 kg | 6.0 kg |
| RM-SG | 1.1 kg | 1.6 kg | 3.2 kg/m² × 1.6m² = 5.1 kg | 7.8 kg |
| RW variants | matched | matched | matched | matched |

---
