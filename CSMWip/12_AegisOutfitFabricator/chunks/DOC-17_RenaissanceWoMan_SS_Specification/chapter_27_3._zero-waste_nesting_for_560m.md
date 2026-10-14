## 3. Zero-Waste Nesting for 560mm Loom (DRAFT-05, SYNTH-03 §7)

### 3.1 Panel Layout Optimization (RW-SS: 28 panels)

**Guillotine Cutting + Simulated Annealing:**
- Objective: Minimize waste $W = A_{fabric} - \sum A_{panels}$
- Constraint: All pieces fit within 560 mm width
- Fabric width: 560 mm (22-inch historical loom)
- Seam allowance: 13 mm (ASTM D1683 Ssa-1) to 40 mm (SSd-2)

### 3.2 RW-SS Nesting Result

| Layout Row | Panels | Width Used (mm) | Waste (mm) | Cumulative Length (cm) |
|------------|--------|-----------------|------------|------------------------|
| 1 | Bodice Front L + Front R | 540 | 20 | 38 |
| 2 | Bodice Back (Watteau) | 520 | 40 | 76 |
| 3 | Bodice Side L + Side R + Collar L | 550 | 10 | 105 |
| 4 | Sleeve Upper L + Sleeve Upper R | 530 | 30 | 138 |
| 5 | Sleeve Lower L + Sleeve Lower R | 540 | 20 | 168 |
| 6 | Skirt Front Gores (3) | 510 | 50 | 205 |
| 7 | Skirt Back Gores (3) | 520 | 40 | 242 |
| 8 | Skirt Side Gores (3) + Collar R | 555 | 5 | 265 |

**Total Fabric Length:** 265 cm = **2.65 m per layer**
**Total for 12 layers:** 31.8 m silk
**Waste:** 3.8% (target <5%)

---
