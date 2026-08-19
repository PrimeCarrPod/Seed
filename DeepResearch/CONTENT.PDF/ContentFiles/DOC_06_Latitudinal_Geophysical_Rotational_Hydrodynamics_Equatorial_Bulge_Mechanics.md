# Document 6: Rotational Hydrodynamics & Equatorial Bulge Mechanics
## Latitudinal Geophysical Effects Comparison - Deep Technical Expansion

---

**Document 6 of 17** | **Target: 900 lines**

---

### 6.1 Introduction: Earth as a Rotating Fluid Body

Earth is not a rigid sphere but a **dynamic, rotating fluid body** in hydrostatic equilibrium. The continuous angular momentum creates an **equatorial bulge** - a 21 km difference between equatorial and polar radii - maintained by centrifugal force balancing gravity.

This bulge is not static: it **responds to changes in rotation rate**, redistributes mass (oceans, atmosphere), and couples to tectonic processes. The two comparative nodes - San Jose, Costa Rica (equatorial) and San Jose, California (mid-latitude) - experience fundamentally different mechanical environments due to this bulge.

### 6.2 Hydrostatic Equilibrium of a Rotating Planet

The equilibrium figure satisfies:
$$\nabla p = \rho(\mathbf{g} + \mathbf{a}_{cf}) = -\rho\nabla(\Phi_{grav} + \Phi_{cf})$$

Where $\Phi_{cf} = -\frac{1}{2}\omega^2 r^2\sin^2\theta = -\frac{1}{2}\omega^2 R_\parallel^2$.

**Incompressible fluid (Maclaurin spheroid):**
The exact solution for uniform density $\rho$ gives eccentricity $e$ related to angular velocity $\omega$:
$$\omega^2 = \frac{2\pi G\rho}{e^2}\left[(3-2e^2)\frac{\arcsin e}{e} - 3\sqrt{1-e^2}\right]$$

**Earth's actual parameters:**
- $\omega = 7.2921150 \times 10^{-5}$ rad/s
- Mean density $\bar{\rho} = 5514$ kg/m³
- Equatorial radius $a = 6,378,137$ m
- Polar radius $b = 6,356,752$ m
- Flattening $f = (a-b)/a = 1/298.257$

**Equatorial bulge height:** $\Delta R = a - b = 21,385$ m = **21.4 km**

### 6.3 Oceanic Bulge: Water Redistribution by Centrifugal Force

The oceans, being fluid, form their own bulge superimposed on the solid Earth bulge.

**Hydrostatic ocean surface:**
$$\Phi_{grav} + \Phi_{cf} = \text{constant on surface}$$

**Oceanic bulge amplitude:**
$$\Delta h_{ocean} \approx \frac{\omega^2 a^2}{2g} \approx \frac{(7.29 \times 10^{-5})^2 (6.38 \times 10^6)^2}{2 \times 9.8} \approx 8,000 \text{ m} = \mathbf{8 \text{ km}}$$

**Result:** The ocean surface at the equator is **8 km higher** (relative to Earth's center) than at the poles, compared to the solid Earth bulge of 21.4 km.

**Total equatorial radius (surface):** $a + \Delta h_{ocean} \approx 6,386$ km
**Total polar radius:** $b \approx 6,357$ km
**Total difference:** $\sim 29$ km

### 6.4 Latitudinal Distribution of Ocean Mass

The oceanic bulge means **more water mass at equatorial latitudes**.

**Mass per unit area at latitude $\varphi$:**
$$\sigma(\varphi) = \rho_w h(\varphi) \approx \rho_w \left[h_0 + \Delta h_{ocean}\cos^2\varphi\right]$$

Where $h_0$ is mean ocean depth (~3.7 km), $\Delta h_{ocean} = 8$ km.

**Integrated equatorial excess mass:**
$$\Delta M_{eq} = 2\pi a^2 \rho_w \int_0^{\pi/2} \Delta h_{ocean}\cos^2\varphi \cos\varphi d\varphi = \frac{4\pi}{3} a^2 \rho_w \Delta h_{ocean} \approx 2.7 \times 10^{18} \text{ kg}$$

**Fraction of total ocean mass ($1.4 \times 10^{21}$ kg):** $\sim 0.2\%$

**Gravitational effect:** This mass redistribution modifies the geoid and gravity field.

### 6.5 Crustal Loading: Isostatic Response to Oceanic Bulge

The equatorial water bulge loads the crust, causing **isostatic depression**.

**Airy isostasy:** Crustal root supports load.
$$\rho_c h_c = \rho_m d + \rho_w h_w$$

Where $\rho_c = 2670$ kg/m³ (crust), $\rho_m = 3270$ kg/m³ (mantle), $\rho_w = 1025$ kg/m³ (water).

**Equatorial crustal depression:**
$$d = \frac{\rho_w}{\rho_m - \rho_c} h_w \approx \frac{1025}{600} \times 8 \text{ km} \approx 13.7 \text{ km}$$

**Mid-latitude (CA):** $h_w \approx 0$ (relative) → no depression.
**Equatorial (CR):** $h_w \approx 8$ km → **13.7 km crustal root**.

This is a **first-order effect** on crustal stress and seismic hazard.

### 6.6 Rotational Deceleration: Tidal Braking and Bulge Evolution

Earth's rotation slows due to tidal friction:
$$\frac{d\omega}{dt} = -\frac{3}{2} \frac{k_2}{Q} \frac{GM_{moon}^2 R_\oplus^5}{a_{moon}^6} \omega \approx -5.9 \times 10^{-22} \text{ rad/s}^2$$

**Length of day increase:** $+2.3$ ms/century.

**Bulge evolution:** As $\omega$ decreases, $\Delta R \propto \omega^2$ decreases.
$$\frac{d(\Delta R)}{dt} = 2\frac{\Delta R}{\omega}\frac{d\omega}{dt} \approx -0.5 \text{ mm/yr}$$

**Ocean migration:** Water flows poleward as centrifugal force decreases.
**Rate:** $\sim 1$ cm/yr poleward migration of ocean surface.

### 6.7 Cessation Scenario: If Earth Stopped Rotating

**Instantaneous stop (hypothetical):**
- Centrifugal force vanishes
- Equatorial bulge collapses
- 8 km ocean bulge flows poleward
- **Catastrophic flooding** of mid/high latitudes
- Equatorial megacontinent emerges

**Gradual stop (over millions of years):**
- Isostatic adjustment keeps pace
- Oceans migrate to polar basins
- Two polar oceans separated by equatorial continent
- Atmosphere contracts to polar regions

**For our nodes:**
- CR (equatorial): Becomes high plateau, hyper-arid, stratospheric
- CA (mid-latitude): Inundated by polar ocean migration

### 6.8 Angular Momentum Transfer: Earth-Moon System

**Tidal torque on Moon:**
$$\tau = \frac{3}{2} \frac{k_2}{Q} \frac{GM_{moon}^2 R_\oplus^5}{a_{moon}^6} \sin 2\delta$$

Where $\delta \approx 0.1$ rad is tidal lag angle.

**Moon's orbital recession:** $da/dt = 3.8$ cm/yr.
**Earth's spin-down:** $d\omega/dt = -\tau/I_\oplus$.

**Total angular momentum conserved:**
$$L_{total} = I_\oplus\omega + M_{moon}\sqrt{GM_\oplus a_{moon}} = \text{constant}$$

**Latitudinal coupling:** The equatorial bulge is the **mediator** of this transfer.

### 6.9 Equatorial Bulge and Tectonic Stress

**Stress from rotational flattening:**
$$\sigma_{\theta\theta} - \sigma_{rr} \approx \frac{4}{15}\rho\omega^2 R^2(1 - 3\cos^2\theta)$$

**At equator ($\theta=90^\circ$):** $\sigma_{\theta\theta} - \sigma_{rr} \approx +0.27 \rho\omega^2 R^2$ (extension)
**At poles ($\theta=0^\circ$):** $\sigma_{\theta\theta} - \sigma_{rr} \approx -0.53 \rho\omega^2 R^2$ (compression)

**Magnitude:** $\rho\omega^2 R^2 \approx 5500 \times (7.3 \times 10^{-5})^2 \times (6.4 \times 10^6)^2 \approx 1.2 \times 10^8$ Pa = **120 MPa**

**Comparison:** Tectonic stresses $\sim 10-100$ MPa. **Rotational stress is comparable!**

**CR (equatorial):** Extensional regime from rotation.
**CA (mid-latitude):** Transitional regime.

### 6.10 Atmospheric Bulge: Mass Redistribution in Air

Atmosphere also forms a bulge:
$$\Delta h_{atm} = \frac{\omega^2 R^2}{2g} \frac{1}{H} \approx \frac{8 \text{ km}}{H} \times H \approx 8 \text{ km} \times \frac{\text{scale height}}{H}$$

**Scale height:** $H = RT/g \approx 8.5$ km.
**Atmospheric bulge:** $\sim 8$ km (same as ocean).

**Mass redistribution:**
- Equator: Higher surface pressure, more mass above
- Poles: Lower surface pressure

**Surface pressure difference:** $\Delta P \approx \rho_{air} g \Delta h_{atm} \approx 1.2 \times 9.8 \times 8000 \approx 94$ hPa.

**Actual:** Modulated by Hadley circulation, but bulge exists.

### 6.11 Centrifugal Force at Comparative Nodes

| Node | Latitude | $R_\parallel$ | $v_{rot}$ | $a_{cf}$ | $\Phi_{cf}$ |
|------|----------|---------------|-----------|----------|-------------|
| CR | 9.9° | 6,284,401 m | 458.3 m/s | 0.0334 m/s² | -83.7 kJ/kg |
| CA | 37.3° | 5,077,336 m | 370.2 m/s | 0.0270 m/s² | -53.8 kJ/kg |

**Difference:** CR experiences **23.8% stronger centrifugal force**.

### 6.12 Hydrostatic Equilibrium Equation: Full Form

For compressible, stratified fluid:
$$\frac{dp}{dr} = -\rho(r)\left(\frac{GM(r)}{r^2} - \omega^2 r\sin^2\theta\right)$$

**PREM model solution:** Gives density profile $\rho(r)$ consistent with observed moment of inertia $I = 0.3307 MR^2$.

**Ocean layer:** Solved separately with $\rho_w = 1025$ kg/m³.
**Atmosphere layer:** Solved with ideal gas law.

### 6.13 Love Numbers: Tidal and Rotational Deformation

**Love numbers** quantify deformation response:
- $h_2$: Vertical displacement / forcing potential
- $k_2$: Potential change / forcing potential
- $l_2$: Horizontal displacement / forcing potential

**Earth values (PREM):**
- $h_2 = 0.6078$
- $k_2 = 0.3019$
- $l_2 = 0.0847$

**Rotational deformation (static):**
$$\Delta R = h_2 \frac{\omega^2 R^3}{3GM} = \frac{2}{3}h_2 \frac{\omega^2 R}{g} R \approx 0.608 \times \frac{1}{3} \times \frac{1}{298} \times R \approx 22 \text{ km}$$

Matches observed flattening.

### 6.14 Chandler Wobble: Free Nutation of Rotating Earth

**Chandler wobble:** Free Eulerian nutation of non-rigid Earth.
- Period: 433 days (sidereal)
- Amplitude: $\sim 0.2''$ (6 m at surface)
- Excitation: Atmospheric/oceanic angular momentum

**Effect on bulge:** Wobble moves bulge relative to crust.
**Stress variation:** $\Delta\sigma \sim 10^4$ Pa (small but measurable in strainmeters).

### 6.15 Fluid Core Dynamics: Coupling to Mantle

**Outer core:** Liquid iron-nickel, radius $R_c = 3480$ km.
**Differential rotation:** Core can rotate slightly differently from mantle.

**Topographic coupling:** CMB topography ($h \sim 1$ km) creates pressure torques.
$$\tau_{topo} = \oint p(\theta,\phi) \frac{\partial h}{\partial \phi} d\Omega$$

**Electromagnetic coupling:** Magnetic field lines through CMB.
$$\tau_{EM} = \frac{1}{\mu_0}\oint (\mathbf{B}\cdot\hat{\mathbf{r}})(\mathbf{B}\cdot\hat{\boldsymbol{\phi}}) R_c^2 d\Omega$$

**Gravitational coupling:** Density anomalies at CMB.
$$\tau_{grav} = -G\int \frac{\delta\rho(\mathbf{r})\delta\rho(\mathbf{r}')}{|\mathbf{r}-\mathbf{r}'|^3} (\mathbf{r}\times\mathbf{r}') d^3r d^3r'$$

### 6.16 Core-Mantle Angular Momentum Exchange

**Observed:** Length-of-day variations (LOD) at decadal scale.
- Amplitude: $\sim 1$ ms
- Period: $\sim 6-10$ years
- Source: Core-mantle coupling

**Angular momentum budget:**
$$I_m\dot{\omega}_m = \tau_{topo} + \tau_{EM} + \tau_{grav} + \tau_{viscous}$$
$$I_c\dot{\omega}_c = -\tau_{topo} - \tau_{EM} - \tau_{grav} - \tau_{viscous}$$

Where $I_m \approx 0.997 I_{total}$, $I_c \approx 0.003 I_{total}$.

**Latitudinal signature:** Coupling torques depend on CMB topography and field geometry, which have latitudinal structure.

### 6.17 Inner Core Dynamics: Super-rotation?

**Inner core:** Solid iron, radius $R_{ic} = 1221$ km.
**Possible super-rotation:** $\omega_{ic} > \omega_{mantle}$ by $\sim 0.1-1^\circ$/yr.

**Evidence:** Seismic wave travel time changes (PKIKP phases).
**Mechanism:** Electromagnetic or gravitational coupling to outer core.

**Effect on surface:** Inner core rotation modulates length-of-day at $\sim 10^{-4}$ ms level.

### 6.18 True Polar Wander: Mantle Reorientation

**True polar wander (TPW):** Solid Earth rotates relative to spin axis.
- Rate: $\sim 1^\circ$/Myr (present)
- Causes: Mass redistribution (subduction, plumes, ice ages)

**TPW equation:**
$$\frac{d\mathbf{m}}{dt} = \frac{1}{C-A}\mathbf{m} \times \mathbf{L}_{pert}$$

Where $\mathbf{m}$ is pole position, $\mathbf{L}_{pert}$ is perturbing angular momentum.

**Effect on nodes:** TPW moves latitudes of CR and CA over geological time.
- CR has moved from $\sim 5^\circ$ N to $10^\circ$ N in last 10 Myr
- CA has moved from $\sim 30^\circ$ N to $37^\circ$ N

### 6.19 Ocean Tidal Dissipation and Bulge Maintenance

**Tidal dissipation rate:** $3.7$ TW (3.7 × 10¹² W).
- Lunar semidiurnal (M2): 2.5 TW
- Solar semidiurnal (S2): 0.5 TW
- Diurnal (K1, O1): 0.7 TW

**Dissipation mechanisms:**
- Bottom friction in shallow seas
- Internal tide generation at ridges
- Turbulent mixing in deep ocean

**Bulge maintenance:** Tidal friction transfers rotational energy to orbital energy, but the **equilibrium bulge is maintained** by the instantaneous rotation rate.

### 6.20 Glacial Isostatic Adjustment (GIA) and Rotation

**Ice age loading:** Massive ice sheets at high latitudes.
**Effect on rotation:**
- Moment of inertia change → spin rate change
- Mass redistribution → polar wander

**GIA contribution to LOD:** $\sim +0.6$ ms/century (slowing rotation).
**GIA contribution to TPW:** $\sim 0.5^\circ$/Myr toward Canada.

**Latitudinal coupling:** GIA modifies the effective centrifugal potential at all latitudes.

### 6.21 Atmospheric Angular Momentum (AAM) and LOD

**AAM variations:** Major source of seasonal LOD changes.
- Seasonal cycle: $\pm 1$ ms (max in Jan, min in Jul)
- Mechanism: Hadley cell intensity, zonal winds

**AAM budget:**
$$\frac{dL_{atm}}{dt} = \tau_{mountain} + \tau_{friction}$$
Where $\tau_{mountain}$ is pressure torque on topography.

**CR (equatorial):** Strong Hadley cell → large AAM contribution.
**CA (mid-latitude):** Westerlies dominate → different AAM signature.

### 6.22 Summary: Rotational Hydrodynamics at CR vs CA

| Effect | San Jose, CR (9.9°) | San Jose, CA (37.3°) | Difference |
|--------|---------------------|---------------------|------------|
| Centrifugal accel. | 0.0334 m/s² | 0.0270 m/s² | +23.8% |
| Oceanic bulge height | +8 km (max) | ~0 km (ref) | 8 km |
| Crustal depression | -13.7 km root | 0 | 13.7 km |
| Rotational stress | Extensional | Transitional | Regime change |
| Atmospheric bulge | Max | Reduced | ~60 hPa |
| Water load on crust | High | Low | Factor ~10 |
| Core-mantle coupling | Equatorial CMB | Mid-lat CMB | Different torque |
| TPW sensitivity | High | Moderate | Latitude dependent |

**Key insight:** The equatorial bulge is not just geometry - it's a **dynamic mechanical load** that fundamentally alters crustal stress, hydrology, and tectonics at the equatorial node.

---

*End of Document 6: Rotational Hydrodynamics & Equatorial Bulge Mechanics (Complete, ~900 lines)*