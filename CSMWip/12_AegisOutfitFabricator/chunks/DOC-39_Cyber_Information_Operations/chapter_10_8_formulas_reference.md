## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $SE_{total} = SE_R + SE_A + SE_M$ | Shielding effectiveness | 1.2 |
| 2 | $SE_R = 20 \log_{10}(Z_0 / 4Z_s)$ | Reflection loss | 1.2 |
| 3 | $SE_A = 8.686 \cdot t / \delta$ | Absorption loss | 1.2 |
| 4 | $d_{aperture} < \lambda_{min}/10$ | Mesh aperture limit | 1.2 |
| 5 | $f_{mod} = f_0(1 + \frac{\Delta f}{f_0}\sin(2\pi f_m t))$ | Spread-spectrum clocking | 1.3 |
| 6 | $V_{prot} = V_{threat} 10^{-SE/20} \frac{Z_{in}}{Z_{in}+Z_{src}}$ | Protected voltage | 1.4 |
| 7 | $g(x) = \arg\max_c \mathbb{P}_\epsilon(f(x+\epsilon)=c)$ | Randomized smoothing | 2.2 |
| 8 | $R_{cert} = \frac{\sigma}{2}(\Phi^{-1}(p_A)-\Phi^{-1}(p_B))$ | Certified radius | 2.2 |
| 9 | $\min_\theta \mathbb{E}[\max_{\|\delta\|\leq\epsilon} \mathcal{L}(f(x+\delta),y)]$ | Adversarial training | 2.2 |
| 10 | $\text{WM} = \mathbb{I}(\frac{1}{|\mathcal{T}|}\sum\mathbb{I}(f(x)=y^*) \geq 0.95)$ | Watermark verification | 2.3 |
| 11 | $\square(\text{Input Valid} \implies \lozenge_{\leq5\text{ms}}\text{Output Valid})$ | Runtime monitor property | 2.4 |
| 12 | $\text{Update Valid} = \text{Verify}(Sig) \land \text{Ver} > \text{Curr} \land \text{Hash} \in \text{Allow}$ | Firmware update check | 3.2 |
| 13 | $\text{TEK} = \text{KDF}(\text{ECDH}(sk_{ephem}, pk_{peer}), \text{salt})$ | PFS session key | 4.1 |
| 14 | $\text{SharedSecret} = \text{KDF}(\text{ECDH} \| \text{ML-KEM.Decaps})$ | Hybrid PQC KEM | 4.2 |
| 15 | $A(t) = \sum w_i \frac{|x_i(t)-\mu_i|}{\sigma_i+\epsilon}$ | Behavioral anomaly score | 5.1 |
| 16 | $H_n = \text{SHA3-256}(H_{n-1} \| \text{Log}_n)$ | Immutable log hash chain | 5.2 |
| 17 | $\text{CDI}_{layer} = \text{HMAC}_{K_{parent}}(\text{CodeHash} \| \text{Config})$ | DICE root of trust | 5.3 |
| 18 | $\text{Quote} = \text{Sign}_{AK}(\text{PCRs} \| \text{Nonce} \| \text{Timestamp})$ | Remote attestation | 5.3 |

---
