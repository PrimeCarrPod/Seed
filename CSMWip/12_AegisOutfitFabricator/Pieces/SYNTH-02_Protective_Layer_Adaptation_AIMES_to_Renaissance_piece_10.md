**Effective Thermal Conductivity (Maxwell-Eucken Model):**
```
k_eff = k_m × (k_d + 2k_m - 2φ(k_m - k_d)) / (k_d + 2k_m + φ(k_m - k_d))
Where:
k_m = matrix conductivity (air ≈ 0.026 W/m·K)
k_d = dispersed phase (aerogel ≈ 0.010 W/m·K)
φ = aerogel volume fraction in batting

For φ = 0.85, k_shell = 0.2 W/m·K (MF shell):
k_eff ≈ 0.015 W/m·K  ← TARGET ACHIEVED
```

**Quilting Geometry Thermal Resistance:**
```
Diamond trapunto pattern:
Cell size: 50mm × 50mm
Stitch depth: 3mm
Batting thickness: 5mm (compressed from 8mm loft)
R_quilting = t_compressed / k_eff = 0.003 / 0.015 = 0.2 m²K/W
R_air_gap = 0.005 / 0.026 = 0.19 m²K/W
Total R = 0.39 m²K/W  →  Exceeds 0.33 target
```

### 6.4 STF Impregnation Vacuum Process Parameters

