w = [w₁, w₂, w₃, w₄] = [0.30, 0.25, 0.25, 0.20]  (HAS)
w = [w_thermal, w_ballistic, w_EMI, w_DE, w_trauma] = [0.25, 0.20, 0.20, 0.15, 0.20]  (PES)
```

### 1.2 Pareto Frontier Analysis
**Method:** NSGA-II genetic algorithm, 500 generations, population 100
**Design Variables (per edition):**
- Ceramic tile size: 25, 35, 50 mm
- Tile coverage: 40%, 60%, 80% of surface area
- MXene coating thickness: 1, 2, 3 μm
- Aerogel batting weight: 100, 150, 200 g/m²
- STF add-on: 15%, 20%, 25%
- Baleen vs steel ratio: 100/0, 70/30, 50/50, 0/100

**Expected Pareto Front Shape:**
```
PES
  ↑
100|        ● (max protection, modern materials)
   |       ●
   |      ●
   |     ●  ← Pareto optimal region
   |    ●
   |   ●
   |  ●
   | ●
   |● (max authenticity, historical materials)
   +----------------→ HAS
    0              100
```
