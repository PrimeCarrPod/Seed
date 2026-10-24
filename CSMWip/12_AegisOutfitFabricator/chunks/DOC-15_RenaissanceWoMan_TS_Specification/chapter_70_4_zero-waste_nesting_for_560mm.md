## 4. Zero-Waste Nesting for 560mm Loom (DRAFT-05, SYNTH-03 §7)

### 4.1 Panel Layout Optimization (RW-TS: 32 panels)

**Guillotine Cutting + Simulated Annealing:**
- Objective: Minimize waste $W = A_{fabric} - \sum A_{panels}$
- Constraint: All pieces fit within 560 mm width
- Fabric width: 560 mm (22-inch historical loom)
- Seam allowance: 13 mm (ASTM D1683 Ssa-1) to 40 mm (SSd-2)

### 4.2 RW-TS Nesting Result

| Layout Row | Panels | Width Used (mm) | Waste (mm) | Cumulative Length (cm) |
|------------|--------|-----------------|------------|------------------------|
| 1 | Bodice Front L + Front R | 540 | 20 | 45 |
| 2 | Bodice Back (Watteau) | 520 | 40 | 90 |
| 3 | Bodice Side L + Side R + Collar L | 550 | 10 | 125 |
| 4 | Skirt Front + Skirt Back | 540 | 20 | 180 |
| 5 | Skirt Gores (4) + Partlet | 555 | 5 | 220 |
| 6 | Sleeve Upper L + Sleeve Upper R | 530 | 30 | 260 |
| 7 | Sleeve Lower L + Sleeve Lower R | 540 | 20 | 295 |
| 8 | Farthingale Hoops (4) + Tapes | 555 | 5 | 310 |

**Total Fabric Length:** 310 cm = **3.10 m per layer**
**Total for 12 layers:** 37.2 m silk
**Waste:** 3.5% (target <5%)

---

