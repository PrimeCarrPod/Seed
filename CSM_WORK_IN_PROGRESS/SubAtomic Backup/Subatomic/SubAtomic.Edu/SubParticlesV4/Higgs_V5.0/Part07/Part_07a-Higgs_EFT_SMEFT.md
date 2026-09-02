# Higgs Physics — V5.0 Deep Dive Series
## Part 7 of 14 — Higgs EFT: SMEFT, HEFT, Dimension-6 Operators, Matching

---

### Abstract

Higgs Effective Field Theory. SMEFT (dim-6) vs HEFT (non-linear). Operator basis, matching to UV, global fits. Higgs basis, Warsaw basis.

---

### 1. SMEFT: Linear Higgs EFT

**Higgs doublet**: $\Phi = \frac{1}{\sqrt{2}} (0, v+h)^T$
**Lagrangian**: $\mathcal{L}_{\text{SMEFT}} = \mathcal{L}_{\text{SM}} + \sum_i \frac{c_i}{\Lambda^2} \mathcal{O}_i^{(6)} + \dots$

**Warsaw basis** (59 operators for 1 generation):
- $\mathcal{O}_H = (\Phi^\dagger \Phi) \Box (\Phi^\dagger \Phi)$
- $\mathcal{O}_{H\Box} = (\Phi^\dagger \Phi) \Box (\Phi^\dagger \Phi)$
- $\mathcal{O}_{HG} = (\Phi^\dagger \Phi) G^2$
- $\mathcal{O}_{HW} = (\Phi^\dagger \Phi) W^2$
- $\mathcal{O}_{HB} = (\Phi^\dagger \Phi) B^2$
- $\mathcal{O}_{HWB} = (\Phi^\dagger \tau^a \Phi) W^a_{\mu\nu} B^{\mu\nu}$
- $\mathcal{O}_{y_f} = (\Phi^\dagger \Phi) (\bar{f}_L \Phi f_R)$
- $\mathcal{O}_{HD} = |D_\mu \Phi|^4$
- $\mathcal{O}_{ll}, \mathcal{O}_{lq}, \dots$ (4-fermion)

**Higgs basis**: Diagonalizes kinetic terms, $\kappa$ parameters directly

---

### 2. HEFT: Non-Linear Higgs EFT

**Goldstone bosons**: $\Sigma = \exp(i \pi^a \tau^a / v)$
**Higgs as singlet**: $h$ (not in doublet)
**Lagrangian**: $\mathcal{L}_{\text{HEFT}} = \mathcal{L}_{\text{SM}} + \mathcal{L}_{\text{HEFT}}^{(4)} + \dots$

**Useful when**: EW symmetry broken non-linearly, $h$ not part of doublet
**LO**: $F(h) \partial_\mu \Sigma^\dagger \partial^\mu \Sigma + G(h) B_{\mu\nu} B^{\mu\nu} + \dots$

**Connection**: SMEFT → HEFT when $\Lambda \sim v$ (non-decoupling)

---

### 3. Matching: UV → SMEFT

**Tree-level matching**: 
- Heavy scalar $S$: $\mathcal{O}_H, \mathcal{O}_{HD}$
- Heavy vector $V$: $\mathcal{O}_{HW}, \mathcal{O}_{HB}$
- Heavy fermion $F$: $\mathcal{O}_{y_f}, \mathcal{O}_{ll}$

**Loop matching** (2024):
- 1-loop matching known for many UV models
- RG evolution: $c_i(\mu) = \gamma_{ij} c_j(\Lambda)$

**SMEFT RG**: $\frac{d c_i}{d \ln \mu} = \gamma_{ij} c_j$ (3-loop known for some)

---

### 4. Global SMEFT Fits (2024)

**Data**: Higgs ($\kappa$), EWPO ($m_W, \sin^2\theta_W$), diboson, top, flavor
**Basis**: Warsaw or Higgs basis
**Marginalization**: 50+ operators, flat priors

**Key results**:
- $\Lambda > 1-2$ TeV for generic $c_i \sim 1$
- $\mathcal{O}_{HG}, \mathcal{O}_{HW}$ constrained by $h \to \gamma\gamma, gg$
- $\mathcal{O}_{y_t}$ constrained by $t\bar{t}h$

---

### 5. Worldline Picture: EFT as Worldline Effective Action

**SMEFT** = Worldline effective action (dim-6 = 6 worldline legs)
**HEFT** = Non-linear worldline action (Goldstones = fold fluctuations)
**Matching** = Integrating out heavy worldline folds
**RG** = Worldline proper-time scaling

---

### 6. References

1. SMEFT review — Brivio & Trott (2019)
2. HEFT — Buchalla et al. (2013)
3. Matching — Dawson et al. (2024)
4. Prime-Electron Foundation §3
5. PrimeBookOne dir 2.1-3.0

---

*End of Part 7a — Next: Part 8 — Higgs at High Energy: VBF, $hh$, $t\bar{t}h$*

---

**Status**: Part 7a complete (~95 lines).