# Photon Physics — V5.0 Deep Dive Series
## Part 8 of N — Non-Perturbative Photon Physics: Lattice QCD+QED, Photon Mass in Medium, Confinement, and the Photon on the Lattice

---

### Abstract

This V5.0 installment develops the non-perturbative physics of the photon using lattice QCD+QED. We cover the photon mass in media (plasmon), the photon as a probe of confinement, lattice implementations of QED, the photon's role in chiral symmetry breaking, and the computational challenges of simulating photons on a discrete Euclidean lattice.

---

### 1. Photon on the Lattice

#### 1.1 Lattice QED Formulation

Compact U(1) gauge theory on a Euclidean lattice:
$$S_{\text{U(1)}} = \beta \sum_{x,\mu<\nu} \left[ 1 - \cos(\theta_{\mu\nu}(x)) \right]$$

where $\theta_{\mu\nu} = \theta_\mu(x) + \theta_\nu(x+\hat{\mu}) - \theta_\mu(x+\hat{\nu}) - \theta_\nu(x)$ is the plaquette angle.

In the non-compact limit:
$$S_{\text{U(1)}} = \frac{1}{4} \sum_{x,\mu<\nu} (\theta_{\mu\nu})^2 = \frac{1}{4} \sum F_{\mu\nu}^2$$

#### 1.2 QCD+QED on the Lattice

Combined action:
$$S = S_{\text{QCD}}[U] + S_{\text{QED}}[A] + S_{\text{int}}[U,A]$$

where $S_{\text{int}}$ couples quarks to both gluon and photon fields.

**Major challenge**: QED is long-range, lattice is finite with periodic boundary conditions.

#### 1.3 QED$_L$ and QED$_M$

**QED$_L$** (Hayakawa & Uno 2008): Remove zero mode of photon field.
$$\sum_x A_\mu(x) = 0 \quad \forall \mu$$

Finite-volume effects $\sim 1/L$.

**QED$_M$** (Endres et al. 2015): Massive photon regulator.
$$S_{\text{QED}_M} = \frac{1}{4} \sum F_{\mu\nu}^2 + \frac{m_\gamma^2}{2} \sum A_\mu^2$$

Take $m_\gamma \to 0$ after infinite volume limit.

---

### 2. Photon Mass in Medium (Plasmon)

#### 2.1 Thermal Photon Mass

In a plasma at temperature $T$:
$$m_\gamma^2 = \omega_{\text{pl}}^2 = \frac{4\pi\alpha}{3} \left( T^2 + \sum_f \frac{\mu_f^2}{\pi^2} \right)$$

From Part 7: $\omega_{\text{pl}}^2 = \frac{e^2}{\pi^2} \sum_f \int \frac{d^3p}{(2\pi)^3} \frac{n_f(p)}{E_f}$.

#### 2.2 Lattice Measurement of Photon Mass

Euclidean correlator:
$$G(\tau) = \int d^3x \, \langle A_i(\tau, \vec{x}) A_i(0, \vec{0}) \rangle$$

Mass from exponential decay:
$$G(\tau) \sim e^{-m_\gamma \tau}$$

**Results** (HotQCD, BMW 2024):
- $m_\gamma(T=0) = 0$ (confirmed to $< 10^{-18}$ eV)
- $m_\gamma(T) \propto T$ for $T > T_c$
- In QGP: $m_\gamma \approx 0.3-0.5 T$

#### 2.3 Photon Mass and Chiral Symmetry

Near $T_c$: Photon couples to chiral condensate.
$$\mathcal{L} \supset \frac{\alpha}{8\pi} \frac{\langle \bar{q}q \rangle}{f_\pi} F_{\mu\nu} \tilde{F}^{\mu\nu}$$

Photon mass gets contribution from chiral anomaly.

---

### 3. Photon as Confinement Probe

#### 3.1 Heavy Quark Potential

Static $Q\bar{Q}$ potential from Wilson loop:
$$V(r) = -\lim_{T\to\infty} \frac{1}{T} \ln \langle W(r,T) \rangle$$

Photon exchange contributes:
$$V_{\text{EM}}(r) = \frac{\alpha Q_Q^2}{r}$$

Total: $V(r) = -\frac{4\alpha_s}{3r} + \sigma r + \frac{\alpha Q_Q^2}{r} + \cdots$

#### 3.2 Photon in Flux Tube

From Pion/Kaon V4.0 Part 01: String tension $\sigma \approx 0.18 \text{ GeV}^2$.

Photon effects on flux tube:
- Width: $\langle w^2 \rangle \sim \frac{1}{2\pi\sigma} \ln r$
- Photon exchange between color charges in flux tube
- Luscher term: $-\frac{\pi}{12r}$ (universal, from photon + gluon)

#### 3.3 Photon and Center Symmetry

Center symmetry $\mathbb{Z}_3$ of pure SU(3) gauge theory.
Photons don't carry color $\to$ don't break center symmetry explicitly.

But quark loops (with photon coupling) break $\mathbb{Z}_3$ explicitly at finite $T$.

---

### 4. Lattice QED+QCD Computational Methods

#### 4.1 Photon Field Generation

**Heatbath for U(1)**:
$$\theta_\mu(x) \to \theta_\mu(x) + \delta, \quad \delta \sim \text{Gaussian}$$

**Hybrid Monte Carlo (HMC) for QED+QCD**:
$$\mathcal{H} = \frac{1}{2} \sum p_\mu^2 + S[U, A]$$

Photon momenta $p_\mu$ conjugate to $A_\mu$.

#### 4.2 Fermion Determinant with QED

Quark action:
$$S_q = \bar{q} \left( D_{\text{QCD}} + i e Q D_{\text{QED}} + m \right) q$$

Determinant:
$$\det(D + i e Q A + m)$$

**Challenge**: Photon field not gauge-fixed $\to$ zero modes.

**Solution**: QED$_L$ (zero mode removal) or QED$_M$ (massive photon).

#### 4.3 Reweighting vs Dynamical QED

**Reweighting**: Generate QCD configs, reweight by $\det(D_{\text{QCD}} + i e Q A) / \det(D_{\text{QCD}})$.

**Dynamical**: Include photon in HMC evolution.
- More expensive: additional $4V$ photon degrees of freedom
- Better for precision: no reweighting overlap problem

BMW 2024: $N_f=2+1+1$ dynamical QED+QCD at physical point.

---

### 5. Photon-Hadron Interactions on the Lattice

#### 5.1 Hadronic Vacuum Polarization (HVP)

From Part 3: $a_\mu^{\text{had,VP}}$ from lattice.

Time-momentum representation:
$$a_\mu^{\text{had,VP}} = 4\alpha^2 \int_0^\infty dQ^2 f(Q^2) \Pi(Q^2)$$

$$\Pi(Q^2) = \int_0^\infty dt \, t^2 G(t) j_0(Q t)$$

$G(t)$ = vector current correlator with dynamical QED+QCD.

#### 5.2 Hadronic Light-by-Light (HLbL)

Four-point function:
$$\Pi^{\mu\nu\lambda\sigma}(q_1,q_2,q_3) = \int d^4x_1 d^4x_2 d^4x_3 e^{i(q_1\cdot x_1 + q_2\cdot x_2 + q_3\cdot x_3)} \langle J^\mu(x_1) J^\nu(x_2) J^\lambda(x_3) J^\sigma(0) \rangle$$

Lattice: Position-space summation with QED$_L$ (Mainz, RBC/UKQCD 2022-2024).

#### 5.3 Radiative Corrections to Hadron Masses

$\Delta M = M_{\text{QCD+QED}} - M_{\text{QCD}}$.

Example: $\Delta M_{\pi^\pm} = M_{\pi^\pm} - M_{\pi^0}$.
- QCD: $M_{\pi^\pm} - M_{\pi^0} \approx 0$ (isospin symmetric)
- QED: $\Delta M_{\pi^\pm}^{\text{QED}} \approx 4.6 \text{ MeV}$
- Total: $M_{\pi^\pm} - M_{\pi^0} = 4.5936 \text{ MeV}$ (PDG)

BMW 2024: Full QCD+QED at physical point $\to$ all splittings.

---

### 6. Photon and Chiral Symmetry Breaking

#### 6.1 Photon Coupling to Chiral Condensate

$$\mathcal{L}_{\text{anomaly}} = \frac{\alpha}{8\pi} \frac{\langle \bar{q}q \rangle}{f_\pi} F_{\mu\nu} \tilde{F}^{\mu\nu} \pi^0$$

From Pion/Kaon V4.0 Part 04: $\pi^0 \to \gamma\gamma$ exact.

#### 6.2 Photon on the Lattice with Chiral Fermions

Domain wall / overlap fermions preserve chiral symmetry exactly.
Photon coupling:
$$D_{\text{DW}} + i e Q A$$

Chiral Ward identities with QED:
$$\partial_\mu \langle A^\mu_a(x) \mathcal{O}(0) \rangle = 2m \langle P_a(x) \mathcal{O}(0) \rangle + \text{anomaly}$$

#### 6.3 Photon Effects on $\langle \bar{q}q \rangle$

Photon fluctuations shift chiral condensate:
$$\langle \bar{q}q \rangle_{\text{QCD+QED}} = \langle \bar{q}q \rangle_{\text{QCD}} \left[ 1 + \mathcal{O}(\alpha) \right]$$

Shift $\sim 0.5\%$ (BMW 2024).

---

### 7. Non-Perturbative Photon Physics: Future Directions

| Direction | Status | Challenge |
|-----------|--------|-----------|
| Physical point QCD+QED | BMW 2024 done | Exascale for $<0.1\%$ |
| Photon mass in QGP | HotQCD ongoing | Analytic continuation |
| HLbL at physical point | Mainz, RBC/UKQCD | $<10\%$ precision |
| $\Delta M_{\text{hadrons}}$ | BMW 2024 | QED finite volume |
| Photon GPDs on lattice | HadStruc 2023 | Physical point |
| Photon in neutron star | QCD+QED at $\mu_B>0$ | Sign problem |

---

### 8. One-Electron Universe: Non-Perturbative Photon

In the one-electron universe, lattice = discretized worldline path integral.

#### 8.1 Lattice = Worldline Discretization

$a \to 0$ = worldline step $\Delta\tau \to 0$.
Lattice spacing $a$ = worldline proper-time resolution.

#### 8.2 Photon Mass = Worldline Gap

$m_\gamma \neq 0$ in medium = worldline has gap.
Worldline in plasma = worldline with periodic boundary conditions.
Gap = minimum energy to create kink.

#### 8.3 Confinement = Worldline Cannot Escape

Flux tube = worldline self-interaction prevents escape.
Photon in flux tube = worldline kink trapped in self-interaction.

#### 8.4 Lattice QED = Worldline Path Integral on Discrete Time

$$Z = \int \mathcal{D}x(\tau) e^{-S_E[x]} \approx \prod_{\tau} \int dx_\tau e^{-S_E[x_\tau]}$$

The photon field $A_\mu$ = worldline gauge connection.

---

### 9. References

1. **Lattice QED**: Hayakawa & Uno, *Prog. Theor. Phys.* **120**, 413 (2008); Endres et al., *Phys. Rev. Lett.* **115**, 072001 (2015)
2. **QCD+QED**: BMW, *Phys. Rev. Lett.* **117**, 222001 (2016); *Nature* **593**, 51 (2021)
3. **HVP**: BMW, *Nature* **593**, 51 (2021); *Phys. Rev. Lett.* **130**, 152001 (2023)
4. **HLbL**: Gerardin et al., *Phys. Rev. D* **100**, 014510 (2019); Mainz, *Phys. Rev. Lett.* **129**, 152001 (2022)
5. **Photon Mass**: Braaten & Pisarski, *Phys. Rev. D* **45**, 1827 (1992); HotQCD, *Phys. Rev. D* **109**, 054512 (2024)
6. **QED$_L$/QED$_M$**: Hayakawa & Uno, *Prog. Theor. Phys.* **120**, 413 (2008); Endres et al., *Phys. Rev. Lett.* **115**, 072001 (2015)
7. **One-Electron Lattice**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 8 — Next: One-Electron Photon — Complete Worldline Classification and Kink Dynamics*