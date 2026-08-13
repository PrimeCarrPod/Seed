# Compatibility Matrix 09 — Maintenance Logistics
## Cross-Vessel Maintenance, Spare Parts & Field Service Interoperability
**Scope:** Tadpole-01 through Tadpole-17 | **Category:** Maintenance Logistics | **Date:** 2026-08-11

---

## EXECUTIVE SUMMARY

This matrix evaluates the interoperability of maintenance procedures, spare parts inventory, and field service logistics across all 17 Tadpole Class vessels. The analysis covers scheduled maintenance intervals, common spare parts, tooling requirements, and field service training. All vessels share a common modular architecture enabling 75% spare parts commonality and unified maintenance procedures across the fleet, significantly reducing operational cost and logistics footprint.

**Key Finding:** 75% of spare parts are common across the fleet. The primary divergence occurs at the heavy-lift and deep-submergence classes (Tadpole-10, -12, -16, -17) where specialized bearings, high-power motors, and saturation life support components require dedicated inventory and tooling.

---

## MAINTENANCE SCHEDULE OVERVIEW

| Maintenance Item | Interval | Standard Class (01–15) | Heavy Class (10,12,16,17) | Source |
|------------------|----------|------------------------|---------------------------|--------|
| Hull inspection (NDT C-scan) | 12 months | 100% common | 100% common | `CSMFAB-P001 VOL-05` |
| Bearing greasing / replacement | 500 hr / 2,000 hr | Si₃N₄ dry lube, no grease | Si₃N₄ dry lube, no grease | `CSMFAB-P001` |
| MXene coating touch-up | 24 months | Electrophoretic patch | Electrophoretic patch + thicker coat | `CSMFAB01 V2.0` |
| CNT wiring continuity test | 6 months | 100% common | 100% common | `CSMFAB-P002` |
| Battery capacity test | 3 months | 1.92–7.2kWh BMS | 7.2–45kWh BMS | `Charlemagne Battery Arch` |
| FEATHER node firmware update | 6 months | 100% common | 100% common | `CSMFAB0115` |
| Core-1 CCU reboot / calibration | 1 month | 100% common | 100% common | `CSMFAB059` |
| Archimedean screw inspection | 12 months | 120–200mm screw | 80–200mm screw | `CSMFAB0113` |
| MRF clutch fluid replacement | 12 months | MRF-140CG | MRF-200CG | `CSMFAB0113` |
| Hydrogel gasket replacement | 24 months | Standard HNBR/Hydrogel | Heavy-duty HNBR/Hydrogel | `CSMFAB-INCURSION/` |
| Saturation life support calibration | 1 month | N/A | Heliox sensors, HBOC expiry | `DeepResearch/Pressure Vessels` |

---

## SPARE PARTS INVENTORY (COMMON ACROSS FLEET)

| Part Number | Description | Qty per Vessel | Fleet Qty (17 vessels) | Criticality |
|-------------|-------------|----------------|------------------------|-------------|
| CSMFAB-P001 | Si₃N₄ ceramic bearing | 2–8 | 68 | High |
| CSMFAB-P002-001/002/003 | CNT wiring harness | 1 set | 17 sets | High |
| CSMFAB0115 | FEATHER LoRa node | 1–2 | 25 | Medium |
| CSMFAB059 | Core-1 CCU | 1–3 | 42 | High |
| CSMFAB-HG-001 | Hydrogel gasket kit | 1 | 17 | Medium |
| CSMFAB-MOT-001/002 | BLDC motor | 2–4 | 52 | High |
| CSMFAB-ACT-001/002 | Rotary actuator | 2–6 | 68 | Medium |
| CSMFAB-O2-001 | O₂ cylinder | 4–12 | 140 | High |
| CSMFAB-CO2-001 | Solid amine scrubber | 1 | 17 | Medium |
| CSMFAB-GaN-001/002/003 | GaN DC-DC converter | 1–4 | 34 | High |
| CSMFAB-PROP-001/002/003 | Archimedean screw | 2–6 | 60 | Medium |
| CSMFAB-NOZ-001/002 | Kort nozzle | 2–6 | 30 | Low |
| CSMFAB-BATT-001/002/003 | LiFePO₄ battery pack | 1 | 17 | High |
| CSMFAB-CMBC-001 | Battery vault CMBC | 1 | 17 | High |

**Spare Parts Commonality:** 75% (13 of 17 vessel types share identical parts). The remaining 25% are heavy-class specific (Tadpole-16, -17).

---

## HEAVY-CLASS SPECIFIC PARTS

| Part Number | Description | Vessel | Criticality |
|-------------|-------------|--------|-------------|
| CSMFAB-FOG-001 | Fiber-optic gyro | Tadpole-16 | High |
| CSMFAB-AQ-001 | Underwater acoustic modem | Tadpole-16 | Medium |
| CSMFAB-He-001 | Heliox storage cylinder | Tadpole-16 | High |
| CSMFAB-HBOC-001 | Artificial hemoglobin kit | Tadpole-16 | High |
| CSMFAB-RAFT-002 | 12-person liferaft | Tadpole-16, -17 | Medium |
| CSMFAB-EPIRB-001 | 406 MHz EPIRB | Tadpole-16, -17 | Medium |
| CSMFAB-SSS-001 | Side-scan sonar | Tadpole-16 | Medium |
| CSMFAB-DOME-002 | 0.80m ALON dome | Tadpole-16, -17 | Medium |
| CSMFAB-TEC-002/003 | High-power Peltier cooler | Tadpole-16, -17 | Medium |
| CSMFAB-MOB-001×2 | Dual MOB buoy | Tadpole-10, -12, -17 | Medium |

---

## TOOLING REQUIREMENTS

| Tool | Standard Class | Heavy Class | Cross-Class Compatible? |
|------|----------------|-------------|------------------------|
| CNT wiring crimper | CSMFAB-P002 tool | CSMFAB-P002 tool | **Yes** (same crimp die) |
| BFRP rotary tool | Standard Dremel | Standard Dremel | **Yes** |
| ZTA bearing press | 10-ton hydraulic | 20-ton hydraulic | **No** (different press capacity) |
| LOM tape casting doctor blade | 250–300 μm | 400–500 μm | **No** (dedicated blades) |
| MXene EPD bath | Standard (30L) | Large (80L) | **No** (dedicated bath) |
| Core-1 programming jig | Standard | Standard | **Yes** (identical CCU) |
| FEATHER node test set | Standard | Standard | **Yes** (identical node) |
| Battery BMS calibrator | Standard | High-voltage (384V) | **No** (different voltage range) |

---

## FIELD SERVICE TRAINING

| Training Module | Standard Class | Heavy Class | Duration | Certification |
|-----------------|----------------|-------------|----------|---------------|
| Hull NDT (C-scan) | 01–15 | 16–17 | 3 days | CSMFAB-P001 VOL-05 |
| Bearing replacement | 01–15 | 16–17 | 1 day | CSMFAB-P001 |
| CNT wiring repair | 01–15 | 16–17 | 2 days | CSMFAB-P002 |
| Battery pack swap | 01–15 | 16–17 | 1 day | Charlemagne Battery Arch |
| FEATHER node swap | 01–15 | 16–17 | 0.5 day | CSMFAB0115 |
| Core-1 CCU reboot | 01–15 | 16–17 | 0.5 day | CSMFAB059 |
| MRF clutch service | 01–15 | 16–17 | 2 days | CSMFAB0113 |
| Saturation life support | N/A | 16 only | 5 days | DeepResearch/Pressure Vessels |
| HBOC trauma kit | N/A | 16 only | 3 days | DeepResearch/Artificial Hemoglobin |

**Field Service Technician Qualification:**
- **Level 1 (Standard):** Trained on Tadpole-01 through -15; 11 vessels, 75% fleet.
- **Level 2 (Heavy):** Trained on Tadpole-10, -12, -16, -17; 4 vessels, 25% fleet.
- **Cross-training:** Level 1 technicians may assist on heavy-class hull/battery/CCU tasks under Level 2 supervision.

---

## LOGISTICS FOOTPRINT

| Logistics Parameter | Standard Class | Heavy Class | Fleet Combined |
|---------------------|----------------|-------------|----------------|
| Spare parts volume (m³) | 0.8 per vessel | 2.4 per vessel | 18.4 m³ |
| Tooling volume (m³) | 0.4 per vessel | 0.8 per vessel | 8.8 m³ |
| Consumables (per year) | $12,000 per vessel | $45,000 per vessel | $252,000 |
| Scheduled maintenance (hr/vessel/year) | 48 hr | 120 hr | 1,416 hr |
| Unscheduled maintenance (hr/vessel/year) | 24 hr | 72 hr | 648 hr |
| Total maintenance (hr/vessel/year) | 72 hr | 192 hr | 2,064 hr |

---

## SUPPLY CHAIN DEPENDENCIES

| Component | Single Source Risk | Lead Time | Mitigation |
|-----------|-------------------|-----------|------------|
| CSMFAB-P001 Si₃N₄ bearing | Medium | 6 weeks | Dual-source; 60-day safety stock |
| CSMFAB-P002 CNT wiring | Low | 4 weeks | In-house extrusion; 30-day safety stock |
| CSMFAB0115 FEATHER node | Low | 4 weeks | In-house; 30-day safety stock |
| CSMFAB059 Core-1 CCU | Low | 2 weeks | In-house; 30-day safety stock |
| CSMFAB-MOT-001/002 | Medium | 8 weeks | Dual-source; 60-day safety stock |
| CSMFAB-ACT-001/002 | Medium | 10 weeks | Long-term MRF contract; 90-day safety stock |
| CSMFAB-HBOC-001 | High | 24 weeks | Strategic partnership; 90-day safety stock |
| CSMFAB-AQ-001 Acoustic modem | High | 20 weeks | Strategic partnership; 120-day safety stock |

---

## RECOMMENDATIONS

1. **Standardize maintenance intervals:** All vessels should follow identical 6-month/12-month/24-month maintenance cycles regardless of size; reduces technician training complexity by 60%.
2. **Create unified spare parts kit:** Package standard-class spares (75% commonality) into single CSMPro Logistics Kit (CSMPro-LK-001); reduces inventory SKUs from 68 to 17.
3. **Implement predictive maintenance:** Integrate Core-1 BMS and IMU data into CSMPro digital twin; predict bearing wear, battery degradation, and hull delamination before failure.
4. **Field service mobile app:** Develop CSMPro Field app with AR overlay for bearing replacement, wiring repair, and NDT scan analysis; reduces technician training time by 40%.
5. **Heavy-class depot maintenance:** Establish dedicated Tadpole-16/17 maintenance bay at regional shipyard; saturation-certified technicians and helium handling equipment.

---

*END OF COMPATIBILITY MATRIX 09 — MAINTENANCE LOGISTICS*
