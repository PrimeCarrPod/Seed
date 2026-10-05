# DOC-09: Inert Gas Desaturation & Pre-Breathe Kinetics
## Document 9 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 7301-7400 | Piece 2 of 9 | ~100 Lines

---

#### 9.2 Multi-Compartment Haldane/Buhlmann Model

**9.2.1 Haldane's Original Model (1908)**

**Assumptions:**
1. Body = **5 parallel compartments** with different half-times
2. Each compartment follows **first-order kinetics**
3. **DCS occurs** when supersaturation ratio exceeds critical value
4. **Critical ratio = 2:1** (tissue pressure : ambient pressure) for all compartments

**Haldane's 5 Compartments:**
| Compartment | Half-time [min] | Critical Ratio |
|-------------|-----------------|----------------|
| 1 | 5 | 2.0 |
| 2 | 10 | 2.0 |
| 3 | 20 | 2.0 |
| 4 | 40 | 2.0 |
| 5 | 75 | 2.0 |

**9.2.2 Buhlmann ZH-L16 Model (Modern Standard)**

**16 Compartments with Compartment-Specific M-Values:**

$$M = M_0 + \Delta M \cdot P_{amb}$$

Where $M_0$ = surface M-value, $\Delta M$ = pressure gradient coefficient.

**Buhlmann ZH-L16B Parameters (Nitrogen):**
| Comp | $t_{1/2}$ [min] | $a$ ($M_0$) [bar] | $b$ ($\Delta M$) |
|------|-----------------|-------------------|------------------|
| 1 | 4.0 | 1.2599 | 0.5050 |
| 2 | 8.0 | 1.0000 | 0.6514 |
| 3 | 12.5 | 0.8618 | 0.7222 |
| 4 | 18.5 | 0.7562 | 0.7725 |
| 5 | 27.0 | 0.6667 | 0.8125 |
| 6 | 38.3 | 0.5933 | 0.8434 |
| 7 | 54.3 | 0.5282 | 0.8693 |
| 8 | 77.0 | 0.4701 | 0.8910 |
| 9 | 109.0 | 0.4187 | 0.9092 |
| 10 | 146.0 | 0.3798 | 0.9222 |
| 11 | 187.0 | 0.3497 | 0.9319 |
| 12 | 239.0 | 0.3223 | 0.9403 |
| 13 | 305.0 | 0.2996 | 0.9477 |
| 14 | 390.0 | 0.2813 | 0.9544 |
| 15 | 498.0 | 0.2663 | 0.9602 |
| 16 | 635.0 | 0.2542 | 0.9653 |

**Allowed Tissue Pressure:**
$$P_{tiss,allowed} = \frac{P_{amb} + a}{b} \quad \text{(in bar)}$$

**Supersaturation Gradient:**
$$\Delta P = P_{tiss} - P_{tiss,allowed}$$
DCS risk when $\Delta P > 0$ for any compartment.

**9.2.3 Tissue Tension Evolution During Pre-breathe**

**Initial Condition (Cabin Air, 101.3 kPa):**
$$P_{N_2,i}(0) = 66.1 \text{ kPa} \quad \text{(all compartments)}$$

**During 100% O₂ Pre-breathe at Cabin Pressure (101.3 kPa):**
$$P_{N_2,i}(t) = 66.1 \cdot 2^{-t / t_{1/2,i}} \quad \text{[kPa]}$$

**During Suit Exposure (Pure O₂ at $P_{suit}$):**
$$P_{N_2,i}(t) = P_{N_2,i}(t_{pb}) \cdot 2^{-(t-t_{pb}) / t_{1/2,i}}$$

**9.2.4 NASA VVAL-18 / VVAL-18M Thalmann Algorithm**

**Used for:** Shuttle/ISS EVA pre-breathe planning

**Key Differences from Buhlmann:**
- **Probabilistic DCS model** (not deterministic M-values)
- **Time-varying perfusion** (exercise increases blood flow)
- **Bubble nucleation/growth physics** (not just supersaturation)
- **Validated against 3,000+ manned dives/EVAs**

**VVAL-18M Tissue Compartments (9):**
| Comp | $t_{1/2}$ [min] | $M_0$ [fsw] | $\Delta M$ |
|------|-----------------|-------------|------------|
| 1 | 5 | 104 | 2.27 |
| 2 | 10 | 88 | 2.02 |
| 3 | 20 | 72 | 1.83 |
| 4 | 40 | 58 | 1.64 |
| 5 | 80 | 52 | 1.50 |
| 6 | 120 | 46 | 1.39 |
| 7 | 240 | 40 | 1.27 |
| 8 | 480 | 36 | 1.18 |
| 9 | 720 | 32 | 1.10 |

**DCS Probability Function:**
$$P_{DCS} = 1 - \exp\left[-\sum_{i} w_i \left(\frac{P_{tiss,i} - P_{amb}}{M_i}\right)^2\right]$$

Where $w_i$ = compartment weighting factors.

**Operational Limit:** $P_{DCS} < 0.01$ (1%) for nominal EVA.

---

*End of Piece 2 — DOC-09 Lines 7301-7400*
*Next: Piece 3 — Section 9.3 NASA Pre-breathe Protocols: Standard & Campout*