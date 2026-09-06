# DOC-10: Closed-Loop Scrubbing Thermodynamics
## Document 10 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 8601-8700 | Piece 6 of 9 | ~100 Lines

---

#### 10.6 Thermal Integration: LCVG, Sublimator, Flash Evaporator

**10.6.1 Heat Load Summary (EMU at Heavy EVA)**

| Source | Heat [W] | Notes |
|--------|----------|-------|
| **Metabolic** | 500 | 1.6 L/min CO₂ |
| **LiOH Reaction** | 112 | 188 g/hr CO₂ |
| **Fan (circulation)** | 50 | 170 L/min @ 500 Pa |
| **Pump (LCVG)** | 30 | 0.5 L/min @ 200 kPa |
| **Electronics/Avionics** | 40 | Displays, comm, sensors |
| **Solar Absorption (sun)** | 200 | 0.3 α, 2 m², 1360 W/m² |
| **TOTAL** | **932 W** | **Peak reject required** |

**10.6.2 Liquid Cooling & Ventilation Garment (LCVG)**

**Coolant Loop (Water-Glycol 60/40):**
- **Flow Rate:** 0.5–1.0 L/min (variable speed pump)
- **Inlet Temp:** 4–10°C (set by sublimator)
- **Outlet Temp:** 15–25°C (depends on metabolic load)
- **Tubing:** 3.2 mm OD, 1.6 mm ID, polyurethane
- **Total Length:** ~100 m (full body coverage)

**Heat Transfer (Convection Inside Tubes):**
$$\dot{Q} = \dot{m} c_p \Delta T$$

For $\dot{m} = 0.5 \text{ L/min} = 0.0083 \text{ kg/s}$, $c_p = 3.8 \text{ kJ/kg·K}$, $\Delta T = 10 \text{ K}$:
$$\dot{Q} = 0.0083 \times 3800 \times 10 = 315 \text{ W}$$

**At max flow (1.0 L/min, ΔT = 15 K):**
$$\dot{Q} = 0.0167 \times 3800 \times 15 = 952 \text{ W}$$

**LCVG Capacity: 500–1,000 W (matches EMU requirement)**

**10.6.3 Sublimator — Heat Rejection in Vacuum**

**Principle:** Water → ice in porous plate → sublimation → heat rejection
**Porous Plate:** Sintered nickel, 10 µm pores, 2 mm thick
**Feed Water:** From PLSS tank (5.1 kg capacity)

**Sublimation Physics:**
- **Triple Point:** 0.01°C, 611 Pa
- **In Vacuum:** Water freezes in pores, surface sublimates
- **Heat of Sublimation:** $h_{sub} = 2,830 \text{ kJ/kg}$ (at 0°C)

**Mass Flow for 932 W:**
$$\dot{m} = \frac{\dot{Q}}{h_{sub}} = \frac{932}{2.83 \times 10^6} = 0.00033 \text{ kg/s} = \mathbf{1.19 \text{ kg/hr}}$$

**8-hr EVA Water Consumption:** 9.5 kg (but tank only 5.1 kg!)

**RESOLUTION:** LCVG ΔT limited, not all heat through sublimator.
**Actual Sublimator Load:** ~500 W (metabolic + reaction)
**Water for 8 hr at 500 W:** 5.1 kg → **matches tank!**

**Sublimator Performance Map:**
| Heat Load [W] | Water Rate [kg/hr] | Outlet Temp [°C] | Feed Pressure [kPa] |
|---------------|-------------------|------------------|-------------------|
| 200 | 0.25 | 4 | 100 |
| 500 | 0.63 | 6 | 120 |
| 700 | 0.88 | 8 | 140 |
| **932 (peak)** | **1.19** | **10** | **160** |

**Feed Water Pressure:** Maintained by bladder tank (N₂ pressurization at 100–200 kPa)

**10.6.4 Sublimator Control (Self-Regulating)**

**Feedwater Pressure Regulator:**
- **Demand-type:** Opens when suit pressure > feed pressure
- **Ice Valve:** Sublimation cools plate → ice forms in pores → blocks flow
- **Thermal feedback:** Heat load ↑ → sublimation ↑ → ice melts → flow ↑

**No active control needed** — inherently stable!

**Startup Sequence:**
1. Open feed valve
2. Water fills plate, freezes in pores
3. Sublimation begins, heat rejection starts
4. Steady state in ~2 min

**10.6.5 Flash Evaporator (Orlan / Soyuz / Future)**

**Principle:** Water sprayed into vacuum chamber → flash evaporation
**No porous plate** — simpler, but less controllable

**Flash Evaporator Physics:**
- Water at 20°C, 200 kPa → nozzle → vacuum
- **Flash fraction:** $\frac{h_f(20°C)}{h_{fg}} = \frac{84}{2,450} = 3.4\%$
- **Most water freezes** (ice crystals)
- **Heat rejection:** Ice sublimation + vapor expansion

**Orlan Flash Evaporator:**
- **Water tank:** 6.5 kg
- **Capacity:** 7 hr EVA at 500 W
- **Control:** Active (variable nozzle, heater)
- **Complexity:** Higher than sublimator

**Comparison:**
| Parameter | **Sublimator (EMU)** | **Flash Evaporator (Orlan)** |
|-----------|---------------------|------------------------------|
| **Control** | Passive (self-regulating) | Active (valves, heaters) |
| **Reliability** | Very high (no moving parts) | Moderate (valves can stick) |
| **Water Efficiency** | High (demand-fed) | Lower (some liquid loss) |
| **Mass** | 2.5 kg | 3.2 kg |
| **Power** | 0 W | 20 W (heaters) |
| **TRL** | 9 (flight proven) | 9 (flight proven) |

**10.6.6 Future: Radiator + Heat Pump (Lunar Base, Mars)**

**Lunar Surface (Day):**
- **Radiator:** 300 K → space (3 K) → 400 W/m²
- **Area needed for 1 kW:** 2.5 m² (deployable)
- **Challenge:** Lunar dust, sun angle

**Heat Pump (Vapor Compression):**
- **COP:** 3–5 (lift 20 K)
- **Power:** 200–300 W for 1 kW cooling
- **Refrigerant:** R-134a / CO₂ (transcritical)

**Mars Transit (Microgravity):**
- **Radiator:** Body-mounted (no deploy)
- **Heat pump:** Essential (low ΔT to space)

**Integration with Scrubber Waste Heat:**
- LiOH/Soda lime heat → **pre-heat LCVG return** (reduces sublimator load)
- ECCR/MOF waste heat → **thermal bus**
- **System-level optimization** saves 10–20% total thermal load

---

*End of Piece 6 — DOC-10 Lines 8601-8700*
*Next: Piece 7 — Section 10.7 Numerical Examples: Chamber, EMU, Habitat*