| 1 Shoulders | Shoulder seam | 15-25 N |
| 2 Chest | Bodice front lacing | 20-40 N |
| 3 Waist | Waistband/cartridge pleats | 30-60 N |
| 4 Hips | Farthingale tapes | 20-40 N |
| 5 Thighs | Pannier hoops | 15-25 N |
| 6 Calves | Skirt hem weight | 10-20 N |
| 7 Upper Arms | Sleeve cap easing | 10-20 N |
| 8 Forearms | Sleeve cuff | 5-15 N |
| 9-12 | Additional corset channels | 10-30 N |

### 2.5 Continuous Adaptation Algorithm

```
For target measurements M_target and base pattern P_base:
1. Compute scale factors per panel: s_i = f(M_target, M_base, ease_i)
2. Apply affine transform with non-linear curvature correction:
   P_target = S · P_base + Δ_curvature
3. Δ_curvature computed from osculating circle analysis
4. Verify: seam lengths match within 0.5mm tolerance
5. Output edition-specific DXF/SVG
```

## 3. Pleating Kernel (Watteau Back + Cartridge)

### 3.1 Watteau Back Pleating (Research Doc 1 §4.2, Lines 53-58)

**Double Box Pleat Geometry:**
```
Target finished width: W_f (across shoulder blades)
Unpleated fabric width: W_u (from pattern)
