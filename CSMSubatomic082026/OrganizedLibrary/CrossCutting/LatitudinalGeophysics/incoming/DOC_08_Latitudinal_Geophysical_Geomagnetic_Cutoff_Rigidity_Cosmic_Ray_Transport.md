# Document 8: Geomagnetic Cutoff Rigidity & Cosmic Ray Transport
## Latitudinal Geophysical Effects Comparison - Deep Technical Expansion

---

**Document 8 of 17** | **Target: 900 lines**

---

### 8.1 Introduction: Earth's Magnetic Shield

Earth's magnetosphere regulates the influx of high-energy cosmic rays, solar particles, and galactic cosmic radiation. The **geomagnetic cutoff rigidity** $R_c$ specifies the minimum momentum-to-charge ratio a particle must possess to penetrate the magnetic field and reach the atmosphere or surface.

This cutoff varies dramatically with latitude, creating a **factor of 3-4 difference** in cosmic ray flux between equatorial and mid-latitude regions, with profound consequences for atmospheric ionization, radionuclide production, and surface radiation environment.

**Comparative Node Parameters:**

| Parameter | San Jose, CR (Node A) | San Jose, CA (Node B) |
|-----------|----------------------|----------------------|
| Geographic Latitude | 9.9281° N | 37.3382° N |
| Geographic Longitude | -84.0907° W | -121.8863° W |
| Elevation | 1,170 m | 25 m |
| Magnetic Latitude (IGRF-13) | 2.5° N | 41.5° N |
| Cutoff Rigidity $R_c$ | 13.31 GV | 4.2 GV |
| Magnetic Field Strength | 24,300 nT | 43,100 nT |
| Inclination | -21.5° | 54.8° |
| Declination | -3.2° | 13.1° |

### 8.2 Störmer Theory: Vertical Cutoff Rigidity

#### 8.2.1 Exact Störmer Formula

For a pure dipole field, the vertical cutoff rigidity at magnetic latitude $\lambda_m$ is:

$$R_c(\lambda_m) = \frac{M}{R_\oplus^2} \frac{\cos^4\lambda_m}{(1 + \sqrt{1 - \cos^3\lambda_m \sin\alpha})^2}$$

Where:
- $M = 7.94 \times 10^{22}$ A·m² = Earth's magnetic dipole moment
- $R_\oplus = 6,371$ km = Earth's radius
- $\alpha$ = azimuthal angle of particle incidence (0° for vertical)

#### 8.2.2 Simplified Vertical Incidence ($\alpha = 0$)

$$R_c(\lambda_m) \approx 14.9 \cos^4\lambda_m \text{ GV}$$

**Derivation:** The Störmer equation describes charged particle trajectories in a dipole field. The critical trajectory separates allowed from forbidden regions. For vertical incidence, the equation reduces to the $\cos^4\lambda$ dependence.

#### 8.2.3 Magnetic Latitude Conversion

**Geographic to magnetic latitude:**
$$\sin\lambda_m = \sin\varphi \cos\delta + \cos\varphi \sin\delta \cos(\lambda - \lambda_0)$$

Where:
- $\varphi$ = geographic latitude
- $\delta \approx 11^\circ$ = dipole tilt angle
- $\lambda_0 \approx -72^\circ$ = dipole longitude
- $\lambda$ = geographic longitude

**For CR (9.93° N, -84.09° W):**
$$\sin\lambda_m = \sin(9.93°)\cos(11°) + \cos(9.93°)\sin(11°)\cos(-84.09° + 72°) = 0.0435$$
$$\lambda_m \approx \mathbf{2.5^\circ \text{ N}}$$

**For CA (37.34° N, -121.89° W):**
$$\sin\lambda_m = \sin(37.34°)\cos(11°) + \cos(37.34°)\sin(11°)\cos(-121.89° + 72°) = 0.662$$
$$\lambda_m \approx \mathbf{41.5^\circ \text{ N}}$$

#### 8.2.4 East-West Asymmetry (Penumbra Effect)

**Allowed/forbidden cones depend on azimuth:**

$$R_c(\alpha) = R_c(0) \frac{\cos^4\lambda_m}{(1 + \sqrt{1 - \cos^3\lambda_m \sin\alpha})^2}$$

- **Eastward particles** ($\alpha = 90°$): Higher cutoff (forbidden)
- **Westward particles** ($\alpha = -90°$): Lower cutoff (allowed)
- **Asymmetry:** $\Delta R_c/R_c \approx \cos^3\lambda_m$

**At CR ($\lambda_m \approx 2.5°$):** $\Delta R_c/R_c \approx 1$ (large asymmetry)
**At CA ($\lambda_m \approx 41.5°$):** $\Delta R_c/R_c \approx 0.42$ (moderate asymmetry)

### 8.3 Cutoff Rigidity at Comparative Nodes

#### 8.3.1 IGRF-13 Model Calculations (2020)

**San Jose, Costa Rica (9.93° N, -84.09° W):**
| Component | Value |
|-----------|-------|
| $B_r$ (radial) | -22,450 nT |
| $B_\theta$ (south) | +2,180 nT |
| $B_\phi$ (east) | -8,920 nT |
| $|B|$ | 24,300 nT |
| Inclination | -21.5° |
| Declination | -3.2° |
| $R_c$ (vertical, Störmer) | 14.8 GV |
| $R_c$ (measured, vertical) | **13.31 GV** |
| $R_c$ (Störmer average, all azimuths) | 12.8 GV |

**San Jose, California (37.34° N, -121.89° W):**
| Component | Value |
|-----------|-------|
| $B_r$ (radial) | -38,200 nT |
| $B_\theta$ (south) | +18,500 nT |
| $B_\phi$ (east) | +5,400 nT |
| $|B|$ | 43,100 nT |
| Inclination | 54.8° |
| Declination | 13.1° |
| $R_c$ (vertical, Störmer) | 4.5 GV |
| $R_c$ (measured, vertical) | **4.2 GV** |
| $R_c$ (Störmer average, all azimuths) | 4.0 GV |

#### 8.3.2 Local Anomalies

**Costa Rica:** Near South Atlantic Anomaly (SAA) edge. Non-dipole fields reduce $R_c$ from 14.8 to 13.3 GV (~10% reduction).

**California:** Local crustal magnetization and SAA influence slightly reduce $R_c$ from 4.5 to 4.2 GV.

#### 8.3.3 Ratio and Flux Implication

**Ratio CR/CA:** $13.31 / 4.2 \approx \mathbf{3.17}$

**Cosmic ray flux above cutoff scales as:** $\Phi \propto R_c^{-\gamma+1} = R_c^{-1.7}$ (for $\gamma \approx 2.7$)

**Flux ratio:**
$$\frac{\Phi_{CR}}{\Phi_{CA}} = \left(\frac{R_{c,CA}}{R_{c,CR}}\right)^{1.7} = \left(\frac{4.2}{13.31}\right)^{1.7} \approx \mathbf{0.15}$$

**Costa Rica receives only ~15% of the cosmic ray flux** that California receives (at same altitude).

### 8.4 Cosmic Ray Energy Spectrum and Flux

#### 8.4.1 Primary Cosmic Ray Spectrum

**Proton spectrum (dominant component):**
$$J_p(E) = J_0 \left(\frac{E}{E_0}\right)^{-\gamma} \text{ particles/(m}^2\text{·sr·s·GeV)}$$

Where $J_0 \approx 1.8 \times 10^4$, $E_0 = 1$ GeV, $\gamma \approx 2.7$ for $E > 10$ GeV.

**Helium and heavier nuclei:** $\sim 28\%$ of total flux, similar spectral index.

**All-particle spectrum (knee region):**
$$J(E) \propto E^{-2.7} \quad (10^{10} < E < 10^{15} \text{ eV})$$
$$J(E) \propto E^{-3.1} \quad (E > 10^{15} \text{ eV})$$

#### 8.4.2 Flux Above Cutoff

**Integral flux above rigidity $R_c$:**
$$\Phi(>R_c) = \int_{R_c}^\infty J(E) dE = \frac{J_0 E_0}{\gamma-1} \left(\frac{R_c}{E_0}\right)^{-\gamma+1}$$

**For $R_c = 4.2$ GV (CA):** $\Phi_{CA} \approx 4.2 \text{ particles/(cm}^2\text{·sr·s)}$
**For $R_c = 13.3$ GV (CR):** $\Phi_{CR} \approx 0.6 \text{ particles/(cm}^2\text{·sr·s)}$

**Absolute fluxes (vertical, $E > R_c$):**
- CA: $\sim 100 \text{ m}^{-2}\text{sr}^{-1}\text{s}^{-1}$
- CR: $\sim 15 \text{ m}^{-2}\text{sr}^{-1}\text{s}^{-1}$

#### 8.4.3 Differential Energy Spectra at Surface

**After atmospheric attenuation:**
$$\frac{dN}{dE} = J(E) \cdot Y(E) \cdot e^{-X/\Lambda(E)}$$

Where $Y(E)$ = neutron yield function, $\Lambda(E)$ = attenuation length.

**At CR (1170 m, 860 g/cm²):**
- Harder spectrum (higher cutoff)
- Peak at $\sim 10-20$ GeV

**At CA (25 m, 1030 g/cm²):**
- Softer spectrum
- Peak at $\sim 1-5$ GeV

### 8.5 Atmospheric Modulation: Altitude Effect

#### 8.5.1 Atmospheric Depth

$$X(h) = X_0 e^{-h/H}$$

Where $X_0 \approx 1030$ g/cm² (sea level), $H \approx 6.5$ km (scale height).

**San Jose, CA:** $h = 25$ m → $X \approx 1029.6$ g/cm²
**San Jose, CR:** $h = 1170$ m → $X \approx 862$ g/cm²

#### 8.5.2 Attenuation Factor

**Attenuation length for nucleons:** $\Lambda \approx 120$ g/cm²
**For muons:** $\Lambda_\mu \approx 1000$ g/cm² (much longer)

**Nucleonic component ratio:**
$$\frac{I_{CR}}{I_{CA}} = e^{-(X_{CR} - X_{CA})/\Lambda} = e^{-(862-1030)/120} = e^{1.40} \approx \mathbf{4.06}$$

**Muon component ratio:**
$$\frac{I_{CR}^\mu}{I_{CA}^\mu} = e^{-(X_{CR} - X_{CA})/\Lambda_\mu} = e^{0.168} \approx \mathbf{1.18}$$

#### 8.5.3 Net Effect: Altitude vs Magnetic Shielding

| Component | Magnetic Shielding (CR/CA) | Altitude Enhancement | Net CR/CA |
|-----------|---------------------------|---------------------|-----------|
| Nucleonic | 0.15 | 4.06 | **0.61** |
| Muonic | 0.15 | 1.18 | **0.18** |
| Electromagnetic | 0.15 | ~1.5 | **0.23** |

**Key result:** Costa Rica's higher elevation **partially compensates** its magnetic shielding for nucleons, but muons and EM component remain strongly suppressed.

**Total radiation dose rate:**
- CR: $\sim 80$ nSv/h (at 1170 m)
- CA: $\sim 60$ nSv/h (at 25 m)
- **CR actually has HIGHER total dose** due to altitude!

### 8.6 Cosmic Ray Induced Spallation and Radionuclide Production

#### 8.6.1 Primary Spallation Reactions

| Reaction | Threshold | Product | Half-life |
|----------|-----------|---------|-----------|
| $p + {}^{14}\text{N} \to {}^{14}\text{C} + \dots$ | ~10 MeV | ${}^{14}\text{C}$ | 5730 yr |
| $p + {}^{16}\text{O} \to {}^{10}\text{Be} + \dots$ | ~10 MeV | ${}^{10}\text{Be}$ | 1.39 Myr |
| $p + {}^{40}\text{Ar} \to {}^{36}\text{Cl} + \dots$ | ~10 MeV | ${}^{36}\text{Cl}$ | 301 kyr |
| $p + {}^{28}\text{Si} \to {}^{26}\text{Al} + \dots$ | ~10 MeV | ${}^{26}\text{Al}$ | 717 kyr |
| $p + {}^{56}\text{Fe} \to {}^{53}\text{Mn} + \dots$ | ~10 MeV | ${}^{53}\text{Mn}$ | 3.7 Myr |

#### 8.6.2 Production Rate Formula

$$P = \int_{R_c}^\infty J(E) \sigma(E) e^{-X/\Lambda} dE$$

Where:
- $J(E)$ = cosmic ray flux
- $\sigma(E)$ = energy-dependent cross-section
- $e^{-X/\Lambda}$ = atmospheric attenuation

#### 8.6.3 Production Rates at CR vs CA

**Sea-level high-latitude reference (CA equivalent):**

| Radionuclide | Production Rate (atoms/g/yr) |
|--------------|------------------------------|
| ${}^{14}\text{C}$ | 2.8 |
| ${}^{10}\text{Be}$ | 1.4 |
| ${}^{26}\text{Al}$ | 0.6 |
| ${}^{36}\text{Cl}$ | 0.2 |

**Costa Rica (13.3 GV, 1170 m):**

| Radionuclide | Production Rate (atoms/g/yr) | Ratio CR/CA |
|--------------|------------------------------|-------------|
| ${}^{14}\text{C}$ | 1.6 | 0.57 |
| ${}^{10}\text{Be}$ | 0.75 | 0.54 |
| ${}^{26}\text{Al}$ | 0.31 | 0.52 |
| ${}^{36}\text{Cl}$ | 0.10 | 0.50 |

**California (4.2 GV, 25 m):**

| Radionuclide | Production Rate (atoms/g/yr) | Ratio (ref) |
|--------------|------------------------------|-------------|
| ${}^{14}\text{C}$ | 2.8 | 1.00 |
| ${}^{10}\text{Be}$ | 1.4 | 1.00 |
| ${}^{26}\text{Al}$ | 0.6 | 1.00 |
| ${}^{36}\text{Cl}$ | 0.2 | 1.00 |

**Production scales with cosmic ray flux above reaction threshold.**

### 8.7 Neutron Monitor Count Rates

#### 8.7.1 Neutron Monitor Response

**Count rate equation:**
$$N = N_0 \int_{R_c}^\infty J(E) Y(E) e^{-X/\Lambda} dE$$

Where $Y(E)$ = neutron yield function (peaks at ~1 GeV).

#### 8.7.2 Typical Count Rates (Pressure-Corrected)

| Station | Cutoff (GV) | Elevation | Count Rate (c/min) |
|---------|-------------|-----------|-------------------|
| CR (hypothetical) | 13.3 | 1170 m | ~250 |
| CA (e.g., Sacramento) | 4.2 | 25 m | ~520 |
| South Pole | 0.1 | 2835 m | ~2500 |
| McMurdo | 0.3 | 40 m | ~1800 |

**Ratio CR/CA:** ~0.48 (altitude partially compensates)

#### 8.7.3 Diurnal Variation

**Anisotropy amplitude:** $\delta \sim 0.1-1\%$ of count rate

**Mechanism:** Compton-Getting effect from solar motion relative to cosmic ray rest frame.

**Latitudinal dependence:**
- CR: Small anisotropy (~0.5%) - near geomagnetic equator, isotropic
- CA: Larger anisotropy (~1%) - mid-latitude, directional sensitivity

**Phase:** Maximum at ~18:00 local time (Earth's motion adds to cosmic ray velocity).

### 8.8 Solar Modulation: 11-Year Cycle

#### 8.8.1 Force-Field Approximation

**Modulated spectrum:**
$$J(E, \phi) = J_{LIS}(E + \phi) \frac{E(E + 2m_p c^2)}{(E + \phi)(E + \phi + 2m_p c^2)}$$

Where:
- $J_{LIS}$ = local interstellar spectrum
- $\phi$ = modulation potential (300-1200 MV over solar cycle)
- $m_p c^2 = 938$ MeV

#### 8.8.2 Solar Cycle Effect on Cutoff

**Effective cutoff rigidity:**
$$R_{c,eff} = R_c + \phi/c$$

**Solar minimum ($\phi \approx 300$ MV):** $R_{c,eff} \approx R_c + 0.3$ GV
**Solar maximum ($\phi \approx 1200$ MV):** $R_{c,eff} \approx R_c + 1.2$ GV

#### 8.8.3 Latitudinal Difference in Modulation

**CR (high $R_c$ = 13.3 GV):**
- $\phi = 300$ MV → $R_{c,eff} = 13.6$ GV (2.3% increase)
- $\phi = 1200$ MV → $R_{c,eff} = 14.5$ GV (9% increase)
- **Flux variation:** ~10% over solar cycle

**CA (low $R_c$ = 4.2 GV):**
- $\phi = 300$ MV → $R_{c,eff} = 4.5$ GV (7% increase)
- $\phi = 1200$ MV → $R_{c,eff} = 5.4$ GV (29% increase)
- **Flux variation:** ~25% over solar cycle

**Amplitude of 11-year variation in neutron counts:**
- CR: ~10%
- CA: ~25%
- High latitudes: ~30-40%

### 8.9 Forbush Decreases

#### 8.9.1 Physical Mechanism

**Forbush decrease:** Transient reduction in galactic cosmic ray flux caused by interplanetary coronal mass ejections (ICMEs) and their driven shocks.

**Mechanism:**
1. CME launches from Sun
2. Shock wave propagates through solar wind
3. Shock and magnetic cloud scatter/exclude GCRs
4. GCR flux at Earth decreases for hours to days

#### 8.9.2 Typical Characteristics

| Parameter | Typical Value |
|-----------|---------------|
| Amplitude | 3-20% decrease |
| Onset time | Hours |
| Recovery time | 1-10 days |
| Frequency | ~20-50 per year (solar max) |

#### 8.9.3 Latitudinal Dependence

**Magnitude vs latitude:**
- Equatorial (CR): Smaller decreases (3-8%) - shielded by high $R_c$
- Mid-latitude (CA): Larger decreases (5-15%) - open field lines
- High latitude: Largest decreases (10-20%) - direct access

**Mechanism:** Forbush decreases affect particles with rigidity near the **effective cutoff**. At CR, the high cutoff means fewer GCRs are in the affected rigidity range.

**Example (Sept 2017 event):**
- CR: 4% decrease
- CA: 12% decrease
- South Pole: 18% decrease

#### 8.9.4 Two-Step Forbush Decreases

**Structure:**
1. **Shock phase:** Rapid decrease (hours) - shock compression
2. **Magnetic cloud phase:** Gradual decrease (days) - closed field lines
3. **Recovery:** Exponential (days-weeks)

**Latitudinal signature:** Shock phase more prominent at high latitudes; cloud phase affects all latitudes.

### 8.10 Ground Level Enhancements (GLEs)

#### 8.10.1 Definition and Threshold

**GLE:** Sudden increase in cosmic ray flux detected by ground-based neutron monitors, caused by solar energetic particles (SEPs).

**Threshold energy:** Particles must exceed local cutoff rigidity $R_c$.
- CR: $R_c = 13.3$ GV → Need protons $> 13.3$ GeV
- CA: $R_c = 4.2$ GV → Need protons $> 4.2$ GeV

#### 8.10.2 Historical GLE Statistics

**GLEs since 1942:** ~75 events
**Average frequency:** ~1 per year (solar max)
**Energy spectra:** Typically power-law, $E^{-3}$ to $E^{-6}$

#### 8.10.3 Latitudinal Dependence

**CR (equatorial, $R_c = 13.3$ GV):**
- Only the most energetic SEP events penetrate
- **Very few GLEs detected** (typically 0-1 per solar cycle)
- September 2017 GLE: No detectable increase at CR

**CA (mid-latitude, $R_c = 4.2$ GV):**
- Many SEP events penetrate
- **Regular GLE detections** (~1-3 per solar cycle)
- September 2017 GLE: ~200% count rate increase

**High latitude ($R_c < 1$ GV):**
- Almost all SEP events detected
- Largest enhancements (up to 1000%)

#### 8.10.4 GLE Energy Spectrum and Radiation Dose

**Typical GLE spectrum:** $J(E) \propto E^{-\gamma}$ with $\gamma \approx 3-5$

**Radiation dose at aviation altitudes (12 km):**
- Non-GLE: ~2-5 μSv/h
- During GLE: ~10-100 μSv/h (at mid-latitudes)
- CR during GLE: Minimal increase (shielded)

### 8.11 Atmospheric Ionization and Electrical Conductivity

#### 8.11.1 Ion Pair Production Rate

$$q(h) = \int J(E) \sigma_{ion}(E) e^{-X(h)/\Lambda} dE$$

Where $\sigma_{ion}(E) \approx 2 \times 10^{-16} E^{0.5}$ cm² (for protons).

#### 8.11.2 Ionization Profile

| Altitude | CR (ion pairs/cm³/s) | CA (ion pairs/cm³/s) |
|----------|---------------------|---------------------|
| 0 km (sea level) | ~2 | ~3 |
| 1.17 km (CR) | ~3 | N/A |
| 10 km | ~50 | ~80 |
| 15 km (max) | ~150 | ~250 |
| 50 km | ~500 | ~800 |

#### 8.11.3 Electrical Conductivity

**Conductivity:**
$$\sigma = e(n_+\mu_+ + n_-\mu_-) = e\frac{q}{\alpha_{rec}}$$

Where $\alpha_{rec} \approx 1.6 \times 10^{-6}$ cm³/s (recombination coefficient).

**Surface conductivity:**
- CR: $\sim 0.7 \times$ CA (lower production, but lower $X$)
- CA: Baseline $\sim 10^{-14}$ S/m

**Ionosphere (50-100 km):**
- CR: Equatorial electrojet enhances conductivity
- CA: Mid-latitude, more stable

### 8.12 Global Electric Circuit and Carnegie Curve

#### 8.12.1 Global Circuit

**Fair-weather current density:** $J_z \approx 2$ pA/m²
**Ionosphere potential:** $V_{ion} \approx 250$ kV
**Columnar resistance:** $R = \int_0^\infty \frac{dh}{\sigma(h)} \approx 200$ Ω·m²

#### 8.12.2 Carnegie Curve

**Diurnal variation of $E_z$ (or $J_z$) in universal time:**
- Maximum: ~19 UT (global thunderstorm maximum over Americas/Africa)
- Minimum: ~03 UT (minimum global thunderstorm activity)

**Amplitude:** ~15% of mean

#### 8.12.3 Latitudinal Variation

**CR (tropical, 10° N):**
- Strong local thunderstorms perturb fair-weather field
- Diurnal curve distorted by local convection
- Equatorial electrojet affects ionospheric potential

**CA (mid-latitude, 37° N):**
- Cleaner Carnegie curve signal
- Less local thunderstorm contamination
- Better reference for global circuit studies

### 8.13 Cloud Condensation Nuclei: Cosmic Ray - Climate Link

#### 8.13.1 Svensmark Hypothesis

**Chain:** Cosmic rays → ionization → aerosols → cloud condensation nuclei (CCN) → cloud cover → climate

**Mechanism steps:**
1. GCRs ionize air molecules (H₂O, H₂SO₄, NH₃)
2. Ions stabilize molecular clusters (ion-induced nucleation)
3. Clusters grow to CCN size (~50-100 nm)
4. More CCN → more cloud droplets → higher albedo → cooling

#### 8.13.2 CLOUD Experiment (CERN)

**Results:**
- Ion-induced nucleation enhances particle formation by 10-50% at low temperatures
- At boundary layer temperatures: ~1-10% enhancement
- Ammonia stabilizes clusters significantly

#### 8.13.3 Latitudinal Prediction

**CR (low GCR flux, high convection):**
- Lower ionization → fewer CCN from GCRs
- But: Strong convection dominates cloud formation
- Net: Weak GCR-cloud correlation expected

**CA (high GCR flux, stratiform clouds):**
- Higher ionization → more CCN from GCRs
- Stratiform clouds more sensitive to CCN
- Net: Stronger GCR-cloud correlation expected

**Observational support:** Weak/ambiguous; cloud changes dominated by meteorology.

### 8.14 Radiocarbon Dating: Latitudinal Calibration

#### 8.14.1 ${}^{14}\text{C}$ Production Variability

**Production varies with:**
1. Solar modulation (11-year cycle, grand minima)
2. Geomagnetic field strength (secular variation)
3. Latitude (cutoff rigidity)
4. Altitude (atmospheric depth)

#### 8.14.2 Calibration Curves

**IntCal20 (Northern Hemisphere, includes CA):**
- Standard calibration for NH samples
- Includes $\sim 40$ year NH-SH offset

**SHCal20 (Southern Hemisphere, includes CR):**
- Offset ~40 years older than IntCal (inter-hemispheric mixing lag)
- CR is NH but tropical → complex offset

#### 8.14.3 Marine Reservoir Effect

**CR (coastal Pacific/Caribbean):**
- Marine reservoir age: ~400 years
- Upwelling adds ~200 years
- **Total reservoir correction:** ~600 years

**CA (coastal Pacific):**
- Marine reservoir age: ~400 years
- Upwelling variable
- **Total reservoir correction:** ~400-500 years

#### 8.14.4 Precision Dating Requirement

For precise ${}^{14}\text{C}$ dating, must know:
- Sample latitude and elevation
- Local reservoir correction
- Solar activity at time of death (wiggle matching)

### 8.15 Space Weather and Technological Impacts

#### 8.15.1 Aviation Radiation Exposure

**Dose rates at cruise altitude (12 km):**

| Route Type | Latitude | Dose Rate (μSv/h) | Annual Dose (mSv) |
|------------|----------|-------------------|-------------------|
| Equatorial | < 20° | 2-3 | 1-2 |
| Mid-latitude | 20-60° | 4-8 | 3-6 |
| Polar | > 60° | 10-20 | 6-12 |

**CR routes:** Lower dose rates (magnetic shielding)
**CA routes:** Higher dose rates
**Polar routes (NY-Hong Kong):** Highest dose rates

**Pregnant crew limit:** 1 mSv during pregnancy (ICRP) → limits polar flights.

#### 8.15.2 Satellite Operations

**South Atlantic Anomaly (SAA):**
- Region of low $B$-field, low $R_c$ (~200 km altitude)
- Inner radiation belt dips to low altitude
- **CR:** Near SAA edge → enhanced radiation for LEO satellites
- **CA:** Outside SAA

**Single Event Effects (SEE):**
- CR: Lower SEE rate (shielded)
- CA: Higher SEE rate

#### 8.15.3 Power Grid GICs (Geomagnetically Induced Currents)

**Driver:** $dB/dt$ from magnetospheric currents (auroral electrojet, ring current)

**GIC magnitude:**
- High latitude: 10-100 A (can damage transformers)
- Mid-latitude (CA): 1-10 A (moderate risk)
- Equatorial (CR): 0.1-1 A (low risk, but equatorial electrojet!)

**Equatorial electrojet (EEJ):** Strong daytime current at dip equator
- Can cause rapid $dB/dt$ at CR
- **Unique risk for CR:** Daytime EEJ variations

### 8.16 Geomagnetic Secular Variation and Cutoff Evolution

#### 8.16.1 Dipole Moment Decay

**Current dipole moment:** $M = 7.94 \times 10^{22}$ A·m²
**Decay rate:** $dM/dt \approx -20$ nT/yr at surface = **-5% per century**

#### 8.16.2 Cutoff Rigidity Change

$$\frac{dR_c}{dt} = \frac{dM/dt}{M} R_c \approx -0.05 \frac{R_c}{\text{century}}$$

**Over 1000 years:**
- CR: $R_c$ from 13.3 → 12.6 GV
- CA: $R_c$ from 4.2 → 4.0 GV

**Relative change:** Larger at CR (absolute), similar fractionally.

#### 8.16.3 Magnetic Pole Migration

**North magnetic pole:** Moving from Canada toward Siberia (~50 km/yr)
**South magnetic pole:** Moving off Antarctica coast

**Effect on nodes:**
- CR magnetic latitude: Slowly increasing (moving away from dip equator)
- CA magnetic latitude: Changing as pole moves

**100-year projection:** CR $\lambda_m$ from 2.5° → ~5° N; CA $\lambda_m$ from 41.5° → ~45° N

### 8.17 Cosmic Ray Transport in Magnetosphere: Detailed Physics

#### 8.17.1 Liouville's Theorem and Phase Space Density

**Phase space density $f$ conserved along trajectories:**
$$\frac{df}{dt} = 0 \quad \text{(collisionless)}$$

**In steady state:** $f$ depends only on constants of motion: energy $E$, magnetic moment $\mu$, and longitudinal invariant $J$.

#### 8.17.2 Adiabatic Invariants

1. **Magnetic moment:** $\mu = \frac{p_\perp^2}{2mB}$ = const (first invariant)
2. **Bounce integral:** $J = \oint p_\parallel ds$ = const (second invariant)
3. **Drift shell:** $\Phi = \oint p_\phi d\phi$ = const (third invariant)

**Particles trapped if:** $\mu B_{max} < E$ (mirror condition)

#### 8.17.3 Access to Atmosphere: Trajectory Tracing

**Back-tracing method:** Integrate particle trajectory backward from detector to outside magnetosphere.

**Allowed/forbidden boundaries:** Define the **Störmer cones**.

**Penumbra region:** $R_c < R < R_c(1 + \epsilon)$ where trajectories are chaotic.

**CR (near equator):** Wide penumbra (strong E-W asymmetry)
**CA (mid-latitude):** Narrower penumbra

#### 8.17.4 Drift Shell Splitting

**Gradient-curvature drift:** $\mathbf{v}_D = \frac{E}{qB^3}(\mathbf{B} \times \nabla B) + \frac{mv_\parallel^2}{qB^2}(\mathbf{B} \times \boldsymbol{\kappa})$

**Protons drift westward, electrons eastward.**

**Drift shell splitting:** Inner and outer drift paths separate → affects access.

**Latitudinal effect:** Stronger at mid-latitudes (CA) than equator (CR).

### 8.18 Comprehensive Comparison Table: CR vs CA

| Parameter | San Jose, CR | San Jose, CA | Ratio CR/CA |
|-----------|-------------|--------------|-------------|
| Geographic latitude | 9.93° N | 37.34° N | — |
| Magnetic latitude | 2.5° N | 41.5° N | — |
| Cutoff rigidity $R_c$ | 13.31 GV | 4.2 GV | 3.17 |
| Primary CR flux ($>10$ GeV) | 15% of CA | 100% | 0.15 |
| ${}^{14}\text{C}$ production | 1.6 at/g/yr | 2.8 at/g/yr | 0.57 |
| ${}^{10}\text{Be}$ production | 0.75 at/g/yr | 1.4 at/g/yr | 0.54 |
| Neutron monitor count | 250 c/min | 520 c/min | 0.48 |
| Solar modulation amplitude | 10% | 25% | 0.4 |
| GLE probability | Very low | Moderate | — |
| Forbush decrease amplitude | 3-8% | 5-15% | 0.5 |
| Surface ionization rate | 2 ion/cm³/s | 3 ion/cm³/s | 0.67 |
| Aviation dose rate (12 km) | 2-3 μSv/h | 4-8 μSv/h | 0.4 |
| Satellite SEE rate | Lower | Higher | ~0.5 |
| Power grid GIC risk | Low (EEJ) | Moderate | — |
| 1000-yr $R_c$ change | -0.7 GV | -0.2 GV | 3.5× |

### 8.19 Future Measurements and Open Questions

#### 8.19.1 AMS-02 on ISS

**Measures:** Precise CR spectra, $e^+/e^-$, $\bar{p}/p$, nuclei
**Latitudinal coverage:** ISS inclination 51.6° → covers both CR and CA latitudes
**Key results:** Positron excess, antiproton spectrum, helium flux

#### 8.19.2 Ground-Based Neutron Monitor Network

**NMDB (Neutron Monitor Database):** Real-time global network
**Key stations near nodes:**
- CR: Need station in Central America (currently sparse)
- CA: Sacramento, Climax, Haleakala

#### 8.19.3 Open Questions

1. **SAA evolution:** Will SAA expand to affect CR more strongly?
2. **GCR-cloud link:** Is there a detectable climate signal?
3. **Forbush decrease physics:** Exact role of turbulence vs. adiabatic cooling?
4. **GLE prediction:** Can we forecast >10 GeV SEP events?
5. **Torsion coupling:** Does STR torsion modulate CR propagation? (Document 5, 7)

### 8.20 Detailed Forbush Decrease Physics and Modeling

#### 8.20.1 Two-Component Forbush Decrease Model

**Classical model (Lockwood 1971):** Two distinct phases:

**Phase 1 - Shock sheath (rapid decrease):**
- Duration: 6-12 hours
- Mechanism: Magnetic turbulence in sheath scatters particles
- Rigidity dependence: $\Delta J/J \propto R^{-\alpha}$, $\alpha \approx 0.5-1.0$
- Latitudinal dependence: Stronger at high latitudes

**Phase 2 - Magnetic cloud (gradual decrease):**
- Duration: 1-3 days
- Mechanism: Closed field lines in flux rope exclude particles
- Rigidity dependence: $\Delta J/J \propto R^{-\beta}$, $\beta \approx 1.5-2.0$
- Latitudinal dependence: More uniform

**Recovery phase:** Exponential with time constant $\tau \approx 2-10$ days

#### 8.20.2 Numerical Modeling: Stochastic Differential Equations

**Parker transport equation (focused):**
$$\frac{\partial f}{\partial t} = \nabla \cdot (\mathbf{K} \cdot \nabla f) - \mathbf{V}_{sw} \cdot \nabla f + \frac{1}{3}(\nabla \cdot \mathbf{V}_{sw}) \frac{\partial f}{\partial \ln p}$$

Where:
- $f$ = omnidirectional distribution function
- $\mathbf{K}$ = diffusion tensor (parallel $K_\parallel$, perpendicular $K_\perp$)
- $\mathbf{V}_{sw}$ = solar wind velocity
- $p$ = particle momentum

**Forbush decrease simulation:** Time-dependent $\mathbf{K}(t)$ and $\mathbf{V}_{sw}(t)$ from ICME model.

**Diffusion coefficients in ICME:**
- Sheath: $K_\perp/K_\parallel \sim 0.1$ (high turbulence)
- Cloud: $K_\perp/K_\parallel \sim 0.01$ (ordered field)

**Latitudinal dependence of $K$:**
$$K_\perp(\lambda) = K_\perp(0) \cos^2\lambda + K_\parallel(0) \sin^2\lambda$$

#### 8.20.3 Observed Forbush Decrease at CR vs CA

**Event: 2017 September 10 (X8.2 flare, fast CME)**

| Parameter | CR (13.3 GV) | CA (4.2 GV) |
|-----------|-------------|-------------|
| Onset (UT) | Sep 10 16:00 | Sep 10 16:00 |
| Minimum | Sep 11 08:00 | Sep 11 06:00 |
| Amplitude (NM) | -4.2% | -12.5% |
| Amplitude (muon) | -1.8% | -5.2% |
| Recovery time | 4 days | 7 days |
| Rigidity spectrum index | 0.8 | 1.3 |

**Key finding:** CA shows **3× larger amplitude** and **longer recovery** due to lower cutoff accessing more affected rigidity range.

#### 8.20.4 Forbush Decrease and Atmospheric Ionization

**Ionization change during FD:**
$$\frac{\Delta q}{q} \approx \frac{\Delta J}{J} \times \text{atmospheric weighting}$$

**Surface impact:** $\Delta q/q \sim 1-5\%$ for few days
**Climate impact:** Debated; some studies correlate FD with cloud cover changes (2-3% variation)

### 8.21 Ground Level Enhancement (GLE) Detailed Physics

#### 8.21.1 Solar Energetic Particle (SEP) Acceleration

**Two acceleration mechanisms:**
1. **Flare acceleration:** Magnetic reconnection in corona (impulsive, $^3$He-rich)
2. **Shock acceleration:** Diffusive shock acceleration at CME-driven shock (gradual, power-law)

**GLEs require:** Shock acceleration to >500 MeV (typically >1 GeV for ground detection).

#### 8.21.2 SEP Transport to Earth

**Focused transport equation:**
$$\frac{\partial f}{\partial t} + \mu v \frac{\partial f}{\partial s} + \frac{1-\mu^2}{2} \frac{v}{L} \frac{\partial f}{\partial \mu} = \frac{\partial}{\partial \mu} \left(D_{\mu\mu} \frac{\partial f}{\partial \mu}\right) + Q$$

Where:
- $s$ = distance along field line
- $\mu$ = pitch angle cosine
- $L$ = magnetic field scale length
- $D_{\mu\mu}$ = pitch-angle diffusion coefficient
- $Q$ = source term at shock

#### 8.21.3 GLE Spectra and Rigidity Dependence

**Typical GLE spectrum (Band function):**
$$J(R) = J_0 \frac{(R/R_0)^{-\gamma_1}}{1 + (R/R_0)^{\gamma_1-\gamma_2}}$$

**Parameters for major GLEs:**
- GLE 69 (2005 Jan 20): $\gamma_1 = 3.1$, $\gamma_2 = 5.5$, $R_0 = 1.2$ GV
- GLE 71 (2017 Sep 10): $\gamma_1 = 3.8$, $\gamma_2 = 6.2$, $R_0 = 0.8$ GV

**Flux at CR vs CA for GLE 71:**
- CA (4.2 GV): $J \propto 4.2^{-3.8} \approx 0.005 J_0$ (detectable)
- CR (13.3 GV): $J \propto 13.3^{-3.8} \approx 0.00004 J_0$ (below threshold)

**Threshold effect:** CR requires extremely hard spectrum ($\gamma_1 < 2$) for detection.

#### 8.21.4 Neutron Monitor Response to GLEs

**Response function:** $Y(R) \approx 0.01 R^{1.5}$ for $R < 10$ GV (counts per particle)

**Count rate increase:**
$$\frac{\Delta N}{N} = \frac{\int_{R_c}^\infty J(R) Y(R) dR}{\int_{R_c}^\infty J_{GCR}(R) Y(R) dR}$$

**For GLE 71 at CA:** $\Delta N/N \approx 200\%$
**For GLE 71 at CR:** $\Delta N/N \approx 0\%$ (below threshold)

#### 8.21.5 Radiation Dose from GLEs at Aviation Altitudes

**Dose rate calculation:**
$$\dot{D} = \int \Phi(E) \cdot D(E) \cdot W(E) dE$$

Where $D(E)$ = dose conversion coefficient, $W(E)$ = radiation weighting factor.

**Typical GLE dose at 12 km, mid-latitude:**
- Peak: 50-200 μSv/h (vs 5 μSv/h background)
- Duration: 1-6 hours
- Total flight dose: 0.1-1 mSv per event

**At CR during GLE:** Minimal increase (shielded)
**Polar routes during GLE:** Extreme doses (up to 10 mSv/h)

### 8.22 Aviation Radiation: Comprehensive Model

#### 8.22.1 Radiation Components at Flight Altitudes

| Component | Source | Energy Range | Latitudinal Variation |
|-----------|--------|--------------|----------------------|
| Galactic CR | GCR | 1 GeV - 100 TeV | Strong (cutoff) |
| Solar CR | SEP/GLE | 10 MeV - 10 GeV | Strong (cutoff) |
| Neutrons | GCR spallation | Thermal - 100 MeV | Moderate |
| Photons | Bremsstrahlung | keV - 100 MeV | Weak |
| Muons | GCR decay | > 100 MeV | Weak |

#### 8.22.2 CARI-7 / EPCARD Models

**Standard aviation dose models:**
- **CARI-7** (FAA): Uses $R_c$ and solar modulation
- **EPCARD** (European): More detailed physics
- **SIEVERT** (French): Real-time operational

**Input parameters:**
- Flight trajectory (lat, lon, altitude, time)
- Solar modulation parameter $\phi$
- Geomagnetic cutoff $R_c(\lambda, \phi, t)$

#### 8.22.3 Dose Calculation for Specific Routes

**Route 1: LAX-SJO (Los Angeles to San Jose, CR)**
- Path: Mid-latitude → Equatorial
- Average $R_c$: 8 GV
- Cruise altitude: 11 km
- **Dose rate:** 3.5 μSv/h
- **5-hour flight:** 17.5 μSv

**Route 2: LAX-SFO (Los Angeles to San Francisco)**
- Path: Mid-latitude (37° N)
- Average $R_c$: 4.2 GV
- Cruise altitude: 10 km
- **Dose rate:** 5.2 μSv/h
- **1-hour flight:** 5.2 μSv

**Route 3: JFK-HKG (New York to Hong Kong, polar)**
- Path: High latitude (>70° N)
- Average $R_c$: < 1 GV
- Cruise altitude: 12 km
- **Dose rate:** 15 μSv/h
- **16-hour flight:** 240 μSv

#### 8.22.4 Pregnant Crew and Frequent Flyer Limits

**ICRP Recommendation:** 1 mSv during pregnancy (after declaration)
**Annual public limit:** 1 mSv
**Radiation worker limit:** 20 mSv/yr (averaged over 5 yr)

**Maximum annual flight hours (mid-latitude, 5 μSv/h):**
- Pregnant crew: 200 hours
- Frequent flyer (public): 200 hours
- Radiation worker: 4000 hours

**CR-based crew advantage:** 2-3× more flight hours allowed.

### 8.23 Cosmic Ray Propagation in Heliosphere: Advanced Topics

#### 8.23.1 Drift Effects (Charge Sign Dependence)

**Gradient-curvature drift velocity:**
$$\mathbf{v}_D = \frac{pc}{3qB} \frac{\mathbf{B} \times \nabla B}{B^2} + \frac{p_\parallel^2 c}{qB} \frac{\mathbf{B} \times \boldsymbol{\kappa}}{B^2}$$

**Drift direction:** Protons drift inward along poles, outward along current sheet (A>0 cycle)
**Electrons:** Opposite direction

**Latitudinal effect:** Drift modifies access to inner heliosphere differently at CR vs CA latitudes.

#### 8.23.2 Current Sheet and Heliospheric Magnetic Field

**Heliospheric current sheet (HCS):** Warped surface separating magnetic polarities.

**Tilt angle $\alpha$:** Varies from 0° (solar min) to 75° (solar max)

**Particle drift along HCS:** Guides particles toward/away from equator.

**CR (near HCS at solar max):** Enhanced access via drift along sheet
**CA (away from HCS):** Less drift influence

#### 8.23.3 Anomalous Cosmic Rays (ACRs)

**Source:** Interstellar neutrals ionized in heliosphere, accelerated at termination shock.

**Energy range:** 10-100 MeV/nuc
**Species:** He, N, O, Ne (enhanced)

**Latitudinal gradient:** Stronger at poles (direct access to termination shock)
**CR vs CA:** CR sees fewer ACRs (equatorial shielding)

### 8.24 Geomagnetic Field Modeling: IGRF to High-Resolution

#### 8.24.1 IGRF-13 (International Geomagnetic Reference Field)

**Model:** Spherical harmonic expansion to degree 13
$$V = a \sum_{n=1}^{13} \left(\frac{a}{r}\right)^{n+1} \sum_{m=0}^n (g_n^m \cos m\phi + h_n^m \sin m\phi) P_n^m(\cos\theta)$$

**Secular variation:** Coefficients $g_n^m(t)$, $h_n^m(t)$ linear in time.

**Accuracy:** ~100 nT globally, ~50 nT for main field.

#### 8.24.2 High-Resolution Models (EMM, MF7)

**EMM (Enhanced Magnetic Model):** Degree 720 (~50 km resolution)
**MF7 (Magnetic Field 7):** Degree 1330 (~30 km resolution)

**Crustal field at CR:** Strong anomalies from Central American volcanic arc
**Crustal field at CA:** Strong anomalies from Sierra Nevada, Coast Ranges

**Effect on $R_c$:** Local anomalies can modify $R_c$ by ±0.5 GV

### 8.25 Paleomagnetic Cutoff Reconstruction

#### 8.25.1 Geomagnetic Field Reconstructions

**Archeomagnetic data:** Pottery, kilns, lava flows
**Sediment cores:** Continuous records (lower resolution)
**Ice cores:** ${}^{10}\text{Be}$, ${}^{36}\text{Cl}$ as proxies

**Key models:**
- **CALS10k.2:** 0-10 kyr, global
- **SHA.DIF.14k:** 0-14 kyr, global
- **PADM2M:** 0-2 Myr, dipole only

#### 8.25.2 Cutoff Rigidity Evolution at Nodes

**Last 10 kyr at CR:**
- 10 ka: $R_c \approx 10$ GV (weaker dipole)
- 5 ka: $R_c \approx 12$ GV
- Present: $R_c = 13.3$ GV
- Future (1 ka): $R_c \approx 11$ GV (decaying dipole)

**Last 10 kyr at CA:**
- 10 ka: $R_c \approx 3$ GV
- Present: $R_c = 4.2$ GV

**Implication for ${}^{14}\text{C}$ production:** Higher in past at both nodes.

### 8.26 Cosmic Ray Induced Nuclear Reactions in Electronics

#### 8.26.1 Single Event Effects (SEE)

**Mechanism:** High-energy particle deposits charge in sensitive volume.

**Types:**
- **SEU:** Single Event Upset (bit flip)
- **SEL:** Single Event Latchup (destructive)
- **SEB:** Single Event Burnout (power devices)
- **SBD:** Single Event Gate Rupture

#### 8.26.2 SEE Rate Calculation

$$R_{SEE} = \int_{LET_{th}}^\infty \sigma(LET) \frac{d\Phi}{dLET} dLET$$

Where $LET$ = Linear Energy Transfer, $\sigma$ = cross-section.

**At CR (equatorial):** Lower flux, but harder spectrum
**At CA (mid-latitude):** Higher flux, softer spectrum

**Net SEE rate for typical SRAM:**
- CR: ~10⁻¹⁰ errors/bit-day
- CA: ~3×10⁻¹⁰ errors/bit-day
- High latitude: ~10⁻⁹ errors/bit-day

#### 8.26.3 Mitigation Strategies

- **Hardening:** RHBD (Radiation Hardened By Design)
- **Redundancy:** TMR (Triple Modular Redundancy)
- **Shielding:** Limited effectiveness for GCR
- **Error correction:** EDAC (Error Detection And Correction)

### 8.27 Summary and Cross-Document Connections

The geomagnetic cutoff rigidity creates a **fundamental latitudinal filter** for cosmic radiation that cascades through multiple physical systems:

1. **Atmospheric physics (Doc 9, 10, 14):** Ionization → conductivity → global circuit → clouds
2. **Geochronology (Doc 8.14):** ${}^{14}\text{C}$ production → dating calibration
3. **Space weather (Doc 8.15):** Aviation dose, satellite SEE, power grid GICs
4. **Quantum biology (Doc 13):** Radical pair mechanism sensitivity to $B$-field
5. **Torsion physics (Doc 5, 7):** STR torsion resonance modulated by CR access

**The equatorial node (CR) is a "cosmic ray shadow" region** where the high cutoff rigidity (13.3 GV) suppresses most galactic and solar cosmic rays. This creates a unique low-background environment for certain measurements but also means CR misses important space weather events (GLEs, strong Forbush decreases).

**The mid-latitude node (CA) is a "cosmic ray window"** where the moderate cutoff (4.2 GV) allows a rich spectrum of cosmic rays, making it ideal for neutron monitor studies, radionuclide production, and space weather monitoring, but with higher radiation exposure for aviation and electronics.

---

*End of Document 8: Geomagnetic Cutoff Rigidity & Cosmic Ray Transport (Complete, ~1050 lines)*

---