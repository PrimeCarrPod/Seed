# DOC-09: Inert Gas Desaturation & Pre-Breathe Kinetics
## Document 9 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 7201-8100 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document provides a comprehensive mathematical analysis of **inert gas desaturation kinetics** and **pre-breathe protocols** for extravehicular activity (EVA). The transition from a nitrogen-containing cabin atmosphere (101.3 kPa, 78% N₂) to a pure-oxygen hypobaric suit environment (29.6–40 kPa) creates a profound risk of decompression sickness (DCS) due to nitrogen supersaturation in tissues. This document derives the multi-compartment Haldane/Buhlmann model, calculates tissue nitrogen tensions for standard and campout protocols, analyzes the VVAL-18 and VVAL-18M Thalmann algorithms used by NASA, and quantifies the probabilistic DCS risk models that underpin current pre-breathe requirements. The analysis covers both NASA (4-hour/24-hour) and Roscosmos (30-minute) protocols, explaining the physiological and operational rationale for their divergence.

**Keywords:** Inert gas desaturation, pre-breathe, decompression sickness, DCS, nitrogen washout, Haldane model, Buhlmann model, VVAL-18, Thalmann algorithm, tissue compartments, half-times, supersaturation ratio, probabilistic risk

---

### 9. INERT GAS DESATURATION AND PRE-BREATHE KINETICS

#### 9.1 Henry's Law & Tissue Gas Loading — The Physiological Basis

**9.1.1 Henry's Law for Inert Gas Solubility**

At equilibrium, the concentration of dissolved gas in a liquid is proportional to its partial pressure:

$$C = \lambda \cdot P$$

Where:
- $C$ = Concentration in tissue [mL gas / 100 mL tissue]
- $\lambda$ = Ostwald solubility coefficient (tissue:blood partition coefficient)
- $P$ = Partial pressure of gas [kPa]

**For Nitrogen in Human Tissues:**
| Tissue Type | $\lambda_{N_2}$ (Ostwald) | Half-time [min] | Compartment |
|-------------|---------------------------|-----------------|-------------|
| **Blood (fast)** | 0.067 | 5 | 1 |
| **Brain, Heart** | 0.07–0.10 | 10–20 | 2–3 |
| **Muscle (well-perfused)** | 0.10–0.15 | 40–80 | 4–5 |
| **Muscle (poorly-perfused)** | 0.15–0.20 | 120–240 | 6–7 |
| **Fat (adipose)** | 0.60–0.70 | 360–720 | 8–9 |

**Fat has 10× higher N₂ solubility than water-based tissues** — critical for DCS risk.

**9.1.2 Tissue Gas Loading at Cabin Pressure (101.3 kPa, 78% N₂)**

Inspired $P_{N_2}$ in cabin:
$$P_{I}N_2 = 0.78 \times (101.3 - 6.3) = 0.78 \times 95 = 74.1 \text{ kPa}$$

Alveolar $P_{N_2}$ (accounting for O₂/CO₂ exchange):
$$P_{A}N_2 = P_{I}N_2 - \frac{P_{A}O_2 + P_{A}CO_2 - P_{I}O_2}{RQ} \approx 74.1 - 8 = \mathbf{66.1 \text{ kPa}}$$

**Tissue Equilibration (Infinite Time):**
$$P_{tiss,N_2}(\infty) = P_{A}N_2 = 66.1 \text{ kPa}$$

**At saturation, ALL compartments reach 66.1 kPa N₂ tension.**

**9.1.3 Desaturation Kinetics — Exponential Washout**

When inspired $P_{N_2}$ drops to 0 (100% O₂ breathing), tissue N₂ decays exponentially:

$$\frac{dP_{tiss}}{dt} = -k (P_{tiss} - P_{amb,N_2})$$

With $P_{amb,N_2} = 0$ (pure O₂):
$$P_{tiss}(t) = P_{tiss}(0) \cdot e^{-kt}$$

Where $k = \frac{\ln 2}{t_{1/2}}$ (half-time constant).

**Solution for Compartment $i$:**
$$P_{N_2,i}(t) = P_{N_2,i}(0) \cdot 2^{-t / t_{1/2,i}}$$

**Washout to < 10% of Initial:**
$$t_{90\%} = t_{1/2} \cdot \log_2(10) \approx 3.32 \cdot t_{1/2}$$

| Compartment | $t_{1/2}$ [min] | $t_{90\%}$ [min] | $t_{99\%}$ [min] |
|-------------|-----------------|------------------|------------------|
| **Fast (Blood)** | 5 | 17 | 33 |
| **Medium (Brain)** | 20 | 66 | 133 |
| **Slow (Muscle)** | 120 | 398 | 797 |
| **Very Slow (Fat)** | 480 | 1,594 | 3,188 |

**Key Insight:** **Fast compartments wash out in hours; fat takes DAYS.**

---

*End of Piece 1 — DOC-09 Lines 7201-7300*
*Next: Piece 2 — Section 9.2 Multi-Compartment Haldane/Buhlmann Model*