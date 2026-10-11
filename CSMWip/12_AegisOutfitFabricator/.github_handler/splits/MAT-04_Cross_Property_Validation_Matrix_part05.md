R_rad = 1 / (h_rad)  (radiation, interior)

Heat flux: q = (T_skin - T_ambient) / R_total
```

**Layer Thermal Resistances (Renaissance):**
| Layer | t (mm) | k (W/m·K) | R (m²K/W) |
|-------|--------|-----------|-----------|
| YInMn coating | 0.23 | 1.5 | 0.00015 |
| Ceramic tile (4mm) | 4 | 15 | 0.00027 |
| Silk brocade + MXene | 1 | 0.15 | 0.0067 |
| Embroidery | 0.5 | 0.15 | 0.0033 |
| Aerogel batting (5mm) | 5 | 0.015 | 0.333 |
| STF silk/linen | 1 | 0.15 | 0.0067 |
| Baleen/steel | 5 | 0.2 (baleen) / 40 (steel) | 0.025 / 0.0001 |
| Liner | 0.5 | 0.15 | 0.0033 |
| CoAl₂O₄ | 0.15 | 1.5 | 0.0001 |
| **Total** | **~17.4** | | **~0.38 - 0.40** |

**Core Temperature Rise (Steady State):**
```
q = M / A_DuBois  (metabolic heat flux)
A_DuBois ≈ 1.8-2.2 m² (adult)
T_skin - T_core = q × R_tissue (R_tissue ≈ 0.1 m²K/W)
T_core = T_ambient + q × (R_total + R_tissue)
```

At heavy work (M=400W, A=2m², q=200 W/m²):
- ΔT = 200 × (0.39 + 0.1) = 98°C above ambient
- **CRITICAL:** Requires active cooling or duty cycle limits
