## 1. Maintenance & Sustainment System Overview

### 1.1 Sustainment Philosophy
The AIMES maintenance program follows **DoDI 4151.22** (Condition-Based Maintenance Plus) with three-level maintenance concept (Organizational, Intermediate, Depot) adapted for a wearable protective system. Design goal: **20-year service life** with ≤5% downtime, ≤10% lifecycle cost of procurement.

### 1.2 Maintenance Level Definitions (Per DoDI 4151.22)

| Level | Designation | Location | Personnel | Scope | Response Time |
|-------|-------------|----------|-----------|-------|---------------|
| **O-Level** | Organizational | Field/Unit | CSM-AIMES-OP (40hr cert) | Inspection, cleaning, tile replace, seal patch, lacing adjust, BIT | <4 hours |
| **I-Level** | Intermediate | Regional Shop | CSM-AIMES-TECH (80hr cert) | MR fluid service, battery module, aerogel panel, FSS repair, framework align | 24-72 hours |
| **D-Level** | Depot | CSM Facility | CSM-AIMES-INST (120hr cert) | Structural chassis, MHD channel, neuromorphic ASIC, ceramic sinter, recertification | 2-4 weeks |

### 1.3 Reliability Targets (Derived from CSMFAB078-B §3)

| Parameter | Target | Method |
|-----------|--------|--------|
| **MTBF (Mission Critical)** | ≥2,000 hours | Field data + accelerated life test |
| **MTTR (O-Level)** | ≤2 hours | Modular LRU design |
| **MTTR (I-Level)** | ≤8 hours | Pre-positioned spares |
| **Availability (Ao)** | ≥0.95 | Ao = MTBF/(MTBF+MTTR) |
| **Lifecycle Cost** | ≤10% procurement/year | CBM+ optimization |
| **Obsolescence Risk** | Low (open architecture) | Modular DIM interfaces |

---
