## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $MTBF_c(t) = t / N(t)$ | Duane cumulative MTBF | 5.1 |
| 2 | $\lambda(t) = \lambda_0 \cdot t^{\beta-1}$ | AMSAA failure intensity | 5.1 |
| 3 | $T = 2 \cdot \chi^2_{1-\alpha, 2(r+1)} / \lambda_0$ | MTBF demo test time | 5.2 |
| 4 | $AF = \exp[\frac{E_a}{k_B}(\frac{1}{T_{use}} - \frac{1}{T_{test}})]$ | Acceleration factor | 5.2 |
| 5 | $\hat{R}(t) = \exp(-\int_0^t \hat{\lambda}(\tau) d\tau)$ | PHM reliability estimate | 5.3 |
| 6 | $MTBF_{CBM}(t) = 1/\hat{\lambda}(t)$ | Condition-based MTBF | 5.3 |
| 7 | $\frac{L_1}{L_0} = \prod f_1(x_i)/f_0(x_i)$ | Wald SPRT | 2.3 |
| 8 | $A = \beta/(1-\alpha), B = (1-\beta)/\alpha$ | SPRT boundaries | 2.3 |
| 9 | $\text{CI}_{95\%} = [\text{BetaInv}(0.025, x, n-x+1), \text{BetaInv}(0.975, x+1, n-x)]$ | LFT&E binomial CI | 3.4 |
| 10 | $P(\theta|x,n) \sim \text{Beta}(\alpha+x, \beta+n-x)$ | Bayesian survivability | 3.4 |
| 11 | $HIC_{15} = \max_{t_1,t_2} (t_2-t_1) \left[ \frac{1}{t_2-t_1} \int_{t_1}^{t_2} a(t) dt \right]^{2.5}$ | Head injury criterion | 3.3 |
| 12 | $BrIC = \sqrt{ \max(\frac{\omega_x}{\omega_{x,c}})^2 + (\frac{\omega_y}{\omega_{y,c}})^2 + (\frac{\omega_z}{\omega_{z,c}})^2 }$ | Brain injury criterion | 3.3 |
| 13 | $VC = \max( \dot{D} \cdot D )$ | Viscous criterion | 3.3 |
| 14 | $SE_{total} = SE_R + SE_A + SE_M$ | Shielding effectiveness | 1.2 (ref) |

---
