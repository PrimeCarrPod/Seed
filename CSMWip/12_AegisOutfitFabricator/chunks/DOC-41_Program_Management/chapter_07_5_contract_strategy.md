## 5. Contract Strategy

### 5.1 Contract Type Selection — FPIF/CPIF/PBL

Per **DoDI 5000.02** and **FAR 16.4**, the AIMES program uses a **hybrid contract structure**:

| CLIN | Scope | Type | Rationale |
|------|-------|------|-----------|
| **0001** | RDT&E — Development | **CPIF** (Cost-Plus Incentive Fee) | High technical risk, evolving requirements |
| **0002** | RDT&E — Prototypes | **FPIF** (Fixed-Price Incentive Firm) | Defined scope, schedule-critical |
| **0003** | LRIP (Lots 1–3) | **FPIF** with Price Ceiling | Transition to production, learning curve |
| **0004** | FRP (Lot 4+) | **FFP** with Economic Price Adjustment | Mature design, stable requirements |
| **0005** | Sustainment (20 yr) | **PBL** (Performance-Based Logistics) | DOC-35 outcomes: Ao ≥ 0.95, cost ≤ 10%/yr |

**Incentive Structure** (CLIN 0001–0003):

$$
Fee = Fee_{target} + \min\left( Fee_{max} - Fee_{target}, \max\left( Fee_{min} - Fee_{target}, \frac{Target\_Cost - Actual\_Cost}{Share\_Ratio} \right) \right)
$$

Where $Share\_Ratio$ = 0.70 Government / 0.30 Contractor (cost underrun), 0.50/0.50 (overrun).

### 5.2 Contract Incentives — Key Performance Parameters

| KPP | Weight | Target | Incentive |
|-----|--------|--------|-----------|
| **System Availability (Ao)** | 25% | ≥ 0.95 | ±5% fee |
| **Mean Time Between Failure** | 20% | ≥ 2,000 hrs | ±4% fee |
| **Unit Cost (LRIP Lot 3)** | 20% | ≤ $2.1M | ±4% fee |
| **Schedule (IOC)** | 15% | ≤ Oct 2029 | ±3% fee |
| **Cyber Survivability** | 10% | CAT-1 Pass | ±2% fee |
| **Historical Authenticity** | 10% | CIETA ≥ 90% | ±2% fee |

---
