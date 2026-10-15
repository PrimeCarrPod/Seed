## 7. Traceability Matrix — RM-SG (Piece 01 of 17)

### 7.1 Requirements Traceability (CSMFAB078-A §3.1 → DOC-14)

| Req ID | Source | Requirement | RM-SG Implementation | Verification | Doc Chapter |
|--------|--------|-------------|---------------------|--------------|-------------|
| REQ-001 | CSMFAB078-A §3.1.1 | 8 editions defined | RM-SG: H=155-170, C=105-115, W=95-105 | Edition matrix | Ch. 02, 117 |
| REQ-002 | CSMFAB078-A §3.1.2 | 12-zone LES | 12 zones, scaled tensions | Tension calibration | Ch. 38 |
| REQ-003 | CSMFAB078-A §3.1.3 | Morphology factor αₑ | αₑ = +0.08 | Calculation | Ch. 06 |
| REQ-004 | CSMFAB078-A §3.1.4 | Mass ratio Mₑ/M_ref | 1.05 | Gravimetric | Ch. 05, 75 |
| REQ-005 | CSMFAB078-A §3.2.1 | Panel count scaling | 30 panels | Pattern count | Ch. 28 |
| REQ-006 | CSMFAB078-A §3.2.2 | Tile count scaling | 210 primary, 340 backup | Tile manifest | Ch. 17 |
| REQ-007 | CSMFAB078 Main §4.1 | 12-layer AIMES stack | All 12 layers implemented | Layer-by-layer | Ch. 17-19 |
| REQ-008 | CSMFAB078 Main §4.2 | L1 Optical | YInMn Blue + QD | Spectral test | Ch. 17 |
| REQ-009 | CSMFAB078 Main §4.3 | L2/L7 Ceramic | ZrB₂-SiC 25/15 mm | Ballistic test | Ch. 17 |
| REQ-010 | CSMFAB078 Main §4.4 | L3/L6 EMI | MXene 30 µm dual | SE measurement | Ch. 55 |
| REQ-011 | CSMFAB078 Main §4.5 | L4 FSS | Minkowski fractal 12mm | S-parameters | Ch. 56 |
| REQ-012 | CSMFAB078 Main §4.5 | L5 Aerogel | 3 mm hydrophobic | Thermal test | Ch. 56 |
| REQ-013 | CSMFAB078 Main §4.6 | L8 STF Zone-selective | Z1-Z4, Z7-Z8 | Penetration test | Ch. 17 |
| REQ-014 | CSMFAB078 Main §4.7 | L9 UHMWPE | STF-UHMWPE 3-ply | V₅₀ contribution | Ch. 17 |
| REQ-015 | CSMFAB078 Main §4.8 | L10 Chassis | 24 baleen + 12 steel | Buckling test | Ch. 34-38 |
| REQ-016 | CSMFAB078 Main §4.9 | L11 Bio-acoustic | PVDF-TrFE 500 nm | Sensitivity test | Ch. 17 |
| REQ-017 | CSMFAB078 Main §4.10 | L12 Schumann | CoAl₂O₄ 10 µm | Absorption test | Ch. 17 |

### 7.2 Cross-Document Traceability

| DOC-14 Chapter | Source Document | Source Section | Content Traced |
|----------------|-----------------|----------------|----------------|
| Ch. 01 (Intro) | CSMFAB078-A | §3.1 | Edition definition |
| Ch. 02 (Overview) | CSMFAB078-A | §3.1-3.5 | Edition parameters |
| Ch. 03 (Philosophy) | DOC-02, DRAFT-01, DRAFT-02 | All | Historical basis |
| Ch. 04 (X-refs) | SYNTH-02, CSMFAB078 Main | §2, §4 | Layer mapping |
| Ch. 05 (Targets) | CSMFAB078 Main, CSMFAB078-B | §5, §3 | Performance reqs |
| Ch. 06 (Formulas) | CSMFAB078-A, DRAFT-01, 02, 03, 05 | All | Scaling laws |
| Ch. 07 (Standards) | CSMFAB078-B, DOC-01, DOC-06, DOC-07 | All | Compliance |
| Ch. 17-19 (Layers) | SYNTH-02, MAT-03 | §2, §3 | Layer specs |
| Ch. 25-28 (Pattern) | DRAFT-01, DRAFT-02, DRAFT-05 | All | Geometric kernels |
| Ch. 34-38 (Chassis) | DOC-05, MAT-02 | §3, §4 | Structural framework |
| Ch. 45-48 (Pleating) | DRAFT-03, SYNTH-03 | §3-4 | Pleating kernels |
| Ch. 55-59 (Thermal) | SYNTH-02, MAT-03, DOC-06 | §2, §3.4, §3 | Thermal stack |
| Ch. 65-74 (Mobility) | SYNTH-01, DOC-01, CSMFAB078-A | §4.3, §9.1, §3.4 | Mobility model |
| Ch. 75-83 (Mass) | DOC-01, MAT-01, MAT-02, MAT-03 | §9, All | Mass budget |
| Ch. 84-91 (Ops) | DOC-10 | §4 | Donning/doffing |
| Ch. 92-98 (Mission/Config) | CSMFAB078 Main §2, CSMFAB078-A §3.5 | | Profiles + variants |
| Ch. 99-108 (Maintenance) | DOC-08, DOC-09, CSMFAB078 Main §6 | | Intervals + wear |
| Ch. 109-116 (Quality Gates) | CSMFAB078-B §4, DOC-01 §7, Framework | | Gate framework |
| Ch. 117-124 (Edition X/Transitions) | CSMFAB078-A §3.5, CSMFAB078 Main §6 | | Comparison + transitions |
| Ch. 125-132 (Risk) | CSMFAB078 Main §6, DOC-01 §9 | | Risk management |

### 7.3 Research Document Traceability

| Research Doc | Section | RM-SG Application | Chapter |
|--------------|---------|-------------------|---------|
| Historical Dress Construction Analysis | §2.1-2.2 | Silk fibroin/sericin, degumming | MAT-01, Ch. 17 |
| | §3 | CIETA typology (Lampas, Brocatelle, Damask) | Ch. 17, 55 |
| | §4.1 | Alcega developable surfaces | Ch. 25, DRAFT-01 |
| | §4.2 | Garsault proportional scaling | Ch. 26, DRAFT-02 |
| | §5.1 | Baleen mechanics (E=4.2 GPa) | Ch. 35, MAT-02 |
| | §5.2 | Eyelet stress concentration | Ch. 37 |
| | §6.1 | SPI 18-22, backstitch | Ch. 45-48 |
| | §6.2 | Cartridge pleating S-curve | Ch. 46 |
| Advanced Textile Stitching & Automation | §1 | ISO 4915 stitch classes | Ch. 45-48 |
| | §2 | ASTM D1683 seam strength | Ch. 109 |
| | §3.3 | Core-spun thread (poly-cotton) | Ch. 45-48 |
| | §3.4 | PTFE fiberglass, aramid/steel | Ch. 17 (L11/L12 analogs) |
| | §4 | Needle thermodynamics | Manufacturing |
| | §5 | Hyperelastic fabric modeling | DRAFT-01, SYNTH-03 |

### 7.4 Standards Traceability

| Standard | Clause | RM-SG Chapter | Test Method |
|----------|--------|---------------|-------------|
| NIJ STD-0101.06 | Level IV | Ch. 17 (L2/L7), Ch. 109 | V₅₀, BFS |
| MIL-STD-461G | RE102, RS103 | Ch. 55, 56, 57, 58 | EMI chamber |
| IEEE 299 | — | Ch. 55 | Shielding effectiveness |
| ASTM F2371 | — | Ch. 17 (L8/L9), Ch. 109 | Force trauma |
| ASTM C177 | — | Ch. 56 | Thermal conductivity |
| NFPA 1971 | §8.2 | Ch. 55, 56, 57 | Heat transfer |
| ASTM E903 | — | Ch. 17 (L1) | Spectral reflectance |
| IEC 61000-4-3 | — | Ch. 56, 57 | Radiated immunity |
| IEC 61000-4-9 | — | Ch. 17 (L11/L12) | Magnetic pulse |
| ISO 13934-1 | — | Ch. 35, 36 | Tensile strength |
| ISO 15858 | — | Ch. 65, 84, 85 | Ergonomics |
| ASTM D1683 | — | Ch. 109 | Seam strength |
| ASTM D6193 | — | Ch. 45-48 | Stitch spec |
| ISO 4915 | — | Ch. 45-48 | Stitch class |
| CIETA | All | Ch. 17, 25, 45 | Weave verification |

### 7.5 Piece-Level Traceability (17-Piece Legacy)

| Piece | DOC-14 Chapters | Content Summary | Status |
|-------|-----------------|-----------------|--------|
| 01 | 01 | Executive summary | ✓ Migrated |
| 02 | 02, 03 | Edition overview, design philosophy | ✓ Migrated |
| 03 | 04, 05, 06, 07 | X-refs, targets, formulas, standards | ✓ Migrated |
| 04 | 08, 09 | Traceability piece 01, conformance | ✓ Migrated |
| 05 | 10, 11, 12, 13 | Edition ID, pattern sizing, X-refs, formulas | ✓ Migrated |
| 06 | 14, 15, 16 | Standards, traceability p02, conformance | ✓ Migrated |
| 07 | 17, 18, 19, 20 | AIMES stack, layer specs, interfaces, X-refs | ✓ Migrated |
| 08 | 21, 22, 23, 24 | Formulas, standards, traceability p03, conformance | ✓ Migrated |
| 09 | 25, 26, 27, 28, 29, 30, 31, 32, 33 | Pattern kernels (Alcega, Garsault, nesting, panel, X-refs, formulas, standards, trace p04, conformance) | ✓ Migrated |
| 10 | 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44 | Chassis, baleen, steel, MAX phase, LES, lacing, X-refs, formulas, standards, trace p05, conformance | ✓ Migrated |
| 11 | 45, 46, 47, 48, 49, 50, 51, 52, 53, 54 | Pleating kernels (Watteau, cartridge, sleeve, knee, drape, X-refs, formulas, standards, trace p06, conformance) | ✓ Migrated |
| 12 | 55, 56, 57, 58, 59, 60, 61, 62, 63, 64 | Thermal (overview, aerogel, model, comfort, DE, X-refs, formulas, standards, trace p07, conformance) | ✓ Migrated |
| 13 | 65, 66, 67, 68, 69, 70, 71, 72, 73, 74 | Mobility (overview, ROM, task, tile, LES, X-refs, formulas, standards, trace p08, conformance) | ✓ Migrated |
| 14 | 75, 76, 77, 78, 79, 80, 81, 82, 83 | Mass (budget, verification, scaling, CoG, X-refs, formulas, standards, trace p09, conformance) | ✓ Migrated |
| 15 | 84, 85, 86, 87, 88, 89, 90, 91 | Ops (donning, doffing, LES verify, X-refs, formulas, standards, trace p10, conformance) | ✓ Migrated |
| 16 | 92-108 | Extended: mission profiles, maintenance, traceability matrix, quality gates | ✓ Migrated |
| 17 | 109-132 | Extended: edition comparison, transitions, risk, conformance | ✓ Migrated |

---