## 5. Edition-Specific Trade-off Analysis

### 5.1 Trade-off Space: Mobility vs. Protection vs. Mass

**Pareto Frontier (RM Editions):**

| Edition | Mass (kg) | Mobility Index | V₅₀ (m/s) | Thermal (°C) | EMI (dB) | Dominance |
|---------|-----------|----------------|-----------|--------------|----------|-----------|
| **RM-SS** | **13.73** | **0.89** | **942** | **58** | **58.5** | **Pareto Optimal** |
| RM-TS | 16.47 | 0.82 | 955 | 55 | 62 | Dominated by RM-SS (mobility) |
| RM-SG | 17.21 | 0.75 | 960 | 52 | 63 | Dominated |
| RM-TG | 20.88 | 0.71 | 980 | 48 | 65 | Dominated |

**No single edition dominates all metrics** — RM-SS optimal for mobility-critical missions

### 5.2 Multi-Objective Optimization

**Objective Function:**
$$\text{Utility} = w_1 \cdot MI + w_2 \cdot \frac{V_{50}}{1000} + w_3 \cdot \frac{60 - T_{th}}{60} + w_4 \cdot \frac{SE}{70} - w_5 \cdot \frac{M}{25}$$

**Mission Weight Profiles:**

| Mission Profile | w = [MI, Ballistic, Thermal, EMI, Mass] | Optimal Edition |
|-----------------|------------------------------------------|-----------------|
| **Urban Recon** | [0.4, 0.2, 0.15, 0.15, 0.1] | **RM-SS** |
| Rapid Response | [0.3, 0.25, 0.15, 0.15, 0.15] | **RM-SS** |
| Direct Action | [0.2, 0.35, 0.2, 0.15, 0.1] | RM-TS |
| Static Defense | [0.1, 0.4, 0.25, 0.15, 0.1] | RM-TG |
| Infiltration | [0.45, 0.15, 0.1, 0.2, 0.1] | **RM-SS-02 (Light)** |
| Arctic Ops | [0.15, 0.2, 0.4, 0.15, 0.1] | RM-SS-03 (Cold) |

### 5.3 Cost-Benefit Analysis (Per Edition)

| Metric | RM-SS | RM-TS | RM-SG | RM-TG | Unit |
|--------|-------|-------|-------|-------|------|
| **Unit Cost (est.)** | $142K | $168K | $175K | $210K | USD |
| **Cost/kg** | $10.3K | $10.2K | $10.2K | $10.1K | USD/kg |
| **Cost/MI point** | $160K | $205K | $233K | $296K | USD/0.01 MI |
| **Cost/V₅₀ m/s** | $151 | $176 | $182 | $214 | USD per m/s |
| **Lifecycle Cost (5 yr)** | $285K | $340K | $355K | $425K | USD |

**RM-SS: Best cost-effectiveness for mobility-weighted missions**

### 5.4 Technology Readiness by Edition

| Technology | RM-SS | RM-TS | RM-SG | RM-TG | TRL |
|------------|-------|-------|-------|-------|-----|
| 20mm ZrB₂-SiC | **TRL 7** | TRL 6 | TRL 6 | TRL 5 | — |
| 10mm Backup | **TRL 7** | TRL 7 | TRL 6 | TRL 5 | — |
| 2mm Aerogel | **TRL 8** | TRL 7 | TRL 7 | TRL 6 | — |
| 20µm MXene | **TRL 7** | TRL 6 | TRL 6 | TRL 5 | — |
| 8mm FSS | **TRL 7** | TRL 7 | TRL 6 | TRL 5 | — |
| Zone-Selective STF | **TRL 7** | TRL 6 | TRL 6 | TRL 5 | — |
| Minimal Chassis | **TRL 8** | TRL 7 | TRL 7 | TRL 6 | — |

**RM-SS: Highest overall TRL** — most mature for near-term deployment

### 5.5 Cross-References

- CSMFAB078-A §3.4: Mobility index targets
- CSMFAB078-B §3: Threat protection levels
- Chapter 02: Edition overview
- Chapter 05: Performance targets
- Chapter 74: Mobility index
- Chapter 128: Edition comparison
- Chapter 132: Trade-off analysis
- DOC-01 §5: System trade studies

---
