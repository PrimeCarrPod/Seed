# Compatibility Matrix 06 — Material Supply Chain
## Cross-Vessel Raw Material & Component Supply Chain Interoperability
**Scope:** Tadpole-01 through Tadpole-17 | **Category:** Supply Chain | **Date:** 2026-08-11

---

## EXECUTIVE SUMMARY

This matrix evaluates the interoperability of raw material supply chains and component sourcing across all 17 Tadpole Class vessels. The analysis covers critical raw materials (ZrB₂, SiC, MXene, basalt fiber, CNT), subcomponents (ceramic bearings, GaN inverters, LiFePO₄ cells), and fabrication services (SPS sintering, VARTM layup, LOM tape casting). All vessels share a common material baseline, enabling pooled procurement and just-in-time inventory management across the fleet.

**Key Finding:** 70% of raw material tonnage is common across the fleet. The primary divergence occurs at the heavy-lift and deep-submergence classes (Tadpole-10, -12, -16, -17) where ZrB₂-SiC laminate thickness, MXene coating weight, and BFRP fairing area require 3–5× material volume per vessel, stressing single-source supply chains.

---

## RAW MATERIAL INVENTORY

| Material | Part Number | Unit | Standard Vessel | Heavy Vessel | Source |
|----------|-------------|------|-----------------|--------------|--------|
| ZrB₂ Powder | CSMFAB-MAT-001 | kg | 18–25 kg | 85–120 kg | `BOM-REGISTRY` |
| SiC Powder | CSMFAB-MAT-002 | kg | 12–17 kg | 55–78 kg | `BOM-REGISTRY` |
| MXene Ti₃C₂Tₓ | CSMFAB-MAT-003 | g | 150–420 g | 1,200–2,400 g | `BOM-REGISTRY` |
| Basalt Fiber | CSMFAB-MAT-004 | kg | 8–15 kg | 40–75 kg | `BOM-REGISTRY` |
| Elium® Resin | CSMFAB-MAT-005 | kg | 3–6 kg | 18–35 kg | `BOM-REGISTRY` |
| CNT Masterbatch | CSMFAB-MAT-006 | kg | 0.5–2 kg | 5–12 kg | `CSMFAB-P002` |
| LiFePO₄ Cells | CSMFAB-MAT-007 | ea | 48–96 cells | 384–720 cells | `Charlemagne Battery Arch` |
| Si₃N₄ Bearings | CSMFAB-MAT-008 | ea | 2–4 | 6–8 | `CSMFAB-P001` |
| GaN FET Modules | CSMFAB-MAT-009 | ea | 2–4 | 8–12 | `CSMFAB0113` |

---

## VESSEL-BY-VESSEL MATERIAL DEMAND

| Vessel | ZrB₂-SiC | BFRP/Elium® | MXene | LiFePO₄ Cells | Si₃N₄ Bearings | GaN FETs | Supply Chain Rating |
|--------|----------|-------------|-------|---------------|----------------|----------|-------------------|
| Tadpole-01 | 22 kg | 12 kg | 150 g | 48 | 2 | 2 | **A** |
| Tadpole-02 | 22 kg | 12 kg | 150 g | 48 | 2 | 2 | **A** |
| Tadpole-03 | 28 kg | 18 kg | 180 g | 96 | 2 | 2 | **A** |
| Tadpole-04 | 28 kg | 18 kg | 180 g | 96 | 2 | 2 | **A** |
| Tadpole-05 | 22 kg | 12 kg | 150 g | 48 | 2 | 2 | **A** |
| Tadpole-06 | 22 kg | 12 kg | 150 g | 48 | 2 | 2 | **A** |
| Tadpole-07 | 28 kg | 18 kg | 180 g | 96 | 2 | 2 | **A** |
| Tadpole-08 | 28 kg | 22 kg | 240 g | 96 | 2 | 2 | **B** |
| Tadpole-09 | 22 kg | 12 kg | 150 g | 48 | 2 | 2 | **A** |
| Tadpole-10 | 35 kg | 28 kg | 300 g | 192 | 4 | 4 | **B** |
| Tadpole-11 | 22 kg | 12 kg | 150 g | 48 | 2 | 2 | **A** |
| Tadpole-12 | 35 kg | 28 kg | 300 g | 192 | 4 | 4 | **B** |
| Tadpole-13 | 22 kg | 12 kg | 150 g | 48 | 2 | 2 | **A** |
| Tadpole-14 | 28 kg | 18 kg | 180 g | 96 | 2 | 2 | **A** |
| Tadpole-15 | 22 kg | 12 kg | 150 g | 48 | 2 | 2 | **A** |
| Tadpole-16 | 95 kg | 55 kg | 1,200 g | 384 | 6 | 6 | **C** |
| Tadpole-17 | 140 kg | 85 kg | 2,400 g | 720 | 8 | 8 | **C** |

**Legend:**
- **A — Direct Fit:** Material demand within standard procurement batch size (50–100 units).
- **B — Minor Mod:** Material demand 2–3× standard batch; requires extended lead time or batch consolidation.
- **C — Redesign Required:** Material demand 5–10× standard batch; requires dedicated procurement run or supplier expansion.
- **D — Incompatible:** Material grade or specification incompatible.

---

## SUPPLY CHAIN INTERDEPENDENCIES

### ZrB₂-SiC UHTC Supply Chain
- **Single-source risk:** Medium. Three qualified suppliers (US: Ceramatec; Japan: NIMS CO₂ route pilot; EU: CeramTec). 2026 price: $350/kg.
- **Pooled procurement strategy:** Aggregate Tadpole fleet demand (ZrB₂+SiC combined) for annual blanket order:
  - Standard class (15 vessels): 420 kg ZrB₂ + 280 kg SiC = 700 kg total.
  - Heavy class (2 vessels): 235 kg ZrB₂ + 155 kg SiC = 390 kg total.
  - Fleet total: 1,090 kg/year → 2.2× standard batch size; qualifies for 8% volume discount.
- **Mitigation:** Domestic synthesis pilot (NIMS CO₂ route) targets $120/kg ZrB₂ by 2028; reduces single-source risk by 60%.

### MXene Ti₃C₂Tₓ Supply Chain
- **Single-source risk:** Very High. Single pilot plant (Drexel Nanomaterials / etch-and-squeeze method). 2026 price: $2,000/kg.
- **Pooled procurement strategy:** Aggregate MXene demand across fleet: 5.5 kg/year.
- **Mitigation:** Tile pattern minimizes usage (45–80 μm discontinuous); price projected -60% by 2028 as BYK-Gardner and LG Chem enter market. In-house electrophoretic deposition line reduces wastage from 35% (spray) to 8% (EPD).

### LiFePO₄ Cell Supply Chain
- **Single-source risk:** Medium. Two qualified suppliers (BYD, CALB). 2026 price: $12/cell (3.2V 100Ah).
- **Pooled procurement strategy:** Aggregate cell demand across fleet:
  - Standard class: 1,152 cells/year.
  - Heavy class: 1,104 cells/year.
  - Fleet total: 2,256 cells/year → 4.5× standard batch; qualifies for 12% volume discount.
- **Mitigation:** 90-day safety stock; dual-source qualification ongoing with SVOLT.

### Si₃N₄ Ceramic Bearing Supply Chain
- **Single-source risk:** Medium. Two qualified suppliers (SKF, CeramTec). 2026 price: $320/unit (P0-01 grade).
- **Pooled procurement strategy:** Aggregate bearing demand: 38 units/year.
- **Mitigation:** 60-day safety stock; dual-source qualification ongoing with Tsubaki Nakashima.

---

## FABRICATION SERVICE DEPENDENCIES

| Service | Capacity | Fleet Demand | Utilization | Risk | Mitigation |
|---------|----------|--------------|-------------|------|------------|
| SPS Sintering | 8 runs/week | 3.2 runs/week | 40% | Low | Shared regional facility; 2-week queue |
| LOM Tape Casting | 6 panels/week | 2.4 panels/week | 40% | Low | In-house line (1m×2m); 1-week queue |
| VARTM Autoclave | 10 layups/week | 4.0 layups/week | 40% | Low | In-house 3m diameter; 1-week queue |
| CNT Extrusion | 500m/week | 180m/week | 36% | Low | In-house twin-screw; no queue |
| BFRP 3D Printing | 40kg/week | 18kg/week | 45% | Low | In-house FDM; 3-day queue |

---

## RECOMMENDATIONS

1. **Implement pooled procurement:** Centralize all Tadpole fleet material purchasing through CSMPro procurement hub; achieve 8–12% volume discount across ZrB₂, LiFePO₄, and Si₃N₄.
2. **Dual-source MXene:** Qualify second MXene supplier (LG Chem) by Q4 2026; reduce single-source risk from Very High to Medium.
3. **In-house CNT extrusion:** Expand twin-screw extruder capacity to 1,000m/week; eliminates 36% external dependency.
4. **Strategic stockpile:** Maintain 90-day safety stock on ZrB₂, MXene, and LiFePO₄; 60-day on Si₃N₄ and GaN FETs.
5. **Domestic ZrB₂ pilot:** Accelerate NIMS CO₂ route pilot to production by Q2 2027; target $120/kg ZrB₂ with domestic supply chain.

---

*END OF COMPATIBILITY MATRIX 06 — MATERIAL SUPPLY CHAIN*
