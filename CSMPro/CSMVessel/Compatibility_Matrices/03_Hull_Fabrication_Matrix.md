# Compatibility Matrix 03 — Hull Fabrication
## Cross-Vessel Hull Material & Manufacturing Interoperability
**Scope:** Tadpole-01 through Tadpole-17 | **Category:** Hull Fabrication | **Date:** 2026-08-11

---

## EXECUTIVE SUMMARY

This matrix evaluates the interoperability of hull fabrication processes, material specifications, and tooling across all 17 Tadpole Class vessels. The analysis covers laminate architecture, sintering schedules, MXene deposition, BFRP fairing, and non-destructive testing protocols. All vessels share a common material baseline (ZrB₂-SiC UHTC + BFRP/Elium® + MXene Ti₃C₂Tₓ), enabling fabrication line commonality while respecting thickness and laminage diversity.

**Key Finding:** 85% of hull fabrication processes are common across the fleet. The primary divergence occurs at the heavy-lift and deep-submergence classes (Tadpole-10, -12, -16, -17) where laminate thickness, sintering parameters, and MXene coating weight require dedicated tooling runs.

---

## COMPONENT INVENTORY

| Component | Part Number | Spec | Source |
|-----------|-------------|------|--------|
| ZrB₂-SiC Laminate | CSMFAB-LAM-001 | 4mm, 12 laminae, 70:30 vol% | `CSMFAB01 V2.0 §3.1` |
| ZrB₂-SiC Laminate | CSMFAB-LAM-002 | 6mm, 16 laminae, 70:30 vol% | `CSMFAB01 V2.0 §3.1` |
| ZrB₂-SiC Laminate | CSMFAB-LAM-003 | 8mm, 20 laminae, 70:30 vol% | `CSMFAB01 V2.0 §3.1` |
| BFRP/Elium® Layup | CSMFAB-BFRP-001 | 3mm, unidirectional, 1100 MPa | `BOM-REGISTRY BFRP-Elium-001` |
| BFRP/Elium® Layup | CSMFAB-BFRP-002 | 4mm, unidirectional, 1100 MPa | `BOM-REGISTRY BFRP-Elium-001` |
| BFRP/Elium® Layup | CSMFAB-BFRP-003 | 5mm, unidirectional, 1100 MPa | `BOM-REGISTRY BFRP-Elium-001` |
| MXene Ti₃C₂Tₓ Coating | CSMFAB-MX-001 | 45 μm, SE=92 dB | `BOM-REGISTRY MXene-Ti3C2Tx-005` |
| MXene Ti₃C₂Tₓ Coating | CSMFAB-MX-002 | 60 μm, SE=92 dB | `BOM-REGISTRY MXene-Ti3C2Tx-005` |
| MXene Ti₃C₂Tₓ Coating | CSMFAB-MX-003 | 80 μm, SE=92 dB | `BOM-REGISTRY MXene-Ti3C2Tx-005` |
| Si₃N₄ Ceramic Bearing | CSMFAB-P001 | P0-01 grade, 500T | `CSMFAB-P001/` |
| YInMn Blue Pigment | CSMFAB-PIG-001 | 2.5 wt%, SRI=115 | `CSMMetal20250001` |

---

## VESSEL-BY-VESSEL COMPATIBILITY

| Vessel | Primary Laminate | BFRP Layup | MXene Coat | Sinter Schedule | Tooling | Overall Rating |
|--------|------------------|------------|------------|-----------------|---------|----------------|
| Tadpole-01 | LAM-001 (4mm/12L) | BFRP-001 (3mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **A** |
| Tadpole-02 | LAM-001 (4mm/12L) | BFRP-001 (3mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **A** |
| Tadpole-03 | LAM-001 (5mm/14L) | BFRP-001 (4mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **B** |
| Tadpole-04 | LAM-001 (5mm/14L) | BFRP-001 (4mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **B** |
| Tadpole-05 | LAM-001 (4mm/12L) | BFRP-001 (3mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **A** |
| Tadpole-06 | LAM-001 (4mm/12L) | BFRP-001 (3mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **A** |
| Tadpole-07 | LAM-001 (5mm/14L) | BFRP-001 (4mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **B** |
| Tadpole-08 | LAM-001 (5mm/14L) | BFRP-001 (4mm) | MX-001 (60μm) | 1900°C/50MPa/5min | Standard | **B** |
| Tadpole-09 | LAM-001 (4mm/12L) | BFRP-001 (3mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **A** |
| Tadpole-10 | LAM-001 (5mm/14L) | BFRP-002 (4mm) | MX-001 (60μm) | 1900°C/50MPa/5min | Standard | **B** |
| Tadpole-11 | LAM-001 (4mm/12L) | BFRP-001 (3mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **A** |
| Tadpole-12 | LAM-001 (5mm/14L) | BFRP-002 (4mm) | MX-001 (60μm) | 1900°C/50MPa/5min | Standard | **B** |
| Tadpole-13 | LAM-001 (4mm/12L) | BFRP-001 (3mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **A** |
| Tadpole-14 | LAM-001 (5mm/14L) | BFRP-001 (4mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **B** |
| Tadpole-15 | LAM-001 (4mm/12L) | BFRP-001 (3mm) | MX-001 (45μm) | 1900°C/50MPa/5min | Standard | **A** |
| Tadpole-16 | LAM-002 (6mm/16L) | BFRP-002 (4mm) | MX-002 (60μm) | 1950°C/60MPa/8min | Heavy | **C** |
| Tadpole-17 | LAM-003 (8mm/20L) | BFRP-003 (5mm) | MX-003 (80μm) | 1950°C/60MPa/8min | Heavy | **C** |

**Legend:**
- **A — Direct Fit:** Identical laminate, layup, and coating; same tooling and sintering run.
- **B — Minor Mod:** Same tooling; additional laminae or coating weight requires adjusted tape casting thickness or deposition time (+10–20%).
- **C — Redesign Required:** Dedicated sintering run (higher pressure, longer dwell), dedicated LOM tape caster format, and dedicated MXene deposition bath.
- **D — Incompatible:** Material system fundamentally different.

---

## INTERCHANGEABILITY ANALYSIS

### Standard Tooling Class (Tadpole-01 through -15)
- **LAM-001 baseline:** 4mm–5mm laminate thickness, 12–14 laminae, sintered at 1900°C/50MPa/5min.
- **BFRP-001/002:** 3mm–4mm unidirectional layup, autoclave cure 175°C/2hr; same VARTM mandrel format (1m × 2m) with minor mandrel extension.
- **MX-001/002:** 45μm–60μm electrophoretic deposition; same 350°C/Ar anneal cycle; deposition time scales linearly with weight (45μm=30min, 60μm=40min).
- **Spares commonality:** 100% tooling commonality across 15 vessels.

### Heavy Tooling Class (Tadpole-16, -17)
- **LAM-002/003:** 6mm–8mm laminate thickness, 16–20 laminae; requires dedicated LOM tape caster (2m × 3m for Tadpole-16, 2m × 4m for Tadpole-17).
- **Sintering:** 1950°C/60MPa/8min; cannot share furnace queue with standard 1900°C/5min runs without 4-hour cool-down and recalibration.
- **MX-002/003:** 60μm–80μm deposition; requires larger bath volume and longer anneal (400°C/Ar).
- **Tooling exclusivity:** 0% tooling commonality with standard class; dedicated production line required.

---

## FABRICATION PROCESS COMPATIBILITY

| Process Step | Standard Class | Heavy Class | Cross-Class Compatible? |
|--------------|----------------|-------------|------------------------|
| LOM Tape Casting | Doctor blade 250–300 μm | Doctor blade 400–500 μm | **No** (dedicated blades required) |
| Green Tape Drying | 60°C/4hr | 60°C/6hr | **Yes** (same oven, extended time) |
| SPS Sintering | 1900°C/50MPa/5min | 1950°C/60MPa/8min | **No** (dedicated furnace run) |
| MXene EPD | 350°C/Ar/30–40min | 400°C/Ar/40–60min | **Partial** (same bath, different anneal) |
| BFRP VARTM | 175°C/2hr autoclave | 175°C/2hr autoclave | **Yes** (same autoclave, different mandrel) |
| Ultrasonic C-scan | 5MHz probe, 0.5% void limit | 5MHz probe, 0.3% void limit | **Yes** (same equipment, tighter threshold) |
| Eddy-Current Bearing Inspect | 500kHz probe | 500kHz probe | **Yes** (same equipment) |

---

## SUPPLY CHAIN DEPENDENCIES

| Component | Single Source Risk | Lead Time | Mitigation |
|-----------|-------------------|-----------|------------|
| ZrB₂-SiC Powder | Medium (3 suppliers: US, Japan, EU) | 8 weeks | Bulk procurement; 90-day safety stock |
| BFRP/Elium® Resin | Low (commercial composite market) | 4 weeks | Multi-source; 60-day safety stock |
| MXene Ti₃C₂Tₓ | High (single pilot plant) | 12 weeks | Domestic synthesis pilot (NIMS CO₂ route); price -60% expected by 2028 |
| Si₃N₄ Bearings | Medium (2 ceramic bearing suppliers) | 6 weeks | Dual-source; 60-day safety stock |

---

## RECOMMENDATIONS

1. **Standardize LAM-001 for vessels <10m:** No need for heavier laminates on smaller hulls; 4mm–5mm provides adequate buckling margin with lower mass penalty.
2. **Dedicate SPS furnace zones:** Reserve furnace zones for standard (1900°C) and heavy (1950°C) runs; avoid co-mingling to prevent thermal shock damage to standard laminates.
3. **Prototype LAM-004:** 3mm, 8-lamina laminate for micro-Tadpole variants (<2m, <100 kg); opens new market segment at 30% lower BOM cost.
4. **Implement digital twin:** Integrate LOM tape caster, SPS furnace, and VARTM autoclave into CSMPro digital twin for predictive quality and yield optimization.

---

*END OF COMPATIBILITY MATRIX 03 — HULL FABRICATION*
