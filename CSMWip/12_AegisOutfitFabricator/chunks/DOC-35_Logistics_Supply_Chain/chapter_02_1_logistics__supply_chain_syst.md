## 1. Logistics & Supply Chain System Overview

### 1.1 Sustainment Logistics Philosophy
The AIMES logistics architecture follows **DoDI 4151.22** (Condition-Based Maintenance Plus) and **ISO 13374** (CBM Open Architecture) principles, extended for a globally distributed wearable protective system with **20-year sustainment horizon**. The logistics system must support 12 regional operational hubs, each maintaining readiness for 500+ AIMES units across three maintenance levels (O/I/D).

**Key Design Equations:**

**Total Spares Investment:**
$$I_{spares} = \sum_{i=1}^{N} \left( \lambda_i \times T_{lead,i} \times C_i \times S_i \right) \times (1 + \alpha_{safety})$$

Where:
- $\lambda_i$ = Failure rate of LRU $i$ (failures/1000 hrs)
- $T_{lead,i}$ = Lead time for LRU $i$ (days)
- $C_i$ = Unit cost of LRU $i$ ($)
- $S_i$ = Safety stock multiplier (function of criticality)
- $\alpha_{safety}$ = System-level safety factor (0.15 for AIMES)

**Supply Chain Availability:**
$$A_{sc} = \prod_{j=1}^{M} \left( 1 - \frac{D_{stockout,j}}{D_{total,j}} \right)$$

Where $D_{stockout,j}$ = demand unfilled at hub $j$, $D_{total,j}$ = total demand at hub $j$.

### 1.2 Logistics Level Definitions (Per DoDI 4151.22 + ISO 13374)

| Level | Designation | Location | Spares Held | Replenishment | Response |
|-------|-------------|----------|-------------|---------------|----------|
| **O-Level** | Organizational | Forward Base/Unit | 30-day O-Level demand | Auto-reorder from I-Level | <4 hours |
| **I-Level** | Intermediate | Regional Hub (12 global) | 90-day I-Level + O-Level buffer | Pull from D-Level/DLA | 24-72 hours |
| **D-Level** | Depot | CSM Facilities (3 global) | Strategic reserve, rebuild capability | OEM/qualified sources | 2-4 weeks |

### 1.3 Logistics Performance Targets (Derived from CSMFAB078 §8)

| Parameter | Target | Standard |
|-----------|--------|----------|
| **Supply Availability ($A_{sc}$)** | ≥0.98 | ISO 13374 §6.2 |
| **Order Fill Rate (O-Level)** | ≥95% in 4 hrs | DoDI 4151.22 |
| **Order Fill Rate (I-Level)** | ≥98% in 72 hrs | ISO 22301 |
| **DMSMS Resolution Time** | ≤180 days | SAE AS6294 |
| **Cold Chain Compliance** | 100% (MR fluid, batteries) | MIL-STD-2073 |
| **Circular Recovery Rate** | ≥85% (Phoenix Protocol) | CSMFAB078 §8 |

---
