## 2. NDT Modalities — Technical Specifications

### 2.1 Ultrasonic Phased Array (UT-PA)

**System:** Olympus OmniScan X3, 64-channel, 0.5-15 MHz
**Application:** L2, L3, L7, L8 delamination, void, crack detection

```
Probe: 5L64 (5 MHz, 64 elem, 0.6 mm pitch)
Wedge: SA31-N55S (55° shear wave, Rexolite)
Scan: Linear encoder, 0.5 mm step, 200 mm/s
Focal Law: Sectorial scan 30°-70°, 16 focal depths

POD Model (â vs a):
$\text{POD}(a) = \Phi\left[\frac{\ln(a) - \ln(a_{50})}{\sigma}\right]$
$a_{50} = 0.8\text{ mm}$ (50% detection), $\sigma = 0.35$
$\text{POD}(0.5\text{mm}) = 0.92$, $\text{POD}(1.0\text{mm}) = 0.995$

Acceptance Criteria:
- No indication > 2 mm (equiv. flat-bottom hole)
- No planar indication > 5 mm length
- Signal-to-noise $\ge$ 12 dB (reference reflector)
```

### 2.2 Infrared Thermography (IR Flash & Lock-in)

**System:** FLIR X8500sc, 1280×1024, 30 μm pitch, <20 mK NETD
**Application:** L4 Aerogel density, L7 Ablative delam, L8 Foam cell collapse

```
Flash IR:
- Pulse: Xenon flash, 5 ms, 5 kJ
- Acquisition: 200 Hz × 10 s, 0.1°C resolution
- Defect contrast: $\Delta T/T > 0.5\%$ at $t = 2-5\text{ s}$

Lock-in IR:
- Modulation: 0.1-10 Hz sine, halogen lamps
- Phase image: $\varphi = \arctan(\text{Im}/\text{Re})$, amplitude: $A = \sqrt{\text{Re}^2+\text{Im}^2}$
- Depth resolution: $\delta z \approx \sqrt{\alpha/(\pi f)}$ ($\alpha$ = thermal diffusivity)

Thermal Diffusivity Targets:
- Aerogel: $\alpha \approx 0.02\text{ mm}^2/\text{s} \rightarrow f_{\text{opt}} = 0.5\text{ Hz}$
- Ablative: $\alpha \approx 0.1\text{ mm}^2/\text{s} \rightarrow f_{\text{opt}} = 2\text{ Hz}$
- Foam: $\alpha \approx 0.05\text{ mm}^2/\text{s} \rightarrow f_{\text{opt}} = 1\text{ Hz}$

Heat diffusion equation: $\frac{\partial T}{\partial t} = \alpha \nabla^2 T$
```

### 2.3 X-ray Computed Tomography (X-ray CT)

**System:** Nikon XT H 225 ST, 225 kV, 225 W, 3 μm voxel
**Application:** L3 Ceramic tile bonds, L8 Auxetic foam architecture, L5 Faraday mesh continuity

```
Scan Parameters:
- Voltage: 180 kV, Current: 1.2 mA
- Filter: 1 mm Cu + 0.5 mm Al
- Voxel: 10 μm (production), 3 μm (FAI)
- Rotation: 360°, 3600 projections, 4 frame avg
- Reconstruction: Feldkamp FDK, beam hardening correction

Spatial resolution: $\delta x = \frac{d_{det}}{M} \sqrt{\frac{1}{N_{proj}}}$ ($M$ = magnification)
Contrast-to-noise: $\text{CNR} = \frac{|\mu_1 - \mu_2| \cdot t}{\sigma_N}$ ($\mu$ = attenuation coeff)
Beam hardening correction: $I_{corr} = I_{meas} \cdot e^{\int \mu(E) dx}$

Defect Detection:
- Voids: $\ge$ 3 voxels (30 μm at 10 μm voxel)
- Cracks: $\ge$ 5 voxels length, aspect > 10:1
- Debonds: Interface separation > 10 μm
- Foreign material: $\Delta\rho > 20\%$ matrix density

Dose: < 5 Gy per scan (ISO 17636-2 compliant)
```

### 2.4 Eddy Current Testing (ECT)

**System:** Zetec MIZ-21A, 200 kHz-2 MHz, 100 ch multiplexer
**Application:** L5 Faraday mesh wire breaks, L10 MHD windings

```
Probe: Absolute pancake, 8 mm OD, 500 kHz
Reference: 10% IACS conductivity standard
Lift-off: 0.5 mm (compensated via dual-frequency)

Skin depth: $\delta = \sqrt{\frac{2}{\omega \mu \sigma}}$ ($\omega = 2\pi f$)
Impedance change: $\Delta Z = \frac{j\omega\mu_0 N^2 A}{l} \cdot \frac{\Delta\sigma}{\sigma} \cdot F(\delta/a)$
Dual-frequency lift-off compensation: $Z_{comp} = Z_{f_1} - k Z_{f_2}$

Detection Capability:
- Wire break: 100% at 0.1 mm gap
- Conductivity variation: $\Delta\sigma/\sigma > 2\%$
- Layer thickness: $\pm 5\ \mu\text{m}$ (calibrated)

Acceptance:
- No breaks in conductive path
- Resistance per unit length: $R' = 0.12 \pm 0.02\ \Omega/\text{m}$
- Shielding effectiveness: $\text{SE} > 60\text{ dB}$ (10 kHz-10 GHz)
```

### 2.5 Shearography (Laser Speckle Shearography)

**System:** Dantec Q-800, 532 nm, 10 mW, shearing 15 μm
**Application:** L3, L7, L8 near-surface delamination, disbonds

```
Loading: Thermal (IR lamp, $\Delta T = 15^\circ\text{C}$), Vacuum (-50 kPa), Vibration (50 Hz, 2g)
Phase Stepping: 5-step, $2\pi/5$ increments
Spatial Resolution: 0.5 mm (sub-pixel correlation)

Strain Sensitivity: $\varepsilon_{\text{min}} = 10\ \mu\varepsilon$ (thermal), $5\ \mu\varepsilon$ (vacuum)
Phase shift: $\Delta\varphi = \frac{4\pi}{\lambda} \cdot \frac{\partial w}{\partial x} \cdot \Delta x$
Defect Sizing: 
- Diameter: $D_{\text{meas}} = D_{\text{true}} \left(1 + \frac{0.15}{\sqrt{D_{\text{true}}/\delta}}\right)$
- Depth: $z_{\text{meas}} = k \cdot \varphi_{\text{max}}$ ($k$ calibrated per material)

Acceptance:
- No phase anomaly $> 2\pi$ rad (full fringe)
- No cluster $> 3$ fringes within 10 mm
- Edge effects excluded (20 mm border)
```

### 2.6 Terahertz Time-Domain Spectroscopy (THz-TDS)

**System:** TeraView TPS Spectra 3000, 0.1-3 THz, 100 μm spot
**Application:** L4 Aerogel density gradients, L6 MOF coating thickness

```
Measurement: Reflection mode, normal incidence
Bandwidth: 0.2-2.5 THz (SNR > 40 dB)
Scan: XY raster, 200 μm step, 10 ms/pixel

Models:
- Aerogel: $n_{\text{eff}} = n_{\text{air}}(1-\phi) + n_{\text{silica}}\phi$ ($\phi$ = porosity)
  $\phi = 1 - \sqrt{\frac{n_{\text{eff}}-1}{n_{\text{silica}}-1}}$ (Looyenga)
- MOF Coating: $d = \frac{c \cdot \Delta t}{2n}$ ($n\approx 1.8$ from reference)

Fresnel reflection: $r = \frac{n_1 - n_2}{n_1 + n_2}$
Time-domain signal: $E(t) = \mathcal{F}^{-1}\{E(\omega)\}$
Resolution: $\delta d \approx \frac{\lambda}{4n} \approx 40\ \mu\text{m}$ at 1 THz
Repeatability: $\pm 5\ \mu\text{m}$ (coating), $\pm 2\%$ (porosity)
```

### 2.7 Optical Fiber Sensors (OFS) — Embedded NDT

**System:** Luna ODiSI 6100, 1.3 μm, 2.56 kHz, 1.6 mm spatial
**Application:** L11 Sensor fiber + distributed strain/temp on L1-L12

```
Fiber: Polyimide-coated SMF-28, 155 μm OD
Gauge Length: 1.6 mm (Rayleigh backscatter)
Strain Range: $\pm 10,000\ \mu\varepsilon$, Resolution: $1\ \mu\varepsilon$
Temp Range: $-40$ to $+200^\circ\text{C}$, Resolution: $0.1^\circ\text{C}$

Bragg wavelength shift: $\Delta\lambda_B = \lambda_B (1 - p_e) \varepsilon + \lambda_B (\alpha + \zeta) \Delta T$
Strain sensitivity: $K_\varepsilon = \lambda_B (1 - p_e) \approx 1.2\ \text{pm}/\mu\varepsilon$
Temp sensitivity: $K_T = \lambda_B (\alpha + \zeta) \approx 10\ \text{pm}/^\circ\text{C}$
Rayleigh scatter OFDR: $\nu(z) = \nu_0 + \frac{d\nu}{d\varepsilon}\varepsilon(z) + \frac{d\nu}{dT}T(z)$

Embedded Layout:
- 12 fibers (1 per layer), serpentine path
- FBG every 10 mm ($\lambda = 1520-1570\text{ nm}$, $\Delta\lambda = 0.4\text{ nm}$)
- Interrogation: Wavelength-division multiplexing

Health Monitoring:
- Real-time strain map during operation
- Thermal gradient detection (hot spot ID)
- Impact localization (wave propagation TOF)
```

---
