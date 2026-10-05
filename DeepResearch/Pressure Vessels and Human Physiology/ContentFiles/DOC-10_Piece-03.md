# DOC-10: Closed-Loop Scrubbing Thermodynamics
## Document 10 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 8301-8400 | Piece 3 of 9 | ~100 Lines

---

#### 10.3 Soda Lime Reaction Thermodynamics

**10.3.1 Composition & Reaction Mechanism**

**Soda Lime Composition (Typical):**
- **Calcium Hydroxide:** Ca(OH)₂ — 75–80% (active)
- **Sodium Hydroxide:** NaOH — 3–5% (catalyst)
- **Potassium Hydroxide:** KOH — 1–2% (catalyst)
- **Water:** H₂O — 14–18% (essential for reaction)
- **Silica/Clay binder:** 1–3% (mechanical strength)

**Overall Reaction:**
$$\text{CO}_2 + \text{Ca(OH)}_2 \rightarrow \text{CaCO}_3 + \text{H}_2\text{O}$$

**Catalytic Role of NaOH/KOH:**
1. NaOH + H₂O (surface) → Na⁺ + OH⁻ (aqueous film)
2. CO₂ + 2OH⁻ → CO₃²⁻ + H₂O (fast, in solution)
3. Ca²⁺ + CO₃²⁻ → CaCO₃↓ (precipitation)
4. NaOH regenerated (catalyst)

**Water is ESSENTIAL** — without surface moisture, reaction stops.

**10.3.2 Reaction Enthalpy**

**Standard Enthalpies:**
| Species | $\Delta H_f^\circ$ [kJ/mol] |
|---------|----------------------------|
| Ca(OH)₂(s) | -986.1 |
| CO₂(g) | -393.5 |
| CaCO₃(s) | -1,206.9 |
| H₂O(g) | -241.8 |

**Reaction:**
$$\text{CO}_2 + \text{Ca(OH)}_2 \rightarrow \text{CaCO}_3 + \text{H}_2\text{O}$$

$$\Delta H_{rxn} = [-1,206.9 + (-241.8)] - [-393.5 + (-986.1)]$$
$$= -1,448.7 - (-1,379.6) = \mathbf{-69.1 \text{ kJ/mol CO}_2}$$

**Per kg CO₂:**
$$\frac{69.1}{44} = 1.57 \text{ kJ/g} = \mathbf{1.57 \text{ MJ/kg CO}_2}$$

**Less exothermic than LiOH (2.15 MJ/kg) due to Ca(OH)₂ vs LiOH formation energies.**

**10.3.3 Heat Generation Rate**

**At Heavy EVA (188 g/hr CO₂):**
$$\dot{Q}_{rxn} = 188 \times 1.57 = 295 \text{ kJ/hr} = \mathbf{82 \text{ W}}$$

**At Rest (49 g/hr):**
$$\dot{Q}_{rxn} = 49 \times 1.57 = 77 \text{ kJ/hr} = \mathbf{21 \text{ W}}$$

**Soda lime generates ~30% LESS heat than LiOH per kg CO₂.**

**10.3.4 Soda Lime Canister Design (Hyperbaric Chambers, Submarines)**

**Typical Canister (Submarine/Chamber):**
- **Mass:** 20–50 kg (vs. 2 kg for EVA)
- **Dimensions:** 300 mm dia × 500 mm length
- **Flow:** Axial (top to bottom)
- **Capacity:** 24–72 hr at 100-person load

**Temperature Profile (Axial Flow):**
- Inlet: 22°C
- Reaction zone: **45–65°C** (exothermic peak)
- Outlet: 35–40°C (heat recovery)

**Hot Spot Management:**
- **Thermocouples** at 3 axial positions
- **Over-temp alarm** at 70°C (degradation threshold)
- **Cooling jacket** (water-cooled) for high-load chambers

**10.3.5 Moisture Dependence — The Critical Factor**

**Reaction Rate vs. Relative Humidity:**
| RH [%] | Reaction Rate | Capacity Utilization |
|--------|---------------|---------------------|
| **< 10%** | **Negligible** | < 5% |
| **20–40%** | Slow | 40–60% |
| **50–70%** | **Optimal** | 80–95% |
| **> 80%** | Flooding (pore blockage) | Reduced |

**Minimum Moisture for Reaction:**
$$\text{H}_2\text{O} \geq 0.5 \text{ mol per mol Ca(OH)}_2 \quad \text{(monolayer coverage)}$$

**In Dry Gas Streams (e.g., space suit pre-breathe):**
- Soda lime **fails** without humidification
- **LiOH preferred** for dry environments (generates own water)

**10.3.6 Soda Lime vs. LiOH — Comparative Summary**

| Parameter | **LiOH** | **Soda Lime** |
|-----------|----------|---------------|
| **CO₂ Capacity (practical)** | 0.7 g/g | 0.23 g/g |
| **Heat per kg CO₂** | 2.15 MJ | 1.57 MJ |
| **Water Required** | **Produces water** | **Consumes water** |
| **Dry Gas Performance** | **Excellent** | **Fails** |
| **Humid Gas Performance** | Good | **Excellent** |
| **Cost per kg** | $50–100 | $10–20 |
| **Dust Generation** | Low | Moderate |
| **Regeneration** | Possible (800°C) | **Not practical** |
| **Primary Use** | **Space suits, dry cabins** | **Submarines, chambers, humid** |

**10.3.7 Soda Lime in Hyperbaric Chambers (Saturation Diving)**

**Chamber Scrubber System:**
- **Redundant canisters** (2×, duty/standby)
- **Forced circulation** (1000–2000 L/min)
- **Water-cooled canisters** (continuous heat removal)
- **CO₂ monitor** (NDIR) at inlet/outlet
- **Auto-switch** at breakthrough (outlet > 0.5 kPa)

**Capacity Planning (Saturation, 12 divers, 30 days):**
- CO₂ production: 12 × 0.2 L/min × 1440 min/day = 3,456 L/day
- 30 days: 103,680 L = 4,630 mol = 204 kg CO₂
- Soda lime required (0.23 g/g): **887 kg**
- **Canister size:** 2 × 500 kg (rotate every 12 hr)

---

*End of Piece 3 — DOC-10 Lines 8301-8400*
*Next: Piece 4 — Section 10.4 Advanced Scrubbing: MOFs, Electrochemical, Swing-Bed*