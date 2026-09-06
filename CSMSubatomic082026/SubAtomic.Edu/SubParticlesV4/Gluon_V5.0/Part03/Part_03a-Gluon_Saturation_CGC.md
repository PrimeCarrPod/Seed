# Gluon Physics — V5.0 Deep Dive Series
## Part 3 of 14 — Gluon Saturation & CGC: rcBK NLO, Q_s², EIC Saturation Physics

---

### Abstract

Color Glass Condensate (CGC) effective theory for small-x gluons. rcBK evolution at NLO. Saturation scale Q_s²(x). Geometric scaling. EIC saturation measurements. Worldline overlap density.

---

### 1. CGC Effective Theory

**Degrees of freedom**: 
- Fast partons (x > x₀): Static color sources ρ^a(x⁻,x_T)
- Slow partons (x < x₀): Classical gluon field A^μ

**Weight functional**: W_Y[ρ] = exp(-∫ d²x_T ρ^a ρ^a / 2μ²(Y))

**JIMWLK evolution**: Functional RG for W_Y[ρ]

**Mean field (rcBK)**: Dipole amplitude N(r,Y) = 1 - ⟨tr U_x U_y†⟩/N_c

---

### 2. rcBK Evolution at NLO (2024)

**LO rcBK**:
$$\partial_Y N(r,Y) = \frac{\bar{\alpha}_s}{2\pi} \int d^2r_1 \frac{r^2}{r_1^2 r_2^2} [N(r_1)+N(r_2)-N(r)-N(r_1)N(r_2)]$$

**NLO corrections** (Balitsky, Chirilli; Kovchegov, Weigert):
- Running coupling: \bar{\alpha}_s → \bar{\alpha}_s(r)
- Conformal terms: N_f dependent
- Kinematic constraint: θ(r_1² < r², r_2² < r²)

**rcBK NLO (2024)**: Full numerical implementation with running coupling + NLO kernel.

---

### 3. Saturation Scale Q_s²(Y)

**Definition**: N(r=1/Q_s, Y) = const (e.g., 0.5)

**Scaling**: Q_s²(Y) = Q_0² exp(λ Y), λ = 0.2-0.3

**Running coupling**: λ = 4.88 α_s N_c / π (LO), reduced at NLO

**Geometric scaling**: N(r,Y) = N(r Q_s(Y)) for r Q_s ≲ 1

**Prime-Electron**: Q_s² = worldline overlap density. High proper-time density → gluon recombination → saturation.

---

### 4. Initial Conditions at x₀ = 0.01

**MV model**: μ² = A^{1/3} Q_{s0}², Q_{s0}² ~ 0.2 GeV² (proton)

**IP-Sat / IP-GSat**: Impact parameter dependence
- b-dependence: μ²(b) = μ_0² exp(-b²/2B_p)

**Worldline**: Impact parameter b = transverse worldline separation.

---

### 5. Phenomenology: HERA, RHIC, LHC

| Observable | Data | CGC Description |
|------------|------|-----------------|
| **HERA F₂** | x<0.01, Q²<100 GeV² | rcBK NLO fits (rcBK-NLO, 2024) |
| **HERA diffractive** | σ^D/σ^tot | Good agreement |
| **RHIC d+Au** | Forward hadron suppression | R_pA < 1 at forward η |
| **LHC p+Pb** | Forward J/ψ, D mesons | Nuclear modification |
| **LHC UPCs** | γ+A → J/ψ, γγ | Photon-gluon fusion |

**CGC fits**: rcBK NLO describes HERA F₂ at small-x with χ²/dof ~ 1.

---

### 6. EIC Saturation Measurements

**Golden channels**:
1. **Inclusive DIS**: F₂, F_L at x<10⁻³, Q²<10 GeV²
2. **Diffractive DIS**: σ^D/σ^tot → dipole amplitude
3. **Exclusive J/ψ**: γ*+p → J/ψ+p → Q_s²(t)
4. **Di-hadron**: Back-to-back π⁰π⁰ → gluon TMD, saturation
5. **e+A**: Nuclear Q_s,A² = A^{1/3} Q_s,p²

**Projections** (10 fb⁻¹ e+p, 1 fb⁻¹ e+Au):
- Q_s²(x) measured to 10% at x=10⁻⁴
- Geometric scaling violation quantified

---

### 7. Worldline Picture: Saturation as Worldline Overlap

**Dilute regime** (Q² ≫ Q_s²): Worldlines well-separated, independent
**Saturation regime** (Q² ≲ Q_s²): Worldlines overlap, color charge screening
**Dense regime** (Q² ≪ Q_s²): Worldline bundle, classical gluon field

**Prime gap analogy**: Small-x = high gap density. Overlap = gap recombination (d_n + d_m → d_{n+m}).

---

### 8. References

1. rcBK NLO (2024) — arXiv:2401.xxxxx
2. CGC reviews — Gelis et al. (2010), Albacete & Marquet (2014)
3. EIC Yellow Report — arXiv:2103.05419
4. Prime-Electron Foundation §3.2
5. PrimeBookOne dir 1.0-3.0 (small-x = UV)

---

*End of Part 3a — Next: Part 3b — NLO Impact Parameter & Running Coupling*

---

**Status**: Part 3a complete (~95 lines). Ready for Part 3b.