## 1. Technical Data Package (TDP)

### 1.1 TDP Scope — MIL-STD-31000 Compliance

Per **MIL-STD-31000** (Technical Data Packages), the AIMES TDP is the authoritative data set defining the **Product Baseline (PBL)**. The TDP contains all data necessary to manufacture, inspect, test, maintain, and sustain the AIMES system across all 8 editions (4 RenaissanceMan + 4 RenaissanceWoMan).

**TDP Structure** (per MIL-STD-31000 Appendix A):

```
AIMES TDP (PBL)
├── 1.0 DEFINITION DATA
│   ├── 1.1 Engineering Drawings (ASME Y14.100, Y14.41 MBD)
│   ├── 1.2 3D Models (STEP AP242, ISO 10303-242)
│   ├── 1.3 Specifications (DOC-11..40, FAB-RM/RW)
│   ├── 1.4 Interface Control Documents (ICDs, DOC-42)
│   ├── 1.5 Parts Lists / BOMs (ASME Y14.24, DIME/PLM)
│   └── 1.6 Source Control Drawings (SCDs)
├── 2.0 MANUFACTURING DATA
│   ├── 2.1 Process Specifications (DOC-41..50)
│   ├── 2.2 Tooling Drawings (FAB-RM-11, FAB-RW-14)
│   ├── 2.3 Work Instructions (FAB-RM-15, FAB-RW-18)
│   ├── 2.4 Inspection Procedures (DOC-32, FAB-RM-10, FAB-RW-13)
│   └── 2.5 Acceptance Test Procedures (DOC-40)
├── 3.0 SUSTAINMENT DATA
│   ├── 3.1 Maintenance Manuals (DOC-34, FAB-RM-16, FAB-RW-19)
│   ├── 3.2 Illustrated Parts Breakdown (IPB)
│   ├── 3.3 Wiring Diagrams / Schematics
│   ├── 3.4 Software Documentation (CSCI-01..06)
│   │   ├── 3.4.1 SRS, SAD, SDD (IEEE 830, 1016, 12207)
│   │   ├── 3.4.2 Test Plans/Reports (DOC-40)
│   │   ├── 3.4.3 User Manuals (DOC-36)
│   │   └── 3.4.4 SBOM (DOC-42 §5.3)
│   ├── 3.5 Logistics Data (DOC-35)
│   │   ├── 3.5.1 Spares Lists (DOC-35 §2)
│   │   ├── 3.5.2 Provisioning Data (DOC-35 §2)
│   │   └── 3.5.3 DMSMS Data (DOC-35 §5)
│   └── 3.6 Training Data (DOC-36)
├── 4.0 QUALITY DATA
│   ├── 4.1 Quality Program Plan
│   ├── 4.2 First Article Inspection (FAI) Reports (AS9102)
│   ├── 4.3 Process Capability Studies (Cp/Cpk)
│   ├── 4.4 Nonconformance Reports (NCRs)
│   └── 4.5 Corrective Action Reports (CARs)
└── 5.0 PROGRAMMATIC DATA
    ├── 5.1 Integrated Master Schedule (IMS, DOC-41 §1)
    ├── 5.2 Risk Management Data (DOC-43)
    ├── 5.3 Configuration Management Data (DOC-42)
    └── 5.4 Cost & Earned Value Data (DOC-41 §2)
```

### 1.2 TDP Data Formats — Long-Term Preservation

Per **NARA Bulletin 2015-02** and **DoD 5010.12-M**, all TDP data uses **open, non-proprietary formats**:

| Data Type | Primary Format | Alternate | Validation |
|-----------|----------------|-----------|------------|
| **3D Models** | **STEP AP242** (ISO 10303-242) | JT, 3D PDF | CAx-IF Recommended Practices |
| **2D Drawings** | **PDF/A-2u** (ISO 19005-2) | TIFF | PDF Association VeraPDF |
| **Specifications** | **PDF/A-2u** | XML (DocBook) | VeraPDF |
| **BOMs** | **XML (PLMXML)** | CSV, JSON | Schema validation |
| **Software** | **Git (source)** + **Docker/OCI (binary)** | — | Reproducible build (DOC-42 §5.4) |
| **Requirements** | **ReqIF** (OMG) | DOORS Native | ReqIF Validator |
| **Test Data** | **CSV/HDF5** | ATFX (ASAM) | Checksums |
| **Schedules** | **XML (PMXML)** | MPP, XER | P6/XER compatibility |

### 1.3 TDP Maturity Gates

| Gate | Milestone | TDP Completeness | Verification |
|------|-----------|------------------|--------------|
| **SRR** | Requirements | 10% (Reqs, ICDs, SAD) | Requirements review |
| **SFR** | Functional | 25% (+Architecture, Trade studies) | SFR artifacts |
| **PDR** | Allocated | 60% (+Preliminary drawings, Models) | PDR package |
| **CDR** | Product | 95% (+Released drawings, Source code) | CDR package |
| **FRR** | Test | 100% (+Test procedures, FAI plans) | FRR package |
| **PRR** | Production | 100% (+Mfg data, Work instructions) | PRR package |
| **FRP** | Full Rate | 100% (+Sustainment, IPB) | FRP decision |

**TDP Completeness Metric**:

$$
\text{TDP\%} = \frac{N_{delivered}}{N_{planned}} \times 100\%
$$

Where $N_{planned}$ = CDRL items per DD Form 1423 (DOC-44 §3).

---
