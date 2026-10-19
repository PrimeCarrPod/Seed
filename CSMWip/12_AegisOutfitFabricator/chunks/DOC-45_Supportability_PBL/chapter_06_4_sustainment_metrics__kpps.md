## 4. Sustainment Metrics & KPPs

### 4.1 Key Performance Parameters (KPPs) — Sustainment

| KPP | Threshold | Objective | Measurement |
|-----|-----------|-----------|-------------|
| **Materiel Availability (Am)** | 0.90 | 0.95 | GFIMS / LIMS-EV |
| **Operational Availability (Ao)** | 0.90 | 0.95 | Unit reported |
| **Mission Reliability** | 0.95 | 0.98 | Mission debrief (DOC-36) |
| **Cost Per Unit Sustained (CPUS)** | ≤ 12%/yr | ≤ 10%/yr | CAPE / VAMOSC |
| **Mean Time Between Maintenance (MTBM)** | 300 hrs | 500 hrs | Maintenance data |
| **Mean Down Time (MDT)** | ≤ 8 hrs | ≤ 4 hrs | Maintenance data |
| **Supply Response (MICAP)** | ≤ 72 hrs | ≤ 24 hrs | DOC-35 §3.4 |
| **Cannibalization Rate** | ≤ 2% | ≤ 0.5% | Maintenance data |
| **Technical Data Currency** | ≤ 60 days | ≤ 7 days | DOC-44 repository |

### 4.2 Leading Indicators — Predictive Sustainment

| Indicator | Source | Frequency | Alert Threshold |
|-----------|--------|-----------|-----------------|
| **PHM Health Index Trend** | DOC-29 | Continuous | HI < 0.7 for > 24h |
| **Supply Pipeline Health** | DOC-35 | Daily | Backorders > 5% |
| **Maintenance Backlog** | LIMS-EV | Weekly | > 10% fleet |
| **Cannibalization Rate** | LIMS-EV | Weekly | > 2% |
| **Training Currency** | DOC-36 | Monthly | < 90% certified |
| **Obsolescence Risk (ORI)** | DOC-35 | Quarterly | ORI > 30 (High) |

### 4.3 Sustainment Data Analytics — CBM+ Feedback Loop

**Data Flow**:

```
SENSORS (DOC-29) → PHM ALGORITHMS (DOC-30) → HEALTH INDEX → 
  CBM+ DECISION ENGINE → MAINTENANCE WORK ORDER → LIMS-EV → 
  METRICS DATABASE → DASHBOARD → PBL CONTRACTOR / GOV
```

**Predictive Algorithm** (RUL-based spares positioning):

$$
\text{Demand}_{j, hub}(t) = \sum_{k \in Fleet_{hub}} \mathbb{P}(RUL_{j,k} < \Delta t_{horizon} \mid \mathcal{H}_t)
$$

Where $\mathcal{H}_t$ = history up to time $t$. This drives **pre-positioning** per DOC-35 §2.3.

---
