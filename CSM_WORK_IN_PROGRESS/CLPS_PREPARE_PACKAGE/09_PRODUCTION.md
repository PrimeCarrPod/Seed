# CLPS_PREPARE_PACKAGE — PRODUCTION
## Production Contracts, AFP Network & Supply Chain
**Document:** CSM-CLPS-PRO-001 | **Date:** August 2026  
**Cross-references:** [04_FABRICATION.md](./04_FABRICATION.md) | [06_CONTRACTOR_TIMS.md](./06_CONTRACTOR_TIMS.md) | [08_FUNDING.md](./08_FUNDING.md)

---

## 1. PRODUCTION CONTRACTS OVERVIEW

| Attribute | Value |
|-----------|-------|
| **Total Contracts** | 6 |
| **Lander Sets** | 18 |
| **Total Value** | $99,000,000 |
| **Average per Set** | $5,500,000 |
| **Status** | LOIs in progress |

### Contract Breakdown

| # | Contractor | Lander | Task Order | Sets | Value | Status |
|---|-----------|--------|------------|------|-------|--------|
| 1 | Astrobotic | Griffin | TO-19G | 4 | $22M | LOI |
| 2 | Intuitive Machines | IM-3 | TO-19H | 4 | $22M | LOI |
| 3 | Firefly Aerospace | Blue Ghost 2 | TO-19I | 4 | $22M | LOI |
| 4 | Draper | SERIES-2 | TO-19J | 4 | $22M | LOI |
| 5 | SpaceX | Starship HLS | Future | 2 | $6M | Planned |
| 6 | Blue Origin | Blue Moon | Future | 2 | $5M | Planned |

---

## 2. AFP NETWORK

### Network Overview

| Attribute | Value |
|-----------|-------|
| **Total Facilities** | 5 |
| **Target Qualified by Month 12** | 3 |
| **Target Qualified by Month 18** | 5 |
| **Capacity per Facility (single shift)** | ~50 leg sets/year |
| **Capacity per Facility (3 shifts)** | ~150 leg sets/year |
| **Total Network Capacity** | 750 sets/year |

### Facility Details

| # | Facility | Location | Robot | Status | Primary Contractor |
|---|----------|----------|-------|--------|-------------------|
| **1** | Partner AFP #1 | Pacific Northwest | Kuka KR500 | ✅ Contracted | All (backup) |
| **2** | Partner AFP #2 | Near Houston | ABB IRB 6700 | 🔄 Negotiating | Intuitive Machines |
| **3** | Partner AFP #3 | Near Austin | Fanuc M-900iB | 🔄 Negotiating | Firefly, Astrobotic |
| **4** | Partner AFP #4 | Near Pittsburgh | Kuka KR1000 | 🔄 Identifying | Astrobotic, Draper |
| **5** | Partner AFP #5 | Near Boca Chica | ABB IRB 8700 | 🔄 Identifying | SpaceX, Blue Origin |

### Facility Requirements

| Capability | Specification | Verification |
|------------|---------------|--------------|
| **Robot** | 6-axis, ≥2.5m reach, ±0.05mm repeatability | OEM cert + demo |
| **Tow Handling** | 12K capacity, tension control ±0.5N | Demo with basalt/Elium |
| **Compaction** | Force control ±10N, heated roller option | Demo |
| **Cure** | In-situ IR/laser OR post-cure oven (180°C, 2m³) | Facility audit |
| **NDE** | UT C-scan, thermography | Certified operators |
| **Digital Twin** | STEP AP242, NASTRAN, CSV tow log export | Software demo |
| **Cleanliness** | ISO 8 (Class 100,000) minimum | Particle count |
| **Quality System** | AS9100 or ISO 9001 + gap analysis | Cert audit |
| **ITAR/EAR** | Compliant, DDTC registered | Registration verify |

---

## 3. DELIVERY SCHEDULE

| Month | Activity | Articles | Destination |
|-------|----------|----------|-------------|
| 1-3 | Demo articles (Phase 1) | 3 articles | 3 contractors |
| 7-8 | Round 2 articles (Phase 3) | 3+ articles | Contractors |
| 13-15 | Full-scale production (Phase 5) | Flight articles | Griffin, IM-3 |
| 14-16 | Recurring production | Monthly delivery | All baselined |
| 18 | First flight hardware ships | Flight sets | Integration |

### Production Allocation Model

| Lander Program | Primary Facility | Backup Facility | Annual Volume |
|----------------|------------------|-----------------|---------------|
| **Griffin (TO-19G)** | Partner #3 (Pittsburgh) | Partner #1 | 4 leg sets + 2 adapters |
| **IM-3 (TO-19H)** | Partner #2 (Houston) | Partner #1 | 4 leg sets + 2 tanks |
| **Blue Ghost 2 (TO-19I)** | Partner #2 (Austin) | Partner #3 | 4 leg sets + 2 tanks |
| **SERIES-2 (TO-19J)** | Partner #4 (Pittsburgh) | Partner #2 | 4 leg sets + 2 adapters |
| **Starship HLS** | Partner #5 (Boca Chica) | Partner #2 | TBD |
| **Blue Moon** | Partner #5 (Kent, WA) | Partner #3 | TBD |

---

## 4. SUPPLY CHAIN MANAGEMENT

### Raw Materials

| Material | Supplier | Lead Time | Buffer Stock | Risk |
|----------|----------|-----------|--------------|------|
| **Basalt fiber 12K tow** | Kamenny Vek (Russia) / domestic alternative | 8-12 weeks | 6 months | Medium (geopolitical) |
| **Elium 188 O resin** | Arkema (France/US) | 4-6 weeks | 6 months | Low (strategic agreement) |
| **Lonsdaleite nanodiamonds** | In-house synthesis + dual source | 2-4 weeks | 3 months | Low (dual-source) |
| **Pyrolytic graphite substrates** | Domestic supplier | 4-8 weeks | 3 months | Low |
| **Dissolvable mandrel (PVA)** | Multiple suppliers | 2-4 weeks | 1 month | Very low |
| **Strain gauges, thermocouples** | Multiple suppliers | 2-4 weeks | 1 month | Very low |

### Supply Chain Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Elium supply disruption | Low | High | Arkema strategic agreement, 6-month buffer stock |
| Lonsdaleite supply disruption | Low | Medium | Dual-source synthesis, in-house capability dev |
| Basalt fiber supply disruption | Medium | High | Qualify domestic alternative, 6-month buffer |
| Partner facility dropout | Medium | High | 5-facility pipeline, contractual commitments |
| Process drift between facilities | Medium | High | Central SPC monitoring, quarterly correlation builds |

---

## 5. QUALITY SYSTEM (AS9100)

### Quality Agreement Requirements
- **Process Specification:** CSM-AFP-PS-001 approved and implemented
- **Material Control:** Lot traceability, environmental controls, shelf life
- **Personnel Certification:** CSM-AFP-OP-001 thru -005 completed by all operators
- **NDE Qualification:** UT Level II, thermography Level I, per facility
- **Digital Twin SOP:** CSM-AFP-DT-001 implemented, validated
- **Quality Agreement:** CSM-Partner Quality Agreement signed
- **FAA AST Readiness:** Facility audit package ready for AST observer

### Certification
- **CSM-AFP-CERT-XXX** issued, valid 24 months
- Annual surveillance audits
- Quarterly SPC correlation builds across facilities

---

## 6. DIGITAL TWIN NETWORK ARCHITECTURE

### Central Schema (CSM-DT-SCHEMA-001)
- **Tow Log:** HDF5, 1 kHz, all sensor channels
- **Geometry:** STEP AP242, as-built ply boundaries
- **FEA:** NASTRAN bulk data, material cards, BCs
- **Quality:** CSV inspection results, NDE, SPC
- **Traceability:** Material lot → tow → layer → article → ship

### Data Integrity
- **Immutable:** Tow logs hashed (SHA-256), written to blockchain (Hyperledger Fabric)
- **Versioned:** Git LFS for STEP/NASTRAN, semantic versioning
- **Access Control:** Role-based (Partner: write own; CSM: read all; Contractor: read assigned; FAA: read audit)

---

## 7. PRODUCTION READINESS TIMELINE

| Month | Milestone | Status |
|-------|-----------|--------|
| 1-3 | Demo articles fabricated | ✅ In progress |
| 4-6 | Contractor TIMs, independent tests | ⏳ Planned |
| 7-9 | First CLPS lander baselines LBFRP-001 | ⏳ Planned |
| 10-12 | 3+ AFP facilities qualified | ⏳ Planned |
| 13-15 | Full-scale production campaign | ⏳ Planned |
| 14-16 | Recurring production (monthly delivery) | ⏳ Planned |
| 18 | First flight hardware ships for integration | ⏳ Planned |

---

## 8. SUCCESS CRITERIA (Phase 4 Exit)

- [ ] **3+ facilities certified** (Partner #1, #2, #3)
- [ ] **Digital twin network operational** (all facilities ingesting)
- [ ] **SPC correlation <5%** across certified facilities
- [ ] **FAA AST facility audit readiness** (packages prepared)
- [ ] **Production allocation agreements** signed with contractors
- [ ] **Material supply chain secured** (12-month basalt, Elium, lonsdaleite)

---

*Document Control: CSM-CLPS-PRO-001 Rev A | Source: AFP_Network_Qualification_Plan.md, 18_Month_Execution_Timeline.md*  
*Cross-references: [04_FABRICATION.md](./04_FABRICATION.md) | [06_CONTRACTOR_TIMS.md](./06_CONTRACTOR_TIMS.md) | [08_FUNDING.md](./08_FUNDING.md)*
