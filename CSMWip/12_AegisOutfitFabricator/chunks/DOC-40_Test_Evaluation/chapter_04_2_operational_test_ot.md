## 2. Operational Test (OT)

### 2.1 OT Program — Realistic Threat Scenarios

Per **DOT&E TEMP Guide** and **DoDI 5000.02**, OT conducted by **independent test agency**:

| OT Event | Scenario | Threats | Operators | Duration | Location |
|----------|----------|---------|-----------|----------|----------|
| **OT-1** | Urban Assault | Ballistic, blast, chem | 12 (4 squads) | 72 hr | MOUT site |
| **OT-2** | Mountain/Cold Weather | Thermal, env seal, comms | 8 (2 teams) | 96 hr | Alaska Range |
| **OT-3** | Jungle/Humid | Bio, thermal, seal | 8 (2 teams) | 96 hr | Hawaii PTA |
| **OT-4** | Desert/High Temp | Thermal, DE, power | 12 (4 squads) | 72 hr | NTC Fort Irwin |
| **OT-5** | Maritime/Amphibious | Seal, blast, comms | 6 (DSV qual) | 48 hr | Coronado |
| **OT-6** | CBRN Contaminated | Chem/bio, DE, seal | 12 (decon ops) | 72 hr | Dugway |
| **OT-7** | Cyber/EW Contested | EMI, cyber, GPS denied | 12 | 72 hr | ECCTF Range |
| **OT-8** | Sustained Ops (30 day) | All above, logistics | 24 (rotating) | 720 hr | Multi-site |

### 2.2 Measures of Effectiveness (MOEs) / Measures of Performance (MOPs)

| MOE | Definition | Target | Measurement |
|-----|------------|--------|-------------|
| **MOE-1: Survivability** | P(survive | threat encounter) | ≥ 0.95 | LFT&E + OT injury data |
| **MOE-2: Mission Completion** | P(complete mission | wear AIMES) | ≥ 0.90 | OT mission logs |
| **MOE-3: Operator Effectiveness** | Task performance vs. baseline | ≥ 1.0× (no degradation) | OT task scoring |
| **MOE-4: Sustainment** | Ao (operational availability) | ≥ 0.85 | DOC-35 MEIO + OT logs |
| **MOE-5: Cognitive Load** | NASA-TLX avg during ops | ≤ 50 | OT biometrics |
| **MOE-6: Thermal Comfort** | PSI (DOC-38) avg | ≤ 3.0 | OT vitals |
| **MOE-7: Comm Reliability** | Message delivery rate | ≥ 0.99 | OT comms logs |

**MOP Examples**:
- MOP-1.1: Ballistic V50 (DOC-21) — DT verified
- MOP-2.1: Donning time (DOC-36) — OT measured
- MOP-3.1: Target acquisition time (DOC-29+30) — OT measured
- MOP-4.1: MTBF (DOC-32) — DT + OT combined

### 2.3 OT Statistical Design — Sequential Testing

Per **MIL-HDBK-189** and **Wald SPRT**:

$$
\text{SPRT: } \frac{L_1}{L_0} = \prod_{i=1}^n \frac{f_1(x_i)}{f_0(x_i)} \quad \text{Accept } H_1 \text{ if } \geq B, \text{ Accept } H_0 \text{ if } \leq A
$$

Where $H_0$: MOE < threshold, $H_1$: MOE ≥ threshold.  
$A = \beta/(1-\alpha)$, $B = (1-\beta)/\alpha$. Typical: $\alpha=0.1$, $\beta=0.1$.

**Minimum Sample Sizes** (binomial, 90% confidence):

| MOE | Threshold | Min Trials (Pass) | Min Trials (Fail) |
|-----|-----------|-------------------|-------------------|
| Survivability | 0.95 | 45 (0 failures) | 22 (1 failure) |
| Mission Completion | 0.90 | 22 (0 failures) | 11 (1 failure) |
| Operator Effectiveness | 1.0× | 30 (paired t-test) | — |

---
