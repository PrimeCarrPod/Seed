# Compatibility Matrix 04 — Propulsion Control
## Cross-Vessel Propulsion & Control System Interoperability
**Scope:** Tadpole-01 through Tadpole-17 | **Category:** Propulsion Control | **Date:** 2026-08-11

---

## EXECUTIVE SUMMARY

This matrix evaluates the interoperability of propulsion and control systems across all 17 Tadpole Class vessels. The analysis covers Archimedean screws, Kort nozzles, motors, gearboxes, actuators, and control electronics. All vessels employ CSMFAB0113-standard Archimedean screw propulsion with MRF clutch/actuator packages, enabling modular propulsion component interchangeability while respecting power and scale diversity.

**Key Finding:** 82% of propulsion control components are common across the fleet. The primary divergence occurs at the heavy-lift and deep-submergence classes (Tadpole-10, -12, -16, -17) where Kort nozzle pods, high-power gearboxes, and vectoring actuators require dedicated mechanical and electrical interfaces.

---

## COMPONENT INVENTORY

| Component | Part Number | Spec | Source |
|-----------|-------------|------|--------|
| Archimedean Screw 120mm | CSMFAB-PROP-001 | 3-blade, PEEK CF40, P/D=1.17 | `CSMFAB0113-Vol-01` |
| Archimedean Screw 80mm | CSMFAB-PROP-002 | 4-blade, PEEK CF40, P/D=1.19 | `CSMFAB0113-Vol-01` |
| Archimedean Screw 200mm | CSMFAB-PROP-003 | 4-blade, PEEK CF40, P/D=1.10 | `CSMFAB0113-Vol-01` |
| Kort Nozzle 92mm | CSMFAB-NOZ-001 | BFRP, inlet 92mm/exit 78mm | `CSMFAB0113-Vol-01` |
| Kort Nozzle 220mm | CSMFAB-NOZ-002 | BFRP, inlet 240mm/exit 200mm | `CSMFAB0113-Vol-01` |
| BLDC Motor 750W | CSMFAB-MOT-001 | 48V, 94% efficiency | `CSMFAB0113` |
| BLDC Motor 1.2kW | CSMFAB-MOT-002 | 96V, 94% efficiency | `CSMFAB0113` |
| BLDC Motor 18kW | CSMFAB-MOT-003 | 384V, 95% efficiency | `CSMFAB0113` |
| Planetary Gearbox | CSMFAB-GEAR-001 | MRF-140CG clutch | `CSMFAB0113` |
| Planetary Gearbox | CSMFAB-GEAR-002 | MRF-200CG clutch | `CSMFAB0113` |
| Rotary Actuator | CSMFAB-ACT-001 | MRF-140CG, ±25° | `CSMFAB0113` |
| Rotary Actuator | CSMFAB-ACT-002 | MRF-200CG, ±25° | `CSMFAB0113` |
| Vectoring Pod Gondola | CSMFAB-POD-001 | Retractable, hydrodynamic | `Incursion Class BOM` |

---

## VESSEL-BY-VESSEL COMPATIBILITY

| Vessel | Screw | Nozzle | Motor | Gearbox | Actuator | Control | Overall Rating |
|--------|-------|--------|-------|---------|----------|---------|----------------|
| Tadpole-01 | PROP-001×2 | NOZ-001×2 | MOT-001×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-02 | PROP-001×2 | NOZ-001×2 | MOT-001×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-03 | PROP-002×2 | NOZ-001×2 | MOT-002×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-04 | PROP-002×2 | NOZ-001×2 | MOT-002×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-05 | PROP-001×2 | NOZ-001×2 | MOT-001×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-06 | PROP-001×2 | NOZ-001×2 | MOT-001×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-07 | PROP-002×2 | NOZ-001×2 | MOT-002×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-08 | PROP-002×2 | NOZ-001×2 | MOT-002×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-09 | PROP-001×2 | NOZ-001×2 | MOT-001×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-10 | PROP-002×4 | NOZ-001×4 | MOT-002×4 | GEAR-001×4 | ACT-001×4 | CAN-FD | **B** |
| Tadpole-11 | PROP-001×2 | NOZ-001×2 | MOT-001×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-12 | PROP-002×4 | NOZ-001×4 | MOT-002×4 | GEAR-001×4 | ACT-001×4 | CAN-FD | **B** |
| Tadpole-13 | PROP-001×2 | NOZ-001×2 | MOT-001×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-14 | PROP-002×2 | NOZ-001×2 | MOT-002×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-15 | PROP-001×2 | NOZ-001×2 | MOT-001×2 | GEAR-001×2 | ACT-001×2 | CAN-FD | **A** |
| Tadpole-16 | PROP-002×6 | NOZ-002×6 | MOT-002×6 | GEAR-002×6 | ACT-002×6 | CAN-FD | **C** |
| Tadpole-17 | PROP-003×2 | NOZ-002×2 | MOT-003×2 | GEAR-002×2 | ACT-002×2 | CAN-FD | **C** |

**Legend:**
- **A — Direct Fit:** Component interchangeable without modification.
- **B — Minor Mod:** Component requires parallel/series reconfiguration or bus-bar adapter.
- **C — Redesign Required:** Component incompatible without dedicated mechanical interface or control firmware.
- **D — Incompatible:** Component fundamentally incompatible.

---

## INTERCHANGEABILITY ANALYSIS

### Standard Propulsion Class (Tadpole-01 through -15)
- **Full interchangeability:** All 15 vessels share identical PROP-001/PROP-002 screws, NOZ-001 nozzles, MOT-001/MOT-002 motors, GEAR-001 gearboxes, ACT-001 actuators, and CAN-FD control bus.
- **Scaling rules:** Twin-screw (2×) for 1–2 pax; quad-screw (4×) for heavy-lift (Tadpole-10, -12) requires parallel inverter output but identical motor model.
- **Control firmware:** All vessels run identical MRF clutch control algorithm on Core-1 CCU; no reprogramming required for motor count changes.
- **Spares commonality:** 100% across standard propulsion class.

### Heavy Propulsion Class (Tadpole-16, -17)
- **Kort nozzle pods:** NOZ-002 (220mm) and POD-001 gondola are physically incompatible with standard nozzle mounts; require dedicated pod gondola tooling.
- **High-power motors:** MOT-003 (18kW, 384V) requires 384V bus architecture incompatible with 48V/96V vessels without transformer isolation.
- **Vectoring actuators:** ACT-002 (MRF-200CG) provides ±25° azimuth; ACT-001 provides ±25° azimuth but with 50% lower torque; not interchangeable for pod applications.
- **Spares commonality:** 0% with standard class; 100% within heavy class.

---

## CONTROL SYSTEM COMPATIBILITY

| Vessel | CCU | Bus Protocol | Redundancy | Mesh Integration | Rating |
|--------|-----|--------------|------------|------------------|--------|
| Tadpole-01 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-02 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-03 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-04 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-05 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-06 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-07 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-08 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-09 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-10 | Core-1×2 | CAN-FD | Dual | FEATHER 915MHz | **A** |
| Tadpole-11 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-12 | Core-1×2 | CAN-FD | Dual | FEATHER 915MHz | **A** |
| Tadpole-13 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-14 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-15 | Core-1 | CAN-FD | Single | FEATHER 915MHz | **A** |
| Tadpole-16 | Core-1×2 | CAN-FD | Triple | FEATHER 915MHz + Acoustic | **B** |
| Tadpole-17 | Core-1×2 | CAN-FD | Triple | FEATHER 915MHz | **B** |

**CCU Commonality:** All 17 vessels use Core-1 avionics (CSMFAB059). Redundancy scales with vessel criticality: single for classes 1–3, dual for heavy-lift, triple for saturation/offshore.

---

## SUPPLY CHAIN DEPENDENCIES

| Component | Single Source Risk | Lead Time | Mitigation |
|-----------|-------------------|-----------|------------|
| CSMFAB-PROP-001/002/003 | Low (in-house machining) | 4 weeks | In-house 5-axis CNC; 30-day safety stock |
| CSMFAB-NOZ-001/002 | Medium (BFRP 3D printing) | 6 weeks | In-house FDM + CNC trim; 45-day safety stock |
| CSMFAB-MOT-001/002/003 | Medium (GaN FET supplier) | 8 weeks | Dual-source GaN Systems / Infineon; 60-day safety stock |
| CSMFAB-GEAR-001/002 | Medium (MRF clutch supplier) | 10 weeks | Long-term MRF contract; 90-day safety stock |
| CSMFAB-ACT-001/002 | Medium (MRF actuator supplier) | 10 weeks | Long-term MRF contract; 90-day safety stock |

---

## RECOMMENDATIONS

1. **Standardize twin-screw architecture:** All vessels <12m should use twin-screw (2×) configuration; quad-screw (4×) reserved for vessels >12m with >2-tonne displacement.
2. **Prototype CSMFAB-PROP-004:** 300mm Archimedean screw for Tadpole-X1 heavy-cargo variant (>5 tonnes); maintains P/D=1.10 ratio.
3. **Implement field-replaceable propeller:** Design screw hub with splined PEEK CF40 interface; enables at-sea replacement without drydock.
4. **Unify control firmware:** Maintain single git repository for MRF clutch control algorithm; all 17 vessels run identical firmware with configurable motor count parameter.

---

*END OF COMPATIBILITY MATRIX 04 — PROPULSION CONTROL*
