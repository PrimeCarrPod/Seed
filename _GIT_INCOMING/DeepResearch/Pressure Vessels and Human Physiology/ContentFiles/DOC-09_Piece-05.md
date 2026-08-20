# DOC-09: Inert Gas Desaturation & Pre-Breathe Kinetics
## Document 9 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 7601-7700 | Piece 5 of 9 | ~100 Lines

---

#### 9.5 Exercise-Enhanced Washout Kinetics

**9.5.1 Perfusion Increase During Exercise**

**Blood Flow Multiplier ($Q_{ex}/Q_{rest}$):**
| Exercise Intensity | $\dot{V}O_2$ [mL/min] | Cardiac Output | Muscle Perfusion | Fat Perfusion |
|-------------------|----------------------|----------------|------------------|---------------|
| **Rest** | 250 | 5 L/min | 1.0× | 1.0× |
| **Light (50 W)** | 750 | 10 L/min | **3–5×** | 0.8× |
| **Moderate (100 W)** | 1,200 | 15 L/min | **8–10×** | 0.6× |
| **Heavy (150 W)** | 1,800 | 20 L/min | **15–20×** | 0.5× |

**Effect on Half-time:**
$$t_{1/2,ex} = \frac{t_{1/2,rest}}{Q_{ex}/Q_{rest}} \quad \text{(for perfusion-limited compartments)}$$

**Well-perfused compartments (muscle, brain):** Half-time **decreases proportionally to cardiac output**
**Poorly-perfused compartments (fat):** Half-time **unchanged or increases** (vasoconstriction)

**9.5.2 NASA Exercise Protocol Design (Standard Pre-breathe)**

**4-hour Protocol with Intermittent Exercise:**
- **50 min exercise / 10 min rest × 4 cycles**
- **Exercise:** 50 W cycle ergometer (light)
- **Cardiac output:** ~10 L/min (2× rest)
- **Muscle perfusion:** ~4× rest

**Effective Half-times During Exercise:**
| Compartment | Rest $t_{1/2}$ | Exercise $t_{1/2}$ | Washout Rate Increase |
|-------------|----------------|-------------------|----------------------|
| 2 (10 min) | 10 min | 2.5 min | **4×** |
| 3 (20 min) | 20 min | 5 min | **4×** |
| 4 (40 min) | 40 min | 10 min | **4×** |
| 5 (80 min) | 80 min | 20 min | **4×** |
| 6 (120 min) | 120 min | 30 min | **4×** |

**Fat compartments (8, 9):** No improvement (vasoconstriction during exercise)

**9.5.3 Quantitative Washout Comparison: Exercise vs. Rest**

**4 hours (240 min) at Rest:**
$$P_{N_2,4} = 66.1 \cdot 2^{-240/40} = 66.1 \cdot 2^{-6} = 1.03 \text{ kPa}$$

**4 hours with 200 min Exercise (50 min × 4):**
- 200 min at $t_{1/2} = 10$ min: $2^{-200/10} = 2^{-20} = 9.5 \times 10^{-7}$
- 40 min at $t_{1/2} = 40$ min: $2^{-40/40} = 0.5$
- Combined: **$P_{N_2} \approx 0.0005$ kPa** (vs. 1.03 kPa at rest)

**Improvement: 2,000× faster washout for compartment 4!**

**9.5.4 Compartment 6 (120 min) — The Critical Boundary**

**At Rest (240 min):** $P_{N_2} = 66.1 \cdot 2^{-2} = 16.5$ kPa
**With Exercise (200 min at 4×):** $P_{N_2} = 66.1 \cdot 2^{-200/30} = 66.1 \cdot 2^{-6.67} = 0.66$ kPa

**Improvement: 25× — THIS is why exercise is mandatory for standard protocol.**

**Without exercise:** Compartment 6 at 16.5 kPa → ratio at 29.6 kPa = 0.56 (safe)
**But compartment 7 at 33 kPa → ratio = 1.11 (marginal)**

**With exercise:** Both compartments 6 & 7 washed out to < 1 kPa → **large safety margin**

**9.5.5 Exercise During Suit Pre-breathe (45 min at 29.6 kPa)**

**Light exercise in suit (limited by mobility):**
- Arm ergometry: 30–50 W possible
- **Perfusion increase:** 2× (upper body only)
- **Lower body:** No exercise → fat compartments unchanged

**Effect on slow compartments (7, 8, 9): Minimal**
**Primary benefit:** Maintains upper body washout, prevents re-saturation from residual lung N₂.

**9.5.6 Individual Variability — The "Slow Decompressor"**

**Half-time Distribution (Population):**
- $t_{1/2,muscle}$: Log-normal, mean 120 min, SD 30 min
- $t_{1/2,fat}$: Log-normal, mean 480 min, SD 120 min

**5th Percentile (Slow Decompressor):**
- Muscle $t_{1/2} \approx 180$ min
- Fat $t_{1/2} \approx 720$ min

**Standard Protocol Margin for 5th %ile:**
- Compartment 6 (180 min): $P_{N_2} = 66.1 \cdot 2^{-240/180} = 66.1 \cdot 2^{-1.33} = 26.3$ kPa
- Ratio at 29.6 kPa: 0.89 (still safe with 45-min suit pre-breathe)

**Campout Protocol Better for Slow Decompressors:**
- Lower cabin pressure reduces initial loading
- Longer time at reduced $P_{N_2}$ improves slow compartment washout

---

*End of Piece 5 — DOC-09 Lines 7601-7700*
*Next: Piece 6 — Section 9.6 Probabilistic DCS Risk Models (VVAL-18M, Buhlmann)*