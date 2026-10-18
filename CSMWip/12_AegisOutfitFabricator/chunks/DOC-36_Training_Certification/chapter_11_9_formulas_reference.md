## 9. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $V(t) = \exp(-\lambda_{skill} t - \lambda_{tech} \Delta T_{tech})$ | Certification validity decay | 1.2 |
| 2 | $\text{Competency} = \bigcup_k \{(k, \text{Proficiency}_k, \text{Criticality}_k)\}$ | KSA competency model | 1.3 |
| 3 | $W_{total} = \sum_k \text{Criticality}_k \cdot \mathbb{I}(\text{Prof}_k \geq \text{Req}_k)$ | Competency weighting | 1.3 |
| 4 | $f(t; k, \lambda) = \frac{k}{\lambda} (\frac{t}{\lambda})^{k-1} e^{-(t/\lambda)^k}$ | LRU swap time distribution | 3.2 |
| 5 | $\text{BIT Status} = \text{PASS/DEGRADED/FAIL}$ logic | BIT result interpretation | 2.3 |
| 6 | $\text{Action} = \text{Monitor/Schedule/Immediate/Ground}$ | RUL decision logic | 3.4 |
| 7 | $RUL_{reported} = \hat{RUL} \pm z_{0.95} \sigma_{RUL}$ | RUL confidence interval | 3.4 |
| 8 | $\text{Learning Gain} = \frac{\text{Post} - \text{Pre}}{\text{Max} - \text{Pre}} \geq 0.70$ | Kirkpatrick Level 2 | 4.2 |
| 9 | $\text{Transfer Rate} = \frac{N_{applying}}{N_{graduates}} \geq 0.85$ | Kirkpatrick Level 3 | 4.2 |
| 10 | $\Delta P_{comp} = \rho_{sw} g h - P_{internal}$ | Pressure compensation | 5.3 |
| 11 | $\tau_{comp} = \frac{V_{chamber} \beta_{fluid}}{A_{piston} K_{valve}} \leq 50 \text{ ms}$ | Compensation response time | 5.3 |
| 12 | $\text{Score} = \sum_i w_i (1 - \frac{|t_a - t_t|}{t_t}) \mathbb{I}(\text{Correct}_i)$ | AAR automated scoring | 6.4 |
| 13 | $\text{Currency} = \frac{\sum \mathbb{I}(\text{Mission completed})}{N_{required}} \geq 1.0$ | Mission currency | 7.2 |

---
