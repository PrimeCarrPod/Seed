# DOC-08: EMU Atmospheric Composition & Operating Pressures
## Document 8 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 6901-7000 | Piece 7 of 9 | ~100 Lines

---

#### 8.7 Future Architectures: 8.3 psi Cabin, Variable Pressure, TLV

**8.7.1 Lunar Gateway — 8.3 psi (55 kPa) Cabin**

**Design Specification:**
- **Total Pressure:** 55.2 kPa (8.0 psi) — *some sources say 8.3 psi = 57.2 kPa*
- **O₂ Fraction:** 30% (balance N₂)
- **$P_{O_2}$:** 16.6 kPa (124 mmHg) → **normoxic**
- **$P_{N_2}$:** 38.6 kPa (290 mmHg)

**Physiological Impact:**
- Equivalent altitude: ~2,700 m (8,900 ft) — mild hypoxia for unacclimatized
- **Countermeasure:** 30% O₂ maintains sea-level $P_{A}O_2$
- **Acclimatization:** Crew pre-adapt at altitude or hypoxic tent

**EVA Implications:**
| Suit Pressure | Tissue $P_{N_2}$ (from 55 kPa, 30% O₂) | Supersaturation Ratio | Pre-breathe |
|---------------|----------------------------------------|----------------------|-------------|
| **29.6 kPa (NASA)** | 38.6 kPa | 38.6/29.6 = **1.30** | **0 min** |
| **40 kPa (Orlan)** | 38.6 kPa | 38.6/40 = **0.97** | **0 min** |
| **55 kPa (Future)** | 38.6 kPa | 38.6/55 = **0.70** | **0 min** |

**Result: ZERO PRE-BREATHE for any suit pressure at 55 kPa cabin!**
This is the **primary driver for 8.3 psi cabin** — operational tempo.

**8.7.2 Variable Pressure Suit (VPS) — The "Chameleon" Concept**

**Concept:** Suit that adjusts pressure **during EVA** based on task.

**Phases:**
1. **Transit (Low Work):** 29.6 kPa (4.3 psi) — maximum mobility
2. **Worksite (High Force):** 40 kPa (5.8 psi) — higher $P_{A}O_2$, more stable
3. **Emergency:** 55 kPa (8.0 psi) — maximum $O_2$ delivery, no pre-breathe

**Mechanism:** **Adjustable regulator** + **variable-volume restraint** (inflatable bladder)

**Pressure Change Rate Limit:** 1.3 kPa/min (physiological comfort)
**Transition Time:** 29.6 → 40 kPa = 8 min; 29.6 → 55 kPa = 20 min

**Benefit:** Optimizes mobility for each task phase.

**8.7.3 Total Liquid Ventilation (TLV) EMU — The Paradigm Shift**

**From DOC-01 §1.7 & DOC-14–17:**
- **Liquid breathing** with PFC eliminates gas compression issues
- **Suit pressure = 101.3 kPa (1 atm)** — **no hypobaric exposure**
- **No pre-breathe, no DCS risk, no fire risk (no gas O₂)**

**TLV-EMU Architecture:**
- **Bladder:** Filled with PFC (not gas) — incompressible
- **Restraint:** Same (carries 1 atm pressure)
- **Joints:** **Zero pressure torque** (incompressible fluid)
- **PLSS:** Liquid ventilator + PFC loop (replaces gas loop)

**Pressure Advantage:**
$$T_{joint,TLV} = T_{structural} \quad \text{(no pressure component!)}$$
**Joint torque reduced by 70–90% vs. gas EMU.**

**Challenges (from DOC-16):**
- CO₂ diffusion limitation in PFC
- Liquid ventilator mass/power
- PFC clearance post-EVA

**Timeline:** 2040+ for operational TLV-EMU.

**8.7.4 Mechanical Counterpressure (MCP) Suit — The "Bio-Suit"**

**Concept:** **No gas pressure** — mechanical compression via elastic garments.

**Target Pressure:** 30 kPa mechanical (equivalent to 4.3 psi gas)
**Technology:** Shape-memory alloys, active materials, layered elastics

**Advantages:**
- **Zero gas pressure** → no pre-breathe, no DCS, no fire risk
- **Maximum mobility** (no ballooning)
- **Lightweight** (no PLSS gas storage)

**Challenges:**
- Uniform compression over complex anatomy
- Don/doff difficulty
- Thermal management (no gas convection)
- Long-duration comfort

**Status:** MIT/Dava Newman research — **Technology Readiness Level 4–5**

---

*End of Piece 7 — DOC-08 Lines 6901-7000*
*Next: Piece 8 — Section 8.8 Quantitative Trade Space Summary*