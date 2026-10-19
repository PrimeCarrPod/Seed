## 1. Preliminary Hazard Analysis (PHA)

### 1.1 PHA Scope & Methodology

Per **MIL-STD-882E** Task 201 and **MIL-HDBK-882** Appendix A, the Preliminary Hazard Analysis (PHA) is conducted early in the lifecycle (pre-SRR) to identify system-level hazards, establish the Hazard Tracking System (HTS), and define initial risk mitigation strategies.

**PHA Process Flow**:

```
SYSTEM DESCRIPTION → ENERGY SOURCE IDENTIFICATION → HAZARD IDENTIFICATION → 
  INITIAL RISK ASSESSMENT → MITIGATION STRATEGY → HTS ENTRY → PHA REPORT
```

### 1.2 Energy Sources — AIMES System

Per **MIL-STD-882E** Table II, the AIMES system contains the following energy sources:

| Energy Type | Source | Magnitude | Location |
|-------------|--------|-----------|----------|
| **Kinetic** | Wearer motion, blast fragments, projectiles | Up to 10 kJ (NIJ Level IV) | Full body |
| **Potential (Gravitational)** | Fall from height, DSV depth | $mgh$ = 75 kg × 9.81 × 300 m = 220 kJ | DSV ops |
| **Thermal** | MR fluid (DOC-28), MHD exhaust, directed energy | 800–2000°C | Torso, limbs |
| **Chemical** | Li-S battery (DOC-28), MR fluid, MOF (DOC-34) | 2.5 MJ/kg (Li-S) | Power pack, cooling |
| **Electrical** | MHD generator (DOC-28), neuromorphic (DOC-30) | 500 VDC, 50 A | Full body |
| **Radiation (Non-ionizing)** | RF mesh (DOC-29), directed energy threat | 10 GHz, 1 kW/m² | EMI shield |
| **Radiation (Ionizing)** | Nuclear threat, space environment | 1 Gy/h | Environmental |
| **Pressure** | Environmental seal (DOC-27), DSV compensation | 30 atm (300 m sw) | Full body |
| **Acoustic** | Blast overpressure (DOC-26), sonar (DSV) | 180 dB | Auditory, whole body |

### 1.3 PHA Hazard Log — Initial Entries

| Hazard ID | Hazard Description | Energy Source | Initial Severity | Initial Probability | Initial Risk | Mitigation Approach |
|-----------|-------------------|---------------|------------------|---------------------|--------------|---------------------|
| **PHA-001** | Ceramic tile fragmentation → secondary projectiles | Kinetic | 1 (Catastrophic) | C (Occasional) | High | Auxetic backing (DOC-26), spall liner |
| **PHA-002** | MR fluid thermal runaway → burn injury | Thermal/Chemical | 2 (Critical) | D (Remote) | Medium | UHTC encapsulation, thermal fuse |
| **PHA-003** | Battery thermal runaway → fire/toxic gas | Chemical/Electrical | 1 (Catastrophic) | D (Remote) | High | BMS, cell isolation, venting (DOC-28) |
| **PHA-004** | Seal failure → asphyxiation (DSV) | Pressure | 1 (Catastrophic) | E (Improbable) | Medium | Redundant seals, APC (DOC-27) |
| **PHA-005** | EMI shield degradation → neural interference | Radiation | 2 (Critical) | C (Occasional) | Medium | MXene monitoring, fail-safe (DOC-29) |
| **PHA-006** | AI autonomy loss → uncontrolled actuation | Electrical/Software | 2 (Critical) | D (Remote) | Medium | Verified runtime, watchdog (DOC-30) |
| **PHA-007** | Blast overpressure → TBI/auditory damage | Acoustic | 2 (Critical) | C (Occasional) | Medium | Auxetic foam, helmet (DOC-26, DOC-30) |
| **PHA-008** | Chemical permeation → systemic toxicity | Chemical | 2 (Critical) | D (Remote) | Medium | MOF catalytic, STF base (DOC-34, DOC-37) |
| **PHA-009** | Lacing system failure → suit disintegration | Kinetic | 2 (Critical) | D (Remote) | Medium | Redundant zones, Max Phase cleats (DOC-16) |
| **PHA-010** | Cyber intrusion → safety system disable | Cyber | 1 (Catastrophic) | D (Remote) | High | Zero-trust, air-gapped safety (DOC-39) |

### 1.4 Hazard Tracking System (HTS)

The HTS is maintained in **DOORS Next** integrated with **Jira** (DOC-42 §3). Each hazard entry contains:

| Field | Description |
|-------|-------------|
| **Hazard ID** | Unique identifier (PHA-XXX, SSHA-XXX, SHA-XXX, OSHA-XXX) |
| **Description** | Clear hazard statement |
| **System/Subsystem** | WBS element |
| **Energy Source(s)** | From Table 1.2 |
| **Severity (1–4)** | Current assessment |
| **Probability (A–F)** | Current assessment |
| **Risk Level** | Calculated (Matrix §5) |
| **Cause(s)** | Root cause analysis |
| **Effect(s)** | Consequence description |
| **Current Controls** | Design, procedural, administrative |
| **Required Mitigation** | Additional controls needed |
| **Verification Method** | Test, analysis, inspection, demonstration |
| **Status** | Open, Mitigated, Verified, Closed, Accepted |
| **Owner** | Responsible engineer |
| **Closure Evidence** | Test report, analysis, inspection record |

---
