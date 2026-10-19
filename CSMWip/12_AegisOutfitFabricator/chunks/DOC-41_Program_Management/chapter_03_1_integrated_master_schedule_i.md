## 1. Integrated Master Schedule (IMS)

### 1.1 Work Breakdown Structure (WBS) — MIL-STD-881E Alignment

The AIMES program WBS follows **MIL-HDBK-881E** Appendix K (Unmanned Systems) tailored for wearable protective systems. The WBS is decomposed to Level 4 for schedule integration:

```
1.0 AIMES PROGRAM
├── 1.1 Program Management
│   ├── 1.1.1 Program Office Operations
│   ├── 1.1.2 Systems Engineering
│   ├── 1.1.3 Configuration Management (DOC-42)
│   ├── 1.1.4 Data Management (DOC-44)
│   └── 1.1.5 Risk Management (DOC-43)
├── 1.2 System Engineering & Integration
│   ├── 1.2.1 Architecture Definition (DOC-01..10)
│   ├── 1.2.2 Interface Control Documents
│   ├── 1.2.3 Verification & Validation Planning (DOC-40)
│   └── 1.2.4 Model-Based Systems Engineering (MBSE)
├── 1.3 RenaissanceMan Development (4 Editions)
│   ├── 1.3.1 RM-TS Edition (DOC-11, FAB-RM-02)
│   ├── 1.3.2 RM-TG Edition (DOC-12, FAB-RM-03)
│   ├── 1.3.3 RM-SS Edition (DOC-13, FAB-RM-04)
│   ├── 1.3.4 RM-SG Edition (DOC-14, FAB-RM-05)
│   ├── 1.3.5 Common: Tile Fabrication (FAB-RM-06)
│   ├── 1.3.6 Common: Lacing System (FAB-RM-07)
│   ├── 1.3.7 Common: Chassis (FAB-RM-08)
│   ├── 1.3.8 Common: Assembly (FAB-RM-09)
│   └── 1.3.9 Common: QC (FAB-RM-10)
├── 1.4 RenaissanceWoMan Development (4 Editions)
│   ├── 1.4.1 RW-TS Edition (DOC-21, FAB-RW-02)
│   ├── 1.4.2 RW-TG Edition (DOC-22, FAB-RW-03)
│   ├── 1.4.3 RW-SS Edition (DOC-23, FAB-RW-04)
│   ├── 1.4.4 RW-SG Edition (DOC-24, FAB-RW-05)
│   ├── 1.4.5 Common: Stays/Corset (FAB-RW-06)
│   ├── 1.4.6 Common: Farthingale (FAB-RW-07)
│   ├── 1.4.7 Common: Watteau/Cartridge (FAB-RW-08..09)
│   └── 1.4.8 Common: Assembly (FAB-RW-12)
├── 1.5 Threat Protection Validation (DOC-31..40)
│   ├── 1.5.1 Ballistic (DOC-31)
│   ├── 1.5.2 Thermal/Fire (DOC-32)
│   ├── 1.5.3 Electrical/GIC (DOC-33)
│   ├── 1.5.4 Directed Energy (DOC-34)
│   ├── 1.5.5 Force Trauma (DOC-35)
│   ├── 1.5.6 Bio-Acoustic (DOC-36)
│   ├── 1.5.7 Chem/Bio (DOC-37)
│   ├── 1.5.8 Environmental (DOC-38)
│   ├── 1.5.9 Test Standards (DOC-39)
│   └── 1.5.10 Materials Deep-Dive (DOC-40)
├── 1.6 Manufacturing & Production (DOC-41..50)
│   ├── 1.6.1 Silk Cultivation (DOC-41)
│   ├── 1.6.2 Metallic Thread (DOC-42)
│   ├── 1.6.3 Loom Configuration (DOC-43)
│   ├── 1.6.4 Ceramic Tile Micro-Fab (DOC-44)
│   ├── 1.6.5 MXene Coating (DOC-45)
│   ├── 1.6.6 Aerogel Quilting (DOC-46)
│   ├── 1.6.7 Panel Assembly (DOC-47)
│   ├── 1.6.8 Coating/Finishing (DOC-48)
│   ├── 1.6.9 Leaf Edition Config (DOC-49)
│   └── 1.6.10 Phoenix Protocol (DOC-50)
├── 1.7 Test & Evaluation (DOC-40)
│   ├── 1.7.1 Developmental Test (DT)
│   ├── 1.7.2 Operational Test (OT)
│   ├── 1.7.3 Live Fire Test & Evaluation (LFT&E)
│   └── 1.7.4 First Article Test (FAT)
├── 1.8 Logistics & Sustainment (DOC-35)
│   ├── 1.8.1 Supply Chain (DOC-35 §1)
│   ├── 1.8.2 Spares Provisioning (DOC-35 §2)
│   ├── 1.8.3 Distribution (DOC-35 §3)
│   └── 1.8.4 Shelf-Life/DMSMS (DOC-35 §4..5)
├── 1.9 Training & Certification (DOC-36)
│   ├── 1.9.1 Operator Course (DOC-36 §2)
│   ├── 1.9.2 Technician Course (DOC-36 §3)
│   ├── 1.9.3 Instructor Course (DOC-36 §4)
│   └── 1.9.4 DSV Specialty (DOC-36 §5)
└── 1.10 Deployment & Operations (DOC-33, DOC-34)
    ├── 1.10.1 Field Assembly (DOC-33)
    ├── 1.10.2 Maintenance (DOC-34)
    └── 1.10.3 Circular Economy (DOC-50)
```

### 1.2 IMS Critical Path Analysis

The **Integrated Master Schedule (IMS)** contains 2,847 activities across 150 work packages. Critical path identification uses **Forward/Backward Pass** algorithm:

```
FORWARD PASS:
ES_i = max_{j ∈ pred(i)} (EF_j)
EF_i = ES_i + Duration_i

BACKWARD PASS:
LF_i = min_{j ∈ succ(i)} (LS_j)
LS_i = LF_i - Duration_i

FLOAT_i = LS_i - ES_i = LF_i - EF_i
```

**Critical Path** (as of 2026-10-18 baseline):

| WBS Element | Activity | Duration | Float | Status |
|-------------|----------|----------|-------|--------|
| 1.2.1 | Architecture Definition Complete | 120 days | 0 days | Complete |
| 1.3.1..1.3.4 | RM Edition Panel Geometry | 180 days | 0 days | In Progress |
| 1.3.5 | Ceramic Tile Micro-Fab Qualification | 210 days | 0 days | Not Started |
| 1.5.1 | Ballistic Protection Live Fire | 90 days | 0 days | Not Started |
| 1.6.4 | Ceramic Tile Production Rate Validation | 120 days | 0 days | Not Started |
| 1.7.3 | LFT&E Execution | 60 days | 0 days | Not Started |
| 1.10.1 | First Unit Deployment | 30 days | 0 days | Not Started |

**Total Program Duration**: 1,095 days (36 months) from Milestone A to IOC  
**Critical Path Length**: 870 days (79.4% of total)

### 1.3 Schedule Margin & Float Management

Per **DoDI 5000.02** and **GAO Schedule Assessment Guide**, the program maintains:

| Margin Type | Target | Current | Measurement |
|-------------|--------|---------|-------------|
| **Schedule Margin** | ≥15% | 18.2% | (Critical Path Float / Remaining Duration) |
| **Management Reserve** | 10% of BAC | $42.7M | Held at Program Office level |
| **Near-Critical Threshold** | Float ≤ 20 days | 47 activities | Weekly IMS health review |

**Float Consumption Rate**:

$$
FCR = \frac{\sum_{i \in Critical} (Float_{baseline,i} - Float_{current,i})}{\Delta t}
$$

Alert threshold: $FCR > 2$ days/week triggers mitigation planning.

### 1.4 Schedule Integration with Technical Reviews

Each major technical review drives IMS milestones:

| Review | Milestone | Entrance Criteria | Exit Criteria | IMS Link |
|--------|-----------|-------------------|---------------|----------|
| **SRR** | System Requirements Review | DOC-01..10 baselined | Requirements stability > 95% | MS-A |
| **SFR** | System Functional Review | Architecture frozen, ICDs signed | Functional baseline approved | MS-B |
| **PDR** | Preliminary Design Review | 90% drawings released, models validated | Design baseline (Allocated) | MS-C |
| **CDR** | Critical Design Review | 100% drawings, prototypes built | Product baseline | MS-D |
| **FRR** | Flight Readiness Review | DT complete, test reports approved | Test readiness | MS-E |
| **PRR** | Production Readiness Review | FRP decision, production line validated | Production readiness | MS-F |
| **ORR** | Operational Readiness Review | OT complete, logistics demo | IOC declaration | IOC |

---
