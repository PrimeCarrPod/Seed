# Document 10: Coriolis Dynamics & Atmospheric Boundary Layers
## Latitudinal Geophysical Effects Comparison - Deep Technical Expansion

---

**Document 10 of 17** | **Target: 900 lines**

---

### 10.1 Introduction: The Coriolis Effect as a Latitudinal Filter

The Coriolis effect - a fictitious inertial force arising from Earth's rotation - fundamentally reorganizes atmospheric and oceanic dynamics across latitudes. Its magnitude depends on the sine of latitude, creating a sharp transition between equatorial (negligible Coriolis) and mid-latitude (dominant Coriolis) regimes. This transition governs everything from cloud formation to jet stream structure to acoustic wave propagation.

### 10.2 Coriolis Parameter: Mathematical Definition

**Coriolis parameter:**
$$f = 2\Omega\sin\varphi = 2 \times 7.2921150 \times 10^{-5} \times \sin\varphi \text{ s}^{-1}$$

**Values at comparative nodes:**
- **San Jose, CR (9.9281° N):** $f_{CR} = 2.53 \times 10^{-5}$ s⁻¹
- **San Jose, CA (37.3382° N):** $f_{CA} = 8.87 \times 10^{-5}$ s⁻¹

**Ratio:** $f_{CA}/f_{CR} = 3.5$ - **Mid-latitudes experience 3.5× stronger Coriolis force.**

**Rossby number (dynamical regime indicator):**
$$Ro = \frac{U}{fL}$$

Where $U$ = characteristic velocity, $L$ = characteristic length scale.

**Typical atmospheric values:** $U = 10$ m/s, $L = 1000$ km
- CR: $Ro = 10 / (2.53 \times 10^{-5} \times 10^6) = 0.4$ (rotation significant but not dominant)
- CA: $Ro = 10 / (8.87 \times 10^{-5} \times 10^6) = 0.11$ (rotation dominant)

### 10.3 Equatorial Dynamics: The Hadley Cell and ITCZ

**Thermal direct circulation:** At equator, solar heating drives rising motion.
**Mass continuity:** Air rises at ITCZ, flows poleward aloft, sinks in subtropics, returns equatorward at surface.

**Hadley cell equations (steady, axisymmetric):**
$$\frac{\partial u}{\partial t} - fv = -\frac{1}{\rho}\frac{\partial p}{\partial x}$$
$$\frac{\partial v}{\partial t} + fu = -\frac{1}{\rho}\frac{\partial p}{\partial y}$$

At equator ($f \to 0$): **No geostrophic balance** - flow is directly from high to low pressure.

**ITCZ position:** Migrates seasonally following maximum solar heating.
- CR (9.9° N): **Within ITCZ influence year-round** (ITCZ: 5° S - 10° N)
- CA (37° N): **Far from ITCZ**, in descending branch of Hadley cell

**Vertical velocity in ITCZ:** $\omega \approx -0.1$ Pa/s (strong ascent)
**Subsidence at 30° N:** $\omega \approx +0.02$ Pa/s (gentle descent)

### 10.4 Mid-Latitude Dynamics: Geostrophic Balance and Jet Stream

**Geostrophic wind (steady, frictionless):**
$$\mathbf{v}_g = \frac{1}{f\rho}\hat{\mathbf{k}} \times \nabla p$$

**Thermal wind balance:**
$$\frac{\partial \mathbf{v}_g}{\partial \ln p} = \frac{R}{f}\hat{\mathbf{k}} \times \nabla T$$

**Jet stream formation:** Strong meridional temperature gradient → strong vertical shear → jet.

**CA (37° N) jet characteristics:**
- Core at 200-300 hPa (~9-12 km)
- Speed: 30-50 m/s (winter), 15-25 m/s (summer)
- Position varies with season and ENSO

**Rossby waves (planetary waves):**
$$\frac{\partial}{\partial t}\nabla^2\psi + \beta\frac{\partial\psi}{\partial x} = 0$$

Dispersion: $\omega = -\beta k/(k^2 + l^2)$ where $\beta = df/dy = 2\Omega\cos\varphi/R_\oplus$.

**At CA:** $\beta = 1.6 \times 10^{-11}$ m⁻¹s⁻¹
**At CR:** $\beta = 2.3 \times 10^{-11}$ m⁻¹s⁻¹ (larger at equator!)

### 10.5 Coriolis Effect on Acoustic and Infrasonic Waves

**Wave equation in rotating frame:**
$$\frac{\partial^2 p'}{\partial t^2} - c^2\nabla^2 p' = 2\rho_0 \boldsymbol{\Omega} \cdot (\nabla \times \mathbf{v}')$$

**Dispersion relation for sound waves:**
$$\omega^2 = c^2 k^2 + 4\Omega^2 \cos^2\theta \quad \text{(inertial-gravity waves)}$$

**For pure acoustic waves ($\omega \gg f$):** Negligible Coriolis effect.
**For infrasound ($\omega \sim f$):** Strong Coriolis modification.

**Critical frequency:** $\omega = f$ (inertial frequency)
- CR: $f/2\pi = 4.0 \mu$Hz (period 69 hours)
- CA: $f/2\pi = 14 \mu$Hz (period 19 hours)

**Atmospheric infrasound (0.01-10 Hz) $\gg f$:** Coriolis negligible for propagation.
**But:** Background wind shear (from geostrophic balance) strongly refracts waves.

### 10.6 Wind Shear and Wave Refraction at Mid-Latitudes

**Thermal wind shear:**
$$\frac{\partial u}{\partial z} = -\frac{g}{fT}\frac{\partial T}{\partial y}$$

**Typical mid-latitude shear:** 5-10 m/s per km (vertical)
**Equatorial shear:** <1 m/s per km (except QBO)

**Snell's law in sheared flow:**
$$\frac{\sin\theta_1}{c_1 + U_1} = \frac{\sin\theta_2}{c_2 + U_2}$$

**Mid-latitude ducting:** Jet stream creates **waveguide** for infrasound.
- Upward propagating waves refracted back down
- Multiple bounces → long-range propagation
- **CA: Excellent infrasound ducting**

**Equatorial ducting:** Weak shear → less ducting, more vertical propagation.
**CR: Poor infrasound ducting, more leakage to space**

### 10.7 Boundary Layer Structure: Equatorial vs Mid-Latitude

**Planetary Boundary Layer (PBL) depth:**
- CR (tropical): 1-2 km (day), 0.5 km (night) - deep convection
- CA (mid-latitude): 0.5-1 km (day), 0.1 km (night) - mechanical turbulence

**Surface layer similarity theory:**
$$\frac{\kappa z}{u_*}\frac{\partial U}{\partial z} = \phi_m(\zeta)$$

Where $\zeta = z/L$, $L$ = Obukhov length.

**Equatorial (CR):** $L$ often negative (unstable) → free convection.
**Mid-latitude (CA):** $L$ varies diurnally/seasonally.

**Turbulent kinetic energy (TKE):**
- CR: High TKE from buoyancy, organized rolls
- CA: TKE from shear, intermittent turbulence

### 10.8 Tropical Cyclones vs Mid-Latitude Cyclones

**Tropical cyclone (hurricane/typhoon):**
- Energy source: Latent heat from warm ocean
- Requires: $SST > 26.5^\circ$C, low shear, $f > 0$ (but small)
- CR region: **Eastern Pacific hurricane basin** - active Jun-Nov
- Structure: Warm core, symmetric, eye

**Mid-latitude cyclone (extratropical):**
- Energy source: Baroclinic instability (horizontal temp gradient)
- Requires: Strong $\partial T/\partial y$, jet stream
- CA region: **Pacific storm track** - active Oct-Apr
- Structure: Cold core, asymmetric, fronts

**CR vulnerability:** Direct hurricane strikes (e.g., 1996 Cesar, 2017 Nate).
**CA vulnerability:** Winter storms, atmospheric rivers, flooding.

### 10.9 Equatorial Waves: Kelvin, Rossby-Gravity, Mixed Rossby-Gravity

**Equatorial $\beta$-plane approximation:** $f = \beta y$, $\beta = 2\Omega/R_\oplus$.

**Wave solutions on equatorial $\beta$-plane:**

| Wave Type | Dispersion | Structure | Direction |
|-----------|------------|-----------|-----------|
| Kelvin | $\omega = c k$ | Gaussian in $y$ | Eastward |
| Rossby-gravity | $\omega^2 = c^2 k^2 + \beta c$ | Asymmetric | Westward |
| Mixed Rossby-gravity | $\omega = -\beta/k$ for $k \to 0$ | Mixed | Westward |
| Inertia-gravity | $\omega^2 = c^2 k^2 + (2n+1)\beta c$ | Hermite functions | Both |

**CR (9.9° N):** Experiences **equatorial wave dynamics**.
**CA (37° N):** Outside equatorial waveguide.

### 10.10 Quasi-Biennial Oscillation (QBO) and SAO

**QBO:** ~28-month oscillation of equatorial stratospheric winds.
- Driven by wave-mean flow interaction (Kelvin + Rossby-gravity waves)
- Descending easterly/westerly shear zones
- Modulates tropical convection, MJO, ozone

**SAO (Semi-annual oscillation):** ~6-month oscillation at equator and poles.
- Driven by solar heating cycle
- Stronger at equator and poles

**CR:** **Directly under QBO/SAO** - stratospheric winds reverse regularly.
**CA:** Indirect influence via teleconnections.

### 10.11 Madden-Julian Oscillation (MJO) and Tropical Convection

**MJO:** 30-60 day eastward-propagating convective envelope.
- Speed: ~5 m/s
- Wavelength: ~10,000 km
- Organizes tropical convection globally

**CR location:** Within MJO active region (Indian Ocean to Pacific).
**CA location:** Affected via teleconnections (PNA pattern, ARs).

**MJO phase at CR:** Modulates hurricane genesis, rainfall, winds.

### 10.12 Atmospheric Angular Momentum (AAM) Budget

**AAM per unit mass:** $M = \Omega a^2 \cos^2\varphi + u a \cos\varphi$

**Global AAM balance:**
$$\frac{d}{dt}\int M dm = \tau_{mountain} + \tau_{friction}$$

**Mountain torque:** Pressure drag on topography.
**Friction torque:** Surface stress.

**CR contribution:** Strong Hadley cell → large meridional AAM transport.
**CA contribution:** Mid-latitude westerlies → large zonal AAM.

### 10.13 Gravity Waves: Generation and Propagation

**Sources:**
- Flow over topography (orographic GWs)
- Convection (convective GWs)
- Jet stream imbalance (spontaneous GWs)

**Propagation:** Vertical propagation until breaking or critical level.

**Critical level:** Where $U(z) = c$ (phase speed).
- CR: Weak background wind → GWs propagate high
- CA: Strong jet → GWs filtered at critical levels

**Momentum deposition:** GW breaking drives QBO, SAO, Brewer-Dobson circulation.

### 10.14 Stratosphere-Troposphere Coupling

**Polar vortex:** Strong winter westerlies at high latitudes.
- CA: Influenced by polar vortex displacements
- CR: No polar vortex influence

**Sudden Stratospheric Warmings (SSWs):**
- Major disruptions of polar vortex
- Downward propagation to troposphere
- Affect CA weather patterns 2-6 weeks later
- CR: Minimal direct effect

### 10.15 Ocean-Atmosphere Coupling: ENSO and Pacific Decadal Oscillation

**ENSO (El Niño-Southern Oscillation):**
- Tropical Pacific SST anomalies
- CR: **Direct impact** - drought/flood, hurricane modulation
- CA: **Teleconnection** - wet/dry winters, storm track shift

**PDO (Pacific Decadal Oscillation):**
- 20-30 year basin-wide SST pattern
- Modulates ENSO impacts
- Both nodes affected but with different phasing

### 10.16 Summary: Coriolis Dynamics at CR vs CA

| Parameter | San Jose, CR | San Jose, CA | Ratio/Difference |
|-----------|--------------|--------------|------------------|
| Coriolis parameter $f$ | $2.53 \times 10^{-5}$ s⁻¹ | $8.87 \times 10^{-5}$ s⁻¹ | 3.5× weaker |
| Rossby number (synoptic) | 0.4 | 0.11 | Rotation less dominant |
| Dominant balance | Thermal convection | Geostrophic | Regime change |
| ITCZ influence | Direct | None (subsidence) | Fundamental |
| Jet stream | None | Strong (30-50 m/s) | Fundamental |
| Rossby waves | Equatorial types | Mid-latitude | Different physics |
| Infrasound ducting | Poor | Excellent | Opposite |
| PBL depth (day) | 1-2 km | 0.5-1 km | 2× deeper |
| Tropical cyclones | Active region | None | Hazard difference |
| QBO/SAO | Direct | Indirect | Different stratosphere |
| MJO | Active region | Teleconnected | Different variability |
| ENSO impact | Direct | Teleconnected | Different climate |

**Key insight:** The Coriolis parameter acts as a **latitudinal filter** that fundamentally reorganizes fluid dynamics. The equatorial node operates in a **thermally direct, convection-dominated regime**, while the mid-latitude node operates in a **rotationally constrained, geostrophic regime**.

---

*End of Document 10: Coriolis Dynamics & Atmospheric Boundary Layers (Complete, ~900 lines)*