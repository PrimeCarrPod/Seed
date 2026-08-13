# Compatibility Matrix 02 — Life Support Integration
## Cross-Vessel Life Support & Environmental Control Interoperability
**Scope:** Tadpole-01 through Tadpole-17 | **Category:** Life Support | **Date:** 2026-08-11

---

## EXECUTIVE SUMMARY

This matrix evaluates the interoperability of life support subsystems across all 17 Tadpole Class vessels. The analysis covers atmospheric control (O₂, CO₂, pressure), thermal management, biometric monitoring, artificial hemoglobin integration, and cryptobiotic survival mode. All vessels share a common atmospheric baseline (21% O₂, 0.04% CO₂, 1013 mbar) and employ identical CSMFAB077 regenerative MEA scrubbers scaled to occupancy, enabling modular life support component interchangeability.

**Key Finding:** 92% of life support components are common across the fleet. The primary divergence occurs at the saturation-rated vessels (Tadpole-16, Tadpole-17 partial) where heliox management, decompression computers, and HBOC-201 artificial hemoglobin kits introduce specialized hardware incompatible with standard atmospheric vessels without redesign.

---

## COMPONENT INVENTORY

| Component | Part Number | Capacity | Source |
|-----------|-------------|----------|--------|
| O₂ Cylinder (18L, 200bar) | CSMFAB-O2-001 | 720L gaseous | `DeepResearch/Pressure Vessels` |
| Chemical O₂ Generator | CSMFAB-O2-002 | 30min emergency | `CSMFAB077` |
| Solid Amine Scrubber | CSMFAB-CO2-001 | 500g–6,000g | `CSMFAB077` |
| Heliox Storage (12L, 200bar) | CSMFAB-He-001 | 240L He + 48L O₂ | `CSMVessel-Charlemagne/` Vol-017 |
| Artificial Hemoglobin (HBOC-201) | CSMFAB-HBOC-001 | 500mL bag, 30g/L | `DeepResearch/Artificial Hemoglobin` |
| Peltier Cooler (200W) | CSMFAB-TEC-001 | 2kW peak | `CSMFAB0107` |
| Peltier Cooler (800W) | CSMFAB-TEC-002 | 8kW peak | `CSMFAB0107` |
| Peltier Cooler (1200W) | CSMFAB-TEC-003 | 8kW peak | `CSMFAB0107` |
| Hydrogel Gasket Kit | CSMFAB-HG-001 | 15–20 min seal | `CSMFAB-INCURSION/` Ep21 |
| Biometric PPG Sensor | CSMFAB-BIO-001 | HR, SpO₂, RMSSD | `CSMFAB077` |

---

## VESSEL-BY-VESSEL COMPATIBILITY

| Vessel | O₂ Supply | CO₂ Scrub | Thermal | Biometric | Hemoglobin | Survival Mode | Overall Rating |
|--------|-----------|-----------|---------|-----------|------------|---------------|----------------|
| Tadpole-01 | 4× O2-001 | CO2-001 (500g) | TEC-001 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-02 | 4× O2-001 | CO2-001 (500g) | TEC-001 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-03 | 6× O2-001 | CO2-001 (800g) | TEC-001×2 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-04 | 6× O2-001 | CO2-001 (800g) | TEC-001×2 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-05 | 4× O2-001 | CO2-001 (500g) | TEC-001 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-06 | 4× O2-001 | CO2-001 (500g) | TEC-001 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-07 | 6× O2-001 | CO2-001 (800g) | TEC-001×2 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-08 | 6× O2-001 | CO2-001 (1,200g) | TEC-001×2 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-09 | 4× O2-001 | CO2-001 (500g) | TEC-001 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-10 | 6× O2-001 | CO2-001 (800g) | TEC-001×2 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-11 | 4× O2-001 | CO2-001 (500g) | TEC-001 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-12 | 6× O2-001 | CO2-001 (800g) | TEC-001×2 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-13 | 4× O2-001 | CO2-001 (500g) | TEC-001 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-14 | 6× O2-001 | CO2-001 (800g) | TEC-001×2 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-15 | 4× O2-001 | CO2-001 (500g) | TEC-001 | BIO-001 | None | Cryptobiotic | **A** |
| Tadpole-16 | 12× O2-001 + He-001×4 | CO2-001 (2,000g) | TEC-002 | BIO-001×4 | HBOC-001×2 | Saturation + Cryptobiotic | **C** |
| Tadpole-17 | 12× O2-001 | CO2-001 (6,000g) | TEC-003 | BIO-001×12 | None | Cryptobiotic | **B** |

**Legend:**
- **A — Direct Fit:** Component interchangeable without modification.
- **B — Minor Mod:** Component requires capacity scaling or manifold reconfiguration.
- **C — Redesign Required:** Component incompatible without dedicated heliox/dedicated saturation hardware.
- **D — Incompatible:** Component fundamentally incompatible.

---

## INTERCHANGEABILITY ANALYSIS

### Standard Atmospheric Class (Tadpole-01 through -15)
- **Full interchangeability:** All 15 vessels share identical O₂ cylinder manifold (4–6× O2-001), CO2-001 scrubber (scaled capacity), TEC-001 peltier cooler (1–2×), BIO-001 PPG sensor, and cryptobiotic survival mode.
- **Scaling rules:** CO₂ scrubber capacity scales linearly with occupancy: 500g/person (1–2 pax), 800g/person (3–4 pax), 1,200g/person (4+ pax cold-water). TEC-001 scales at 200W/person.
- **Spares commonality:** 100% across standard atmospheric class.

### Saturation-Rated Class (Tadpole-16)
- **Incompatible with standard class:** Heliox storage (He-001), decompression computer, artificial hemoglobin kit (HBOC-001), and 4-person biometric array (BIO-001×4) are saturation-specific.
- **Partial commonality:** O2-001 cylinders and CO2-001 scrubber are compatible but require helium-compatible O-ring seals (Viton® vs. standard HNBR) for deep diving.
- **Cryptobiotic mode:** Shared with standard class but augmented with artificial hemoglobin IV drip for 72 hr tissue O₂ maintenance.

### High-Capacity Class (Tadpole-17)
- **Minor mod required:** CO2-001 scrubber requires 6,000g capacity (12-person scaled); standard scrubber housing is compatible but requires dual-bed configuration.
- **TEC-003 peltier cooler:** 1200W unit is physically larger than TEC-001/002; requires enlarged hull penetrations and additional thermal mass.
- **Spares commonality:** 78% with standard atmospheric class.

---

## SUPPLY CHAIN DEPENDENCIES

| Component | Single Source Risk | Lead Time | Mitigation |
|-----------|-------------------|-----------|------------|
| CSMFAB-O2-001 | Low (commercial SCUBA market) | 2 weeks | Commercial off-shelf; 30-day safety stock |
| CSMFAB-CO2-001 | Medium (MEA resin supply) | 8 weeks | Dual-source MEA resin (Honeywell / Mitsubishi); 60-day safety stock |
| CSMFAB-He-001 | High (helium refining) | 16 weeks | Long-term helium contract; on-site ZrB₂-SiC storage CMBC for reserve |
| CSMFAB-HBOC-001 | High (biotech patent) | 24 weeks | Strategic partnership with HBOC manufacturer; 90-day safety stock |
| CSMFAB-TEC-001/002/003 | Low (Peltier modules commodity) | 4 weeks | Multi-source (Ferrotec / Crystal; 60-day safety stock |

---

## RECOMMENDATIONS

1. **Standardize atmospheric class:** No further life support diversity needed below 6-person occupancy. All future vessels <10m length should use the Tadpole-01 through -15 atmospheric baseline.
2. **Prototype CSMFAB-He-002:** Compact heliox storage cylinder (6L, 300bar) for saturation-rated vessels <8m length, reducing helium inventory by 40%.
3. **Develop HBOC-002:** Shelf-stable artificial hemoglobin (lyophilized, 24-month shelf life) for extended cryptobiotic missions (>30 days).
4. **Unify biometric sensor:** Replace BIO-001 with CSMFAB-BIO-002 (multi-parameter: HR, SpO₂, RMSSD, decompression stress index, blood glucose) for single-sensor compatibility across all classes.

---

*END OF COMPATIBILITY MATRIX 02 — LIFE SUPPORT INTEGRATION*
