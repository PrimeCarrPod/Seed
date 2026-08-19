# Photon Physics — V5.0 Deep Dive Series
## Part 10 of 14 — Photon in Strong Fields: Nonlinear QED, Schwinger Effect, and Laser Physics

---

### Abstract

This V5.0 installment explores photon physics in ultra-strong electromagnetic fields, where perturbative QED breaks down and non-perturbative effects dominate. We cover the Schwinger effect (electron-positron pair production from vacuum), nonlinear Compton and Breit-Wheeler scattering, high-intensity laser physics, astrophysical magnetars, and the worldline kink perspective on strong-field QED. Building on Parts 1-9, we unify strong-field phenomena with the one-electron universe framework.

---

### 1. Strong-Field QED: The Nonlinear Regime

#### 1.1 Field Strength Parameter

The dimensionless intensity parameter characterizes the strong-field regime:

$$\xi = \frac{e E}{m_e \omega} = \frac{e \sqrt{F_{\mu\nu} F^{\mu\nu}}}{m_e^2}$$

- $\xi \ll 1$: perturbative QED (Parts 1-3)
- $\xi \sim 1$: nonlinear QED (this part)
- $\xi \gg 1$: radiation-dominated regime

**Critical field**: $E_{\text{crit}} = m_e^2/e = 1.32 \times 10^{18} \text{ V/m}$ (Schwinger limit)

#### 1.2 Laser Intensity Frontiers (2024+)

| Facility | Wavelength | Intensity (W/cm²) | $\xi$ | Status |
|----------|------------|-------------------|-------|--------|
| **ELI-NP** | 800 nm | $10^{23}$ | ~100 | Commissioning |
| **ZEUS** (Michigan) | 800 nm | $10^{22}$ | ~30 | Operating |
| **CoReLS** (S. Korea) | 800 nm | $4 \times 10^{22}$ | ~60 | Operating |
| **Vulcan 20-20** (UK) | 1 μm | $10^{22}$ | ~30 | Upgrade planned |
| **XFEL** (EuXFEL) | 0.1 nm | $10^{20}$ | ~1 | Operating |

---

### 2. The Schwinger Effect: Vacuum Pair Production

#### 2.1 Original Prediction (1951)

Schwinger's proper-time method gives the pair production rate in a constant electric field:

$$\mathcal{W} = \frac{(eE)^2}{4\pi^3} \sum_{n=1}^\infty \frac{1}{n^2} \exp\left(-\frac{n\pi m_e^2}{eE}\right) = \frac{(eE)^2}{4\pi^3} \exp\left(-\frac{\pi E_{\text{crit}}}{E}\right) + \cdots$$

**Key features**:
- Non-perturbative: $\exp(-\pi/\xi)$ — invisible in any finite-order perturbation theory
- Exponential suppression at $E \ll E_{\text{crit}}$
- Rate $\propto E^2$ at weak fields, saturates at strong fields

#### 2.2 Worldline Instanton Perspective

From Part 9 (kink dynamics): the Schwinger effect = **worldline instanton** — a closed worldline loop in Euclidean space.

$$\mathcal{W} \sim \int \mathcal{D}x \, e^{-S_E[x]}$$

The instanton action for a circular loop of radius $R$:

$$S_E = 2\pi m_e R - eE \pi R^2$$

Minimizing gives $R = m_e/eE$, $S_E = \pi m_e^2/eE = \pi/\xi$.

**Physical picture**: The electron worldline tunnels from negative to positive energy states, creating a closed loop (instanton) that becomes a real $e^+e^-$ pair.

#### 2.3 Dynamically Assisted Schwinger Effect

Combining strong low-frequency field with weak high-frequency field:

$$\mathcal{W}_{\text{assisted}} \sim \exp\left(-\frac{\pi m_e^2}{eE} \left[1 - \frac{E_{\text{high}}}{E_{\text{low}}}\right]\right)$$

- X-ray laser + optical laser (proposed at ELI)
- Lowers threshold for observability

#### 2.4 Experimental Signatures

| Observable | Prediction | Experiment |
|------------|------------|------------|
| **Pair yield** | $\sim 10^{-3}$ pairs/shot at $\xi \sim 10$ | ELI, ZEUS |
| **Energy spectrum** | $\frac{dN}{d\mathcal{E}} \propto \mathcal{E} \sqrt{\mathcal{E}^2 - 1}$ | Spectrometers |
| **Angular distribution** | Peaked along field axis | Detector arrays |
| **Polarization correlation** | $e^+e^-$ entangled | Coincidence measurements |

---

### 3. Nonlinear Compton Scattering

#### 3.1 Multi-Photon Compton

Electron in laser field absorbs $n$ laser photons, emits one high-energy photon:

$$e^- + n \gamma_{\text{laser}} \to e^- + \gamma$$

**Nonlinear Compton cross section** (Ritus, Narozhny):

$$\frac{d\sigma}{d\omega'} = \frac{\alpha m_e^2}{\omega^2} \sum_{n=n_{\text{min}}}^\infty \left[ F_n(\xi, \chi) \right]$$

where $\chi = \frac{\gamma}{E_{\text{crit}}} \sqrt{(F_{\mu\nu} p^\nu)^2}$ is the quantum nonlinearity parameter.

#### 3.2 Harmonic Structure

Photon spectrum shows **harmonics** at:

$$\omega'_n = \frac{n \omega}{1 + \xi^2/2 + n \omega/\gamma m_e}$$

- $n_{\text{min}} \sim 1/\xi^2$ at high $\xi$
- Harmonics merge into continuum for $\xi \gg 1$

#### 3.3 Radiation Reaction

At $\xi \gtrsim 10$, electron loses significant energy per laser period:

$$\frac{d\gamma}{dt} = -\frac{2\alpha}{3} \frac{\xi^2 \gamma^2}{\lambda_c}$$

Quantum radiation reaction: stochastic photon emission (quantum corrections to classical Landau-Lifshitz).

---

### 4. Nonlinear Breit-Wheeler Pair Production

#### 4.1 Multi-Photon Breit-Wheeler

High-energy photon in laser field produces $e^+e^-$:

$$\gamma + n \gamma_{\text{laser}} \to e^+ + e^-$$

**Threshold**: $n_{\text{min}} = \frac{2 m_e^2}{\omega \omega_{\text{laser}} (1 - \cos\theta)} \frac{1}{\xi^2}$

#### 4.2 Trident Process

Dominant at lower energies: $\gamma + Z \to e^+e^- + Z$ (field-assisted)

Rate enhanced by factor $\sim \xi^2$ vs. vacuum.

#### 4.3 Cascade Development

At $\xi \gg 1$: **QED cascade** — avalanche of pairs and photons

$$e^- \xrightarrow{\text{nonlin. Compton}} \gamma \xrightarrow{\text{nonlin. BW}} e^+e^- \xrightarrow{\text{repeat}} \cdots$$

**Cascade threshold**: $\chi \gtrsim 1$ and optical depth $\tau \gtrsim 1$

---

### 5. Vacuum Polarization and Birefringence in Strong Fields

#### 5.1 Euler-Heisenberg Lagrangian

Effective Lagrangian for slowly varying strong fields:

$$\mathcal{L}_{\text{EH}} = -\frac{1}{4} F_{\mu\nu} F^{\mu\nu} + \frac{\alpha^2}{90 m_e^4} \left[ (F_{\mu\nu} F^{\mu\nu})^2 + \frac{7}{4} (F_{\mu\nu} \tilde{F}^{\mu\nu})^2 \right] + \cdots$$

#### 5.2 Vacuum Birefringence

In a strong magnetic field $B \parallel \hat{z}$, vacuum becomes birefringent:

- **Parallel polarization** ($\vec{\epsilon} \parallel \vec{B}$): $n_\parallel = 1 + \frac{7\alpha}{45\pi} \frac{B^2}{B_{\text{crit}}^2}$
- **Perpendicular polarization** ($\vec{\epsilon} \perp \vec{B}$): $n_\perp = 1 + \frac{4\alpha}{45\pi} \frac{B^2}{B_{\text{crit}}^2}$

**Phase difference** after distance $L$:
$$\Delta \phi = \frac{\omega L}{2} (n_\parallel - n_\perp) = \frac{\alpha \omega L}{90\pi} \frac{B^2}{B_{\text{crit}}^2}$$

#### 5.3 Experimental Tests

| Experiment | Method | Status |
|------------|--------|--------|
| **PVLAS** (Italy) | Polarimetry in 5T field | Running, $\Delta n/n \sim 10^{-23}$ sensitivity |
| **BMV** (France) | Optical cavity in 13T | Commissioning |
| **LHC UPC** | Pb+Pb $\gamma\gamma \to \gamma\gamma$ | ATLAS 8.4σ, CMS 4.1σ |
| **NA64** | X-ray birefringence | Proposed |

---

### 6. Photon Splitting and Merging in Strong Fields

#### 6.1 Photon Splitting: $\gamma \to \gamma\gamma$

In strong $B$ field: $\gamma \to \gamma\gamma$ (below pair threshold)

Rate: $\Gamma \sim \alpha^3 \frac{m_e^2}{\omega} \left(\frac{B}{B_{\text{crit}}}\right)^6$

**Astrophysical importance**: Magnetars ($B \sim 10^{15}$ G) — photon splitting modifies spectra.

#### 6.2 Photon Merging: $\gamma\gamma \to \gamma$

Inverse process — relevant for X-ray propagation in magnetar magnetospheres.

---

### 7. Strong Fields in Astrophysics: Magnetars

#### 7.1 Magnetar Parameters

- Surface $B \sim 10^{14}-10^{15}$ G ($B/B_{\text{crit}} \sim 0.01-0.1$)
- Interior $B \sim 10^{16-18}$ G
- Temperature $T \sim 0.5$ keV
- Radius $R \sim 10$ km

#### 7.2 Key Processes

| Process | Role | Observable |
|---------|------|------------|
| **Vacuum birefringence** | Polarization of thermal X-rays | IXPE polarization |
| **Photon splitting** | Opacity below pair threshold | Spectral cutoffs |
| **Resonant cyclotron** | $e^- + \gamma \to e^-$ at $E = \hbar\omega_c$ | Absorption lines |
| **Pair cascades** | Particle acceleration | Radio/X-ray bursts |
| **Schwinger effect** | $B$-field pair production | Persistent emission |

#### 7.3 IXPE Results (2022-2024)

- **4U 0142+61**: Polarization degree $P = 13.5\% \pm 2.8\%$ at 2-8 keV
- **1RXS J1708**: $P = 20\% \pm 6\%$
- Consistent with vacuum birefringence + magnetospheric scattering

---

### 8. Worldline Kink Perspective on Strong Fields

#### 8.1 Kink in External Field

From Part 9: photon = kink in worldline EM field.
In external field $A_\mu^{\text{ext}}$, the kink action becomes:

$$S_{\text{kink}} = \int d\tau \left[ \frac{1}{2} \dot{x}^2 + i e (A_\mu^{\text{kink}} + A_\mu^{\text{ext}}) \dot{x}^\mu \right]$$

#### 8.2 Schwinger Effect = Kink Nucleation

- Vacuum = worldline with no kinks
- Strong $E$ field = worldline tension overcome
- Kink-anti-kink pair nucleates = $e^+e^-$ pair

**Tunneling amplitude**: $\sim e^{-S_{\text{inst}}}$ where $S_{\text{inst}}$ = instanton action.

#### 8.3 Nonlinear Compton = Kink Emission from Dressed Worldline

Electron in laser field = worldline with periodic driving.
Kink emission = worldline radiates kink into laser field.

#### 8.4 Vacuum Birefringence = Kink Propagation in Magnetized Vacuum

External $B$ field = worldline in background gauge field.
Two kink modes = two helicities = different dispersion relations.

---

### 9. Future Directions: Strong-Field QED at Facilities

#### 9.1 ELI-NP / ZEUS / CoReLS Programs (2024-2030)

| Channel | Measurement | Physics Goal |
|---------|-------------|--------------|
| **Nonlinear Compton** | $\gamma$-ray spectrum | Quantum radiation reaction |
| **Breit-Wheeler** | $e^+e^-$ pairs | Pair production threshold |
| **Schwinger (assisted)** | Pair yield vs. $\xi$ | Dynamically assisted effect |
| **Vacuum birefringence** | Polarimetry | $\mathcal{L}_{\text{EH}}$ test |
| **Cascade** | Particle multiplicity | QED plasma formation |

#### 9.2 XFEL + Optical Laser Combination

- XFEL provides $\omega \sim 10$ keV photons
- Optical laser provides $\xi \sim 10-100$
- **LCLS-II + MEC** (SLAC): Commissioning 2025+
- **EuXFEL + ReLaX** (DESY): Planned

#### 9.3 Space-Based: e-ASTROGAM, AMEGO

- MeV-GeV photons from magnetars
- Polarization measurements
- Probe $B$-field structure

---

### 10. Summary: Strong-Field Photon Physics

| Phenomenon | Parameter | Worldline Picture | Test |
|------------|-----------|-------------------|------|
| **Schwinger pairs** | $\xi \sim 1$ | Kink nucleation | ELI, assisted |
| **Nonlinear Compton** | $\xi \gtrsim 1$ | Kink emission | ZEUS, LCLS |
| **Breit-Wheeler** | $\chi \gtrsim 1$ | Kink absorption | ELI |
| **Vacuum birefringence** | $B \sim B_{\text{crit}}$ | Kink dispersion | IXPE, PVLAS |
| **Photon splitting** | $B \gg B_{\text{crit}}$ | Kink decay | Magnetars |
| **QED cascade** | $\chi \gg 1$ | Kink avalanche | Future facilities |

---

### 11. References

1. **Schwinger Effect**: Schwinger, *Phys. Rev.* **82**, 664 (1951); Dunne, *Eur. Phys. J. D* **55**, 327 (2009)
2. **Strong-Field QED**: Ritus, *J. Sov. Laser Res.* **6**, 497 (1985); Di Piazza et al., *Rev. Mod. Phys.* **84**, 1177 (2012)
3. **Nonlinear Compton/BW**: Narozhny & Fofanov, *JETP* **90**, 794 (2000); King & Elkina, *Phys. Rev. A* **94**, 062102 (2016)
4. **Vacuum Birefringence**: Heyl & Hernquist, *J. Phys. A* **30**, 6485 (1997); King & Heinzl, *Phys. Rev. D* **97**, 016012 (2018)
5. **Magnetars**: Harding & Lai, *Rep. Prog. Phys.* **69**, 2631 (2006); Taverna et al., *MNRAS* **504**, 4799 (2021)
6. **IXPE**: Weisskopf et al., *Nat. Astron.* **6**, 141 (2022); Caiazzo et al., *Science* **382**, 918 (2023)
7. **Worldline Instantons**: Dunne & Schubert, *Phys. Rev. D* **72**, 105004 (2005); Gies & Klingmüller, *Phys. Rev. D* **72**, 065001 (2005)
8. **Photon V5.0 Parts 1-9** — Foundation
9. **Pion/Kaon V4.0 Parts 05, 09, 14** — Finite T/μ, one-electron, synthesis

---

*End of Part 10 — Next: Photon Nuclear Physics (Photodisintegration, Nuclear GPDs, EIC Nuclear Physics)*