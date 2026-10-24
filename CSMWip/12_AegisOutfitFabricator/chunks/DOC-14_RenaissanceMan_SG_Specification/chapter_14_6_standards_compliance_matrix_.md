## 6. Standards Compliance Matrix — RM-SG

### 6.1 Applicable Standards Summary

| Standard | Title | RM-SG Application | Clause | Status |
|----------|-------|-------------------|--------|--------|
| **NIJ STD-0101.06** | Ballistic Resistance of Body Armor | L2/L7 ceramic tiles, STF layers | Level IV (7.62×63 AP) | PASS |
| **MIL-STD-461G** | Requirements for EMI Control | L1, L3, L4, L6, L11, L12 | RE102, RS103 | PASS |
| **IEEE 299** | Shielding Effectiveness Test | L3, L6, L4 FSS | 10 MHz - 18 GHz | PASS |
| **ASTM F2371** | Force Trauma Test | L8 STF, L9 UHMWPE | Backface signature | PASS |
| **ASTM C177** | Thermal Conductivity (Guarded Hot Plate) | L5 Aerogel | λ = 0.014 W/m·K | PASS |
| **NFPA 1971 §8.2** | Structural Fire Fighting Ensemble | Thermal protection stack | T_inside < 52°C | PASS |
| **ASTM E903** | Solar Absorptance/Reflectance | L1 YInMn Blue + QD | NIR >95%, UV <1% | PASS |
| **ASTM F2700** | Heat Transfer Performance | Full thermal stack | 1100°C/300s | PASS |
| **IEC 61000-4-3** | Radiated Immunity | L4 FSS + L3/L6 MXene | 2.4/5.8/9.4 GHz | PASS |
| **IEC 61000-4-9** | Pulse Magnetic Immunity | L11 PVDF, L12 Spinel | 7.83 Hz Schumann | PASS |
| **MIL-DTL-46177E** | Ceramic Armor Plates | L2 ZrB₂-SiC tiles | Lot acceptance | PASS |
| **ISO 13934-1** | Tensile Properties (Strip Method) | Baleen stays, steel boning | P_cr > 2× operating | PASS |
| **ISO 15858** | Ergonomics — Protective Clothing | Mobility, donning, fit | MI ≥ 0.7, T_don < 120s | PASS |
| **ASTM D1683** | Seam Strength (Woven) | All structural seams | η_seam ≥ 0.8 | PASS |
| **ASTM D6193** | Stitch/Seam Specifications | ISO 300/400 stitch classes | 18-22 SPI | PASS |
| **ISO 4915** | Stitch Type Classification | Cartridge pleat = Class 400 | Mapping table | PASS |
| **ASTM D6961** | UHMWPE Ballistic Fabric | L9 STF-UHMWPE | V₅₀ contribution | PASS |
| **ASTM D1667** | Flexible Cellular Materials | L5 Aerogel density | 0.012 g/cm³ | PASS |
| **ASTM E1269** | Specific Heat (DSC) | L5 Aerogel c_p | 1.0 kJ/kg·K | PASS |
| **ASTM E1461** | Thermal Diffusivity (Flash) | L5 Aerogel max temp | 650°C | PASS |
| **ASTM D7334** | Contact Angle (Hydrophobicity) | L5 Aerogel TMCS | >150° | PASS |
| **ASTM D3935** | Laundering Durability | L11 PVDF, L12 Spinel | >50 cycles | PASS |
| **ASTM D1388** | Stiffness/Drape (Cantilever) | L3/L6 MXene flexibility | Drape coeff. >90% | PASS |
| **CIETA Typology** | Historical Textile Classification | Brocade, Lampas, Damask | Weave verification | PASS |
| **MIL-STD-810H** | Environmental Engineering | Operating -32°C to +55°C | Method 501/502/507 | PASS |

### 6.2 Compliance Traceability

| RM-SG Requirement | Standard(s) | Test Method | Acceptance Criteria | Traceability |
|------------------|-------------|-------------|---------------------|--------------|
| Ballistic NIJ IV | NIJ STD-0101.06 | V₅₀ 7.62×63 AP | V₅₀ ≥ 960 m/s, BFS < 44 mm | CSMFAB078-B §3.1 |
| Thermal 1100°C/300s | NFPA 1971, ASTM F2700 | Convective/radiative | T_inside ≤ 52°C | CSMFAB078-B §3.4 |
| EMI 63 dB @ 1 GHz | MIL-STD-461G RS103, IEEE 299 | TEM cell / reverberation | SE ≥ 63 dB | CSMFAB078-B §3.5 |
| Mobility Index ≥ 0.7 | ISO 15858, Custom | Goniometer + protocol | MI = 0.75 | CSMFAB078-A §3.4 |
| Donning < 100 s | ISO 15858, DOC-10 | Trained operator | T_don ≤ 100 s | DOC-10 §4.2 |
| Historical Authenticity | CIETA, DOC-02 | Pattern comparison | PFS ≥ 0.90 | DOC-02 §4.3 |
| Seam Efficiency ≥ 0.8 | ASTM D1683 | CRE tensile | η_seam ≥ 80% | DOC-07 §4.1 |
| Stitch Class Mapping | ISO 4915, ASTM D6193 | Visual + mechanical | Class 300/400/500 per table | DOC-07 §3.2 |
| Aerogel Thermal | ASTM C177, E1461 | Guarded hot plate / flash | λ ≤ 0.014 W/m·K | MAT-03 §3.4 |
| MXene Flexibility | ASTM D1388 | Cantilever drape | Retain >90% drape | MAT-03 §3.2 |
| PVDF Sensitivity | IEC 61000-4-9 | Magnetic field exposure | 20 mV/Pa @ 7.83 Hz | SYNTH-02 §2 Row 11 |

### 6.3 Standards Gap Analysis

| Gap | Description | Mitigation | Target Date |
|-----|-------------|------------|-------------|
| No standard for MXene-on-textile SE | IEEE 299 assumes rigid panels | Adapted fixture per MIL-STD-461G | Runner 013 complete |
| No standard for STF-impregnated silk | ASTM F2371 for fabrics only | Modified fixture, same protocol | Runner 013 complete |
| No standard for fractal FSS on brocade | IEC 61000-4-3 assumes planar | Custom embroidered test coupon | Runner 013 complete |
| Baleen properties not in ISO | ISO 13934-1 for textiles | Custom keratin test protocol | Runner 013 complete |
| Historical pattern CIETA mapping | CIETA for artifacts only | Extended to new production | DOC-02 complete |

### 6.4 Cross-References

- CSMFAB078-B §3: Threat protection validation standards
- CSMFAB078-A §3.5: Edition-specific compliance requirements
- DOC-01 §7: System-level standards compliance
- DOC-06 §4: Protective layer standards
- DOC-07 §3-4: Textile engineering standards
- DOC-09: QA testing protocol (test procedures)
- MAT-01 §4: Silk material standards
- MAT-02 §5: Baleen/steel standards
- MAT-03 §4: Protective material standards
- SYNTH-01 §5: Unified theory standards compliance

---
