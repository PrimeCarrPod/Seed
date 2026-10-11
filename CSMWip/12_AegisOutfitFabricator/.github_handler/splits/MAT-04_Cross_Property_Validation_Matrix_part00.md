# MAT-04: Cross-Property Validation Matrix
## AegisOutfitFabricator Material Science Bridge Document 4

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
