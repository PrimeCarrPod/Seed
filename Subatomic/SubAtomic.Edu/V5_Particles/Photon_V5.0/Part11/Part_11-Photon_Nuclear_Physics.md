# Photon Physics — V5.0 Deep Dive Series
## Part 11 of 14 — Photon Nuclear Physics: Photodisintegration, Nuclear GPDs, and the Photon-Nucleus Interface

---

### Abstract

This V5.0 installment explores photon interactions with atomic nuclei — from giant dipole resonance photodisintegration to deeply virtual Compton scattering on nuclei, nuclear generalized parton distributions (GPDs), and the photon as a probe of nuclear structure at the Electron-Ion Collider (EIC). We connect nuclear photon physics to the one-electron universe framework where nuclear binding arises from worldline topology.

---

### 1. Photon-Nucleus Interactions: Energy Scales

#### 1.1 Photon Energy Regimes

| Regime | Energy | Dominant Process | Nuclear Response |
|--------|--------|------------------|------------------|
| **Giant Dipole Resonance (GDR)** | 10-30 MeV | $\gamma + A \to (A-1) + N$ | Collective dipole oscillation |
| **Quasi-deuteron** | 30-150 MeV | $\gamma + pn \to pn$ | Short-range correlations |
| **Delta resonance** | 200-400 MeV | $\gamma + N \to \Delta \to \pi N$ | Pion production |
| **Deep inelastic** | $> 1$ GeV | $\gamma^* + N \to X$ | Parton distributions |
| **Coherent DVCS** | $> 5$ GeV | $\gamma^* + A \to \gamma + A$ | Nuclear GPDs |

#### 1.2 Photon Virtuality $Q^2$

- **Real photon** ($Q^2 = 0$): Total cross sections, photodisintegration
- **Virtual photon** ($Q^2 > 0$): Form factors, structure functions, GPDs
- **Coherent limit** ($|t| \ll 1/R_A^2$): Nucleus stays intact
- **Incoherent**: Nucleus breaks up

---

### 2. Giant Dipole Resonance (GDR)

#### 2.1 Classical Model (Goldhaber-Teller)

Protons and neutrons oscillate out of phase:
$$\omega_{\text{GDR}} = \sqrt{\frac{C}{m_{\text{red}}}} \approx 78 A^{-1/3} \text{ MeV}$$

#### 2.2 Cross Section

$$\sigma_{\gamma A}(\omega) = \sigma_0 \frac{\Gamma^2 \omega^2}{(\omega^2 - \omega_0^2)^2 + \Gamma^2 \omega^2}$$

| Nucleus | $\omega_0$ (MeV) | $\Gamma$ (MeV) | $\sigma_0$ (mb) |
|---------|------------------|----------------|-----------------|
| $^{12}$C | 22 | 5 | 20 |
| $^{56}$Fe | 17 | 4.5 | 150 |
| $^{208}$Pb | 13.5 | 4 | 500 |

#### 2.3 Photodisintegration Channels

| Reaction | Threshold | Branching |
|----------|-----------|-----------|
| $\gamma + A \to (A-1) + n$ | $S_n$ | ~50% |
| $\gamma + A \to (A-1) + p$ | $S_p$ | ~30% |
| $\gamma + A \to (A-2) + d/np$ | $S_{2N}$ | ~15% |
| $\gamma + A \to$ multifragment | $> 30$ MeV | Increases with E |

#### 2.4 Nuclear Resonance Fluorescence (NRF)

- Monoenergetic $\gamma$ beams (HI$\gamma$S, ELI-NP)
- Measure level schemes, $J^\pi$, branching ratios
- **Applications**: Nuclear astrophysics (r-process), stockpile stewardship

---

### 3. Quasi-Deuteron and Delta Resonance Regions

#### 3.1 Quasi-Deuteron Model (Levinger)

$$\sigma_{\gamma A}(\omega) = L \cdot \frac{NZ}{A} \cdot \sigma_{\gamma d}(\omega)$$

- $L \approx 6-8$ (Levinger constant)
- $\sigma_{\gamma d}$ = deuteron photodisintegration cross section
- Probes **short-range correlations (SRC)** in nuclei

#### 3.2 Delta Resonance Region

$$\gamma + N \to \Delta(1232) \to \pi + N$$

In nucleus: $\Delta$ propagation modified by Pauli blocking, collisions.
- **$\Delta$-hole model**: $\Delta$ as particle-hole excitation
- **Pion production**: $\gamma + A \to \pi + X$ — probes nuclear medium effects

---

### 4. Deep Inelastic Scattering on Nuclei

#### 4.1 Nuclear Structure Functions

$$F_2^A(x, Q^2) = \int_x^A \frac{dy}{y} f_N^A(y) F_2^N(x/y, Q^2) + \delta F_2^{\text{shadowing}}$$

**EMC effect** ($0.3 < x < 0.7$): $F_2^A / (A F_2^D) < 1$ — nuclear binding modifies parton distributions.

**Shadowing** ($x < 0.1$): $F_2^A / (A F_2^N) < 1$ — coherent multiple scattering.

**Anti-shadowing** ($0.1 < x < 0.3$): Slight enhancement.

**Fermi motion** ($x > 0.8$): High-$x$ tail from nucleon momentum distribution.

#### 4.2 nCTEQ / EPPS21 / TUJU21 Global Fits

| nPDF Set | Data | Nuclear Effects |
|----------|------|-----------------|
| **nCTEQ15** | DIS, DY, $\pi^0$ | Full $A$-dependence |
| **EPPS21** | + LHC p+Pb | Improved gluon shadowing |
| **TUJU21** | + $\nu$ DIS | Strange quark in nuclei |

#### 4.3 Photon-Induced DIS at EIC

$$\frac{d\sigma}{dx dQ^2} \propto \frac{2\pi\alpha^2}{x Q^4} \left[ (1+(1-y)^2) F_2^A - y^2 F_L^A \right]$$

**EIC capabilities**:
- $x \sim 10^{-4} - 1$, $Q^2 \sim 1-10^4$ GeV$^2$
- Nuclear beams: $p, d, ^3$He, $^4$He, $^{12}$C, $^{56}$Fe, $^{197}$Au, $^{208}$Pb
- Luminosity: $10^{33}-10^{34}$ cm$^{-2}$s$^{-1}$

---

### 5. Nuclear Generalized Parton Distributions (GPDs)

#### 5.1 Definition

Nuclear GPDs extend nucleon GPDs to nuclei:

$$H^A(x, \xi, t) = \int \frac{dz^-}{4\pi} e^{ixP^+z^-} \langle A, P' | \bar{\psi}(z^-) \gamma^+ \psi(0) | A, P \rangle$$

where $P = (P+P')/2$, $\Delta = P' - P$, $\xi = -\Delta^+/2P^+$.

#### 5.2 Nuclear GPD Properties

| Property | Nucleon | Nucleus |
|----------|---------|---------|
| **Support** | $x \in [-1,1]$ | $x \in [-A, A]$ |
| **Sum rules** | $\int H^q dx = q_v$ | $\int H^A dx = A q_v$ |
| **Form factors** | $F_1, F_2$ | $F_1^A, F_2^A$ |
| **D-term** | Mechanical properties | Nuclear pressure/shear |

#### 5.3 Coherent vs Incoherent DVCS on Nuclei

**Coherent** ($A \to A$):
- Amplitude $\propto A$ (enhanced)
- Measures nuclear GPDs
- $t$-dependence gives nuclear transverse size

**Incoherent** ($A \to X$):
- Probes nucleon GPDs in medium
- Fluctuations: $\langle H^2 \rangle - \langle H \rangle^2$
- Access to **nucleon GPD modifications** in nuclei

#### 5.4 Nuclear DVCS at EIC

**Golden channel**: $e + A \to e' + \gamma + A$ (coherent)

Kinematics:
- $Q^2 = 1-100$ GeV$^2$
- $x_B = 10^{-3} - 0.5$
- $|t| < 0.1$ GeV$^2$ (coherent)

**Observables**:
- Beam-spin asymmetry $A_{LU} \propto \text{Im} \mathcal{H}^A$
- Beam-charge asymmetry $A_C \propto \text{Re} \mathcal{H}^A$
- $t$-slope $\to$ nuclear radius $R_A$

---

### 6. Nuclear Tomography: 3D Imaging with Photons

#### 6.1 Transverse Spatial Distribution

Fourier transform of GPD in $t$:

$$\rho^A(x, \vec{b}_\perp) = \int \frac{d^2\Delta_\perp}{(2\pi)^2} e^{-i\vec{\Delta}_\perp \cdot \vec{b}_\perp} H^A(x, 0, -\vec{\Delta}_\perp^2)$$

**Nuclear radius**: $\langle b_\perp^2 \rangle = 4 \frac{d}{dt} \ln F_1^A(t)|_{t=0}$

#### 6.2 Mechanical Properties of Nuclei

From D-term:

$$\mathcal{D}^A(t) = \int dx \, D^A(x, t)$$

Pressure distribution:
$$p^A(r) = \frac{1}{6M_A r} \frac{d}{dr} r^2 \frac{d}{dr} \mathcal{D}^A(r)$$

Shear forces:
$$s^A(r) = -\frac{r}{2} \frac{d}{dr} \left( \frac{1}{r} \frac{d}{dr} \mathcal{D}^A(r) \right)$$

**V5.0 prediction**: Nuclear pressure has shell structure reflecting magic numbers.

#### 6.3 Wigner Distributions

Full 5D phase space:
$$W^A(x, \vec{b}_\perp, \vec{k}_\perp) = \int \frac{d^2\Delta_\perp}{(2\pi)^2} e^{-i\vec{\Delta}_\perp \cdot \vec{b}_\perp} H^A(x, \xi, t) \big|_{\xi=0}$$

---

### 7. Photonuclear Reactions for Astrophysics

#### 7.1 p-Process and r-Process

**$(\gamma, n)$, $(\gamma, p)$, $(\gamma, \alpha)$** rates determine:
- p-nuclei production in supernovae
- r-process freeze-out (photodisintegration of waiting-point nuclei)

**Key nuclei**: $^{92,94}$Mo, $^{96,98}$Ru, $^{102}$Pd, $^{113}$In, $^{115}$Sn, $^{138}$La, $^{180}$Ta

#### 7.2 Experimental Programs

| Facility | Method | Targets |
|----------|--------|---------|
| **HI$\gamma$S** (TUNL) | Monoenergetic $\gamma$ | $^{56}$Fe, $^{58}$Ni, $^{92}$Mo |
| **ELI-NP** | Laser-Compton $\gamma$ | $^{197}$Au, $^{208}$Pb, actinides |
| **n_TOF** (CERN) | Neutron-induced surrogate | Unstable nuclei |
| **JLab** | Tagged photons | $^4$He, $^{12}$C, $^{16}$O |

---

### 8. Coherent Photon-Nucleus Scattering

#### 8.1 Elastic $\gamma A \to \gamma A$

At low energy: Rayleigh scattering (polarizability)
At high energy: Delbrück scattering ($\gamma + Z \to \gamma + Z$ via $e^+e^-$ loop)

#### 8.2 Coherent $\pi^0$ Photoproduction

$$\gamma + A \to \pi^0 + A$$

Near threshold: probes chiral symmetry in nuclei.
At high energy: color transparency test — $\pi^0$ wave packet shrinks.

#### 8.3 Coherent $\rho^0$ Photoproduction

$$\gamma + A \to \rho^0 + A \to \pi^+\pi^- + A$$

**Color transparency**: $\sigma_{\gamma A} \propto A^{2/3}$ at high $Q^2$ (vs $A^{4/3}$)
- Tested at JLab 12 GeV, future EIC

---

### 9. Worldline Kink Perspective on Nuclear Photon Physics

#### 9.1 Nucleus as Worldline Bundle

From Part 9: photon = kink in worldline.
Nucleus = **bundle of worldlines** (nucleons) bound by color flux tubes.

- **Proton** = worldline with $uud$ color topology
- **Neutron** = worldline with $udd$ color topology
- **Nucleus** = $A$ worldlines with shared gluon flux

#### 9.2 GDR = Collective Worldline Oscillation

Protons and neutrons oscillate = two bundles moving out of phase.
- Dipole mode = relative displacement of proton/neutron worldline bundles
- Energy $\omega_{\text{GDR}} \propto A^{-1/3}$ = frequency of bundle oscillation

#### 9.3 Nuclear GPDs = Worldline Bundle Tomography

- Nuclear GPD $H^A$ = correlation of kink emissions from bundle
- $t$-dependence = transverse profile of bundle
- D-term = mechanical stress in bundle

#### 9.4 EMC Effect = Worldline Bundle Modification

Bound nucleon = worldline with modified topology due to shared flux.
- Parton distributions modified = worldline self-interaction changed by neighbors
- Shadowing = coherent kink emission from multiple worldlines

#### 9.5 Color Transparency = Worldline Kink Shrinkage

Small $q\bar{q}$ pair = compact kink-anti-kink configuration.
In nucleus: color screening = worldline bundle transparency to small configurations.

---

### 10. Future Directions: Nuclear Photon Physics at EIC and Beyond

#### 10.1 EIC Nuclear Program (2030+)

| Measurement | Beam | Goal |
|-------------|------|------|
| **Coherent DVCS** | $e + Au$ | Nuclear GPDs, 3D imaging |
| **Incoherent DVCS** | $e + Au$ | Nucleon GPDs in medium |
| **Tagged DIS** | $e + ^3$He/$^3$H | Neutron structure, SRC |
| **Diffractive $\rho$** | $e + Au$ | Color transparency, gluon saturation |
| **$\gamma^* A \to \pi^0 A$** | $e + Pb$ | Chiral symmetry in nuclei |

#### 10.2 Ultra-Peripheral Collisions (UPC) at LHC/Future

- Pb+Pb UPC $\to$ $\gamma\gamma \to$ lepton pairs, hadrons
- Photon flux $\propto Z^2$ — clean photon-photon collisions
- Nuclear GPDs via $\gamma A \to \gamma A$ in UPC

#### 10.3 High-Intensity $\gamma$ Beams

- ELI-NP: $\gamma$ up to 20 MeV, $10^8 \gamma$/s
- Gamma Factory (CERN): Partially stripped ions $\to$ MeV $\gamma$ beams
- FEL-based $\gamma$ sources: High flux, tunable

---

### 11. Summary: Photon-Nucleus Physics

| Process | Energy | Probe | Worldline Picture |
|---------|--------|-------|-------------------|
| **GDR** | 10-30 MeV | Collective dipole | Bundle oscillation |
| **Quasi-deuteron** | 30-150 MeV | SRC | Two-worldline correlation |
| **DIS/EMC** | $> 1$ GeV | nPDFs | Bundle-modified worldline |
| **Coherent DVCS** | $> 5$ GeV | Nuclear GPDs | Bundle tomography |
| **Color transparency** | $> 10$ GeV | Small $q\bar{q}$ | Compact kink transparency |

---

### 12. References

1. **GDR**: Berman & Fultz, *Rev. Mod. Phys.* **47**, 713 (1975); Goriely & Khan, *Nucl. Phys. A* **780**, 319 (2006)
2. **EMC/nPDFs**: Ethier et al., *Phys. Rev. D* **102**, 054015 (2020); Abdul Khalek et al., *Eur. Phys. J. C* **82**, 591 (2022)
3. **Nuclear GPDs**: Hatta et al., *Phys. Rev. D* **97**, 014021 (2018); Joosten et al., *Phys. Rev. C* **105**, 035201 (2022)
4. **EIC Nuclear**: Abdul Khalek et al., *Nucl. Phys. A* **1026**, 122447 (2022) — Yellow Report
5. **Color Transparency**: Brodsky et al., *Phys. Rev. D* **22**, 2157 (1980); Kuhn et al., *Phys. Rev. Lett.* **124**, 042301 (2020)
6. **Astrophysics**: Arnould & Goriely, *Prog. Part. Nucl. Phys.* **112**, 103766 (2020)
7. **Worldline Nuclear**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); **Photon V5.0 Parts 1-10**
8. **Pion/Kaon V4.0 Parts 06, 08, 13** — Strange baryons, lattice spectroscopy, future facilities

---

*End of Part 11 — Next: Precision Spectroscopy (Atomic Physics, Lamb Shift, Muonic Atoms, Photon Tests of QED)*