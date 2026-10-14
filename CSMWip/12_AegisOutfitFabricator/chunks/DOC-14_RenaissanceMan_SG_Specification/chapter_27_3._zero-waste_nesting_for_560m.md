## 3. Zero-Waste Nesting for 560mm Loom (DRAFT-05, SYNTH-03 §7)

### 3.1 Panel Layout Optimization (RM-SG: 30 panels)

**Guillotine Cutting + Simulated Annealing:**
- Objective: Minimize waste $W = A_{fabric} - \sum A_{panels}$
- Constraint: All pieces fit within 560 mm width
- Fabric width: 560 mm (22-inch historical loom)
- Seam allowance: 13 mm (ASTM D1683 Ssa-1) to 40 mm (SSd-2)

### 3.2 RM-SG Nesting Result

| Layout Row | Panels | Width Used (mm) | Waste (mm) | Cumulative Length (cm) |
|------------|--------|-----------------|------------|------------------------|
| 1 | Front L + Front R | 550 | 10 | 41 |
| 2 | Back (Watteau) | 540 | 20 | 82 |
| 3 | Side L + Side R + Collar L | 555 | 5 | 115 |
| 4 | Sleeve Upper L + Sleeve Upper R | 530 | 30 | 158 |
| 5 | Sleeve Lower L + Sleeve Lower R | 540 | 20 | 192 |
| 6 | Hose Front L + Hose Front R | 520 | 40 | 228 |
| 7 | Hose Back L + Hose Back R | 530 | 30 | 265 |
| 8 | Hose Gussets (6) + Collar R | 550 | 10 | 305 |

**Total Fabric Length:** 305 cm = **3.05 m per layer**
**Total for 12 layers:** 36.6 m silk
**Waste:** 3.8% (target <5%)

---
