# CLPS_PREPARE_PACKAGE — CONTRACTOR TIMs
## Technical Interchange Meetings & Contractor Engagement Strategy
**Document:** CSM-CLPS-TIM-002 | **Date:** August 2026  
**Cross-references:** [01_EXECUTIVE_SUMMARY.md](./01_EXECUTIVE_SUMMARY.md) | [04_FABRICATION.md](./04_FABRICATION.md) | [09_PRODUCTION.md](./09_PRODUCTION.md)

---

## 1. TIM STRATEGY AND OVERVIEW

Three parallel **Technical Interchange Meetings (TIMs)** with priority CLPS contractors who have near-term CDR/PDR gates. Each TIM: 90 minutes virtual, followed by demo article shipment for independent testing.

### Infusion Criteria

| Criterion | Threshold | Measurement |
|-----------|-----------|-------------|
| **Mass Savings** | >50% vs. baseline | Contractor scale, geometry |
| **Specific Energy Absorption** | >30% improvement | Contractor landing loads |
| **Integration Labor** | >50% reduction | ICD count, schedule |
| **Digital Twin Correlation** | <5% variance | Contractor FEA vs. test |
| **Schedule Risk** | No CDR slip | Contractor program assessment |
| **Cost** | <70% baseline recurring | Contractor procurement model |

**Decision Gate:** Contractor CDR/PDR — if criteria met, baseline LBFRP-001.

---

## 2. THE 9 CLPS CONTRACTORS

| # | Contractor | Lander | CLPS Task Order | Status | LOI Value |
|---|-----------|--------|-----------------|--------|-----------|
| 1 | **Intuitive Machines** | Nova-C (IM-3) | TO-19H | Active | $77M |
| 2 | **Firefly Aerospace** | Blue Ghost 2 | TO-19I | Active | $112M |
| 3 | **Astrobotic** | Griffin (VIPER) | TO-19G | Active | $250M |
| 4 | **Draper** | SERIES-2 | TO-19J | Active | $73M |
| 5 | **SpaceX** | Starship HLS | Future | Planning | TBD |
| 6 | **Blue Origin** | Blue Moon | Future | Planning | TBD |
| 7 | **Lockheed Martin** | Lunar Lander | Future | Planning | TBD |
| 8 | **Sierra Space** | Lunar Lander | Future | Planning | TBD |
| 9 | **ispace** | Lunar Lander | Future | Planning | TBD |

### Contractor Engagement Status

| Contractor | Email Sent | TIM Scheduled | Demo Article | Test Status |
|------------|------------|---------------|--------------|-------------|
| Intuitive Machines | ✅ | Week of Oct 12 | LEG-001 | ⏳ Pending |
| Firefly Aerospace | ✅ | Week of Oct 19 | PV-001 | ⏳ Pending |
| Astrobotic | ✅ | Week of Oct 26 | PA-001 | ⏳ Pending |
| Draper | ✅ | Month 10-11 | TBD | ⏳ Planned |
| SpaceX | ✅ | Month 10-11 | TBD | ⏳ Planned |
| Blue Origin | ✅ | Month 10-11 | TBD | ⏳ Planned |
| Lockheed Martin | ✅ | TBD | TBD | ⏳ Planned |
| Sierra Space | ✅ | TBD | TBD | ⏳ Planned |
| ispace | ✅ | TBD | TBD | ⏳ Planned |

---

## 3. PRIORITY TIM #1: INTUITIVE MACHINES — IM-3 (NOVA-C CLASS)

### Pain Points from IM-1
- Landing gear collapse (Al honeycomb crush core exceeded design limits)
- Propulsion valve anomaly (single-point failure)
- Lander tipped over on landing — degraded science return

### LBFRP-001 Value Proposition
- **Leg segment:** +40% specific energy absorption, 60% mass reduction
- **Monolithic leg:** No crush core, no bolted joints, no single-point failure
- **Integrated thermal management:** No separate MLI/heat pipes on legs
- **IM-3 payload mass margin:** LBFRP-001 saves ~200 kg structure

### Technical Data Package Customized
- Nova-C leg interface geometry (from public ICD + estimates)
- IM-3 payload mass margin analysis
- Nova-C vibration environment correlation

### Demo Article: LEG-001
- 1m instrumented lander leg segment
- Ship to: Intuitive Machines, Houston
- Contractor test: Static crush to 200% DLL, drop test if facility allows

---

## 4. PRIORITY TIM #2: FIREFLY AEROSPACE — BLUE GHOST 2

### Pain Points
- Far-side landing thermal extremes (no Earthshine, deep space cold)
- Precision landing requirements
- Payload volume constraints

### LBFRP-001 Value Proposition
- **Pressure vessel:** Integrated PGS thermal substrates = far-side survival
- **Monolithic tanks:** No COPV overwrap, no leak paths, mass savings
- **Payload adapter:** Integrated thermal paths = payload survival

### Technical Data Package Customized
- Blue Ghost 2 propulsion tank geometry (public data)
- Far-side thermal model: PGS spreading vs. current heat pipes
- Blue Ghost payload interface (standard CLPS ring)

### Demo Article: PV-001
- Quarter-section pressure vessel with PGS
- Ship to: Firefly Aerospace, Cedar Park
- Contractor test: Proof/burst, thermal vacuum with PGS active, radiation

---

## 5. PRIORITY TIM #3: ASTROBOTIC — GRIFFIN (VIPER ROVER)

### Pain Points
- VIPER 450kg on 500kg capacity = ZERO margin
- Lunar night survival for VIPER electronics
- Integration complexity for 450kg rover

### LBFRP-001 Value Proposition
- **Payload adapter:** 60% mass savings = 200+ kg margin for VIPER
- **Integrated radiation shielding:** VIPER electronics survival
- **Monolithic structure:** No ICD nightmares for 450kg rover integration

### Technical Data Package Customized
- Griffin payload deck geometry (TO-19G ICD)
- VIPER thermal/radiation requirements mapping
- Griffin landing leg loads (public CLPS data)

### Demo Article: PA-001
- Full ring with bolt pattern, harness channels, thermal paths
- Ship to: Astrobotic, Pittsburgh
- Contractor test: Fit check to VIPER simulator, vibration, static load

---

## 6. TIM AGENDA (90 Minutes Standard)

| Time | Topic | Lead |
|------|-------|------|
| 0-10 | Introductions, CLPS context, LBFRP-001 overview | CSM |
| 10-25 | Material deep-dive: composition, properties, test results | CSM/Nematron |
| 25-40 | Digital twin methodology, quality evidence proposition | Nematron |
| 40-55 | Qualification path: proposed vs. AST requirements | AST |
| 55-70 | Novel material criteria: thermoplastic, nanodiamond, basalt, self-healing | AST/CSM |
| 70-80 | Distributed manufacturing: facility qualification | AST |
| 80-90 | Action items, data drop schedule, next consultation | Both |

---

## 7. AFP NETWORK ALLOCATION PER CONTRACTOR

| Lander Program | Primary Facility | Backup Facility | Annual Volume |
|----------------|------------------|-----------------|---------------|
| **Griffin (TO-19G)** | Partner #3 (Pittsburgh) | Partner #1 | 4 leg sets + 2 adapters |
| **IM-3 (TO-19H)** | Partner #2 (Houston) | Partner #1 | 4 leg sets + 2 tanks |
| **Blue Ghost 2 (TO-19I)** | Partner #2 (Austin) | Partner #3 | 4 leg sets + 2 tanks |
| **SERIES-2 (TO-19J)** | Partner #4 (Pittsburgh) | Partner #2 | 4 leg sets + 2 adapters |
| **Starship HLS** | Partner #5 (Boca Chica) | Partner #2 | TBD (Phase II) |
| **Blue Moon** | Partner #5 (Kent, WA) | Partner #3 | TBD (Phase II) |

---

## 8. TIM DELIVERABLES (Provided 1 Week Before Each TIM)

| Deliverable | Format | Description |
|-------------|--------|-------------|
| **TIM Briefing Slides** | PDF (30 slides) | Technical summary, lander models, infusion roadmap |
| **Technical Data Package** | PDF (50+ pages) | Full test data, material properties, FEA models |
| **Digital Twin Sample** | STEP + NASTRAN + CSV | Lander component geometry, tow paths, loads |
| **Mass/Cost Model** | Excel | Lander baseline vs. LBFRP-001 |
| **Qualification Plan** | PDF | 18-month path to flight-ready data package |
| **IP Summary** | PDF | Patent status, licensing terms, open source components |

---

## 9. POST-TIM ACTIONS

| Action | Owner | Timeline |
|--------|-------|----------|
| Finalize test protocol | Contractor | TIM + 1 week |
| Ship demo article | CSM Logistics | TIM + 2 weeks |
| Execute contractor test | Contractor | Ship + 30 days |
| TIM #2: Results Review | Both | Test complete + 2 weeks |
| Infusion decision | Contractor | Per their CDR/PDR |

---

## 10. CONTACT MATRIX

| CSM Role | Name | Contact |
|----------|------|---------|
| PI / Technical Lead | Jason Isaac Brodsky | jason.brodsky@carringtonstormmotors.com |
| Technical Lead (AI) | Nematron AI | nematron@carringtonstormmotors.com |
| AFP Fabrication | Partner AFP #1 | afp1@carringtonstormmotors.com |
| Logistics / Shipping | CSM Logistics | logistics@carringtonstormmotors.com |
| Contracts / SBIR | CSM Contracts | contracts@carringtonstormmotors.com |

---

## 11. CONTRACTOR TEST PROTOCOL TEMPLATE

Each contractor completes this for their independent test:

```
CONTRACTOR INDEPENDENT TEST PROTOCOL
Contractor: [Name] | Article: [LEG/PV/PA]-001 | Date: [Date]

TEST OBJECTIVES
[Contractor defines acceptance criteria relevant to their lander]

TEST PROCEDURES
[Contractor defines procedures — their standards, their methods]

INSTRUMENTATION
[Contractor specifies additional instrumentation]

ACCEPTANCE CRITERIA
[Contractor defines Go/No-Go thresholds]

DATA DELIVERABLES
[Contractor specifies format, timeline]

WITNESS REQUIREMENTS
[Contractor specifies CSM/FAA/NASA witness needs]
```

**CSM Commitment:** We adapt to YOUR protocol. Your facility. Your standards. Your witness. You keep all data.

---

*Document Control: CSM-CLPS-TIM-002 Rev A | Source: TIM_Package.md, Email_Template_2_Contractors.md*  
*Cross-references: [01_EXECUTIVE_SUMMARY.md](./01_EXECUTIVE_SUMMARY.md) | [04_FABRICATION.md](./04_FABRICATION.md) | [09_PRODUCTION.md](./09_PRODUCTION.md)*
