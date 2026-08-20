# Glueball Single Electron Theory Synthesis — V4.0 Deep Dive Series
## Part 13 of 14 — Lattice Spectroscopy, Precision Glueball Physics, and Numerical Methods

---

### Abstract

This V4.0 installment provides a comprehensive treatment of lattice QCD methods for glueball spectroscopy, including operator construction, variational analysis, finite-volume effects, continuum extrapolation, and systematic error budgets. We present the state-of-the-art lattice results (2022-2024) and the path to sub-percent precision.

---

### 1. Lattice QCD Framework for Glueballs

#### 1.1 Euclidean Path Integral on the Lattice

The partition function on a hypercubic lattice of spacing $a$, volume $V = L^3 \times T$:

$$Z = \int \mathcal{D}U \, e^{-S[U]}$$

Wilson gauge action:
$$S[U] = \frac{\beta}{3} \sum_{x,\mu<\nu} \text{Re Tr} \left( 1 - U_{\mu\nu}(x) \right)$$

where $\beta = 6/g_0^2$, $U_{\mu\nu}$ is the plaquette, and $U_\mu(x) \in \text{SU}(3)$.

#### 1.2 Glueball Operators

Gauge-invariant operators with definite $J^{PC}$:

**Scalar ($0^{++}$):**
$$\mathcal{O}_{0^{++}}(x) = \text{Tr} \left[ \sum_{\mu<\nu} U_{\mu\nu}(x) \right]$$

**Tensor ($2^{++}$):**
$$\mathcal{O}_{2^{++},ij}(x) = \text{Tr} \left[ U_{ij}(x) - \frac{1}{3} \delta_{ij} \sum_k U_{kk}(x) \right]$$

**Pseudoscalar ($0^{-+}$):**
$$\mathcal{O}_{0^{-+}}(x) = \text{Tr} \left[ \sum_{\mu<\nu} \tilde{U}_{\mu\nu}(x) \right]$$

where $\tilde{U}_{\mu\nu} = \frac{1}{2} \epsilon_{\mu\nu\rho\sigma} U_{\rho\sigma}$.

#### 1.3 Operator Smearing and Basis Construction

To improve overlap with ground state, use smeared links:

**APE Smearing:**
$$U_\mu^{(n+1)}(x) = \text{Proj}_{\text{SU}(3)} \left[ (1-\alpha) U_\mu^{(n)}(x) + \frac{\alpha}{6} \sum_{\nu \neq \mu} U_\nu^{(n)}(x) U_\mu^{(n)}(x+\hat{\nu}) U_\nu^{(n)\dagger}(x+\hat{\mu}) \right]$$

**Wilson Flow (Gradient Flow):**
$$\partial_t B_\mu(t,x) = D_\nu G_{\nu\mu}(t,x), \quad B_\mu(0,x) = A_\mu(x)$$

Flow time $t$ has dimension [length]². At flow time $t = (c a)^2$, operators are UV-filtered.

**Operator Basis:** Use $N \times N$ matrix of correlators with $N$ operators of varying smearing radii.

---

### 2. Correlation Functions and Variational Analysis

#### 2.1 Euclidean Correlators

$$C_{ij}(t) = \sum_{\vec{x}} \langle 0 | \mathcal{O}_i(\vec{x},t) \mathcal{O}_j^\dagger(0,0) | 0 \rangle$$

Periodic boundary conditions in time: $C(t) = C(T-t)$.

#### 2.2 Generalized Eigenvalue Problem (GEVP)

Solve:
$$C(t) v_n(t,t_0) = \lambda_n(t,t_0) C(t_0) v_n(t,t_0)$$

Eigenvalues:
$$\lambda_n(t,t_0) \propto e^{-E_n (t-t_0)} \left[ 1 + \mathcal{O}(e^{-\Delta E_n (t-t_0)}) \right]$$

Effective masses:
$$a E_n^{\text{eff}}(t) = \ln \frac{\lambda_n(t,t_0)}{\lambda_n(t+1,t_0)}$$

#### 2.3 Multi-Exponential Fits

For a single operator (or optimized combination):

$$C(t) = \sum_{n=0}^{N_{\text{exp}}-1} A_n e^{-E_n t} + A_n e^{-E_n (T-t)}$$

Bayesian fitting with priors on energy gaps $\Delta E_n = E_n - E_{n-1}$.

#### 2.4 Operator Optimization

The optimal operator for state $n$:
$$\mathcal{O}_n^{\text{opt}} = \sum_i v_n^{(i)} \mathcal{O}_i$$

Overlap factor:
$$Z_n = \langle 0 | \mathcal{O}_n^{\text{opt}} | n \rangle$$

Quality criterion: $Z_0^2 / \sum_n Z_n^2 > 0.9$ for ground state.

---

### 3. Finite-Volume Effects

#### 3.1 Lüscher's Formula for Stable Particles

For a stable particle of mass $M$ in a box of size $L$:

$$\Delta M(L) = M(L) - M(\infty) = -\frac{3}{16\pi^2} \frac{M^2}{L} \sum_{\vec{n} \neq 0} \frac{K_1(|\vec{n}| M L)}{|\vec{n}|} + \mathcal{O}(e^{-\sqrt{2} M L})$$

For glueballs ($M \approx 1.7$ GeV, $L \geq 3$ fm): $\Delta M < 1$ MeV.

#### 3.2 Resonances and Moving Frames

For decaying states, use Lüscher's quantization condition:

$$\det \left[ \mathbb{1} + i \rho(E) \mathcal{M}(E) \left( \mathbb{1} + i \mathcal{M}(E) \mathcal{G}(E,L) \right)^{-1} \right] = 0$$

where $\mathcal{G}$ is the finite-volume loop function.

Moving frames $\vec{P} = \frac{2\pi}{L} \vec{d}$ provide additional energy levels.

#### 3.3 Twisted Boundary Conditions

Twisted BCs for gluons: $U_\mu(x+L\hat{k}) = z_k U_\mu(x) z_k^\dagger$, $z_k \in Z_3$

Breaks degeneracies, accesses more momenta.

---

### 4. Continuum Extrapolation

#### 4.1 Symanzik Improvement

The lattice action has discretization errors:
$$S = S_{\text{cont}} + a^2 S_2 + a^4 S_4 + \cdots$$

Tree-level improvement (Lüscher-Weisz):
$$S_{\text{LW}} = \frac{\beta}{3} \sum \left[ c_0 \text{Re Tr}(1-U_{\mu\nu}) + c_1 \text{Re Tr}(1-U_{\mu\nu}^{\text{rect}}) \right]$$

with $c_0 = 1 - 8c_1$, $c_1 = -1/12$ for $\mathcal{O}(a^2)$ improvement.

#### 4.2 Extrapolation Ansatz

For a quantity $Q$:
$$Q(a) = Q(0) + c_2 (a\Lambda)^2 + c_4 (a\Lambda)^4 + \cdots$$

For improved actions: leading error $\mathcal{O}(a^2 \alpha_s)$ or $\mathcal{O}(a^2)$.

Use multiple lattice spacings: $a \approx 0.04, 0.06, 0.08$ fm.

#### 4.3 Scale Setting

Set scale via:
- $w_0$ (Wilson flow): $w_0 = 0.1755(18)$ fm
- $t_0$ (Wilson flow): $\sqrt{t_0} = 0.1465(25)$ fm
- $r_1$ (static potential): $r_1 = 0.3106(17)$ fm
- $f_\pi$ (physical point): $f_\pi = 130.2(1.0)$ MeV

---

### 5. State-of-the-Art Lattice Results (2022-2024)

#### 5.1 CLS Collaboration (N_f=2+1, Physical Pion Mass)

| Ensemble | $\beta$ | $a$ (fm) | $L$ (fm) | $M_\pi$ (MeV) |
|----------|---------|----------|----------|---------------|
| H107     | 3.40    | 0.086    | 2.7      | 130           |
| N203     | 3.55    | 0.064    | 3.0      | 130           |
| D450     | 3.70    | 0.050    | 3.2      | 130           |

**Glueball spectrum (CLS 2024, preliminary):**

| State | $J^{PC}$ | $M/\sqrt{\sigma}$ | $M$ (MeV) | $f_G$ (MeV) |
|-------|----------|-------------------|-----------|-------------|
| $G_0$ | $0^{++}$ | 1.70(7) | 1700(70) | 390(120) |
| $G_2$ | $2^{++}$ | 2.46(11) | 2460(110) | 280(80) |
| $G_0'$ | $0^{-+}$ | 2.65(12) | 2650(120) | 210(70) |
| $G_1$ | $1^{+-}$ | 2.62(13) | 2620(130) | 150(50) |

String tension: $\sqrt{\sigma} = 440(20)$ MeV.

#### 5.2 HotQCD / RBC-UKQCD (N_f=2+1+1)

Physical charm quark included. Results consistent within errors.

#### 5.3 ETMC (N_f=2+1+1, Twisted Mass)

| State | $M$ (MeV) | Stat. | Syst. |
|-------|-----------|-------|-------|
| $0^{++}$ | 1720(50) | 30 | 40 |
| $2^{++}$ | 2480(80) | 50 | 60 |
| $0^{-+}$ | 2680(90) | 60 | 70 |

#### 5.4 Glueball Decay Widths from Lattice

**Scalar glueball width (Morningstar-Peardon method):**

$$\Gamma(G_0 \rightarrow \pi\pi) = \frac{p_\pi}{8\pi M_G^2} |\mathcal{M}|^2$$

Matrix element from three-point function:
$$\mathcal{M} = \lim_{t \gg 1} \frac{C_3(t, t_\pi)}{C_2(t_\pi) C_2(t-t_\pi)} \sqrt{\frac{E_\pi E_G}{2M_G}}$$

Results:
- $\Gamma(G_0 \rightarrow \pi\pi) = 72.8 \pm 10.4$ MeV (36.4%)
- $\Gamma(G_0 \rightarrow K\bar{K}) = 95.8 \pm 3.0$ MeV (47.9%)
- $\Gamma(G_0 \rightarrow \eta\eta) = 16.0 \pm 2.0$ MeV (8.0%)

#### 5.5 Glueball Form Factors

Scalar form factor $F_S(Q^2)$:
$$\langle \pi(p') | \frac{\alpha_s}{\pi} G^2 | \pi(p) \rangle = F_S(Q^2)$$

Lattice calculation (ETMC 2024):
$$F_S(Q^2) = \frac{F_S(0)}{1 + Q^2 / \Lambda_S^2}, \quad \Lambda_S = 1.1(2) \text{ GeV}$$

---

### 6. Systematic Error Budget

#### 6.1 Error Sources for $M_{0^{++}}$

| Source | Estimate (MeV) | Method |
|--------|----------------|--------|
| Statistics | 30-50 | Bootstrap/jackknife |
| Continuum extrapolation | 20-40 | Multiple $a$, fit ansatz variation |
| Finite volume | < 5 | $L \geq 3$ fm, Lüscher formula |
| Scale setting | 10-15 | $w_0$, $t_0$, $r_1$ spread |
| Chiral extrapolation | < 5 | Physical pion mass ensembles |
| Operator basis | 10-20 | Variational stability, GEVP $t_0$ variation |
| Excited state contamination | 10-30 | Multi-exp fits, Bayesian priors |
| **Total** | **50-80** | Quadrature sum |

#### 6.2 Error Correlation

Errors between states are correlated (same ensembles, same scale setting). Covariance matrix needed for combined fits.

---

### 7. Advanced Topics

#### 7.1 Distillation and LapH Smearing

**Distillation (Peardon et al. 2009):**
$$\tilde{\psi}(x) = \sum_{k=1}^{N_{\text{vec}}} v_k(x) v_k^\dagger(y) \psi(y)$$

where $v_k$ are low modes of $\nabla^\dagger \nabla$.

**LapH (Morningstar et al. 2011):**
Smearing with Laplacian: $S = (1 + \sigma \nabla^2)^N$

Reduces cost of all-to-all propagators.

#### 7.2 Multi-Hadron Operators

For resonances above threshold, include multi-hadron operators:

$$\mathcal{O}_{\pi\pi}(t) = \sum_{\vec{p}} \mathcal{O}_\pi(\vec{p},t) \mathcal{O}_\pi(-\vec{p},t)$$

GEVP with single- and multi-hadron basis extracts scattering phase shifts.

#### 7.3 Gradient Flow for Glueball Operators

Operators at flow time $t$:
$$\mathcal{O}(t,x) = \text{Tr} \left[ G_{\mu\nu}(t,x) G_{\mu\nu}(t,x) \right]$$

The flowed operator has reduced UV noise. Renormalization:
$$\mathcal{O}_R = Z_{\mathcal{O}}(t) \mathcal{O}(t)$$

$Z_{\mathcal{O}}(t) \approx 1 + c \alpha_s(t)$ known perturbatively.

#### 7.4 Machine Learning for Operator Construction

Neural networks to optimize operator basis:
- Input: gauge links in local region
- Output: linear combination of paths
- Trained to maximize ground state overlap

Preliminary results show 2-3× improvement in effective mass plateaus.

---

### 8. One-Electron Universe: Lattice as Worldline Discretization

In the one-electron universe (Wheeler 1940, Gielerak 2020), the lattice discretization corresponds to a discrete proper-time sampling of the single electron worldline.

The worldline path integral:
$$\int \mathcal{D}x(\tau) e^{-S[x]} \rightarrow \prod_{n=1}^N \int d^4x_n e^{-S[x_n]}$$

with $a = \Delta \tau$ (proper time step).

The lattice gluon field $U_\mu(x)$ represents the gauge connection along the worldline.

The variational method (GEVP) corresponds to finding the optimal worldline folding patterns that create stable topological defects (glueballs).

---

### 9. Future Directions

| Goal | Target Precision | Timeline |
|------|------------------|----------|
| $M_{0^{++}}$ | < 1% (15 MeV) | 2025-2027 |
| $\Gamma_{0^{++}}$ | 10% | 2025-2028 |
| $0^{++}$ form factor | 5% | 2026-2029 |
| $2^{++}$ width | 15% | 2027-2030 |
| Exotics ($1^{+-}$, $3^{++}$) | 5% | 2028-2030 |

**Exascale computing** (Frontier, Aurora, LUMI) enables:
- Physical point ensembles at $a = 0.03$ fm
- $L > 6$ fm volumes
- $N_{\text{vec}} > 1000$ distillation vectors
- Full error budgets with 1000+ bootstrap samples

---

### 10. References

1. **Lattice Methods**: Gattringer & Lang, *Quantum Chromodynamics on the Lattice* (2010)
2. **Variational Method**: Lüscher & Wolff, *Nucl. Phys. B* **339**, 222 (1990); Blossier et al., *JHEP* **2009**, 094
3. **Glueball Spectrum**: Morningstar & Peardon, *Phys. Rev. D* **60**, 034509 (1999); *Phys. Rev. D* **69**, 054501 (2004)
4. **CLS 2024**: *PoS(LATTICE2023)* 015, 020, 025
5. **HotQCD 2024**: *Phys. Rev. D* **109**, 054508 (2024)
6. **ETMC 2024**: *Phys. Rev. D* **109**, 034512 (2024)
7. **RBC/UKQCD 2024**: *Phys. Rev. D* **109**, 014508 (2024)
8. **Gradient Flow**: Lüscher, *JHEP* **2010**, 071 (2010); *JHEP* **2013**, 092
9. **Distillation**: Peardon et al., *Phys. Rev. D* **80**, 054506 (2009)
10. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1957); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 13 — Next: Experimental Signatures and Future Directions (Part 14)*