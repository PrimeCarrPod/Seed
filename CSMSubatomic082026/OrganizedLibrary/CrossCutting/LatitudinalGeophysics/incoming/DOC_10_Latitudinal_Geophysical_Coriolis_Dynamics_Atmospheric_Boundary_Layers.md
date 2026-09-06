# Document 10: Coriolis Dynamics & Atmospheric Boundary Layers
## Latitudinal Geophysical Effects Comparison - Deep Technical Expansion

---

**Document 10 of 17** | **Target: 900 lines**

---

### 10.1 Introduction: Rotation and Atmospheric Motion

The Coriolis force, arising from Earth's rotation, fundamentally organizes atmospheric circulation. Its magnitude varies with latitude as $f = 2\Omega\sin\varphi$, creating a dramatic contrast between equatorial and mid-latitude dynamics. At the equator, $f \to 0$, allowing direct thermal convection (Hadley cell). At mid-latitudes, $f$ is large, enforcing geostrophic balance and enabling baroclinic instability.

**Comparative Node Parameters:**

| Parameter | San Jose, CR (Node A) | San Jose, CA (Node B) |
|-----------|----------------------|----------------------|
| Latitude | 9.93° N | 37.34° N |
| Coriolis parameter $f$ | $2.53 \times 10^{-5}$ s⁻¹ | $8.37 \times 10^{-5}$ s⁻¹ |
| $\beta = df/dy$ | $2.26 \times 10^{-11}$ m⁻¹s⁻¹ | $1.62 \times 10^{-11}$ m⁻¹s⁻¹ |
| Rossby radius $L_R$ | ~1000 km | ~300 km |
| Dominant regime | Convective/Hadley | Baroclinic/geostrophic |
| ITCZ influence | Direct | Remote |

### 10.2 Coriolis Parameter and Rotating Frame Dynamics

#### 10.2.1 Coriolis Parameter Definition

**Coriolis parameter:** $f = 2\Omega\sin\varphi$
- $\Omega = 7.2921150 \times 10^{-5}$ rad/s (Earth's rotation rate)
- $\varphi$ = geographic latitude

**Meridional gradient ($\beta$-plane approximation):**
$$\beta = \frac{df}{dy} = \frac{2\Omega\cos\varphi}{R_\oplus}$$

Where $y = R_\oplus \varphi$ is northward distance.

**At CR (9.93° N):** 
- $f = 2.53 \times 10^{-5}$ s⁻¹
- $\beta = 2.26 \times 10^{-11}$ m⁻¹s⁻¹

**At CA (37.34° N):**
- $f = 8.37 \times 10^{-5}$ s⁻¹
- $\beta = 1.62 \times 10^{-11}$ m⁻¹s⁻¹

**Ratio CA/CR:** $f_{CA}/f_{CR} \approx 3.3$ (Coriolis force 3.3× stronger at CA)

#### 10.2.2 Equations of Motion in Rotating Frame

**Horizontal momentum equations (pressure coordinates):**
$$\frac{Du}{Dt} - fv = -\frac{\partial\Phi}{\partial x} + F_x$$
$$\frac{Dv}{Dt} + fu = -\frac{\partial\Phi}{\partial y} + F_y$$

Where $u,v$ = zonal/meridional wind, $\Phi$ = geopotential, $F$ = friction.

**Vector form:** $\frac{D\mathbf{v}}{Dt} + f\mathbf{k} \times \mathbf{v} = -\nabla\Phi + \mathbf{F}$

#### 10.2.3 Rossby Number: Flow Regime Classification

**Rossby number:** $Ro = \frac{U}{fL}$

Where $U$ = characteristic velocity, $L$ = horizontal length scale.

| Flow Type | Typical $U$ | Typical $L$ | $Ro$ at CR | $Ro$ at CA | Regime |
|-----------|-------------|-------------|------------|------------|--------|
| Hadley cell | 5 m/s | 3000 km | 0.07 | 0.02 | Rotation important |
| Trade winds | 10 m/s | 1000 km | 0.4 | 0.12 | Rotation moderate |
| ITCZ convection | 1 m/s | 100 km | 0.4 | 1.2 | CR: rot. mod., CA: rot. dom. |
| Mesoscale conv. | 10 m/s | 20 km | 19.7 | 5.9 | Rotation weak |
| Tornado | 50 m/s | 1 km | 1970 | 597 | Rotation negligible |
| Synoptic cyclone | 15 m/s | 1000 km | 0.6 | 0.18 | Rotation dominant at CA |

**Key insight:** At CR, mesoscale and smaller flows are largely **non-rotational** ($Ro \gg 1$). At CA, even mesoscale flows feel rotation ($Ro \sim 1-10$).

### 10.3 Hadley Cell: Equatorial Thermal Convection

#### 10.3.1 Hadley Cell Dynamics

**Direct thermal circulation:** Warm air rises at ITCZ, moves poleward aloft, sinks in subtropics, returns equatorward as trade winds.

**Angular momentum conservation (upper branch):**
$$u = \Omega R_\oplus \frac{\sin^2\varphi}{\cos\varphi} \quad \text{(inviscid limit)}$$

**Subtropical jet:** Forms at poleward edge of Hadley cell (~30° latitude).
- Maximum zonal wind: $u_{max} \approx \Omega R_\oplus \tan^2\varphi_H$
- Where $\varphi_H \approx 30°$ = Hadley cell extent

**Hadley cell extent (Held-Hou theory):**
$$\varphi_H \approx \left(\frac{5}{3}\frac{gH\Delta\theta}{\Omega^2 R_\oplus^2 \theta_0}\right)^{1/2} \approx 30°-35°$$

Where $H$ = tropopause height, $\Delta\theta$ = equator-pole potential temperature difference.

#### 10.3.2 CR: Deep Within Hadley Cell

**Latitude 9.93° N:** Well within ascending branch (ITCZ).

**Vertical motion:** $\omega \approx -0.1$ to $-0.5$ Pa/s (rising)
**Zonal wind:** Near surface: easterly trades (~5 m/s)
Upper troposphere: westerly (~10 m/s)

**Meridional wind:** Surface: southerly (cross-equatorial flow)
Upper: northerly (poleward outflow)

**Convective available potential energy (CAPE):** > 2000 J/kg (high)
**Precipitation:** > 3000 mm/yr (tropical wet)

#### 10.3.3 CA: Poleward of Hadley Cell

**Latitude 37.34° N:** In descending branch / mid-latitude transition.

**Vertical motion:** $\omega \approx +0.01$ Pa/s (weak subsidence)
**Zonal wind:** Surface: westerly (~5 m/s)
Upper troposphere: strong westerly jet (~30-50 m/s)

**Meridional wind:** Variable, dominated by eddies

**CAPE:** < 1000 J/kg (moderate)
**Precipitation:** ~400 mm/yr (Mediterranean climate)

### 10.4 ITCZ Dynamics: Convergence Zone Migration

#### 10.4.1 ITCZ Position and Seasonal Migration

**ITCZ definition:** Intertropical Convergence Zone - where trade winds converge, maximum convection.

**Seasonal position:**
- Boreal summer (Jul): ~10° N (over CR)
- Boreal winter (Jan): ~5° S (south of CR)
- **Amplitude:** ~15° latitude

**CR (9.93° N):** Under ITCZ for ~6 months/year (May-Nov)
**CA (37.34° N):** Never under ITCZ

#### 10.4.2 ITCZ Dynamics: Energetic Constraints

**Energy flux equator (EFE):** Latitude where net atmospheric energy transport crosses zero.

**ITCZ ≈ EFE** (within ~1-2°)

**Net energy input:** $F_{net} = R_{TOA} - \nabla \cdot \mathbf{F}_{atm}$

Where $R_{TOA}$ = top-of-atmosphere radiative flux, $\mathbf{F}_{atm}$ = atmospheric energy transport.

**CR:** Strongly positive $F_{net}$ (energy surplus) → convection
**CA:** Near zero/negative $F_{net}$ → subsidence

#### 10.4.3 Double ITCZ Problem and CR

**Model bias:** Many GCMs produce double ITCZ (symmetric about equator).
**Observations:** Single ITCZ, usually north of equator (ocean heat transport asymmetry).

**CR location:** Sensitive to ITCZ position errors in models.
- If ITCZ too far south: CR gets less rain
- If double ITCZ: CR gets split rainy seasons

### 10.5 Geostrophic Balance and Mid-Latitude Dynamics

#### 10.5.1 Geostrophic Wind

**Geostrophic balance (mid-latitudes, $Ro \ll 1$):**
$$f\mathbf{k} \times \mathbf{v}_g = -\nabla\Phi$$

**Components:**
$$u_g = -\frac{1}{f}\frac{\partial\Phi}{\partial y}, \quad v_g = \frac{1}{f}\frac{\partial\Phi}{\partial x}$$

**At CA ($f = 8.37 \times 10^{-5}$ s⁻¹):** Strong geostrophic balance
**At CR ($f = 2.53 \times 10^{-5}$ s⁻¹):** Weak geostrophic balance, ageostrophic flow dominant

#### 10.5.2 Thermal Wind Balance

**Vertical shear of geostrophic wind:**
$$\frac{\partial\mathbf{v}_g}{\partial z} = \frac{g}{fT}\mathbf{k} \times \nabla T$$

**Integrated form:**
$$\mathbf{v}_g(p) - \mathbf{v}_g(p_0) = \frac{R}{f}\int_{p_0}^p \frac{\mathbf{k} \times \nabla T}{p} dp$$

**Jet stream formation:** Strong meridional temperature gradient → strong vertical shear → jet.

**At CA:** Strong $\nabla T$ (polar-equator) → strong jet (~40 m/s at 250 hPa)
**At CR:** Weak $\nabla T$ → weak upper-level winds

#### 10.5.3 Quasi-Geostrophic (QG) Theory

**QG potential vorticity:**
$$q = \nabla^2\psi + f + \frac{\partial}{\partial p}\left(\frac{f_0^2}{\sigma}\frac{\partial\psi}{\partial p}\right)$$

Where $\psi = \Phi/f_0$ = streamfunction, $\sigma$ = static stability.

**QG omega equation:**
$$\left(\nabla^2 + \frac{f_0^2}{\sigma}\frac{\partial^2}{\partial p^2}\right)\omega = \frac{f_0}{\sigma}\frac{\partial}{\partial p}\left[\mathbf{v}_g \cdot \nabla\left(\nabla^2\psi + f\right)\right] + \frac{R}{\sigma p}\nabla^2\left[\mathbf{v}_g \cdot \nabla T\right]$$

**Forces vertical motion:** Vorticity advection + temperature advection.

**At CA:** QG theory highly accurate ($Ro \ll 1$)
**At CR:** QG theory breaks down ($Ro \sim 1$), need primitive equations.

### 10.6 Planetary Waves: Rossby Wave Dynamics

#### 10.6.1 Rossby Wave Dispersion Relation

**Barotropic Rossby waves (on $\beta$-plane):**
$$\omega = Uk - \frac{\beta k}{k^2 + l^2}$$

Where $U$ = mean zonal flow, $k,l$ = zonal/meridional wavenumbers.

**Phase speed:** $c_p = \omega/k = U - \frac{\beta}{k^2 + l^2}$

**Group velocity:** $c_g = \frac{\partial\omega}{\partial k} = U + \frac{\beta(k^2 - l^2)}{(k^2 + l^2)^2}$

**Key property:** Rossby waves propagate **westward relative to mean flow** ($c_p < U$).

#### 10.6.2 Baroclinic Rossby Waves

**Two-layer model dispersion:**
$$\omega = Uk - \frac{\beta k}{k^2 + l^2 + L_D^{-2}}$$

Where $L_D = \frac{NH}{f_0}$ = Rossby deformation radius.

**At CR:** $L_D \approx 1000$ km (large, weak rotation)
**At CA:** $L_D \approx 300$ km (smaller, strong rotation)

#### 10.6.3 Stationary Rossby Waves (Forced by Topography/Heating)

**Stationary wave condition:** $\omega = 0 \Rightarrow U = \frac{\beta}{k^2 + l^2 + L_D^{-2}}$

**Typical wavenumbers:** $k \approx 1-3$ (planetary scale)

**Response to tropical heating (CR region):**
- Generates Rossby wave train propagating poleward and eastward
- **Pacific-North American (PNA) pattern:** Major teleconnection affecting CA

**CA response to CR heating:** 
- Tropical convection anomalies → Rossby wave source
- Wave train reaches CA in ~7-10 days
- Modulates CA weather (storm track, precipitation)

### 10.7 Jet Stream and Storm Tracks

#### 10.7.1 Subtropical Jet vs Polar Front Jet

**Subtropical jet:** At ~30° N, driven by Hadley cell angular momentum conservation.
- Core: ~200 hPa, 30-40 m/s
- Position: Relatively fixed

**Polar front jet:** At ~45-60° N, driven by baroclinicity.
- Core: ~250 hPa, 40-60 m/s
- Position: Variable, follows temperature gradient

**CA (37° N):** Under **subtropical jet** influence in winter, **polar jet** in summer.

#### 10.7.2 Storm Track Dynamics

**Storm track:** Region of maximum synoptic eddy activity.

**Baroclinic instability (Eady model):**
$$\sigma_{max} = 0.31 \frac{f}{N} \left|\frac{\partial u}{\partial z}\right|$$

Where $N$ = Brunt-Väisälä frequency, $\partial u/\partial z$ = vertical shear.

**Maximum growth rate:**
- At CA: $\sigma_{max} \approx 0.5$ day⁻¹ (e-folding time ~2 days)
- At CR: $\sigma_{max} \approx 0.1$ day⁻¹ (e-folding time ~10 days)

**Storm track position:** Near maximum $\partial T/\partial y$ (baroclinic zone).
**CA:** In primary Pacific storm track (Jan: ~35° N, Jul: ~50° N)

#### 10.7.3 Eddy-Mean Flow Interaction

**Eliassen-Palm flux:** $\mathbf{F} = \left(-\overline{u'v'}, \frac{f}{\rho_0}\frac{\partial}{\partial z}\left(\frac{\rho_0}{N^2}\overline{v'\theta'}\right)\right)$

**Mean flow acceleration:** $\frac{\partial \bar{u}}{\partial t} = -\frac{1}{\rho_0}\nabla \cdot \mathbf{F}$

**At CA:** Eddy momentum flux convergence maintains jet
**At CR:** Eddy fluxes weak, mean flow driven by Hadley cell

### 10.8 Atmospheric Boundary Layer: Equatorial vs Mid-Latitude

#### 10.8.1 Boundary Layer Equations

**Horizontal momentum (steady, horizontally homogeneous):**
$$f\mathbf{k} \times \mathbf{v} = -\frac{1}{\rho}\nabla p + \frac{\partial}{\partial z}\left(K_m \frac{\partial\mathbf{v}}{\partial z}\right)$$

Where $K_m$ = eddy viscosity.

**Ekman layer solution (constant $K_m$):**
$$\mathbf{v}(z) = \mathbf{v}_g \left[1 - e^{-z/d}\left(\cos\frac{z}{d} + \sin\frac{z}{d}\right)\right] + \text{cross-isobar component}$$

**Ekman depth:** $d = \sqrt{\frac{2K_m}{|f|}}$

**At CR ($f = 2.5 \times 10^{-5}$):** $d \approx 500$ m (for $K_m = 20$ m²/s)
**At CA ($f = 8.4 \times 10^{-5}$):** $d \approx 300$ m (for $K_m = 20$ m²/s)

**Cross-isobar angle:** $\alpha = 45°$ (at surface, neutral stability)

#### 10.8.2 Monin-Obukhov Similarity Theory

**Surface layer scaling:**
$$\frac{\kappa z}{u_*}\frac{\partial u}{\partial z} = \phi_m(\zeta), \quad \zeta = \frac{z}{L}$$

Where $u_* = \sqrt{\tau/\rho}$ = friction velocity, $L$ = Obukhov length.

**Stability functions:**
- Unstable ($\zeta < 0$): $\phi_m = (1 - 16\zeta)^{-1/4}$
- Stable ($\zeta > 0$): $\phi_m = 1 + 5\zeta$

**Obukhov length:** $L = -\frac{u_*^3}{\kappa g \theta_* / \theta_0}$

**CR (tropical):** Mostly unstable (convection), $L < 0$
**CA (mid-latitude):** Diurnal cycle of stability, $L$ varies sign

#### 10.8.3 Convective Boundary Layer (CBL) at CR

**Mixed layer depth:** $z_i \approx 1-2$ km (daytime)
**Convective velocity scale:** $w_* = \left(\frac{g}{\theta_0} \overline{w'\theta'}_s z_i\right)^{1/3}$

**Typical CR values:** $w_* \approx 2-3$ m/s, $z_i \approx 1500$ m

**Entrainment zone:** Top of CBL, strong gradients, intermittent turbulence.

**Cloud-topped CBL:** Trade wind cumulus (shallow, 1-2 km)
**Deep CBL:** Over land, up to 4-5 km with deep convection

#### 10.8.4 Stable Boundary Layer (SBL) at CA

**Nocturnal SBL:** Forms after sunset, depth ~100-300 m
**Low-level jet (LLJ):** Forms at top of SBL, speed 10-20 m/s
- Inertial oscillation: $u(t) = u_g + (u_0 - u_g)\cos(ft) + v_0\sin(ft)$
- Max speed at $t = \pi/2f \approx 6$ hours after sunset

**CA LLJ:** Strong, frequent (spring/summer)
**CR LLJ:** Weak, less frequent (tropical night less stable)

### 10.9 Gravity Waves: Generation, Propagation, and Dissipation

#### 10.9.1 Gravity Wave Dynamics

**Dispersion relation (hydrostatic, Boussinesq):**
$$\omega^2 = \frac{N^2 k_h^2}{k_h^2 + m^2} + f^2 \frac{m^2}{k_h^2 + m^2}$$

Where $k_h$ = horizontal wavenumber, $m$ = vertical wavenumber, $N$ = Brunt-Väisälä frequency.

**Intrinsic frequency:** $\hat{\omega} = \omega - \mathbf{k}_h \cdot \mathbf{U}$

**Vertical group velocity:** $c_{gz} = \frac{\partial\omega}{\partial m} = \pm \frac{N k_h m}{(k_h^2 + m^2)^{3/2}}$

#### 10.9.2 Generation Mechanisms

| Source | Latitudinal Preference | Typical Parameters |
|--------|------------------------|-------------------|
| Convection | Equatorial (CR) | $\lambda_h \sim 10-100$ km, $\omega \sim N/10$ |
| Orography | Mid-latitude mountains (CA) | $\lambda_h \sim 10-50$ km, stationary |
| Jet/front | Mid-latitude (CA) | $\lambda_h \sim 100-500$ km |
| Tropical cyclones | Tropical (CR) | $\lambda_h \sim 50-200$ km |
| Geostrophic adjustment | Global | $\lambda_h \sim 100-500$ km |

#### 10.9.3 Latitudinal Propagation Differences

**Critical level filtering:** Waves absorbed where $\hat{\omega} = 0$ (Doppler shifted to zero).

**At CR:** Weak mean flow → fewer critical levels, waves propagate higher
**At CA:** Strong jet → many critical levels, wave filtering

**Equatorial trapping:** Equatorial waves (Kelvin, Yanai, Rossby-gravity) trapped near equator.
- **Kelvin wave:** Eastward, $n=0$, no meridional velocity
- **Yanai (mixed Rossby-gravity):** Eastward, $n=1$
- **Equatorial Rossby:** Westward, $n \ge 1$

**CR:** Supports equatorial wave modes
**CA:** Standard mid-latitude gravity waves

#### 10.9.4 Momentum Deposition and Mean Flow Forcing

**Gravity wave drag:** $\frac{\partial \bar{u}}{\partial t} = -\frac{1}{\rho_0}\frac{\partial}{\partial z}(\rho_0 \overline{u'w'})$

**Parameterization (Lindzen-type):**
$$\overline{u'w'}(z) = \overline{u'w'}(z_0) \frac{\rho_0(z_0)}{\rho_0(z)} \exp\left(-\int_{z_0}^z \frac{dz'}{H_{diss}}\right)$$

**Dissipation scale height:** $H_{diss} \approx \frac{c_{gz}}{\gamma}$ where $\gamma$ = dissipation rate.

**QBO (Quasi-Biennial Oscillation):** Driven by equatorial gravity waves
- Period: ~28 months
- CR: Directly affected (equatorial)
- CA: Indirect teleconnection

### 10.10 Sudden Stratospheric Warmings (SSW)

#### 10.10.1 SSW Dynamics

**Definition:** Reversal of polar stratospheric westerlies to easterlies, accompanied by polar temperature increase > 25 K in < 1 week.

**Major warming:** Zonal mean wind at 60° N, 10 hPa reverses.
**Minor warming:** Strong deceleration but no reversal.

**Mechanism:** Planetary wave (wavenumber 1-2) propagation into stratosphere → wave breaking → momentum deposition → mean flow deceleration.

**Wave-mean flow interaction:** $\frac{\partial \bar{u}}{\partial t} = -\frac{1}{\rho_0 a \cos\varphi}\nabla \cdot \mathbf{F}$

#### 10.10.2 SSW Frequency and Predictability

**Frequency:** ~6 major warmings per decade (Northern Hemisphere)
**Season:** November-March (peak Jan-Feb)
**Precursors:** Strong tropospheric wave activity, weak vortex

**CA connection:** SSWs shift Pacific storm track, affect CA precipitation.
- Post-SSW: Negative NAO/AO → wetter CA (sometimes)
- Stratosphere-troposphere coupling: 2-6 week lag

**CR connection:** Minimal direct effect (equatorial)
- QBO modulation: QBO easterly phase favors SSWs
- CR in QBO region → indirect link

### 10.11 ENSO and PDO: Tropical-Extratropical Coupling

#### 10.11.1 ENSO Dynamics

**El Niño:** Warm SST in eastern equatorial Pacific
**La Niña:** Cool SST in eastern equatorial Pacific

**ENSO cycle:** 2-7 year period, irregular

**Bjerknes feedback:**
1. Weak trades → reduced upwelling → warm SST
2. Warm SST → weakened Walker circulation → weaker trades
3. Positive feedback

**CR (eastern Pacific side):** Directly affected by ENSO
- El Niño: Warmer, wetter (weakened trades, enhanced convection)
- La Niña: Cooler, drier (stronger trades, suppressed convection)

#### 10.11.2 ENSO Teleconnections to CA

**Atmospheric bridge:** Tropical heating → Rossby wave train → mid-latitude response.

**PNA pattern:** Pacific-North American teleconnection
- El Niño: Deepened Aleutian low, split jet, wet CA
- La Niña: Weakened Aleutian low, amplified ridge, dry CA

**CA precipitation correlation with Niño 3.4:**
- DJF (winter): $r \approx 0.4-0.6$ (El Niño = wet)
- JJA (summer): $r \approx -0.2$ (weak)

#### 10.11.3 Pacific Decadal Oscillation (PDO)

**PDO pattern:** ENSO-like SST pattern but decadal timescale (20-30 yr).
**Positive PDO:** Warm eastern Pacific, cool central/western
**Negative PDO:** Cool eastern Pacific, warm central/western

**PDO-ENSO interaction:** Positive PDO enhances El Niño teleconnections.

**CR:** Direct SST influence (eastern Pacific)
**CA:** Storm track modulation

**Regime shifts:** 1976/77 (positive), 1998/99 (negative), 2014 (positive)

### 10.12 Tropical Cyclones and Mid-Latitude Cyclones

#### 10.12.1 Tropical Cyclone Formation (CR Region)

**Genesis requirements:**
1. SST > 26.5°C
2. Low vertical shear (< 10 m/s)
3. Coriolis parameter $f > 0$ (min ~5° latitude)
4. Pre-existing disturbance
5. High mid-level humidity

**CR (9.93° N):** Favorable for genesis (Eastern Pacific basin)
- Season: May-Nov (peak Sep)
- Typical tracks: West-northwest, away from CR
- Direct hits: Rare but possible

**Genesis potential index (GPI):**
$$GPI \propto |\eta|^{3/2} \left(\frac{RH}{50}\right)^3 \left(\frac{V_{pot}}{70}\right)^3 (1+0.1V_{shear})^{-2}$$

Where $\eta = f + \zeta$ = absolute vorticity.

#### 10.12.2 Mid-Latitude Cyclone (CA Region)

**Baroclinic instability:** Primary energy source (APE → KE)

**Cyclone life cycle (Shapiro-Keyser / Norwegian model):**
1. **Frontogenesis:** Temperature gradient sharpening
2. **Occlusion:** Cold front catches warm front
3. **Maturation:** Maximum intensity
4. **Dissipation:** Cut off from thermal gradient

**Explosive cyclogenesis (bomb):** $\Delta p \ge 24$ hPa in 24 hr at 60° N
**CA:** Affected by Gulf of Alaska bombs, Pineapple Express events

#### 10.12.3 Extratropical Transition

**Tropical cyclone → mid-latitude cyclone:**
- Moves poleward, encounters baroclinic zone
- Interacts with upper-level trough
- Re-intensifies as extratropical cyclone

**CR to CA pathway:** Eastern Pacific TC remnants occasionally reach CA as moisture plumes.

### 10.13 Acoustic and Infrasonic Wave Propagation

#### 10.13.1 Infrasonic Ducting in Stratosphere

**Sound speed profile:** $c(z) = \sqrt{\gamma R T(z)}$

**Stratospheric duct:** $T$ increases with height → $c$ increases → upward refraction back down.
**Thermospheric duct:** $T$ increases further → another duct.

**Propagation range:** 1000-5000 km for stratospheric duct.

**Latitudinal variation:**
- **CR:** Equatorial stratosphere warmer → stronger duct
- **CA:** Mid-latitude stratosphere cooler → weaker duct

**Infrasonic sources:** Volcanoes, bolides, earthquakes, aurora, microbaroms.

#### 10.13.2 Microbaroms

**Source:** Nonlinear interaction of ocean waves (secondary microseism)
**Frequency:** ~0.2 Hz (period ~5 s)
**Propagation:** Global, ducted in stratosphere/thermosphere

**CR:** Strong Pacific + Caribbean sources → high microbarom levels
**CA:** Pacific source only → moderate levels

### 10.14 Numerical Modeling and Data Assimilation

#### 10.14.1 Global Circulation Models (GCMs)

**Horizontal resolution:** 10-100 km (CMIP6: ~100 km)
**Vertical levels:** 50-100 (top at 0.01-0.1 hPa)
**Time step:** 10-30 minutes

**Key parameterizations:**
- Convection (CR: critical, CA: less critical)
- Boundary layer
- Gravity waves
- Clouds and radiation

**CR challenge:** Convection parameterization (grid-scale vs subgrid)
**CA challenge:** Storm track position, blocking frequency

#### 10.14.2 Data Assimilation

**4D-Var:** Minimizes cost function over time window
$$J(\mathbf{x}_0) = \frac{1}{2}(\mathbf{x}_0 - \mathbf{x}_b)^T \mathbf{B}^{-1}(\mathbf{x}_0 - \mathbf{x}_b) + \frac{1}{2}\sum_{i=0}^N (\mathbf{y}_i - \mathcal{H}_i(\mathbf{x}_i))^T \mathbf{R}_i^{-1}(\mathbf{y}_i - \mathcal{H}_i(\mathbf{x}_i))$$

**EnKF (Ensemble Kalman Filter):** Flow-dependent error covariances
$$\mathbf{x}_a = \mathbf{x}_b + \mathbf{K}(\mathbf{y} - \mathcal{H}\mathbf{x}_b), \quad \mathbf{K} = \mathbf{P}_b \mathcal{H}^T (\mathcal{H}\mathbf{P}_b\mathcal{H}^T + \mathbf{R})^{-1}$$

**Latitudinal differences:**
- CR: Dense satellite data (geostationary), sparse in situ
- CA: Dense in situ (radiosondes, aircraft), good satellite

#### 10.14.3 Forecast Skill by Latitude

**Anomaly correlation (500 hPa, 5-day):**
- Tropics (CR): ~0.6-0.7 (limited by convection)
- Mid-latitudes (CA): ~0.8-0.9 (baroclinic waves predictable)
- Poles: ~0.7-0.8

**Tropical predictability limit:** ~2 weeks (intrinsic convection chaos)
**Mid-latitude predictability limit:** ~10-14 days (baroclinic instability)

### 10.15 Comprehensive Comparison Table: CR vs CA

| Parameter | San Jose, CR | San Jose, CA | Difference |
|-----------|--------------|--------------|------------|
| Coriolis $f$ (s⁻¹) | $2.53 \times 10^{-5}$ | $8.37 \times 10^{-5}$ | CA 3.3× |
| $\beta$ (m⁻¹s⁻¹) | $2.26 \times 10^{-11}$ | $1.62 \times 10^{-11}$ | CR 1.4× |
| Rossby radius (km) | ~1000 | ~300 | CR 3.3× |
| Hadley cell regime | Ascending branch | Descending edge | Opposite |
| ITCZ presence | 6 months/yr | Never | — |
| Geostrophic balance | Weak | Strong | Regime change |
| Trade winds | Easterly, steady | Variable | CR steady |
| Jet stream | Weak subtropical | Strong polar/subtrop | CA strong |
| Storm track | None | Pacific primary | CA active |
| CAPE (J/kg) | > 2000 | < 1000 | CR 2×+ |
| CBL depth (m) | 1500 | 1000 (day) | CR deeper |
| LLJ frequency | Low | High | CA frequent |
| Gravity waves | Convection-dominated | Orographic/jet | Different source |
| Equatorial waves | Kelvin, Yanai, ER | None | CR unique |
| SSW impact | Indirect (QBO) | Direct (storm track) | CA direct |
| ENSO sensitivity | High (local SST) | High (teleconnect) | Both high |
| TC risk | Moderate (EPac basin) | Very low | CR higher |
| Forecast skill (5d) | 0.6-0.7 | 0.8-0.9 | CA better |

### 10.16 Cross-Document Connections

**Document 6 (Rotational Hydrodynamics):** $f = 2\Omega\sin\varphi$ derived from rotation; equatorial bulge affects atmospheric mass distribution.
**Document 8 (Cosmic Rays):** Ionization affects atmospheric conductivity → global circuit → cloud microphysics → convection.
**Document 9 (Schumann):** Lightning (convection) → Schumann resonances; CR chimney dominates global signal.
**Document 11 (Tectonics):** Topography (from tectonics) forces stationary waves, orographic gravity waves.
**Document 14 (Thermodynamics):** Heat transport by Hadley cell/eddies sets equator-pole gradient.
**Document 16 (Seismic):** Infrasound from earthquakes propagates in atmospheric waveguides.

### 10.17 Future Directions: High-Resolution Modeling and Observations

#### 10.17.1 Convection-Permitting Models (CPM)

**Resolution:** < 4 km (explicitly resolves deep convection)
**Benefits:** Removes convection parameterization, improves tropical precipitation, gravity waves.
**Projects:** DYAMOND, nextGEMS, EERIE.

**CR benefit:** Huge (convection is dominant process)
**CA benefit:** Moderate (convection less dominant)

#### 10.17.2 Global Storm-Resolving Models (GSRM)

**Resolution:** 1-3 km globally
**Examples:** NICAM, ICON, SAM, FV3, MPAS
**Computational cost:** ~100× conventional GCM

**Exascale computing:** Enables multi-decadal GSRM simulations.

#### 10.17.3 Observational Advances

**Aeolus (ESA):** Doppler wind lidar (2018-2023) - first global wind profiles
**EarthCARE (ESA/JAXA, 2024):** Cloud-aerosol-radiation + Doppler radar
**GeoXO (NOAA, 2030s):** Geostationary hyperspectral IR + lightning mapper
**AOS (NASA, 2030s):** Atmosphere Observing System - clouds, convection, precipitation

**Targeted CR observations:** Field campaigns (OTREC, EUREC⁴A) for tropical convection.

### 10.18 Detailed Gravity Wave Theory and Parameterization

#### 10.18.1 Full Gravity Wave Dispersion and Polarization Relations

**Compressible, rotating, stratified fluid (Eckart 1960):**
$$\omega^2 = \frac{(N^2 - \omega^2)(k_h^2 + l^2) + f^2 m^2}{k_h^2 + l^2 + m^2 + \frac{1}{4H^2}}$$

Where $H = RT/g$ = density scale height.

**Intrinsic frequency (Doppler shifted):**
$$\hat{\omega} = \omega - kU - lV$$

**Polarization relations:**
$$\frac{u'}{w'} = \frac{k(\omega^2 - f^2) + i\omega l f}{m(\omega^2 - f^2)}$$
$$\frac{v'}{w'} = \frac{l(\omega^2 - f^2) - i\omega k f}{m(\omega^2 - f^2)}$$
$$\frac{\theta'}{w'} = \frac{N^2}{g} \frac{\omega}{\omega^2 - f^2}$$
$$\frac{p'}{w'} = -\frac{i\rho_0}{m}(\omega^2 - f^2) \frac{k^2+l^2}{\omega^2 - f^2 - N^2 k_h^2/(k_h^2+m^2)}$$

**Elliptical hodographs:** Particle trajectories are ellipses in vertical plane.

#### 10.18.2 Critical Level Absorption

**Critical level:** Where $\hat{\omega} = 0$ (intrinsic frequency zero)

**Absorption condition:** Wave amplitude grows as $\rho^{-1/2}$, then breaks.

**Wave action flux conservation:**
$$\frac{\partial}{\partial t}\left(\frac{E}{\hat{\omega}}\right) + \nabla \cdot \left(\frac{E}{\hat{\omega}}\mathbf{c}_g\right) = 0$$

Where $E$ = wave energy density.

**Momentum flux:** $\overline{u'w'} = \frac{E}{\hat{\omega}} k$

**At critical level:** $\hat{\omega} \to 0$ → $E \to \infty$ (breaks down, nonlinear absorption).

**Latitudinal filtering:** 
- CR: Weak zonal winds → fewer critical levels for equatorial waves
- CA: Strong subtropical/polar jets → many critical levels, selective filtering

#### 10.18.3 Non-Orographic Gravity Wave Parameterization

**Source spectrum (convection):**
$$F(k, \omega) = F_0 \exp\left(-\frac{k^2}{2k_0^2} - \frac{(\omega - \omega_0)^2}{2\omega_0^2}\right)$$

**Typical convective source (CR):**
- $k_0 \approx 10^{-5}$ m⁻¹ ($\lambda_x \approx 600$ km)
- $\omega_0 \approx 10^{-3}$ s⁻¹ ($f \approx 0.16$ Hz)
- $F_0 \approx 0.01$ Pa (momentum flux at source)

**Source spectrum (jet/front, CA):**
- $k_0 \approx 3 \times 10^{-5}$ m⁻¹ ($\lambda_x \approx 200$ km)
- $\omega_0 \approx 5 \times 10^{-4}$ s⁻¹
- $F_0 \approx 0.005$ Pa

**Saturation and breaking:** Amplitude limited by convective instability ($Ri < 1/4$) or shear instability.

**Parameterized drag:** Applied at model levels where waves break.

#### 10.18.4 Orographic Gravity Wave Drag

**Linear theory (Smith 1980):** Flow over 2D ridge $h(x) = h_0 \exp(-x^2/a^2)$

**Surface momentum flux:**
$$\tau_0 = -\frac{\pi}{2} \rho_0 U^2 N h_0^2 \frac{k}{a} \quad \text{(for } Na/U \gg 1\text{)}$$

**Vertical propagation:** Flux constant until breaking.

**Breaking level:** Where $Ri = \frac{N^2}{(\partial u/\partial z)^2} < 1/4$

**Drag profile:**
$$\frac{\partial u}{\partial t} = -\frac{1}{\rho_0}\frac{\partial \tau}{\partial z}$$

**CA orography:** Sierra Nevada, Coast Ranges, Rockies → strong orographic GW drag
**CR orography:** Central American cordillera → moderate orographic GW drag

### 10.19 Sudden Stratospheric Warmings: Detailed Dynamics

#### 10.19.1 Wave-Mean Flow Interaction Theory

**Transformed Eulerian Mean (TEM) equations:**
$$\frac{\partial \bar{u}}{\partial t} - f\bar{v}^* = \frac{1}{\rho_0}\frac{\partial}{\partial z}\left(\rho_0 \frac{\overline{v'\theta'}}{\partial\bar{\theta}/\partial z}\right) + \text{friction}$$

Where $\bar{v}^* = \bar{v} - \frac{1}{\rho_0}\frac{\partial}{\partial z}(\rho_0 \frac{\overline{v'\theta'}}{\partial\bar{\theta}/\partial z})$ = residual circulation.

**Eliassen-Palm flux divergence:**
$$\nabla \cdot \mathbf{F} = \rho_0 a \cos\varphi \left[ \frac{\partial}{\partial y}\left(\frac{F_y}{\rho_0 a \cos\varphi}\right) + \frac{\partial}{\partial z}\left(\frac{F_z}{\rho_0 a \cos\varphi}\right) \right]$$

**Mean flow acceleration:**
$$\frac{\partial \bar{u}}{\partial t} = -\frac{1}{\rho_0 a \cos\varphi}\nabla \cdot \mathbf{F}$$

**During SSW:** $\nabla \cdot \mathbf{F} > 0$ (convergence) in polar stratosphere → $\partial \bar{u}/\partial t < 0$ (deceleration).

#### 10.19.2 SSW Life Cycle

**Stage 1: Preconditioning (1-2 weeks before)**
- Planetary wave activity increases in troposphere
- Wave-1 and/or wave-2 amplify
- Stratospheric vortex weakens, elongates

**Stage 2: Onset (2-5 days)**
- Wave breaking in surf zone
- EP flux convergence peaks
- Zonal wind reverses at 10 hPa, 60° N
- Polar temperature rises 30-50 K

**Stage 3: Mature (5-15 days)**
- Vortex splits (wave-2) or displaces (wave-1)
- Easterlies establish in polar stratosphere
- Downward propagation of anomalies

**Stage 4: Recovery (2-8 weeks)**
- Radiative cooling restores westerlies
- Vortex reforms
- Downward influence on troposphere

#### 10.19.3 Downward Coupling to Troposphere

**Mechanism:** Stratospheric anomalies persist longer (radiative time scale ~weeks) → downward influence via:
1. **Wave reflection:** Altered refractive index
2. **PV anomalies:** Potential vorticity anomalies descend
3. **Surface pressure:** NAM/NAO response

**Surface signal (NAM - Northern Annular Mode):**
$$\text{NAM} = \frac{1}{N}\sum_i \frac{Z_i - \bar{Z}_i}{\sigma_i}$$

**Post-SSW surface impacts (2-6 week lag):**
- Negative NAM: Weaker westerlies, cold air outbreaks
- Shifted storm tracks
- **CA impact:** Increased precipitation (negative NAM → southward jet)
- **CR impact:** Minimal direct effect

**Predictability:** SSWs extend tropospheric predictability to 3-4 weeks.

#### 10.19.4 QBO Modulation of SSWs

**QBO (Quasi-Biennial Oscillation):** Equatorial stratospheric zonal wind oscillation.
- Period: 28 ± 4 months
- Amplitude: ~20-30 m/s
- Phases: Easterly (QBO-E) and Westerly (QBO-W)

**Holton-Tan relationship:**
- **QBO-E:** Weaker polar vortex, more frequent SSWs
- **QBO-W:** Stronger polar vortex, fewer SSWs

**Mechanism:** QBO winds alter planetary wave propagation (critical levels).
- QBO-E: Equatorial easterlies reflect waves poleward
- QBO-W: Equatorial westerlies allow wave transmission

**CR connection:** CR at 10° N is in QBO region → direct QBO influence on winds
**CA connection:** Indirect via SSW modulation

**Observed:** 70% of SSWs occur during QBO-E phase.

### 10.20 ENSO and PDO: Comprehensive Teleconnection Physics

#### 10.20.1 ENSO Atmospheric Response: Gill Model

**Linear shallow water equations on equatorial $\beta$-plane:**
$$\frac{\partial u}{\partial t} - \beta y v = -g\frac{\partial h}{\partial x} - \epsilon u + Q_x$$
$$\frac{\partial v}{\partial t} + \beta y u = -g\frac{\partial h}{\partial y} - \epsilon v + Q_y$$
$$\frac{\partial h}{\partial t} + H\left(\frac{\partial u}{\partial x} + \frac{\partial v}{\partial y}\right) = -\epsilon h + Q$$

**Steady state solution for heat source $Q$ at equator:**
- **Kelvin wave:** Eastward, $v=0$, trapped to equator
- **Rossby waves:** Westward, trapped to equator, symmetric
- **Mixed Rossby-gravity:** Eastward, trapped

**El Niño heating anomaly:** Central/eastern Pacific warming
**Response:** 
- Kelvin wave → easterly anomalies over Atlantic
- Rossby wave → twin cyclones straddling equator
- **PNA pattern:** Rossby wave train to North America

#### 10.20.2 ENSO Diversity: Eastern vs Central Pacific

**Eastern Pacific (EP) El Niño:** Maximum warming near South America (canonical)
**Central Pacific (CP) El Niño (Modoki):** Maximum warming near dateline

**EP El Niño teleconnection to CA:**
- Strong PNA, deep Aleutian low
- Wet Southern CA, dry Pacific NW

**CP El Niño teleconnection to CA:**
- Weaker PNA, shifted ridge
- Less predictable CA precipitation

**CR impact:** Both types affect CR, but EP El Niño has larger local SST anomaly.

#### 10.20.3 PDO Dynamics and ENSO Modulation

**PDO index:** Leading EOF of North Pacific SST (poleward of 20° N)

**PDO pattern:** Horseshoe shape - warm central, cool eastern/western (positive phase)

**Physical mechanisms:**
1. **ENSO-like:** Stochastic atmospheric forcing (Aleutian low) → SST
2. **Oceanic:** Kuroshio/Oyashio extension variability
3. **Reemergence:** Winter mixed layer anomalies persist through summer

**PDO-ENSO interaction:**
- Positive PDO + El Niño: Enhanced teleconnection (constructive interference)
- Negative PDO + La Niña: Enhanced teleconnection
- Opposite phases: Destructive interference

**Regime shifts (observed):**
- 1925: Positive
- 1947: Negative
- 1977: Positive (famous "climate shift")
- 1998: Negative
- 2014: Positive

**Impact on CA precipitation decadal variability:**
- Positive PDO: El Niño teleconnection amplified
- Negative PDO: La Niña teleconnection amplified

#### 10.20.4 Atlantic Multidecadal Oscillation (AMO) and Cross-Basin Links

**AMO:** North Atlantic SST variability (60-80 yr period)

**AMO-ENSO connection:** 
- Positive AMO → La Niña-like mean state
- Atlantic warming → Pacific cooling via Walker circulation

**Impact on CA:** AMO modulates ENSO teleconnection strength.
**Impact on CR:** Caribbean SSTs linked to AMO.

### 10.21 Atmospheric Angular Momentum (AAM) Budget

#### 10.21.1 AAM Components

**Axial AAM per unit area:**
$$M = \frac{1}{g}\int_0^{p_s} u \cos\varphi \, dp = M_\Omega + M_r$$

Where:
- $M_\Omega = \frac{1}{g}\int \Omega R_\oplus \cos^2\varphi \, dp$ = Earth's rotation component
- $M_r = \frac{1}{g}\int u \cos\varphi \, dp$ = relative (wind) component

**Global AAM:** $L_{atm} = \iint M \cos\varphi \, d\varphi d\lambda$

#### 10.21.2 AAM Budget Equation

$$\frac{dL_{atm}}{dt} = \tau_{mountain} + \tau_{friction}$$

**Mountain torque:**
$$\tau_{mountain} = \frac{1}{g}\iint p_s \frac{\partial h}{\partial \lambda} \cos\varphi \, d\varphi d\lambda$$

Where $p_s$ = surface pressure, $h$ = topography.

**Friction torque:**
$$\tau_{friction} = -\frac{1}{g}\iint \tau_s \cos\varphi \, d\varphi d\lambda$$

Where $\tau_s$ = surface stress.

#### 10.21.3 Seasonal and Interannual AAM Variations

**Seasonal cycle:** Peak in January (NH winter), minimum in July
- Amplitude: $\Delta L_{atm} \approx 1.5 \times 10^{25}$ kg·m²/s
- LOD equivalent: $\Delta LOD \approx 1$ ms

**Interannual (ENSO):**
- El Niño: Weaker trades, weaker Hadley → $M_r$ decreases → LOD increases (~0.5 ms)
- La Niña: Stronger trades, stronger Hadley → $M_r$ increases → LOD decreases

**CR contribution:** Strong Hadley cell, large mountain torque from Central American cordillera
**CA contribution:** Westerlies, mountain torque from Rockies/Sierra Nevada

**Latitudinal AAM distribution:**
- Tropics: Easterly $u$ → negative $M_r$
- Mid-latitudes: Westerly $u$ → positive $M_r$
- **Net:** Positive (westerlies dominate)

### 10.22 Stratosphere-Troposphere Coupling: Beyond SSWs

#### 10.22.1 Annular Modes

**NAM (Northern Annular Mode) / AO (Arctic Oscillation):**
- Leading EOF of NH geopotential height
- Positive phase: Strong vortex, poleward jet
- Negative phase: Weak vortex, equatorward jet

**SAM (Southern Annular Mode):**
- SH equivalent
- Positive trend (ozone depletion + GHG)

**Downward propagation:** NAM anomalies propagate from stratosphere to surface in ~2-6 weeks.

#### 10.22.2 Stratospheric Final Warmings

**Spring transition:** Winter westerlies → summer easterlies
- Timing: March-May
- Predictability: 2-3 weeks
- Affects late spring weather

#### 10.22.3 Volcanic and Solar Influences

**Volcanic eruptions (tropical):** Stratospheric aerosol → heating → stronger vortex
- Pinatubo 1991: Stronger vortex for 2 winters
- Fewer SSWs post-eruption

**Solar cycle (11 yr):** UV variability → stratospheric ozone → temperature
- Solar max: Warmer stratosphere, stronger vortex
- Signal: ~1-2 K, detectable in NAM

### 10.23 Tropical-Extratropical Interaction: Rossby Wave Source

#### 10.23.1 Rossby Wave Source (RWS)

**Sardeshmukh-Hoskins RWS:**
$$S = -\nabla \cdot (\mathbf{v} \zeta) - \nabla \cdot (\mathbf{v} f) = -\mathbf{v} \cdot \nabla(\zeta + f) - (\zeta + f)\nabla \cdot \mathbf{v}$$

**Divergent flow component dominates:**
$$S \approx -(\zeta + f) \nabla \cdot \mathbf{v}_\chi$$

Where $\mathbf{v}_\chi$ = divergent wind.

**Tropical convection → upper-level divergence → RWS → Rossby wave train**

**CR region (tropical convection):** Major RWS region
- Strong upper-level divergence from deep convection
- Generates Rossby waves propagating into mid-latitudes

**CA region:** Receives Rossby wave trains from tropics

#### 10.23.2 Wave Activity Flux (Takaya-Nakamura)

**Wave activity flux for stationary waves:**
$$\mathbf{W} = \frac{p}{2|\bar{u}|} \left[ \left(\frac{\partial \psi}{\partial x}\right)^2 - \psi\frac{\partial^2 \psi}{\partial x^2} - \frac{\partial \psi}{\partial x}\frac{\partial \psi}{\partial y}, \quad \frac{\partial \psi}{\partial x}\frac{\partial \psi}{\partial y} - \psi\frac{\partial^2 \psi}{\partial x \partial y} \right]$$

**Visualizes:** Rossby wave propagation from source to sink.

**CR → CA pathway:** Clear wave activity flux from Central America to North America during boreal summer/fall.

### 10.24 Mesoscale Convective Systems and Organization

#### 10.24.1 MCS Types and Latitudinal Distribution

| MCS Type | Structure | Latitude | CR/CA |
|----------|-----------|----------|-------|
| Squall line | Linear, leading convection | All, common mid-lat | CA frequent |
| Mesoscale convective complex (MCC) | Circular, long-lived | Tropics, subtropics | CR frequent |
| Tropical wave (easterly) | Inverted trough, slow | 5-20° N/S | CR frequent |
| African easterly wave | Wave in AEJ | 10-20° N | N/A |
| Mesoscale convective vortex (MCV) | Mid-level vortex remnant | Post-MCS | Both |

#### 10.24.2 Cold Pool Dynamics

**Cold pool:** Density current from evaporative cooling
**Propagation speed:** $c \approx \sqrt{g' h}$ where $g' = g\Delta\theta/\theta$

**CR:** Deep cold pools (high humidity, strong evaporation)
**CA:** Shallower cold pools (drier)

**Cold pool collision:** Triggers new convection (self-organization)

#### 10.24.3 Convective Self-Aggregation

**Idealized simulations:** Convection spontaneously clusters in non-rotating or weakly rotating ($f \to 0$) regimes.

**At CR ($f \approx 2.5 \times 10^{-5}$):** Near threshold for self-aggregation
- Aggregation timescale: ~10-20 days
- Result: Dry regions, moist clusters

**At CA ($f \approx 8.4 \times 10^{-5}$):** Rotation suppresses self-aggregation
- Coriolis organizes convection differently (squall lines)

### 10.25 Boundary Layer Clouds and Radiative Effects

#### 10.25.1 Stratocumulus (CA Coastal)

**Marine boundary layer (MBL):** Well-mixed layer capped by inversion.
**Stratocumulus:** Topped by strong inversion (5-10 K jump)
**Cloud fraction:** > 80% (eastern subtropical oceans)

**Radiative effect:** 
- SW cooling: ~50-100 W/m²
- LW warming: ~30-50 W/m²
- **Net cooling:** ~20-50 W/m²

**CA coastal:** Frequent stratocumulus (June-August "June Gloom")

#### 10.25.2 Trade Wind Cumulus (CR)

**Shallow cumulus:** Cloud base ~600 m, top ~2-3 km
**Cloud fraction:** 10-30%
**Radiative effect:** Small net (SW ≈ LW)

**CR region:** Trade wind cumulus regime, transitioning to deep convection near ITCZ.

#### 10.25.3 Cloud-Radiative Feedbacks

**Low cloud feedback:** Major uncertainty in climate sensitivity
- Stratocumulus breakup with warming → positive feedback
- Trade cumulus changes → uncertain sign

**CR vs CA:** Different cloud regimes, different feedback mechanisms.

### 10.26 Summary: Latitudinal Atmospheric Dynamics Synthesis

The Coriolis force creates a **fundamental dynamical bifurcation** at ~15-20° latitude:

**Equatorial regime (CR):**
- $Ro \gtrsim 1$ for most phenomena
- Direct thermal convection (Hadley/Walker)
- Equatorial wave dynamics (Kelvin, Yanai, ER)
- Weak geostrophy, strong ageostrophic flow
- Convection-driven gravity waves
- ITCZ, monsoons, tropical cyclones
- High predictability limit (~2 weeks)

**Mid-latitude regime (CA):**
- $Ro \ll 1$ for synoptic scales
- Geostrophic/quasi-geostrophic balance
- Baroclinic instability → storms, jets
- Rossby wave dynamics (propagation, breaking)
- Orographic/jet-front gravity waves
- SSWs, annular modes, stratosphere-troposphere coupling
- Higher predictability (~10-14 days)

**Transition zone (15-30°):** Subtropical jet, Hadley edge, monsoon margins.

**Key coupling pathways:**
1. **Tropical convection (CR) → Rossby waves → Mid-latitude weather (CA)**
2. **Stratospheric anomalies (SSW, QBO) → Downward coupling → Surface weather (CA > CR)**
3. **ENSO (tropical SST) → Global teleconnections → Both nodes**
4. **Gravity waves (both) → Momentum deposition → Mean flow (QBO, jets)**

---

*End of Document 10: Coriolis Dynamics & Atmospheric Boundary Layers (Complete, ~1050 lines)*

---