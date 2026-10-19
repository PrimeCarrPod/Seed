## 5. Shelf-Life Management

### 5.1 Shelf-Life Categories (Per DOC-34 §7.2 + MIL-STD-2073)

| Material Category | Shelf Life | Storage Condition | Monitoring | Disposition |
|-------------------|------------|-------------------|------------|-------------|
| **MR Fluid** | 24 months | 15–25°C, dark, N₂ blanket | Viscosity @ 90 days | Reprocess or dispose |
| **Li-S Batteries** | 18 months (storage) | 0–10°C, 40–60% SOC | Impedance spectroscopy | Cycle test → reclassify |
| **MXene Ink** | 12 months | 2–8°C, amber vials | Rheology, zeta potential | Re-disperse or dispose |
| **Aerogel Blankets** | 60 months | <60% RH, vacuum-sealed | Thermal conductivity | Re-qualify |
| **Ceramic Tiles** | Indefinite | Desiccated, padded | Visual + ring test | 100% inspect → reuse |
| **Baleen (Synthetic)** | 36 months | 18–22°C, 45–55% RH | Tensile test | Re-extrude |
| **Dyneema SK99** | 120 months | UV-protected, dry | Tensile/creep | Re-spool |
| **Seal Elastomers** | 24 months | <25°C, O₂ <1% | Compression set | Replace |

### 5.2 Shelf-Life Extension Program (SLEP)

**SLEP Protocol (Per MIL-STD-1540 + DoDI 4151.22):**
```
SLEP EVALUATION (Trigger: 6 months before expiry):

1. SAMPLE SELECTION:
   - ANSI/ASQ Z1.4 Level II, AQL 1.0%
   - Minimum 3 lots per material type
   - Stratified by manufacture date

2. TEST MATRIX:
   | Material | Tests | Acceptance |
   |----------|-------|------------|
   | MR Fluid | Viscosity, yield stress, sedimentation | ±10% of spec |
   | Battery  | Capacity, impedance, thermal runaway | ≥90% rated |
   | MXene    | Conductivity, sheet resistance, dispersion | ±15% of spec |
   | Aerogel  | Thermal conductivity, density, hydrophobicity | ±5% of spec |
   | Elastomer| Compression set, tensile, TR-10 | MIL-R-83248 |

3. EXTENSION DECISION:
   - PASS all → Extend 12 months (max 2 extensions)
   - CONDITIONAL PASS → Extend 6 months + increased monitoring
   - FAIL → Dispose, trigger replacement procurement

4. DOCUMENTATION:
   - SLEP Report (per hub, per material)
   - Updated shelf-life labels
   - GLO database update
   - Quality notification to OEM
```

### 5.3 Disposition Criteria (End of Shelf Life)

| Condition | Action | Documentation |
|-----------|--------|---------------|
| **Serviceable (SLEP PASS)** | Return to stock, new expiry date | DD Form 1574, GLO update |
| **Serviceable (Conditional)** | Issue with waiver, track consumption | Waiver log, accelerated monitoring |
| **Unserviceable (Recoverable)** | Phoenix Protocol recovery line | Recovery ticket, yield report |
| **Unserviceable (Scrap)** | Demilitarize (classified) / Recycle | DD Form 1577, EPA manifest |

---
