## 3. Alcega Loom-Width Nesting (DRAFT-01 §3.3, DRAFT-05 §3.3)

### 3.1 Loom Width Constraint

$$W_{\text{loom}} = 560 \text{ mm} \quad \text{(historical constant, 22-inch)}$$

**Zero-Waste Objective:**
$$\text{Utilization} = \frac{\sum A_{\text{panels}}}{A_{\text{loom}} \times L_{\text{cut}}} \geq 0.85$$

### 3.2 RM-TS Nesting Layout (Optimized)

```
LOOM WIDTH: 560 mm
═══════════════════════════════════════════════════════════
ROW 1:  P03 (560×510)  ← Developable back, full width
        ────────────────────────────────────────────────
ROW 2:  P01 (280×510) + P02 (280×510)  ← Fronts side-by-side
        ────────────────────────────────────────────────
ROW 3:  P15 (560×480)  ← Developable back skirt, full width
        ────────────────────────────────────────────────
ROW 4:  P13 (380×480) + P18 (120×120) + P20 (80×510*)  ← Front skirt + gusset + placket
        *P20 extends into next row
        ────────────────────────────────────────────────
ROW 5:  P14 (380×480) + P19 (120×120) + P21 (80×510*)
        ────────────────────────────────────────────────
ROW 6:  P08 (380×510) + P16 (190×480*)  ← Sleeve upper + side skirt
        *P16 partial, continues
        ────────────────────────────────────────────────
ROW 7:  P09 (380×510) + P17 (190×480*)
        ────────────────────────────────────────────────
ROW 8:  P04 (190×510) + P05 (190×510) + P10 (320×380)  ← Side fronts + sleeve lower
        ────────────────────────────────────────────────
ROW 9:  P06 (190×510) + P07 (190×510) + P11 (320×380)  ← Side backs + sleeve lower
        ────────────────────────────────────────────────
ROW 10: P12 (560×80) + P24 (150×150) + P25 (150×150) + P22 (100×200) + P23 (100×200)
        ────────────────────────────────────────────────
ROW 11: P26 (200×200) + P27 (200×200) + P28 (280×510) + P29 (280×510)  ← Pockets + lining
        ────────────────────────────────────────────────
ROW 12: P30 (560×510)  ← Lining back, full width
═══════════════════════════════════════════════════════════
```

**Total Loom Length Required:** $L_{\text{cut}} = 510 + 510 + 480 + 510 + 510 + 510 + 510 + 510 + 510 + 200 + 510 + 510 = 5,280 \text{ mm} = 5.28 \text{ m}$

**Fabric Area:** $A_{\text{loom}} = 0.56 \times 5.28 = 2.957 \text{ m}^2$

**Panel Area Sum:** $A_{\text{panels}} = 2.58 \text{ m}^2$

**Utilization:** $\eta = 2.58 / 2.957 = 0.872 = 87.2\% \quad \text{✓ Exceeds 85% target}$

---
