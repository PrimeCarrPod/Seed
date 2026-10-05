# TECHNICAL INTERCHANGE MEETING (TIM) PACKAGE
## CLPS Contractor Engagement — Intuitive Machines, Firefly, Astrobotic
**Document:** CSM-CLPS-TIM-001  
**Date:** August 26, 2026  
**Author:** Jason Isaac Brodsky (California 1976) — Author, Conducier  
**Technical Lead:** Nematron AI  
**Status:** PREPARING — Target TIMs: October-November 2026  

---

## TIM OVERVIEW

Three parallel Technical Interchange Meetings with priority CLPS contractors who have near-term CDR/PDR gates. Each TIM: 90 minutes virtual, followed by demo article shipment for independent testing.

### TIM SCHEDULE TARGETS

| Contractor | Lander | Decision Gate | Target TIM | Demo Article |
|------------|--------|---------------|------------|--------------|
| **Intuitive Machines** | IM-3 (TO-19H) | CDR | Week of Oct 12, 2026 | LEG-001 (lander leg) |
| **Firefly Aerospace** | Blue Ghost 2 (TO-19I) | CDR | Week of Oct 19, 2026 | PV-001 (pressure vessel) |
| **Astrobotic** | Griffin (TO-19G) | CDR | Week of Oct 26, 2026 | PA-001 (payload adapter) |

---

## TIM AGENDA (90 Minutes Standard)

### 1. INTRODUCTIONS & CONTEXT (10 min)
- CSM team: Jason Brodsky (PI), Nematron AI (Technical)
- Contractor: Chief Engineer, Structures Lead, Materials Engineer
- Objective: Technical data exchange, infusion pathway alignment

### 2. LBFRP-001 TECHNICAL SUMMARY (20 min)
- Material architecture: Basalt + Elium + Lonsdaleite + PGS
- 8-environment test results (zero failures)
- Digital twin verification methodology
- Mass/cost models for YOUR lander architecture

### 3. DEMO ARTICLE REVIEW (15 min)
- Article specifics for your lander (LEG/PV/PA)
- Instrumentation, digital twin package
- Your test protocol input

### 4. INTEGRATION ELIMINATION DEEP DIVE (15 min)
- Monolithic AFP vs. your current bolted/subcontracted approach
- ICD reduction, schedule compression, risk elimination
- Your lander-specific integration hotspots

### 5. QUALIFICATION PATHWAY (15 min)
- FAA AST pre-application status
- B-basis allowables generation timeline
- Article qualification (full-scale) plan
- Your CDR/PDR data needs

### 6. NEXT STEPS & ACTION ITEMS (15 min)
- Test protocol finalization
- Demo article shipment date
- TIM #2 scheduling (post-test review)
- Infusion decision criteria

---

## CONTRACTOR-SPECIFIC PREPARATION

### INTUITIVE MACHINES — IM-3 (NOVA-C CLASS)
**Pain Points from IM-1:** Landing gear collapse (Al honeycomb), propulsion valve anomaly
**LBFRP-001 Value Prop:**
- Leg segment: +40% specific energy absorption, 60% mass reduction
- Monolithic leg = no crush core, no bolted joints, no single-point failure
- Integrated thermal management = no separate MLI/heat pipes on legs

**Technical Data Package Customized:**
- Nova-C leg interface geometry (from public ICD + estimates)
- IM-3 payload mass margin analysis (LBFRP-001 saves ~200 kg structure)
- Nova-C vibration environment correlation

**Demo Article:** LEG-001 (1m instrumented segment)
**Your Test:** Static crush to 200% DLL, drop test if facility allows

---

### FIREFLY AEROSPACE — BLUE GHOST 2
**Pain Points:** Far-side landing thermal extremes, precision landing, payload volume
**LBFRP-001 Value Prop:**
- Pressure vessel: Integrated PGS thermal substrates = far-side survival
- Monolithic tanks = no COPV overwrap, no leak paths, mass savings
- Payload adapter: Integrated thermal paths = payload survival

**Technical Data Package Customized:**
- Blue Ghost 2 propulsion tank geometry (public data)
- Far-side thermal model: PGS spreading vs. current heat pipes
- Blue Ghost payload interface (standard CLPS ring)

**Demo Article:** PV-001 (quarter-section with PGS)
**Your Test:** Proof/burst, thermal vacuum with PGS active, radiation

---

### ASTROBOTIC — GRIFFIN (VIPER ROVER)
**Pain Points:** VIPER 450kg on 500kg capacity = zero margin, lunar night survival
**LBFRP-001 Value Prop:**
- Payload adapter: 60% mass savings = 200+ kg margin for VIPER
- Integrated radiation shielding = VIPER electronics survival
- Monolithic structure = no ICD nightmares for 450kg rover integration

**Technical Data Package Customized:**
- Griffin payload deck geometry (TO-19G ICD)
- VIPER thermal/radiation requirements mapping
- Griffin landing leg loads (public CLPS data)

**Demo Article:** PA-001 (full ring with bolt pattern, harness channels, thermal paths)
**Your Test:** Fit check to VIPER simulator, vibration, static load

---

## TIM DELIVERABLES (Provided 1 Week Before Each TIM)

| Deliverable | Format | Description |
|-------------|--------|-------------|
| **TIM Briefing Slides** | PDF (30 slides) | Technical summary, your lander models, infusion roadmap |
| **Technical Data Package** | PDF (50+ pages) | Full test data, material properties, FEA models |
| **Digital Twin Sample** | STEP + NASTRAN + CSV | Your lander component geometry, tow paths, loads |
| **Mass/Cost Model** | Excel | Your lander baseline vs. LBFRP-001 |
| **Qualification Plan** | PDF | 18-month path to flight-ready data package |
| **IP Summary** | PDF | Patent status, licensing terms, open source components |

---

## CONTRACTOR TEST PROTOCOL TEMPLATE

Each contractor completes this for their independent test:

```markdown
# CONTRACTOR INDEPENDENT TEST PROTOCOL
## Contractor: [Name] | Article: [LEG/PV/PA]-001 | Date: [Date]

### TEST OBJECTIVES
[Contractor defines acceptance criteria relevant to their lander]

### TEST PROCEDURES
[Contractor defines procedures — their standards, their methods]

### INSTRUMENTATION
[Contractor specifies additional instrumentation]

### ACCEPTANCE CRITERIA
[Contractor defines Go/No-Go thresholds]

### DATA DELIVERABLES
[Contractor specifies format, timeline]

### WITNESS REQUIREMENTS
[Contractor specifies CSM/FAA/NASA witness needs]
```

**CSM Commitment:** We adapt to YOUR protocol. Your facility. Your standards. Your witness. You keep all data.

---

## INFUSION DECISION CRITERIA (Shared)

| Criterion | Threshold | Measurement |
|-----------|-----------|-------------|
| **Mass Savings** | >50% vs. baseline | Your scale, your geometry |
| **Specific Energy Absorption** | >30% improvement | Your landing loads |
| **Integration Labor** | >50% reduction | Your ICD count, schedule |
| **Digital Twin Correlation** | <5% variance | Your FEA vs. test |
| **Schedule Risk** | No CDR slip | Your program assessment |
| **Cost** | <70% baseline recurring | Your procurement model |

**Decision Gate:** Your CDR/PDR — if criteria met, baseline LBFRP-001.

---

## POST-TIM ACTIONS

| Action | Owner | Timeline |
|--------|-------|----------|
| Finalize test protocol | Contractor | TIM + 1 week |
| Ship demo article | CSM Logistics | TIM + 2 weeks |
| Execute contractor test | Contractor | Ship + 30 days |
| TIM #2: Results Review | Both | Test complete + 2 weeks |
| Infusion decision | Contractor | Per their CDR/PDR |

---

## CONTACT MATRIX

| CSM Role | Name | Contact |
|----------|------|---------|
| PI / Technical Lead | Jason Isaac Brodsky | jason.brodsky@carringtonstormmotors.com |
| Technical Lead (AI) | Nematron AI | nematron@carringtonstormmotors.com |
| AFP Fabrication | Partner AFP #1 | afp1@carringtonstormmotors.com |
| Logistics / Shipping | CSM Logistics | logistics@carringtonstormmotors.com |
| Contracts / SBIR | CSM Contracts | contracts@carringtonstormmotors.com |

---

*Document Control: CSM-CLPS-TIM-001 Rev A | Next Review: Oct 1, 2026*
*Committed to Git, pushed to main*