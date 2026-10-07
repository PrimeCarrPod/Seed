# Gluon Physics — V5.0 Deep Dive Series
## Part 4 of 14 — Gluon TMDs: Evolution, Matching & EIC Projections

---

### Abstract

TMD evolution at N3LL. Small-b* resummation. ζ-prescription. Lattice to light-cone matching at NLO. EIC measurement projections for all gluon TMDs.

---

### 1. TMD Evolution at N3LL

**Evolution kernel**: 
$$R(b_*,Q) = \exp\left[-\int_{μ_b^2}^{Q^2} \frac{dμ^2}{μ^2} \left( A \ln\frac{Q^2}{μ^2} + B \right) \right]$$

**N3LL**: A, B known to 3-loop (Γ_cusp, γ_F, γ_K)

**b* prescription**: b_* = b / √(1 + b²/b_max²) — regulates large-b

**Non-perturbative**: g_K(b) = g_2 b² + g_1 b⁴ — fitted to data

---

### 2. ζ-Prescription (SCET)

**Rapidity renormalization**: ζ = (2xP⁺)² (SIDIS), ζ = Q² (Drell-Yan)

**Evolution**: 
$$f_1^g(x,b_T,\mu,\zeta) = \sqrt{\frac{\zeta}{\zeta_0}} \exp\left[\frac{1}{2} \int_{μ_0}^μ \frac{dμ'}{μ'} \gamma_\zeta \right] f_1^g(x,b_T,\mu_0,\zeta_0)$$

**Advantage**: Separates μ and ζ evolution cleanly.

---

### 3. Lattice to Light-Cone Matching at NLO

**Quasi-TMD → Light-cone TMD**:
$$\tilde{f}_1^g(x,k_T,P_z) = \int \frac{dy}{y} C(x/y, k_T, \mu, \zeta, P_z) f_1^g(y,k_T,\mu,\zeta) + O(\Lambda_{QCD}^2/P_z^2)$$

**Matching coefficient C**: NLO known (2023-2024)
**Power corrections**: O(k_T²/P_z²), O(Λ_QCD²/P_z²)

**Lattice systematics**: 
- Renormalization: RI/MOM → MS
- Finite volume: e^{-m_π L}
- Discretization: O(a²k_T²)

---

### 4. EIC Gluon TMD Measurements

| TMD | Channel | Observable | Precision (10 fb⁻¹) |
|-----|---------|------------|---------------------|
| **f₁^g** | Dijet, γ+jet | Unpolarized x-section | 5% at x=10⁻³ |
| **h₁^g** | Dijet cos 2φ | cos 2φ asymmetry | 10% at x=10⁻³ |
| **f_{1T}^{g⊥}** | γ+jet sin φ | sin φ asymmetry | 20% at x=0.01 |
| **h_{1}^{g⊥}** | Dijet cos 2φ | cos 2φ in polarized | 15% at x=0.01 |

**Kinematics**: √s = 140 GeV, Q² = 10-1000 GeV², x = 10⁻⁴-0.1

---

### 5. Gluon TMDs in Nuclear Targets (e+A)

**Nuclear modification**: R_g^A(x,k_T) = f₁^{g,A} / (A f₁^{g,p})

**Shadowing**: R < 1 at small-x (saturation)
**Antishadowing**: R > 1 at x~0.1
**EMC effect**: R < 1 at x~0.5

**k_T broadening**: ⟨k_T²⟩_A > ⟨k_T²⟩_p — multiple scattering

**EIC e+Au**: First measurement of nuclear gluon TMDs.

---

### 6. Worldline Picture: TMD Evolution as Worldline Diffusion

**b_T** = transverse proper-time separation
**Evolution** = worldline diffusion in transverse plane
**ζ-prescription** = proper-time reparametrization invariance

**Non-perturbative g_K** = worldline self-interaction at long proper-time.

---

### 7. References

1. TMD evolution N3LL — Vladimirov et al. (2023)
2. ζ-prescription — Echevarria et al. (2016)
3. Lattice matching NLO — Ji et al. (2023)
4. EIC TMDs — arXiv:2103.05419
5. Prime-Electron Foundation §4

---

*End of Part 4b — Part 4 complete (4a-4b). Next: Part 5 — Gluon in Hard Scattering*

---

**Status**: Part 4b complete (~95 lines). Part 4 complete.