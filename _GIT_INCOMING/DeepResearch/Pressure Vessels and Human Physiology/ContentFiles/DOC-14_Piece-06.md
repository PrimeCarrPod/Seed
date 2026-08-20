# DOC-14: Perfluorocarbon Chemistry — Molecular Engineering
## Document 14 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 12201-12300 | Piece 6 of 9 | ~100 Lines

---

#### 14.6 Biomedical PFC Selection Criteria

**14.6.1 The TLV Design Space — Multi-Objective Optimization**

**Objective Functions:**
1. **Maximize O₂ Solubility** ($C_{O_2} \uparrow$)
2. **Maximize CO₂ Solubility** ($C_{CO_2} \uparrow$)
3. **Minimize Viscosity** ($\eta \downarrow$) → lower WOB
4. **Maximize Vapor Pressure** ($P_{\text{vap}} \uparrow$) → faster clearance
5. **Minimize Surface Tension** ($\gamma \downarrow$) → alveolar recruitment
6. **Optimize Density** ($\rho \approx 1.8\text{–}2.0$) → hydrostatic matching
7. **Ensure Biocompatibility** (inert, non-toxic, clearable)
8. **Physical State:** Liquid at 37°C, 1 atm ($T_m < 37°C$, $T_b > 37°C$)

**Pareto Front Analysis (Theoretical):**
- **High O₂/CO₂** ↔ **High Viscosity** (correlated via free volume)
- **High Vapor Pressure** ↔ **Low Boiling Point** ↔ **Low Gas Solubility**
- **Low Surface Tension** ↔ **Fluorinated Terminal Groups** (PFOB)

**No Single PFC Optimizes All** — Application-specific selection required.

**14.6.2 TLV PFC Selection Matrix**

| Application | Priority | Optimal PFC | Rationale |
|-------------|----------|-------------|-----------|
| **Neonatal TLV (RDS)** | Low η, high γ (recruitment) | **PFOB** | Low η (1.7 cP), lowest γ (7.3 mN/m) |
| **Adult ARDS TLV** | High O₂/CO₂, moderate η | **Perfluorodecalin** | High CO₂ (160), moderate η (5.4 cP) |
| **Deep Dive TLV** | High O₂/CO₂, low VP | **Perfluoro-tert-butylcyclohexane** | High gas capacity, low VP (3.8 mmHg) |
| **IV Oxygen Delivery** | Emulsifiable, low η | **Perfluoro-n-octane** or **PFOB** | Emulsifiable, IV compatible |
| **Organ Preservation** | High O₂, low toxicity | **Perfluorodecalin** | Proven track record (organ transplant) |

**14.6.3 The "Ideal TLV PFC" — Theoretical Composite**

**Target Properties (Ideal):**
| Property | Target | Best Current | Gap |
|----------|--------|--------------|-----|
| **O₂ Solubility** | > 60 mL/100mL | 50 (C₁₀F₂₀) | 20% |
| **CO₂ Solubility** | > 250 mL/100mL | 196 (C₁₀F₂₀) | 28% |
| **Viscosity (37°C)** | < 2 cP | 3.5 (C₈F₁₈) | 75% |
| **Vapor Pressure (37°C)** | > 20 mmHg | 30 (c-C₁₀F₁₈) | 33% |
| **Surface Tension** | < 10 mN/m | 7.3 (PFOB) | — |
| **Density** | 1.8–1.9 g/mL | 1.92–1.97 | — |
| **Vapor Pressure (37°C)** | 20–50 mmHg | 10–30 | 50% |

**Molecular Engineering Path to Ideal:**
1. **Reduce Viscosity:** Shorter chains, less entanglement → C₆–C₈ linear
2. **Maintain Gas Capacity:** Branched/cyclic cores (void preservation)
3. **Increase Vapor Pressure:** Lower MW, symmetric structure → C₈F₁₈, C₁₀F₂₀
3. **Reduce Surface Tension:** Terminal -OCF₃, -CF₂H groups
3. **Tunable Polarity:** -OCF₃, -CN end groups for CO₂ affinity

**14.6.4 Emulsion vs. Pure Liquid — The IV Delivery Trade-off**

**Pure Liquid TLV:**
- **Pros:** Maximum gas capacity, no surfactant
- **Cons:** High viscosity, requires dedicated ventilator

**PFC Emulsion (IV O₂ Delivery):**
- **Droplet Size:** 0.1–0.3 µm (microemulsion)
- **Surfactant:** Phospholipids (egg yolk, DSPE-PEG), Pluronics
- **PFC Load:** 40–60% vol
- **O₂ Capacity (60% vol):** 0.6 × 50 = **30 mL O₂/100 mL emulsion**
- **Blood Compatibility:** Requires phospholipid coating (stealth)

**Emulsion Stability (Critical):**
- **Ostwald Ripening:** $dr/dt \propto \gamma V_m / (r^2 RT)$
- **Low γ → slower ripening** (PFCs naturally resistant)
- **Surfactant:** PEGylated phospholipids (steric stabilization)

**14.6.4 Regulatory Status (FDA/EMA)**

| PFC | IND Status | Clinical Trials | Approved Use |
|-----|------------|-----------------|--------------|
| **PFOB (Perflubron)** | IND (Alliance) | Phase III (ARDS) | **None (compassionate)** |
| **Perfluorodecalin** | IND (Green Cross) | Phase II (organ preservation) | **Japan: Organ preservation** |
| **Perfluoro-tert-butylcyclohexane (Oxycyte)** | IND (Synthetic Blood) | Phase II (trauma) | **None** |
| **Perfluoro-n-octane** | IND | Phase I (IV O₂) | **None** |
| **Perfluorooctyl bromide (PFOB)** | IND | Phase III (pediatric ARDS) | **Russia: Approved (1990s)** |

**Regulatory Hurdle:** **No approved TLV system for routine human use.**
**Barriers:** CO₂ clearance, ventilator complexity, PFC clearance, long-term toxicity.

---

*End of Piece 6 — DOC-14 Lines 12201-12300*
*Next: Piece 7 — Section 14.7 PFC Emulsion Engineering for IV Delivery*