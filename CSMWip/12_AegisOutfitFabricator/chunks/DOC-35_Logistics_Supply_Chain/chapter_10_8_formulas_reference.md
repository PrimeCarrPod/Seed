## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $C_{total} = \sum_i (C_{fixed,i} + C_{variable,i}\lambda_i + C_{transport,i}d_i)$ | Total lifecycle cost | 1.2 |
| 2 | $A_{system} = \prod_i (1 - \frac{MTTR_i}{MTTR_i + MTBF_i})$ | System availability | 1.2 |
| 3 | $CSP_k = \max_s \sum_j \lambda_{j,s} T_s (1+\sigma_j)$ | Contingency stock package | 1.3 |
| 4 | $\min \sum_{i,j} h_j I_{i,j}$ s.t. availability constraints | MEIO objective | 1.4 |
| 5 | $\text{ROP}_j = \mu_{LT,j}\lambda_j + z_\alpha \sigma_{LT,j}\sqrt{\lambda_j}$ | Reorder point | 1.4 |
| 6 | $\text{Initial Spares}_j = \lceil \lambda_j T_{pipeline}(1+k_u) \rceil$ | Initial provisioning | 2.2 |
| 7 | $\text{Demand}_j(t) = \sum_k \mathbb{P}(RUL_{j,k} < \Delta t)$ | PHM-driven demand | 2.3 |
| 8 | $\text{ROP}^{dynamic}_j(t) = \text{ROP}^{static}_j + \alpha \cdot \text{Demand}_j(t) \sqrt{L_j}$ | Dynamic reorder point | 2.3 |
| 9 | Croston's Method: $\hat{z}, \hat{p}$ update equations | Intermittent demand forecast | 2.4 |
| 10 | $SS_j = z_{SL} \cdot \sigma_{LTD,j}$ | Safety stock | 2.5 |
| 11 | $\sigma_{LTD}^2 = \lambda L (\mu_D^2+\sigma_D^2) + \lambda \mu_D^2 \sigma_L^2$ | Compound Poisson LTD variance | 2.5 |
| 12 | $A_{cold} = \prod A_{seg} A_{facility} A_{monitor}$ | Cold chain availability | 3.2 |
| 13 | $TRI = \sum P(threat) I(threat) V(asset)$ | Transport risk index | 3.3 |
| 14 | $t_{SL}(T) = t_{ref} \exp[\frac{E_a}{R}(\frac{1}{T}-\frac{1}{T_{ref}})]$ | Arrhenius shelf-life | 4.2 |
| 15 | $\text{Extend if } \bigwedge_k (X_k/X_{k,spec} \geq \theta_k)$ | SLET decision rule | 4.3 |
| 16 | $\text{ORI}_j = P_{obs,j} I_{impact,j} U_{urgency,j}$ | Obsolescence risk index | 5.2 |
| 17 | $M_{recovered}(t) = \sum \eta_m m_{k,m} \delta(t-t_{retire,k})$ | Material recovery flow | 6.3 |
| 18 | $f_{reint} = \frac{\sum \eta_m m_m \cdot \text{RetirementRate}}{\text{ProductionRate} \sum m_m}$ | Reintegration fraction | 6.3 |

---
