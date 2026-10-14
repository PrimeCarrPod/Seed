## 3. Zero-Waste Nesting for 560mm Loom (DRAFT-05, SYNTH-03 §7)

### 3.1 Panel Layout Optimization (RW-SG: 32 panels)

**Guillotine Cutting + Simulated Annealing:**
- Objective: Minimize waste $W = A_{fabric} - \sum A_{panels}$
- Constraint: All pieces fit within 560 mm width
- Fabric width: 560 mm (22-inch historical loom)
- Seam allowance: 13 mm (ASTM D1683 Ssa-1) to 40 mm (SSd-2)

### 3.2 RW-SG Nesting Result

| Layout Row | Panels | Width Used (mm) | Waste (mm) | Cumulative Length (cm) |
|------------|--------|-----------------|------------|------------------------|
| 1 | Bodice Front L + Front R | 540 | 20 | 42 |
| 2 | Bodice Back (Watteau) | 520 | 40 | 84 |
| 3 | Bodice Side L + Side R + Collar L | 550 | 10 | 120 |
| 4 | Sleeve Upper L + Sleeve Upper R | 530 | 30 | 158 |
| 5 | Sleeve Lower L + Sleeve Lower R | 540 | 20 | 192 |
| 6 | Skirt Front Gores (4) | 545 | 15 | 235 |
| 7 | Skirt Back Gores (4) | 550 | 10 | 278 |
| 8 | Skirt Side Gores (4) + Collar R | 555 | 5 | 310 |

**Total Fabric Length:** 310 cm = **3.10 m per layer**
**Total for 12 layers:** 37.2 m silk
**Waste:** 4.1% (target <5%)

---
