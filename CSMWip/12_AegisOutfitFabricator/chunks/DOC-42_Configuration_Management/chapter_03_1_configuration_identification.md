## 1. Configuration Identification

### 1.1 Configuration Item (CI) & CSCI Definitions — MIL-STD-973

Per **MIL-STD-973** and **MIL-HDBK-61A**, the AIMES program defines Configuration Items (CIs) and Computer Software Configuration Items (CSCIs) at the **Product Baseline** level. Each CI is assigned a unique **Configuration Item Identifier (CIID)** per **AS550** (SAE Aerospace Standard).

**CI Hierarchy**:

```
AIMES SYSTEM (CI-0000)
├── RENAISSANCEMAN SUBSYSTEM (CI-1000)
│   ├── RM-TS EDITION (CI-1100)
│   ├── RM-TG EDITION (CI-1200)
│   ├── RM-SS EDITION (CI-1300)
│   ├── RM-SG EDITION (CI-1400)
│   └── RM COMMON HARDWARE (CI-1900)
│       ├── CERAMIC TILE ASSEMBLY (CI-1910)
│       ├── LACING SYSTEM (CI-1920)
│       ├── MAX PHASE CLEAT (CI-1930)
│       └── BFRP-BALEEN CHASSIS (CI-1940)
├── RENAISSANCEWOMAN SUBSYSTEM (CI-2000)
│   ├── RW-TS EDITION (CI-2100)
│   ├── RW-TG EDITION (CI-2200)
│   ├── RW-SS EDITION (CI-2300)
│   ├── RW-SG EDITION (CI-2400)
│   └── RW COMMON HARDWARE (CI-2900)
│       ├── STAYS/CORSET (CI-2910)
│       ├── FARTHINGALE/PANNIER (CI-2920)
│       ├── WATTEAU PLEATING (CI-2930)
│       └── CARTRIDGE PLEATING (CI-2940)
├── PROTECTIVE LAYER STACK (CI-3000)
│   ├── BALLISTIC PROTECTION (CI-3100) [DOC-31]
│   ├── THERMAL/FIRE PROTECTION (CI-3200) [DOC-32]
│   ├── ELECTRICAL/GIC PROTECTION (CI-3300) [DOC-33]
│   ├── DIRECTED ENERGY PROTECTION (CI-3400) [DOC-34]
│   ├── FORCE TRAUMA (CI-3500) [DOC-35]
│   ├── BIO-ACOUSTIC (CI-3600) [DOC-36]
│   ├── CHEM/BIO (CI-3700) [DOC-37]
│   └── ENVIRONMENTAL (CI-3800) [DOC-38]
├── POWER & THERMAL (CI-4000) [DOC-28]
├── SENSOR SUITE (CI-5000) [DOC-29]
├── AI/AUTONOMY CORE (CI-6000) [DOC-30]
├── SOFTWARE CSCIs
│   ├── CSCI-01: NEUROMORPHIC RUNTIME (DOC-30 §4)
│   ├── CSCI-02: PHM ALGORITHMS (DOC-29 §5)
│   ├── CSCI-03: BIT SOFTWARE (DOC-33 §7)
│   ├── CSCI-04: CBM+ DASHBOARD (DOC-34 §6)
│   ├── CSCI-05: SIMULATION ENGINE (CSMFAB-TGPU004.htm)
│   └── CSCI-06: MBD AUTHORING TOOLS (FAB-RM/RW)
└── DOCUMENTATION CIs
    ├── TECHNICAL DATA PACKAGE (CI-9000) [DOC-44]
    ├── TRAINING MATERIALS (CI-9100) [DOC-36]
    └── MAINTENANCE MANUALS (CI-9200) [DOC-34]
```

### 1.2 Configuration Baselines — Three Baseline Types

Per **MIL-STD-973** and **IEEE 828**, the program establishes three sequential baselines:

| Baseline | Milestone | Authority | Content | Freeze Criteria |
|----------|-----------|-----------|---------|-----------------|
| **Functional Baseline (FBL)** | SRR/SFR | Chief Engineer | Requirements (SRD), Architecture (SAD), ICDs, KPPs | Requirements stability ≥ 95% |
| **Allocated Baseline (ABL)** | PDR | Chief Engineer | Allocated requirements, Interface specs, Preliminary designs, Trade study results | Design reviews complete, PDR closed |
| **Product Baseline (PBL)** | CDR | Program Manager | Final drawings, Source code, Build specs, Test procedures, Acceptance criteria | CDR closed, FRR passed |

**Baseline Transition Criteria**:

$$
\text{Baseline}_{k+1} \text{ Authorized} \iff 
\begin{cases}
\text{Review}_k \text{ Completed} \\
\text{Action Items}_k \text{ Closed} \geq 95\% \\
\text{Baseline}_k \text{ Artifacts in CM} = 100\% \\
\text{CCB Approval} = \text{Yes}
\end{cases}
$$

### 1.3 Configuration Item Identifier (CIID) Structure

Per **AS550** and **MIL-STD-973**:

```
CIID = [Program Code].[WBS Level].[Sequence].[Variant].[Revision]
      =    AIM     .  4-digit   .  3-digit  .  1-char  .  2-char
Example: AIM.1300.001.A.01
  AIM          = Program Code (Aegis Iron Man)
  1300         = WBS 1.3 (RM-SS Edition)
  001          = Sequence (Panel Geometry)
  A            = Variant (A=Production, B=Test, P=Prototype)
  01           = Revision (00=Draft, 01=Baseline, 02+=Changes)
```

### 1.4 Interface Control Documents (ICDs)

All external and internal interfaces documented in ICDs per **IEEE 1471** / **ISO/IEC 42010**:

| ICD ID | Interfaces | Owner | Status |
|--------|------------|-------|--------|
| **ICD-001** | RM Edition ↔ Chassis (CI-1940) | RM Lead | Baselined |
| **ICD-002** | Protective Stack ↔ Textile Layers | Prot Lead | Baselined |
| **ICD-003** | Power ↔ AI Core (CI-6000) | Power Lead | Draft |
| **ICD-004** | Sensor Suite ↔ PHM (CSCI-02) | Sensor Lead | Baselined |
| **ICD-005** | Lacing System ↔ Edition Variant | Mech Lead | Draft |
| **ICD-006** | Simulation ↔ Training (CSMFAB-TGPU004.htm) | Sim Lead | Baselined |

---
