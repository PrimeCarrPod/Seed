## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $\hat{x} = \frac{\sum w_k x_k}{\sum w_k}$, $w_k = 1/\sigma_k^2$ | Sensor fusion estimate | 1.2 |
| 2 | $\text{Confidence} = 1 - \frac{\sqrt{\sum w_k (x_k - \hat{x})^2}}{\hat{x}}$ | Fusion confidence | 1.2 |
| 3 | $\text{EMA}_t = \alpha_t x_t + (1-\alpha_t)\text{EMA}_{t-1}$ | Adaptive EMA | 1.3 |
| 4 | $\text{ROC}_t = (\text{EMA}_t - \text{EMA}_{t-\Delta t})/\Delta t$ | Rate of change alarm | 1.3 |
| 5 | $\text{Deploy} = \mathbb{I}(\text{Blast} \lor \text{Amputation} \lor \text{Voice} \lor \text{Remote})$ | Tourniquet auto-deploy | 2.1 |
| 6 | $B_{telemed} = \sum p_i b_i \leq B_{avail}$ | Bandwidth allocation | 3.1 |
| 7 | $\text{Triage} = \arg\max_c P(c | \mathbf{v}, \mathbf{h}, \mathbf{m})$ | AI triage inference | 3.2 |
| 8 | $\text{Fire}_i = \mathbb{I}(\text{Detect}_i \geq \theta_i) \land \mathbb{I}(\text{Time} > \text{Refractory})$ | Auto-injector logic | 4.1 |
| 9 | $D_{cum}(t) = \int_0^t \dot{D}(\tau) d\tau$ | Cumulative radiation dose | 4.2 |
| 10 | $RTHI = \sum w_i f_i(x_i)$ | Real-time health index | 5.1 |
| 11 | $\text{MEDEVAC} = \mathbb{I}(RTHI < 0.4) \lor \mathbb{I}(T1) \lor \mathbb{I}(\text{BLACK} > 15\text{min})$ | Evacuation trigger | 5.2 |
| 12 | $H_n = \text{SHA256}(H_{n-1} \| \text{Entry}_n)$ | Medical log hash chain | 5.3 |
| 13 | $\max \sum S_j \mathbb{I}(\text{Treated}_j)$ s.t. resource constraints | MASCAL optimization | 6.2 |

---
