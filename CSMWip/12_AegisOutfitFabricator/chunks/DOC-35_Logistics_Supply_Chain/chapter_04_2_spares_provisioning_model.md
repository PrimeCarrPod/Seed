## 2. Spares Provisioning Model

### 2.1 Provisioning Methodology

The AIMES spares provisioning follows **ISO 13374-2** data exchange standards and **SAE AS6294** Prognostics and Health Management (PHM) data requirements. Initial provisioning uses **Variable Operating and Maintenance Cost (VOMC)** model; sustainment uses **PHM-driven dynamic provisioning**.

### 2.2 Initial Provisioning — VOMC Model

Initial spares kit per 100 suits (per MIL-STD-1540 Appendix A):

$$
\text{Initial Spares}_{j} = \lceil \lambda_j \cdot T_{pipeline} \cdot (1 + k_{uncertainty}) \rceil
$$

Where:
- $\lambda_j$ = Predicted failure rate (failures/1000 flight-hours) from DFMEA (DOC-32 §4.3)
- $T_{pipeline}$ = Pipeline time (days) = Procurement Lead Time + Repair Turnaround Time
- $k_{uncertainty}$ = Uncertainty factor: 0.5 (mature), 1.0 (new), 2.0 (first-article)

**Pipeline Time Components**:
| Component | O-Level | I-Level | D-Level |
|-----------|---------|---------|---------|
| Procurement Lead Time | 30 days | 90 days | 180 days |
| Repair Turnaround | 4 hrs | 72 hrs | 30 days |
| Admin/Transport | 2 days | 7 days | 14 days |
| **Total** | **32 days** | **97 days** | **224 days** |

### 2.3 PHM-Driven Dynamic Provisioning

Per SAE AS6294 §6 and ISO 13374-4, the CBM+ system continuously updates spares requirements using **Remaining Useful Life (RUL)** distributions from embedded PHM sensors (DOC-29 Sensor Suite):

$$
\text{Demand}_{j}(t) = \sum_{k=1}^{N_{suits}} \mathbb{P}(RUL_{j,k} < \Delta t_{horizon})
$$

Where:
- $N_{suits}$ = Active fleet size at hub
- $RUL_{j,k}$ = Remaining Useful Life of LRU $j$ on suit $k$ (hours)
- $\Delta t_{horizon}$ = Planning horizon (typically 90 days)

The **Dynamic Reorder Point** adjusts in real-time:

$$
\text{ROP}_{j}^{dynamic}(t) = \text{ROP}_{j}^{static} + \alpha \cdot \text{Demand}_{j}(t) \cdot \sqrt{L_j}
$$

Where $\alpha$ = responsiveness parameter (0.3–0.7), $L_j$ = Lead time for LRU $j$.

### 2.4 Demand Forecasting — Croston's Method for Intermittent Demand

AIMES LRU demand is intermittent (many zero-demand periods). **Croston's Method** (per ISO 13374-4 Annex B) separates demand size and interval:

$$
\hat{z}_{t+1} = \alpha \cdot z_t + (1-\alpha) \cdot \hat{z}_t \quad \text{(demand size)}
$$
$$
\hat{p}_{t+1} = \beta \cdot p_t + (1-\beta) \cdot \hat{p}_t \quad \text{(demand interval)}
$$
$$
\text{Forecast} = \frac{\hat{z}_{t+1}}{\hat{p}_{t+1}}
$$

Where $z_t$ = demand size when demand occurs, $p_t$ = intervals between demands. Parameters $\alpha = 0.1$, $\beta = 0.1$ per SAE AS6294 recommendation for aerospace spares.

### 2.5 Safety Stock Calculation

For critical LRUs (availability impact > 0.01), safety stock uses **Service Level Approach**:

$$
SS_j = z_{SL} \cdot \sigma_{LTD,j}
$$

Where:
- $z_{SL}$ = Standard normal deviate for target service level (SL=0.98 → $z=2.05$)
- $\sigma_{LTD,j}$ = Standard deviation of Lead Time Demand

For **compound Poisson demand** (typical for spares):
$$
\sigma_{LTD,j}^2 = \lambda_j \cdot L_j \cdot (\mu_{D}^2 + \sigma_{D}^2) + \lambda_j \cdot \mu_{D}^2 \cdot \sigma_{L}^2
$$

Where $\mu_D, \sigma_D$ = mean/std of demand size; $\mu_L, \sigma_L$ = mean/std of lead time.

---
