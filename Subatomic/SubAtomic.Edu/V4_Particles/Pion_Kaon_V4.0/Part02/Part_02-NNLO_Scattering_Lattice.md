# Pion-Kaon Chiral Dynamics — V4.0 Deep Dive Series
## Part 2 of N — NNLO Chiral Perturbation Theory, ππ/πK Scattering, and Lattice Spectroscopy

---

### Abstract

This V4.0 installment extends the chiral effective field theory to next-to-next-to-leading order (NNLO, $\mathcal{O}(p^6)$), develops the dispersive and lattice analysis of $\pi\pi$ and $\pi K$ scattering, and presents the current spectroscopy of excited pseudoscalar and scalar mesons from CLS, ETMC, and HotQCD collaborations (2023-2024).

---

### 1. NNLO Chiral Perturbation Theory ($\mathcal{O}(p^6)$)

#### 1.1 The $\mathcal{L}_6$ Lagrangian

At NNLO, the chiral Lagrangian contains 90+ low-energy constants (LECs) for $N_f=3$:

$$\mathcal{L}_6 = \sum_{i=1}^{90} C_i \mathcal{O}_i^{(6)}$$

where $\mathcal{O}_i^{(6)}$ are chirally invariant operators of dimension 6. The complete basis was classified by Bijnens, Colangelo, and Ecker (1999) and extended for $N_f=3$.

#### 1.2 Renormalization Scale Independence

The NNLO amplitudes satisfy:

$$\mu \frac{d}{d\mu} \mathcal{A}_{\text{NNLO}} = 0$$

which imposes relations between $C_i^r(\mu)$ and the NLO LECs $L_i^r(\mu)$:

$$\mu \frac{d C_i^r}{d\mu} = -\frac{1}{(4\pi)^4} \Gamma_i(L_j^r)$$

The $\Gamma_i$ coefficients are known analytically.

#### 1.3 NNLO LECs from Phenomenology and Lattice

Key $C_i^r$ (at $\mu = 770$ MeV, in units of $10^{-3} \text{ GeV}^{-2}$):

| LEC | Value | Source |
|-----|-------|--------|
| $C_{12}$ | $0.5 \pm 0.3$ | $\pi\pi$ scattering |
| $C_{13}$ | $-1.2 \pm 0.5$ | $K_{e4}$ decays |
| $C_{14}$ | $0.8 \pm 0.4$ | $\pi K$ scattering |
| $C_{15}$ | $-0.4 \pm 0.2$ | $F_\pi^V$ slope |
| $C_{34}$ | $1.1 \pm 0.6$ | $M_\pi^2$ curvature |
| $C_{35}$ | $-0.7 \pm 0.3$ | $M_K^2$ curvature |

Full table: Bijnens & Ghorbani, *JHEP* **2007**, 030 (2007) — updated with FLAG 2024 lattice.

---

### 2. ππ Scattering

#### 2.1 Partial Wave Expansion

$$T^I(s,t,u) = 32\pi \sum_{\ell} (2\ell+1) P_\ell(z) t_\ell^I(s)$$

Isospin channels: $I=0$ (scalar), $I=1$ (vector), $I=2$ (tensor).

#### 2.2 Scattering Lengths (NNLO ChPT + Dispersive)

| Channel | ChPT NNLO | Dispersive (Roy eq.) | Lattice (ETMC 2023) |
|---------|-----------|----------------------|---------------------|
| $a_0^0$ | $0.220 \pm 0.005$ | $0.220 \pm 0.005$ | $0.219 \pm 0.008$ |
| $a_0^2$ | $-0.0444 \pm 0.0010$ | $-0.0444 \pm 0.0010$ | $-0.044 \pm 0.003$ |
| $a_1^1$ | $0.038 \pm 0.002$ | $0.038 \pm 0.002$ | $0.037 \pm 0.004$ |

Dispersive analysis (Colangelo, Gasser, Leutwyler 2001) updated with NA48/2 $K_{e4}$ data.

#### 2.3 The $\sigma/f_0(500)$ Pole

Unitarized ChPT (Inverse Amplitude Method) and dispersive methods locate the pole:

$$\sqrt{s_\sigma} = (441 \pm 8) - i (272 \pm 9) \text{ MeV}$$

Corresponds to the lightest scalar resonance. Lattice (CLS 2024) confirms broad scalar state at $\sim 450$ MeV in $I=0$ channel.

#### 2.4 The $f_0(980)$ and $a_0(980)$

Coupled-channel $\pi\pi \leftrightarrow K\bar{K}$ effect. Pole positions:

$$\sqrt{s_{f_0}} \approx 990 - i 25 \text{ MeV}, \quad \sqrt{s_{a_0}} \approx 1000 - i 50 \text{ MeV}$$

Interpretation: tetraquark / $K\bar{K}$ molecule vs. $q\bar{q}$ debated. Lattice (ETMC 2023) finds both in $I=0,1$ scalar channels near 1 GeV.

---

### 3. πK Scattering

#### 3.1 Channels and Thresholds

Isospin $I=1/2, 3/2$. Thresholds:

$$\pi K \to \pi K, \quad \pi K \to \eta K, \quad \pi K \to K\eta'$$

#### 3.2 Scattering Lengths

| Channel | ChPT NNLO | Dispersive | Lattice (CLS 2024) |
|---------|-----------|------------|---------------------|
| $a_0^{1/2}$ | $0.186 \pm 0.010$ | $0.186 \pm 0.008$ | $0.188 \pm 0.012$ |
| $a_0^{3/2}$ | $-0.059 \pm 0.004$ | $-0.059 \pm 0.003$ | $-0.057 \pm 0.006$ |

#### 3.3 The $K_0^*(700)$ / $\kappa$ Pole

Elusive broad scalar in $I=1/2$ S-wave:

$$\sqrt{s_\kappa} = (658 \pm 13) - i (278 \pm 12) \text{ MeV}$$

Dispersive analysis (Pelaez, Ruiz de Elvira 2021) + lattice (CLS 2024) confirm. Nature: tetraquark / $\pi K$ molecule.

#### 3.4 The $K^*(892)$ Vector Resonance

P-wave $I=1/2$:

$$M_{K^*} = 891.66 \pm 0.26 \text{ MeV}, \quad \Gamma_{K^*} = 47.4 \pm 0.6 \text{ MeV}$$

Lattice (ETMC 2023, $m_\pi = 135$ MeV): $M_{K^*} = 894 \pm 4$ MeV — excellent agreement.

---

### 4. Lattice QCD Spectroscopy (2023-2024)

#### 4.1 Pseudoscalar Ground States

| Collaboration | $N_f$ | $M_\pi$ (MeV) | $M_K$ (MeV) | $F_\pi$ (MeV) | $F_K$ (MeV) |
|---------------|-------|---------------|-------------|---------------|-------------|
| CLS 2024 | 2+1 | 135 (phys) | 495 | 92.1(5) | 110.2(7) |
| ETMC 2023 | 2+1+1 | 135 (phys) | 497 | 92.2(4) | 110.0(6) |
| HotQCD 2024 | 2+1 | 135 (phys) | 496 | 92.0(5) | 110.3(7) |
| MILC 2023 | 2+1+1 | 135 (phys) | 495 | 92.07(46) | 110.1(7) |
| **FLAG 2024 avg** | — | — | — | **92.07(46)** | **110.1(7)** |

#### 4.2 Excited Pseudoscalars: $\pi(1300), K(1460), \eta(1295), \eta(1405)$

Lattice spectroscopy (CLS 2024, $32^3 \times 64$, $a \approx 0.064$ fm):

| State | $J^{PC}$ | Mass (MeV) | Width (MeV) | Dominant decay |
|-------|----------|------------|-------------|----------------|
| $\pi(1300)$ | $0^{-+}$ | $1300 \pm 30$ | $200-600$ | $\rho\pi, \sigma\pi$ |
| $K(1460)$ | $0^{-+}$ | $1460 \pm 25$ | $250 \pm 50$ | $K^*(892)\pi, K\rho$ |
| $\eta(1295)$ | $0^{-+}$ | $1294 \pm 20$ | $55 \pm 10$ | $a_0(980)\pi, \eta\pi\pi$ |
| $\eta(1405)$ | $0^{-+}$ | $1409 \pm 5$ | $51 \pm 4$ | $K\bar{K}\pi, \eta\pi\pi$ |

#### 4.3 Scalar Nonet: $f_0(500), f_0(980), a_0(980), K_0^*(700)$

| State | $J^{PC}$ | Mass (MeV) | Lattice (CLS/ETMC) |
|-------|----------|------------|---------------------|
| $\sigma/f_0(500)$ | $0^{++}$ | $400-550 - i 200-350$ | Broad, $I=0$ |
| $f_0(980)$ | $0^{++}$ | $990 \pm 20 - i 10-40$ | $I=0$, near $K\bar{K}$ threshold |
| $a_0(980)$ | $0^{++}$ | $1000 \pm 20 - i 25-50$ | $I=1$, near $K\bar{K}$ threshold |
| $K_0^*(700)/\kappa$ | $0^{++}$ | $650-750 - i 250-300$ | $I=1/2$, broad |

#### 4.4 Finite Volume and Chiral Extrapolation

For $M_\pi L > 4$, finite-volume corrections to masses $\lesssim 0.5\%$. Chiral extrapolation from $M_\pi = 135-400$ MeV uses NNLO ChPT forms with $C_i$ priors from phenomenology.

---

### 5. Dispersive Analysis and Roy-Steiner Equations

#### 5.1 Roy Equations for $\pi\pi$

$$\text{Re } t_\ell^I(s) = \text{polynomial} + \sum_{I',\ell'} \int_{4M_\pi^2}^\infty ds' K_{\ell\ell'}^{II'}(s,s') \text{Im } t_{\ell'}^{I'}(s')$$

Kernel $K$ derived from crossing symmetry and analyticity.

#### 5.2 Roy-Steiner for $\pi K$

Coupled $\pi K \to \pi K, \eta K$ channels. Solves for $t_\ell^I(s)$ with forward dispersion relations.

#### 5.3 Results: Phase Shifts and Poles

High-precision phase shifts up to $\sqrt{s} \approx 1.1$ GeV. Used for:
- $K_{\ell4}$ form factor normalization ($|V_{us}|$)
- Hadronic light-by-light scattering ($g-2$)
- $K \to \pi\pi$ non-leptonic weak amplitudes

---

### 6. One-Electron Universe: Scattering as Worldline Topology

In the one-electron universe, scattering amplitudes correspond to worldline correlation functions:

$$\mathcal{A}(a b \to c d) \sim \int \mathcal{D}x(\tau) \, e^{i S[x]} \prod_{i} \mathcal{O}_i[x(\tau_i)]$$

#### 6.1 S-Matrix from Worldline Loops

The partial wave amplitude $t_\ell^I(s)$ maps to a worldline sector with:

- Proper time period $T = 2\pi / \sqrt{s}$
- Winding number in flavor space = $\ell$
- Isospin = representation of $SU(2)_V$ or $SU(3)_V$

#### 6.2 Resonances as Worldline Bound States

A resonance pole at $\sqrt{s_R} = M_R - i \Gamma_R/2$ corresponds to a quasi-periodic worldline orbit with:

$$\text{Im } \tau_{\text{period}} = \frac{2}{\Gamma_R}$$

The $\sigma/f_0(500)$ has the largest imaginary proper-time period (broadest), while $K^*(892)$ has the smallest (narrowest).

#### 6.3 Crossing Symmetry = Worldline Time Reversal

$s$-channel $\leftrightarrow$ $t$-channel crossing corresponds to $\tau \to -\tau$ on the worldline. Analytic continuation in Mandelstam variables maps to deformation of the proper-time contour.

---

### 7. References

1. **ChPT NNLO**: Bijnens, Colangelo, Ecker, *JHEP* **1999**, 002; Bijnens, Ghorbani, *JHEP* **2007**, 030
2. **Dispersive $\pi\pi$**: Colangelo, Gasser, Leutwyler, *Nucl. Phys. B* **603**, 125 (2001)
3. **Dispersive $\pi K$**: Pelaez, Ruiz de Elvira, *Eur. Phys. J. C* **81**, 660 (2021)
4. **Lattice Spectroscopy**: CLS Collaboration, *JHEP* **2024**, 145; ETMC, *Phys. Rev. D* **108**, 074510 (2023); HotQCD, *Phys. Rev. D* **109**, 054512 (2024)
5. **FLAG 2024**: Aoki et al., *Eur. Phys. J. C* **84**, 1 (2024)
6. **Roy-Steiner**: Hoferichter et al., *Phys. Rev. Lett.* **115**, 192301 (2015)
7. **One-Electron Universe**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)
8. **Resonance Poles**: Garcia-Martin et al., *Phys. Rev. D* **83**, 074004 (2011); PDG 2024

---

*End of Part 2 — Next: Weak Decays ($K_{\ell3}$, $K_{\ell4}$, $\pi_{\ell3}$), $|V_{us}|$, and CP Violation in Kaon System*