# Document 16: Seismic Wave Propagation & Microseismic Noise Fields
## Latitudinal Geophysical Effects Comparison - Deep Technical Expansion

---

**Document 16 of 17** | **Target: 900 lines**

---

### 16.1 Introduction: The Seismic Wavefield at Earth's Surface

The continuous seismic wavefield at Earth's surface comprises deterministic signals (earthquakes, explosions) and stochastic noise (microseisms, cultural). The character of this wavefield varies fundamentally with tectonic regime and geographic setting. Our comparative nodes - one on a subduction zone isthmus, the other on a transform boundary continental margin - sample dramatically different seismic environments.

### 16.2 Elastodynamic Wave Equation

**Equation of motion:**
$$\rho\frac{\partial^2 u_i}{\partial t^2} = \frac{\partial}{\partial x_j}\left[c_{ijkl}\frac{\partial u_k}{\partial x_l}\right] + f_i$$

**Isotropic medium (Lamé parameters):**
$$c_{ijkl} = \lambda\delta_{ij}\delta_{kl} + \mu(\delta_{ik}\delta_{jl} + \delta_{il}\delta_{jk})$$

**P-wave velocity:** $\alpha = \sqrt{(\lambda+2\mu)/\rho}$
**S-wave velocity:** $\beta = \sqrt{\mu/\rho}$

**Typical crustal values:**
- $\alpha \approx 5.5-6.5$ km/s
- $\beta \approx 3.2-3.8$ km/s
- $\rho \approx 2700$ kg/m³

### 16.3 Surface Waves: Rayleigh and Love

**Rayleigh waves:** Retrograde elliptical particle motion, $v_R \approx 0.92\beta$.
**Dispersion:** $c_R(\omega)$ depends on velocity structure.

**Love waves:** SH motion, exist only with velocity increase with depth.
**Dispersion:** $c_L(\omega)$ for each mode.

**Higher modes:** Sensitive to deeper structure.

### 16.4 Body Waves from Local Earthquakes

**Subduction zone (CR):**
- **Megathrust:** Thrust mechanism, shallow dip, long duration
- **Intraslab:** Normal/reverse, intermediate depth (50-150 km), high frequency
- **Crustal:** Shallow, diverse mechanisms

**Transform (CA):**
- **Strike-slip:** Right-lateral, vertical fault, bilateral rupture
- **Secondary faults:** Thrust (transpression), normal (transtension)

**Radiation patterns:**
- Thrust: Strong SV, weak SH
- Strike-slip: Strong SH, weak SV

### 16.5 Rupture Directivity Effects

**Strike-slip (CA):**
$$\text{Directivity pulse} \propto \frac{1}{1 - \frac{v_r}{v_s}\cos\phi}$$

Where $v_r$ = rupture velocity, $v_s$ = shear wave speed, $\phi$ = angle from rupture direction.

**San Jose, CA hazard:** Directly in directivity zone for NW-SE rupture on SAF.

**Subduction (CR):**
- Up-dip rupture: Strong directivity toward coast
- Down-dip rupture: Directivity toward trench

### 16.6 Seismic Source Spectra and Scaling

**Brune model (omega-square):**
$$\Omega(f) = \frac{\Omega_0}{1 + (f/f_c)^2}$$

**Corner frequency:** $f_c = 4.9 \times 10^6 \beta (\Delta\sigma/M_0)^{1/3}$

**Stress drop:** $\Delta\sigma \approx 1-10$ MPa (typical)
- Subduction: Often lower (1-3 MPa)
- Crustal: Higher (3-10 MPa)

**Moment magnitude:** $M_w = \frac{2}{3}\log_{10}M_0 - 6.0$

### 16.7 Site Amplification and Basin Effects

**Transfer function:** $H(f) = \frac{U_{surface}}{U_{bedrock}}$

**1D resonance:** $f_0 = \frac{\beta_{sed}}{4H}$ (quarter-wave)

**Santa Clara Valley (CA):**
- Depth: 1-3 km sediments
- $f_0 \approx 0.3-1$ Hz
- Amplification: 5-10× at resonance
- Edge effects: Surface waves from basin edges

**Central Valley (CR):**
- Depth: 0.5-2 km sediments
- $f_0 \approx 0.5-2$ Hz
- Amplification: 3-6×
- Volcanic layering: Complex resonance

### 16.8 Microseismic Noise: Primary and Secondary

**Primary microseism (0.05-0.1 Hz, 10-20 s):**
- Direct ocean wave pressure on sloping bottom
- Requires coastal topography
- **CR:** Bidirectional (Pacific + Caribbean)
- **CA:** Unidirectional (Pacific only)

**Secondary microseism (0.1-0.3 Hz, 3-10 s):**
- Nonlinear wave-wave interaction (standing waves)
- Deep ocean, no bottom interaction needed
- **Global source** but modulated by coastal reflection

### 16.9 Microseismic Noise Directionality

**Beamforming analysis:** Slowness vector $\mathbf{s} = \nabla \tau$

**CR (isthmus):**
- Pacific sources: W-SW (Southern Ocean storms)
- Caribbean sources: E-NE (trade winds, local storms)
- **Nearly isotropic** azimuthal distribution

**CA (coastal):**
- Dominant: W-NW (North Pacific storms)
- Seasonal: Stronger in austral winter (Southern Ocean)
- **Highly anisotropic** (70% from 270°-330°)

### 16.10 Hum (Free Oscillations) and Earth's Background Free Oscillations

**Spheroidal modes ($_nS_\ell$):** $f \approx 0.3-3$ mHz
**Toroidal modes ($_nT_\ell$):** $f \approx 0.3-3$ mHz

**Excitation:** Atmospheric pressure, ocean loading, wind.

**Amplitude:** $10^{-11}$ m/s² (vertical), $10^{-12}$ m/s² (horizontal)

**Latitudinal variation:**
- Equatorial: Enhanced ${}_0S_0$ (breathing mode) from atmospheric loading
- Mid-latitude: Enhanced ${}_0T_2$ from ocean loading

### 16.11 Seismic Interferometry: Green's Function Retrieval

**Cross-correlation of ambient noise:**
$$C_{AB}(\tau) = \int u_A(t) u_B(t+\tau) dt \approx G_{AB}(\tau) + G_{BA}(-\tau)$$

**Requirements:** Uniform source distribution, equipartition.

**CR:** Better equipartition (bidirectional sources).
**CA:** Directional bias (requires correction).

**Applications:** Crustal imaging, temporal monitoring (velocity changes).

### 16.12 Coda Waves and Scattering

**Coda:** Late-arriving scattered waves.
**Energy envelope:** $E(t) \propto t^{-\gamma} e^{-t/t_e}$

**Scattering coefficient:** $g_0 \propto \epsilon^2 a^3$ (heterogeneity)

**CR:** Stronger scattering (volcanic, fractured arc crust).
**CA:** Moderate scattering (sedimentary basin, fault zones).

**Coda Q:** $Q_c^{-1} = Q_i^{-1} + Q_s^{-1}$

### 16.13 Attenuation and Q Structure

**Quality factor:** $Q = \frac{2\pi E}{\Delta E_{cycle}}$

**Frequency dependence:** $Q(f) = Q_0 f^\eta$

**Typical crustal values:**
- $Q_P \approx 200-600$, $Q_S \approx 100-300$
- $\eta \approx 0.3-0.7$

**CR:** Lower Q (hotter, more fractured, fluids).
**CA:** Higher Q (cooler, more competent crust).

### 16.14 Anisotropy from Aligned Cracks and Stress

**Crack-induced anisotropy (Hudson model):**
$$\frac{\delta v}{v} = \frac{16}{45}\frac{1-\nu}{1-2\nu}\epsilon$$

**Fast direction:** Perpendicular to crack planes = maximum compressive stress.

**CR:** Fast direction = trench-normal (convergence).
**CA:** Fast direction = SAF-parallel (shear).

**SKS splitting:** $\delta t \approx 1-1.5$ s, $\phi$ as above.

### 16.15 Induced Seismicity and Human Activity

**CR:** Geothermal (Miravalles, Las Pailas), reservoir loading (Cachí, Arenal).
**CA:** Geothermal (Geysers), wastewater injection (minimal in Bay Area), reservoir loading.

**Magnitude distribution:** Gutenberg-Richter $b \approx 1$.
**Maximum induced:** Typically M<4 (except Geysers M~4.5).

### 16.16 Seismic Hazard Deaggregation

**CR (475 yr PGA):**
- Subduction interface: 40%
- Intraslab: 25%
- Crustal: 20%
- Volcanic: 10%
- Background: 5%

**CA (475 yr PGA):**
- SAF (creeping): 30%
- Hayward: 25%
- Calaveras: 15%
- Other crustal: 20%
- Background: 10%

### 16.17 Early Warning and Real-Time Seismology

**CR (SATREPS):**
- 50+ stations, EEW for Nicoya
- Alert: 5-30 s (subduction), 10-60 s (crustal)

**CA (ShakeAlert):**
- 1000+ stations (CISN)
- Alert: 2-20 s (crustal)
- Latency: <1 s (processing), ~5 s (telemetry)

### 16.18 Summary: Seismic Wavefield at CR vs CA

| Parameter | San Jose, CR | San Jose, CA |
|-----------|--------------|--------------|
| Dominant tectonics | Subduction (thrust) | Transform (strike-slip) |
| Max credible Mw | 8.0-8.5 (megathrust) | 7.5-8.0 (SAF) |
| Stress drop | 1-3 MPa | 3-10 MPa |
| Directivity | Up-dip/down-dip | Bilateral (SAF) |
| Basin amplification | 3-6× (0.5-2 Hz) | 5-10× (0.3-1 Hz) |
| Primary microseism | Bidirectional (2 coasts) | Unidirectional (Pacific) |
| Secondary microseism | Enhanced (isthmus) | Standard |
| Noise anisotropy | Low (isotropic) | High (W-NW dominant) |
| Hum excitation | Atmospheric dominant | Ocean loading dominant |
| Scattering (coda Q) | Low Q (strong) | Moderate Q |
| Anisotropy fast dir. | Trench-normal | SAF-parallel |
| EEW alert time | 5-60 s | 2-20 s |
| Induced seismicity | Geothermal, reservoirs | Geothermal (Geysers) |

**Key insight:** The equatorial node's seismic wavefield is dominated by **subduction zone processes** with bidirectional oceanic noise and strong scattering. The mid-latitude node's wavefield is dominated by **strike-slip faulting** with highly directional noise and pronounced basin amplification. Both present high hazard but require different monitoring and engineering strategies.

---

*End of Document 16: Seismic Wave Propagation & Microseismic Noise Fields (Complete, ~900 lines)*