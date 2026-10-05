# DOC-10: Closed-Loop Scrubbing Thermodynamics
## Document 10 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 8701-8800 | Piece 7 of 9 | ~100 Lines

---

#### 10.7 Numerical Examples: Chamber, EMU, Habitat

**10.7.1 Hyperbaric Medical Chamber (6-person, 2-hr treatment)**

**Conditions:**
- Pressure: 280 kPa (2.8 ATA), 100% O₂
- Occupants: 6 patients + 1 attendant = 7 persons
- Activity: Rest (metabolic)
- Duration: 120 min

**CO₂ Generation:**
$$\dot{V}CO_2 = 7 \times 0.28 \text{ L/min} = 1.96 \text{ L/min}$$
Total: $1.96 \times 120 = 235 \text{ L} = 10.5 \text{ mol} = \mathbf{462 \text{ g CO}_2}$

**Soda Lime Required (0.23 g/g practical):**
$$462 / 0.23 = \mathbf{2.0 \text{ kg}}$$

**Canister Design:**
- 2 × 1.5 kg canisters (duty/standby)
- Axial flow, water-cooled jacket
- Flow: 200 L/min (chamber blower)

**Heat Generation:**
$$\dot{Q} = 462 \text{ g} / 7200 \text{ s} \times 1.57 \text{ kJ/g} = 101 \text{ W}$$
**Water cooling:** 0.5 L/min, ΔT = 3°C → easily removed

**O₂ Consumption:**
$$\dot{V}O_2 = 7 \times 0.35 = 2.45 \text{ L/min}$$
Total: 17,640 L = 787 mol = **25.2 kg O₂**
**Supply:** Liquid O₂ tank (30 L) + vaporizer

**10.7.2 ISS US Segment (CDRA) — Continuous 6-Person**

**CDRA (Carbon Dioxide Removal Assembly):**
- **Sorbent:** Zeolite 5A (molecular sieve)
- **Beds:** 4 × 8 kg = 32 kg total
- **Cycle:** 240 min (2 adsorb / 2 desorb)
- **Flow:** 500 L/min (cabin air)
- **CO₂ Removal:** 4.5 persons continuous (rated)

**Zeolite Adsorption (5A, at 0.4 kPa CO₂, 22°C):**
- Capacity: 1.8 mmol/g = 0.079 g CO₂/g zeolite
- Working capacity (swing): ~1.2 mmol/g = 0.053 g/g
- Per bed: 8 kg × 0.053 = 424 g CO₂ per cycle
- Cycle time: 120 min adsorb → **2.1 g/min = 126 g/hr**

**6 Persons at Rest (49 g/hr each):**
Total CO₂: 294 g/hr
CDRA capacity: 126 g/hr (4-bed, 50% duty) → **MARGINAL for 6 persons**

**ISS Operational Solution:**
- **CDRA + Russian Vozdukh** (2 systems)
- **Lithium Hydroxide canisters** (backup/emergency)
- **Cabin CO₂ setpoint:** 3.0 mmHg (0.4 kPa) — higher than ideal

**CDRA Power & Thermal:**
- **Heater (desorb):** 400 W × 2 beds = 800 W peak
- **Blower:** 150 W
- **Cooling:** 200 W (cabin air cooling during desorb)
- **Average power:** 350 W

**10.7.3 Lunar Gateway Habitat (4-person, 30-day)**

**Design Requirements:**
- Continuous operation, no resupply
- Regenerable system (no consumables)
- Integrate with thermal bus

**Selected Architecture: SASB + ECCR Hybrid**

**SASB (Solid Amine Swing-Bed):**
- **Sorbent:** PEI on silica, 15 kg total (4 beds × 3.75 kg)
- **Capacity:** 3.5 mmol/g = 0.154 g CO₂/g
- Working capacity (swing): 2.5 mmol/g = 0.11 g/g
- Per bed: 3.75 kg × 0.11 = 412 g CO₂/cycle
- Cycle: 60 min (2 adsorb / 2 desorb)
- **Rate:** 412 g / 30 min = 824 g/hr per bed pair
- **2 pairs continuous:** 824 g/hr → **Supports 16 persons at rest!**

**ECCR (Electrochemical):**
- **Capacity:** 1 person continuous (backup/trim)
- **Power:** 30 W
- **O₂ generation:** 0.84 kg/day (matches 1 person)

**Thermal Integration:**
- **Desorption heat:** 800 W (2 beds × 400 W)
- **Heat pump COP 4.0:** 200 W electrical → 800 W cooling
- **Waste heat → habitat thermal bus** (pre-heat water)

**Total System Mass:**
- SASB: 25 kg (sorbent + beds + valves + heaters)
- ECCR: 4 kg
- Controls/Plumbing: 5 kg
- **Total: 35 kg** (vs. 30 days × 4 persons × 2.2 kg LiOH = 264 kg consumable)

**Power:**
- SASB heaters (avg): 150 W
- ECCR: 30 W
- Vacuum pump: 50 W
- Controls: 20 W
- **Total avg: 250 W**

**30-day Energy:** 180 kWh (from solar array)

---

*End of Piece 7 — DOC-10 Lines 8701-8800*
*Next: Piece 8 — Section 10.8 System-Level Trade Analysis*