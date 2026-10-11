
| Edition | B (cm) | W (cm) | H (cm) | NW (cm) | S_h | S_v | γ |
|---------|--------|--------|--------|---------|-----|-----|---|
| RM-TS | 91 | 76 | 86 | 42 | 0.92 | 0.95 | -0.05 |
| RM-TG | 122 | 112 | 116 | 44 | 1.15 | 1.00 | +0.02 |
| RM-SS | 81 | 66 | 77 | 38 | 0.85 | 0.90 | -0.08 |
| RM-SG | 112 | 102 | 107 | 40 | 1.08 | 0.95 | +0.05 |
| RW-TS | 91 | 71 | 96 | 40 | 0.92 | 0.93 | -0.03 |
| RW-TG | 116 | 101 | 121 | 42 | 1.10 | 0.98 | +0.04 |
| RW-SS | 81 | 61 | 86 | 36 | 0.85 | 0.88 | -0.07 |
| RW-SG | 106 | 96 | 111 | 38 | 1.02 | 0.93 | +0.03 |

*Traceability: Research Doc 1 §4.1; SYNTH-03 §2; DRAFT-02 §2-4; CSMFAB078-A §3.3; MAT-04 §2.2*

---

## 3. Pleating Kernel (from DRAFT-03)

### 3.1 Watteau Back Pleating (Double Box Pleat)

**Geometry** (Research Doc 1 §4.2; DRAFT-03 §1; SYNTH-03 §3):
```
Double box pleat: Two pleats folded toward center, meeting at center back
Compression ratio: 3:1 (3 units planar fabric → 1 unit finished width)

Pleat depth calculation:
d = (W_unpleated - W_finished) / (2 × N_pleats)
Where N_pleats = 2 (double box), W_finished = back width at shoulders

Example: W_unpleated = 600mm, W_finished = 200mm
d = (600 - 200) / (2 × 2) = 100mm per pleat
Fabric consumption per pleat = 3 × d = 300mm
```

**Load-Bearing Column Action** (Research Doc 1 §4.2; DRAFT-03 §1):
```
Skirt weight W_skirt distributed across pleat columns:
T_column = W_skirt / N_pleats  (tension per pleat column)
At shoulder anchor: T_total = W_skirt (transmitted to shoulder seam)

Stress at shoulder seam: σ = T_total / (t_fabric × w_seam)
t_fabric = silk thickness ≈ 0.3mm, w_seam = seam width ≈ 13mm
σ ≈ W_skirt / (0.3 × 13) MPa
```
