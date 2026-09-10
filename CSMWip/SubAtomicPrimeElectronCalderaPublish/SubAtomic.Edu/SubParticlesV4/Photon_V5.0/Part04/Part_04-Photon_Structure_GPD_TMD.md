# Photon Physics — V5.0 Deep Dive Series
## Part 4 of N — Photon Structure: Generalized Parton Distributions, Transverse Momentum Distributions, and EIC Tomography

---

### Abstract

This V5.0 installment develops the three-dimensional structure of the photon through Generalized Parton Distributions (GPDs) and Transverse Momentum Distributions (TMDs). We derive the photon's partonic content, its role in deep inelastic scattering, and the tomographic capabilities of the future Electron-Ion Collider (EIC) to image the photon's internal landscape in both momentum and impact parameter space.

---

### 1. Photon Parton Distribution Functions

#### 1.1 Photon as a Parton Target

In $ep \to e' X$ and $\gamma p \to X$, the photon acts as a target with partonic structure.

**Weizsäcker-Williams approximation** (equivalent photon flux):
$$f_{\gamma/e}(x, Q^2) = \frac{\alpha}{2\pi} \frac{1 + (1-x)^2}{x} \ln \frac{Q^2_{\text{max}}}{Q^2_{\text{min}}}$$

where $x = k_\gamma / E_e$.

#### 1.2 Photon PDFs: Point-like and Hadronic Components

The photon structure function $F_2^\gamma(x, Q^2)$:

$$F_2^\gamma(x, Q^2) = F_2^{\gamma, \text{pl}}(x, Q^2) + F_2^{\gamma, \text{had}}(x, Q^2)$$

**Point-like (QED) component** — DGLAP evolution from $q \to q\gamma$:
$$F_2^{\gamma, \text{pl}}(x, Q^2) = \frac{\alpha}{2\pi} \sum_q e_q^4 \left[ (x^2 + (1-x)^2) \ln \frac{Q^2}{\Lambda^2} + \cdots \right]$$

**Hadronic component** — VMD-inspired, non-perturbative:
$$F_2^{\gamma, \text{had}}(x, Q^2) = \sum_V \frac{4\pi\alpha}{f_V^2} F_2^V(x, Q^2)$$

where $V = \rho, \omega, \phi, J/\psi, \Upsilon$.

#### 1.3 Modern Photon PDF Sets

| Set | Description | $Q^2$ Range |
|-----|-------------|-------------|
| **GRV** (1992) | Classic LO/NLO | $1-10^4$ GeV$^2$ |
| **AFG** (2004) | NLO, hadronic + pl | $1-10^6$ GeV$^2$ |
| **CT14QED** (2015) | Photon in proton | $1-10^8$ GeV$^2$ |
| **NNPDF4.0QED** (2021) | NNLO + QED, MC | $1-10^8$ GeV$^2$ |
| **LUXqed** (2016) | $ep$ data driven | $1-10^6$ GeV$^2$ |

NNPDF4.0QED: Photon PDF in proton constrained by $ep \to e' \gamma X$, $pp \to \gamma X$, $W/Z+\gamma$.

---

### 2. Generalized Parton Distributions (GPDs) of the Photon

#### 2.1 Photon GPD Definition

$$H_\gamma^q(x, \xi, t) = \int \frac{dz^-}{4\pi} e^{ixP^+z^-} \langle \gamma(p') | \bar{q}(-z/2) \gamma^+ q(z/2) | \gamma(p) \rangle$$

where:
- $x$ = average momentum fraction
- $\xi = -\Delta^+ / 2P^+$ = skewness
- $t = \Delta^2$ = momentum transfer

#### 2.2 Photon GPD Properties

**Polynomiality**:
$$\int_{-1}^1 dx \, x^n H_\gamma^q(x, \xi, t) = \sum_{k=0}^{n} (2\xi)^k A_{n,k}(t) + \xi^{n+1} C_n(t)$$

**Forward limit**:
$$H_\gamma^q(x, 0, 0) = q_\gamma(x) \quad \text{(photon PDF)}$$

**Form factor relation**:
$$\int_{-1}^1 dx \, H_\gamma^q(x, \xi, t) = F_1^\gamma(t) \quad \text{(photon elastic FF)}$$

#### 2.3 Photon GPD Models

**Overlap representation** (Diehl 2003):
$$H_\gamma(x, \xi, t) = \sum_n \int [d^2k_\perp] \psi_n^*(x_i', \vec{k}_\perp') \psi_n(x_i, \vec{k}_\perp)$$

**Factorized ansatz**:
$$H_\gamma^q(x, \xi, t) = q_\gamma(x) \cdot F(t) \cdot \left( \frac{1-\xi}{1+\xi} \right)^{\alpha(t)}$$

where $F(t)$ = dipole form factor, $\alpha(t)$ = Regge trajectory.

#### 2.4 Lattice QCD Photon GPDs

From Pion/Kaon V4.0 Part 13: EIC will measure photon GPDs via:
- $ep \to e' \gamma p$ (DVCS on photon)
- $ep \to e' \pi^0 p$ (pion GPDs from photon)

Lattice (HadStruc 2023): Quasi-PDFs for photon at $m_\pi \approx 300$ MeV.
Future: Physical point $N_f=2+1+1$ photon GPDs.

---

### 3. Transverse Momentum Distributions (TMDs) of the Photon

#### 3.1 Photon TMD Definition

$$f_{\gamma/q}(x, \vec{k}_\perp^2; \mu, \zeta) = \int \frac{dz^- d^2\vec{z}_\perp}{(2\pi)^3} e^{-ixP^+z^- + i\vec{k}_\perp \cdot \vec{z}_\perp} \langle \gamma | \bar{q} \mathcal{W} \gamma^+ \mathcal{W} q | \gamma \rangle$$

where $\mathcal{W}$ = gauge link, $\zeta$ = rapidity scale.

#### 3.2 Photon TMDs for Unpolarized Photon

| TMD | Definition | Interpretation |
|-----|------------|----------------|
| $f_1(x, k_\perp^2)$ | Unpolarized | Transverse momentum density |
| $g_{1T}(x, k_\perp^2)$ | Worm-gear | Long. pol. $\to$ trans. mom. |

For photon: $f_1^\gamma(x, k_\perp^2) \approx \frac{\alpha}{2\pi} \frac{1+(1-x)^2}{x} \frac{1}{k_\perp^2}$ (Weizsäcker-Williams).

#### 3.3 TMD Evolution

Collins-Soper equation:
$$\frac{\partial \ln f(x, k_\perp; \mu, \zeta)}{\partial \ln \sqrt{\zeta}} = \tilde{K}(k_\perp; \mu)$$

Rapidity evolution kernel $\tilde{K}$ = soft factor.

CSS resummation:
$$f(x, k_\perp; Q) = \int \frac{d^2\vec{b}}{(2\pi)^2} e^{i\vec{k}_\perp \cdot \vec{b}} \tilde{f}(x, \vec{b}; Q) e^{-S(Q, b)}$$

#### 3.4 Photon TMDs in SIDIS

$ep \to e' \gamma X$ with photon measured:
- $k_\perp$ of photon $\to$ TMD of quark in proton
- $q_T$ of photon $\to$ $q_T$ distribution of photon itself

EIC will measure photon $k_\perp$ distributions at $x \sim 10^{-3}-0.5$, $Q^2 \sim 1-10^4$ GeV$^2$.

---

### 4. Photon Tomography at EIC

#### 4.1 EIC Kinematics

- $e^-$ (5-18 GeV) $\times$ $p$ (50-275 GeV) / $A$ (up to 100 GeV/n)
- Luminosity: $10^{34} \text{ cm}^{-2}\text{s}^{-1}$
- Polarized: $e$ (80%), $p$ (70%)

#### 4.2 Photon Tomography Channels

| Channel | Process | Photon Role | Observable |
|---------|---------|-------------|------------|
| **DVCS on photon** | $ep \to e' \gamma p$ | Target | $H_\gamma(x, \xi, t)$ |
| **Photon DVCS** | $ep \to e' \gamma p$ | Probe | $H_p(x, \xi, t)$ via $\gamma^*$ |
| **Photon TMD** | $ep \to e' \gamma X$ | Measured | $f_\gamma(x, k_\perp)$ |
| **Photon PDF** | $ep \to e' \gamma X$ | Target | $q_\gamma(x, Q^2)$ |

#### 4.3 3D Imaging: Wigner Distributions

$$W_\gamma(x, \vec{b}_\perp, \vec{k}_\perp) = \int \frac{d^2\Delta_\perp}{(2\pi)^2} e^{-i\vec{\Delta}_\perp \cdot \vec{b}_\perp} H_\gamma(x, \xi=0, t=-\Delta_\perp^2)$$

EIC will map:
- $x$-$b_\perp$ plane: transverse spatial distribution of quarks/gluons in photon
- $x$-$k_\perp$ plane: transverse momentum structure
- $b_\perp$-$k_\perp$ correlations: orbital angular momentum

#### 4.4 Photon Mechanical Properties

From GPDs at $x=0$:
- **Pressure distribution**: $p(r) = \frac{1}{6M} \frac{d}{dr} r^2 \frac{d}{dr} D(r)$
- **Shear forces**: $s(r)$ from $E$ GPD
- **Mass radius**: $\langle r^2 \rangle_M = \int d^2b_\perp b_\perp^2 W(x=0, b_\perp)$

For photon: unique mechanical properties due to point-like + hadronic duality.

---

### 5. Photon-Initiated Processes at LHC

#### 5.1 Photon-Photon Fusion

$$\gamma \gamma \to W^+W^-, ZZ, HH, \text{BSM}$$

Photon flux from protons:
$$f_{\gamma/p}(x) \approx \frac{\alpha}{2\pi} \frac{1+(1-x)^2}{x} \ln \frac{Q^2_{\text{max}}}{Q^2_{\text{min}}}$$

ATLAS/CMS: $\gamma\gamma \to WW$ (4.5$\sigma$), $\gamma\gamma \to \gamma\gamma$ (light-by-light).

#### 5.2 Photon-Induced $W/Z$ Production

$p p \to p \gamma^* p \to p W/Z p$:
- $\gamma W \to W$ fusion
- $W$ mass measurement, anomalous couplings

#### 5.3 Photon-Photon $\to$ BSM

- $\gamma\gamma \to \tilde{\chi}^+\tilde{\chi}^-$ (SUSY)
- $\gamma\gamma \to A' A'$ (dark photons)
- $\gamma\gamma \to H^+H^-$ (2HDM)

High-luminosity LHC: $10^4$ $\gamma\gamma$ events/year.

---

### 6. One-Electron Universe: Photon Structure as Worldline Tomography

In the one-electron universe, photon structure = worldline tomography.

#### 6.1 Photon PDF = Worldline Momentum Distribution

$$q_\gamma(x) = \int \mathcal{D}\mathcal{W} \, \delta(x - x(\mathcal{W})) \, e^{i S[\mathcal{W}]}$$

The photon's quark content = worldline segments with quark quantum numbers.

#### 6.2 Photon GPD = Worldline Correlator in Impact Parameter

$$H_\gamma(x, \xi, t) \sim \int d^2b_\perp e^{i\vec{\Delta}_\perp \cdot \vec{b}_\perp} \langle \mathcal{W}(b_\perp) | \mathcal{O}(x) | \mathcal{W}(0) \rangle$$

Fourier transform to $b_\perp$ = worldline transverse profile.

#### 6.3 Photon TMD = Worldline Transverse Momentum

$$f_\gamma(x, \vec{k}_\perp) \sim \int \mathcal{D}\mathcal{W} \, \delta(x - x(\mathcal{W})) \delta^2(\vec{k}_\perp - \vec{k}_\perp(\mathcal{W})) e^{i S[\mathcal{W}]}$$

The photon's $k_\perp$ = worldline transverse kicks from QCD strings.

#### 6.4 EIC Tomography = Worldline 3D Imaging

EIC measures $W_\gamma(x, \vec{b}_\perp, \vec{k}_\perp)$ = Wigner distribution of worldline.
- $b_\perp$: where worldline folds are in transverse plane
- $k_\perp$: transverse kicks from gluon emissions
- $x$: longitudinal momentum fraction along worldline

The photon's mechanical properties (pressure, shear) = worldline stress tensor.

---

### 7. Future Directions

| Direction | Timeline | Facility |
|-----------|----------|----------|
| Photon GPDs at $x<0.01$ | 2030+ | EIC |
| Photon TMDs at $k_\perp < 1$ GeV | 2025+ | LHC, EIC |
| Photon PDF at N$^3$LO | 2025+ | Theory |
| Lattice photon GPDs | 2028+ | Exascale |
| Photon Wigner distributions | 2030+ | EIC + theory |

---

### 8. References

1. **Photon PDFs**: Glück, Reya, Vogt, *Phys. Rev. D* **45**, 3986 (1992); NNPDF, *Eur. Phys. J. C* **81**, 1004 (2021)
2. **Photon GPDs**: Diehl, *Eur. Phys. J. C* **25**, 223 (2002); Kumerički, *Phys. Rev. D* **99**, 074014 (2019)
3. **TMDs**: Collins, *Foundations of Perturbative QCD* (2011); Echevarria et al., *JHEP* **2013**, 070
4. **EIC Photon**: *Nucl. Phys. A* **1026**, 122447 (2022) — Yellow Report
5. **Photon-induced LHC**: d'Enterria & da Silva, *Phys. Rev. Lett.* **126**, 112001 (2021)
6. **One-Electron Tomography**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)
7. **Lattice GPDs**: HadStruc Collab., *Phys. Rev. D* **107**, 014512 (2023)

---

*End of Part 4 — Next: Photon-Photon Physics (Light-by-Light, $\gamma\gamma \to$ Hadrons, BSM Searches)*