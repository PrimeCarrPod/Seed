# DOC-03: Cyclic Fatigue & de Havilland Comet Forensic Analysis
## Document 3 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 2201-2300 | Piece 5 of 9 | ~100 Lines

---

#### 3.5 Damage-Tolerance Protocol Evolution — From Comet to FAR 25.571

The Comet investigation by the **Cohen Committee** (1954) and subsequent RAE research established the **damage-tolerance philosophy** that governs all modern airworthiness standards. This section traces the evolution from "safe-life" to "damage-tolerance" and the mathematical framework that emerged.

**3.5.1 The Cohen Committee Findings (1954)**

**Key Conclusions:**
1. **Fatigue is the dominant failure mode** for pressurized fuselages — not static strength
2. **Square window corners** create unacceptable stress concentrations
3. **Rivet holes** at corners are the primary crack initiation sites
4. **Static safety factors > 10 are meaningless** for fatigue life
5. **Full-scale fatigue testing is mandatory** for new pressurized designs
6. **Inspection intervals must be based on crack growth analysis**, not calendar time

**Immediate Actions (1954–1955):**
- Comet fleet grounded indefinitely
- All square windows replaced with **elliptical (r ≥ 25 mm)** on Comet 2/3/4
- **Mandatory eddy-current inspection** of window corners every 500 cycles
- **Doubler plates** installed at all window corners (0.8 mm 2024-T3)

**3.5.2 Safe-Life Design (1955–1978)**

**Philosophy:** Design for **zero cracks** at design life (typically 60,000 cycles). Apply scatter factor of 4× on test life.

**Safe-Life Process:**
1. **Component testing** to failure (coupon, element, sub-component)
2. **S-N curve** generation (stress vs. cycles to failure)
3. **Design stress** = test stress at 4× design life
4. **No cracks assumed** in service — inspection for corrosion/damage only
5. **Retirement at design life** (no extension)

**Mathematical Basis (Miner's Rule):**
$$D = \sum_{i=1}^{k} \frac{n_i}{N_i} \leq \frac{1}{SF_{scatter}} = 0.25$$

Where n_i = cycles at stress level i, N_i = cycles to failure at stress level i.

**Limitations Revealed (1960s–1970s):**
- **Scatter in fatigue life** (Weibull shape parameter β ≈ 2–4) → 4× factor inadequate
- **Manufacturing defects** (voids, inclusions) act as pre-cracks
- **Corrosion fatigue** accelerates growth unpredictably
- **Multiple load paths** (fail-safe) not credited
- **Inspection capability** ignored — cracks detectable but not inspected for

**3.5.3 Fail-Safe / Damage-Tolerance Transition (1970s)**

**FAA Notice 70-1 (1970):** "Damage Tolerance Design for Transport Aircraft"

**Core Concept:** **Assume cracks exist.** Design so that:
1. **Cracks grow slowly** (low ΔK, high fracture toughness)
2. **Cracks are detectable** before reaching critical size (NDI capability)
3. **Residual strength** with crack present > limit load
4. **Multiple load paths** (fail-safe) or **crack arrest** features

**Damage-Tolerance Requirements (FAR 25.571, Amdt 25-45, 1978):**

**§25.571(a) Fatigue Evaluation:**
- Identify **principal structural elements (PSEs)**
- Analyze **fatigue cracking** from:
  - Manufacturing defects (max undetectable flaw)
  - Corrosion pits
  - Stress concentrations
  - **Accidental damage** (ramp rash, bird strike)

**§25.571(b) Inspection Program:**
- **Initial inspection threshold** (before first crack expected)
- **Repeat inspection interval** (based on crack growth from detectable to critical)
- **NDI method specification** (eddy current, UT, X-ray, visual)
- **Probability of Detection (POD)** curves required

**§25.571(c) Residual Strength:**
- **Limit load** with crack of length a_detect (inspection threshold)
- **Ultimate load** with crack of length a_crit (critical for limit load)

**3.5.4 Fracture Mechanics Basis for Inspection Intervals**

**Crack Growth Integration (Paris Law):**
$$N = \int_{a_0}^{a_c} \frac{da}{C(\Delta K)^m}$$

For center crack in plate: $\Delta K = \Delta \sigma \sqrt{\pi a} \cdot Y(a/W)$
For corner crack at hole: $\Delta K = 1.12 \Delta \sigma \sqrt{\pi a} \cdot F(a/r)$

**Inspection Interval Derivation:**

Let:
- $a_0$ = initial flaw size (manufacturing, corrosion) = 0.5–1.0 mm
- $a_d$ = detectable crack size (NDI capability) = 2–5 mm (eddy current)
- $a_c$ = critical crack size at limit load = $K_{IC}^2 / (\pi \Delta \sigma_{limit}^2 Y^2)$

**Required:**
$$N_{insp} \leq \frac{1}{2} \left[ N(a_d \rightarrow a_c) \right]$$

**Factor of 2** accounts for:
- Scatter in crack growth (2×)
- Missed inspection / delayed repair (2×)
- **Combined: 4× total scatter factor** (but distributed)

**Example: 737 Fuselage Crown Skin (2024-T3)**
- Δσ = 100 MPa (hoop + bending)
- K_IC = 30 MPa√m
- a_c = 30² / (π × 100²) = 0.0287 m = **28.7 mm**
- a_d = 3 mm (eddy current)
- C = 2.5×10⁻¹¹, m = 3.2 (2024-T3, R=0.1)

$$N(a_d \rightarrow a_c) = \frac{2}{(2-m)C(\Delta \sigma \sqrt{\pi} Y)^m} \left[ a_c^{(2-m)/2} - a_d^{(2-m)/2} \right]$$

With Y ≈ 1.1:
$$N = \frac{2}{(-1.2) \times 2.5 \times 10^{-11} \times (100 \times 1.77 \times 1.1)^{3.2}} \left[ 28.7^{-0.6} - 3^{-0.6} \right]$$
$$= \frac{2}{-1.2 \times 2.5 \times 10^{-11} \times 197^{3.2}} \left[ 0.18 - 0.52 \right]$$
$$197^{3.2} \approx 1.1 \times 10^7$$
$$N = \frac{2}{-1.2 \times 2.5 \times 10^{-11} \times 1.1 \times 10^7} \times (-0.34) = \frac{2 \times 0.34}{3.3 \times 10^{-4}} = 2,060 \text{ cycles}$$

**Inspection Interval:** $N_{insp} \leq 2,060 / 2 = \mathbf{1,030 \text{ cycles}}$

**Actual 737 Program:** Eddy current every **1,200 cycles** (conservative with 1.2× margin).

**3.5.5 Probability of Detection (POD) — Statistical Foundation**

**POD(a) = 1 / (1 + exp[-(a - a_50)/b])** (Logistic model)
- a_50 = crack size with 50% detection probability
- b = slope parameter (steepness)

**Required:** POD(a_d) ≥ 0.90 (90% detection at inspection threshold)

**Typical Eddy Current POD:**
- a_50 = 1.5 mm
- b = 0.4 mm
- POD(3 mm) = 1 / (1 + exp[-(3-1.5)/0.4]) = 1 / (1 + exp[-3.75]) = **0.977**

**3.5.6 Modern Implementation: WFD (Widespread Fatigue Damage)**

**Aloha Airlines 243 (1988)** — Multiple site damage (MSD) / WFD:
- **Mechanism:** Multiple small cracks link → sudden large crack → failure
- **Response:** **WFD evaluation required** (FAR 25.571 Amdt 25-102, 2005)
- **Threshold:** DSG (Design Service Goal) = 60,000–120,000 cycles
- **Analysis:** FEA with multiple cracks → residual strength + crack linking

**3.5.7 Comet Legacy Summary**

| Era | Philosophy | Inspection | Design Life | Key Standard |
|-----|------------|------------|-------------|--------------|
| **Pre-Comet (–1954)** | Static strength | Visual only | Not defined | CAR 4b |
| **Safe-Life (1955–78)** | No cracks at life | Corrosion only | 60,000 cycles | FAR 25 (1958) |
| **Damage-Tolerance (1978–98)** | Cracks detectable | NDI scheduled | 60,000 cycles | FAR 25.571 |
| **WFD/MSD (1998–present)** | Multiple cracks | Enhanced NDI | DSG 120,000+ | FAR 25.571 Amdt 102 |

**The Comet's 1,200-cycle failures → Modern 120,000-cycle damage-tolerant fuselages = 100× improvement through fracture mechanics.**

---

*End of Piece 5 — DOC-03 Lines 2201-2300*
*Next: Piece 6 — Section 3.6 Modern Applications: 787/A350 Composite Fatigue*