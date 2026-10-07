# Higgs Physics — V5.0 Deep Dive Series
## Part 2 of 14 — Higgs Couplings: Global $\kappa$ Fit, Anomalies, Projections

---

### Abstract

Global $\kappa$-framework fit combining all channels. Coupling correlations, EFT interpretation. Current anomalies, HL-LHC/FCC projections.

---

### 1. $\kappa$-Framework Global Fit

**Parameters**: $\kappa_V, \kappa_f, \kappa_\gamma, \kappa_g, \kappa_{Z\gamma}, \kappa_{t}, \kappa_{b}, \kappa_{\tau}, \kappa_{\mu}$

**Assumptions**:
- $\kappa_i = 1$ in SM
- No BSM decays ($BR_{\text{BSM}} = 0$)
- Narrow width approximation

**Likelihood**: $\mathcal{L}(\kappa) = \prod_i \text{Poisson}(n_i | \mu_i(\kappa))$

**Results** (ATLAS+CMS Run 2):
- $\kappa_V = 1.03 \pm 0.05$
- $\kappa_f = 1.00 \pm 0.07$
- $\kappa_\gamma = 1.10 \pm 0.07$
- $\kappa_g = 1.00 \pm 0.05$
- Correlation: $\rho(\kappa_V, \kappa_f) \approx -0.3$

---

### 2. SMEFT Interpretation

**Dimension-6 operators** affecting Higgs couplings:
- $\mathcal{O}_{H} = (\Phi^\dagger \Phi) \Box (\Phi^\dagger \Phi)$ → $\delta\kappa_V$
- $\mathcal{O}_{y_f} = (\Phi^\dagger \Phi) (\bar{f}_L \Phi f_R)$ → $\delta\kappa_f$
- $\mathcal{O}_{HG} = (\Phi^\dagger \Phi) G_{\mu\nu}^a G^{a\mu\nu}$ → $\delta\kappa_g$
- $\mathcal{O}_{HW}, \mathcal{O}_{HB}$ → $\delta\kappa_\gamma, \delta\kappa_{Z\gamma}$

**Global SMEFT fit** (2024): 50+ operators, marginalized

---

### 3. Current Anomalies (2024)

| Observable | SM | Measured | Significance |
|------------|----|----------|--------------|
| $\kappa_\gamma$ | 1.0 | $1.10 \pm 0.07$ | $1.4\sigma$ high |
| $\kappa_\mu$ | 1.0 | $1.1 \pm 0.3$ | $0.3\sigma$ |
| $\kappa_{Z\gamma}$ | 1.0 | $1.0 \pm 0.5$ | — |
| $m_W$ (CDF) | 80357 | 80433 ± 9 MeV | $7\sigma$ (vs SM) |

**Interpretation**: $\kappa_\gamma$ excess could be SUSY, 2HDM, vector-like fermions

---

### 4. HL-LHC Projections (3 ab⁻¹)

| Coupling | Current | HL-LHC | FCC-ee/eh/hh |
|----------|---------|--------|--------------|
| $\kappa_V$ | 5% | **1-2%** | **0.2-0.5%** |
| $\kappa_f$ | 7% | **3-5%** | **0.5-1%** |
| $\kappa_\gamma$ | 7% | **2-3%** | **0.5%** |
| $\kappa_g$ | 5% | **2-3%** | **0.5%** |
| $\kappa_\lambda$ | 50% | **50%** | **5-10%** |
| $\kappa_\mu$ | 30% | **10-15%** | **1-2%** |

---

### 5. Worldline Picture: Global Fit as Worldline Stiffness Reconstruction

**Global $\kappa$ fit** = reconstructing worldline fold-stiffness couplings
**Each $\kappa_i$** = response of fold type $i$ to stiffness
**SMEFT** = worldline effective action at dimension-6

---

### 6. References

1. ATLAS/CMS $\kappa$ combination — JHEP 2023
2. SMEFT global fit — Ellis et al. (2024)
3. HL-LHC projections — CERN-LPCC-2018-03
4. Prime-Electron Foundation §3, §4
5. PrimeBookOne dir 0.0-2.1

---

*End of Part 2d — Part 2 complete (2a-2d). Next: Part 3 — Higgs Self-Coupling & $hh$ Production*

---

**Status**: Part 2d complete (~95 lines). Part 2 complete (4 files).