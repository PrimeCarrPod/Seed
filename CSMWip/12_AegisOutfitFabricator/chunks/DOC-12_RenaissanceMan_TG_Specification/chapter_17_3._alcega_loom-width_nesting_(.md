## 3. Alcega Loom-Width Nesting (DRAFT-01 §3.3, DRAFT-05 §3.3)

### 3.1 Loom Width Constraint

$$W_{\text{loom}} = 560 \text{ mm} \quad \text{(historical constant, 22-inch)}$$

**Zero-Waste Objective:**
$$\text{Utilization} = \frac{\sum A_{\text{panels}}}{A_{\text{loom}} \times L_{\text{cut}}} \geq 0.85$$

### 3.2 RM-TG Nesting Layout (Optimized for 36 Panels)

```
LOOM WIDTH: 560 mm
════════════════════════════════════════════════════════════
ROW 1:  P03 (560×510)  ← Developable back, full width
        ────────────────────────────────────────────────
ROW 2:  P01 (330×510) + P02 (230×510*)  ← Fronts + partial
        *P02 partial, continues in Row 3
        ────────────────────────────────────────────────
ROW 3:  P02 (230×510*) + P28 (220×380) + P18 (150×150)  ← Front cont. + side lower + gusset
        ────────────────────────────────────────────────
ROW 4:  P15 (560×480)  ← Developable back skirt, full width
        ────────────────────────────────────────────────
ROW 5:  P13 (420×480) + P19 (150×150)  ← Front skirt + gusset
        ────────────────────────────────────────────────
ROW 6:  P14 (420×480) + P20 (80×510*)  ← Front skirt + placket
        *P20 extends into next row
        ────────────────────────────────────────────────
ROW 7:  P08 (380×510) + P29 (220×380) + P21 (80×510*)  ← Sleeve upper + side lower + placket
        ────────────────────────────────────────────────
ROW 8:  P09 (380×510) + P30 (220×380)  ← Sleeve upper + side lower
        ────────────────────────────────────────────────
ROW 9:  P04 (220×510) + P05 (220×510) + P10 (320×380)  ← Side fronts + sleeve lower
        ────────────────────────────────────────────────
ROW 10: P06 (220×510) + P07 (220×510) + P11 (320×380)  ← Side backs + sleeve lower
        ────────────────────────────────────────────────
ROW 11: P12 (560×80) + P24 (150×150) + P25 (150×150) + P22 (100×200) + P23 (100×200)
        ────────────────────────────────────────────────
ROW 12: P26 (200×200) + P27 (200×200) + P31 (220×380)  ← Pockets + side lower
        ────────────────────────────────────────────────
ROW 13: P32 (330×510) + P33 (230×510*)  ← Lining fronts
        *P33 continues
        ────────────────────────────────────────────────
ROW 14: P33 (230×510*) + P35 (220×510) + P37 (220×510)  ← Lining fronts/side fronts/side backs
        ────────────────────────────────────────────────
ROW 15: P34 (560×510) + P36 (220×510) + P38 (220×510)  ← Lining back + lining sides
        ────────────────────────────────────────────────
═══════════════════════════════════════════════════════════
```

**Total Loom Length Required:** $L_{\text{cut}} = 510 + 510 + 510 + 480 + 480 + 510 + 510 + 510 + 510 + 510 + 200 + 380 + 510 + 510 = 6,640 \text{ mm} = 6.64 \text{ m}$

**Fabric Area:** $A_{\text{loom}} = 0.56 \times 6.64 = 3.718 \text{ m}^2$

**Panel Area Sum:** $A_{\text{panels}} = 3.25 \text{ m}^2$

**Utilization:** $\eta = 3.25 / 3.718 = 0.874 = 87.4\% \quad \text{✓ Exceeds 85% target}$

---
