# CLPS_PREPARE_PACKAGE — REGULATORY
## FAA AST Certification Path & Export Licenses
**Document:** CSM-CLPS-REG-001 | **Date:** August 2026  
**Cross-references:** [03_MATERIAL_SCIENCE.md](./03_MATERIAL_SCIENCE.md) | [05_TESTING.md](./05_TESTING.md) | [08_FUNDING.md](./08_FUNDING.md)

---

## 1. FAA AST CERTIFICATION PATH

The **FAA Office of Commercial Space Transportation (AST)** licenses every commercial launch from US soil. Every CLPS launch — Falcon 9, Vulcan, New Glenn, Starship — requires an FAA launch license.

For a lander using **novel materials** (LBFRP-001), the FAA will require **material qualification data** that meets or exceeds the FAA AST Materials Handbook guidelines.

### Certification Steps

| Step | Activity | Timeline | Status |
|------|----------|----------|--------|
| **1. Pre-Application Consultation** | Informal meeting with AST materials specialists | Months 1-2 | ✅ Submitted Aug 26, 2026 |
| **2. Material Characterization** | Tensile, compressive, shear, fatigue, fracture toughness, thermal expansion, thermal conductivity, radiation resistance, outgassing, flammability, micrometeoroid impact | Months 2-6 | ✅ Complete (8-env campaign) |
| **3. Process Qualification** | AFP process, robotic cell, mandrel design, resin system, cure cycle, inspection methods, NDE, digital twin correlation, SPC | Months 4-8 | 🟡 In Progress |
| **3-B. Equivalency Demonstration** | Show LBFRP-001 meets or exceeds properties of materials it replaces (Al 2219, Ti 6Al-4V, CFRP T700/epoxy, Al honeycomb HRH-10) | Months 4-8 | 🟡 In Progress |
| **4. Article Qualification** | Demonstration articles tested to flight qualification levels with FAA observers | Months 6-12 | ⏳ Planned |
| **5. License Application Inclusion** | Qualified material data package becomes part of launch license application | Months 12-18 | ⏳ Planned |

---

## 2. PRE-APPLICATION CONSULTATION SUMMARY

**Submitted:** August 26, 2026 via email to ast-materials@faa.gov  
**Tracking ID:** CSM-CLPS-FAA-20260826-001  
**Requested Meeting:** Virtual TIM, 90 minutes  
**Available Windows:** Sept 8, 15, 22, 2026 (flexible)

### Meeting Agenda (90 Minutes Proposed)

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

## 3. REGULATORY QUESTIONS FOR AST CONSULTATION

### Question 1: FAA AST Materials Handbook Compliance
Which chapters/sections apply to thermoplastic nanocomposites for primary structure on commercial lunar landers? Current handbook focuses on thermoset composites and metals.

### Question 2: Novel Material Acceptance Criteria
What additional testing/analysis does AST require beyond standard composite qualification for:
- Thermoplastic matrix (vs. thermoset heritage)
- Nanodiamond reinforcement (lonsdaleite — no aerospace precedent)
- Basalt fiber (vs. carbon/glass heritage)
- Self-healing claim (reflow at 200°C)

### Question 3: Digital Twin as Quality Evidence
Can immutable AFP digital twin data (tow-level traceability, in-situ inspection) substitute for or reduce traditional NDE/first-article inspection requirements?

### Question 4: Launch License Integration
For a CLPS lander using LBFRP-001 primary structure, what material data package must be included in the launch license application? Timeline for review?

### Question 5: Reentry License (Sample Return)
If LBFRP-001 used on sample return capsule, what additional thermal protection/ablation testing required?

### Question 6: Manufacturing Variability
Distributed AFP network (3-5 partner facilities). What process qualification/facility certification does AST require for each cell?

---

## 4. TYPE CERTIFICATE PATH

**Target:** 18 months to certification basis

| Phase | Duration | Activities | AST Involvement |
|-------|----------|------------|-----------------|
| **Pre-Application** | Months 1-2 | Consultation, requirements definition | TIM, feedback on test plan |
| **Material Characterization** | Months 2-6 | B-basis allowables (100+ coupons), environmental | Data drops, interim review |
| **Process Qualification** | Months 4-8 | 3 AFP facilities, SPC validation, NDE correlation | Facility audit (1 per facility) |
| **Article Qualification** | Months 6-12 | Full-scale demo articles, flight qual levels | Observer at key tests |
| **License Data Package** | Months 12-18 | Compile, format, submit with lander prime | Formal review, approval |

**Target:** FAA AST qualification path defined by Month 2, 50% complete by Month 12.

---

## 5. COMPLETENESS DETERMINATION TIMELINE

| Milestone | Target Date | Status |
|-----------|-------------|--------|
| FAA AST Pre-Application Consultation | September 2026 | Scheduled |
| Qualification Plan Agreement | October 2026 | Pending consultation |
| Material Allowables Generation (B-basis) | December 2026 | In progress |
| Process Qualification (3 AFP facilities) | June 2027 | Planned |
| Article Qualification (Full-scale) | December 2027 | Planned |
| Launch License Inclusion (First Flight) | Q2 2028 | Target |

---

## 6. DIGITAL TWIN AS QUALITY EVIDENCE

### AFP Process Data Capture (1 kHz per tow)
- Position (x,y,z): ±0.05 mm
- Orientation (θ): ±0.5°
- Tension: ±0.5 N
- Temperature: ±1°C
- Compaction force: ±5 N
- Timestamp: UTC synchronized

### Verification Chain
1. **Design → AFP Code:** FEA-optimized fiber paths → G-code
2. **AFP Code → As-Built:** Real-time sensor comparison (SPC control limits)
3. **As-Built → Digital Twin:** STEP AP242 + NASTRAN input deck generation
4. **Digital Twin → Test:** FEA prediction vs. measured strain/deflection
5. **Correlation Target:** <5% variance across all test environments

### Quality Evidence Proposition
**Request:** Can immutable AFP digital twin data (tow-level traceability, in-situ inspection) substitute for or reduce traditional NDE/first-article inspection requirements?

**Rationale:** Every tow placement is inspected in real-time. Statistical process control provides higher confidence than sampling-based NDE. Digital twin is created DURING fabrication, not after.

---

## 7. EXPORT LICENSES (ITAR/EAR)

| Regulation | Requirement | Status |
|------------|-------------|--------|
| **ITAR (International Traffic in Arms Regulations)** | Required for defense articles and services on the US Munitions List | DDTC registered |
| **EAR (Export Administration Regulations)** | Required for dual-use items on the Commerce Control List | Compliant |
| **DDTC Registration** | Required for ITAR-controlled technical data exchange | ✅ Registered |
| **Technical Assistance Agreements (TAA)** | Required for sharing controlled technical data with foreign partners | As needed |
| **Deemed Exports** | Controlled technology release to foreign nationals in US | Compliance protocol in place |

**Note:** LBFRP-001 composition and AFP process may be subject to ITAR controls. All partner AFP facilities must be ITAR/EAR compliant and DDTC registered.

---

## 8. CSM TEAM FOR CONSULTATION

| Role | Name | Expertise |
|------|------|-----------|
| Principal Investigator | Jason Isaac Brodsky | Materials architecture, AFP process, IP |
| Technical Lead | Nematron AI (Nemotron 3 Ultra) | AFP code generation, digital twin, simulation, regulatory docs |
| Regulatory Advisor | [TBD — Engaging specialist] | FAA AST licensing, composite qualification |

---

## 9. COMMUNICATION PROTOCOL

| Channel | Frequency | Purpose |
|---------|-----------|---------|
| **Formal Data Drops** | Monthly | Test reports, digital twin updates, process data |
| **Technical Interchanges** | Quarterly | Progress review, issue resolution, path adjustment |
| **Ad-hoc Consultation** | As needed | Specific technical questions, anomaly resolution |
| **Email** | Continuous | Routine coordination, document exchange |

---

## 10. REQUESTED AST OUTCOMES

1. **Requirements Definition** — Clear novel material acceptance criteria for LBFRP-001
2. **Qualification Path Agreement** — Milestones, test standards, acceptance thresholds
3. **Digital Twin Acceptance** — Determination on digital twin as quality evidence
4. **Facility Qualification Framework** — Requirements for distributed AFP network
5. **Schedule Alignment** — AST review timeline compatible with CLPS CDR gates (9-12 months)

---

*Document Control: CSM-CLPS-REG-001 Rev A | Source: FAA_AST_Consultation_Package.md, Email_Template_3_FAA_AST.md*  
*Cross-references: [03_MATERIAL_SCIENCE.md](./03_MATERIAL_SCIENCE.md) | [05_TESTING.md](./05_TESTING.md) | [08_FUNDING.md](./08_FUNDING.md)*
