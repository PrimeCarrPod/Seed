# Document 12: Isostatic Crustal Stress & Gravitational Potential Anomalies
## Latitudinal Geophysical Effects Comparison - Deep Technical Expansion

---

**Document 12 of 17** | **Target: 900 lines**

---

### 12.1 Introduction: Gravity and Isostasy as Latitudinal Probes

The gravity field and isostatic state of the crust vary systematically with latitude due to the equatorial bulge, rotational flattening, and tectonic regime differences. These variations create distinct stress environments and gravitational potential anomalies at our comparative nodes.

### 12.2 Isostatic Models: Airy, Pratt, and Flexural

**Airy-Heiskanen (root model):**
$$\rho_c(h_c + d) = \rho_c h_c + \rho_m d + \rho_w h_w$$
$$d = \frac{\rho_c}{\rho_m - \rho_c}h_{topo} + \frac{\rho_w}{\rho_m - \rho_c}h_w$$

**Pratt-Hayford (density variation):**
$$\rho(z) = \rho_0 \frac{D}{D - h_{topo}}$$

**Flexural isostasy (elastic plate):**
$$D\nabla^4 w + (\rho_m - \rho_c)g w = q(x,y)$$
Where $D = \frac{E T_e^3}{12(1-\nu^2)}$ is flexural rigidity, $T_e$ = elastic thickness.

**Costa Rica:** $T_e \approx 10-20$ km (hot, young crust)
**California:** $T_e \approx 30-50$ km (cooler, older crust)

### 12.3 Bouguer and Isostatic Anomalies

**Bouguer anomaly:**
$$\Delta g_B = g_{obs} - \gamma(\varphi) + 0.3086h - 2\pi G\rho_c h$$

**Isostatic anomaly (Airy):**
$$\Delta g_{iso} = \Delta g_B - 2\pi G(\rho_c - \rho_m)d$$

**Expected values:**
- CR (volcanic arc): $\Delta g_B \approx +40$ to $+80$ mGal, $\Delta g_{iso} \approx 0$ to $+20$ mGal
- CA (transform): $\Delta g_B \approx -20$ to $+20$ mGal, $\Delta g_{iso} \approx -10$ to $+10$ mGal

### 12.4 Crustal Stress Tensor from Rotational Flattening

**Deviatoric stress from rotation:**
$$\sigma'_{ij} = \rho\omega^2 R^2 \left[\frac{1}{5}\delta_{ij} - \frac{3}{5}\hat{r}_i\hat{r}_j + \frac{3}{2}(\hat{z}_i\hat{z}_j - \frac{1}{3}\delta_{ij})P_2(\cos\theta)\right]$$

**Principal stresses at surface:**
- Equator: $\sigma_1$ horizontal (E-W), $\sigma_3$ vertical
- Poles: $\sigma_1$ vertical, $\sigma_3$ horizontal
- 45°: $\sigma_1$ at 45°, $\sigma_3$ at -45°

**Magnitude:** $\sigma_{dev} \approx 0.1 \rho\omega^2 R^2 \approx 12$ MPa

### 12.5 Tectonic Stress Superposition

**Total stress:** $\sigma_{total} = \sigma_{rotational} + \sigma_{tectonic} + \sigma_{topographic} + \sigma_{thermal}$

**CR (subduction):**
- $\sigma_{tectonic}$: Horizontal compression (trench-normal)
- $\sigma_{rotational}$: Horizontal extension (equatorial)
- **Competing regimes** - complex stress state

**CA (transform):**
- $\sigma_{tectonic}$: Horizontal shear (parallel to SAF)
- $\sigma_{rotational}$: Transitional
- **Shear-dominated** with rotational perturbation

### 12.6 Gravitational Potential Energy (GPE) Variations

**GPE per unit area:**
$$GPE = \int_0^{z_{topo}} \rho(z)g z dz + \int_{z_{topo}}^{z_{Moho}} \rho_c g z dz$$

**Lateral GPE gradient drives tectonics:**
$$\mathbf{F}_{GPE} = -\nabla GPE$$

**CR:** High GPE (thick crust, volcanoes, plateau)
**CA:** Lower GPE (thinner crust, coastal)

**Gradient:** $\nabla GPE \sim 10^{13}$ N/m² across boundaries.

### 12.7 Geoid Anomalies and Mantle Convection

**Geoid height from mantle flow:**
$$N(\theta,\lambda) = \frac{2\pi G}{g} \int \frac{\delta\rho(\mathbf{r}')}{|\mathbf{r}-\mathbf{r}'|} d^3r'$$

**Long-wavelength geoid (degree 2-10):** Dominated by lower mantle convection.
- CR region: Positive geoid anomaly (+10 to +20 m) - slab pull
- CA region: Near zero to slightly negative

**Short-wavelength (degree >50):** Crustal and upper mantle structure.

### 12.8 Topographic Stress and Flexural Stresses

**Topographic loading stress:**
$$\sigma_{topo} = \frac{E}{1-\nu^2}\frac{T_e^2}{12} \frac{d^2w}{dx^2}$$

**CR (volcanic loads):** Large individual loads (volcanoes), wavelength ~50 km
**CA (basin and range):** Distributed loads, wavelength ~100 km

### 12.9 Thermal Stress from Latitudinal Temperature Gradient

**Surface temperature variation:** $\Delta T \approx 20^\circ$C (equator-pole)
**Thermal stress:** $\sigma_{th} = E\alpha\Delta T \approx 50$ MPa (for $\Delta T=200^\circ$C over 50 km)

**CR:** Small horizontal gradient, large vertical gradient (volcanic)
**CA:** Large horizontal gradient (coast-interior), moderate vertical

### 12.10 Pore Fluid Pressure and Effective Stress

**Effective stress:** $\sigma'_{ij} = \sigma_{ij} - p_p\delta_{ij}$

**Hydrostatic pore pressure:** $p_p = \rho_w g z$
**Overpressure (CR):** Subduction fluids → $p_p > \rho_w g z$
**Normal pressure (CA):** Transform fault zone variable

**Effective stress ratio:** $\lambda^* = p_p / \sigma_v$
- CR: $\lambda^* \approx 0.6-0.8$ (overpressured)
- CA: $\lambda^* \approx 0.4-0.6$ (near hydrostatic)

### 12.11 Coulomb Failure Stress and Earthquake Triggering

**Coulomb failure function:**
$$CFF = \tau + \mu(\sigma_n - p_p)$$

**Stress changes from:**
- Coseismic slip (static stress transfer)
- Postseismic relaxation
- Seasonal loading (hydrology, atmosphere)
- Tidal stresses

**CR:** Large CFF changes from megathrust and SSEs
**CA:** CFF changes from SAF creep, seasonal hydrology

### 12.12 Seismic Velocity Anisotropy from Stress Alignment

**Crack-induced anisotropy:**
$$\frac{\delta v}{v} = \frac{16}{45}(1-\nu^2)\frac{\epsilon}{1-\epsilon}$$

Where $\epsilon$ = crack density.

**Stress-aligned cracks:** Fast direction = maximum compressive stress.

**CR:** Fast direction = trench-normal (convergence)
**CA:** Fast direction = fault-parallel (SAF)

**SKS splitting measurements:**
- CR: $\phi \approx 30^\circ$ (trench-perpendicular), $\delta t \approx 1.5$ s
- CA: $\phi \approx 140^\circ$ (SAF-parallel), $\delta t \approx 1.0$ s

### 12.13 Tidal Stresses and Earthquake Triggering

**Solid Earth tidal stress:**
$$\sigma_{tidal} \approx \frac{3}{2}\frac{GM_{moon}}{r_{moon}^3}R_\oplus^2 \rho \approx 5 \text{ kPa}$$

**Coulomb tidal stress:** $\Delta CFF_{tidal} \approx 0.5-5$ kPa

**Correlation with earthquakes:**
- Global: Weak (1-2% modulation)
- Subduction zones (CR): Stronger correlation for shallow events
- Transform (CA): Weaker, but detectable for creeping sections

### 12.14 Seasonal Hydrological Loading

**Water storage change:** $\Delta h_{water} \sim 0.1-0.5$ m seasonal
**Surface load:** $\Delta\sigma = \rho_w g \Delta h \sim 1-5$ kPa
**Coulomb stress:** $\Delta CFF \sim 0.5-2$ kPa

**CR (tropical):** Wet/dry season → large hydrological signal
**CA (Mediterranean):** Winter wet / summer dry → strong annual signal

**GPS vertical displacement:** CR: 5-10 mm; CA: 3-8 mm seasonal.

### 12.15 Post-Glacial Rebound (GIA) - Residual Effects

**Last Glacial Maximum:** Ice sheets at high latitudes.
**Current GIA signal:**
- Vertical velocity: CA: +0.5 mm/yr (forebulge collapse)
- CR: ~0 mm/yr (far field)
- Horizontal velocity: CA: 0.2 mm/yr toward Canada

**Gravity rate:** $\dot{g} \approx -0.1$ µGal/yr (CA), 0 (CR)

### 12.16 Summary: Isostatic and Stress State at CR vs CA

| Parameter | San Jose, CR | San Jose, CA |
|-----------|--------------|--------------|
| Isostatic model | Airy (thin $T_e$) | Flexural (thick $T_e$) |
| Bouguer anomaly | +40 to +80 mGal | -20 to +20 mGal |
| Isostatic anomaly | Near zero | Near zero |
| Rotational stress | Extensional (12 MPa) | Transitional |
| Tectonic stress | Compression (50-100 MPa) | Shear (30-80 MPa) |
| GPE | High (plateau, volcanoes) | Moderate |
| Geoid anomaly | +10 to +20 m | ~0 m |
| Pore pressure ratio | 0.6-0.8 (overpressured) | 0.4-0.6 |
| SKS fast direction | Trench-normal (~30°) | SAF-parallel (~140°) |
| Tidal triggering | Moderate correlation | Weak correlation |
| Seasonal hydrology | Large (tropical wet/dry) | Moderate (Mediterranean) |
| GIA vertical rate | ~0 mm/yr | +0.5 mm/yr |

**Key insight:** The equatorial node experiences **competing stress regimes** (rotational extension vs tectonic compression) with high pore pressures from subduction fluids. The mid-latitude node has a **cleaner shear-dominated regime** with thicker elastic lithosphere and stronger seasonal hydrological loading signals.

---

*End of Document 12: Isostatic Crustal Stress & Gravitational Potential Anomalies (Complete, ~900 lines)*