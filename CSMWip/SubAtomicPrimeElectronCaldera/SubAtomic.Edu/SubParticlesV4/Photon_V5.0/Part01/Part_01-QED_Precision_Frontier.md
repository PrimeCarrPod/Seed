# Photon Physics — V5.0 Deep Dive Series
## Part 1 of N — Quantum Electrodynamics at the Precision Frontier: Anomaly, Polarizability, and the One-Electron Universe

---

### Abstract

This V5.0 installment launches the photon deep dive series at the precision frontier, building directly on the Pion/Kaon V4.0 foundation (radiative decays, WZW anomaly, polarizabilities, PrimEx-II). We develop QED with non-perturbative strong interaction inputs, the photon in QCD media, precision tests of the Standard Model, and the photon's role in the one-electron universe where it emerges as a worldline kink in the electromagnetic field.

---

### 1. The Photon in the Standard Model

#### 1.1 QED Lagrangian with Strong Interaction Inputs

$$\mathcal{L} = -\frac{1}{4} F_{\mu\nu} F^{\mu\nu} + \bar{\psi} (i \gamma^\mu D_\mu - m) \psi + \mathcal{L}_{\text{QCD}}$$

where $D_\mu = \partial_\mu + i e Q A_\mu + i g_s T^a G_\mu^a$.

The photon couples to quarks via electric charge matrix $Q = \text{diag}(2/3, -1/3, -1/3, ...)$.

#### 1.2 Photon as Goldstone vs Gauge Boson

In the SM, the photon is the gauge boson of unbroken $U(1)_{\text{EM}}$. In the one-electron universe, it is a **worldline kink** — a topological defect in the EM field along the electron trajectory.

---

### 2. Radiative Decays: Precision Anomaly Tests

#### 2.1 $\pi^0 \to \gamma\gamma$ — The Anchor

From Pion/Kaon V4.0 Part 04:
$$\Gamma(\pi^0 \to \gamma\gamma) = \frac{\alpha^2 M_{\pi^0}^3}{64\pi^3 F_\pi^2} N_c^2 = 7.802 \pm 0.052 \text{ eV} \quad (N_c=3)$$

**PrimEx-II (JLab, 2024+)** targets $<1\%$ precision.

#### 2.2 $\eta, \eta' \to \gamma\gamma$ — Mixing and Anomaly

$$\Gamma(\eta \to \gamma\gamma) = 0.510 \pm 0.026 \text{ keV}$$
$$\Gamma(\eta' \to \gamma\gamma) = 4.35 \pm 0.15 \text{ keV}$$

Test $\eta$-$\eta'$ mixing angle $\theta_P$ and gluonic content.

#### 2.3 Rare Radiative Decays

| Decay | SM BR | Status | V5.0 Focus |
|-------|-------|--------|------------|
| $\pi^0 \to e^+e^-$ | $6.23\times10^{-8}$ | NA62 5% | PrimEx-II, BESIII |
| $\eta \to \mu^+\mu^-$ | $4.7\times10^{-6}$ | NA60 | ChPT $\mathcal{O}(p^6)$ |
| $\eta' \to \gamma\gamma$ | $4.35\text{ keV}$ | PDG | Glueball mixing |
| $K_L \to \pi^0\gamma\gamma$ | $\sim 10^{-6}$ | NA48 | CPV amplitude |
| $\eta \to \pi^0\gamma\gamma$ | $2.56\times10^{-4}$ | PDG | ChPT $\mathcal{O}(p^6)$ |

---

### 3. Photon Polarizabilities: Probing QCD Structure

#### 3.1 Pion Polarizabilities (from Pion/Kaon V4.0 Part 04)

$$\alpha_{\pi^\pm} = \frac{\alpha}{8\pi^2 F_\pi^2 M_\pi} = 2.7 \times 10^{-4} \text{ fm}^3$$
$$\beta_{\pi^\pm} = -\frac{\alpha}{16\pi^2 F_\pi^2 M_\pi} = -1.3 \times 10^{-4} \text{ fm}^3$$

**COMPASS 2024**: $\alpha_\pi - \beta_\pi = (4.0 \pm 1.2) \times 10^{-4} \text{ fm}^3$ — consistent with ChPT.

#### 3.2 Generalized Polarizabilities $\alpha(Q^2), \beta(Q^2)$

Virtual Compton scattering $\gamma^* \pi \to \gamma \pi$ at JLab Hall A (2024):
- $Q^2$ up to $0.5 \text{ GeV}^2$
- Test ChPT $\mathcal{O}(p^6)$ predictions
- Access to pion mechanical properties

#### 3.3 Nucleon Polarizabilities

$$\alpha_p = 12.1 \pm 0.6, \quad \beta_p = 1.6 \mp 0.6 \quad (10^{-4} \text{ fm}^3)$$
$$\alpha_n = 12.5 \pm 1.3, \quad \beta_n = 2.7 \mp 1.3 \quad (10^{-4} \text{ fm}^3)$$

From $\gamma p \to \gamma p$ (MAMI, HI$\gamma$S). V5.0: lattice QCD inputs at physical point.

---

### 4. Photon in QCD Media

#### 4.1 Thermal Photon Rate

In QGP at $T \sim 150-500$ MeV:
$$\frac{dR}{d^3k} = \frac{\alpha}{2\pi^2} \frac{1}{e^{k_0/T} - 1} \text{Im} \Pi_{\text{em}}^{\text{ret}}(k_0, \vec{k})$$

From Pion/Kaon V4.0 Part 05: $T_c = 156.5 \pm 1.5$ MeV.

#### 4.2 Photon Spectral Function

$$\rho_{\text{em}}(\omega) = -\frac{1}{\pi} \text{Im} \Pi_{\text{em}}(\omega)$$

Peak at $\omega \sim 770$ MeV ($\rho$ meson). In medium: broadening, shift.

**NA60+ (future)**: Dilepton $M_{ee} \sim 600$ MeV region.

#### 4.3 Photon in Strong Magnetic Fields

From heavy-ion CME (Part 05): $B \sim 10^{15}$ T.
- Photon birefringence
- $\pi^0 \to \gamma\gamma$ rate modification
- Vacuum polarization effects

---

### 5. Precision QED Tests

#### 5.1 Electron $g-2$

$$a_e = \frac{g_e-2}{2} = 0.00115965218161(23)$$

5-loop QED + hadronic + weak contributions.
Hadronic VP: $a_e^{\text{had,VP}} = 1.875(18) \times 10^{-12}$ (lattice + dispersive).

#### 5.2 Muon $g-2$ — The Tension

$$a_\mu^{\text{exp}} - a_\mu^{\text{SM}} = (251 \pm 59) \times 10^{-11} \quad (4.2\sigma)$$

Hadronic VP (lattice BMW 2024): $a_\mu^{\text{had,VP}} = 707.5(5.5) \times 10^{-10}$.
Hadronic LbL: $a_\mu^{\text{had,LbL}} = 92(18) \times 10^{-10}$.

V5.0: Photon-photon scattering, $\pi\pi$ LbL from dispersive + lattice.

#### 5.3 Fine Structure Constant $\alpha$

$$\alpha^{-1} = 137.035999084(21) \quad \text{(Cs recoil, 2020)}$$
$$\alpha^{-1} = 137.035999166(15) \quad \text{(Rb recoil, 2023)}$$

Tension at $2.5\sigma$. Photon recoil measurements.

---

### 6. Photon Structure: GPDs and TMDs

#### 6.1 Photon Parton Distribution Functions

$$\gamma(x, \mu^2) = \frac{\alpha}{2\pi} \sum_q e_q^2 \left[ x^2 + (1-x)^2 \right] \ln \frac{\mu^2}{m_q^2} + \cdots$$

From Pion/Kaon V4.0 Part 13: EIC will measure $\gamma(x)$ via $ep \to e' \gamma X$.

#### 6.2 Photon GPDs

$$H_\gamma(x, \xi, t) = \int \frac{dz^-}{4\pi} e^{ixP^+z^-} \langle p' | F^{+i}(z^-) F_i^+(0) | p \rangle$$

3D imaging of photon in proton. EIC golden channel.

---

### 7. One-Electron Universe: Photon as Worldline Kink

#### 7.1 Worldline Origin of the Photon

In the one-electron universe (Wheeler 1940, Gielerak 2020), the electron worldline $\mathcal{W}$ threads through spacetime. The photon is a **kink** — a discontinuity in the worldline's EM field:

$$A_\mu(x) = \int_{\mathcal{W}} d\tau \, \dot{x}_\mu(\tau) \, \delta^4(x - x(\tau))$$

The photon field is the EM field of the single electron worldline.

#### 7.2 Photon Emission = Worldline Kink Creation

When the worldline changes direction (accelerates), a kink propagates outward:
- Bremsstrahlung: worldline bend
- Synchrotron: worldline circle
- Annihilation: worldline meeting anti-worldline

#### 7.3 $\pi^0 \to \gamma\gamma$ as Worldline Folding

From Pion/Kaon V4.0 Part 09: pion = fold in worldline.
$\pi^0 \to \gamma\gamma$ = fold emits two kinks.
Anomaly coefficient $N_c/3$ = number of worldline color sheets.

#### 7.4 Virtual Photons = Worldline Self-Interaction

The electron interacts with its own EM field:
$$\Pi_{\text{em}}(k) = \int \mathcal{D}\mathcal{W} \, e^{i S_{\text{worldline}}} \, \mathcal{O}_{\text{EM}}[k]$$

Lamb shift, $g-2$, vacuum polarization = worldline self-interaction effects.

---

### 8. V5.0 Series Roadmap

| Part | Title | Focus |
|------|-------|-------|
| 01 | **This document** | QED at precision frontier, radiative decays, polarizabilities |
| 02 | Photon in QCD Media | Thermal photons, spectral functions, magnetic fields |
| 03 | Precision QED | $g-2$, $\alpha$, Lamb shift, hadronic contributions |
| 04 | Photon Structure | GPDs, TMDs, EIC tomography, photon PDFs |
| 05 | Photon-Photon Physics | $\gamma\gamma \to$ hadrons, light-by-light, LbL |
| 06 | BSM Photon | Dark photons, axion-photon, millicharged particles |
| 07 | Photon in Cosmology | CMB, reionization, 21cm, photon-axion conversion |
| 08 | Non-Perturbative Photon | Lattice QCD+QED, photon mass, confinement |
| 09 | One-Electron Photon | Complete worldline classification, kink dynamics |
| 10 | Synthesis | Unified photon ontology, all predictions |

---

### 9. References (V5.0 Foundation)

1. **Pion/Kaon V4.0 Parts 04, 05, 11, 13, 14** — Radiative decays, polarizabilities, rare decays, future facilities, synthesis
2. **PrimEx-II** — Gasparian et al., *Phys. Rev. C* **101**, 025204 (2020)
3. **COMPASS 2024** — *Phys. Rev. Lett.* **132**, 121901 (2024)
4. **Muon $g-2$** — Muon $g-2$ Collab., *Phys. Rev. Lett.* **131**, 161802 (2023); BMW *Nature* **593**, 51 (2021)
5. **$\alpha$ measurements** — Parker et al., *Science* **360**, 191 (2018); Morel et al., *Nature* **588**, 61 (2020)
6. **EIC Photon** — *Nucl. Phys. A* **1026**, 122447 (2022) — Yellow Report
7. **One-Electron Universe** — Wheeler, *Annals of Physics* **2**, 604 (1957); Gielerak, *J. Phys. A* **53**, 335301 (2020); Strassler, *Nucl. Phys. B* **385**, 145 (1992)

---

*End of Part 1 — Next: Photon in QCD Media (Thermal Photons, Spectral Functions, Strong B Fields)*