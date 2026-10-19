## 3. Configuration Status Accounting (CSA)

### 3.1 CSA Data Elements — MIL-STD-973 §5.3

The CMDB maintains current status for every CI:

| Data Element | Description | Source |
|--------------|-------------|--------|
| **CI Identifier** | Unique CIID per AS550 | PLM/Git |
| **Nomenclature** | Official name | Engineering |
| **Baseline** | FBL/ABL/PBL/FRP | CMDB |
| **Revision** | Current revision level | Git/PLM |
| **Change Status** | Open ECRs, approved ECOs, implemented | Jira |
| **Approval Status** | CCB date, approval authority | CCB Minutes |
| **Implementation Status** | % complete, units affected, retrofit kit | Production |
| **Verification Status** | Test reports, inspection records | T&E (DOC-40) |
| **Location** | Physical/digital location | Asset Management |

### 3.2 CSA Reporting — Metrics & Dashboards

**Configuration Status Report (CSR)** — Monthly, per **MIL-STD-973** Figure 5:

| Metric | Target | Current (2026-10) |
|--------|--------|-------------------|
| **Total CIs** | 247 | 247 |
| **CIs Baselined (PBL)** | 100% by CDR | 0% (Pre-CDR) |
| **Open Class I ECRs** | ≤ 10 | 3 |
| **Open Class I ECRs > 30 days** | 0 | 1 |
| **ECOs Implemented This Month** | — | 12 |
| **Retrofit Kits Required** | 0 (design maturity) | 0 |
| **Documentation Currency** | 100% | 94% |
| **Software Build Reproducibility** | 100% | 98% |

### 3.3 Configuration Management Database (CMDB) Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    CMDB (Single Source of Truth)            │
├─────────────────────────────────────────────────────────────┤
│  GitLab (Code/Docs) ←→ DIME/PLM (Hardware) ←→ DOORS (Reqs) │
│         ↓                              ↓                      │
│  Jira/ServiceNow (ECR/ECO) ←→ Asset Mgmt (Physical)         │
└─────────────────────────────────────────────────────────────┘
                    ↓
         ┌────────────────────────┐
         │  BI Dashboard (PowerBI)│
         │  • CI Status           │
         │  • Change Metrics      │
         │  • Baseline Health     │
         │  • Audit Findings      │
         └────────────────────────┘
```

**Data Integrity Rules**:

$$
\text{CMDB Consistency} \iff \forall CI: 
\begin{cases}
\text{Git Revision} = \text{PLM Revision} \\
\text{Requirements Linked} = \text{Design Artifacts} \\
\text{ECR Status} = \text{Implementation Status} \\
\text{Audit Trail} = \text{Complete, Unbroken}
\end{cases}
$$

---
