## 1. Full Document Traceability Matrix

### 1.1 Complete Requirements Traceability (All Sources → DOC-13 Chapters)

| Req ID | Source Document | Source Section | Requirement | DOC-13 Chapter(s) | Verification Method |
|--------|-----------------|----------------|-------------|-------------------|---------------------|
| **CSMFAB078-A Edition Requirements** |
| REQ-E-01 | CSMFAB078-A | §3.1.1 | 8 editions defined | 02, 10, 128 | Edition matrix |
| REQ-E-02 | CSMFAB078-A | §3.1.2 | 12-zone LES | 38, 39, 95 | Tension calibration |
| REQ-E-03 | CSMFAB078-A | §3.1.3 | Morphology factor αₑ | 05, 06, 38 | Calculation |
| REQ-E-04 | CSMFAB078-A | §3.1.4 | Mass ratio Mₑ/M_ref | 84, 85, 86 | Gravimetric |
| REQ-E-05 | CSMFAB078-A | §3.1.5 | CoG shift limits | 87 | Force plate |
| REQ-E-06 | CSMFAB078-A | §3.2.1 | Panel count scaling | 11, 28 | Pattern count |
| REQ-E-07 | CSMFAB078-A | §3.2.2 | Tile count scaling | 17, 18, 77 | Tile manifest |
| REQ-E-08 | CSMFAB078-A | §3.3 | LES calibration | 38, 95 | Tension verify |
| REQ-E-09 | CSMFAB078-A | §3.4 | Mobility index | 74, 75, 76, 78 | ROM + MI test |
| REQ-E-10 | CSMFAB078-A | §3.5 | Edition transitions | 129, 130 | Transition test |
| **CSMFAB078 Main System Requirements** |
| REQ-S-01 | CSMFAB078 Main | §2 | Mission profiles | 101 | Mission sim |
| REQ-S-02 | CSMFAB078 Main | §4 | 12-layer AIMES stack | 17, 18, 19 | Layer-by-layer |
| REQ-S-03 | CSMFAB078 Main | §5 | Performance targets | 05, 06, 74 | Test + analysis |
| REQ-S-04 | CSMFAB078 Main | §6 | Maintenance concept | 108, 109 | Schedule + test |
| **CSMFAB078-B Threat Protection** |
| REQ-T-01 | CSMFAB078-B | §3.1 | Ballistic NIJ IV | 17 (L2/L7), 118 | V₅₀ test |
| REQ-T-02 | CSMFAB078-B | §3.4 | Thermal <58°C | 64, 65, 66 | ASTM F2700 |
| REQ-T-03 | CSMFAB078-B | §3.5 | EMI 58 dB @ 1 GHz | 55, 56, 57, 58 | MIL-STD-461G |
| REQ-T-04 | CSMFAB078-B | §3.6 | Directed energy | 68 | Laser/HPM test |
| REQ-T-05 | CSMFAB078-B | §4 | Quality gates | 118-127 | Gate review |
| **DOC-01 System Architecture** |
| REQ-D1-01 | DOC-01 | §7 | Standards compliance | 07, 90, 105 | Audit |
| REQ-D1-02 | DOC-01 | §9.1 | Mass budget | 84, 85 | Gravimetric |
| REQ-D1-03 | DOC-01 | §9.3 | CoG analysis | 87 | Force plate |
| **DOC-02 Historical Context** |
| REQ-D2-01 | DOC-02 | §2-6 | Historical authenticity | 03, 25, 26, 45, 46 | PFS + CIETA |
| **DOC-04 Geometric Patterns** |
| REQ-D4-01 | DOC-04 | §3 | Pattern system | 11, 25, 26, 27, 28 | Alcega/Garsault |
| **DOC-05 Structural Framework** |
| REQ-D5-01 | DOC-05 | §3-4 | Chassis + LES | 34-38 | FEA + test |
| **DOC-06 Protective Layers** |
| REQ-D6-01 | DOC-06 | §3-4 | Thermal/EMI/ballistic | 17, 55-68 | Test |
| **DOC-07 Textile Engineering** |
| REQ-D7-01 | DOC-07 | §3-4 | Stitch/seam specs | 45-48, 119 | ASTM D1683 |
| **DOC-09 QA Protocol** |
| REQ-D9-01 | DOC-09 | All | Test procedures | 118-127 | Gate review |
| **DOC-10 Operations** |
| REQ-D10-01 | DOC-10 | §4 | Don/doff/verify | 93, 94, 95 | Time trial |
| **DOC-11/12 Baseline Editions** |
| REQ-D11-01 | DOC-11 | Piece 03 | RM-TS baseline | 02, 05, 128 | Comparison |
| REQ-D12-01 | DOC-12 | Piece 03 | RM-TG baseline | 128, 129 | Comparison |
| **MAT-01 Silk** |
| REQ-M1-01 | MAT-01 | §2-4 | Silk properties | 17 (L1), 45-48 | Material test |
| **MAT-02 Baleen/Steel** |
| REQ-M2-01 | MAT-02 | §3-6 | Chassis materials | 34-37 | Material test |
| **MAT-03 Protective Materials** |
| REQ-M3-01 | MAT-03 | §3.1-3.5 | Ceramic/MXene/STF | 17, 18, 55-58, 65 | Material test |
| **SYNTH-01 Unified Theory** |
| REQ-SY1-01 | SYNTH-01 | §2, §4 | EMI/Mobility models | 55, 74, 78 | Model validation |
| **SYNTH-02 AIMES Mapping** |
| REQ-SY2-01 | SYNTH-02 | §2 | Layer mapping | 17, 18, 19, 20 | Traceability |
| **SYNTH-03 Drafting Kernels** |
| REQ-SY3-01 | SYNTH-03 | §2-4 | Pattern algorithms | 25, 26, 27, 45, 46 | Algorithm test |
| **DRAFT-01 Alcega** |
| REQ-DF1-01 | DRAFT-01 | §4-5 | Developable surfaces | 11, 25 | Geometry test |
| **DRAFT-02 Garsault** |
| REQ-DF2-01 | DRAFT-02 | §3-4 | Proportional scaling | 11, 26 | Scaling test |
| **DRAFT-03 Pleating** |
| REQ-DF3-01 | DRAFT-03 | §3 | Pleating kernels | 45, 46, 47, 48 | Pleat test |
| **DRAFT-04 Farthingale** | DRAFT-04 | — | N/A (male edition) | — | — |
| **DRAFT-05 Zero-Waste** |
| REQ-DF5-01 | DRAFT-05 | §5 | Nesting optimizer | 11, 27 | η ≥ 0.85 |

### 1.2 Research Document Traceability

| Research Doc | Section | DOC-13 Application | Chapter |
|--------------|---------|-------------------|---------|
| Historical Dress Construction | §2.1-2.2 | Silk fibroin/sericin | MAT-01, 17 |
| | §3 | CIETA typology | 17 (L1, L3, L4), 55 |
| | §4.1 | Alcega surfaces | 25, DRAFT-01 |
| | §4.2 | Garsault scaling | 26, DRAFT-02 |
| | §5.1 | Baleen mechanics | 35, MAT-02 |
| | §5.2 | Eyelet stress | 37 |
| | §6.1 | SPI, backstitch | 45-48 |
| | §6.2 | Cartridge pleating | 46, DRAFT-03 |
| Advanced Textile Stitching | §1 | ISO 4915 stitch classes | 45-48 |
| | §2 | ASTM D1683 seam strength | 119 |
| | §3.3 | Core-spun thread | 45-48 |
| | §3.4 | PTFE/aramid/steel threads | 17 (L11/L12 analogs) |
| | §4 | Needle thermodynamics | Manufacturing |
| | §5 | Hyperelastic fabric model | DRAFT-01, SYNTH-03 |

### 1.3 Standards Traceability (Complete)

| Standard | Clause | DOC-13 Chapter(s) | Application |
|----------|--------|-------------------|-------------|
| NIJ STD-0101.06 | Level IV | 17, 118 | Ballistic |
| MIL-STD-461G | RE102, RS103 | 55, 56, 57, 58 | EMI |
| IEEE 299 | — | 55 | Shielding effectiveness |
| ASTM F2371 | — | 17, 118 | Force trauma |
| ASTM C177 | — | 65 | Thermal conductivity |
| NFPA 1971 | §8.2 | 64, 65, 66 | Thermal protection |
| ASTM E903 | — | 17 (L1) | Spectral reflectance |
| IEC 61000-4-3 | — | 56, 57 | Radiated immunity |
| IEC 61000-4-9 | — | 17 (L11/L12) | Magnetic pulse |
| ISO 13934-1 | — | 35, 36, 108 | Tensile strength |
| ISO 15858 | — | 74, 93, 94 | Ergonomics |
| ASTM D1683 | — | 119 | Seam strength |
| ASTM D6193 | — | 45-48 | Stitch specification |
| ISO 4915 | — | 45-48 | Stitch classification |
| CIETA Typology | All | 17, 25, 45 | Weave verification |
| MIL-STD-810H | 501/502/507/514 | 108, 112 | Environmental |
| MIL-STD-973 | — | 102 | Configuration management |
| MIL-STD-1388 | — | 108, 112 | LSA |
| MIL-STD-2173 | — | 108, 111 | RCM |

### 1.4 Chapter-to-Source Mapping Summary

| DOC-13 Chapter | Primary Sources | Content Type |
|----------------|-----------------|--------------|
| 01 (Intro) | CSMFAB078-A §3.1, CSMFAB078 Main §2 | Executive summary |
| 02 (Overview) | CSMFAB078-A §3.1-3.5 | Edition parameters |
| 03 (Philosophy) | DOC-02, DRAFT-01, DRAFT-02 | Historical basis |
| 04 (X-refs) | SYNTH-02, CSMFAB078 Main | Layer mapping |
| 05 (Targets) | CSMFAB078 Main §5, CSMFAB078-B §3 | Performance reqs |
| 06 (Formulas) | CSMFAB078-A, DRAFT-01/02/03/05 | Scaling laws |
| 07 (Standards) | CSMFAB078-B, DOC-01/06/07 | Compliance matrix |
| 08-09 (Trace/Conf P01) | Framework/check_doc_quality | Quality gates |
| 10 (Edition ID) | CSMFAB078-A §3.1.5 | Identification |
| 11 (Pattern Sizing) | DRAFT-01/02/05, SYNTH-03 | Geometric kernels |
| 12-16 (X-refs/Formulas/Standards/Trace/Conf P02-P05) | Various | Per-piece gates |
| 17-19 (AIMES Stack) | SYNTH-02, MAT-03, CSMFAB078 Main §4 | Layer specs |
| 20-24 (X-refs/Formulas/Standards/Trace/Conf P03-P04) | Various | Per-piece gates |
| 25-33 (Pattern Kernels) | DRAFT-01/02/05, SYNTH-03 | Alcega, Garsault, nesting |
| 34-44 (Chassis) | DOC-05, MAT-02, SYNTH-02, CSMFAB078-A §3.3 | Structure + LES |
| 45-54 (Pleating) | DRAFT-03, SYNTH-03 | Watteau, cartridge, sleeve, knee |
| 55-63 (EMI) | SYNTH-01/02, MAT-03 | EMI architecture |
| 64-73 (Thermal) | SYNTH-02, MAT-03, DOC-06 | Thermal stack |
| 74-83 (Mobility) | SYNTH-01, DOC-01, CSMFAB078-A | Mobility model |
| 84-92 (Mass) | DOC-01 §9, MAT-01/02/03 | Mass budget |
| 93-98 (Ops) | DOC-10 §4 | Don/doff/verify |
| 99-107 (X-refs/Formulas/Standards/Trace/Conf P11-P12) | Various | Per-piece gates |
| 101-107 (Mission/Config) | CSMFAB078 Main §2, CSMFAB078-A §3.5 | Profiles + variants |
| 108-114 (Maintenance) | DOC-08/09, CSMFAB078 Main §6 | Intervals + wear |
| 115-117 (Full Trace) | All sources | Complete matrix |
| 118-127 (Quality Gates) | CSMFAB078-B §4, DOC-01 §7, Framework | Gate framework |
| 128-137 (Edition X/Transitions/Risk) | CSMFAB078-A §3.5, CSMFAB078 Main §6 | Comparison + risk |
| 138-147 (Risk/Conformance) | CSMFAB078 Main §6, DOC-01 §9 | Risk management |

---
