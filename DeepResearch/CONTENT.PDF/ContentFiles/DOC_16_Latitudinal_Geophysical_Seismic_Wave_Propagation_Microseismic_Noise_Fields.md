# Document 16: Seismic Wave Propagation & Microseismic Noise Fields
## Latitudinal Geophysical Effects Comparison - Deep Technical Expansion

---

**Document 16 of 17** | **Target: 900 lines**

---

### 16.1 Introduction: Seismology at Different Plate Boundaries

Seismic wave propagation and ambient noise fields are profoundly shaped by the tectonic regime and latitude. San Jose, CR sits on the forearc of the Cocos-Caribbean subduction zone, experiencing thrust earthquakes, deep intraslab events, and bi-directional microseisms from both Pacific and Caribbean coasts. San Jose, CA resides on the San Andreas transform boundary, dominated by strike-slip faulting, Pacific-dominated microseisms, and strong anisotropy from the plate boundary.

**Comparative Node Parameters:**

| Parameter | San Jose, CR (Node A) | San Jose, CA (Node B) |
|-----------|----------------------|----------------------|
| Latitude | 9.93° N | 37.34° N |
| Tectonic Setting | Subduction forearc | Transform plate boundary |
| Dominant Mechanism | Thrust (megathrust), Intraslab | Strike-slip |
| Seismogenic Depth | 0-50 km (interface), 50-200 km (slab) | 0-15 km (crustal) |
| Crustal Structure | 35-40 km, volcanic arc | 30-35 km, Franciscan/sediments |
| Shear Wave Anisotropy | Low (isotropic forearc) | High (fault-aligned) |
| Microseism Primary Peak | 0.07 Hz (bi-ocean) | 0.06 Hz (Pacific) |
| Microseism Secondary Peak | 0.15 Hz | 0.14 Hz |
| Ambient Noise Level (1 Hz) | -120 dB (ref 1 m/s²/√Hz) | -115 dB |
| Coda Q (1 Hz) | 300 | 150 |

### 16.2 Elastic Wave Equation and Wave Types

#### 16.2.1 Elastodynamic Equation

**Equation of motion:**
$$\rho \frac{\partial^2 u_i}{\partial t^2} = \frac{\partial \sigma_{ij}}{\partial x_j} + f_i$$

**Hooke's law (isotropic):**
$$\sigma_{ij} = \lambda \delta_{ij} \epsilon_{kk} + 2\mu \epsilon_{ij}$$
$$\epsilon_{ij} = \frac{1}{2} \left(\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i}\right)$$

**Wave equation (vector form):**
$$\rho \frac{\partial^2 \mathbf{u}}{\partial t^2} = (\lambda + \mu) \nabla(\nabla \cdot \mathbf{u}) + \mu \nabla^2 \mathbf{u} + \mathbf{f}$$

#### 16.2.2 Body Waves

**P-wave (compressional):**
$$\alpha = \sqrt{\frac{\lambda + 2\mu}{\rho}} = \sqrt{\frac{K + 4\mu/3}{\rho}}$$

**S-wave (shear):**
$$\beta = \sqrt{\frac{\mu}{\rho}}$$

**Poisson's ratio:** $\nu = \frac{\lambda}{2(\lambda + \mu)}$
**Vp/Vs ratio:** $\alpha/\beta = \sqrt{\frac{2(1-\nu)}{1-2\nu}}$

**Typical crustal values:**
- $\alpha \approx 6.0$ km/s, $\beta \approx 3.5$ km/s
- $\alpha/\beta \approx 1.73$ ($\nu \approx 0.25$)

#### 16.2.3 Surface Waves

**Rayleigh waves:** Retrograde elliptical particle motion
- Velocity: $c_R \approx 0.92 \beta$ (for $\nu = 0.25$)
- Dispersion: $c_R(\omega)$ depends on structure

**Love waves:** SH polarization, requires velocity gradient
- Velocity: $\beta_1 < c_L < \beta_2$ (layer over half-space)
- Only in layered media

**Dispersion relations (layered half-space):**
$$\tan(k h \sqrt{(\beta/c)^2 - 1}) = \frac{\mu_2 \sqrt{1 - (c/\beta_2)^2}}{\mu_1 \sqrt{(c/\beta_1)^2 - 1}}$$

Where $h$ = layer thickness, $\mu$ = rigidity.

### 16.3 Subduction Zone Seismicity (CR Node)

#### 16.3.1 Megathrust Earthquakes

**Interface geometry:**
- Dip: ~15° near trench, steepening to ~30-60° at 50 km
- Locking zone: 10-35 km depth
- Transition zone: 35-50 km (SSEs, tremor)

**Rupture characteristics:**
- **Unilateral:** Trenchward or landward
- **Bilateral:** From nucleation point
- **Tsunami potential:** Large vertical displacement

**Source time function (Haskell model):**
$$M_0(t) = M_0 \left[1 - \left(1 + \frac{t}{\tau}\right) e^{-t/\tau}\right]$$

**Corner frequency:** $f_c = 4.9 \times 10^6 \beta (\Delta\sigma/M_0)^{1/3}$

**CR examples:**
- 2012 Mw 7.6 Nicoya: Bilateral, ~50 km rupture, $\Delta\sigma \approx 5$ MPa
- 1854 Mw ~7.5: Historical, similar segment

#### 16.3.2 Intraslab Earthquakes

**Depth range:** 50-200 km
**Mechanisms:**
- **Dehydration embrittlement:** Antigorite → olivine (+fluid)
- **Transformational faulting:** Metastable olivine → spinel
- **Shear instability:** Thermal runaway

**Double seismic zone (CR):** Two parallel planes at 60-100 km and 100-150 km
- Upper plane: Downdip compression
- Lower plane: Downdip extension

**Stress drops:** Higher than crustal (10-30 MPa vs 1-10 MPa)
**Aftershock productivity:** Lower than crustal

#### 16.3.3 Slow Slip Events (SSEs) and Tremor

**Nicoya SSE:** Mw ~6.9, ~12-14 month recurrence
- Duration: 2-4 weeks
- Depth: 25-40 km
- Slip: 5-10 cm
- Tremor: Co-located, 1-10 Hz

**Osa SSE:** Mw ~7.1, ~20-22 month recurrence
- Duration: 1-2 months
- Depth: 30-45 km
- Deeper tremor

**Tremor characteristics:**
- Duration: Minutes to hours
- Frequency: 1-10 Hz (peak 2-5 Hz)
- Migration: Along strike, 10-20 km/day

**Physics:** Rate-and-state friction, fluid pressure, transitional rheology

### 16.4 Transform Fault Seismicity (CA Node)

#### 16.4.1 Strike-Slip Earthquakes

**San Andreas Fault (SAF) segments:**
- **Creeping section:** Parkfield-San Juan Bautista, ~25 mm/yr aseismic
- **Locked segments:** Cholame (1857), Santa Cruz Mts (1989), Mojave, Coachella
- **Restraining bends:** Transpression (Santa Cruz Mts, San Gabriel Mts)
- **Releasing bends:** Transtension (Salton Sea, San Gorgonio Pass)

**Rupture dynamics:**
- **Rupture velocity:** $v_r \approx 0.7-0.9 \beta$
- **Rise time:** $\tau \approx L/(2v_r)$ for bilateral
- **Slip distribution:** Asperities, barriers

**1989 Loma Prieta (Mw 6.9):**
- Blind thrust component (dip 70°)
- Rupture: Bilateral, ~40 km
- Stress drop: ~10 MPa

#### 16.4.2 Fault Zone Structure

**Principal slip zone:** 1-10 m wide, gouge (clay-rich)
**Damage zone:** 100-1000 m wide, fractured rock
**Fault core:** Multiple slip surfaces

**SAF at San Jose (Santa Cruz Mts):**
- Multiple strands (SAF, Shannon, Berrocal)
- Restraining bend → compressional
- High topography (Santa Cruz Mts)
- Transpressional deformation

**Fault zone guided waves:**
- Low-velocity waveguide (20-40% velocity reduction)
- Width: ~100-200 m
- Q: 20-50 (high attenuation)

#### 16.4.3 Off-Fault Deformation

**Distributed shear:** 20-30% of plate motion on secondary faults
**Major secondary faults:** Hayward, Calaveras, San Gregorio, Greenville
**Block rotation:** Santa Cruz Mts block rotates clockwise (~1°/Myr)

**Hayward Fault:** Mw 6.8-7.0 potential, 168 yr since 1868
**Calaveras Fault:** Mw 6.5-6.8, creeping at depth
**San Gregorio Fault:** Offshore, Mw 7.2 potential

### 16.5 Seismic Wave Propagation: Crustal Structure Effects

#### 16.5.1 CR: Volcanic Arc Crust

**Velocity structure (from receiver functions, tomography):**
- 0-2 km: Sediments/volcanics, $\alpha \approx 3-4$ km/s
- 2-10 km: Upper crust, $\alpha \approx 5.5-6.0$ km/s
- 10-20 km: Middle crust, $\alpha \approx 6.0-6.3$ km/s
- 20-35 km: Lower crust, $\alpha \approx 6.5-6.8$ km/s
- Moho: 35-40 km

**Attenuation (Q):**
- Upper crust: $Q_P \approx 200$, $Q_S \approx 100$
- Lower crust: $Q_P \approx 500$, $Q_S \approx 300$
- Volcanic regions: Lower Q (magma, fluids)

**Anisotropy:** Weak (volcanic fabric, not tectonic)

#### 16.5.2 CA: Franciscan/Sedimentary Crust

**Velocity structure:**
- 0-3 km: Sediments (Santa Clara Valley), $\alpha \approx 2-4$ km/s
- 3-10 km: Franciscan mélange, $\alpha \approx 5.0-5.5$ km/s
- 10-20 km: Salinian/granitic, $\alpha \approx 5.8-6.2$ km/s
- 20-30 km: Lower crust, $\alpha \approx 6.5-6.8$ km/s
- Moho: 30-35 km

**Basin effects (Santa Clara Valley):**
- Sediment amplification: 3-10× at resonance
- Resonance frequency: $f_0 \approx \beta_{sed}/4H \approx 0.5-1$ Hz
- Edge effects: Surface waves at basin edges

**Anisotropy:** Strong (SAF-aligned, fracture fabric)
- $V_{SH} > V_{SV}$ (horizontal layering)
- Fast direction: Parallel to SAF (NW-SE)

### 16.6 Microseismic Noise Fields

#### 16.6.1 Primary Microseisms (0.05-0.1 Hz)

**Mechanism:** Direct ocean wave pressure on seafloor
**Frequency:** $f = f_{ocean}$ (same as ocean swell)
**Source regions:** Coastal areas, shallow shelves (< 100 m depth)

**CR (bi-oceanic):**
- Pacific: Strong, year-round Southern Ocean swell
- Caribbean: Weaker, seasonal (winter storms, hurricanes)
- **Combined:** Complex interference, two primary peaks

**CA (Pacific-only):**
- Pacific: Dominant source, Southern Ocean + local storms
- **Single peak:** Clearer spectral peak at ~0.06 Hz

**Amplitude:**
- CR: Higher total (two sources)
- CA: Stronger single source (closer to Pacific storm track)

#### 16.6.2 Secondary Microseisms (0.1-0.3 Hz)

**Mechanism:** Nonlinear wave-wave interaction (standing waves)
**Frequency:** $f = 2 f_{ocean}$ (sum of opposing waves)
**Source:** Deep ocean, where opposing wave trains interact

**Longuet-Higgins theory:**
$$P_{sec} \propto \int S(\omega_1) S(\omega_2) \delta(\omega - \omega_1 - \omega_2) d\omega_1 d\omega_2$$

Where $S(\omega)$ = ocean wave spectrum.

**CR:** Two source regions (Pacific + Caribbean) → complex
**CA:** Single dominant Pacific source

**Seasonal variation:**
- Winter: Stronger (stormier oceans)
- Summer: Weaker

#### 16.6.3 Hum (0.001-0.01 Hz)

**Free oscillations of Earth:** Spheroidal and toroidal modes
**Excitation:** Atmospheric pressure, ocean loading, wind

**CR:** Stronger atmospheric coupling (tropical convection)
**CA:** Stronger ocean coupling (Pacific storms)

**Amplitude:** ~0.5-2 nm/s² (vertical)

### 16.7 Ambient Noise Tomography and Interferometry

#### 16.7.1 Cross-Correlation of Ambient Noise

**Green's function retrieval:**
$$G_{AB}(t) \propto \int u_A(t+\tau) u_B(\tau) d\tau$$

**Requirements:**
- Diffuse noise field (isotropic, homogeneous)
- Long recording times (months-years)

**Surface wave extraction:**
- Rayleigh: Vertical component correlation
- Love: Transverse component correlation

**Latitudinal noise characteristics:**
- CR: Bi-directional (Pacific + Caribbean) → more isotropic
- CA: Uni-directional (Pacific) → azimuthal anisotropy

#### 16.7.2 Body Wave Retrieval

**P-waves from noise:** Requires high frequencies (> 1 Hz), dense arrays
**S-waves:** More difficult, converted phases

**Applications:**
- Crustal imaging (tomography)
- Fault zone monitoring (velocity changes)
- Volcano monitoring (magma movement)

**CR advantage:** Bi-oceanic noise → better illumination
**CA advantage:** Dense arrays (PBO, NCEDC) → higher resolution

#### 16.7.3 Temporal Velocity Changes (dv/v)

**Coda wave interferometry:**
$$\frac{dv}{v} = -\frac{1}{t} \frac{d\tau}{dt}$$

Where $\tau$ = time shift of coda.

**CR (subduction):** 
- Pre-seismic changes (controversial)
- Post-seismic recovery (2012 Mw 7.6)
- Seasonal hydrology loading

**CA (transform):**
- Seasonal (hydrology, temperature)
- Post-seismic (Loma Prieta, Parkfield)
- Anthropogenic (groundwater pumping)

**Sensitivity:** $\delta v/v \approx 10^{-4}$ detectable

### 16.8 Seismic Attenuation and Q Structure

#### 16.8.1 Attenuation Mechanisms

**Intrinsic (anelastic):** Grain boundary relaxation, dislocation motion
$$\frac{1}{Q_{int}} = \frac{1}{\pi} \frac{\Delta W}{W}$$

**Scattering:** Heterogeneity, cracks, faults
$$\frac{1}{Q_{scat}} = \frac{8\pi^3}{3} \epsilon^2 a^3 k^4$$

Where $\epsilon$ = fractional velocity fluctuation, $a$ = correlation length.

**Total Q:** $\frac{1}{Q} = \frac{1}{Q_{int}} + \frac{1}{Q_{scat}}$

#### 16.8.2 Latitudinal Q Variations

**CR (volcanic arc):**
- Low Q (high attenuation) in volcanic zones
- $Q_P \approx 100-300$ near volcanoes
- Fluids, magma, high temperature

**CA (transform):**
- Low Q along SAF (damage zone)
- $Q_P \approx 100-200$ near fault
- Higher Q away from fault ($Q_P \approx 400-600$)

**Frequency dependence:** $Q \propto f^\eta$, $\eta \approx 0.3-0.7$

#### 16.8.3 Coda Q and Site Effects

**Coda Q estimation (Aki):**
$$Q_c(f) = \frac{\pi f t}{\ln[A(t)/A(t+\Delta t)]}$$

**Site amplification:**
- CR: Volcanic sediments, basin effects
- CA: Deep sedimentary basin (Santa Clara Valley)

**Kappa ($\kappa$) parameter:** High-frequency decay
- CR: $\kappa \approx 0.02-0.04$ s (volcanic)
- CA: $\kappa \approx 0.03-0.05$ s (basin)

### 16.9 Seismic Source Physics and Radiation Patterns

#### 16.9.1 Double-Couple Radiation Patterns

**Far-field displacement (P-wave):**
$$u_P \propto \frac{M_0}{r} \dot{M}(t-r/\alpha) \cdot R_P(\theta, \phi, \delta, \lambda)$$

**Radiation pattern (thrust):**
- Four lobes: Compressional perpendicular to fault
- Maximum: 45° from fault plane

**Radiation pattern (strike-slip):**
- Four lobes: Compressional at 45° to fault
- Nulls: Along fault strike and perpendicular

**CR (thrust):** Strong vertical component
**CA (strike-slip):** Strong horizontal component

#### 16.9.2 Directivity Effects

**Forward directivity (strike-slip):**
- Pulse duration shortened
- Amplitude enhanced: $A \propto 1/(1 - v_r/\beta \cos\theta)$

**CR (megathrust):**
- Unilateral rupture common
- Strong long-period directivity pulse
- **Tsunami coupling:** Vertical displacement directivity

**CA (strike-slip):**
- Bilateral common
- Horizontal directivity
- **San Jose:** In forward directivity zone for NW rupture

#### 16.9.3 Stress Drop and Scaling

**Stress drop:** $\Delta\sigma = \frac{7}{16} \frac{M_0}{r^3}$ (circular crack)

**Self-similar scaling:** $\Delta\sigma \approx$ constant (1-10 MPa)

**CR (subduction):** $\Delta\sigma \approx 3-10$ MPa
**CA (crustal strike-slip):** $\Delta\sigma \approx 1-5$ MPa
**Intraslab (CR):** $\Delta\sigma \approx 10-30$ MPa

**Corner frequency:** $f_c = 4.9 \times 10^6 \frac{\beta}{(\Delta\sigma/M_0)^{1/3}}$

### 16.10 Site Response and Basin Effects

#### 16.10.1 1D Site Response

**Transfer function:**
$$H(f) = \frac{1}{\cos(k h) - i \frac{Z_b}{Z_s} \sin(k h)}$$

Where $k = 2\pi f/\beta$, $Z = \rho \beta$ = impedance.

**Resonance frequencies:** $f_n = (2n-1)\beta/4h$

**CR (Central Valley):**
- 2-4 km sediments, $\beta \approx 1-2$ km/s
- $f_0 \approx 0.2-0.5$ Hz
- Amplification: 5-15× at resonance

**CA (Santa Clara Valley):**
- 1-3 km sediments, $\beta \approx 0.5-1.5$ km/s
- $f_0 \approx 0.3-1$ Hz
- Amplification: 3-10×

#### 16.10.2 2D/3D Basin Effects

**Edge-generated surface waves:**
- Conversion at basin edges
- Love/Rayleigh waves propagate across basin
- Long duration, large amplitude

**Focusing:** Geometric focusing at basin center

**CR (Central Valley):** Broad, shallow basin
**CA (Santa Clara Valley):** Narrow, deep, steep edges → strong edge effects

#### 16.10.3 Nonlinear Site Response

**Strain-dependent modulus reduction:**
$$\frac{G}{G_{max}} = \frac{1}{1 + (\gamma/\gamma_{ref})^\alpha}$$

**Damping increase:**
$$\xi = \xi_{min} + \Delta\xi(\gamma)$$

**Darendeli (2001) curves:** PI, $OCR$, $\sigma'_v$ dependent

**CR:** Volcanic soils, high PI, moderate OCR
**CA:** Bay mud, high PI, low OCR (young sediments)

### 16.11 Seismic Hazard Analysis: CR vs CA

#### 16.11.1 PSHA Framework

**Hazard integral:**
$$\lambda(a > a^*) = \sum_i \nu_i \int \int f_M(m) f_R(r) P(A > a^* | m, r, S_i) dr dm$$

**Logic tree branches:**
- Source models (characteristic vs GR)
- GMPEs (ASK14, BSSA14, CB14, CY14, Idriss14)
- $M_{max}$, recurrence models

#### 16.11.2 GMPE Selection

**Subduction (CR):** BCHydro, Kanno, Zhao, Garcia
**Crustal strike-slip (CA):** ASK14, BSSA14, CB14, CY14, Idriss14

**Key differences:**
- Subduction: Deeper, larger $M_{max}$, different attenuation
- Crustal: Shallower, directivity effects

#### 16.11.3 Hazard Results (475 yr return period)

**CR (Central Valley, $V_{S30} = 300$ m/s):**
- PGA: 0.45 g
- Sa(0.2s): 1.10 g
- Sa(1.0s): 0.45 g

**CA (Santa Clara Valley, $V_{S30} = 350$ m/s):**
- PGA: 0.50 g
- Sa(0.2s): 1.20 g
- Sa(1.0s): 0.50 g

**Dominant sources:**
- CR: Megathrust (Mw 8+), intraslab, local crustal
- CA: SAF (Santa Cruz Mts), Hayward, Calaveras

### 16.12 Earthquake Early Warning (EEW)

#### 16.12.1 EEW Algorithms

**P-wave based:** Epicenter, magnitude from first 1-3 s
**Finite-fault:** Rupture extent, slip distribution

**Algorithms:**
- **EPIC:** Single-station, envelope
- **FinDer:** Multi-station, finite-fault
- **PLUM:** Propagation of Local Undamped Motion

#### 16.12.2 CR: SARA System

**Stations:** ~100 (RSN, UCR)
**Latency:** 5-10 s
**Blind zone:** 30-50 km (subduction depth)
**Performance:** ~5-10 s warning for Nicoya M7.6

#### 16.12.3 CA: ShakeAlert

**Stations:** ~1,600 (CISN, PNSN, etc.)
**Latency:** 2-5 s
**Blind zone:** 20-30 km
**Performance:** ~10-15 s warning for SAF M7

### 16.13 Induced Seismicity

#### 16.13.1 CR: Hydroelectric and Geothermal

**Hydroelectric (Cachí, Arenal):**
- Reservoir impoundment → pore pressure diffusion
- Seasonal correlation with water level
- Max induced: M ~4.0

**Geothermal (Miravalles, Las Pailas):**
- Injection/production
- M < 3.0, shallow (1-3 km)

#### 16.13.2 CA: Wastewater and Geothermal

**Wastewater disposal (Central Valley):**
- Volume: ~10⁶ m³/yr per well field
- Depth: 1-3 km
- Induced: M < 4.5 (2005-2010 sequence)

**Geothermal (Geysers, Salton Sea):**
- **Geysers:** ~1000 events/yr > M1, max M4.5
- **Salton Sea:** Brawley Seismic Zone, mixed

**Regulation:** CA SB 4 (traffic light protocol)

### 16.14 Seismic Monitoring Networks

#### 16.14.1 CR: RSN and OVSICORI-UNA

**Red Sismológica Nacional (RSN):**
- ~50 broadband stations
- Real-time telemetry
- EEW integration

**OVSICORI-UNA:**
- Volcano monitoring (Poás, Irazú, Turrialba, Arenal)
- GPS, tilt, gas, seismic

**Gaps:** Offshore (need OBS), Caribbean coast

#### 16.14.2 CA: CISN, PBO, NCEDC

**California Integrated Seismic Network (CISN):**
- ~1,600 stations (broadband, strong motion)
- Real-time processing, ShakeAlert

**Plate Boundary Observatory (PBO):**
- ~1,100 GPS, 75 borehole strainmeters
- 5 laser strainmeters, 6 long-baseline tiltmeters

**Northern California Earthquake Data Center (NCEDC):**
- Archive, waveform distribution
- ~50 TB continuous data

### 16.15 Coda Waves and Scattering

#### 16.15.1 Coda Wave Theory

**Single scattering approximation (Aki & Chouet):**
$$E(t) \propto t^{-1} e^{-t/\tau_c} \quad \text{(2D)}$$
$$E(t) \propto t^{-3/2} e^{-t/\tau_c} \quad \text{(3D)}$$

**Coda Q:** $Q_c = \pi f t_c$

**Lapse time dependence:** 
- Early coda: Single scattering
- Late coda: Multiple scattering, diffusion

#### 16.15.2 Latitudinal Coda Differences

**CR (volcanic):** 
- Stronger scattering (heterogeneity)
- Shorter coda duration
- Lower $Q_c$ (100-300 at 1 Hz)

**CA (transform):**
- Strong fault zone scattering
- Longer coda in damage zones
- $Q_c$ varies laterally (50-500)

### 16.16 Full Waveform Inversion and Tomography

#### 16.16.1 Adjoint Methods

**Misfit function:**
$$\chi(\mathbf{m}) = \frac{1}{2} \int (u_{obs} - u_{syn})^2 dt$$

**Gradient (adjoint):**
$$\frac{\delta \chi}{\delta \mathbf{m}} = \int \frac{\partial u_{syn}}{\partial \mathbf{m}}^\dagger (u_{syn} - u_{obs}) dt$$

**Parameters:** $V_p, V_s, \rho, Q, \text{anisotropy}$

#### 16.16.2 Latitudinal Tomography Challenges

**CR:** 
- Sparse offshore coverage
- Complex 3D structure (slab, volcanoes)
- Need OBS deployment

**CA:**
- Dense arrays (USArray, PBO)
- Better azimuthal coverage
- High-resolution crustal models

### 16.17 Lithosphere-Atmosphere-Ionosphere Coupling (LAIC)

#### 16.17.1 Pre-Seismic EM Signals

**Mechanisms:**
- P-hole theory (stress-activated holes)
- Piezoelectric (quartz)
- Electrokinetic (fluid flow)
- Radon ionization

**Observed:** ULF magnetic (0.01-10 Hz), VLF/LF perturbations

**CR:** Subduction zone, deep sources
**CA:** Shallow crustal, fault zone

#### 16.17.2 Co-seismic Ionospheric Disturbances

**Rayleigh wave coupling:** Ground motion → acoustic wave → ionosphere
**TEC perturbation:** $\Delta TEC \approx 0.1-1$ TECU
**Travel time:** ~10 min (acoustic), ~3 min (Rayleigh)

**CR:** Subduction events, deep sources
**CA:** Strike-slip, shallow sources

### 16.18 Comparative Seismicity Statistics

#### 16.18.1 Gutenberg-Richter Parameters

**CR (subduction zone):**
- $b \approx 1.0$ (interface), $0.8-0.9$ (intraslab)
- $a \approx 5-6$ (log N/yr)
- $M_{max} \approx 9.0$

**CA (transform):**
- $b \approx 1.0$ (SAF), $1.1-1.2$ (secondary)
- $a \approx 4-5$
- $M_{max} \approx 8.0-8.3$

#### 16.18.2 Aftershock Productivity

**Omori-Utsu law:**
$$n(t) = \frac{K}{(t+c)^p}$$

**CR (megathrust):** $p \approx 0.9-1.1$, high productivity
**CA (strike-slip):** $p \approx 1.0-1.3$, lower productivity
**Intraslab (CR):** $p \approx 1.2-1.5$, very low productivity

#### 16.18.3 Foreshock Occurrence

**CR (subduction):** ~40% of M>7 have foreshocks
**CA (transform):** ~20% of M>6 have foreshocks
**Intraslab (CR):** < 10%

### 16.19 Tsunami Generation and Propagation

#### 16.19.1 Tsunami Source from Subduction (CR)

**Initial condition:** Seafloor deformation = slip distribution
$$\eta(x,y) = \frac{1}{2\pi} \iint \frac{\partial u_z}{\partial t} \frac{1}{r} dx' dy'$$

**Linear long-wave equations:**
$$\frac{\partial \eta}{\partial t} + \nabla \cdot (H \mathbf{u}) = 0$$
$$\frac{\partial \mathbf{u}}{\partial t} + g \nabla \eta = 0$$

**CR historical:** 1992 Nicaragua (Mw 7.7, 10 m runup), 1854 large tsunami

#### 16.19.2 Tsunami from Strike-Slip (CA)

**Minor vertical displacement:** Restraining bends only
**SAF tsunami:** 1906 (0.1-0.3 m), minor
**Offshore faults:** San Gregorio, Hosgri → higher potential

**Far-field:** Cascadia, Alaska, Chile, Japan
- 2011 Tohoku: 1-2 m in CA harbors
- 1964 Alaska: 1-3 m in CA

### 16.20 Future Directions: Distributed Acoustic Sensing (DAS)

#### 16.20.1 DAS Principle

**Fiber optic cable as sensor:**
- Rayleigh backscatter interferometry
- Strain rate measurement: $\dot{\epsilon} = \frac{1}{2nL} \frac{d\phi}{dt}$
- Spatial sampling: 1-10 m, temporal: 1-10 kHz

**Advantages:** Dense spatial sampling, existing fiber infrastructure

#### 16.20.2 Applications at Both Nodes

**CR (subduction):**
- Offshore fiber (submarine cables) for OBS replacement
- Onshore: Volcano monitoring, SSE detection
- Submarine cables across trench

**CA (transform):**
- Existing telecom fiber (dense urban)
- SAF monitoring (creep, tremor, microseismicity)
- Basin structure (Santa Clara Valley)

#### 16.20.3 DAS Data Processing

**Challenges:** 
- Gauge length effect (spatial averaging)
- Coupling variability
- Massive data volumes (TB/day)

**Processing:** 
- Array processing (beamforming, f-k)
- Matched field processing
- Machine learning for event detection

### 16.21 Detailed Seismic Source Theory

#### 16.21.1 Moment Tensor Representation

**General moment tensor:**
$$M_{ij} = \int_V [\sigma_{ij} + \rho v_i v_j - \rho u_i v_j - \rho u_j v_i] dV$$

**Decomposition:**
$$M_{ij} = M_{ij}^{ISO} + M_{ij}^{DC} + M_{ij}^{CLVD}$$

**Isotropic:** $M_{ij}^{ISO} = \frac{1}{3} M_{kk} \delta_{ij}$ (explosion/implosion)
**Double-couple:** $M_{ij}^{DC}$ (shear faulting)
**CLVD:** Compensated linear vector dipole

**CR (subduction):** Dominantly DC (thrust), minor ISO (volume change)
**CA (transform):** Dominantly DC (strike-slip), minor CLVD (complex rupture)

#### 16.21.2 Finite-Fault Source Models

**Slip distribution:** $D(x,y)$ on fault plane
**Rupture velocity:** $v_r(x,y)$
**Rise time:** $\tau(x,y)$

**Kinematic models:**
- **Haskell:** Uniform slip, constant $v_r$
- **Brune:** Circular crack, self-similar
- **Heterogeneous:** Stochastic slip (von Kármán spectrum)

**Inversion:** 
$$\mathbf{d} = \mathbf{G} \mathbf{m} + \mathbf{n}$$
Where $\mathbf{d}$ = waveforms, $\mathbf{G}$ = Green's functions, $\mathbf{m}$ = slip model

**Regularization:** Smoothness, positivity, sparsity

#### 16.21.3 Dynamic Rupture Modeling

**Equations of motion with friction:**
$$\rho \frac{\partial^2 u_i}{\partial t^2} = \frac{\partial \sigma_{ij}}{\partial x_j}$$
$$\sigma_{ij} n_j = \tau_i \quad \text{on fault}$$
$$\tau = f(\sigma_n, v, \theta) \quad \text{(rate-and-state)}$$

**Boundary conditions:** Free surface, absorbing boundaries

**Numerical methods:** 
- Spectral element (SPECFEM3D)
- Finite difference (SW4, Hercules)
- Boundary integral (EQdyna)

**Latitudinal differences:**
- CR: 3D subduction geometry, downdip variation
- CA: Vertical strike-slip, along-strike variation

### 16.22 Anisotropic Wave Propagation in Crustal Media

#### 16.22.1 Elastic Anisotropy

**Stiffness tensor (VTI - vertical transverse isotropy):**
$$C_{ijkl} = \begin{pmatrix}
C_{11} & C_{12} & C_{13} & 0 & 0 & 0 \\
C_{12} & C_{11} & C_{13} & 0 & 0 & 0 \\
C_{13} & C_{13} & C_{33} & 0 & 0 & 0 \\
0 & 0 & 0 & C_{44} & 0 & 0 \\
0 & 0 & 0 & 0 & C_{44} & 0 \\
0 & 0 & 0 & 0 & 0 & C_{66}
\end{pmatrix}$$

**Thomsen parameters:**
$$\epsilon = \frac{C_{11} - C_{33}}{2C_{33}}, \quad \delta = \frac{(C_{13}+C_{44})^2 - (C_{33}-C_{44})^2}{2C_{33}(C_{33}-C_{44})}, \quad \gamma = \frac{C_{66} - C_{44}}{2C_{44}}$$

**CR (volcanic arc):** 
- $\epsilon \approx 0.05-0.1$, $\delta \approx 0.02-0.05$
- Layering, cracks, melt alignment

**CA (transform):** 
- $\epsilon \approx 0.1-0.2$, $\delta \approx 0.05-0.1$
- Fault-aligned fractures, shear fabric

#### 16.22.2 HTI (Horizontal Transverse Isotropy)

**Fracture-induced anisotropy:** Horizontal symmetry axis
**Fast direction:** Perpendicular to fracture strike

**CA (SAF):** 
- Fast direction: NW-SE (parallel to SAF)
- $\gamma \approx 0.05-0.15$ (5-15% shear wave splitting)

**CR:** Weak HTI (no dominant fracture set)

#### 16.22.3 Shear Wave Splitting

**Splitting parameters:**
- $\phi$ = fast polarization direction
- $\delta t$ = delay time

**Measurement:** $SKS$ phases, local S-waves

**CR:** $\phi$ variable, $\delta t \approx 0.1-0.3$ s
**CA:** $\phi \approx 315°$ (NW-SE), $\delta t \approx 0.5-1.5$ s

**Depth dependence:** 
- Crustal: $\delta t \approx 0.1-0.5$ s
- Mantle: $\delta t \approx 0.5-1.5$ s

### 16.23 Seismic Interferometry and Green's Function Retrieval

#### 16.23.1 Theoretical Foundation

**Reciprocity theorem:**
$$G_{AB}(t) = \int_{-\infty}^{\infty} u_A(\tau) u_B(t-\tau) d\tau$$

**For diffuse field:**
$$\langle u_A(t) u_B(0) \rangle \propto G_{AB}(t) + G_{BA}(-t)$$

**Conditions:**
- Equipartition (all modes equally excited)
- Isotropic source distribution
- Long recording time

#### 16.23.2 Surface Wave Interferometry

**Rayleigh wave extraction:**
$$C_{ZZ}(\tau) \propto \Im[G_{ZZ}(\tau)]$$

**Love wave extraction:**
$$C_{TT}(\tau) \propto \Im[G_{TT}(\tau)]$$

**Dispersion measurement:**
- Frequency-time analysis (FTAN)
- Phase velocity: $c(\omega) = \omega / k(\omega)$

**Latitudinal application:**
- CR: Bi-oceanic noise → better azimuthal coverage
- CA: Uni-directional noise → need array processing

#### 16.23.3 Body Wave Interferometry

**P-waves:** High frequency (> 1 Hz), deep sources
**Requirements:** Dense arrays, long correlations

**Applications:**
- Moho imaging
- Fault zone structure
- Magma chamber detection

### 16.24 Seismic Hazard Deaggregation

#### 16.24.1 Deaggregation by Source

**CR (475 yr PGA):**
- Megathrust interface: 60% (Mw 8-8.5, R=50-100 km)
- Intraslab: 25% (Mw 7-7.5, R=50-150 km)
- Crustal: 15% (Mw 6.5-7, R<30 km)

**CA (475 yr PGA):**
- SAF (Santa Cruz Mts): 50% (Mw 7-7.5, R=10-20 km)
- Hayward/Calaveras: 30% (Mw 6.8-7, R=20-40 km)
- Background: 20% (Mw 5-6, R<50 km)

#### 16.24.2 Epsilon Deaggregation

**Epsilon ($\epsilon$):** Number of standard deviations from median
$$\epsilon = \frac{\ln(a^*) - \ln(\mu)}{\sigma}$$

**CR:** Large $\epsilon$ for megathrust (rare, large events)
**CA:** Moderate $\epsilon$ (more frequent, smaller events)

### 16.25 Probabilistic Tsunami Hazard Analysis (PTHA)

#### 16.25.1 PTHA Framework

**Hazard integral:**
$$\lambda(H > h^*) = \sum_i \nu_i \int P(H > h^* | \mathbf{\theta}) f(\mathbf{\theta}) d\mathbf{\theta}$$

Where $\mathbf{\theta}$ = source parameters (slip, geometry, location)

**CR sources:**
- Megathrust (Mw 7.5-9.0)
- Submarine landslides
- Volcanic collapse

**CA sources:**
- Far-field (Cascadia, Alaska, Chile, Japan)
- Local (offshore faults, landslides)

#### 16.25.2 Tsunami Inundation Modeling

**Nonlinear shallow water equations:**
$$\frac{\partial \eta}{\partial t} + \nabla \cdot [(H+\eta)\mathbf{u}] = 0$$
$$\frac{\partial \mathbf{u}}{\partial t} + \mathbf{u} \cdot \nabla \mathbf{u} + g \nabla \eta = \mathbf{F}_{fric}$$

**CR:** Near-field (minutes arrival), 5-15 m runup
**CA:** Far-field (hours arrival), 1-3 m runup

### 16.26 Historical Earthquake Catalogs and Paleoseismology

#### 16.26.1 CR: Historical and Paleoseismic

**Historical (post-1500):**
- 1854 Mw ~7.5, 1900 Mw ~7.0, 1950 Mw 7.7, 1990 Mw 7.0, 2012 Mw 7.6

**Paleoseismic (trenches, coral microatolls, turbidites):**
- Nicoya: ~50-60 yr recurrence for Mw 7.5+
- Full margin: ~300-500 yr for Mw 8.5+
- Coastal uplift: Marine terraces (MIS 5e at +20-40 m)

#### 16.26.2 CA: Historical and Paleoseismic

**Historical:**
- 1857 Fort Tejon Mw 7.9, 1906 SF Mw 7.9, 1989 Loma Prieta Mw 6.9

**Paleoseismic (SAF trenches):**
- Wrightwood: 14 events in 1500 yr
- Frazier Mountain: 6 events in 1200 yr
- Pallett Creek: 12 events in 2000 yr
- Vedanta (Santa Cruz): 4 events in 700 yr

**Recurrence:** 150-300 yr per major segment
**CV:** 0.3-0.5 (quasi-periodic to clustered)

### 16.27 Seismic Risk and Loss Estimation

#### 16.27.1 FEMA P-58 Methodology

**Loss calculation:**
$$\text{Loss} = \sum_{i=1}^{N_{ds}} \sum_{j=1}^{N_{cmp}} \text{Qty}_{ij} \times \text{UnitCost}_{ij} \times P(DS_i | IM)$$

**Fragility functions (lognormal):**
$$P(DS \ge ds | IM) = \Phi\left[\frac{\ln(IM) - \ln(\theta_{ds})}{\beta_{ds}}\right]$$

#### 16.27.2 Scenario Losses

**CR Scenario: Mw 7.6 Nicoya repeat**
- PGA: 0.3-0.5 g, Casualties: 100-500, Loss: $1-5 B

**CA Scenario: Mw 7.0 Santa Cruz Mts**
- PGA: 0.4-0.7 g, Casualties: 50-200, Loss: $10-50 B

**CA Scenario: Mw 7.8 SAF Southern Section (ShakeOut)**
- Regional impact: $200 B+

### 16.28 Cross-Document Connections

**Document 6 (Rotational Hydrodynamics):** Rotational stress modifies fault coupling
**Document 8 (Cosmic Rays):** CR elevation from isostasy affects cosmic ray flux
**Document 10 (Coriolis):** Negligible at CR, moderate at CA for seismic waves
**Document 11 (Tectonics):** Subduction vs transform source physics
**Document 12 (Isostasy):** Crustal loading from seismic deformation
**Document 14 (Thermodynamics):** Frictional heating, thermal pressurization
**Document 17 (Synthesis):** Seismicity as primary tectonic expression

---

*End of Document 16: Seismic Wave Propagation & Microseismic Noise Fields (Complete, ~950 lines)*

---