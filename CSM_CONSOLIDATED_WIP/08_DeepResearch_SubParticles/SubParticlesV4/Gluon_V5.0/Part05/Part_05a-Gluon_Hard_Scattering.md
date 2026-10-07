# Gluon Physics — V5.0 Deep Dive Series
## Part 5 of 14 — Gluon in Hard Scattering: DIS, pp→jet, gg→H, N3LO

---

### Abstract

Gluon-initiated hard processes. DIS at small-x, inclusive jets at LHC, Higgs production gg→H, di-Higgs gg→HH. N3LO corrections, threshold resummation, scale uncertainties.

---

### 1. Deep Inelastic Scattering: Gluon at Small-x

**DIS cross section**: 
$$dσ/dx dQ² = \frac{4πα^2}{xQ^4} \left[ (1-y+½y²) F₂(x,Q²) - y² F_L(x,Q²) \right]$$

**Gluon dominance at small-x**: F₂ ~ g(x,Q²) ⊗ C_{2,g}

**N3LO coefficient functions**: C_{2,g}^{(3)} complete (2024)

**EIC**: Direct gluon measurement via F_L, charm production (g→c c̄)

---

### 2. Inclusive Jets at LHC

**Process**: pp → jet + X (g+g, g+q, q+q)

**Cross section**: 
$$dσ/dp_T dy = \sum_{a,b} ∫ dx_a dx_b f_a(x_a) f_b(x_b) dσ̂_{ab→jet}/dp_T dy$$

**NNLO** (NNLOJET): 
- Scale uncertainty: ±2-3%
- Gluon PDF constraint: x ∈ [0.01, 0.5]

**N3LO** (2024): First N3LO jet predictions — scale uncertainty ±1-2%

---

### 3. Higgs Production: gg→H

**Gluon fusion**: Dominant Higgs production at LHC (87% at 13 TeV)

**Cross section**:
$$σ(gg→H) = \frac{G_F α_s^2}{288√2π} |A_{1/2}(τ_t)|^2 ∫ dx_1 dx_2 g(x_1)g(x_2) δ(x_1x_2s - M_H^2)$$

**Top loop**: A_{1/2}(τ) → 4/3 for M_H ≪ 2m_t

**NNLO+NNLL**: σ = 48.6 pb at 13 TeV
**N3LO** (2024): σ = 48.9 pb, scale ±1.5%

**gg→HH**: Double Higgs — 31 fb at 13 TeV (NNLO)
- Higgs self-coupling λ_HHH probe
- Gluon PDF uncertainty dominant at high M_HH

---

### 4. Dijet & Photon+Jet

**Dijet mass**: dσ/dM_jj — gluon at x~0.1-0.5
**Photon+jet**: g+q → γ+q — direct gluon probe
**NLO+PS**: POWHEG, MC@NLO, Sherpa

**Gluon discrimination**: γ+jet vs dijet ratio → g(x)/q(x)

---

### 5. Top Pair Production: gg→tt̄

**gg→tt̄**: 90% at 13 TeV
**NNLO+NNLL**: σ = 832 pb ± 3%
**Differential**: dσ/dM_tt̄, dσ/dy_t — gluon at x~0.1-0.3

**tt̄+jet**: NLO — additional gluon radiation

---

### 6. Resummation & Scale Setting

**Threshold resummation**: N^3LL for gg→H, gg→jet
**Transverse momentum resummation**: q_T for H, Z
**Scale setting**: Principle of Maximum Conformality (PMC)

**Worldline**: Scale μ = proper-time resolution. Resummation = summing large proper-time logs.

---

### 7. Worldline Picture: Hard Scattering as Kink Intersection

**DIS**: Electron worldline + gluon worldline (from proton) = kink intersection
**gg→H**: Two gluon worldlines (folds) intersect → Higgs vertex
**Jet**: Gluon worldline fragments → parton shower = worldline branching

**Prime-Electron**: Hard scale Q² ↔ PrimeBookOne directory 2.0 (EW scale) gap record.

---

### 8. References

1. N3LO Higgs — Chen et al. (2024)
2. N3LO jets — Caola et al. (2024)
3. NNLOJET — Currie et al.
4. Prime-Electron Foundation §3.4
5. PrimeBookOne dir 2.0

---

*End of Part 5a — Next: Part 5b — gg→HH, BSM in Hard Scattering*

---

**Status**: Part 5a complete (~95 lines).