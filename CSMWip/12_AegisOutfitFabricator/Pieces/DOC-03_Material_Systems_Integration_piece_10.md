```
HAS = w₁·V + w₂·M + w₃·C + w₄·W  (weights: 0.3, 0.25, 0.25, 0.2)
PES = Σ w_i·T_i  (thermal, ballistic, EMI, DE, trauma weights: 0.25, 0.25, 0.2, 0.15, 0.15)

Pareto frontier: NSGA-II, 500 generations, population 100
Design variables per edition:
x₁ = tile size {25, 35, 50} mm
x₂ = tile coverage {0.4, 0.6, 0.8}
x₃ = MXene thickness {1, 2, 3} μm
x₄ = aerogel batting {100, 150, 200} g/m²
x₅ = STF add-on {15%, 20%, 25%}
x₆ = baleen/steel ratio {1.0, 0.7, 0.5, 0.0}
```

### 4.2 Weight Budget Per Edition

**Renaissance Equivalent Weight Budget** (MAT-04 §2.2):
```
| Edition | Ceramic | Textiles | Framework | Coatings | Total |
|---------|---------|----------|-----------|----------|-------|
| LE-TS   | 8-10 kg | 3-4 kg   | 4-5 kg    | 1-2 kg   | 16-21 kg |
| LE-TG   | 10-13 kg| 4-5 kg   | 6-8 kg    | 1-2 kg   | 21-28 kg |
| LE-SS   | 7-9 kg  | 2-3 kg   | 3-4 kg    | 1-2 kg   | 13-18 kg |
| LE-SG   | 9-11 kg | 3-4 kg   | 5-6 kg    | 1-2 kg   | 18-23 kg |
```

### 4.3 Thermal Comfort Analysis

**Layer Thermal Resistances** (MAT-04 §3.2):
```
| Layer | t (mm) | k (W/m·K) | R (m²K/W) |
|-------|--------|-----------|-----------|
| YInMn coating | 0.23 | 1.5 | 0.00015 |
| Ceramic tile (4mm) | 4 | 15 | 0.00027 |
| Silk brocade + MXene | 1 | 0.15 | 0.0067 |
| Embroidery | 0.5 | 0.15 | 0.0033 |
| Aerogel batting (5mm) | 5 | 0.015 | 0.333 |
| STF silk/linen | 1 | 0.15 | 0.0067 |
| Baleen/steel | 5 | 0.2/40 | 0.025/0.0001 |
| Liner | 0.5 | 0.15 | 0.0033 |
| CoAl₂O₄ | 0.15 | 1.5 | 0.0001 |
| **Total** | **~17.4** | | **~0.38-0.40** |
```

**Core Temperature Rise** (MAT-04 §3.2):
```
At heavy work (M=400W, A=2m², q=200 W/m²):
ΔT = 200 × (0.39 + 0.1) = 98°C above ambient
→ CRITICAL: Requires active cooling or duty cycle limits

