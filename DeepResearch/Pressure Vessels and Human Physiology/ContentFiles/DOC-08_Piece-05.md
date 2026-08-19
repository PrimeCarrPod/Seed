# DOC-08: EMU Atmospheric Composition & Operating Pressures
## Document 8 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 6701-6800 | Piece 5 of 9 | ~100 Lines

---

#### 8.5 Physiological Boundaries: Hypoxia, Hyperoxia, DCS

**8.5.1 Hypoxia Boundary — Minimum Suit Pressure**

From alveolar gas equation (Section 8.1):
$$P_{A}O_2 = P_{suit} - 12.925 \text{ kPa}$$

**Cognitive Threshold:** $P_{A}O_2 \geq 13.3$ kPa (sea-level equivalent)
$$P_{suit,min} = 13.325 + 12.925 = \mathbf{26.25 \text{ kPa}} \quad (3.81 \text{ psi})$$

**Consciousness Threshold:** $P_{A}O_2 \geq 8.0$ kPa
$$P_{suit,crit} = 8.0 + 12.925 = \mathbf{20.93 \text{ kPa}} \quad (3.04 \text{ psi})$$

**NASA Margin:** 29.6 kPa - 26.25 kPa = **3.35 kPa (12.8% margin)**

**8.5.2 Hyperoxia Boundary — CNS Oxygen Toxicity (Paul Bert Effect)**

**Threshold:** $P_{O_2} > 160$ kPa (1.6 ATA) → seizure risk
**EMU Suit Pressure:** 29.6 kPa = **0.29 ATA** → **WELL BELOW** CNS toxicity

**Pulmonary Toxicity (Lorrain Smith Effect):**
- Threshold: $P_{O_2} > 50$ kPa for > 12 hours
- EMU: 29.6 kPa → **SAFE for indefinite exposure**

**Orlan (40 kPa):** Also safe for both CNS and pulmonary toxicity.

**8.5.3 Decompression Sickness (DCS) Boundary**

**Mechanism:** Inert gas (N₂) comes out of solution → bubbles in tissue/blood

**Critical Supersaturation Ratio (No-Decompression Limit):**
$$\frac{P_{N_2,tissue}}{P_{amb}} \leq 1.6 \quad \text{(Haldane/Buhlmann)}$$

**NASA Scenario (Cabin 101.3 kPa → Suit 29.6 kPa):**
- Tissue $P_{N_2}$ (pre-breathe): Washed out to < 10 kPa (fast compartments)
- Remaining tissue $P_{N_2}$ (slow): ~40 kPa after 4-hr pre-breathe
- Ratio at suit pressure: 40/29.6 = **1.35** → **SAFE**

**Without Pre-breathe (Direct Depressurization):**
- Tissue $P_{N_2} = 0.78 \times 101.3 = 79$ kPa
- Ratio: 79/29.6 = **2.67** → **SEVERE DCS RISK**

**Orlan Scenario (Cabin 101.3 kPa → Suit 40 kPa, 30-min pre-breathe):**
- Fast compartments washed out
- Slow compartments: ~60 kPa
- Ratio: 60/40 = **1.5** → **MARGINAL (Russian acceptable risk)**

**8.5.4 Ebullism Boundary — Armstrong Limit**

**Armstrong Limit:** $P_{amb} < 6.3$ kPa (47 mmHg) → body water boils at 37°C
**EMU Minimum Pressure:** 29.6 kPa → **4.7× Armstrong Limit** (large margin)

**Emergency Depressurization Scenario:**
- Suit puncture → rapid depressurization to vacuum
- Time to Armstrong Limit: ~30 sec (for 1 cm² hole)
- **Time of Useful Consciousness at vacuum:** 9–15 seconds
- **Survival Time:** ~90 seconds (if repressurized)

**8.5.5 Barotrauma — Gas Space Pressure Differential**

**Middle Ear / Sinuses:**
$$\Delta P_{max} = P_{suit} - P_{Eustachian}$$
If Eustachian tube blocked: $\Delta P = 29.6$ kPa → **pain, potential rupture**

**Mitigation:** Valsalva maneuver, slow pressure changes (< 500 ft/min = 2.5 kPa/min)

**Lungs (Pulmonary Barotrauma):**
- Breath-holding during depressurization → lung overpressure
- $\Delta P > 8$ kPa → alveolar rupture (pneumothorax)
- **Training:** Continuous breathing, never hold breath

**8.5.6 Summary: Physiological Operating Envelope**

| Boundary | Pressure [kPa] | Pressure [psi] | Margin at 29.6 kPa |
|----------|----------------|----------------|-------------------|
| **Ebullism (vacuum boil)** | 6.3 | 0.9 | 23.3 kPa |
| **Consciousness (hypoxia)** | 20.9 | 3.0 | 8.7 kPa |
| **Cognition (hypoxia)** | 26.3 | 3.8 | 3.3 kPa |
| **NASA EMU Operating** | **29.6** | **4.3** | **Baseline** |
| **Orlan Operating** | 40.0 | 5.8 | — |
| **Pulmonary O₂ Toxicity** | 50.0 | 7.3 | 20.4 kPa |
| **CNS O₂ Toxicity** | 160.0 | 23.2 | 130.4 kPa |
| **Fire Risk (manageable)** | ~50 | ~7.3 | — |

**Optimal Zone:** 26–50 kPa (3.8–7.3 psi) pure O₂
**NASA Choice:** Lower end (torque minimization)
**Roscosmos Choice:** Upper end (pre-breathe minimization)

---

*End of Piece 5 — DOC-08 Lines 6701-6800*
*Next: Piece 6 — Section 8.6 Historical Evolution: Mercury → Gemini → Apollo → Shuttle → ISS*