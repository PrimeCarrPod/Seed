## 1. Executive Overview

### 1.1 Scope and Purpose

This specification defines the complete Quality Assurance (QA) protocol for the Aegis Adaptive Exosuit (AIMES) 12-layer protective textile stack. The protocol integrates **Non-Destructive Testing (NDT)** modalities with **Destructive Sampling** per ANSI/ASQ Z1.4 and NIJ 0101.06, ensuring ≥99.9% confidence in threat protection across all 8 edition variants and 12 LES zones.

**QA Objectives:**
- **Detection Probability**: POD ≥ 0.99 for critical defects (voids >0.5mm, delamination >2mm)
- **False Call Rate**: FCR ≤ 0.01 per inspection
- **Sampling Efficiency**: n ≤ 5 per lot (AQL 1.0, S-3 inspection level)
- **Traceability**: 100% digital thread from material lot → test record → digital twin

### 1.2 AIMES 12-Layer Stack — QA Matrix

Per CSMFAB078 Main §4 and CSMFAB078-B §3,§5:

| Layer | Critical Defects | Primary NDT | Secondary NDT | Destructive Test | Frequency |
|-------|------------------|-------------|---------------|------------------|-----------|
| L1 Silk Base | Yarn break, contamination | Optical 5μm | IR thermography | Tensile ASTM D5035 | 100% |
| L2 Aramid Web | Fiber misalignment, voids | UT Phased Array | Shearography | Ballistic V50 | 5% lot |
| L3 Ceramic Tile | Crack, debond, missing tile | X-ray CT | UT Immersion | Blast arena | 2% lot |
| L4 Aerogel | Density variation, cracking | IR Flash | Terahertz | Thermal manikin | 5% lot |
| L5 Faraday Mesh | Wire break, continuity | Eddy Current | Megohmmeter | EMI shielding | 100% |
| L6 MOF Coating | Pinhole, thickness | Fluorescence | Ellipsometry | Chem/bio challenge | 5% lot |
| L7 Ablative | Delamination, void | UT Pulse-Echo | Laser shearography | DEW exposure | 2% lot |
| L8 Auxetic Foam | Cell collapse, density | X-ray CT | UT Through-Trans | Blast/frag V50 | 5% lot |
| L9 Hermetic | Leak path, pinhole | Helium leak | Pressure decay | Burst test | 100% |
| L10 MHD Gen | Winding short, insulation | Surge compare | Partial discharge | Electrical load | 100% |
| L11 Sensor Fiber | Fiber break, connector | OTDR | Brillouin | Distributed sensing | 100% |
| L12 Silk Cover | Cosmetic, seam integrity | Optical 5μm | Seam strength | Abrasion Martindale | 100% |

### 1.3 Edition-Specific QA Parameters

Per CSMFAB078-A §3.1 (8 editions):

| Edition | Lot Size | Sample Size (S-3) | Acceptance (Ac) | Rejection (Re) | Threat Class |
|---------|----------|-------------------|-----------------|----------------|--------------|
| RM-TS | 50 | 5 | 0 | 1 | NIJ Level IIIA+ |
| RM-TG | 80 | 5 | 0 | 1 | NIJ Level III+ |
| RM-SS | 40 | 3 | 0 | 1 | NIJ Level IIIA+ |
| RM-SG | 100 | 5 | 0 | 1 | NIJ Level III+ |
| RW-TS | 50 | 5 | 0 | 1 | NIJ Level IIIA+ |
| RW-TG | 80 | 5 | 0 | 1 | NIJ Level III+ |
| RW-SS | 40 | 3 | 0 | 1 | NIJ Level IIIA+ |
| RW-SG | 100 | 5 | 0 | 1 | NIJ Level III+ |

---
