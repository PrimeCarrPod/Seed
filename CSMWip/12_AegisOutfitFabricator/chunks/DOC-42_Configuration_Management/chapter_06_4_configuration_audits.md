## 4. Configuration Audits

### 4.1 Functional Configuration Audit (FCA)

Per **MIL-STD-1540** and **MIL-STD-973**, FCA verifies the **actual performance** matches **allocated baseline requirements**.

| FCA Element | Method | Pass Criteria |
|-------------|--------|---------------|
| **Requirements Verification** | RVTM trace, test reports (DOC-40) | 100% requirements verified |
| **Interface Compliance** | ICD test, integration test | 0 Interface discrepancies |
| **Software CSCI Testing** | Unit, integration, system test | 100% test cases pass |
| **Performance Parameters** | KPP/KSA demonstration (DOC-40) | All KPPs meet threshold |
| **Documentation Completeness** | Deliverable checklist | All CDRL items delivered |

**FCA Timing**: Post-DT, Pre-FRR. Duration: 4 weeks.

### 4.2 Physical Configuration Audit (PCA)

Per **MIL-STD-1540**, PCA verifies the **as-built configuration** matches **product baseline documentation**.

| PCA Element | Method | Pass Criteria |
|-------------|--------|---------------|
| **Drawing/Part Conformance** | FAI (First Article Inspection) | 0 Non-conformances |
| **BOM Accuracy** | Physical count vs. PLM BOM | 100% match |
| **Software Version** | Build ID vs. Release Manifest | Exact match |
| **Serial Number Tracking** | Unit traceability, birth records | 100% traceable |
| **Technical Data Package** | TDP completeness (DOC-44) | All items delivered |

**PCA Timing**: Post-PRR, Pre-ORR. Duration: 3 weeks.

### 4.3 Audit Metrics & Closure

| Metric | Target | Measurement |
|--------|--------|-------------|
| **FCA Discrepancies** | 0 Critical, ≤ 5 Major | Count by severity |
| **PCA Discrepancies** | 0 Critical, ≤ 3 Major | Count by severity |
| **Discrepancy Closure Rate** | 100% within 30 days | Days open |
| **Audit Artifact Completeness** | 100% | Checklist compliance |
| **Corrective Action Effectiveness** | 0 Recurrence | Trend analysis |

---
