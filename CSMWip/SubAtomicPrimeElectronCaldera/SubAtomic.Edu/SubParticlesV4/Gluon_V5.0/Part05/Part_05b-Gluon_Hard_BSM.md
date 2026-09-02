# Gluon Physics — V5.0 Deep Dive Series
## Part 5 of 14 — Gluon in Hard Scattering: gg→HH, BSM & EIC Hard Processes

---

### Abstract

Di-Higgs production, BSM in gluon fusion, EIC hard processes (diffractive, exclusive, high-Q²). Interference effects, Higgs self-coupling.

---

### 1. Di-Higgs: gg→HH

**Amplitude**: Triangle (H self-coupling) + Box (top loop)
**Interference**: Destructive → sensitive to λ_HHH

**Cross section**: 
- SM: 31 fb at 13 TeV (NNLO)
- λ_HHH = 2λ_SM: 50 fb
- λ_HHH = 0: 17 fb

**HL-LHC (3 ab⁻¹)**: δλ/λ ~ 50%
**FCC-hh (30 ab⁻¹)**: δλ/λ ~ 5-10%

**Gluon PDF uncertainty**: Dominant systematic at high M_HH

---

### 2. BSM in Gluon Fusion

**Effective operators**:
$$\mathcal{L}_{BSM} = \frac{c_g}{Λ^2} H^\dagger H G^a_{μν} G^{aμν} + \frac{c_{γ}}{Λ^2} H^\dagger H F_{μν} F^{μν} + ...$$

**Top partner loops**: Vector-like quarks → modify gg→H
**SUSY**: Stop loops → modify gg→H, gg→HH
**2HDM**: Charged Higgs loops → modify gg→H

**Constraints**: 
- κ_g = 1.00 ± 0.05 (ATLAS+CMS)
- κ_γ = 1.00 ± 0.05

---

### 3. EIC Hard Processes

**Exclusive J/ψ**: γ*+p → J/ψ+p — gluon GPD at x~10⁻³
**Exclusive φ, Υ**: Higher Q², smaller x
**Diffractive DIS**: γ*+p → X+p — diffractive PDFs (gluon dominated)
**High-Q² DIS**: Q² > 1000 GeV² — BFKL, N3LO tests

**EIC kinematics**: 
- √s = 20-140 GeV
- Q² = 1-10⁴ GeV²
- x = 10⁻⁴-0.1

---

### 4. Gluon GPDs (Generalized Parton Distributions)

**Definition**: 
$$H_g(x,ξ,t) = ∫ \frac{dz^-}{4π} e^{ixP^+z^-} ⟨P'| F^{+i}(-z/2) W F^{+i}(z/2) |P⟩$$

**t = (P'-P)² = -Δ_T²**: Momentum transfer
**ξ = (P^+-P'^+)/(P^++P'^+)**: Skewness

**Exclusive processes**: Factorization → GPDs

**Lattice GPDs** (2024): First moments ⟨x⟩_g, ⟨x²⟩_g at physical point.

---

### 5. Worldline Picture: GPDs as Worldline Correlators

**GPD H_g(x,ξ,t)** = Fourier transform of worldline correlator with transverse separation Δ_T
**ξ ≠ 0** = worldline segment with momentum fraction asymmetry
**t-dependence** = worldline transverse form factor

**Prime-Electron**: GPD moments ↔ prime gap moments with transverse separation.

---

### 6. References

1. gg→HH NNLO — Grazzini et al. (2024)
2. BSM in gluon fusion — Dawson et al. (2023)
3. EIC exclusive — arXiv:2103.05419
4. Lattice GPDs — HadStruc (2024)
5. Prime-Electron Foundation §3.4, §9

---

*End of Part 5b — Part 5 complete (5a-5b). Next: Part 6 — Gluon at Finite T/μ*

---

**Status**: Part 5b complete (~90 lines). Part 5 complete.