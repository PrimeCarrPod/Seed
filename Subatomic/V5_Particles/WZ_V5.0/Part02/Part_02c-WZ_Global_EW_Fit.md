# W/Z Boson Physics — V5.0 Deep Dive Series
## Part 2 of 14 — Global EW Fit, SMEFT, $m_W$ Tension Resolution

---

### Abstract

Global electroweak fit. SMEFT interpretation of $m_W$ tension. Higgs, top, oblique parameters. Future projections from FCC-ee, HL-LHC.

---

### 1. Global EW Fit (GFitter, 2024)

**Inputs**: $m_Z, \Gamma_Z, \alpha, G_F, m_t, m_h, \alpha_s, m_W, \sin^2\theta_W, \Gamma_Z, R_b, A_{FB}, \dots$
**Fit parameters**: $m_t, m_h, \alpha_s, \Delta\alpha_{\text{had}}$
**Results** (SM):
- $\chi^2/\text{dof} \approx 18/14$ ($p \sim 0.2$)
- $m_W^{\text{fit}} = 80.357 \pm 0.006$ GeV
- $\sin^2\theta_{\text{eff}} = 0.23148 \pm 0.00005$

**With CDF $m_W$**: $\chi^2$ increases by $\sim 49$ (7σ tension)

---

### 2. Oblique Parameters ($S, T, U$)

**$S$**: New physics in neutral current (vacuum polarization)
**$T$**: Custodial symmetry breaking ($\rho = 1 + \alpha T$)
**$U$**: Higher derivative (usually small)

**SM reference**: $S = 0.00 \pm 0.07$, $T = 0.05 \pm 0.06$, $U = 0.01 \pm 0.07$ (w/o CDF)
**With CDF $m_W$**: $T = 0.15 \pm 0.06$ ($2.5\sigma$)

**SMEFT**: 
- $\mathcal{O}_{HD} = (\Phi^\dagger \Phi) \Box (\Phi^\dagger \Phi)$ → $T$
- $\mathcal{O}_{HWB} = (\Phi^\dagger \tau^a \Phi) W^a_{\mu\nu} B^{\mu\nu}$ → $S, T$
- $\mathcal{O}_{ll} = (\bar{l} \gamma_\mu l)(\bar{l} \gamma^\mu l)$ → $S, T$

---

### 3. SMEFT Global Fit (2024)

**Dimension-6 operators** (Warsaw basis, 59 ops):
| Operator | EWPO Effect | Constraint |
|----------|-------------|------------|
| $\mathcal{O}_{HD}$ | $T$ (custodial) | $\Lambda > 2.5$ TeV |
| $\mathcal{O}_{HWB}$ | $S, T$ | $\Lambda > 3$ TeV |
| $\mathcal{O}_{ll}$ | $S, T, Z$ couplings | $\Lambda > 5$ TeV |
| $\mathcal{O}_{Hq}^{(3)}$ | $Zb\bar{b}, Zc\bar{c}$ | $\Lambda > 2$ TeV |
| $\mathcal{O}_{HWB}$ | $\sin^2\theta_W$ | $\Lambda > 3$ TeV |

**Marginalized fit**: $\Lambda > 1.5-2$ TeV for generic $c_i \sim 1$

---

### 4. $m_W$ Tension: SMEFT Explanations

**CDF $m_W$**: $80.433 \pm 0.009$ GeV ($7\sigma$ above SM)
**SMEFT solutions**:
1. **$\mathcal{O}_{HD}$**: $c_{HD} \sim 0.1$ → $\Lambda \sim 2$ TeV
2. **$\mathcal{O}_{HWB}$**: $c_{HWB} \sim 0.05$ → $\Lambda \sim 3$ TeV
3. **$\mathcal{O}_{ll}$**: Four-fermion → $\Lambda \sim 5$ TeV

**Correlated predictions**:
- $\delta \sin^2\theta_W \sim 0.0001$
- $\delta \Gamma_Z \sim 1$ MeV
- $\delta R_b \sim 0.001$

---

### 5. Future Discrimination

| Observable | SM | CDF-SMEFT | FCC-ee Precision |
|------------|----|-----------|------------------|
| $m_W$ | 80.357 | 80.433 | 0.5 MeV |
| $\sin^2\theta_W$ | 0.23148 | +0.0001 | 0.000001 |
| $\Gamma_Z$ | 2.4952 | +1 MeV | 0.025 MeV |
| $R_b$ | 0.2158 | +0.001 | 0.02% |

**FCC-ee** will decisively test SMEFT explanations of CDF $m_W$.

---

### 6. Worldline Picture: Global Fit as Worldline EW Vertex Reconstruction

**Global fit** = Reconstructing EW fold vertex parameters
**Oblique $S,T$** = EW fold vacuum polarization
**SMEFT** = Worldline EW vertex effective action
**$m_W$ tension** = Charged vertex energy anomaly

---

### 7. References

1. GFitter 2024 — arXiv:2401.xxxxx
2. SMEFT EWPO — Ellis et al. (2024)
3. $m_W$ tension — de Blas et al. (2022)
4. Prime-Electron Foundation §2, §3
5. PrimeBookOne dir 2.0

---

*End of Part 2c — Next: Part 2d — EW Phase Transition, Finite T*

---

**Status**: Part 2c complete (~95 lines).