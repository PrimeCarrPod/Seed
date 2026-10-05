# Compatibility Matrix 05 — Navigation Sensor
## Cross-Vessel Navigation & Sensor Suite Interoperability
**Scope:** Tadpole-01 through Tadpole-17 | **Category:** Navigation Sensors | **Date:** 2026-08-11

---

## EXECUTIVE SUMMARY

This matrix evaluates the interoperability of navigation and sensor subsystems across all 17 Tadpole Class vessels. The analysis covers GNSS, inertial navigation, obstacle avoidance (ultrasound/sonar), electromagnetic sensing, optical systems, and acoustic modems. All vessels share a common sensor architecture based on FEATHER mesh-corrected dual-frequency GNSS and MEMS inertial measurement, enabling modular sensor interchangeability while respecting mission-specific diversity.

**Key Finding:** 88% of navigation sensor components are common across the fleet. The primary divergence occurs at the deep-submergence and high-speed classes (Tadpole-13, -16, -17) where specialized sonar, high-bandwidth optical ports, and underwater acoustic modems introduce form-factor and interface incompatibilities.

---

## COMPONENT INVENTORY

| Component | Part Number | Spec | Source |
|-----------|-------------|------|--------|
| Dual-Frequency GNSS | CSMFAB-GPS-001 | L1/L5, 0.01m RTK | `FEATHER Mesh` |
| MEMS IMU | CSMFAB-IMU-001 | ±16°/hr drift, triple-redundant | `CSMFAB059` |
| Fiber-Optic Gyro | CSMFAB-FOG-001 | 0.01°/hr drift | `CSMVessel-Charlemagne/` |
| Phased-Array Ultrasound | CSMFAB-US-001 | 20–200kHz, 5m range | `CSMFAB0113` |
| Phased-Array Ultrasound | CSMFAB-US-002 | 20–200kHz, 10m range | `CSMFAB0113` |
| Forward-Scan Sonar | CSMFAB-SONAR-001 | 120m range, 2cm resolution | `CSMFAB0113` |
| Forward-Scan Sonar | CSMFAB-SONAR-002 | 200m range, 1cm resolution | `CSMFAB0113` |
| Side-Scan Sonar | CSMFAB-SSS-001 | 100m range, 5cm resolution | `CSMVessel-Charlemagne/` |
| Electric Field Mill | CSMFAB-EF-001 | ±50 kV/m | `CSMFAB-P007` |
| Faraday Alarm GIC Sensor | CSMFAB-GIC-001 | <1 Hz blocking | `CSMFAB-P007` |
| ALON Optical Dome | CSMFAB-DOME-001 | 0.56m radius, Tourmaline-class | `CSMFAB0113` |
| ALON Optical Dome | CSMFAB-DOME-002 | 0.80m radius, Tourmaline-class | `CSMFAB0113` |
| Underwater Acoustic Modem | CSMFAB-AQ-001 | 6–12 kHz, 500m range | `CSMVessel-Charlemagne/` |
| FEATHER LoRa Node | CSMFAB0115 | 915 MHz, +22 dBm, FHSS | `CSMFAB0115` |

---

## VESSEL-BY-VESSEL COMPATIBILITY

| Vessel | Position | Obstacle | EM | Optical | Comms | Overall Rating |
|--------|----------|----------|----|---------|-------|----------------|
| Tadpole-01 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-02 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-03 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-04 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-05 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-06 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-07 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-08 | GPS-001 | US-002, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-09 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-10 | GPS-001×2 | US-002, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER×2 | **B** |
| Tadpole-11 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-12 | GPS-001×2 | US-002, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER×2 | **B** |
| Tadpole-13 | GPS-001 | US-002, SONAR-002 | EF-001, GIC-001 | DOME-001 | FEATHER | **B** |
| Tadpole-14 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-15 | GPS-001 | US-001, SONAR-001 | EF-001, GIC-001 | DOME-001 | FEATHER | **A** |
| Tadpole-16 | GPS-001, FOG-001 | US-002, SONAR-002, SSS-001 | EF-001, GIC-001 | DOME-002 | FEATHER, AQ-001 | **C** |
| Tadpole-17 | GPS-001×2 | US-002, SONAR-002 | EF-001, GIC-001 | DOME-002 | FEATHER×2 | **B** |

**Legend:**
- **A — Direct Fit:** Sensor interchangeable without modification.
- **B — Minor Mod:** Sensor requires mounting adapter or additional processing bandwidth.
- **C — Redesign Required:** Sensor incompatible without dedicated hull penetration or interface electronics.
- **D — Incompatible:** Sensor fundamentally incompatible.

---

## INTERCHANGEABILITY ANALYSIS

### Standard Navigation Class (Tadpole-01 through -15)
- **Full interchangeability:** All 15 vessels share identical GPS-001, US-001/002, SONAR-001, EF-001, GIC-001, DOME-001, and FEATHER node.
- **Scaling rules:** US-002 (10m range) and SONAR-002 (200m range) are used only on high-speed/open-ocean vessels; US-001 and SONAR-001 are standard for littoral.
- **Dual GPS:** Tadpole-10, -12, -17 use 2× GPS-001 for RTK redundancy; identical hardware, duplicate mounting.
- **Spares commonality:** 100% across standard navigation class.

### Deep-Submergence Class (Tadpole-16)
- **FOG-001 fiber-optic gyro:** Required for 200m submerged INS when GPS is unavailable; incompatible with standard IMU-001 due to interface electronics.
- **SONAR-002 and SSS-001:** High-resolution sonar requires dedicated hull penetrations (titanium pressure window) not present on standard vessels.
- **AQ-001 acoustic modem:** Underwater communication at 500m range; requires dedicated hydrophone and projector mounts.
- **DOME-002:** 0.80m radius dome requires larger hull penetration (0.3m vs 0.2m standard).

### High-Speed/Offshore Class (Tadpole-13, -17)
- **SONAR-002:** 200m range required for high-speed obstacle avoidance; standard SONAR-001 (120m) provides insufficient reaction time at 22 kts.
- **Dual FEATHER:** Redundant mesh nodes for offshore redundancy; identical hardware, duplicate mounting.

---

## SENSOR PLACEMENT & HULL INTERFACE

| Sensor | Standard Penetration | Heavy Penetration | Compatible? |
|--------|---------------------|-------------------|-------------|
| GPS-001 Antenna | MXene FSS aperture, 50mm | MXene FSS aperture, 80mm | **No** (aperture size mismatch) |
| US-001/US-002 Transducer | ZTA ceramic mount, 80mm | ZTA ceramic mount, 120mm | **No** (mount size mismatch) |
| SONAR-001/SONAR-002 | Ti-6Al-4V window, 100mm | Ti-6Al-4V window, 150mm | **No** (window size mismatch) |
| EF-001/GIC-001 | Pass-through MXene FSS | Pass-through MXene FSS | **Yes** (non-penetrating) |
| DOME-001/DOME-002 | ALON dome, 200mm/300mm | ALON dome, 200mm/300mm | **No** (hull cutout mismatch) |
| FEATHER Antenna | PCB antenna, internal | PCB antenna, internal | **Yes** (non-penetrating) |
| AQ-001 Hydrophone | Titanium can, 50mm | Titanium can, 50mm | **Yes** (standard penetration) |

---

## SUPPLY CHAIN DEPENDENCIES

| Component | Single Source Risk | Lead Time | Mitigation |
|-----------|-------------------|-----------|------------|
| CSMFAB-GPS-001 | Low (u-blox / Septentrio) | 4 weeks | Multi-source; 60-day safety stock |
| CSMFAB-IMU-001 | Medium (Bosch / STMicro) | 6 weeks | Dual-source; 60-day safety stock |
| CSMFAB-FOG-001 | High (single defense supplier) | 16 weeks | Long-term contract; 90-day safety stock |
| CSMFAB-SONAR-001/002 | Medium (2 marine sonar suppliers) | 8 weeks | Dual-source; 60-day safety stock |
| CSMFAB-DOME-001/002 | Medium (ALON sapphire supplier) | 12 weeks | Long-term contract; 90-day safety stock |
| CSMFAB-AQ-001 | High (single acoustic modem supplier) | 20 weeks | Strategic partnership; 120-day safety stock |

---

## RECOMMENDATIONS

1. **Standardize DOME-001:** All vessels <12m should use 0.56m radius dome; reserve DOME-002 for vessels >12m or saturation-rated.
2. **Prototype CSMFAB-GPS-002:** Multi-constellation (GPS+GLONASS+Galileo+BeiDou) with 0.005m RTK for Tadpole-X1 precision navigation variant.
3. **Unify sonar processing:** Run all sonar data through identical CUDA DSP pipeline on Core-1; eliminates firmware diversity across SONAR-001/002/SSS-001.
4. **Implement sensor health monitoring:** Add continuous self-test (BIT) to all sensors; failed sensor auto-reports to Core-1 and FEATHER mesh within 100ms.

---

*END OF COMPATIBILITY MATRIX 05 — NAVIGATION SENSOR*
