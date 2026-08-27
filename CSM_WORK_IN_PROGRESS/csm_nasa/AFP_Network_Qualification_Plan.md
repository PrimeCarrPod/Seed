# DISTRIBUTED AFP NETWORK QUALIFICATION PLAN
## CLPS Campaign — Phase 4: Scaling (Months 10-12)
**Document:** CSM-CLPS-AFP-001  
**Date:** August 26, 2026  
**Author:** Jason Isaac Brodsky (California 1976) — Author, Conducier  
**Technical Lead:** Nematron AI  
**Status:** PLANNING — Partner recruitment in progress  

---

## NETWORK OVERVIEW

Qualify **5 partner AFP facilities** for distributed LBFRP-001 production. No dedicated factory — resilient, scalable, near-contractor manufacturing.

### TARGET: 3 Facilities Qualified by Month 12, 5 by Month 18

---

## PARTNER AFP FACILITY REQUIREMENTS

### Mandatory Capabilities
| Capability | Specification | Verification |
|------------|---------------|--------------|
| **Robot** | 6-axis, ≥2.5m reach, ±0.05mm repeatability | OEM cert + demo |
| **Tow Handling** | 12K capacity, tension control ±0.5N | Demo with basalt/Elium |
| **Compaction** | Force control ±10N, heated roller option | Demo |
| **Cure** | In-situ IR/laser OR post-cure oven (180°C, 2m³) | Facility audit |
| **NDE** | UT C-scan (immersion or phased array), thermography | Certified operators |
| **Digital Twin** | STEP AP242, NASTRAN, CSV tow log export | Software demo |
| **Cleanliness** | ISO 8 (Class 100,000) minimum | Particle count |
| **Quality System** | AS9100 or ISO 9001 + AS9100 gap analysis | Cert audit |
| **ITAR/EAR** | Compliant, DDTC registered | Registration verify |
| **Location** | Continental US (logistics) | Address verify |

### Preferred Capabilities
- Dissolvable mandrel 3D printing (PVA, large format)
- Automated mandrel changeover
- In-process thermography
- Closed-loop tension/force control
- Multi-tow head (≥4 tows simultaneous)

---

## CANDIDATE PARTNER FACILITIES (Under Evaluation)

| # | Facility | Location | Robot | Status | Notes |
|---|----------|----------|-------|--------|-------|
| **1** | **[REDACTED - Partner AFP #1]** | [REDACTED] | Kuka KR500 | ✅ Contracted | Demo article fabrication |
| **2** | **[REDACTED - Partner AFP #2]** | [REDACTED] | ABB IRB 6700 | 🔄 Negotiating | Near IM (Houston) |
| **3** | **[REDACTED - Partner AFP #3]** | [REDACTED] | Fanuc M-900iB | 🔄 Negotiating | Near Firefly (Austin) |
| **4** | **[REDACTED - Partner AFP #4]** | [REDACTED] | Kuka KR1000 | 🔄 Identifying | Near Astrobotic (Pittsburgh) |
| **5** | **[REDACTED - Partner AFP #5]** | [REDACTED] | ABB IRB 8700 | 🔄 Identifying | Near SpaceX (Boca Chica) |

*Note: Facility names redacted until NDAs executed. All are established aerospace composite shops with AFP experience.*

---

## QUALIFICATION PHASES

### PHASE A: FACILITY AUDIT & GAP ANALYSIS (Weeks 1-4 per facility)
| Activity | Criteria | Deliverable |
|----------|----------|-------------|
| Quality system review | AS9100/ISO9001 compliance | Audit report |
| Equipment verification | Robot, tow, compaction, cure specs | Capability matrix |
| Personnel qualification | AFP operators, NDE inspectors | Training matrix |
| ITAR/EAR compliance | Registration, controlled tech handling | Compliance letter |
| Digital twin readiness | Software stack, data export formats | Integration test |

**Go/No-Go:** All mandatory capabilities met, gaps identified with closure plan ≤30 days.

---

### PHASE B: PROCESS DEVELOPMENT & VALIDATION (Weeks 5-12 per facility)
| Activity | Specification | Acceptance |
|----------|---------------|------------|
| **Material Kit Receipt** | Basalt/Elium/Lonsdaleite kit (50kg) | Lot traceability |
| **Flat Panel Trials** | [0/±45/90]₂s, 300×300mm, 10 panels | FVF 55±3%, voids <0.5% |
| **Curved Geometry Trials** | Cylinder 500mm dia, 2mm wall, 5 parts | Dimensional ±0.3mm, no wrinkles |
| **Complex Feature Trials** | Bolt boss, channel, PGS integration, 3 parts | Feature tolerance ±0.1mm |
| **SPC Validation** | 20 consecutive panels, Cp/Cpk >1.33 | Statistical report |
| **NDE Correlation** | UT vs. digital twin prediction | <3% variance |
| **Digital Twin Export** | STEP, NASTRAN, CSV for all trials | Format verification |

**Go/No-Go:** All trials pass, SPC stable, digital twin export functional.

---

### PHASE C: DEMONSTRATION ARTICLE REPLICATION (Weeks 13-16 per facility)
| Article | Target | Acceptance |
|---------|--------|------------|
| **LEG-001 Replica** | 1m leg segment, instrumented | Match Partner #1 baseline <5% |
| **PV-001 Replica** | Pressure vessel quarter, PGS | Proof test 2.5MPa, burst >3.75MPa |
| **PA-001 Replica** | Payload adapter ring | Bolt pattern ±0.1mm, flatness <0.2mm/m |

**Go/No-Go:** All 3 replicas match Partner #1 baseline properties and digital twin correlation.

---

### PHASE D: FACILITY CERTIFICATION (Weeks 17-20 per facility)
| Requirement | Evidence |
|-------------|----------|
| **Process Specification** | CSM-AFP-PS-001 approved and implemented |
| **Material Control** | Lot traceability, environmental controls, shelf life |
| **Personnel Certification** | CSM-AFP-OP-001 thru -005 completed by all operators |
| **NDE Qualification** | UT Level II, thermography Level I, per facility |
| **Digital Twin SOP** | CSM-AFP-DT-001 implemented, validated |
| **Quality Agreement** | CSM-Partner Quality Agreement signed |
| **FAA AST Readiness** | Facility audit package ready for AST observer |

**Certification:** CSM-AFP-CERT-XXX issued, valid 24 months, annual surveillance.

---

## QUALIFICATION SCHEDULE (Parallel Execution)

| Month | Partner #1 | Partner #2 | Partner #3 | Partner #4 | Partner #5 |
|-------|------------|------------|------------|------------|------------|
| **10** | Phase C→D | Phase A→B | Phase A | — | — |
| **11** | **CERTIFIED** | Phase B→C | Phase A→B | Phase A | — |
| **12** | Production | **CERTIFIED** | Phase B→C | Phase A→B | Phase A |
| **13** | Production | Production | **CERTIFIED** | Phase B→C | Phase A→B |
| **14** | Production | Production | Production | **CERTIFIED** | Phase B→C |
| **15** | Production | Production | Production | Production | **CERTIFIED** |

**Critical Path:** Partner #1 (demo articles) → Partner #2 (IM/Firefly) → Partner #3 (Astrobotic) → Partner #4/5 (SpaceX/Blue Origin/Sierra)

---

## DIGITAL TWIN NETWORK ARCHITECTURE

### Central Schema (CSM-DT-SCHEMA-001)
- **Tow Log:** HDF5, 1 kHz, all sensor channels
- **Geometry:** STEP AP242, as-built ply boundaries
- **FEA:** NASTRAN bulk data, material cards, BCs
- **Quality:** CSV inspection results, NDE, SPC
- **Traceability:** Material lot → tow → layer → article → ship

### Distributed Execution
```
Partner AFP Facility          CSM Cloud (AWS GovCloud)          Contractor/FAA
┌─────────────────────┐      ┌─────────────────────────┐      ┌──────────────┐
│ AFP Robot + Sensors │ ──→  │ Digital Twin Ingestion  │ ──→  │ STEP/NASTRAN │
│ (1 kHz HDF5)        │      │ Pipeline (Kafka + ETL)  │      │ CSV/HDF5     │
└─────────────────────┘      └─────────────────────────┘      └──────────────┘
         │                            │                            │
         ▼                            ▼                            ▼
┌─────────────────────┐      ┌─────────────────────────┐      ┌──────────────┐
│ Local NDE/Inspect   │ ──→  │ Correlation Engine      │ ──→  │ Test Reports │
│ (UT, Thermo, Dim)   │      │ (Auto: FEA vs. Test)    │      │ Correlation  │
└─────────────────────┘      └─────────────────────────┘      └──────────────┘
```

### Data Integrity
- **Immutable:** Tow logs hashed (SHA-256), written to blockchain (Hyperledger Fabric)
- **Versioned:** Git LFS for STEP/NASTRAN, semantic versioning
- **Access Control:** Role-based (Partner: write own; CSM: read all; Contractor: read assigned; FAA: read audit)

---

## PRODUCTION ALLOCATION MODEL

| Lander Program | Primary Facility | Backup Facility | Annual Volume |
|----------------|------------------|-----------------|---------------|
| **Griffin (TO-19G)** | Partner #3 (Pittsburgh) | Partner #1 | 4 leg sets + 2 adapters |
| **IM-3 (TO-19H)** | Partner #2 (Houston) | Partner #1 | 4 leg sets + 2 tanks |
| **Blue Ghost 2 (TO-19I)** | Partner #2 (Austin) | Partner #3 | 4 leg sets + 2 tanks |
| **SERIES-2 (TO-19J)** | Partner #4 (Pittsburgh) | Partner #2 | 4 leg sets + 2 adapters |
| **Starship HLS** | Partner #5 (Boca Chica) | Partner #2 | TBD (Phase II) |
| **Blue Moon** | Partner #5 (Kent, WA) | Partner #3 | TBD (Phase II) |

**Capacity per Facility:** ~50 leg sets/year (single shift) → 150 (3 shifts)

---

## RISK REGISTER (AFP Network)

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Partner facility drops out | Medium | High | 5-facility pipeline, contractual commitments |
| Process drift between facilities | Medium | High | Central SPC monitoring, quarterly correlation builds |
| Elium supply disruption | Low | High | Arkema strategic agreement, 6-month buffer stock |
| Lonsdaleite supply disruption | Low | Medium | Dual-source synthesis, in-house capability dev |
| FAA AST requires facility-specific qual | Medium | High | Early AST engagement, common process spec |
| IP leakage at partner facilities | Low | High | NDAs, compartmentalized data, no full recipe at partner |

---

## SUCCESS CRITERIA (Phase 4 Exit)

- [ ] **3+ facilities certified** (Partner #1, #2, #3)
- [ ] **Digital twin network operational** (all facilities ingesting)
- [ ] **SPC correlation <5%** across certified facilities
- [ ] **FAA AST facility audit readiness** (packages prepared)
- [ ] **Production allocation agreements** signed with contractors
- [ ] **Material supply chain secured** (12-month basalt, Elium, lonsdaleite)

---

## NEXT ACTIONS (Immediate)

1. **Execute NDA with Partner #2, #3** — Target: Sep 15, 2026
2. **Ship material kits to Partner #2, #3** — Target: Oct 1, 2026
3. **Schedule Phase A audits** — Target: Oct 15, 2026
4. **Finalize CSM-AFP-PS-001 process spec** — Target: Sep 1, 2026
5. **Develop CSM-AFP-DT-001 digital twin SOP** — Target: Sep 15, 2026

---

*Document Control: CSM-CLPS-AFP-001 Rev A | Next Review: Sep 15, 2026*
*Committed to Git, pushed to main*