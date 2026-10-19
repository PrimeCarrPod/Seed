## 6. Obsolescence Mitigation (DMSMS) — SAE AS6294

### 6.1 DMSMS Management Framework
Per **SAE AS6294** and **DoDI 4151.22**, proactive DMSMS management:

```
DMSMS MANAGEMENT PROCESS (SAE AS6294 COMPLIANT):

1. IDENTIFY (Continuous)
   ├── Monitor: GIDEP, PCN/EOL notices, supplier health
   ├── Sources: DLA, manufacturer roadmaps, industry consortiums
   ├── Tools: AS6294 PHM data → RUL prediction for components
   └── Output: DMSMS Watch List (updated monthly)

2. ASSESS (Per occurrence)
   ├── Impact Analysis:
   │    ├─ Form: Dimensional equivalence?
   │    ├─ Fit: Interface compatibility?
   │    ├─ Function: Performance equivalence?
   │    └─ Interface: Data/power/mechanical?
   ├── Risk Score = P(obsolescence) × I(cost) × U(urgency)
   │    P = Probability (0-1, supplier health, market signals)
   │    I = Impact ($ to redesign/requalify, schedule delay)
   │    U = Urgency (months to stock-out)
   └── Categorize: CRITICAL (>100), HIGH (50-100), MEDIUM (20-50), LOW (<20)

3. RESOLVE (Per risk category)
   ├── CRITICAL/HIGH: Immediate action
   │    ├─ LOTB: Life-of-Type Buy (calculate qty = demand × coverage)
   │    ├─ Alternate: Qualified substitute (MIL-STD-1540 test)
   │    ├─ Redesign: Form-fit-function replacement (D-Level)
   │    └─ Emulation: FPGA/ASIC emulation (neuromorphic only)
   ├── MEDIUM: Planned action (≤180 days)
   │    ├─ Supplier engagement (extend production)
   │    ├─ Alternate qualification
   │    └─ Redesign initiation
   └── LOW: Monitor (≤365 days)
        └─ Watch list, periodic reassessment

4. DOCUMENT & REPORT
   ├── DMSMS Case File (per AS6294)
   ├── LOTB Authorization (CSM Engineering)
   ├── Alternate Qualification Test Report (MIL-STD-1540)
   ├── Redesign ECP (Engineering Change Proposal)
   └── Quarterly DMSMS Report to Program Office
```

### 6.2 Critical DMSMS Items — Current Watch List

```
CURRENT DMSMS WATCH LIST (As of Runner 019 Baseline):

| Item                 | NSN/PN          | Supplier       | Risk | Status          | Resolution          | Target Date |
|----------------------|-----------------|----------------|------|-----------------|---------------------|-------------|
| Neuromorphic ASIC    | CSM-AIMES-010   | TSMC 7nm       | 180  | ACTIVE          | Redesign (12nm)     | Q2 2027     |
| MXene Precursor      | CSM-AIMES-MX01  | Drexel/CSM     | 120  | ACTIVE          | Alt source qualified| Q4 2026     |
| YInMn Pigment        | CSM-AIMES-YM01  | Shepherd Color | 85   | MONITOR         | LOTB (500kg)        | Q1 2027     |
| MR Fluid CIP         | CSM-AIMES-MR01  | Lord Corp      | 65   | MONITOR         | Alt supplier (2)    | Q3 2027     |
| PVDF-TrFE Film       | CSM-AIMES-PV01  | Arkema         | 45   | MONITOR         | LOTB (2000m²)       | Q4 2027     |
| Baleen (Synthetic)   | CSM-AIMES-BL01  | CSM BioMfg     | 20   | LOW             | Internal capacity   | N/A         |
| Dyneema SK99         | CSM-AIMES-DY01  | DSM            | 15   | LOW             | Multi-source        | N/A         |

LOTB CALCULATION (Neuromorphic ASIC Example):
  Annual Demand = 240 systems × 0.005 OFR × 1200 hrs = 1.44 units/yr
  20-Year Need = 29 units + 50% safety = 44 units
  LOTB Quantity = 50 units (full wafer run minimum)
  Cost = 50 × $285,000 = $14.25M
  ROI = Avoided redesign ($45M) + schedule (18 months)
```

---
