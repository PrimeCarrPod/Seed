# DOC-03: Material Systems Integration
**Project:** AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Document ID:** DOC-03  
**Version:** 1.0  
**Classification:** Core Document Batch 1  
**Dependencies:** MAT-01, MAT-02, MAT-03, MAT-04, SYNTH-01, CSMFAB078 Main §4, CSMFAB078-B  
**Status:** AUTHORED — Pipeline Pending  

---

## 1. Silk Fibroin System (from MAT-01, Research Doc 1 §4.2, SYNTH-01 §4.1)

### 1.1 Macromolecular Structure & Degumming Kinetics

**Silk Fibroin Primary Structure (per Research Doc 1 §4.2, MAT-01 §3.1):**
- Heavy chain: ~390 kDa, 5,263 amino acids (Gly-Ser-Gly-Ala-Gly-Ala repeats)
- Light chain: ~26 kDa, 222 amino acids
- P25 glycoprotein: ~25 kDa, disulfide-linked to heavy chain
- **Crystalline domains**: β-sheet (GAGAGS)ₙ, 60-70% crystallinity
- **Amorphous domains**: Random coil, helical regions, 30-40% content

**Degumming Kinetics (Alkaline Hydrolysis):**

$$\frac{d[\text{Sericin}]}{dt} = -k \cdot [\text{OH}^-]^n \cdot [\text{Sericin}]^m$$

Where $k = A \exp(-E_a/RT)$, $E_a = 85\text{ kJ/mol}$, $A = 2.3\times10^7\text{ s}^{-1}$, $n=1.2$, $m=0.8$.

**Process Window (per MAT-01 §3.1, Research Doc 1 §4.2, CSMFAB078 Main §4.1):**
- Temperature: 95-100°C
- Na₂CO₃ concentration: 0.5-1.0% w/v
- Time: 60-90 minutes
- Liquor ratio: 1:50 (silk:water)
- Target sericin removal: ≥95% (residual <5%)

**Post-Degumming Properties:**
| Property | Value | Test Method |
|----------|-------|-------------|
| Tensile strength | 500-700 MPa | ASTM D3822 |
| Young's modulus | 8-12 GPa | ASTM D3822 |
| Elongation at break | 15-25% | ASTM D3822 |
| Density | 1.32 g/cm³ | ASTM D1505 |
| Moisture regain | 11% (65% RH, 20°C) | ISO 6741 |

### 1.2 Orthotropic Constitutive Model (Yeoh/Holzapfel)

**Strain Energy Function (Yeoh for isotropic, Holzapfel for anisotropic):**

$$W = \sum_{i=1}^{3} C_{i0} (\bar{I}_1 - 3)^i + \frac{k_1}{2k_2} \sum_{j=4,6} \left[\exp\left(k_2 (\bar{I}_j - 1)^2\right) - 1\right]$$

Where $\bar{I}_1 = \text{tr}(\bar{\mathbf{C}})$, $\bar{I}_4 = \mathbf{a}_0 \cdot \bar{\mathbf{C}} \mathbf{a}_0$, $\bar{I}_6 = \mathbf{g}_0 \cdot \bar{\mathbf{C}} \mathbf{g}_0$.

**Fiber Directions:**
- $\mathbf{a}_0$: Warp direction (machine direction)
- $\mathbf{g}_0$: Weft direction (cross-machine)

**Fitted Parameters (per MAT-01 §4.2):**
- $C_{10} = 1.8\text{ MPa}$, $C_{20} = 0.05\text{ MPa}$, $C_{30} = 0.002\text{ MPa}$
- $k_1 = 150\text{ MPa}$, $k_2 = 8.5$
- $\kappa = 0.15$ (dispersion parameter)

### 1.3 Strain-Rate Sensitivity & Environmental Aging

**Strain-Rate Dependency (Cowper-Symonds):**

$$\sigma_y(\dot{\varepsilon}) = \sigma_0 \left[1 + \left(\frac{\dot{\varepsilon}}{D}\right)^{1/q}\right]$$

Where $D = 40\text{ s}^{-1}$, $q = 4.5$ for degummed silk.

**Environmental Aging (Arrhenius + Humidity):**

$$\frac{P(t)}{P_0} = \exp\left[-\left(\frac{t}{\tau_0}\right)^\beta \exp\left(-\frac{E_a}{RT}\right) \cdot \text{RH}^\gamma\right]$$

Where $\tau_0 = 10^5\text{ h}$, $\beta = 0.7$, $E_a = 95\text{ kJ/mol}$, $\gamma = 1.2$.

---

## 2. Structural Foundation Materials (from MAT-02, Research Doc 1 §3.3, CSMFAB078 Main §4.3, SYNTH-01 §4.3)

### 2.1 Baleen (Keratin) Properties

**Hydrated Baleen Tensor (per MAT-02 §3.1, Research Doc 1 §3.3, CSMFAB078 Main §4.3):**

$$\mathbb{C}_{\text{baleen}} = \begin{bmatrix}
E_L & \nu_{LT}E_T & \nu_{LR}E_R & 0 & 0 & 0 \\
\cdot & E_T & \nu_{TR}E_R & 0 & 0 & 0 \\
\cdot & \cdot & E_R & 0 & 0 & 0 \\
\cdot & \cdot & \cdot & G_{LT} & 0 & 0 \\
\cdot & \cdot & \cdot & \cdot & G_{LR} & 0 \\
\cdot & \cdot & \cdot & \cdot & \cdot & G_{TR}
\end{bmatrix}$$

**Principal Properties:**
- $E_L = 4.5\text{ GPa}$ (longitudinal, along tubules)
- $E_T = 1.8\text{ GPa}$ (transverse)
- $E_R = 1.2\text{ GPa}$ (radial)
- $\nu_{LT} = 0.35$, $\nu_{TR} = 0.40$, $\nu_{LR} = 0.38$
- $G_{LT} = 0.65\text{ GPa}$, $G_{LR} = 0.45\text{ GPa}$, $G_{TR} = 0.35\text{ GPa}$
- Density: $\rho = 1.35\text{ g/cm}^3$

**Thermoplastic Transition:** $T_g = 65^\circ\text{C}$ (hydrated), $T_g = 180^\circ\text{C}$ (dry)

**Viscoelastic Relaxation (Prony Series):**

$$E(t) = E_\infty + \sum_{i=1}^{3} E_i \exp(-t/\tau_i)$$

$\tau_1 = 0.1\text{ s}$, $\tau_2 = 10\text{ s}$, $\tau_3 = 1000\text{ s}$

### 2.2 Synthetic Baleen Alternatives (per MAT-02 §3.3, CSMFAB078 Main §4.3, SYNTH-01 §4.3)

| Material | $E$ (GPa) | $\rho$ (g/cm³) | $T_g$ (°C) | Cost Factor |
|----------|-----------|----------------|------------|-------------|
| PTFE-coated fiberglass | 25 | 1.8 | 327 | 1.0x |
| Para-aramid (Kevlar®) composite | 70 | 1.44 | 450 | 3.5x |
| UHMWPE (Dyneema®) unidirectional | 90 | 0.97 | 145 | 4.2x |
| Carbon fiber/epoxy | 140 | 1.55 | 180 | 5.0x |

**Selection Criterion (Mass-Normalized Stiffness):**

$$\text{Index} = \frac{E}{\rho} \cdot \frac{1}{\text{Cost Factor}} \quad \text{Target: } > 25\text{ GPa·cm}^3/\text{g}$$

### 2.3 Spiral Steel Boning Equivalent (per MAT-02 §4.1, CSMFAB078 Main §4.4, CSMFAB078-A §3.3)

**Material:** 17-7 PH Stainless Steel (CH900 condition)
- $E = 193\text{ GPa}$, $\sigma_y = 1210\text{ MPa}$, $\sigma_{\text{uts}} = 1310\text{ MPa}$
- Fatigue limit: 480 MPa (10⁷ cycles, R=0.1)
- Corrosion: Passive in sweat (pH 4.5-6.5), chloride < 0.1M

**Spiral Geometry:**
- Wire diameter: 0.8-1.2 mm
- Coil diameter: 4-6 mm
- Pitch: 2-3 mm
- **Spring rate:** $k = \frac{G d^4}{8 D^3 n_a}$ where $G = 73\text{ GPa}$

### 2.4 Cage Crinoline Hoop Architecture (per MAT-02 §4.3, Research Doc 1 §4.4, DRAFT-04 §3.2, CSMFAB078-A §3.3)

**Elliptical Hoop Moment of Inertia:**

$$I_x = \frac{\pi}{4} a b^3, \quad I_y = \frac{\pi}{4} a^3 b$$

Where $a$ = semi-major axis (AP), $b$ = semi-minor axis (ML).

**Hoop Progression (per edition, from MAT-02 §4.3):**

| Hoop | RM-TS (mm) | RM-TG (mm) | RW-TS (mm) | RW-TG (mm) |
|------|------------|------------|------------|------------|
| 1 (waist) | 280×200 | 360×260 | 260×190 | 340×240 |
| 2 (hip) | 320×230 | 400×290 | 300×220 | 380×270 |
| 3 (knee) | 260×190 | 320×240 | 240×180 | 300×230 |
| 4 (hem) | 220×160 | 280×210 | 200×150 | 260×200 |

**Tape Suspension Catenary:**

$$y(x) = c \cosh(x/c) \quad \text{where } c = \frac{H}{w}$$

$H$ = horizontal tension, $w$ = weight per unit length.

---

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

## 4. Cross-Property Validation Matrix (from MAT-04, SYNTH-01 §4.7, CSMFAB078-B §4, CSMFAB078 Main §5)

### 4.1 HAS vs PES Trade-Off Curves

**Pareto Frontiers per Edition (from MAT-04 §4.1, SYNTH-01 §4.7):**

$$\mathcal{P}_e = \{(\text{HAS}, \text{PES}) \mid \text{feasible for edition } e\}$$

**Knee Points (Optimal Balance):**

| Edition | HAS* | PES* | Mass (kg) | Dominant Constraint |
|---------|------|------|-----------|---------------------|
| RM-TS | 0.87 | 0.92 | 16.5 | Thermal (L5 thickness) |
| RM-TG | 0.82 | 0.95 | 20.9 | Ballistic (L2/L7 tiles) |
| RM-SS | 0.89 | 0.88 | 13.7 | EMI (L3/L6 density) |
| RM-SG | 0.84 | 0.93 | 17.2 | Trauma (L8/L9 STF) |
| RW-TS | 0.85 | 0.91 | 16.0 | Thermal + Stays geometry |
| RW-TG | 0.80 | 0.94 | 20.1 | Ballistic + Farthingale |
| RW-SS | 0.88 | 0.87 | 13.2 | EMI + Sleeve mobility |
| RW-SG | 0.83 | 0.92 | 16.8 | Trauma + Hoop volume |

### 4.2 Weight Budget Allocation (Validated, per MAT-04 §4.2, CSMFAB078-A §3.4, SYNTH-01 §4.7)

**Total System Mass Equation:**

$$M_{\text{total}} = \sum_{k=1}^{12} \rho_k A_k + M_{\text{textile}} + M_{\text{lacing}} + M_{\text{hardware}} + M_{\text{margin}}$$

**Margin Policy:** $\delta_{\text{manuf}} = 5\%$, $\delta_{\text{contingency}} = 8\%$, total 13% growth allowance.

### 4.3 Thermal Comfort Validation (per MAT-04 §4.3, ISO 11092, ISO 7933, CSMFAB078-B §3.5)

**Sweating Guarded Hot Plate (ISO 11092):**

$$R_{\text{ct}} = \frac{T_{\text{skin}} - T_{\text{amb}}}{H} \quad \text{Target: } R_{\text{ct}} \leq 0.3\text{ m}^2\text{K/W}$$

**Predicted Heat Strain (ISO 7933):**

$$\text{PHS} = \frac{M - W}{\text{MaxEvap}} \quad \text{Target: PHS} < 0.7 \text{ for 60 min duty}$$

---

## 5. Traceability Matrix

| Section | Source Document | Section/Location | Key Values/Equations |
|---------|----------------|------------------|---------------------|
| 1.1 Silk structure | MAT-01 | §3.1 | Macromolecular, crystalline/amorphous |
| 1.1 Degumming | MAT-01 | §3.1 | Kinetics, process window |
| 1.2 Constitutive | MAT-01 | §4.2 | Yeoh/Holzapfel parameters |
| 1.3 Strain-rate | MAT-01 | §4.3 | Cowper-Symonds D=40, q=4.5 |
| 1.3 Aging | MAT-01 | §4.4 | Arrhenius-humidity model |
| 2.1 Baleen tensor | MAT-02 | §3.1 | Full orthotropic C matrix |
| 2.1 Thermoplastic | MAT-02 | §3.1 | Tg hydrated/dry |
| 2.1 Viscoelastic | MAT-02 | §3.2 | Prony series τ₁,₂,₃ |
| 2.2 Alternatives | MAT-02 | §3.3 | PTFE-fiberglass, aramid, UHMWPE, CF |
| 2.3 Steel boning | MAT-02 | §4.1 | 17-7 PH, spiral geometry |
| 2.4 Hoop arch | MAT-02 | §4.3 | Elliptical progression table |
| 3.1 Ceramic scale | MAT-03 | §3.1 | V₅₀ scaling, flash sinter τ |
| 3.2 MXene coating | MAT-03 | §3.2 | Etching, dip/spray, Γ=0.5 mg/cm² |
| 3.3 Aerogel | MAT-03 | §3.3 | MF/polyurea shell, d₅₀=75μm |
| 3.4 STF | MAT-03 | §3.4 | φ=0.45, AOW 35-45%, η(γ̇) |
| 3.5 Coatings | MAT-03 | §3.5 | YInMn synthesis, HVLP, QD, CoAl₂O₄ |
| 4.1 Pareto | MAT-04 | §4.1 | Knee points per edition |
| 4.2 Mass budget | MAT-04 | §4.2 | Validated allocation |
| 4.3 Thermal | MAT-04 | §4.3 | ISO 11092, ISO 7933 |

---

## 6. Standards Compliance Summary

| Standard | Application | Layer/System |
|----------|-------------|--------------|
| **ASTM D3822** | Silk fibroin tensile properties | Base textile (L9) |
| **ASTM D1505** | Density of silk | Material spec |
| **ISO 6741** | Moisture regain | Silk conditioning |
| **ASTM D1683** | Seam efficiency | All seams |
| **ASTM D1423** | Yarn twist | Metallic thread |
| **ISO 13934** | Fabric tensile | Woven layers (L3, L6) |
| **ISO 13937** | Tear strength | Historical seam validation |
| **ASTM C1423** | Ceramic mechanical properties | L2, L7 tiles |
| **ASTM D4935** | EMI shielding effectiveness | L3, L4, L6 |
| **ASTM C177** | Thermal conductivity | L5 aerogel |
| **NIJ STD-0101.06** | Ballistic resistance | L2, L7, L8 |
| **MIL-STD-461G** | EMI/EMC | L3, L4, L6 |
| **ISO 11092** | Thermal resistance (sweating GHP) | Full system |
| **ISO 7933** | Predicted heat strain | Operational limits |

---

## 7. Risk Register — Material Integration

| Risk ID | Description | Likelihood | Impact | Mitigation |
|---------|-------------|------------|--------|------------|
| MI-01 | Silk batch variability (crystallinity ±5%) | High | Medium | Lot qualification, blend 3+ lots |
| MI-02 | MXene oxidation during storage | Medium | High | Inert packaging, <30 day shelf life |
| MI-03 | Aerogel shell fracture >10% in quilting | Medium | High | Low-shear needle, hybrid MF/polyurea shell |
| MI-04 | STF sedimentation in bath >24h | Low | Medium | Continuous agitation, inline rheometer |
| MI-05 | YInMn Blue batch color shift ΔE* > 2 | Low | Medium | Spectrophotometric QC, master batch |
| MI-06 | Baleen supply chain disruption | Medium | High | Synthetic alternative qualified (PTFE-FG) |

---

*End of DOC-03 — Material Systems Integration*  
*Next: DOC-04 Geometric Pattern System*