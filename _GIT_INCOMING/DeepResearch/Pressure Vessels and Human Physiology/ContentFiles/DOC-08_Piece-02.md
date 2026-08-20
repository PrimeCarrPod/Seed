# DOC-08: EMU Atmospheric Composition & Operating Pressures
## Document 8 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 6401-6500 | Piece 2 of 9 | ~100 Lines

---

#### 8.2 Fire Risk in 100% Oxygen Environments

**8.2.1 The Apollo 1 Legacy — Why Fire Risk Dominates Design**

Apollo 1 (1967): **100% O₂ at 115 kPa (16.7 psi) on ground** → electrical spark → flash fire → 3 astronaut deaths in 17 seconds.

**Key Lesson:** Fire risk in 100% O₂ is **exponentially dependent on pressure**.

**8.2.2 Combustion Physics — Pressure Dependence**

**Burning Rate ($v_b$) for Solid Fuels in O₂:**
$$v_b \propto P_{O_2}^n$$
Where $n \approx 0.5\text{–}1.0$ for most polymers.

**Flame Temperature ($T_f$):**
$$T_f \approx T_{ad} = T_0 + \frac{\Delta H_c}{c_p} \quad \text{(adiabatic flame temperature)}$$
In 100% O₂, $T_f$ is **300–500°C higher** than in air.

**Ignition Energy ($E_{ign}$):**
$$E_{ign} \propto P_{O_2}^{-m} \quad (m \approx 1.5\text{–}2.0)$$
**At 30 kPa 100% O₂ vs. 101 kPa 21% O₂:**
- $P_{O_2}$ ratio: 30 / 21 = 1.43×
- $E_{ign}$ reduction: $(1.43)^{-1.5} = 0.58$ → **42% LESS energy to ignite**

**8.2.3 NASA STD-6001 Flammability Testing**

**Test 1 (Upward Flammability):** Material self-extinguishes in 100% O₂ at test pressure.
**Test 15 (Wire Insulation):** Arc-track resistance in 100% O₂.

**EMU Materials Certification:**
- **All materials** must pass Test 1 at **1.5× operating pressure** (45 kPa)
- **No materials** with burn rate > 25 mm/min at 45 kPa 100% O₂
- **Electrical insulation:** Test 15 at 45 kPa 100% O₂

**8.2.4 Fire Risk Quantification — Pressure Comparison**

| Environment | $P_{total}$ [kPa] | $P_{O_2}$ [kPa] | Relative Ignition Risk | Relative Burn Rate |
|-------------|-------------------|-----------------|------------------------|-------------------|
| **Sea Level Air** | 101.3 | 21.3 | **1.0 (baseline)** | **1.0** |
| **ISS Cabin** | 101.3 | 21.3 | 1.0 | 1.0 |
| **Apollo 1 (Ground)** | 115 | 115 | **100–1000×** | **5–10×** |
| **NASA EMU (EVA)** | **29.6** | **29.6** | **1.5–2×** | **1.2–1.5×** |
| **Orlan (EVA)** | **40** | **40** | **2.5–4×** | **1.5–2×** |
| **Future 55 kPa Suit** | 55 | 55 | **5–8×** | **2–3×** |

**Critical Insight:** **NASA's 4.3 psi (29.6 kPa) keeps fire risk MANAGEABLE** (only ~2× sea level air).
**Orlan's 5.8 psi (40 kPa) is at the UPPER LIMIT of acceptable fire risk.**
**Pressures > 50 kPa 100% O₂ require EXTREME material restrictions.**

**8.2.5 EMU Fire Mitigation Strategies**

1. **Material Selection:** Only Test 1/15 qualified materials (Beta cloth, Vectran®, Gore-Tex®, Teflon®)
2. **No Electrical Arcing:** All connectors gold-plated, sealed, current-limited
3. **O₂ Concentration Monitoring:** Redundant $O_2$ sensors (zirconia, paramagnetic)
4. **Rapid Depressurization Capability:** Emergency dump valve (3 sec to vacuum)
5. **No Open Flames/Sparks:** Tools are battery-operated, no hot work during EVA

**8.2.6 The 100% O₂ vs. Mixed Gas Trade**

**Mixed Gas (e.g., 50% O₂ / 50% N₂ at 55 kPa):**
- $P_{O_2} = 27.5$ kPa → $P_{A}O_2 = 27.5 - 12.9 = 14.6$ kPa (adequate)
- Fire risk: $P_{O_2} = 27.5$ kPa ≈ sea level air risk
- **BUT:** Adds N₂ → **DCS risk on depressurization** → requires pre-breathe
- **Adds complexity:** Gas mixing, monitoring, storage

**Pure O₂ at Lower Pressure (NASA Choice):**
- **Eliminates inert gas** → no DCS risk from suit leak
- **Simplifies PLSS** (single gas, no mixer)
- **Fire risk managed** by pressure limit (29.6 kPa) + material control

**This is the FUNDAMENTAL ARCHITECTURAL DECISION of NASA EMU.**

---

*End of Piece 2 — DOC-08 Lines 6401-6500*
*Next: Piece 3 — Section 8.3 NASA vs. Roscosmos Pressure Philosophy Comparison*