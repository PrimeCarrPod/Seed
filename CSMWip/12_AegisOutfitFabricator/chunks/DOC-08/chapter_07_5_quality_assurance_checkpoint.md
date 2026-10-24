## 5. Quality Assurance Checkpoints

### 5.1 In-Process Inspection Points

| Stage | Check | Method | Frequency | Acceptance |
|-------|-------|--------|-----------|------------|
| Basalt fiber | Diameter, tensile | ASTM D3039 | Each lot | >3000 MPa, 9-13μm |
| Elium® resin | Viscosity, gel time | Rheometer, cup test | Each batch | 200-300 mPa·s, 8 min @ 80°C |
| MXene | Flake size, conductivity | AFM, 4-point probe | Each batch | 1-5μm, >10⁴ S/m |
| Aerogel | Density, λ | Helium pycnometry | Each batch | 0.1-0.2 g/cm³, 0.010 |
| Ceramic tiles | Dimensions, density | CMM, Archimedes | Each lot | ±0.1mm, 96.9% density |
| BFRP panels | FVF, void content | Burn-off, microscopy | Each panel | 60% FVF, <1% voids |
| Thread coating | Thickness, adhesion | Cross-section SEM, tape test | Each batch | 2±0.5μm, >90% retention |
| STF impregnation | Add-on, distribution | Gravimetric, cross-section SEM | Each garment | 15-25%, uniform |

### 5.2 Final Assembly Validation

```
Dimensional: CMM scan vs. CAD model (±0.5mm tolerance)
Mass: Edition-specific target ±5%
EMI SE: ASTM D4935 (1MHz-10GHz) >45 dB
Thermal: ISO 17493 (1100°C, 300s) interior <60°C
Ballistic: NIJ STD-0101.06 (6 shots/panel) 0mm penetration
Mobility: Joint ROM test (all 6 major joints)
Bio-acoustic: Vibrometer >78 dB @ 7.83 Hz (CSMFAB011)
```

**Key Formulas:**
- Dimensional tolerance: $\Delta x = \pm 0.5 \text{ mm}$
- Mass tolerance: $\frac{\Delta m}{m_{target}} \leq 5\%$
- EMI shielding effectiveness: $SE > 45 \text{ dB} \quad \text{at } 1 \text{ MHz--10 GHz}$
- Thermal test: $T_{ext} = 1100^\circ\text{C}, \; t = 300 \text{ s}, \; T_{int} < 60^\circ\text{C}$
- Ballistic: $N_{shots} = 6 \text{ per panel}, \; \text{penetration} = 0 \text{ mm}$
- Joint ROM: $N_{joints} = 6 \text{ major joints}$
- Bio-acoustic attenuation: $A > 78 \text{ dB} \quad \text{at } f = 7.83 \text{ Hz}$
