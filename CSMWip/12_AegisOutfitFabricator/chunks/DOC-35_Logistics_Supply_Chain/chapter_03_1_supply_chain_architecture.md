## 1. Supply Chain Architecture

### 1.1 Overview

The AIMES Logistics & Supply Chain (LSC) system sustains a global fleet of 12,000+ adaptive exosuits across 20-year operational lifecycle. The architecture implements a **tiered, multi-echelon distribution model** aligned with DoDI 4151.22 Condition-Based Maintenance Plus (CBM+) and ISO 13374 Condition-Based Maintenance Open Architecture.

### 1.2 Three-Tier Maintenance Echelons

Per DoDI 4151.22 Enclosure 3 and MIL-STD-1540, the AIMES LSC defines three maintenance echelons:

| Echelon | Designation | Capability | Response Time | Locations |
|---------|-------------|------------|---------------|-----------|
| **O-Level** | Organizational | BIT execution, LRU swap, consumables replenishment | ≤ 4 hours | Forward Operating Bases (FOB), Shipboard, Air Wing Detachments |
| **I-Level** | Intermediate | Module repair, NDT inspection, firmware reload, calibration | ≤ 72 hours | Regional Maintenance Hubs (6 CONUS, 4 OCONUS) |
| **D-Level** | Depot | Structural rebuild, ceramic tile re-gilding, MXene recoating, auxetic foam replacement | ≤ 30 days | Depot Facilities (2 CONUS: Anniston, Red River; 1 OCONUS: Kaiserslautern) |

**Mathematical Model — Echelon Allocation**:

The optimal echelon assignment minimizes total lifecycle cost $C_{total}$:

$$
C_{total} = \sum_{i \in \{O,I,D\}} \left( C_{fixed,i} + C_{variable,i} \cdot \lambda_i + C_{transport,i} \cdot d_i \right)
$$

Where:
- $C_{fixed,i}$ = Fixed facility cost at echelon $i$ ($M)
- $C_{variable,i}$ = Variable cost per repair action at echelon $i$ ($K)
- $\lambda_i$ = Annual repair demand rate at echelon $i$ (actions/year)
- $C_{transport,i}$ = Transport cost per km per kg ($/km·kg)
- $d_i$ = Average transport distance to echelon $i$ (km)

Subject to availability constraint:
$$
A_{system} = \prod_{i} \left( 1 - \frac{MTTR_i}{MTTR_i + MTBF_i} \right) \geq 0.95
$$

Where $MTTR_i$ = Mean Time To Repair at echelon $i$, $MTBF_i$ = Mean Time Between Failures for items repaired at echelon $i$.

### 1.3 Regional Hub Topology

Six CONUS and four OCONUS Regional Maintenance Hubs (RMH) form the I-Level backbone:

```
CONUS Hubs:        OCONUS Hubs:
├── West Coast     ├── EUCOM (Kaiserslautern, DE)
│   ├── Edwards    ├── INDOPACOM (Kadena, JP)
│   └── China Lake ├── CENTCOM (Al Udeid, QA)
├── Central        └── AFRICOM (Stuttgart, DE)
│   ├── Hill
│   └── Tinker
├── East Coast
│   ├── Robins
│   └── Cherry Point
└── Reserve/Guard
    └── McConnell
```

Each RMH maintains **Contingency Stock Packages (CSP)** sized for 30-day sustained operations:

$$
CSP_{k} = \max_{s \in Scenarios} \left( \sum_{j \in LRU_k} \lambda_{j,s} \cdot T_{s} \cdot (1 + \sigma_{j}) \right)
$$

Where:
- $k$ = Hub index
- $j$ = LRU (Line Replaceable Unit) index
- $s$ = Operational scenario (Major Combat, Contingency, Peacetime)
- $\lambda_{j,s}$ = Failure rate of LRU $j$ in scenario $s$ (failures/flight-hour)
- $T_{s}$ = Scenario duration (flight-hours)
- $\sigma_{j}$ = Safety factor for LRU $j$ (typically 1.5–2.0)

### 1.4 Inventory Positioning — Multi-Echelon Inventory Optimization (MEIO)

The AIMES LSC employs **Multi-Echelon Inventory Optimization (MEIO)** per ISO 13374-4 and SAE AS6294 §7.2. The objective is to minimize total inventory investment while meeting system availability targets:

$$
\min \sum_{i \in Echelons} \sum_{j \in LRUs} h_j \cdot I_{i,j}
$$

Subject to:
$$
P( \text{Backorder}_{i,j} \leq B_{max} ) \geq 0.98 \quad \forall i,j
$$
$$
\sum_{i} I_{i,j} \geq \text{ROP}_{j} \quad \forall j
$$

Where:
- $h_j$ = Holding cost rate for LRU $j$ ($/unit/year)
- $I_{i,j}$ = Inventory level of LRU $j$ at echelon $i$
- $B_{max}$ = Maximum allowable backorders (typically 0 for critical LRUs)
- $\text{ROP}_{j}$ = Reorder Point for LRU $j$ = $\mu_{LT,j} \cdot \lambda_j + z_{\alpha} \cdot \sigma_{LT,j} \cdot \sqrt{\lambda_j}$

**Algorithm**: Greedy marginal analysis with Lagrangian relaxation for budget constraints. Re-optimization triggered quarterly or when demand forecast shifts >15%.

---
