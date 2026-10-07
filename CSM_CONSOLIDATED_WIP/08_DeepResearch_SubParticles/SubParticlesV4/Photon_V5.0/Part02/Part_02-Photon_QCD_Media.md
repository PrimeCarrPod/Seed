# Photon Physics — V5.0 Deep Dive Series
## Part 2 of N — Photon in QCD Media: Thermal Photons, Spectral Functions, and Strong Magnetic Fields

---

### Abstract

This V5.0 installment develops the theory of photons propagating through QCD matter — the quark-gluon plasma (QGP) at finite temperature and the hadronic phase at finite density. We derive thermal photon production rates, the electromagnetic spectral function, and photon behavior in the extreme magnetic fields of heavy-ion collisions, connecting to the Pion/Kaon V4.0 finite-T/density and heavy-ion results.

---

### 1. Photon Production in QGP

#### 1.1 Thermal Photon Rate

The differential photon production rate per unit volume:

$$\frac{dR}{d^3k} = \frac{1}{(2\pi)^3} \frac{1}{2k_0} \frac{1}{e^{k_0/T} - 1} \left( -g_{\mu\nu} \right) \text{Im} \Pi^{\mu\nu}_{\text{em}}(k_0, \vec{k})$$

where $\Pi^{\mu\nu}_{\text{em}}$ is the electromagnetic current-current correlator.

#### 1.2 Leading Order Processes

At $\mathcal{O}(\alpha \alpha_s)$ in QGP ($T \gg T_c$):

| Process | Diagram | Rate Scaling |
|---------|---------|--------------|
| $q \bar{q} \to g \gamma$ | Compton | $\alpha \alpha_s T^2 e^{-k/T}$ |
| $q g \to q \gamma$ | Annihilation | $\alpha \alpha_s T^2 e^{-k/T}$ |
| $q \bar{q} \to \gamma$ | $t$-channel | $\alpha \alpha_s T^2$ (collinear) |

Total LO rate:
$$\frac{dR}{d^3k} \approx \frac{5 \alpha \alpha_s}{9\pi^2} T^2 e^{-k/T} \ln \frac{2.912 k}{g^2 T} \quad (k \gg T)$$

#### 1.3 Next-to-Leading Order

NLO corrections (Arnold, Moore, Yaffe 2001; Ghiglieri et al. 2013):
- Collinear Bremsstrahlung: $q \to q \gamma$ (LPM effect)
- $q \bar{q}$ annihilation with gluon exchange
- Quasi-particle damping rates

NLO rate:
$$\frac{dR}{d^3k} = \frac{dR^{\text{LO}}}{d^3k} \left[ 1 + \frac{\alpha_s}{\pi} \left( C_F \ln \frac{k}{gT} + C_A \ln \frac{T}{m_D} + \cdots \right) \right]$$

where $m_D \sim gT$ is the Debye mass.

#### 1.4 Resummation: LPM Effect

Landau-Pomeranchuk-Migdal suppression for $k \sim T$:
- Formation time $\tau_f \sim k / k_\perp^2$
- Multiple scatterings $\to$ destructive interference
- Rate suppressed by $\sim \sqrt{\alpha_s}$ for $k \lesssim T$

---

### 2. Electromagnetic Spectral Function

#### 2.1 Definition and Sum Rules

$$\rho_{\text{em}}(\omega, \vec{k}) = -\frac{1}{\pi} \text{Im} \Pi_{\text{em}}(\omega, \vec{k})$$

Sum rules:
$$\int_0^\infty d\omega \, \omega \rho_{\text{em}}(\omega) = \frac{\pi}{2} \langle T_{00} \rangle \quad \text{(energy sum rule)}$$
$$\int_0^\infty d\omega \, \rho_{\text{em}}(\omega) = \frac{1}{2} \langle J^0_{\text{em}} J^0_{\text{em}} \rangle \quad \text{(charge sum rule)}$$

#### 2.2 Vector Meson Dominance (VMD)

At $T=0$:
$$\rho_{\text{em}}(\omega) = \frac{1}{\pi} \sum_V \frac{M_V^4}{g_V^2} \frac{\Gamma_V \omega}{(M_V^2 - \omega^2)^2 + M_V^2 \Gamma_V^2}$$

Peaks: $\rho(770)$, $\omega(782)$, $\phi(1020)$.

#### 2.3 In-Medium Spectral Function

At $T > 0$, $\mu_B > 0$:

$$\rho_{\text{em}}(\omega, \vec{k}; T, \mu_B) = \frac{1}{\pi} \text{Im} \Pi_{\text{em}}(\omega, \vec{k}; T, \mu_B)$$

**Key medium effects:**
- **Broadening**: $\Gamma_V(T) = \Gamma_V(0) + \Delta\Gamma_{\text{coll}}(T)$
- **Mass shift**: $M_V^*(T) = M_V + \Delta M_V(T)$
- **Landau damping**: $\omega < |\vec{k}|$ continuum

From Pion/Kaon V4.0 Part 05: NA60 measured $\rho$ broadening, no mass shift.

#### 2.4 Lattice QCD Spectral Reconstruction

Euclidean correlator:
$$G(\tau, \vec{k}) = \int_0^\infty d\omega \, \rho(\omega, \vec{k}) \frac{\cosh[\omega(\tau - 1/2T)]}{\sinh(\omega/2T)}$$

Inversion (MEM, Bayesian):
- HotQCD 2024: $\rho(\omega)$ at $T = 1.1-3 T_c$
- $M_\rho^*/M_\rho \approx 0.95-1.0$ (small shift)
- $\Gamma_\rho^*/\Gamma_\rho \approx 2-5$ (significant broadening)

---

### 3. Dilepton Production

#### 3.1 Rate from Spectral Function

$$\frac{dN_{ll}}{d^4x d^4q} = \frac{\alpha^2}{\pi^3 M^2} \frac{1}{e^{q_0/T} - 1} \rho_{\text{em}}(M, \vec{q})$$

where $M = \sqrt{q_0^2 - \vec{q}^2}$.

#### 3.2 Mass Regions

| Region | $M$ (GeV) | Dominant Physics |
|--------|-----------|------------------|
| **Low** | $0.3-0.7$ | $\rho, \omega, \phi$ peaks, chiral restoration |
| **Intermediate** | $1.0-1.5$ | $4\pi$ continuum, $a_1$ axial vector |
| **High** | $>1.5$ | $q\bar{q}$ annihilation, QGP radiation |

#### 3.3 Experimental Measurements

| Experiment | System | $\sqrt{s_{NN}}$ | Key Result |
|------------|--------|-----------------|------------|
| NA60 | In-In | 158 GeV | $\rho$ broadening, no mass shift |
| STAR | Au-Au | 200 GeV | Excess at $M<0.6$ GeV |
| PHENIX | Au-Au | 200 GeV | Direct photons $p_T > 1$ GeV |
| ALICE | Pb-Pb | 2.76 TeV | $v_2$ of direct photons |

---

### 4. Photon in Strong Magnetic Fields

#### 4.1 Magnetic Fields in Heavy-Ion Collisions

From Pion/Kaon V4.0 Part 05:
- Non-central collisions: $e B \sim m_\pi^2 \sim 10^{15}$ T
- $B_y$ direction (out-of-plane)
- Lifetime $\tau_B \sim 0.1-1$ fm/c

#### 4.2 Photon Birefringence

In external $B$ field, photon splits into two polarizations:
- $\parallel$: polarization $\parallel \vec{B}$
- $\perp$: polarization $\perp \vec{B}$

Dispersion relations:
$$\omega_\parallel^2 = k^2 + \Pi_\parallel(k, B)$$
$$\omega_\perp^2 = k^2 + \Pi_\perp(k, B)$$

Vacuum polarization (Euler-Heisenberg):
$$\Pi_\parallel - \Pi_\perp \propto \alpha^2 B^2 / m_e^4$$

#### 4.3 Chiral Magnetic Effect (CME) Photon

From Pion/Kaon V4.0 Part 05: CME = charge separation along $\vec{B}$.

Photon signature:
- Circular polarization asymmetry
- $A_{\text{circ}} \propto \vec{B} \cdot \vec{\nabla} \times \vec{J}_{\text{em}}$

STAR isobar 2024: $1-2\sigma$ signal.

#### 4.4 $\pi^0 \to \gamma\gamma$ in $B$ Field

Magnetic field modifies decay:
$$\Gamma(\pi^0 \to \gamma\gamma; B) = \Gamma_0 \left[ 1 + \frac{\alpha}{\pi} \frac{e B}{M_{\pi^0}^2} f(\omega) + \cdots \right]$$

Testable at NA60+, future fixed-target.

---

### 5. Photon in Hadronic Phase

#### 5.1 Hadronic Gas Photon Rate

Below $T_c$, hadronic degrees of freedom:
- $\pi \pi \to \rho \gamma$
- $\pi \rho \to \pi \gamma$
- $\pi \pi \to \eta \gamma$
- $\omega \to \pi \gamma$

Rate (Rapp, Wambach 2000):
$$\frac{dR}{d^3k} \sim \alpha \alpha_{\text{had}} T^2 e^{-k/T}$$

#### 5.2 Chiral Restoration Effects

Near $T_c$: $m_\rho^* \to m_{a_1}^*$, $\rho$-$a_1$ mixing.
- $\rho$ spectral function broadens
- $\omega$ peak suppressed
- Low-mass dilepton enhancement

#### 5.3 Hydrodynamic Integration

Total photon yield:
$$\frac{dN_\gamma}{d^2p_T dy} = \int d^4x \, \frac{dR}{d^3k}(T(x), \mu_B(x), \vec{v}(x)) \cdot u^\mu k_\mu$$

Viscous hydro + photon rates $\to$ direct photon $p_T$ spectra, $v_2$.

---

### 6. One-Electron Universe: Photon in Medium

In the one-electron universe, the medium modifies the worldline's EM field.

#### 6.1 Worldline in Thermal Bath

Worldline path integral with periodic imaginary time:
$$\mathcal{W}: \tau \in [0, \beta], \quad \beta = 1/T$$

Thermal photons = worldline kinks with Matsubara frequencies $\omega_n = 2\pi n T$.

#### 6.2 Worldline in Magnetic Field

External $B$ field = worldline coupling to EM background:
$$S_{\text{EM}} = i e \int d\tau \, \dot{x}^\mu A_\mu^{\text{ext}}(x)$$

Landau levels = worldline orbits in $B$ field:
$$E_n = \sqrt{k_z^2 + 2 n e B + m^2}$$

#### 6.3 Spectral Function = Worldline Correlation

$$\rho_{\text{em}}(\omega) \sim \int d\tau \, e^{i\omega\tau} \langle \mathcal{O}_{\text{EM}}(\tau) \mathcal{O}_{\text{EM}}(0) \rangle_{\text{worldline}}$$

Medium effects = worldline interactions with other worldlines (QCD strings).

---

### 7. References

1. **Thermal Photons**: Arnold, Moore, Yaffe, *JHEP* **2001**, 030; Ghiglieri et al., *JHEP* **2013**, 131
2. **Spectral Functions**: Rapp & Wambach, *Adv. Nucl. Phys.* **25**, 1 (2000); HotQCD, *Phys. Rev. D* **109**, 054512 (2024)
3. **Dileptons**: NA60, *Phys. Rev. Lett.* **96**, 162302 (2006); STAR, *Phys. Rev. C* **103**, 024904 (2021)
4. **Magnetic Fields**: Kharzeev, McLerran, Warringa, *Nucl. Phys. A* **803**, 227 (2008); STAR, *Phys. Rev. Lett.* **132**, 052301 (2024)
5. **Photon $v_2$**: ALICE, *Phys. Lett. B* **830**, 137134 (2022)
6. **One-Electron Medium**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 2 — Next: Precision QED Tests ($g-2$, $\alpha$, Lamb Shift, Hadronic Contributions)*