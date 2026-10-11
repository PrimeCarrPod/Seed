9. Fastener form (aglet, hook/eye, aiglet)
10. Lining technique (bag lining vs. flat lining)
11. Edge finishing (pinked, bound, whipped)
12. Decorative program (embroidery, slashing, pinking)

**Similarity Metric for Continuous Parameters:**

$$\text{Sim}(P_m, P_m^{\text{hist}}) = \exp\left(-\frac{|P_m - P_m^{\text{hist}}|^2}{2\sigma_m^2}\right)$$

Where $\sigma_m$ is historical variance from extant garment measurements (V&A, MET, Kunsthistorisches collections).

### 3.2 Protection Efficacy Score (PES)

$$\text{PES} = \frac{1}{5}\sum_{t \in \mathcal{T}} \min\left(1, \frac{\Pi_t(\mathbf{x})}{\Pi_t^{\text{req}}}\right)$$

**Threat Vector Set $\mathcal{T}$:**
- $t_1$: Ballistic (NIJ IV)
- $t_2$: Thermal (1100°C/300s)
- $t_3$: EMI (60 dB @ 1 GHz)
- $t_4$: Directed Energy (ΔT ≤14°C)
- $t_5$: Force Trauma (≥65% reduction @ 50J)

