## 1. Historical Authenticity vs Protection Efficacy Trade-Off Curves

### 1.1 Multi-Objective Optimization Framework
```
Objective 1: Maximize Historical Authenticity Score (HAS)
  HAS = w₁×Visual + w₂×Material + w₃×Construction + w₄×Wearability
  Visual: color, pattern, silhouette match to period (0-100)
  Material: fiber content, weave structure, finish (0-100)
  Construction: stitch type, seam allowance, patterning method (0-100)
  Wearability: weight, flexibility, breathability (0-100)

Objective 2: Maximize Protection Efficacy Score (PES)
  PES = Σ w_i × T_i  (threat-specific protection levels)
  T_thermal: interior temp @ 1100°C/300s (target <60°C)
  T_ballistic: NIJ IV stop .30-06 APM2 (0/1 pass)
  T_EMI: SE @ 1GHz (target >60 dB Renaissance equivalent)
  T_DE: ΔT @ MW/laser (target ≤14°C vs black)
  T_trauma: peak force reduction @ 50J (target ≥65%)

Constraints:
  Weight ≤ 26 kg (AIMES max, per edition)
  Cost ≤ $50,000/unit (target)
  Manufacturing time ≤ 200 hours
```

**Weighting Factors (AHP-derived):**
```
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

**Edition-Specific Curves:**
- LE-TS: Higher HAS achievable (less material needed)
- LE-TG: Lower HAS for same PES (more coverage required)
- LE-SS: Highest HAS potential (smallest surface)
- LE-SG: Most constrained (large surface + high protection)

**Hypervolume Indicator:**
```
HV = ∫∫ I(HAS, PES) dHAS dPES
Reference point: (0, 0)
Target HV ≥ 0.7 × HV_max
```

### 1.3 Constraint Handling
**Weight Constraint Penalty:**
```
f_penalty = max(0, Weight - 26)² × 1000
```

**Cost Constraint:**
```
Cost = Σ (m_i × c_i) + C_labor + C_overhead
c_ceramic = $500/kg, c_textile = $100/kg, c_framework = $200/kg
```

