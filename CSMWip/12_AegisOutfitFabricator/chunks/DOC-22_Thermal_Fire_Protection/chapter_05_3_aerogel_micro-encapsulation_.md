## 3. Aerogel Micro-Encapsulation — Quilting Batting Core

### 3.1 Aerogel Core Synthesis (MAT-03 §3.1, CSMFAB078 §6 Step 7)

**Base Aerogel (CSMFAB078):**
```
Composition: TEOS + PMDA-ODA polyimide co-gel
Process: Ambient-pressure dry (TMCS surface modification)
Properties: λ = 0.010 W/m·K, 650°C service, density 0.1-0.2 g/cm³
Cost: $68/m² (70% savings vs. $230/m² commercial)
```

**Gelation Kinetics:**
```
Si(OR)₄ + 2 H₂O → SiO₂ + 4 ROH
Rate: d[Si]/dt = -k [Si(OR)₄] [H₂O]
k ≈ 10⁻³ M⁻¹s⁻¹ (acid catalyzed)
Polyimide incorporation: Imide linkage → thermal stability >500°C
```

### 3.2 Micro-Encapsulation for Quilting Integration (MAT-03 §3.2)

**Shell Materials Comparison:**
| Shell | Thermal Limit | Shell Thickness | Cost | Selection |
|-------|---------------|-----------------|------|-----------|
| Melamine formaldehyde (MF) | 150°C | 5-20 μm | Low | Secondary zones |
| Silica (sol-gel) | >500°C | 1-10 μm | Med | Primary zones |
| Polyimide | >500°C | 2-15 μm | High | High-stress zones |

**Selected: Hybrid silica/polyimide shell** — matches aerogel chemistry, >500°C stability

**Size Distribution Target:**
```
D₅₀ = 50-100 μm
D₉₀ < 200 μm
Span = (D₉₀ - D₁₀)/D₅₀ < 1.5
Encapsulation efficiency: >90% aerogel retention
```

**Coacervation Process (Silica Shell):**
```
1. Aerogel dispersion in ethanol (5 wt%)
2. TEOS hydrolysis at pH 4-5 (acid catalyzed)
3. Phase separation → silica shell deposition
4. NH₄OH pH shift → shell condensation
5. Crosslinking: 80°C / 2h
6. Filtration & drying: 60°C vacuum
```

### 3.3 Quilting Layer Structure

```
QUILTING LAYER STACK (Renaissance adaptation):
[Silk face fabric (MAT-01)] 
    → [Encapsulated aerogel batting (100-200 g/m²)] 
    → [Silk/linen backing (MAT-01)]
    
Batting weight: 100-200 g/m² (vs AIMES 25mm solid ~250 g/m²)
Effective λ: 0.015 W/m·K (Maxwell-Eucken model)
Thermal resistance: R = 0.5-1.0 m²K/W
```

**Effective Thermal Conductivity (Maxwell-Eucken):**
```
λ_eff = λ_m × (1 + 3φ(λ_p - λ_m)/(λ_p + 2λ_m - φ(λ_p - λ_m)))
φ = volume fraction of aerogel ≈ 0.3-0.5
λ_p = 0.010 W/m·K (aerogel), λ_m = 0.04 W/m·K (matrix/silk)
Result: λ_eff = 0.015-0.018 W/m·K
```

**Historical Quilting Pattern (Research Doc 1 §5):**
```
Pattern: Diamond grid (Alcega developable surface, DRAFT-01)
Stitch: Class 301 lockstitch (ASTM D6193)
Density: 4.7 stitches/cm
Thread: Silk core-spun (thermal insulation + strength)
Panel geometry: DRAFT-05 zero-waste nesting
```

---
