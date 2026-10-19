## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $Am = \frac{MTBM}{MTBM + MDT}$ | Materiel Availability | 1.1 |
| 2 | $Ao = \frac{Uptime}{Uptime + Downtime}$ | Operational Availability | 1.1 |
| 3 | $CPUS = \frac{Total\ O\&S}{Fleet\ Size}$ | Cost Per Unit Sustained | 1.1 |
| 4 | $\min \sum_{i,j} x_{i,j} C_{i,j}$ s.t. constraints | LORA Optimization | 3.1 |
| 5 | $Q_{system} = (1-\beta) Q_{channel}^n + \beta Q_{channel}$ | CCF Model (from DOC-43) | 3.1 |
| 6 | $Fee = Fee_{target} + \sum w_i \cdot \text{sign}(\Delta) \cdot \min(|\Delta|, Cap) \cdot Rate$ | PBL Incentive Fee | 2.2 |
| 7 | $\text{Demand}_{j}(t) = \sum_k \mathbb{P}(RUL_{j,k} < \Delta t \mid \mathcal{H}_t)$ | Predictive Spares Demand | 4.3 |
| 8 | $NPV = \sum_{t=0}^{T} \frac{Benefits_t - Costs_t}{(1+r)^t}$ | BCA Net Present Value | 5.2 |

---
