# DOC-08: EMU Atmospheric Composition & Operating Pressures
## Document 8 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 6501-6600 | Piece 3 of 9 | ~100 Lines

---

#### 8.3 NASA vs. Roscosmos Pressure Philosophy Comparison

**8.3.1 The Fundamental Divergence**

| Aspect | **NASA (EMU: 29.6 kPa / 4.3 psi)** | **Roscosmos (Orlan: 40 kPa / 5.8 psi)** |
|--------|-----------------------------------|----------------------------------------|
| **Optimization Target** | **EVA work capacity** (minimize joint torque) | **Operational tempo** (minimize pre-breathe) |
| **Cabin Pressure** | 101.3 kPa (14.7 psi) | 101.3 kPa (14.7 psi) |
| **Pre-breathe Protocol** | 4 hr @ 101.3 kPa + 45 min 100% O₂ | **30 min 100% O₂** |
| **Joint Torque (Elbow)** | 7.5 N·m (baseline) | 10.5 N·m (+40%) |
| **EVA Endurance (Fatigue)** | 8.6 min (static 15% MVC) | 5.2 min (static 21% MVC) |
| **Fire Risk** | 1.5–2× sea level | 2.5–4× sea level |
| **Restraint Mass** | Baseline | +35% |
| **Glove Performance** | 30% bare-hand grip | 25% bare-hand grip |
| **Historical Driver** | Apollo 1 fire → pressure minimization | Salyut/Mir ops tempo → rapid EVA |

**8.3.2 Quantitative Trade Analysis**

**Joint Torque Model (from DOC-07):**
$$T_{elbow} = k_P \cdot P_{suit} + T_0$$
Where $k_P \approx 0.25$ N·m/kPa, $T_0 \approx 0.5$ N·m

**Metabolic Cost per EVA (from DOC-07):**
$$\dot{E}_{suit} \propto \sum T_{joint} \cdot \omega_{joint}$$

**At 29.6 kPa:** $\dot{E}_{suit} = 1.7$ W avg, 6.2 min dynamic endurance
**At 40 kPa:** $\dot{E}_{suit} = 2.4$ W avg, 3.8 min dynamic endurance

**Work Output Difference:** **39% MORE work possible at NASA pressure**

**8.3.3 Pre-Breathe Time — The Roscosmos Advantage**

**NASA Protocol (ISS):**
1. Cabin at 101.3 kPa (14.7 psi)
2. **4 hours** pre-breathe 100% O₂ (exercise intervals)
3. Depress airlock to 29.6 kPa
4. **45 min** additional 100% O₂ in suit
4. **Total: ~4.75 hours** before EVA

**Roscosmos Protocol (ISS):**
1. Cabin at 101.3 kPa
2. **30 minutes** 100% O₂ pre-breathe
3. Don Orlan (40 kPa)
3. **Immediate EVA** (no additional wait)
4. **Total: ~0.5 hours** before EVA

**Why Does Orlan Need Only 30 min?**
**Critical Supersaturation Ratio for DCS:**
$$\frac{P_{N_2,tissue}}{P_{amb}} < 1.6 \quad \text{(no-stop limit)}$$

At 101.3 kPa cabin, tissue $P_{N_2} \approx 0.78 \times 101.3 = 79$ kPa
**Depressurization to 40 kPa:** Ratio = 79/40 = **1.98** → **Exceeds 1.6!**

**But Orlan uses 30 min pre-breathe at 100% O₂:**
- Washes out N₂ from **fast compartments** (5–20 min half-time)
- **Slow compartments** (120–240 min) still saturated
- **Russian acceptable risk:** Higher DCS incidence tolerated (historically ~1% vs. NASA <0.1%)
- **Operational necessity:** Rapid EVA for station emergencies

**NASA Philosophy:** **Zero tolerance for DCS** → conservative pre-breathe
**Roscosmos Philosophy:** **Acceptable risk for operational flexibility**

**8.3.4 Future Convergence — The 8.3 psi Cabin Solution**

**Lunar Gateway / Artemis Plan:**
- **Cabin pressure: 55 kPa (8.0 psi), 30% O₂ / 70% N₂**
- **Suit pressure: 29.6 kPa (4.3 psi) or 40 kPa (5.8 psi)**

**At 55 kPa cabin, 30% O₂:**
- $P_{O_2} = 16.5$ kPa (normoxic)
- Tissue $P_{N_2} = 0.7 \times 55 = 38.5$ kPa
- **Depressurization to 29.6 kPa:** Ratio = 38.5/29.6 = **1.30** → **NO PRE-BREATHE NEEDED!**
- **Depressurization to 40 kPa:** Ratio = 38.5/40 = **0.96** → **NO PRE-BREATHE NEEDED!**

**This eliminates the NASA/Roscosmos divergence for lunar operations.**

---

*End of Piece 3 — DOC-08 Lines 6501-6600*
*Next: Piece 4 — Section 8.4 Thermodynamic Constraints on Suit Pressure*