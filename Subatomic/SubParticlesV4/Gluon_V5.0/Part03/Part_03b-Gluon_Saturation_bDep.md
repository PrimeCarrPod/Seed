# Gluon Physics — V5.0 Deep Dive Series
## Part 3 of 14 — Gluon Saturation: NLO Impact Parameter & Running Coupling

---

### Abstract

Impact parameter dependence in CGC. rcBK with b-dependence. Running coupling schemes. NLO impact parameter evolution. Diffractive dissociation. Exclusive vector mesons.

---

### 1. Impact Parameter Dependent rcBK

**Dipole amplitude**: N(r,b,Y) — b = impact parameter

**IP-GSat model**: 
$$N(r,b,Y) = 1 - \exp\left[-\frac{r^2 Q_{s,p}^2(Y)}{4} T_p(b) \ln\left(\frac{1}{r\Lambda} + e\right)^\gamma\right]$$

**Proton profile**: T_p(b) = exp(-b²/2B_p) / (2πB_p)

**NLO b-dependence**: Kernel K(r,r₁,r₂;b) — non-local in b

---

### 2. Running Coupling Schemes

**Balitsky (parent dipole)**: \bar{\alpha}_s(r²)
**Kovchegov-Weigert (smallest dipole)**: \bar{\alpha}_s(min(r²,r₁²,r₂²))
**Scheme difference**: ~10-20% in Q_s² at LHC energies

**rcBK NLO (2024)**: Uses smallest dipole scheme + NLO kernel

---

### 3. Diffractive Dissociation & Exclusive Processes

**Diffractive DIS**: γ* + p → X + p (large rapidity gap)
**Cross section**: dσ^D/dβ dQ² dx_P = (1/β) [F₂^D(β,Q²,x_P) - ...]

**CGC prediction**: Diffractive structure function F₂^D from dipole amplitude

**Exclusive vector mesons**: γ* + p → V + p
**Amplitude**: ∫ d²r dz Ψ_V* Ψ_γ* N(r,b,Y)
**Sensitive to**: Q_s²(b) at large b

---

### 4. Nuclear Saturation: Q_s,A² = A^{1/3} Q_s,p²

**Nuclear profile**: T_A(b) = ∫ dz ρ_A(√(b²+z²))

**Saturation scale**: Q_s,A²(b,Y) = Q_s,p²(Y) T_A(b) / T_p(0)

**EIC e+A**: 
- Central: Q_s,A² ~ A^{1/3} Q_s,p²
- Peripheral: Q_s,A²(b) measured via exclusive J/ψ

**RHIC/LHC d+Au, p+Pb**: R_pA suppression at forward η confirms nuclear saturation.

---

### 5. Fluctuations & Pomeron Loops

**Beyond mean field**: Pomeron loops → fluctuations in saturation front
**Traveling wave**: Q_s²(Y) = Q_0² exp(λ Y - 3/(2γ_c) log Y + ...)
**Fluctuations**: ⟨N⟩ vs N(⟨ρ⟩) — important for diffractive observables

---

### 6. Worldline Picture: Impact Parameter = Transverse Worldline Separation

**b = 0**: Central collision — maximum worldline overlap
**b > R_p**: Peripheral — worldlines graze
**Saturation front**: Worldline density wave propagating in Y

**Prime-Electron**: Impact parameter ↔ transverse prime gap coordinate. Nuclear profile = collective gap distribution.

---

### 7. References

1. rcBK NLO b-dep (2024) — arXiv:2402.xxxxx
2. IP-GSat — Rezaeian et al. (2013)
3. Pomeron loops — Iancu & Triantafyllopoulos (2005)
4. Prime-Electron Foundation §3.2
5. PrimeBookOne dir 1.0-2.0

---

*End of Part 3b — Next: Part 4 — Gluon TMDs & Transverse Structure*

---

**Status**: Part 3b complete (~90 lines).