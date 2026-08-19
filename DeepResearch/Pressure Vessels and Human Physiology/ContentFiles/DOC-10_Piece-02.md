# DOC-10: Closed-Loop Scrubbing Thermodynamics
## Document 10 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 8201-8300 | Piece 2 of 9 | ~100 Lines

---

#### 10.2 Lithium Hydroxide (LiOH) Reaction Thermodynamics

**10.2.1 Reaction Stoichiometry & Enthalpy**

**Primary Reaction:**
$$2 \text{LiOH}_{(s)} + \text{CO}_{2(g)} \rightarrow \text{Li}_2\text{CO}_{3(s)} + \text{H}_2\text{O}_{(g)}$$

**Standard Enthalpies of Formation (298 K):**
| Species | $\Delta H_f^\circ$ [kJ/mol] |
|---------|----------------------------|
| LiOH(s) | -484.9 |
| CO₂(g) | -393.5 |
| Li₂CO₃(s) | -1,216.0 |
| H₂O(g) | -241.8 |

**Reaction Enthalpy:**
$$\Delta H_{rxn} = [\Delta H_f(\text{Li}_2\text{CO}_3) + \Delta H_f(\text{H}_2\text{O})] - [2\Delta H_f(\text{LiOH}) + \Delta H_f(\text{CO}_2)]$$
$$= [-1,216.0 + (-241.8)] - [2(-484.9) + (-393.5)]$$
$$= -1,457.8 - (-1,363.3) = \mathbf{-94.5 \text{ kJ/mol CO}_2}$$

**Exothermic: 94.5 kJ released per mole CO₂ absorbed.**

**Per kg CO₂:**
$$\frac{94.5 \text{ kJ/mol}}{44 \text{ g/mol}} = 2.15 \text{ kJ/g} = \mathbf{2.15 \text{ MJ/kg CO}_2}$$

**10.2.2 Heat Generation Rate**

**At Heavy EVA (188 g/hr CO₂):**
$$\dot{Q}_{rxn} = 188 \text{ g/hr} \times 2.15 \text{ kJ/g} = 404 \text{ kJ/hr} = \mathbf{112 \text{ W}}$$

**At Rest (49 g/hr CO₂):**
$$\dot{Q}_{rxn} = 49 \times 2.15 = 105 \text{ kJ/hr} = \mathbf{29 \text{ W}}$$

**Total Thermal Load on Suit (Heavy EVA):**
| Source | Power [W] |
|--------|-----------|
| **Metabolic** | 500 |
| **LiOH Reaction** | 112 |
| **Fan/Pump** | 50 |
| **Electronics** | 30 |
| **TOTAL** | **692 W** |

**LCVG Capacity (ISS EMU):** 500–700 W → **marginal at heavy EVA with LiOH heat!**

**10.2.3 Temperature Rise in Canister**

**Adiabatic Temperature Rise (no cooling):**
$$\Delta T = \frac{\dot{Q}_{rxn}}{\dot{m}_{gas} c_{p,gas}}$$

Gas flow: 170 L/min = 0.0078 kg/min (air at STP)
$c_p \approx 1.0 \text{ kJ/kg·K}$

$$\Delta T = \frac{112 \text{ W}}{0.0078/60 \times 1.0} = \frac{112}{0.00013} = 861 \text{ K} \quad \text{(impossible — heat transfers to canister)}$$

**Actual Canister Temperature (with thermal mass):**
- LiOH mass: 2.15 kg
- Specific heat: 1.5 kJ/kg·K
- Canister (Al): 0.5 kg, $c_p = 0.9$

**Total thermal mass:** $2.15 \times 1.5 + 0.5 \times 0.9 = 3.68 \text{ kJ/K}$

**Temperature rise over 8 hr (if insulated):**
$$\Delta T = \frac{112 \times 3600 \times 8}{3.68 \times 1000} = 874 \text{ K} \quad \text{(still impossible)}$$

**REALITY:** Heat is **continuously removed** by gas flow and canister conduction to suit.

**10.2.4 Canister Thermal Design (ISS EMU LiOH Canister)**

**Geometry:** Cylindrical, 150 mm dia × 200 mm length
**LiOH Fill:** 2.15 kg (packed)
**Gas Path:** Radial flow (outside → center)
**Cooling:** Gas convection + conduction to suit pressure garment

**Heat Transfer Analysis:**
$$\dot{Q} = h A \Delta T_{lm}$$

Gas side: $h \approx 50 \text{ W/m}^2\text{K}$ (forced convection)
Area: $A = \pi \times 0.15 \times 0.2 = 0.094 \text{ m}^2$

$$\Delta T_{gas-canister} = \frac{112}{50 \times 0.094} = 24 \text{ K}$$

**Canister outer surface:** ~40°C at heavy EVA (inlet gas at 10°C, outlet at 35°C)

**10.2.5 LiOH Canister Configuration (ISS EMU)**

**Dual Canister System (Redundancy + Continuous Operation):**
- **Primary:** 2.15 kg LiOH (8-hr capacity at heavy work)
- **Secondary:** 2.15 kg LiOH (backup / swap)
- **Selector Valve:** Diverter plate (manual or motorized)

**Canister Internals:**
- **Screen retainers** (inlet/outlet) — prevent dust
- **Thermal foam liner** — insulate from suit
- **Temperature sensor** (thermistor) at outlet
- **Pressure drop:** < 500 Pa at 170 L/min

**Replacement Protocol (EVA):**
1. **Pre-EVA:** Both canisters fresh
2. **4 hr mark:** Swap to secondary (if primary saturated)
3. **Post-EVA:** Regenerate (bake at 200°C) or discard

**LiOH Regeneration (Ground):**
$$\text{Li}_2\text{CO}_3 \xrightarrow{800^\circ\text{C}} \text{Li}_2\text{O} + \text{CO}_2$$
$$\text{Li}_2\text{O} + \text{H}_2\text{O} \rightarrow 2\text{LiOH}$$
**Not done in-flight** — canisters are disposable.

---

*End of Piece 2 — DOC-10 Lines 8201-8300*
*Next: Piece 3 — Section 10.3 Soda Lime Reaction Thermodynamics*