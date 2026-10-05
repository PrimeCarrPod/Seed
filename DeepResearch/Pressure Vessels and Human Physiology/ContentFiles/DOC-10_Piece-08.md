# DOC-10: Closed-Loop Scrubbing Thermodynamics
## Document 10 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 8801-8900 | Piece 8 of 9 | ~100 Lines

---

#### 10.8 System-Level Trade Analysis

**10.8.1 Equivalent System Mass (ESM) — NASA Standard Metric**

**ESM Formula:**
$$\text{ESM} = M + \frac{V}{V_{eq}} + \frac{P}{P_{eq}} \cdot t_{mission} + \frac{C}{C_{eq}} \cdot t_{mission} + \frac{CT}{CT_{eq}}$$

Where:
- $M$ = hardware mass [kg]
- $V$ = volume [m³], $V_{eq} = 0.1 \text{ m}^3/\text{kg}$ (volume penalty)
- $P$ = power [kW], $P_{eq} = 0.05 \text{ kW/kg}$ (power penalty)
- $C$ = cooling [kW], $C_{eq} = 0.05 \text{ kW/kg}$ (cooling penalty)
- $CT$ = crew time [hr], $CT_{eq} = 100 \text{ hr/kg}$ (crew time penalty)
- $t_{mission}$ = mission duration [days]

**ESM Comparison (4-person, 30-day mission):**

| System | M [kg] | V [m³] | P [kW] | C [kW] | CT [hr] | **ESM [kg]** |
|--------|--------|--------|--------|--------|---------|--------------|
| **LiOH (consumable)** | 264 | 0.5 | 0 | 0.1 | 120 | **312** |
| **Soda Lime** | 780 | 1.2 | 0.15 | 0.1 | 240 | **890** |
| **Zeolite CDRA** | 50 | 0.3 | 0.35 | 0.2 | 40 | **95** |
| **Amine SASB** | 25 | 0.2 | 0.25 | 0.15 | 20 | **52** |
| **MOF TSA** | 18 | 0.15 | 0.15 | 0.1 | 10 | **32** |
| **ECCR** | 4 | 0.05 | 0.03 | 0.01 | 5 | **8** |
| **SASB + ECCR** | 29 | 0.25 | 0.28 | 0.16 | 25 | **58** |

**Equivalency Factors (Lunar Surface):**
- $V_{eq} = 0.1 \text{ m}^3/\text{kg}$ (pressurized volume premium)
- $P_{eq} = 0.05 \text{ kW/kg}$ (solar array + battery)
- $C_{eq} = 0.05 \text{ kW/kg}$ (radiator + heat pump)
- $CT_{eq} = 100 \text{ hr/kg}$ (crew time = science loss)

**Winner for 30-day: SASB + ECCR (ESM = 58 kg)**
**Winner for 500-day (Mars): MOF TSA or ECCR (lowest logistics)**

**10.8.2 Reliability & Redundancy — Failure Modes**

| System | Failure Mode | Probability (per mission) | Consequence | Mitigation |
|--------|--------------|---------------------------|-------------|------------|
| **LiOH** | Canister exhaustion | 0.01 (if miscalculated) | CO₂ buildup | Dual canister, pressure monitor |
| **Soda Lime** | Dryout (no humidity) | 0.05 | Scrubber failure | Humidifier, RH monitor |
| **Zeolite** | Heater failure | 0.02 | No desorption | Redundant heaters, 4-bed |
| **Amine SASB** | Amine leaching | 0.01/1000 cycles | Capacity loss | Periodic assay, spare beds |
| **MOF** | Hydrothermal degradation | 0.001/hr | Capacity loss | Dry air, spare cartridges |
| **ECCR** | Membrane fouling | 0.005/hr | Current drop | Periodic flush, redundant stack |
| **All** | Fan/blower failure | 0.01 | No flow | Redundant blowers |

**Redundancy Strategy by Mission:**
- **EVA (8 hr):** Single string acceptable (abort capability)
- **Habitat (30 day):** Dual string (1 operating + 1 standby)
- **Mars Transit (500 day):** Triple string (2 operating + 1 spare)

**10.8.3 Logistics & Resupply — The Long-Duration Driver**

**Consumable Mass per Person-Day:**
| System | CO₂ Scrubber | Trace Control | O₂ Supply | Water | **Total** |
|--------|--------------|---------------|-----------|-------|-----------|
| **LiOH** | 2.2 kg | 0.1 kg | 0.84 kg | — | **3.1 kg** |
| **Soda Lime** | 6.5 kg | 0.1 kg | 0.84 kg | 0.5 kg | **7.9 kg** |
| **Zeolite CDRA** | 0 | 0.01 kg | 0.84 kg | — | **0.85 kg** |
| **SASB** | 0 | 0.01 kg | 0.84 kg | — | **0.85 kg** |
| **ECCR** | 0 | 0.01 kg | **0** (generates) | — | **0.01 kg** |

**Mars Mission (500 days, 4 crew):**
- **LiOH:** 4 × 500 × 3.1 = **6,200 kg** (impossible)
- **CDRA/SASB:** 4 × 500 × 0.85 = **1,700 kg** (feasible)
- **ECCR + SASB:** 4 × 500 × 0.02 = **40 kg** (transformational)

**Logistics Mass Fraction:**
- **ISS (resupply):** ~50% of upmass = life support consumables
- **Mars (no resupply):** **Zero consumables mandatory** → Regenerable only

**10.8.4 Technology Readiness & Development Path**

| Technology | TRL (2024) | Next Milestone | Target Mission |
|------------|------------|----------------|----------------|
| **LiOH** | 9 | — | Current EVA |
| **Soda Lime** | 9 | — | Current chambers |
| **Zeolite CDRA** | 9 | — | ISS |
| **Amine SASB** | 7 | Ground 10,000-hr test (2025) | Gateway (2028) |
| **MOF TSA** | 5 | Subscale vacuum test (2026) | Lunar Base (2032) |
| **ECCR** | 5 | Integrated PLSS test (2026) | xPLSS (2029) |
| **PCO** | 4 | Flight demo (2027) | TCCS replacement (2030) |

**Investment Priority (NASA):**
1. **SASB** (near-term, Gateway critical)
2. **ECCR** (transformational, O₂ generation)
3. **PCO** (TCCS consolidation)
4. **MOF** (long-term, lunar base)

---

*End of Piece 8 — DOC-10 Lines 8801-8900*
*Next: Piece 9 — References, Cross-Links, Validation & Document Closure*