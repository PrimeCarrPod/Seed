## 5. Thermal Insulation System (Layer 5)

### 5.1 Aerogel Micro-Encapsulation (SYNTH-02 §2.3, MAT-03 §3)

**Encapsulation Parameters:**
```
Core: TEOS + PMDA-ODA polyimide aerogel (λ = 0.010 W/m·K)
Shell: Melamine formaldehyde (MF), 5-20μm thickness
Size distribution: D₅₀ = 50-100μm, D₉₀ < 200μm, span < 1.5
Encapsulation efficiency: >90% aerogel retention
Batting weight: 100-200 g/m² (compressed to 5mm)
```

**Quilting Integration (Research Doc 1 §6.1):**
```
Pattern: Diamond/trapunto (18th C court dress)
Stitch density: 18-22 SPI
Thread: Beeswax-coated linen (thermal sink + lubrication)
Cell size: 50mm × 50mm
Compressed thickness: 5mm (from 8mm loft)
```

### 5.2 Thermal Resistance

**Effective Thermal Conductivity (Maxwell-Eucken):**
```
k_eff = k_m × (k_d + 2k_m - 2φ(k_m - k_d)) / (k_d + 2k_m + φ(k_m - k_d))
k_m = 0.026 W/m·K (air), k_d = 0.010 W/m·K (aerogel), φ = 0.85
k_eff ≈ 0.015 W/m·K  ← TARGET ACHIEVED
```

**Quilting Thermal Resistance:**
```
R_batting = t_compressed / k_eff = 0.003 / 0.015 = 0.2 m²K/W
R_air_gap = 0.005 / 0.026 = 0.19 m²K/W
Total R = 0.39 m²K/W  →  Exceeds 0.33 m²K/W target
```

**Transient Thermal Response (Fourier Number):**
```
$Fo = rac{lpha t}{L^2}$  where $lpha = rac{k}{
ho c_p}$ (thermal diffusivity)
```
**Thermal Penetration Time:**
```
$t_{pen} = rac{L^2}{\pi^2 lpha} \ln \left( rac{4}{\pi} rac{T_s - T_i}{T_s - T} 
ight)$
```
**Effective Thermal Resistance with Contact Resistance:**
```
$R_{total} = \sum R_i + \sum R_{contact,i}$  where $R_{contact} = rac{1}{h_c A}$
```
