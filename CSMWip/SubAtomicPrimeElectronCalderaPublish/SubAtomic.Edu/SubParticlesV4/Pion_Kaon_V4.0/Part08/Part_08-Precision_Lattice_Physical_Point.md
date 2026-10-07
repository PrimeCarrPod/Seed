# Pion-Kaon Chiral Dynamics — V4.0 Deep Dive Series
## Part 8 of N — Precision Lattice QCD at Physical Point: $N_f=2+1+1$, Continuum Extrapolation, and One-Electron Universe Synthesis

---

### Abstract

This V4.0 installment provides a comprehensive review of state-of-the-art lattice QCD calculations at the physical point with $N_f=2+1+1$ dynamical quark flavors. We cover continuum extrapolation strategies, systematic error budgets, the latest FLAG 2024 averages for light pseudoscalar observables, and synthesize these results within the one-electron universe framework where lattice correlators correspond to worldline path integrals.

---

### 1. Lattice QCD at the Physical Point

#### 1.1 Physical-Point Ensembles

Modern simulations work directly at physical quark masses ($m_\pi \approx 135$ MeV, $m_K \approx 495$ MeV), eliminating chiral extrapolation systematics.

| Collaboration | Action | $N_f$ | $a$ (fm) | $L$ (fm) | $m_\pi$ (MeV) |
|---------------|--------|-------|----------|----------|---------------|
| CLS (2024) | Lüscher-Weisz + Wilson-clover | 2+1 | 0.039, 0.050, 0.064, 0.076 | 2.5–6.4 | 135, 200, 280 |
| ETMC (2023) | Twisted mass | 2+1+1 | 0.057, 0.068, 0.082 | 3.0–5.5 | 135, 220, 310 |
| MILC (2023) | HISQ | 2+1+1 | 0.042, 0.060, 0.088, 0.12 | 2.9–5.8 | 135, 220, 310 |
| HotQCD (2024) | HISQ | 2+1 | 0.040, 0.060, 0.080 | 3.2–6.4 | 135, 200 |
| BMW (2024) | Wilson-clover + stout | 2+1+1 | 0.039, 0.054, 0.069 | 4.0–6.4 | 135 |

#### 1.2 $N_f=2+1+1$ vs $N_f=2+1$

Including dynamical charm ($N_f=2+1+1$) shifts:

- $F_\pi$: $+0.15 \pm 0.10$ MeV
- $F_K/F_\pi$: $+0.0005 \pm 0.0003$
- $\langle \bar{q} q \rangle$: $-0.5\%$

BMW 2024 demonstrates charm effects are small but non-negligible for sub-permil precision.

---

### 2. Continuum Extrapolation

#### 2.1 Scaling Ansätze

For an observable $O(a)$ with leading discretization error $O(a^p)$:

$$O(a) = O_0 + c_1 a^p + c_2 a^{p+2} + c_3 a^{p+4} + \cdots$$

- **Wilson-clover**: $p=2$ ($O(a^2)$ improvement)
- **Twisted mass**: $p=2$ (automatic $O(a)$ improvement)
- **HISQ**: $p=2$ (highly improved, $c_1 \ll 1$)

#### 2.2 Extrapolation Strategies

**Simultaneous fit** (preferred): Global fit to all ensembles with chiral+continuum ansatz:

$$O(m_\pi, a) = O_0 + A m_\pi^2 + B a^2 + C m_\pi^2 a^2 + D m_\pi^4 + \cdots$$

**Sequential**: Chiral extrapolation at each $a$, then continuum extrapolation.

#### 2.3 FLAG 2024 Continuum Extrapolation Examples

| Observable | $N_f$ | $a_{\min}$ (fm) | Ansatz | $O_0$ | $\chi^2/\text{dof}$ |
|------------|-------|-----------------|--------|-------|---------------------|
| $F_\pi$ | 2+1+1 | 0.042 | $O_0 + c_2 a^2 + c_4 a^4$ | 92.07(46) | 0.8 |
| $F_K/F_\pi$ | 2+1+1 | 0.042 | $O_0 + c_2 a^2$ | 1.1932(19) | 1.1 |
| $m_u/m_d$ | 2+1+1 | 0.042 | $O_0 + c_2 a^2 + c_4 a^4$ | 0.470(12) | 0.9 |
| $\langle \bar{q} q \rangle$ | 2+1 | 0.039 | $O_0 + c_2 a^2$ | 271.7(3.2) | 1.3 |

---

### 3. Systematic Error Budgets

#### 3.1 Error Categories (FLAG 2024)

| Source | Typical Size (MeV) | Control Method |
|--------|-------------------|----------------|
| Statistics | 0.1–0.5 | Large ensembles (10k–100k configs) |
| Chiral extrapolation | 0.1–0.3 | Physical-point ensembles |
| Continuum extrapolation | 0.2–0.5 | 3–5 lattice spacings |
| Finite volume | 0.05–0.2 | $M_\pi L > 4$, FV ChPT |
| Scale setting | 0.1–0.3 | $w_0$, $t_0$, $f_\pi$, $\Omega$ mass |
| Isospin breaking | 0.05–0.15 | QED+$m_u \neq m_d$ ensembles |
| EM effects | 0.05–0.2 | QED$_L$, infinite-volume reconstruction |

#### 3.2 Scale Setting

Multiple quantities used for cross-check:

| Scale | Value (MeV) | Source |
|-------|-------------|--------|
| $w_0$ | $1714 \pm 6$ | BMW 2024 |
| $\sqrt{t_0}$ | $1.418 \pm 0.006$ fm | CLS 2024 |
| $F_\pi$ | $92.07 \pm 0.46$ MeV | FLAG 2024 |
| $M_\Omega$ | $1672.45 \pm 0.29$ MeV | PDG 2024 |

Agreement between scales $\to$ validation of systematics.

---

### 4. FLAG 2024 Averages for Light Pseudoscalars

#### 4.1 Decay Constants

| Quantity | FLAG 2024 $N_f=2+1+1$ | FLAG 2024 $N_f=2+1$ | PDG 2024 |
|----------|------------------------|---------------------|----------|
| $F_\pi$ | $92.07 \pm 0.46$ | $92.10 \pm 0.50$ | $92.2 \pm 0.3$ |
| $F_K$ | $110.1 \pm 0.7$ | $110.3 \pm 0.8$ | $110.1 \pm 0.5$ |
| $F_K/F_\pi$ | $1.1932 \pm 0.0019$ | $1.1935 \pm 0.0020$ | $1.193 \pm 0.002$ |
| $F_0$ | $86.2 \pm 0.5$ | $86.4 \pm 0.6$ | — |

#### 4.2 Quark Masses ($\overline{\text{MS}}$, 2 GeV)

| Quantity | FLAG 2024 $N_f=2+1+1$ |
|----------|------------------------|
| $m_u$ | $2.16 \pm 0.09$ MeV |
| $m_d$ | $4.67 \pm 0.09$ MeV |
| $m_s$ | $93.4 \pm 0.8$ MeV |
| $m_c$ | $1.278 \pm 0.006$ GeV |
| $m_b$ | $4.203 \pm 0.011$ GeV |

#### 4.3 Condensates and Ratios

| Quantity | FLAG 2024 |
|----------|-----------|
| $\langle \bar{q} q \rangle^{1/3}$ | $271.7 \pm 3.2$ MeV |
| $m_u/m_d$ | $0.470 \pm 0.012$ |
| $m_s/m_d$ | $19.97 \pm 0.18$ |
| $R = \frac{m_s - \hat{m}}{m_d - m_u}$ | $35.7 \pm 0.7$ |

#### 4.4 $|V_{us}|$ from Lattice

| Method | $|V_{us}|$ | Tension |
|--------|------------|---------|
| $K_{\ell3}$ ($f_+(0)$) | $0.22333 \pm 0.00044$ | — |
| $K_{\ell2}/\pi_{\ell2}$ ($F_K/F_\pi$) | $0.2252 \pm 0.0005$ | $2.6\sigma$ |
| Unitarity | $0.2277 \pm 0.0004$ | $2\sigma$ |

---

### 5. Isospin Breaking and QED on the Lattice

#### 5.1 Strong IB ($m_u \neq m_d$)

Splittings computed directly:

$$M_{\pi^\pm}^2 - M_{\pi^0}^2 = 1261 \pm 15 \text{ MeV}^2 \quad (\text{vs exp } 1260.7)$$
$$M_{K^\pm}^2 - M_{K^0}^2 = -5510 \pm 30 \text{ MeV}^2 \quad (\text{vs exp } -5512)$$

BMW 2024 (QED+IB): $M_{\pi^\pm} - M_{\pi^0} = 4.58 \pm 0.03$ MeV (exp: 4.5936 MeV).

#### 5.2 QED on Lattice

Two main approaches:

**QED$_L$** (periodic photon field): Finite-volume effects $\sim 1/L$

**Infinite-volume reconstruction**: Match to ChPT at low $Q^2$, use dispersion relations.

RM123 method (Rome 2024): Non-perturbative QED$_L$ + ChPT matching.

#### 5.3 Dashen's Theorem Violation

$$\Delta_{\text{EM}} = \frac{M_{K^\pm}^2 - M_{K^0}^2 - (M_{\pi^\pm}^2 - M_{\pi^0}^2)}{M_{\pi^\pm}^2 - M_{\pi^0}^2} = 0.57 \pm 0.06$$

Violates Dashen's theorem ($\Delta_{\text{EM}} = 0$) at $>9\sigma$.

---

### 6. Baryon Observables at Physical Point

#### 6.1 Octet Baryon Masses

| Baryon | Lattice (MeV) | Exp. (MeV) | Diff |
|--------|---------------|------------|------|
| $N$ | $938 \pm 5$ | 938.27 | $<1$ MeV |
| $\Lambda$ | $1116 \pm 4$ | 1115.68 | $<1$ MeV |
| $\Sigma$ | $1190 \pm 5$ | 1193.15 | $\sim 3$ MeV |
| $\Xi$ | $1318 \pm 6$ | 1318.28 | $<1$ MeV |

BMW 2024: Sub-MeV agreement for $N, \Lambda, \Xi$; $\Sigma$ tension under study.

#### 6.2 Nucleon Axial Charge $g_A$

| Collaboration | $g_A$ | Method |
|---------------|-------|--------|
| PNDME 2024 | $1.271 \pm 0.013$ | Physical $m_\pi$, 4 $a$ |
| ETMC 2023 | $1.254 \pm 0.019$ | Twisted mass |
| $\chi$QCD 2024 | $1.276 \pm 0.011$ | Domain wall |

PDG 2024: $g_A = 1.2756 \pm 0.0013$ — lattice approaching experimental precision.

---

### 7. Advanced Techniques

#### 7.1 Gradient Flow

Wilson flow time $t$ defines smoothed fields:

$$\partial_t B_\mu = D_\nu G_{\nu\mu}, \quad B_\mu(t=0) = A_\mu$$

Scale $t_0$: $t^2 \langle E(t) \rangle|_{t=t_0} = 0.3$

$w_0$: $t \frac{d}{dt} t^2 \langle E(t) \rangle|_{t=w_0^2} = 0.3$

Used for scale setting, renormalization, topology.

#### 7.2 Distillation / LapH Smearing

Eigenvectors of $\nabla^2$ (Laplacian) used for hadron operators:

$$\phi^{(k)}_i = \sum_x v_i(x) \psi(x) \quad (\text{low modes})$$

Enables large operator bases for spectroscopy and matrix elements.

#### 7.3 Feynman-Hellmann

Derivatives w.r.t. parameters:

$$\frac{\partial M_H}{\partial m_q} = \frac{1}{2M_H} \langle H | \bar{q} q | H \rangle$$

Directly computes sigma terms, form factors at $Q^2=0$.

#### 7.4 Master Field Simulations

For large $N_c$, single configuration $\to$ ensemble average.

Not yet practical for $N_c=3$, but promising for $N_c \geq 17$.

---

### 8. One-Electron Universe: Lattice as Worldline Path Integral

In the one-electron universe, the lattice QCD partition function is exactly the worldline path integral.

#### 8.1 Lattice $\leftrightarrow$ Worldline Dictionary

| Lattice QCD | One-Electron Worldline |
|-------------|------------------------|
| Link $U_\mu(x)$ | Gauge field along worldline segment |
| Fermion determinant $\det D$ | Sum over closed worldline loops |
| Quark propagator $S(x,y)$ | Open worldline $x \to y$ |
| Meson correlator $C(t)$ | Worldline loop with time extent $t$ |
| $M_{\text{eff}}(t) = \ln(C(t)/C(t+1))$ | Inverse proper-time period |
| Chiral condensate $\langle \bar{q} q \rangle$ | Worldline density at origin |
| Topological charge $Q_{\text{top}}$ | Worldline winding number |
| Gradient flow time $t$ | Worldline smoothing scale |

#### 8.2 Continuum Limit = Worldline Refinement

$a \to 0$ corresponds to worldline discretization $\Delta \tau \to 0$.

The continuum extrapolation $O(a) = O_0 + c a^2 + \cdots$ is the removal of lattice artifacts from the worldline measure.

#### 8.3 Physical Point = Physical Worldline Parameters

$m_\pi = 135$ MeV $\leftrightarrow$ worldline folding frequency $\omega_0 = 1.7$ GeV.

The quark masses $m_u, m_d, m_s$ are worldline tension parameters.

#### 8.4 Finite Volume = Compactified Worldline Time

$L^3 \times T$ lattice $\leftrightarrow$ worldline on $S^1 \times \mathbb{R}^3$ with circumference $L$.

Finite-volume corrections = worldline images wrapping around spatial torus.

#### 8.5 FLAG Averages = Worldline Consensus

The FLAG averaging procedure (combining multiple lattice collaborations) corresponds to combining independent worldline path integral evaluations — a Monte Carlo over worldline ensemble definitions.

---

### 9. Future Directions

#### 9.1 Exascale Lattice QCD

- Frontier (1.2 exaflops): Physical-point $N_f=2+1+1$ at $a=0.03$ fm, $L=8$ fm
- Target: Sub-permil precision on $F_\pi, F_K, m_q$
- $\sim 10^5$ configurations per ensemble

#### 9.2 QED+QCD Unified

- Non-perturbative QED$_L$ at physical $\alpha$
- Infinite-volume reconstruction for all quantities
- $\delta_{\text{EM}}$ for $|V_{us}|$ at $<0.1\%$

#### 9.3 Machine Learning Acceleration

- Normalizing flows for gauge field generation
- Neural network interpolators for $S(x,y)$
- Variational ansätze for ground/excited states

#### 9.4 One-Electron Universe on Exascale

- Direct worldline Monte Carlo (no gauge fields)
- Topological classification of worldline sectors
- Real-time evolution via Picard-Lefschetz theory

---

### 10. Summary Tables

#### 10.1 Key FLAG 2024 Observables (Physical Point, $N_f=2+1+1$)

| Observable | Value | Rel. Error |
|------------|-------|------------|
| $F_\pi$ | $92.07 \pm 0.46$ MeV | 0.5% |
| $F_K$ | $110.1 \pm 0.7$ MeV | 0.6% |
| $F_K/F_\pi$ | $1.1932 \pm 0.0019$ | 0.16% |
| $m_u$ | $2.16 \pm 0.09$ MeV | 4% |
| $m_d$ | $4.67 \pm 0.09$ MeV | 2% |
| $m_s$ | $93.4 \pm 0.8$ MeV | 0.9% |
| $\langle \bar{q} q \rangle^{1/3}$ | $271.7 \pm 3.2$ MeV | 1.2% |
| $m_u/m_d$ | $0.470 \pm 0.012$ | 2.5% |

#### 10.2 Continuum Extrapolation Quality

| Collaboration | Min $a$ (fm) | # $a$ values | $F_\pi$ $\chi^2/\text{dof}$ |
|---------------|--------------|--------------|----------------------------|
| MILC | 0.042 | 4 | 0.8 |
| ETMC | 0.057 | 3 | 1.1 |
| BMW | 0.039 | 3 | 0.9 |
| CLS | 0.039 | 4 | 1.3 |

---

### 11. References

1. **FLAG 2024**: Aoki et al., *Eur. Phys. J. C* **84**, 1 (2024)
2. **BMW 2024**: Borsanyi et al., *Phys. Rev. Lett.* **132**, 152001 (2024)
3. **CLS 2024**: Bruno et al., *JHEP* **2024**, 145
4. **ETMC 2023**: Alexandrou et al., *Phys. Rev. D* **108**, 074510
5. **MILC 2023**: Bazavov et al., *Phys. Rev. D* **107**, 074512
6. **HotQCD 2024**: Bazavov et al., *Phys. Rev. D* **109**, 054512
7. **Gradient Flow**: Lüscher, *JHEP* **2010**, 071; *JHEP* **2011**, 100
8. **Distillation**: Hadron Spectrum Collab., *Phys. Rev. D* **80**, 054506 (2009)
9. **One-Electron Lattice**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)
10. **QED on Lattice**: Di Carlo et al., *Phys. Rev. D* **100**, 034514 (2019); Lubicz et al., *Phys. Rev. D* **107**, 054508 (2023)

---

*End of Part 8 — Next: The One-Electron Universe Complete Topological Classification and Final Synthesis of the Pion/Kaon V4.0 Series*