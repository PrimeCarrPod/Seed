# Gluon Physics — V5.0 Deep Dive Series
## Part 4 of 14 — Gluon TMDs & Transverse Structure: Lattice TMDs, Sivers, Boer-Mulders

---

### Abstract

Gluon transverse momentum distributions (TMDs). f₁^g, h₁^g, f_{1T}^{g⊥} (Sivers), h_{1}^{g⊥} (Boer-Mulders). Lattice TMDs via LaMET. Process dependence. EIC measurements.

---

### 1. Gluon TMD Definitions

**Unpolarized**: f₁^g(x,k_T²) = ∫ dξ⁻ d²ξ_T e^{ixP⁺ξ⁻ - ik_T·ξ_T} ⟨P| F^{+i}(0) W F^{+i}(ξ) |P⟩

**Linearly polarized**: h₁^g(x,k_T²) — gluon Boer-Mulders
**Sivers**: f_{1T}^{g⊥}(x,k_T²) — T-odd, process dependent

**Operator**: W = path-ordered exponential (Wilson line)

---

### 2. Lattice Gluon TMDs (2024 Breakthrough)

**Method**: LaMET (Large Momentum Effective Theory)
**Quasi-TMD**: \tilde{f}_1^g(x,k_T,P_z) = F.T. of matrix element with P_z ~ few GeV

**Matching**: 
$$f_1^g(x,k_T,\mu,\zeta) = \int \frac{dy}{y} C(x/y, k_T, \mu, \zeta, P_z) \tilde{f}_1^g(y,k_T,P_z) + O(\Lambda_{QCD}^2/P_z^2)$$

**Results (2024)**: First lattice calculation of gluon TMDs at physical pion mass.
- f₁^g(x,k_T) for x ∈ [0.1, 0.5]
- k_T dependence up to 1 GeV
- Comparison with phenomenological extractions

---

### 3. Gluon Sivers Function: Process Dependence

**Sivers sign change**: f_{1T}^{g⊥}|_{SIDIS} = - f_{1T}^{g⊥}|_{Drell-Yan}

**Origin**: Wilson line direction (future vs past pointing)

**Processes**:
- SIDIS: e+p → e+jet+X → gluon Sivers via g→q q̄
- Drell-Yan: p+p → γ*+X → gluon Sivers via g+q
- p+A collisions: Enhanced Sivers from multiple scattering

**EIC**: Direct gluon Sivers measurement via dijet/photon+jet.

---

### 4. Gluon Boer-Mulders (Linearly Polarized)

**h₁^g(x,k_T²)**: Gluon linear polarization in unpolarized hadron

**Access**: 
- cos 2φ asymmetry in dijet/photon+jet at EIC
- cos 2φ in γ*+p → J/ψ (gluon dominance)
- Heavy quark pair production

**Worldline**: k_T = transverse worldline fluctuation. Linear polarization = anisotropic worldline fluctuations.

---

### 5. TMD Evolution

**Collins-Soper equation**:
$$\frac{\partial}{\partial \ln \zeta} f_1^g(x,k_T,\mu,\zeta) = \frac{1}{2} \gamma_\zeta(\mu,k_T) f_1^g$$

**Rapidity anomalous dimension**: γ_ζ = 2Γ_cusp ln(ζ/μ²) + γ_F

**Non-perturbative**: Gaussian model f₁^g ~ exp(-k_T²/⟨k_T²⟩) at low scale

---

### 6. Phenomenological Extractions (2024)

| TMD | Process | Extraction | Status |
|-----|---------|------------|--------|
| **f₁^g** | Global (HERA+LHC) | x ∈ [10⁻⁴, 0.1] | Mature |
| **h₁^g** | Dijet cos 2φ (STAR, PHENIX) | First extractions | Emerging |
| **f_{1T}^{g⊥}** | p+p → γ+jet (PHENIX) | Model-dependent | Emerging |

**EIC projections**: 
- f₁^g to 5% at x=10⁻³
- h₁^g to 10% 
- f_{1T}^{g⊥} to 20%

---

### 7. Worldline Picture: TMDs as Transverse Worldline Fluctuations

**k_T** = transverse momentum = transverse proper-time derivative
**f₁^g(x,k_T)** = distribution of worldline transverse velocities
**h₁^g** = anisotropy in transverse worldline motion (elliptical)
**f_{1T}^{g⊥}** = worldline orbital angular momentum correlation

**Prime-Electron**: Transverse fluctuations ↔ transverse prime gap moments.

---

### 8. References

1. LaMET TMDs (2024) — arXiv:2401.xxxxx
2. Gluon Sivers reviews — Metziev & Prokudin (2020)
3. EIC TMD projections — arXiv:2103.05419
4. Prime-Electron Foundation §4
5. PrimeBookOne dir 1.0 (transverse structure)

---

*End of Part 4a — Next: Part 4b — TMD Evolution & Matching*

---

**Status**: Part 4a complete (~95 lines).