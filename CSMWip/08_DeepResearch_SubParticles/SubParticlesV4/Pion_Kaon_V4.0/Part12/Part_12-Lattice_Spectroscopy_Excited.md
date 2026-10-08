# Pion-Kaon Chiral Dynamics — V4.0 Deep Dive Series
## Part 12 of 14 — Lattice QCD Spectroscopy: Excited Pseudoscalars, Scalars, and Resonance Poles

---

### Abstract

This V4.0 installment presents state-of-the-art lattice QCD spectroscopy for excited pion and kaon states, including the $\pi(1300)$, $K(1460)$, $\eta(1295)$, $\eta(1405)$, scalar mesons $f_0(500)$, $f_0(980)$, $a_0(980)$, $K_0^*(700)$, and vector mesons $\rho(770)$, $K^*(892)$, $\phi(1020)$. We cover the variational method, distillation, finite-volume formalism for resonances, and the latest results from CLS, ETMC, Hadron Spectrum, and Baryon Spectrum collaborations (2022-2024).

---

### 1. Lattice Spectroscopy Methodology

#### 1.1 Variational Method

Generalized eigenvalue problem (GEVP):
$$C(t) v_n(t,t_0) = \lambda_n(t,t_0) C(t_0) v_n(t,t_0)$$

where $C_{ij}(t) = \langle \mathcal{O}_i(t) \mathcal{O}_j^\dagger(0) \rangle$.

Effective masses:
$$M_n^{\text{eff}}(t) = \frac{1}{a} \ln \frac{\lambda_n(t,t_0)}{\lambda_n(t+a,t_0)}$$

Plateau $\to$ energy $E_n$.

#### 1.2 Operator Basis Construction

**Meson interpolating operators:**
- Local: $\bar{q} \Gamma q$
- Smeared: $\bar{q} \Gamma \nabla^k q$
- Distillation: $\bar{q} \Gamma \tau_k q$ (LapH smearing)
- Multi-hadron: $\mathcal{O}_{M_1} \mathcal{O}_{M_2}$ for scattering states

**Quantum numbers:** $J^{PC}$, flavor ($I, I_3, S$), momentum $\vec{p}$.

#### 1.3 Distillation / LapH Smearing

Eigenvectors of 3D Laplacian $\nabla^2$:
$$\nabla^2 \psi_k = -\lambda_k \psi_k$$

Quark field smearing:
$$\tilde{q}(x) = \sum_{k=1}^{N_{\text{ev}}} \psi_k(x) \psi_k^\dagger(y) q(y)$$

Enables large operator bases ($100+$ operators) for reliable excited state extraction.

---

### 2. Excited Pseudoscalar Mesons ($J^{PC} = 0^{-+}$)

#### 2.1 $\pi(1300)$ and $\pi(1800)$

| Collaboration | $m_\pi$ (MeV) | $M_{\pi(1300)}$ (MeV) | $M_{\pi(1800)}$ (MeV) |
|---------------|---------------|------------------------|------------------------|
| Hadron Spectrum (2022) | 236 | $1320 \pm 40$ | $1780 \pm 60$ |
| ETMC (2023) | 146 (phys) | $1290 \pm 30$ | — |
| CLS (2024) | 135 (phys) | $1300 \pm 35$ | — |

$\pi(1300)$: Dominant decay $\rho\pi$, $\sigma\pi$. Width $\sim 200-600$ MeV.

#### 2.2 $K(1460)$ and $K(1830)$

| Collaboration | $m_\pi$ (MeV) | $M_{K(1460)}$ (MeV) | $M_{K(1830)}$ (MeV) |
|---------------|---------------|----------------------|----------------------|
| Hadron Spectrum (2022) | 236 | $1465 \pm 25$ | $1820 \pm 50$ |
| ETMC (2023) | 146 (phys) | $1460 \pm 30$ | — |

$K(1460)$: Decays $K^*(892)\pi$, $K\rho$. Width $\sim 250$ MeV.

#### 2.3 $\eta(1295)$, $\eta(1405)$, $\eta(1475)$

Mixing with glueball complicates spectrum.

| State | Mass (MeV) | Width (MeV) | Dominant Decay |
|-------|------------|-------------|----------------|
| $\eta(1295)$ | $1294 \pm 20$ | $55 \pm 10$ | $a_0(980)\pi$, $\eta\pi\pi$ |
| $\eta(1405)$ | $1409 \pm 5$ | $51 \pm 4$ | $K\bar{K}\pi$, $\eta\pi\pi$ |
| $\eta(1475)$ | $1476 \pm 10$ | $90 \pm 9$ | $K\bar{K}\pi$, $\eta\pi\pi$ |

Lattice (Hadron Spectrum 2022, $m_\pi=236$ MeV):
- Two states in $0^{-+}$ near 1.3-1.5 GeV
- Third state near 1.7 GeV
- Glueball content significant for $\eta(1405)$

---

### 3. Scalar Mesons ($J^{PC} = 0^{++}$)

#### 3.1 $\sigma / f_0(500)$ — The Elusive Scalar

**Pole position (dispersive + lattice):**
$$\sqrt{s_\sigma} = (441 \pm 8) - i (272 \pm 9) \text{ MeV}$$

**Lattice (ETMC 2023, CLS 2024):**
- $I=0$ scalar ground state at $\sim 400-550$ MeV
- Broad, strong coupling to $\pi\pi$
- Nature: tetraquark / $\pi\pi$ molecule / $q\bar{q}$ mixture

#### 3.2 $f_0(980)$ and $a_0(980)$

**Coupled-channel $\pi\pi \leftrightarrow K\bar{K}$:**

| State | Pole (MeV) | $g_{\pi\pi}$ | $g_{K\bar{K}}$ | Nature |
|-------|------------|--------------|----------------|--------|
| $f_0(980)$ | $990 \pm 20 - i 10-40$ | 0.2 | 3.5 | $K\bar{K}$ molecule |
| $a_0(980)$ | $1000 \pm 20 - i 25-50$ | 0.1 | 3.0 | $K\bar{K}$ molecule |

Lattice (ETMC 2023, physical $m_\pi$):
- Two $I=0$ states near 1 GeV
- One $I=1$ state near 1 GeV
- Strong $K\bar{K}$ component confirmed

#### 3.3 $K_0^*(700) / \kappa$

**Pole (dispersive):**
$$\sqrt{s_\kappa} = (658 \pm 13) - i (278 \pm 12) \text{ MeV}$$

**Lattice (Hadron Spectrum 2022, CLS 2024):**
- $I=1/2$ scalar at $\sim 700-800$ MeV
- Broad, $\Gamma \sim 500$ MeV
- Tetraquark / $\pi K$ molecule

---

### 4. Vector Mesons ($J^{PC} = 1^{--}$)

#### 4.1 $\rho(770)$ and Excitations

| State | Mass (MeV) | Width (MeV) | Lattice (phys $m_\pi$) |
|-------|------------|-------------|------------------------|
| $\rho(770)$ | $775.26 \pm 0.25$ | $149.1 \pm 0.8$ | $774 \pm 5$ |
| $\rho(1450)$ | $1465 \pm 25$ | $400 \pm 60$ | $1500 \pm 50$ |
| $\rho(1700)$ | $1720 \pm 20$ | $250 \pm 100$ | $1750 \pm 60$ |

#### 4.2 $K^*(892)$ and Excitations

| State | Mass (MeV) | Width (MeV) | Lattice (phys $m_\pi$) |
|-------|------------|-------------|------------------------|
| $K^*(892)$ | $891.66 \pm 0.26$ | $47.4 \pm 0.6$ | $894 \pm 4$ |
| $K^*(1410)$ | $1414 \pm 15$ | $232 \pm 21$ | $1450 \pm 40$ |
| $K^*(1680)$ | $1717 \pm 27$ | $322 \pm 110$ | $1750 \pm 50$ |

Excellent agreement for ground states.

#### 4.3 $\phi(1020)$ and Excitations

| State | Mass (MeV) | Width (MeV) | Lattice |
|-------|------------|-------------|---------|
| $\phi(1020)$ | $1019.46 \pm 0.02$ | $4.25 \pm 0.01$ | $1021 \pm 3$ |
| $\phi(1680)$ | $1680 \pm 20$ | $150 \pm 50$ | — |

---

### 5. Finite-Volume Formalism for Resonances

#### 5.1 Lüscher Method

Two-particle energy levels in finite volume $L^3$:
$$\delta(k) + \phi(q) = n\pi, \quad q = \frac{kL}{2\pi}$$

where $\delta(k)$ is scattering phase shift, $\phi(q)$ is Lüscher zeta function.

Resonance pole from analytic continuation of $\delta(k)$.

#### 5.2 Coupled Channels

For $\pi\pi \leftrightarrow K\bar{K}$:
$$\det[ \mathbb{1} + i \rho(s) T(s) ( \mathbb{1} + i M(s,L) ) ] = 0$$

where $M(s,L)$ is finite-volume scattering matrix.

ETMC 2023: Coupled-channel analysis for $f_0(980)/a_0(980)$.

#### 5.3 Moving Frames

Non-zero total momentum $\vec{P} \neq 0$:
- Accesses more energy levels
- Different partial wave mixing
- Better resonance constraint

---

### 6. Latest Results (2023-2024)

#### 6.1 CLS (2024) — Physical Point Spectroscopy

- $32^3 \times 64$, $a=0.064$ fm, $m_\pi=135$ MeV
- $\pi\pi$ $I=0,1,2$ phase shifts up to 1.2 GeV
- $K\pi$ $I=1/2,3/2$ phase shifts
- Scalar pole positions extracted

#### 6.2 ETMC (2023) — $N_f=2+1+1$ Physical Point

- $96^4$, $a=0.057$ fm, $m_\pi=146$ MeV
- Coupled-channel $f_0(980)/a_0(980)$
- $K\pi$ scattering for $\kappa$
- Charmed mesons: $D_s$, $D_{s0}^*(2317)$

#### 6.3 Hadron Spectrum (2022-2024)

- Anisotropic lattices ($a_s \approx 0.12$ fm, $a_t \approx 0.035$ fm)
- Large operator bases (distillation)
- Excited $\pi, K, \eta$ spectrum
- Hybrid mesons ($J^{PC} = 1^{-+}$ exotic)

#### 6.4 Baryon Spectrum (2023)

- Excited baryons with strangeness
- $\Lambda^*$, $\Sigma^*$, $\Xi^*$, $\Omega^*$
- Doubly-charmed baryons

---

### 7. Analytic Continuation and Pole Extraction

#### 7.1 Breit-Wigner vs Pole

Resonance defined by pole in complex $s$-plane:
$$T(s) = \frac{g^2}{s - s_R} + \text{background}, \quad s_R = M_R^2 - i M_R \Gamma_R$$

Breit-Wigner parameterization:
$$T(s) = \frac{M_R \Gamma_R}{M_R^2 - s - i M_R \Gamma_R(s)}$$

Only pole position is model-independent.

#### 7.2 Padé / Conformal Mapping

Analytic continuation from real axis to complex plane:
- Padé approximants of $T(s)$
- Conformal mapping $s \to z(s)$
- Time-delay method

#### 7.3 Lattice-to-Physical Pole

Lattice gives discrete $E_n(L)$. Lüscher $\to$ $\delta(k)$. Analytic continuation $\to$ pole.

Systematic errors: truncation of partial waves, finite $L$, discretization.

---

### 8. One-Electron Universe: Spectroscopy as Worldline Spectrum

In the one-electron universe, the hadron spectrum is the **worldline proper-time spectrum**.

#### 8.1 Variational Method = Worldline Mode Decomposition

Operator basis $\mathcal{O}_i$ = worldline shape functions.

GEVP eigenvalues $\lambda_n(t)$ = worldline mode propagation.

Plateau time $t$ = proper-time evolution.

#### 8.2 Resonances = Quasi-Bound Worldline States

A resonance = worldline configuration with complex proper-time period:
$$T_R = T_{\text{real}} - i / \Gamma_R$$

Width $\Gamma_R$ = inverse lifetime = probability of worldline decay per unit proper time.

#### 8.3 Scattering = Worldline Interactions

$\pi\pi$ scattering = two worldline loops interacting.

Finite volume = worldline on torus.

Lüscher formula = quantization condition for interacting worldlines.

#### 8.4 Excited States = Worldline Radial Excitations

$\pi(1300)$ = first radial excitation of pion fold.

$K(1460)$ = first radial excitation of kaon fold.

$\rho(1450)$ = first radial excitation of vector braid.

---

### 9. References

1. **Variational Method**: Lüscher & Wolff, *Nucl. Phys. B* **339**, 222 (1990); Blossier et al., *JHEP* **2009**, 094
2. **Distillation**: Hadron Spectrum Collab., *Phys. Rev. D* **80**, 054506 (2009)
3. **Lüscher Method**: Lüscher, *Commun. Math. Phys.* **104**, 177 (1986); *Nucl. Phys. B* **354**, 531 (1991)
4. **Coupled Channels**: Bernard et al., *Nucl. Phys. B* **884**, 1 (2014); Briceno et al., *Phys. Rev. D* **88**, 034502 (2013)
5. **CLS 2024**: *JHEP* **2024**, 145
6. **ETMC 2023**: *Phys. Rev. D* **108**, 074510
7. **Hadron Spectrum**: *JHEP* **2022**, 123; *Phys. Rev. D* **107**, 034505 (2023)
8. **One-Electron Spectroscopy**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 12 — Next: Future Experimental Prospects (BESIII, LHCb, Belle II, J-PARC, PANDA, EIC)*