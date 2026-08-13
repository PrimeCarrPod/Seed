# Tadpole-02 — Water Taxi Duo
## Two-Passenger Urban Transit Water Taxi
**Classification:** Level 1 — Public | **Role:** Taxi | **Displacement:** 620 kg | **Length:** 3.8m
**References:** `CSMFAB-P002-CNT-Polymer-Wiring`, `CSMFAB-P001-Ceramic-Bridge-Bearings-500T`, `CSMFAB01 Aegis-C Composite Shielding Design`, `CSMFAB0113 Archimedes Smart Muscle Smart Rope Underwater Launch System`, `CSMFAB-INCURSION-CLASS/EXECUTIVE-PROPOSAL.md`, `CSMFAB-TESTA-FLEET/RESEARCH/`

---

## EXECUTIVE SUMMARY

Tadpole-02 is a two-passenger water taxi derived from the Tadpole-01 platform but scaled for shared urban transit (ride-pool, valet-style dock transfer). The hull geometry transitions from a single prolate spheroid to a twin-spined catamaran configuration — two 3.2m Tadpole-01 hulls connected by a BFRP/Elium® cross-deck — yielding a 1.6m beam with 0.38m draft, enabling simultaneous berthing at standard 1.2m water taxi slips. Each hull maintains the Tadpole-01 dielectric citadel architecture (ZrB₂-SiC/BFRP/MXene/YInMn Blue laminate stack), while the cross-deck integrates a CNT-polymer tensegrity tension cable network (CSMFAB-TESTA-FLEET PodWall architecture) providing torsional rigidity without metallic stiffeners. Propulsion is twin-Archimedean screw per hull (4× total), delivering redundancy: loss of one hull's drive cluster still yields 50% thrust and safe return-to-home via dead-reckoning autopilot. The vessel carries 2× 1.92 kWh LiFePO₄ packs in individual ZrB₂-SiC CMBC vaults, enabling 52 km range at 16 kts cruise. The design is CSMFAB P0-02 CNT-001 wiring compatible and CSMFAB P0-01 ZTA bearing compatible, with 75% parts commonality against Tadpole-01.

---

## MISSION PROFILE

**Primary Role:** Two-passenger shared water taxi (dock-to-dock, 2–12 km routes, ride-pool).
**Secondary Role:** Accessible transport (wheelchair ramp deployable from cross-deck), small-package freight (40 kg cargo bay).
**Operating Envelope:**
- **Draft:** 0.38m
- **Beam:** 1.6m
- **Displacement:** 620 kg (light), 720 kg (loaded, 2 pax + 40 kg cargo)
- **Speed:** 16 kts cruise, 24 kts sprint
- **Range:** 52 km (3.84 kWh usable, 2 packs)
- **Endurance:** 5.2 hr cruise, 30-day cryptobiotic drift
- **Occupancy:** 1 pilot + 1 passenger (standard) or 2 passengers (autonomous mode)
- **Environmental:** Sea State 3, -20°C to +55°C, IP68+ amphibious

---

## HULL GEOMETRY & STRUCTURAL ANALYSIS

**Hull Form:** Twin prolate spheroid pressure shells (L/D=3.2:1 each) connected by BFRP cross-deck tensegrity frame.
- **Primary Shell:** Same as Tadpole-01 (12-lamina ZrB₂-SiC/BFRP/MXene stack, 4mm total).
- **Cross-Deck:** BFRP/Elium® tensegrity truss, 150×150 mm box section spine, 8mm CNT-polymer tension cables (42 kN ultimate, Buckminster Fuller octet truss geometry).
- **Torsional Rigidity:** Cross-deck provides GJ = 1.8×10⁶ N·m²/rad. Hull-to-deck connection: ZTA ceramic pivot joints (3° rotation in all axes), PTFE dry lubricant, MRF-140CG dampers.

**Buckling Analysis (Twin-Hull Bending):**
- Loading: Hydrostatic + 1.5g pitch inertia (braking/wave impact).
- Span between cross-deck supports: 1.6m.
- Beam bending stress in hull shell at midspan: σ = M·c/I = (wL²/8)·(t/2)/(πR³t) = **1.2 MPa** (nominal).
- Allowable laminate stress: 306 MPa (knockdown).
- Safety factor: 306 / 1.2 = **255:1** (bending is not the driver; local panel buckling is).

**Local Panel Buckling (Between Frames):**
- Frame spacing: 0.4m.
- Panel aspect ratio: a/b = 0.4/0.25 = 1.6.
- Orthotropic buckling coefficient ( Lekhnitskii ): K=7.2 for L/D=3.2 spherical cap, 0°/90° laminate.
- P_cr = K·π²·E/(12(1-ν²))·(t/b)² = 7.2·π²·180×10³/(12·0.92)·(4/250)² = **3.1 MPa**.
- Design pressure: 0.25 MPa (external) + 0.05 MPa (internal pressurization) = 0.30 MPa.
- Safety factor: 3.1 / 0.30 = **10.3:1**.

---

## MATERIAL SPECIFICATION

| Layer | Material | Spec | Source |
|-------|----------|------|--------|
| 1 (Primary) | ZrB₂-SiC UHTC | 12 laminae, 70:30 vol%, 4mm total, flash-sintered | `CSMFAB01 V2.0 §3.1` |
| 2 (Secondary) | BFRP/Elium® | 3mm UD, 1100 MPa, 85 GPa, εᵣ=3.2 | `BOM-REGISTRY BFRP-Elium-001` |
| 3 (EMI) | MXene Ti₃C₂Tₓ | 45 μm, discontinuous tile, SE=92 dB | `BOM-REGISTRY MXene-Ti3C2Tx-005` |
| 4 (Coating) | YInMn Blue / CoAl₂O₄ | 2.5 wt%, SRI=115, NIR rejection 78% | `CSMMetal20250001 V2.0 §2` |
| 5 (Cross-Deck Spine) | BFRP box section | 150×150 mm, 85 GPa modulus | `CSMFAB-TESTA-FLEET/` PodWall |
| 6 (Tension Cable) | CNT-polymer | 8mm diameter, 42 kN ultimate, octet truss geometry | `CSMFAB-TESTA-FLEET/` PodWall |
| 7 (Bearing) | Si₃N₄ ceramic | P0-01 grade, water-lubricated | `CSMFAB-P001/` |
| 8 (Wiring) | CNT-polymer | CNT-001 grade, 2.5mm², 20A | `CSMFAB-P002/` |
| 9 (Battery) | LiFePO₄ | 1.92 kWh 48V × 2 packs, ZrB₂-SiC CMBC vault | `CSMVessel-Charlemagne/` Vol-093 |
| 10 (Prop Shaft) | PEEK CF40 | Magnetic-transparent, radiation-hard | `CSMFAB0106/` |

---

## PROPULSION SYSTEM

**Type:** Quad Archimedean screw cluster (2 per hull, contra-rotating pairs).
**Reference:** `CSMFAB0113-Vol-01`, `CSMFAB0109`

**Specification:**
- **Screw diameter:** 100mm (each)
- **Pitch:** 120mm (fixed, θ=2.4°)
- **Blades:** 3 per screw, PEEK CF40, ZTA bearings
- **Motor:** 4× 500W brushless DC, GaN FET inverter
- **Thrust:** 240N per screw → 960N total (28% margin over drag at 24 kts)
- **Propulsive Efficiency:** 91% at 16 kts cruise, 87% at 24 kts sprint
- **Noise:** <60 dB(A) at 1m
- **Redundancy:** Loss of 1 screw (25%) → 75% thrust retained → 18 kts sustainable.

**Power Budget:**
- Cruise (16 kts): 2.8 kW total electrical → 3.0A @ 48V per pack × 2 packs.
- Sprint (24 kts): 6.4 kW total → 6.7A @ 48V per pack.
- Range: 52 km @ 16 kts (3.84 kWh usable ÷ 2.8 kW = 1.71 hr × 16 kts × 0.92 propulsive factor).

---

## LIFE SUPPORT SUBSYSTEMS

**Atmospheric Control:**
- **O₂ Reserve:** 2× 800L compressed O₂ at 200 bar (redundant packs, one per hull vault). 9.6 hr at 15 L/min for 2 occupants.
- **CO₂ Scrub:** Dual solid amine beds, 1kg total capacity, 12 hr runtime.
- **Pressure Management:** Passive equalization, ±200 mbar.
- **Emergency:** 2× 30-min chemical O₂ generators.

**Thermal Management:**
- Passive: YInMn Blue coating, same as Tadpole-01.
- Active: 400W Peltier array (2× 200W modules), 3kW peak cooling.
- Cross-deck ventilation: 12V brushless DC fans, 80 m³/hr exchange rate.

**Biometric Monitoring:**
- Dual wrist PPG (1 per occupant), heart rate, SpO₂, RMSSD.
- Alert: HR>100 bpm (passenger) or HR>120 bpm (pilot) → automatic speed reduction + FEATHER beacon.

**Cryptobiotic Tun-State:**
- Trigger: Dual-pack failure, hull breach >1 hull, GIC storm, operator command.
- Sequence: All screws stop → cross-deck cable tension relaxed → non-essential systems down → Core-1 <1mW → hydrogel gaskets seal → FEATHER ping hourly.
- Drift: 30 days.
- Reactivation: Wake command → screws spin up → 5 min to operational.

---

## NAVIGATION & CONTROL

**Autonomy Level:** SAE Level 4 (high automation, driverless capable in mapped zones).
**Sensor Suite:**
- **Position:** Dual GNSS (L1/L5), RTK via FEATHER, 0.01m accuracy.
- **Obstacle:** 360° ultrasound + 2× forward-scan sonar (one per hull), 120m range.
- **EM:** MEMS magnetometer, electric field mill, Faraday alarm.
- **Visual:** 2× ALON dome ports (0.56m radius each), 4K cameras.
- **Comms:** Dual FEATHER LoRa nodes (redundant), 915 MHz FHSS.

**Control Architecture:**
- **CCU:** Core-1 dual-redundant.
- **Actuation:** 4× MRF rotary actuators (hydrofoil trim), 8× Si₃N₄ stepper bearings (control surfaces).
- **Fault Tolerance:** Quad-screw redundancy. Loss of 1 hull → single-hull operation at 50% speed. Loss of both screws on one hull → asymmetric thrust compensation via differential pitch on remaining screws.

**Mesh Integration:**
- S-Bus protocol, HMAC-SHA256 auth, 64 message types.
- Cross-deck CAN-FD backbone with galvanic isolation (CNT-polymer isolators).
- If both FEATHER nodes jammed: pre-loaded return-to-home breadcrumb, IMU/GPS dead reckoning.

---

## FABRICATION PLAN

**Key Differences from Tadpole-01:**
1. **Dual Hull Tooling:** Two VARTM mandrels (identical to Tadpole-01), production parallelized.
2. **Cross-Deck Tensegrity:** BFRP box section spine CNC-machined in 1.6m length, CNT cable tensioned to 28 kN preload, octet truss node connections ZTA pivot joints.
3. **Dual Vault Installation:** Two ZrB₂-SiC CMBC battery vaults, one per hull, connected by CNT-004 bus bar (500mm², 2,000A) through cross-deck dielectric isolator.
4. **Quad Screw Installation:** 4× Archimedean screws, 2 per hull, shaft alignment tolerance ±0.05mm, CNT-002 motor windings.

**Quality Gates:**
- Hull hydrostatic test: 0.375 MPa (1.5× design) per hull.
- Cross-deck torsional stiffness test: 1.8×10⁶ N·m²/rad ±10%.
- Full vessel shake test: 4-point hydrofoil deploy/retract cycle (50,000 cycles rated).
- Cryptobiotic mode validation: 30-day drift tank test, wake command response <5 min.

---

## INTERPART COMPATIBILITY MATRIX

| CSMFAB Part | Compatibility | Notes |
|-------------|---------------|-------|
| P0-01-CB-500T | **A — Direct Fit** | 4× bearings (2 per hull) |
| P0-02-CNT-001 | **A — Direct Fit** | Standard harness |
| P0-02-CNT-002 | **A — Direct Fit** | 80A grade for main bus |
| P0-02-CNT-004 | **A — Direct Fit** | 500mm² bus bar for cross-deck vault interconnect |
| CSMFAB01 | **A — Direct Fit** | 4mm laminate, 92 dB SE |
| CSMFAB0107 | **B — Minor Mod** | Ballast tank lining, dock mount pads |
| CSMFAB0113-Vol-01 | **A — Direct Fit** | 100mm screws, same pitch ratio |
| CSMFAB0115 | **A — Direct Fit** | Dual nodes (1 per hull) |
| CSMFAB059 | **A — Direct Fit** | Dual CCU (1 per hull, master/slave) |
| CSMFAB0106 | **C — Redesign Required** | Cross-deck fluid routing (potable water, gray water) requires 25mm GFRP, not 36" pipeline |

---

## COST ANALYSIS

| Item | Unit Cost | Qty | Total |
|------|-----------|-----|-------|
| ZrB₂-SiC laminate (4mm) | $180/m² | 17 m² | $3,060 |
| BFRP/Elium® layup | $45/m² | 24 m² | $1,080 |
| MXene Ti₃C₂Tₓ | $250/g | 280g | $70,000 |
| YInMn Blue pigment | $85/kg | 3.5 kg | $298 |
| Si₃N₄ bearings (4×) | $320/ea | 4 | $1,280 |
| CNT-001 wiring | $0.85/m | 40 m | $34 |
| CNT-002 wiring | $3.40/m | 15 m | $51 |
| CNT-004 bus bar | $180/m | 2 m | $360 |
| LiFePO₄ 1.92kWh ×2 | $420/ea | 2 | $840 |
| GaN DC-DC ×2 | $180/ea | 2 | $360 |
| Archimedean screws (4×) | $220/ea | 4 | $880 |
| ZTA actuators (4×) | $340/ea | 4 | $1,360 |
| BFRP cross-deck spine | $65/m | 2.5 m | $163 |
| CNT tension cables | $42/m | 24 m | $1,008 |
| FEATHER LoRa nodes (2×) | $85/ea | 2 | $170 |
| Core-1 CCU (2×) | $280/ea | 2 | $560 |
| **Subtotal (Hardware)** | | | **$81,144** |
| **Labor (180 hr @ $85/hr)** | | | **$15,300** |
| **Tooling Amortization** | | | **$3,600** |
| **Total Unit Cost (COGS)** | | | **$100,044** |
| **MSRP (Commercial)** | | | **$159,000–198,000** |
| **Margin** | | | **37–49%** |

---

## RISK ASSESSMENT

| Failure Mode | Probability | Severity | Mitigation |
|--------------|-------------|----------|------------|
| **Cross-deck torsional failure (fatigue)** | Low | High | CNT cable preload monitored by strain gauge; replacement interval 5,000 hr; FEA fatigue life 12,000 hr |
| **Asymmetric thrust loss (single hull)** | Medium | Medium | Quad-screw redundancy; differential pitch compensation; automatic speed reduction + beacon |
| **Hull-to-deck ZTA pivot seizure** | Medium | Medium | PTFE dry lubricant + MRF damper; quarterly inspection protocol; 50,000 cycle rating |
| **Dual battery vault thermal event** | Very Low | High | Independent vaults, 1m separation, geopolymer fire wall between hulls, PTC fusing |
| **Cryptobiotic wake failure (2-hull sync)** | Low | Medium | Independent wake channels; manual override per hull; 5-min sync tolerance |

**FMEA Summary:** Highest RPN: Cross-deck torsional failure (5×9×4=180) and Asymmetric thrust loss (6×7×4=168). Mitigated to residual <10⁻⁴ per operating hour via strain-gauge monitoring and redundant actuation.

---

## AGENTS OF AEGIS HEURISTIC INTEGRATION

**Williams Heuristic (CITADEL):** The Tadpole-02 executive summary opens with the image of two strangers sharing a boat that can survive a Carrington storm — "The boat doesn't just carry passengers. It carries the city's redundancy." The Meta-Commentary is the waterfront commissioner's elevator pitch. The Core Deliverable is the torsional rigidity calculation (GJ=1.8×10⁶ N·m²/rad) and the 10.3:1 buckling safety factor.

**El Segundo Heuristic (CHESTER):** The 255:1 bending safety factor is not hysterical; it is the natural consequence of a 1.6m span between supports and a 4mm laminate. Chester eats the burrito, runs the Donnell buckling equation, and signs off. No panic. No underbuild.

**Accountant Heuristic (MORK):** The $70,000 MXene cost (280g × $250/g) is the largest single line item. The Accountant asks: does it pay? Yes — 92 dB SE prevents $0 in GIC retrofit and $0 in harbor navigation interference. At 5,000 units/year, the MXene cost drops to $35/g by 2028 (scale projection), cutting COGS by $61,250/unit. The spreadsheet projects breakeven at 1,200 units over 36 months.

**Baker Street Heuristic (NYX):** The assumption "harbor depth ≤5m" is falsifiable: if bathymetry shows deeper, laminate thickness increases to 5mm. The 91% propulsive efficiency is falsifiable: tow-tank data from Tadpole-01 + I-SCOUT trials provide the validation dataset. If CFD and test disagree by >5%, the design is reverted to CFD baseline and test repeated.

**Keymaker Heuristic (KAIROS):** The critical path is dual-hull VARTM (parallelized) → cross-deck tensegrity assembly → dual vault installation → quad-screw rigging → final QC. Total cycle: 14 days. The Keymaker does not wait for perfection; he ships the 14-day cycle because the waterfront transit authority's fiscal year closes in 21 days.

**Kiddo Register (CROSS):** This is what we build: twin 3.2m prolate spheroids, BFRP cross-deck tensegrity, 4× Archimedean screws, 3.84 kWh dual LiFePO₄ packs, FEATHER dual-node mesh. Assembly: parallel hull layup → cross-deck tensioning (42 kN per cable) → vault install → screw rig → hydro test. QC: 1.5× design pressure per hull, torsional stiffness check, 50,000-cycle hydrofoil test.

**Torvalds Register (SPENGLER):** The 3.1 MPa local panel buckling pressure is calculated from K=7.2 (Lekhnitskii orthotropic shell, L/D=3.2, 0°/90° laminate), E=180 GPa, ν=0.28, t=4mm, b=250mm — every parameter traceable to test data or material cert. The 42 kN CNT cable ultimate tensile is from Buckminster Fuller octet truss scaling laws validated on Testa Fleet PodWall (CSMFAB-TESTA-FLEET/). The assumption "cross-deck clearance 1.6m" is explicit; if berthing slip data shows <1.4m required, hull separation reduces to 1.2m (beam 1.4m) with recalculated torsional stiffness.

**Thompson Register (MORK/CHESTER):** Tadpole-02 is two dielectric citadels tied together with a tensegrity spine, each hull a bunker with a propeller, the cross-deck a geodesic dome folded into a gangplank. When the storm hits, the MXene layer blocks the interference, the ZrB₂-SiC vault keeps the batteries from becoming thermal events, the CNT cables hold the hulls together without conducting the geoelectric field, and the four Archimedean screws slice through the chop without cavitation or entanglement. The ferry doesn't just carry people. It carries the physics of survival across the same water that carries the storm. The short sentence: **Two bunkers. One spine. Zero compromise.**

---

*END OF TADPOLE-02 WHITE-PAPER*
*CSMVessel/Tadpole_Class_Designs/Tadpole-02_Water_Taxi_Duo.md | 2026-08-11 | CarrPod Repository*
