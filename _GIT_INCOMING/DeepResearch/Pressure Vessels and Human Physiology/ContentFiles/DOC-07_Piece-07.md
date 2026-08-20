# DOC-07: EMU Architecture — Anthropomorphic Pressure Vessels
## Document 7 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 6001-6100 | Piece 7 of 9 | ~100 Lines

---

#### 7.7 PLSS Integration & Structural Loads

**7.7.1 PLSS — Primary Life Support Subsystem**

**Shuttle/ISS EMU PLSS (Backpack):**
| Subsystem | Mass [kg] | Volume [L] | Power [W] |
|-----------|-----------|------------|-----------|
| **O₂ Supply** (2 tanks, 5.8 MPa) | 4.5 | 2.5 | — |
| **CO₂ Removal** (LiOH canister × 2) | 3.2 | 4.0 | — |
| **Contaminant Control** (Charcoal) | 0.8 | 1.0 | — |
| **Thermal Control** (Sublimator) | 5.0 | 3.0 | 50 (pump) |
| **Electrical** (Battery, 120 Wh) | 4.0 | 1.5 | — |
| **Communications** (Radio, antennas) | 1.5 | 0.5 | 15 |
| **Avionics** (C&W, displays) | 2.0 | 1.0 | 10 |
| **Structure/Insulation** | 8.0 | — | — |
| **TOTAL PLSS** | **29 kg** | **13.5 L** | **75 W** |

**7.7.2 PLSS Mounting — Structural Interface**

**Mount Points (4× on HUT):**
- **Upper:** 2× shoulder yoke (forward/aft)
- **Lower:** 2× waist bearing housing (left/right)

**Load Path:**
PLSS weight + inertia → Mount brackets → HUT → Waist bearing → Leg restraint → Boots → **Worksites (handrails, foot restraints)**

**On-Orbit (Microgravity):** Weight = 0, but **inertia remains**.
**EVA Translation:** Astronaut pushes PLSS mass (130 kg suited) → reaction forces at mounts.

**7.7.3 PLSS-Induced Loads on EMU Structure**

**Static (1g, Ground Test):**
- PLSS weight: 29 kg × 9.81 = 284 N
- Distributed: ~71 N per mount (4×)
- HUT bending stress: ~15 MPa (SF > 10)

**Dynamic (EVA Translation):**
- Astronaut + EMU + PLSS = 130 kg
- Acceleration: 0.5 m/s² (typical translation)
- Force: 65 N
- **Reaction at waist bearing:** 65 N × 0.5 m lever arm = 32.5 N·m torque

**Impact (Unplanned Contact):**
- 1 m/s impact with handrail
- Deceleration: 10g over 0.05 m
- Force: 130 kg × 10 × 9.81 = 12,753 N
- **Distributed through HUT to waist/shoulder mounts**

**7.7.4 Sublimator — Thermal Rejection & Structural Interface**

**Sublimator Principle:**
- Water feed → porous plate (sintered nickel, 10 µm pores)
- Vacuum exposure → ice forms in pores → sublimates
- Heat rejection: $h_{fg} = 2,830$ kJ/kg at 0°C
- **Capacity:** 2 MJ (peak 500 W for 40 min) / 8 MJ (total)

**Water Consumption:**
$$\dot{m} = \frac{\dot{Q}}{h_{fg}} = \frac{500}{2.83 \times 10^6} = 0.177 \text{ g/s} = 637 \text{ g/hr}$$
**8-hr EVA:** 5.1 kg water (carried in PLSS bladder)

**Structural Loads:**
- Water pressure: 100 kPa (feed pressure)
- Sublimator mass: 5 kg (mounted on PLSS frame)
- **Vibration:** Pump-induced (50 Hz, 0.5 g) → isolated by mounts

**7.7.5 Battery — Energy Storage & Safety**

**Battery (ISS EMU):**
- **Chemistry:** Silver-Zinc (Ag-Zn) — high energy density, non-rechargeable
- **Voltage:** 16.8 V nominal (14 cells)
- **Capacity:** 120 Wh (7.1 Ah)
- **Mass:** 4.0 kg
- **Life:** 1 EVA (single discharge) + 1 contingency

**Safety (Critical for PVHO):**
- **Venting:** Pressure relief at 35 kPa (prevents rupture)
- **Thermal Runaway:** Impossible (Ag-Zn chemistry)
- **Short Circuit:** Fuses + current limiters
- **Mounting:** 4× bolts to PLSS frame, vibration isolated

**xEMU Battery (Rechargeable):**
- **Chemistry:** Li-ion (NASA-specific, qualified)
- **Capacity:** 200 Wh
- **Cycles:** 50 EVAs (recharge on ISS)
- **BMS:** Cell balancing, thermal monitoring, fault isolation

**7.7.6 Center of Gravity (CG) Management**

**Suited Astronaut CG (with PLSS):**
- **Without PLSS:** Near navel (body CG)
- **With PLSS:** Shifted **posterior + superior** by ~50 mm

**CG Location (xEMU, 95th %ile male):**
- $x_{CG} = +30$ mm (forward of waist)
- $y_{CG} = +50$ mm (above waist)
- $z_{CG} = 0$ (midline)

**Stability Requirement:** CG within **base of support** (foot restraint) during all tasks.
**Foot Restraint Design:** Accommodates CG shift ±100 mm in all directions.

**7.7.7 SAFER — Simplified Aid for EVA Rescue**

**SAFER (Backpack-Mounted):**
- **Propellant:** N₂ (24 g, 350 bar)
- **Thrusters:** 24 × 0.8 N (cold gas)
- **Delta-V:** 3 m/s (sufficient for untethered return)
- **Mass:** 1.4 kg (mounted on PLSS lower)
- **Control:** Hand controller (displacement joystick)

**Structural Impact:**
- Adds 1.4 kg at PLSS bottom
- CG shift: -20 mm (lower)
- **Mount loads:** Additional 14 N static, 50 N dynamic

---

*End of Piece 7 — DOC-07 Lines 6001-6100*
*Next: Piece 8 — Section 7.8 Comparative Analysis: NASA EMU vs. Orlan vs. xEMU vs. Feitian*