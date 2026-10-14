## 3. Protective Layer Integration (from MAT-03)

### 3.1 Ceramic Tile Miniaturization (per MAT-03 §3.1, CSMFAB078 Main §4.2, CSMFAB078-B §3.1, SYNTH-01 §4.4)

**ZrB₂-SiC Scaling Laws (from CSMFAB078 Main §4.2):**

Original AIMES tile: 150 mm × 150 mm × 6 mm, $V_{50} = 930\text{ m/s}$ (.30-06 APM2)

**Miniaturization to 25-50 mm:**

$$\frac{V_{50,\text{mini}}}{V_{50,\text{orig}}} = \left(\frac{t_{\text{mini}}}{t_{\text{orig}}}\right)^\alpha \left(\frac{A_{\text{mini}}}{A_{\text{orig}}}\right)^\beta$$

Where $\alpha = 0.5$, $\beta = -0.15$ (edge effect exponent).

**Target Specifications:**
| Parameter | 25 mm Tile | 50 mm Tile |
|-----------|------------|------------|
| Thickness | 4 mm | 6 mm |
| $V_{50}$ (est.) | 780 m/s | 890 m/s |
| Edge magnetic alignment | ±0.05 mm | ±0.1 mm |
| Gasket seal pressure | 0.5 MPa | 0.3 MPa |
| Areal density | 2.8 kg/m² | 4.2 kg/m² |

**Flash Sintering Profile (Scaled):**

$$\rho(t) = \rho_0 + (\rho_{\text{theo}} - \rho_0) \left[1 - \exp\left(-\frac{t}{\tau}\right)^n\right]$$

$\tau_{25\text{mm}} = 30\text{ s}$, $\tau_{50\text{mm}} = 60\text{ s}$ (vs. 120 s for 150mm)

### 3.2 MXene Thread Coating Process (per MAT-03 §3.2, CSMFAB078 Main §4.2, Research Doc 2 §6.2, SYNTH-01 §4.4)

**Ti₃C₂Tₓ Synthesis (per MAT-03 §3.2):**

$$\text{Ti}_3\text{AlC}_2 + \text{HF} \rightarrow \text{Ti}_3\text{C}_2\text{T}_x + \text{AlF}_3 + \text{H}_2$$

Etching: 50% HF, 35°C, 24 h → Delamination: TBAOH, 60°C, 2 h, sonication.

**Coating on Metallic Thread (Dip/Spray):**

$$\Gamma = \frac{C_0 \cdot V_{\text{dip}} \cdot \eta_{\text{adhesion}}}{A_{\text{thread}}}$$

Target: $\Gamma = 0.5\text{ mg/cm}^2$, $\eta_{\text{adhesion}} \geq 0.85$

**Flexibility Retention (Mandrel Bend Test):**

$$\text{Retention} = \frac{\sigma_{\text{coated}}}{\sigma_{\text{bare}}} \times 100\% \geq 90\% \quad \text{@ 5 mm mandrel}$$

### 3.3 Aerogel Micro-Encapsulation (per MAT-03 §3.3, CSMFAB078 Main §4.2, CSMFAB078-B §3.2, SYNTH-01 §4.5)

**Shell Materials (per MAT-03 §3.3):**
- **Primary:** Melamine-formaldehyde (MF), 50-100 nm shell
- **Secondary:** Polyurea, 20-50 nm shell (hybrid for toughness)
- **Core:** Silica aerogel, $\lambda = 0.015\text{ W/m·K}$, $\rho = 0.08\text{ g/cm}^3$

**Size Distribution (Log-normal):**

$$f(d) = \frac{1}{d \sigma \sqrt{2\pi}} \exp\left[-\frac{(\ln d - \ln d_{50})^2}{2\sigma^2}\right]$

$d_{50} = 75\ \mu\text{m}$, $\sigma = 0.4$ (span 50-100 μm)

**Quilting Integration:**

$$\lambda_{\text{eff}} = \lambda_{\text{aerogel}} \cdot \phi + \lambda_{\text{silk}} \cdot (1-\phi) + \lambda_{\text{air}} \cdot \phi_{\text{void}}$$

$\phi = 0.35$ (aerogel volume fraction in batting), target $\lambda_{\text{eff}} \leq 0.025\text{ W/m·K}$

### 3.4 STF Impregnation Protocol (per MAT-03 §3.4, CSMFAB078 Main §4.5, CSMFAB078-B §3.3, Research Doc 2 §6.4, SYNTH-01 §4.5)

**SiO₂-PEG Formulation (per MAT-03 §3.4):**
- SiO₂ nanoparticles: 20-50 nm, fumed silica (Aerosil® 200)
- PEG 400: Carrier fluid, $\eta = 90\text{ mPa·s}$ @ 25°C
- Volume fraction: $\phi = 0.45$ (near jamming transition $\phi_J \approx 0.52$)
- Additives: Silane coupling agent (3-APS) 2% w/w for fiber adhesion

**Vacuum-Assisted Impregnation:**

$$\Delta P = -0.8\text{ bar}, \quad t = 30\text{ min}, \quad T = 25^\circ\text{C}$$

**Add-on Weight Target:**

$$\text{AOW} = \frac{m_{\text{STF}} - m_{\text{dry}}}{m_{\text{dry}}} \times 100\% = 35-45\%$$

**Shear-Thickening Response:**

$$\eta(\dot{\gamma}) = \eta_0 \left[1 + \left(\frac{\dot{\gamma}}{\dot{\gamma}_c}\right)^n\right]$$

$\dot{\gamma}_c = 100\text{ s}^{-1}$, $n = 3.5$, $\eta_0 = 0.1\text{ Pa·s}$ → $\eta_{\text{max}} > 1000\text{ Pa·s}$

### 3.5 Surface & Interior Coatings (per MAT-03 §3.5, CSMFAB078 Main §4.6, CSMFAB078-B §3.4, SYNTH-01 §4.6)

**YInMn Blue Synthesis (per MAT-03 §3.5):**

$$\text{Y}_2\text{O}_3 + \text{In}_2\text{O}_3 + \text{MnO}_2 \xrightarrow{1200^\circ\text{C}} \text{YIn}_{1-x}\text{Mn}_x\text{O}_3$$

$x = 0.15$ (optimal NIR reflectance), particle size: 200-500 nm.

**HVLP Spray Parameters:**
- Pressure: 0.7 bar (10 psi)
- Nozzle: 1.3 mm
- Distance: 200 mm
- Passes: 3×, 50% overlap
- DFT per pass: 8-12 μm

**QD Topcoat (CsPbBr₃ Perovskite):**

$$\text{PLQY} > 90\%, \quad \lambda_{\text{em}} = 520\text{ nm}, \quad \text{FWHM} < 20\text{ nm}$$

UV-cure: 365 nm, 50 mW/cm², 30 s per layer.

**CoAl₂O₄ Spinel (Schumann Absorption):**

$$\text{CoAl}_2\text{O}_4 \xrightarrow{\text{pad-dry-cure}} \text{CoAl}_2\text{O}_4/\text{silk}$$

Pad: 5 g/L CoAl₂O₄, 10 g/L binder, pH 5.5
Dry: 120°C, 3 min
Cure: 160°C, 2 min
Target: $\alpha(7.83\text{ Hz}) > 30\text{ dB}$

---
