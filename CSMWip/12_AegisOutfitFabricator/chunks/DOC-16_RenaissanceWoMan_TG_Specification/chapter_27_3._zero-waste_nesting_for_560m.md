## 3. Zero-Waste Nesting for 560mm Loom (DRAFT-05, SYNTH-03 §7)

### 3.1 Panel Layout Optimization (RW-TG: 36 panels)

**Guillotine Cutting + Simulated Annealing:**
- Objective: Minimize waste $W = A_{fabric} - \sum A_{panels}$
- Constraint: All pieces fit within 560 mm width
- Fabric width: 560 mm (22-inch historical loom)
- Seam allowance: 13 mm (ASTM D1683 Ssa-1) to 40 mm (SSd-2)

### 3.2 RW-TG Nesting Result

| Layout Row | Panels | Width Used (mm) | Waste (mm) | Cumulative Length (cm) |
|------------|--------|-----------------|------------|------------------------|
| 1 | Bodice Front L + Front R | 540 | 20 | 48 |
| 2 | Bodice Back (Watteau) | 520 | 40 | 96 |
| 3 | Bodice Side L + Side R + Collar L | 550 | 10 | 135 |
| 4 | Sleeve Upper L + Sleeve Upper R | 530 | 30 | 178 |
| 5 | Sleeve Lower L + Sleeve Lower R | 540 | 20 | 220 |
| 6 | Skirt Front Gores (3) | 550 | 10 | 275 |
| 7 | Skirt Front Gores (3) | 550 | 10 | 330 |
| 8 | Skirt Back Gores (3) | 545 | 15 | 385 |
| 9 | Skirt Back Gores (3) | 545 | 15 | 440 |
| 10 | Skirt Side Gores (6) + Collar R | 555 | 5 | 485 |

**Total Fabric Length:** 485 cm = **4.85 m per layer**
**Total for 12 layers:** 58.2 m silk
**Waste:** 4.5% (target <5%)

---
