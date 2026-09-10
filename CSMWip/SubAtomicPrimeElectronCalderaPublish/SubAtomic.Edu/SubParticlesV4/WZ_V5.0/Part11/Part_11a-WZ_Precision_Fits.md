# W/Z Boson Physics — V5.0 Deep Dive Series
## Part 11 of 14 — Precision Tests & Global Fits: $m_W$ Tension, SMEFT, $m_W$, $m_Z$, $\sin^2\theta_W$

---

### Abstract

Precision W/Z tests: global electroweak fit, SMEFT, $m_W$ tension (CDF vs ATLAS/LHCb), $m_Z$, $\sin^2\theta_W$, $\alpha_s$, $N_\nu$. New physics reach.

---

### 1. Global Electroweak Fit (GFitter 2024)

**Inputs**: $m_Z, \Gamma_Z, \alpha, G_F, m_t, m_h, \alpha_s, m_W, \sin^2\theta_W, \Gamma_Z, R_b, A_{FB}, \dots$
**Fit parameters**: $m_t, m_h, \alpha_s, \Delta\alpha_{\text{had}}$
**Results** (SM):
- $\chi^2/\text{dof} \approx 18/14$ ($p \sim 0.2$)
- $m_W^{\text{fit}} = 80.357 \pm 0.006$ GeV
- $\sin^2\theta_{\text{eff}} = 0.23148 \pm 0.00005$

**With CDF $m_W$**: $\chi^2$ increases by $\sim 49$ (7σ tension)

---

### 2. $m_W$ Tension: CDF vs World

**CDF (2022)**: $m_W = 80.433 \pm 0.009$ GeV (**7σ above SM**)
**ATLAS (2023)**: $m_W = 80.360 \pm 0.016$ GeV (consistent)
**LHCb (2024)**: $m_W = 80.354 \pm 0.023$ GeV (consistent)
**World avg (w/o CDF)**: $80.377 \pm 0.012$ GeV

**SMEFT explanations**:
1. $\mathcal{O}_{HD}$: $c_{HD} \sim 0.1$ → $\Lambda \sim 2$ TeV
2. $\mathcal{O}_{HWB}$: $c_{HWB} \sim 0.05$ → $\Lambda \sim 3$ TeV
3. $\mathcal{O}_{ll}$: Four-fermion → $\Lambda \sim 5$ TeV

---

### 3. Oblique Parameters ($S, T, U$)

**$S$**: Neutral current vacuum polarization
**$T$**: Custodial symmetry breaking ($\rho = 1 + \alpha T$)
**$U$**: Higher derivative (usually small)

**SM (w/o CDF)**: $S = 0.00 \pm 0.07$, $T = 0.05 \pm 0.06$, $U = 0.01 \pm 0.07$
**With CDF**: $T = 0.15 \pm 0.06$ ($2.5\sigma$)

**SMEFT mapping**:
- $\mathcal{O}_{HD}$ → $T$
- $\mathcal{O}_{HWB}$ → $S, T$
- $\mathcal{O}_{ll}$ → $S, T$

---

### 4. SMEFT Global Fit (2024)

**Dimension-6 operators** (Warsaw basis, 59 ops):
| Operator | Effect | Constraint |
|----------|--------|------------|
| $\mathcal{O}_{HD}$ | $T$ (custodial) | $\Lambda > 2.5$ TeV |
| $\mathcal{O}_{HWB}$ | $S, T$ | $\Lambda > 3$ TeV |
| $\mathcal{O}_{ll}$ | $S, T, Z$ couplings | $\Lambda > 5$ TeV |
| $\mathcal{O}_{Hq}^{(3)}$ | $Zb\bar{b}$ | $\Lambda > 2$ TeV |

**Marginalized**: $\Lambda > 1.5-2$ TeV for $c_i \sim 1$

---

### 5. Future Discrimination (FCC-ee)

| Observable | SM | CDF-SMEFT | FCC-ee Precision |
|------------|----|-----------|------------------|
| $m_W$ | 80.357 | 80.433 | 0.5 MeV |
| $\sin^2\theta_W$ | 0.23148 | +0.0001 | 0.000001 |
| $\Gamma_Z$ | 2.4952 | +1 MeV | 0.025 MeV |
| $R_b$ | 0.2158 | +0.001 | 0.02% |

**FCC-ee** will decisively test SMEFT explanations of CDF $m_W$.

---

### 6. Worldline Picture: Precision as EW Vertex Calibration

**Global fit** = Reconstructing EW fold vertex parameters
**Oblique $S,T$** = EW fold vacuum polarization
**SMEFT** = EW vertex effective action
**$m_W$ tension** = Charged EW vertex energy anomaly

---

### 7. References

1. GFitter 2024 — arXiv:2401.xxxxx
2. SMEFT EWPO — Ellis et al. (2024)
3. $m_W$ tension — de Blas et al. (2022)
4. Prime-Electron Foundation §3
5. PrimeBookOne dir 2.0

---

*End of Part 11a — Next: Part 12 — W/Z in Cosmology & Early Universe*

---

**Status**: Part 11a complete (~95 lines).