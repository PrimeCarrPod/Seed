# Compatibility Matrix 01 — Power Distribution
## Cross-Vessel Power System Interoperability Analysis
**Scope:** Tadpole-01 through Tadpole-17 | **Category:** Electrical Power | **Date:** 2026-08-11

---

## EXECUTIVE SUMMARY

This matrix evaluates the interoperability of power distribution components across all 17 Tadpole Class vessels. The analysis covers battery systems, DC-DC converters, wiring harnesses, charging infrastructure, and emergency power supplies. All vessels share a common 48V–96V DC bus architecture (48V for classes 1–3, 96V for classes 4–6, 384V for classes 7–9, 48V/96V hybrid for classes 10–17), enabling modular power component interchangeability while respecting voltage-class safety barriers.

**Key Finding:** 78% of power distribution components are class-common across the fleet. The primary divergence occurs at the high-power class (Tadpole-14, -16, -17) where 384V bus architecture necessitates CNT-003 wiring and GaN-400 converters, incompatible with the 48V/96V fleet without transformer isolation.

---

## COMPONENT INVENTORY

| Component | Part Number | Voltage Class | Current Rating | Source |
|-----------|-------------|---------------|----------------|--------|
| LiFePO₄ 1.92kWh | CSMFAB-BATT-001 | 48V | 40A | `Charlemagne Battery Arch` |
| LiFePO₄ 7.2kWh | CSMFAB-BATT-002 | 96V | 75A | `Charlemagne Battery Arch` |
| LiFePO₄ 45kWh | CSMFAB-BATT-003 | 384V | 120A | `Charlemagne Battery Arch` |
| GaN DC-DC 1kW | CSMFAB-GaN-001 | 48V/48V | 20A | `CSMFAB0113` |
| GaN DC-DC 4kW | CSMFAB-GaN-002 | 96V/48V | 40A | `CSMFAB0113` |
| GaN DC-DC 15kW | CSMFAB-GaN-003 | 384V/48V | 40A | `CSMFAB0113` |
| CNT-001 Wiring | CSMFAB-P002-001 | 48V | 20A | `CSMFAB-P002` |
| CNT-002 Wiring | CSMFAB-P002-002 | 96V | 80A | `CSMFAB-P002` |
| CNT-003 Wiring | CSMFAB-P002-003 | 384V | 200A | `CSMFAB-P002` |
| CMBC Battery Vault | CSMFAB-CMBC-001 | Universal | — | `CSMVessel-Charlemagne/` Vol-017 |

---

## VESSEL-BY-VESSEL COMPATIBILITY

| Vessel | Battery | GaN Converter | Wiring | Charging | Emergency Power | Overall Rating |
|--------|---------|---------------|--------|----------|-----------------|----------------|
| Tadpole-01 | CSMFAB-BATT-001 | CSMFAB-GaN-001 | CNT-001 | Type-2 7kW | 30min chemical O₂ | **A** |
| Tadpole-02 | CSMFAB-BATT-001×2 | CSMFAB-GaN-001×2 | CNT-001 | Type-2 14kW | 30min chemical O₂ | **A** |
| Tadpole-03 | CSMFAB-BATT-002 | CSMFAB-GaN-002 | CNT-002 | Type-2 11kW | 45min chemical O₂ | **A** |
| Tadpole-04 | CSMFAB-BATT-002 | CSMFAB-GaN-002 | CNT-002 | Type-2 11kW | 45min chemical O₂ | **A** |
| Tadpole-05 | CSMFAB-BATT-001 | CSMFAB-GaN-001 | CNT-001 | Type-2 7kW | 30min chemical O₂ | **A** |
| Tadpole-06 | CSMFAB-BATT-001×2 | CSMFAB-GaN-001×2 | CNT-001 | Type-2 14kW | 30min chemical O₂ | **A** |
| Tadpole-07 | CSMFAB-BATT-002 | CSMFAB-GaN-002 | CNT-002 | Type-2 11kW | 45min chemical O₂ | **A** |
| Tadpole-08 | CSMFAB-BATT-002 | CSMFAB-GaN-002 | CNT-002 | Type-2 11kW | 45min chemical O₂ | **A** |
| Tadpole-09 | CSMFAB-BATT-001 | CSMFAB-GaN-001 | CNT-001 | Type-2 7kW | 30min chemical O₂ | **A** |
| Tadpole-10 | CSMFAB-BATT-002×2 | CSMFAB-GaN-002×2 | CNT-002 | Type-2 22kW | 45min chemical O₂ | **B** |
| Tadpole-11 | CSMFAB-BATT-001×2 | CSMFAB-GaN-001×2 | CNT-001 | Type-2 14kW | 30min chemical O₂ | **A** |
| Tadpole-12 | CSMFAB-BATT-002×2 | CSMFAB-GaN-002×2 | CNT-002 | Type-2 22kW | 45min chemical O₂ | **B** |
| Tadpole-13 | CSMFAB-BATT-001 | CSMFAB-GaN-001 | CNT-001 | Type-2 7kW | 30min chemical O₂ | **A** |
| Tadpole-14 | CSMFAB-BATT-002 | CSMFAB-GaN-002 | CNT-002 | Type-2 11kW | 45min chemical O₂ | **A** |
| Tadpole-15 | CSMFAB-BATT-001 | CSMFAB-GaN-001 | CNT-001 | Type-2 7kW | 30min chemical O₂ | **A** |
| Tadpole-16 | CSMFAB-BATT-003 | CSMFAB-GaN-003 | CNT-003 | CCS-1 120kW | 72hr rebreather | **C** |
| Tadpole-17 | CSMFAB-BATT-003 | CSMFAB-GaN-003 | CNT-003 | CCS-1 120kW | 96hr rebreather | **C** |

**Legend:**
- **A — Direct Fit:** Component interchangeable without modification across voltage class.
- **B — Minor Mod:** Component requires bus-bar adapter or parallel/series reconfiguration.
- **C — Redesign Required:** Component incompatible without transformer isolation or full bus redesign.
- **D — Incompatible:** Component fundamentally incompatible (voltage, current, or form-factor).

---

## INTERCHANGEABILITY ANALYSIS

### 48V Class (Tadpole-01, -02, -05, -06, -09, -11, -13, -15)
- **Full interchangeability:** All 8 vessels share identical CSMFAB-BATT-001, CSMFAB-GaN-001, CNT-001, Type-2 7kW charger, and 30-minute chemical O₂ emergency power.
- **Parallel config:** Tadpole-02 and -06 use 2× BATT-001 in parallel for doubled capacity; same GaN-001×2 in parallel; no wiring modifications required.
- **Spares commonality:** 100% across 48V class.

### 96V Class (Tadpole-03, -04, -07, -08, -10, -12, -14)
- **Full interchangeability:** All 7 vessels share identical CSMFAB-BATT-002, CSMFAB-GaN-002, CNT-002, Type-2 11kW charger, and 45-minute chemical O₂ emergency power.
- **Parallel config:** Tadpole-10 and -12 use 2× BATT-002 in parallel; same GaN-002×2 in parallel.
- **Spares commonality:** 100% across 96V class.

### 384V Class (Tadpole-16, -17)
- **Full interchangeability:** Both vessels share identical CSMFAB-BATT-003, CSMFAB-GaN-003, CNT-003, CCS-1 120kW charger, and 72/96-hour rebreather emergency power.
- **Transformer barrier:** 384V bus cannot interface with 48V/96V vessels without isolated DC-DC transformer (CSMFAB-GaN-004, not yet prototyped).
- **Spares commonality:** 100% across 384V class.

---

## SUPPLY CHAIN DEPENDENCIES

| Component | Single Source Risk | Lead Time | Mitigation |
|-----------|-------------------|-----------|------------|
| CSMFAB-BATT-001/002/003 | Medium (2 LiFePO₄ cell suppliers) | 12 weeks | Dual-source BYD & CALB; 90-day safety stock |
| CSMFAB-GaN-001/002/003 | Medium (GaN Systems / Infineon) | 8 weeks | Dual-source; design pin-compatible across GaN families |
| CNT-001/002/003 | Low (in-house extrusion) | 4 weeks | In-house twin-screw extruder; 60-day feedstock stock |
| CMBC Battery Vault | High (single SPS furnace) | 16 weeks | Regional ceramic sintering facility sharing model |

---

## RECOMMENDATIONS

1. **Standardize 48V and 96V classes:** No further voltage diversity needed below 200kWh pack size. All future vessels <15m length should use 48V or 96V.
2. **Prototype CSMFAB-GaN-004:** 384V-to-48V isolated DC-DC transformer (10kW, 94% efficiency) to enable emergency cross-charge between high-power and low-power vessels.
3. **Implement modular battery sled:** Design all battery vaults to accept BATT-001/002/003 sleds with passive alignment; enables field swapping without tools.
4. **Standardize charging inlet:** Adopt CCS-1 as sole DC charging standard across all voltage classes (with appropriate cable gauge). Retire Type-2 for production vessels.

---

*END OF COMPATIBILITY MATRIX 01 — POWER DISTRIBUTION*
