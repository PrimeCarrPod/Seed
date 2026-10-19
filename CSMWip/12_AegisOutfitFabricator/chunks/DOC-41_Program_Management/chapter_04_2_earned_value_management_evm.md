## 2. Earned Value Management (EVM)

### 2.1 EVM System — ANSI/EIA-748 Compliance

The AIMES program implements a **Full EVM System** compliant with **ANSI/EIA-748-D** 32 Guidelines, validated by DCMA EVMS Surveillance (Tier 1). The system integrates cost, schedule, and technical performance at the **Control Account (CA)** level.

**Control Account Structure** (representative):

| CA ID | WBS Element | CAM | Budget Type | EVM Method |
|-------|-------------|-----|-------------|------------|
| CA-001 | 1.1.1 Program Office | PM | Level of Effort (LOE) | Apportioned Effort |
| CA-002 | 1.2.1 Architecture | Chief Eng | Discrete | % Complete (0/100) |
| CA-003 | 1.3.1 RM-TS Edition | RM Lead | Discrete | Weighted Milestones |
| CA-004 | 1.3.5 Tile Fabrication | Mfg Eng | Discrete | Units Complete |
| CA-005 | 1.5.1 Ballistic Protection | Test Eng | Discrete | % Complete (0/50/100) |
| CA-006 | 1.6.4 Ceramic Production | Prod Eng | Discrete | Units Complete |
| CA-007 | 1.7.3 LFT&E | Test Lead | Discrete | Weighted Milestones |
| CA-008 | 1.8.1 Supply Chain | Log Eng | Discrete | % Complete (0/100) |

### 2.2 EVM Performance Metrics

**Core Formulas** (per ANSI/EIA-748):

$$
PV = \sum_{i \in Planned} Budget_i \quad \text{(Planned Value / BCWS)}
$$
$$
EV = \sum_{i \in Earned} Budget_i \quad \text{(Earned Value / BCWP)}
$$
$$
AC = \sum_{i \in Actual} Cost_i \quad \text{(Actual Cost / ACWP)}
$$

**Performance Indices**:

$$
CPI = \frac{EV}{AC} \quad \text{(Cost Performance Index)}
$$
$$
SPI = \frac{EV}{PV} \quad \text{(Schedule Performance Index)}
$$
$$
TCPI = \frac{BAC - EV}{EAC - AC} \quad \text{(To-Complete Performance Index)}
$$

**Variance Analysis**:

$$
CV = EV - AC \quad \text{(Cost Variance)}
$$
$$
SV = EV - PV \quad \text{(Schedule Variance)}
$$
$$
VAC = BAC - EAC \quad \text{(Variance at Completion)}
$$

**Estimate at Completion (EAC) Methods**:

| Method | Formula | When Used |
|--------|---------|-----------|
| **EAC1** | $EAC = AC + (BAC - EV)$ | Typical variance, future work at planned rate |
| **EAC2** | $EAC = AC + \frac{BAC - EV}{CPI}$ | Current cost variance continuing |
| **EAC3** | $EAC = AC + \frac{BAC - EV}{CPI \times SPI}$ | Cost and schedule variance continuing |
| **EAC4** | $EAC = AC + ETC_{bottoms-up}$ | Significant scope change, re-estimate |

**AIMES Program Targets** (per DoDI 5000.02):

| Metric | Green | Yellow | Red |
|--------|-------|--------|-----|
| **CPI** | ≥ 0.95 | 0.90–0.94 | < 0.90 |
| **SPI** | ≥ 0.95 | 0.90–0.94 | < 0.90 |
| **TCPI** | ≤ 1.10 | 1.10–1.20 | > 1.20 |
| **VAC** | ≥ -5% BAC | -5% to -10% | < -10% BAC |

### 2.3 Integrated Baseline Review (IBR)

IBR conducted post-CDR per **DoDI 5000.02** Enclosure 7:

- **Scope**: All CAs with Budget at Completion (BAC) > $500K
- **Team**: PM, CAMs, DCMA, PA&E, Service Cost Agency
- **Deliverables**: IBR Report, Risk Mitigation Plans, Corrective Action Requests (CARs)
- **Timeline**: 45 days post-CDR, before Milestone C

---
