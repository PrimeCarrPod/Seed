## 3. Spares Provisioning Model

### 3.1 LRU Classification & Criticality Matrix (Per SAE AS6294)

| LRU Category | Examples | Criticality | O-Level Stock | I-Level Stock | D-Level Stock |
|--------------|----------|-------------|---------------|---------------|---------------|
| **CLASS A** | Neuromorphic ASIC, MHD Stack, Ceramic Tile Array | Mission-Critical | 1 per 50 units | 1 per 10 units | 2-year reserve |
| **CLASS B** | MR Fluid Module, Battery Pack, Aerogel Panel | Mission-Essential | 1 per 20 units | 1 per 5 units | 1-year reserve |
| **CLASS C** | Framework Segments, Seal Kits, Lacing Sets | Support | 1 per 10 units | 1 per 3 units | 6-month reserve |
| **CLASS D** | Cleaning Supplies, Lubricants, PPE | Routine | 90-day supply | 180-day supply | Bulk |

### 3.2 Demand Forecasting Model (ISO 13374 + SAE AS6294)

**Failure Rate Estimation (Weibull):**
$$\lambda(t) = \frac{\beta}{\eta} \left( \frac{t}{\eta} \right)^{\beta-1}$$

Where $\beta$ = shape parameter (1.5–2.5 for AIMES LRUs), $\eta$ = scale parameter (MTBF).

**Spares Demand per Hub per Quarter:**
$$D_{q,h} = \sum_{i \in \text{LRU}_h} \left[ N_h \times \int_{t_q}^{t_{q+1}} \lambda_i(t) dt \right] \times (1 + \gamma_{ops})$$

Where:
- $N_h$ = Units supported by hub $h$
- $\gamma_{ops}$ = Operational tempo factor (1.0 peacetime, 2.5 contingency)

**Safety Stock Calculation (Service Level 98%):**
$$SS_{i,h} = z_{0.98} \times \sigma_{D,i,h} \times \sqrt{L_i}$$
Where $z_{0.98} = 2.05$, $\sigma_{D}$ = demand standard deviation, $L_i$ = lead time (weeks).

### 3.3 Provisioning Algorithm (Automated via GLO)

```
PROVISIONING CYCLE (Weekly):

INPUTS:
  - PHM Health Index trends (all units)
  - Current inventory positions (all tiers)
  - In-transit visibility (GPS/RFID)
  - Production schedule (OEM)
  - DMSMS alerts (SAE AS6294)

ALGORITHM:
  1. FOR each LRU i at each hub h:
       a. Compute 13-week demand forecast D_hat[i,h,1..13]
       b. Compute current coverage: C[i,h] = (OnHand + InTransit) / D_hat[i,h,1..4]
       c. IF C[i,h] < 1.2: Generate replenishment order
       d. Optimize: Source from (nearest hub with excess) OR (D-Level) OR (OEM)
       e. Apply constraints: Cold chain, HAZMAT, ITAR, budget

  2. CROSS-HUB BALANCING:
       - Solve min-cost flow: min Σ c_{h1,h2} × qty
       - Subject to: hub minimums, transport capacity, shelf-life

  3. STRATEGIC AIRLIFT TRIGGER:
       IF (Class A coverage < 1.0 at any hub) OR (DMSMS critical):
           Activate AMC C-17/C-5 mission (MIL-STD-2073)

OUTPUTS:
  - Replenishment orders (EDI 850)
  - Redistribution orders (hub-to-hub)
  - Production release orders (OEM)
  - DMSMS mitigation work orders
  - Phoenix Protocol recovery schedules
```

---
