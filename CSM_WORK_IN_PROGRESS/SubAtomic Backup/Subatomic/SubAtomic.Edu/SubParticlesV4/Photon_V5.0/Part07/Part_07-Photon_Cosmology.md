# Photon Physics — V5.0 Deep Dive Series
## Part 7 of N — Photon in Cosmology: CMB, Reionization, 21cm Line, and Photon-Axion Conversion

---

### Abstract

This V5.0 installment explores the photon's role across cosmic history: from the cosmic microwave background (CMB) through the dark ages, reionization, and into the 21cm line era. We develop the photon's cosmological propagation, its interactions with matter and dark sectors, and the photon-axion conversion mechanism that could explain observed anomalies.

---

### 1. Cosmic Microwave Background (CMB)

#### 1.1 CMB as a Photon Bath

The CMB is a near-perfect blackbody at $T_0 = 2.72548 \pm 0.00057$ K.
- Energy density: $\rho_\gamma = \frac{\pi^2}{15} T_0^4 = 0.260 \text{ eV/cm}^3$
- Number density: $n_\gamma = \frac{2\zeta(3)}{\pi^2} T_0^3 = 410 \text{ cm}^{-3}$
- Photon-to-baryon ratio: $\eta = n_b/n_\gamma \approx 6 \times 10^{-10}$

#### 1.2 CMB Anisotropies and Photon Physics

Temperature anisotropies $\Delta T/T \sim 10^{-5}$:
- **Sachs-Wolfe**: $\Delta T/T = \frac{1}{3} \Phi$ (potential at last scattering)
- **Doppler**: $\Delta T/T = \vec{v} \cdot \hat{n}$ (velocity at last scattering)
- **Integrated Sachs-Wolfe**: $\Delta T/T = 2 \int \dot{\Phi} dt$ (late-time potential decay)

Photon diffusion (Silk damping):
$$k_D^{-1} \approx \sqrt{\frac{1}{6} \int \frac{c_s^2}{n_e \sigma_T a} dt} \sim 10 \text{ Mpc}$$

#### 1.3 CMB Polarization

E-modes (scalar): density fluctuations $\to$ quadrupole $\to$ polarization.
B-modes (tensor): primordial gravitational waves $\to$ curl component.

**Reionization bump**: $\ell \sim 2-10$, optical depth $\tau \approx 0.054$.

#### 1.4 Spectral Distortions

COBE/FIRAS: $\mu < 9 \times 10^{-5}$, $y < 1.5 \times 10^{-5}$.

**$\mu$-distortion**: early energy injection ($z \sim 10^5-2 \times 10^6$).
**$y$-distortion**: late energy injection ($z < 10^4$), SZ effect.

Future: PIXIE, SuperPIXIE $\to$ $\mu \sim 10^{-8}$.

---

### 2. The Dark Ages ($z \sim 30-1000$)

#### 2.1 Photon-Matter Interaction

After recombination ($z \approx 1100$):
- Universe neutral: $x_e \sim 10^{-4}$
- Photons free-stream with rare scattering
- 21cm line from neutral hydrogen

#### 2.2 21cm Line Physics

Hyperfine splitting of hydrogen ground state:
$$\Delta E = 5.874 \times 10^{-6} \text{ eV} \quad (\lambda = 21.1 \text{ cm}, \nu = 1420 \text{ MHz})$$

Spin temperature $T_s$:
$$\frac{n_1}{n_0} = 3 e^{-T_*/T_s}, \quad T_* = 0.068 \text{ K}$$

Brightness temperature:
$$\delta T_b \approx 27 \text{ mK} \left( \frac{1+z}{10} \right)^{1/2} \left( 1 - \frac{T_\gamma}{T_s} \right)$$

**Epochs**:
- **Dark Ages** ($z \sim 30-200$): $T_s \approx T_K < T_\gamma$ $\to$ absorption
- **Cosmic Dawn** ($z \sim 15-30$): Ly-$\alpha$ coupling $T_s \to T_K$ $\to$ strong absorption
- **Heating** ($z \sim 10-15$): X-rays heat $T_K > T_\gamma$ $\to$ emission
- **Reionization** ($z \sim 6-10$): $x_e \to 1$, signal disappears

#### 2.3 EDGES Anomaly

EDGES (2018): Absorption at $z \sim 17$, depth $\sim 500$ mK.
Standard prediction: $\sim 200$ mK.
**Possible explanations**: Exotic cooling (dark matter-baryon scattering), excess radio background.

---

### 3. Reionization ($z \sim 6-10$)

#### 3.1 Photon Budget

Ionizing photons needed:
$$N_{\text{ion}} \approx \frac{n_b}{\bar{n}_\gamma} \approx 10^3 \text{ per baryon}$$

Sources:
- **Stars** (Pop II/III): $f_{\text{esc}} \sim 0.1-0.5$
- **AGN**: Subdominant at $z > 6$
- **Exotic**: Dark matter decay, PBH evaporation

#### 3.2 Photon Mean Free Path

$$\lambda_{\text{mfp}} = \frac{1}{n_{\text{HI}} \sigma_{\text{ion}}} \sim 10 \text{ Mpc} \left( \frac{1+z}{7} \right)^{-3} \left( \frac{x_{\text{HI}}}{0.1} \right)^{-1}$$

Ionization fronts: R-type (fast) $\to$ D-type (slow).

#### 3.3 CMB Optical Depth

$$\tau = \int n_e \sigma_T a dt \approx 0.054 \pm 0.007 \quad \text{(Planck 2018)}$$

Corresponds to $z_{\text{reion}} \approx 7.7 \pm 0.7$.

---

### 4. Photon-Axion Conversion

#### 4.1 Photon-ALP Mixing in Magnetic Fields

Lagrangian:
$$\mathcal{L} \supset -\frac{1}{4} F_{\mu\nu} F^{\mu\nu} + \frac{1}{2} \partial_\mu a \partial^\mu a - \frac{1}{2} m_a^2 a^2 + \frac{a}{f_a} \frac{\alpha}{2\pi} \mathbf{E} \cdot \mathbf{B}$$

In external $\vec{B}$ field, photon-ALP mixing matrix:
$$\mathcal{M} = \begin{pmatrix} \omega - \frac{\omega_{\text{pl}}^2}{2\omega} & \frac{B_\perp \omega}{2 f_a} \\ \frac{B_\perp \omega}{2 f_a} & \omega - \frac{m_a^2}{2\omega} \end{pmatrix}$$

#### 4.2 Conversion Probability

For constant $B$:
$$P_{\gamma \to a} = \frac{4 B_\perp^2 \omega^2}{f_a^2} \frac{\sin^2(\Delta_{\text{osc}} L/2)}{(\Delta_{\text{osc}}^2 + \Delta_{\text{pl}}^2)}$$

where $\Delta_{\text{osc}} = \frac{|m_a^2 - \omega_{\text{pl}}^2|}{2\omega}$, $\Delta_{\text{pl}} = \frac{\omega_{\text{pl}}^2}{2\omega}$.

#### 4.3 Cosmological Photon-ALP Conversion

**In galaxy clusters**: $B \sim \mu$G, $L \sim 10$ kpc.
- X-ray $\to$ ALP $\to$ X-ray: spectral distortions
- Chandra, XMM-Newton constraints: $f_a > 10^{12}$ GeV for $m_a \sim 10^{-12}$ eV

**In intergalactic space**: $B \sim 10^{-9}$ G, $L \sim$ Mpc.
- CMB $\to$ ALP $\to$ CMB: spectral distortions, polarization rotation
- $\Delta \alpha = \frac{1}{2} \int \frac{B_\perp^2}{f_a^2} dl$

#### 4.4 Resonant Conversion

When $m_a^2 = \omega_{\text{pl}}^2$:
- Resonant conversion at $z \sim 10^3-10^4$ for $m_a \sim 10^{-14}-10^{-12}$ eV
- CMB spectral distortion: $\mu$-distortion from photon loss
- PIXIE sensitivity: $m_a \sim 10^{-14}$ eV, $f_a \sim 10^{11}$ GeV

---

### 5. Photon Propagation in Cosmological Magnetic Fields

#### 5.1 Faraday Rotation

$$\Delta \alpha = \frac{3}{16\pi^2} \frac{e^3}{m_e^2} \int n_e \vec{B} \cdot d\vec{l} \frac{1}{\omega^2}$$

RM (Rotation Measure) = $\frac{\Delta \alpha}{\lambda^2}$.

#### 5.2 Cosmic Birefringence

ALP-induced rotation:
$$\Delta \alpha = \frac{1}{2} \int \frac{B_\perp^2}{f_a^2} dl$$

Planck 2018: $\alpha = 0.30 \pm 0.11$ deg (isotropic rotation).
Possible ALP signal? Or systematics?

#### 5.2 Photon Dispersion in Magnetized Plasma

Magnetized plasma dispersion:
$$\omega^2 = k^2 + \omega_{\text{pl}}^2 \pm \omega \omega_B$$

where $\omega_B = e B / m_e$ (cyclotron frequency).
Splits photon into O and X modes.

---

### 6. Photon and Dark Matter

#### 6.1 Dark Photon Dark Matter

For $m_{A'} \sim 10^{-14}-10^{-6}$ eV:
- $A'$ acts as classical field oscillating at $\omega = m_{A'}$
- Converts to photons in magnetic fields
- ADMX, HAYSTAC, ABRACADABRA searches

#### 6.2 Axion Dark Matter

$$a(t) = a_0 \cos(m_a t)$$

Photon-axion conversion in lab $B$ fields:
- ADMX: microwave cavity, $m_a \sim 1-10$ $\mu$eV
- HAYSTAC: $m_a \sim 20-50$ $\mu$eV
- ABRACADABRA: $m_a \sim 0.1-1$ $\mu$eV
- IAXO: solar axions, $m_a \sim 1$ meV

#### 6.3 Dark Matter-Photon Scattering

Millicharged DM:
$$\sigma_{\chi\gamma} \approx \frac{8\pi \alpha^2 \epsilon^2}{m_\chi^2}$$

CMB constraints: $\epsilon < 10^{-6}$ for $m_\chi \sim 1$ MeV.

---

### 7. 21cm Cosmology and Photon Physics

#### 7.1 Global 21cm Signal

From Pion/Kaon V4.0 Part 13: EDGES, SARAS, HERA, SKA.

Signal chain:
1. CMB photons at $z \sim 1000$
2. Ly-$\alpha$ photons couple $T_s$ to $T_K$ (Wouthuysen-Field)
3. X-ray photons heat IGM
4. UV photons reionize
5. 21cm photons observed

#### 7.2 21cm Tomography

Power spectrum:
$$P_{21}(k) = \bar{T}_b^2 \left[ P_{\delta\delta} + \mu^2 P_{\delta v} + \mu^4 P_{vv} \right]$$

Probes: matter power spectrum, neutrino mass, primordial non-Gaussianity.

#### 7.3 Exotic 21cm Physics

- Dark matter-baryon scattering $\to$ enhanced cooling
- Dark photon heating
- ALP-photon conversion $\to$ spectral features
- Primordial black hole accretion $\to$ heating

---

### 8. One-Electron Universe: Cosmological Photon

In the one-electron universe, cosmological photons = worldline kinks across cosmic time.

#### 8.1 CMB Photons = Primordial Worldline Kinks

CMB photons = kinks created at recombination ($z \sim 1100$).
Free-streaming = worldline kinks propagating through expanding space.
Anisotropies = worldline density fluctuations.

#### 8.2 21cm Photons = Worldline Spin-Flip

21cm = worldline spin-flip transition in hydrogen atom.
Worldline in hydrogen atom = electron bound to proton.
Spin-flip = worldline topology change.

#### 8.3 Photon-Axion Conversion = Worldline Sector Hopping

$\gamma \leftrightarrow a$ = worldline kink hopping to ALP sector.
Magnetic field = bridge between EM and ALP worldline sectors.
Resonant conversion = worldline resonance between sectors.

#### 8.4 Reionization = Worldline Ionization Fronts

Reionization = worldline kinks ionizing neutral hydrogen.
Ionization fronts = worldline branches creating free electrons.
Optical depth $\tau$ = total worldline scattering probability.

---

### 9. Future Cosmological Photon Probes

| Probe | Target | Timeline |
|-------|--------|----------|
| **CMB-S4** | $\mu$-distortion, B-modes | 2030+ |
| **PIXIE** | $\mu \sim 10^{-8}$ | Proposed |
| **SKA** | 21cm tomography | 2028+ |
| **HERA** | 21cm power spectrum | 2024+ |
| **IAXO** | Solar axions | 2028+ |
| **ABRACADABRA** | $m_a \sim 10^{-10}$ eV | 2024+ |
| **MATHUSLA** | Long-lived $A'$ | 2030+ |

---

### 10. References

1. **CMB**: Planck Collab., *Astron. Astrophys.* **641**, A1 (2020)
2. **21cm**: Pritchard & Loeb, *Rep. Prog. Phys.* **75**, 086901 (2012); EDGES, *Nature* **555**, 387 (2018)
3. **Reionization**: Robertson et al., *Astron. Astrophys.* **568**, A51 (2014)
4. **Photon-ALP**: Raffelt & Stodolsky, *Phys. Rev. D* **37**, 1237 (1988); Meyer et al., *Phys. Rev. Lett.* **114**, 021101 (2015)
5. **Cosmic Birefringence**: Minami & Komatsu, *Phys. Rev. Lett.* **125**, 041301 (2020)
6. **Dark Photon DM**: Sikivie, *Phys. Rev. Lett.* **51**, 1415 (1983); ADMX, *Phys. Rev. Lett.* **124**, 101303 (2020)
7. **One-Electron Cosmology**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 7 — Next: Non-Perturbative Photon Physics (Lattice QCD+QED, Photon Mass, Confinement)*