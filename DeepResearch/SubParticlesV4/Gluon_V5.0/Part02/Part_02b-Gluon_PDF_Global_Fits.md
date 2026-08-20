# Gluon Physics — V5.0 Deep Dive Series
## Part 2 of 14 — Gluon PDFs: Global Fits & NNLO/N3LO

---

### Abstract

Global QCD analyses for gluon PDF. NNPDF4.0, MSHT20, CT18, HERAPDF. NNLO evolution, N3LO splitting functions. LHC constraints (jets, Z p_T, tt̄, gg→H). Theoretical uncertainties.

---

### 1. Global Fit Landscape (2024)

| Group | Order | Data Sets | Gluon Param. | Key Features |
|-------|-------|-----------|--------------|--------------|
| **NNPDF4.0** | NNLO | 4000+ pts | Neural net (259 pars) | Monte Carlo replicas |
| **MSHT20** | NNLO | 3500+ pts | 28 parameters | Hessian + dynamic tolerance |
| **CT18** | NNLO | 3000+ pts | 28 parameters | Hessian, tolerance Δχ²=100 |
| **HERAPDF2.0** | NNLO | HERA only | 14 parameters | Model dependence study |

---

### 2. Gluon Constraints from LHC

| Process | Observable | x range | Gluon Sensitivity |
|---------|------------|---------|-------------------|
| **Inclusive jets** | dσ/dp_T, dσ/dy | 0.01-0.5 | Direct g+g, g+q |
| **Z p_T** | p_T^Z spectrum | 10⁻⁴-0.1 | g→q q̄ at low x |
| **tt̄** | dσ/dM_tt̄, dσ/dy | 0.1-0.3 | g+g → tt̄ |
| **gg→H** | σ(gg→H) | 0.01-0.1 | g(x₁)g(x₂) |
| **Dijet mass** | dσ/dM_jj | 0.1-0.5 | g+g, g+q |
| **Prompt photon** | dσ/dp_T^γ | 0.05-0.3 | g+q → γ+q |

**LHC Run 2 legacy**: Gluon PDF uncertainty reduced by 30-50% at x=0.01-0.1.

---

### 3. N3LO Splitting Functions (2024 Complete)

**P_{gg}^{(3)}, P_{gq}^{(3)}, P_{qg}^{(3)}, P_{qq}^{(3)}** — full N3LO kernels

**Mellin space**: γ_{gg}(N) = γ_{gg}^{(0)} + a_s γ_{gg}^{(1)} + a_s² γ_{gg}^{(2)} + a_s³ γ_{gg}^{(3)}

**x-space**: P_{gg}(x) = δ(1-x) + Σ a_s^n P_{gg}^{(n)}(x)

**Impact**: Reduces scale uncertainty by ~50% at NNLO→N3LO.

---

### 4. Gluon at Small-x: BFKL & Saturation

**BFKL (LL)**: g(x,Q²) ~ x^{-λ}, λ = 4ln2 α_s N_c/π

**NLL BFKL**: Collinear improvement, running coupling

**Saturation boundary**: Q_s²(x) = Q_0² (x_0/x)^λ

**Prime-Electron**: Small-x gluons = high proper-time density (dir 3.0 UV) → worldline overlap.

---

### 5. Theoretical Uncertainties

| Source | Gluon Uncertainty | Mitigation |
|--------|-------------------|------------|
| **Scale variation** | 2-5% | N3LO + resummation |
| **α_s** | 1-3% | Lattice α_s input |
| **Higher-twist** | <1% (x>0.01) | Kinematic cuts |
| **Nuclear corrections** | 2-10% (nPDF) | EIC will constrain |
| **Parametrization** | 1-3% | Neural net flexibility |

---

### 6. Worldline Picture: Global Fit as Worldline Density Reconstruction

Global fit = reconstructing worldline fold density g(x,μ²) from scattering data.
Each data point = measurement of worldline segment density at (x,μ²).
Neural net = non-parametric worldline density estimator.

---

### 7. References

1. NNPDF4.0 (2021/2024) — EPJC 82, 428
2. MSHT20 (2020) — EPJC 80, 1172
3. CT18 (2019) — PRD 100, 114012
4. N3LO splitting — arXiv:2305.xxxxx, 2401.xxxxx
5. Prime-Electron Foundation §3.1

---

*End of Part 2b — Next: Part 2c — Lattice Gluon PDF Details*

---

**Status**: Part 2b complete (~95 lines).