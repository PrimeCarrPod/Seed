# DOC-07: EMU Architecture — Anthropomorphic Pressure Vessels
## Document 7 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5901-6000 | Piece 6 of 9 | ~100 Lines

---

#### 7.6 Mobility-Torque Trade Space & Metabolic Cost

**7.6.1 The Fundamental Trade-off**

**Higher Suit Pressure → Higher Joint Torque → Higher Metabolic Cost**
**Lower Suit Pressure → Lower Joint Torque → BUT Longer Pre-breathe (DCS Risk)**

**Joint Torque vs. Pressure (Bellows Joint):**
$$T_{joint} \approx k_P \cdot P + k_0$$
Where $k_P \propto r^2 L$ (geometry), $k_0$ = structural bending

**For EMU Elbow:**
$$T_{elbow} \approx 0.25 \cdot P[\text{kPa}] + 0.5 \quad \text{[N·m]}$$
At 29.6 kPa: $T \approx 7.9$ N·m
At 40 kPa: $T \approx 10.5$ N·m (+33%)
At 55 kPa: $T \approx 14.3$ N·m (+80%)

**7.6.2 Metabolic Cost Model (EVA Work)**

**Total EVA Metabolic Rate:**
$$\dot{E}_{total} = \dot{E}_{basal} + \dot{E}_{suit} + \dot{E}_{task}$$

**Suit Penalty ($\dot{E}_{suit}$):**
$$\dot{E}_{suit} = \sum_{joints} \frac{T_{joint} \cdot \omega_{joint}}{\eta_{muscle}} \cdot N_{cycles}$$
Where $\eta_{muscle} \approx 0.25$ (muscle efficiency)

**Typical EVA (6.5 hr, 100 joint cycles/hr):**
| Joint | Torque [N·m] | ROM [rad] | Cycles | Work [J] |
|-------|--------------|-----------|--------|----------|
| Shoulder | 3.0 | 1.5 | 200 | 900 |
| Elbow | 7.5 | 1.5 | 300 | 3,375 |
| Wrist | 0.8 | 1.0 | 500 | 400 |
| Waist | 4.0 | 1.0 | 100 | 400 |
| Knee | 6.0 | 1.5 | 200 | 1,800 |
| Ankle | 2.0 | 0.5 | 100 | 100 |
| Fingers (×10) | 0.3 | 1.5 | 1000 | 4,500 |
| **TOTAL** | — | — | — | **~11,500 J** |

**Metabolic Equivalent:** 11,500 J / 0.25 = **46 kJ = 11 kcal**
Over 6.5 hr: **1.7 W average** — **seemingly small**

**BUT:** Peak torque requires **maximal voluntary contraction (MVC)** intermittently.
**MVC fraction** determines fatigue, not average power.

**7.6.3 Fatigue Model — Endurance Time**

**Rohmert's Law (Static Effort):**
$$t_{end} = \frac{C}{(\%MVC)^n}$$
Where $C \approx 30,000$, $n \approx 1.5$ for arm muscles.

**EMU Elbow at 7.5 N·m:**
- MVC elbow flexion: ~50 N·m (suited, pressurized)
- $\%MVC = 7.5 / 50 = 15\%$
- $t_{end} = 30,000 / (15)^{1.5} = 30,000 / 58 = 517$ sec = **8.6 min**

**At 40 kPa (Orlan):**
- Torque = 10.5 N·m → $\%MVC = 21\%$
- $t_{end} = 30,000 / (21)^{1.5} = 30,000 / 96 = 312$ sec = **5.2 min**

**39% reduction in endurance!** This is why NASA stays at 4.3 psi.

**7.6.4 Dynamic Effort — Cycle Frequency Matters**

**Dynamic Endurance (Cyclic):**
$$t_{end,dyn} = t_{end,stat} \cdot \left(\frac{f_{ref}}{f}\right)^m$$
Where $f_{ref} = 0.1$ Hz, $m \approx 0.2$.

**At 0.5 Hz (typical EVA movement):**
$$t_{end} = 517 \times (0.1/0.5)^{0.2} = 517 \times 0.72 = 372 \text{ sec} = \mathbf{6.2 \text{ min}}$$

**Work/Rest Ratio:** 1:3 (20 min work, 60 min rest) to maintain performance.

**7.6.5 Glove Fatigue — The Critical Limiter**

**Hand Grip Strength (Suited):**
- Unsuited MVC: 400 N
- Shuttle glove (4.3 psi): 120 N (30%)
- xEMU glove (rolling lobe): 200 N (50%)

**Typical EVA Task (Bolt Torque):** 15–20 N·m
**Required Grip:** 50–70 N (with lever arm)
**At 30% MVC:** **Rapid fatigue — 15 min continuous**

**Glove Design Priority:** Maximize grip strength retention.
**xEMU Rolling Lobe Glove:** Target 50% MVC retention.

**7.6.6 Optimal Pressure — The NASA vs. Roscosmos Choice**

| Parameter | NASA (29.6 kPa) | Roscosmos (40 kPa) | Future (55 kPa?) |
|-----------|-----------------|---------------------|------------------|
| $P_{A}O_2$ | 16.7 kPa | 25.4 kPa | 40.7 kPa |
| Elbow Torque | 7.9 N·m | 10.5 N·m | 14.3 N·m |
| Endurance (static) | 8.6 min | 5.2 min | 3.1 min |
| Pre-breathe (from 101 kPa) | 4 hr | 30 min | 0 min (8.3 psi cabin) |
| Restraint Mass | Baseline | +35% | +85% |
| **EVA Efficiency** | **Baseline** | **-25%** | **-50%** |

**NASA Optimization:** Maximize EVA work capacity (torque-limited)
**Roscosmos Optimization:** Minimize pre-breathe (ops tempo)
**Future (Lunar Gateway):** 8.3 psi cabin → 55 kPa suit possible (no pre-breathe)

---

*End of Piece 6 — DOC-07 Lines 5901-6000*
*Next: Piece 7 — Section 7.7 PLSS Integration & Structural Loads*