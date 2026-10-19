## 2. Performance-Based Logistics (PBL)

### 2.1 PBL Contract Structure

Per **DoDI 5000.02** and **10 USC 2464**, the AIMES PBL uses a **Long-Term Sustainment Contract** with outcome-based incentives:

**Contract Type**: **Cost-Plus Incentive Fee (CPIF) → Fixed-Price Incentive (FPI) → Firm Fixed Price (FFP)** transition over 20 years.

| Phase | Years | Contract Type | Scope |
|-------|-------|---------------|-------|
| **Phase 1** | 1–5 (LRIP + Early FRP) | CPIF | High uncertainty, data collection |
| **Phase 2** | 6–12 (Mature FRP) | FPI | Stable requirements, incentive optimization |
| **Phase 3** | 13–20 (Sustainment) | FFP | Mature, predictable, cost control |

### 2.2 PBL Performance Metrics — Contract Incentives

| Metric | Weight | Threshold | Target | Incentive |
|--------|--------|-----------|--------|-----------|
| **Materiel Availability (Am)** | 30% | 0.90 | ≥ 0.95 | ±8% fee |
| **Mission Capable Rate** | 20% | 0.85 | ≥ 0.92 | ±5% fee |
| **Cost Per Flight Hour** | 15% | ≤ 1.15× baseline | ≤ 1.0× baseline | ±4% fee |
| **Mean Time Between Maintenance** | 15% | ≥ 300 hrs | ≥ 500 hrs | ±4% fee |
| **Supply Response Time (MICAP)** | 10% | ≤ 48 hrs | ≤ 24 hrs | ±3% fee |
| **Technical Data Currency** | 10% | ≤ 30 days | ≤ 7 days | ±2% fee |

**Incentive Fee Formula**:

$$
Fee_{earned} = Fee_{target} + \sum_{i} w_i \cdot \text{sign}(Actual_i - Target_i) \cdot \min\left( |Actual_i - Target_i|, Cap_i \right) \cdot Rate_i
$$

Where $w_i$ = weight, $Cap_i$ = max incentive per metric, $Rate_i$ = $/unit.

### 2.3 PBL Contractor Responsibilities

The PBL Contractor (Prime + Logistics Sub) delivers **Product Support Outcomes**:

| Outcome | Contractor Deliverable | Gov Verification |
|---------|------------------------|------------------|
| **Availability** | Fleet Am ≥ 0.95 monthly | DCMA surveillance, GFIMS data |
| **Reliability** | MTBM trending, FRACAS | Reliability growth curves |
| **Support Cost** | CPUS ≤ target | EVM + Actuals reconciliation |
| **Technical Refresh** | Obsolescence management (DOC-35 §5) | DMSMS quarterly review |
| **Data Rights** | TDP access, SBOM delivery | DOC-44 compliance audit |
| **Workforce** | Certified maintainers (DOC-36) | Training records audit |

---
