# DOC-05: Structural Framework Specification
**Project:** AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Document ID:** DOC-05  
**Version:** 1.0  
**Classification:** Core Document Batch 1  
**Dependencies:** MAT-02, DRAFT-04, MAT-03, MAT-04, SYNTH-01, CSMFAB078 Main §4, CSMFAB078-A §3, CSMFAB078-B §3  
**Status:** AUTHORED — Pipeline Pending  

---

## 1. Baleen/Steel Hybrid Chassis (from MAT-02, DRAFT-04, CSMFAB078 Main §4.3, CSMFAB078-A §3.3)

### 1.1 Baleen Tensor Properties (Hydrated)

**Orthotropic Elasticity Tensor (Principal Material Directions):**

$$\mathbb{C}_{\text{baleen}} = \begin{bmatrix}
E_L & \nu_{LT}E_T & \nu_{LR}E_R & 0 & 0 & 0 \\
\nu_{TL}E_L & E_T & \nu_{TR}E_R & 0 & 0 & 0 \\
\nu_{RL}E_L & \nu_{RT}E_T & E_R & 0 & 0 & 0 \\
0 & 0 & 0 & G_{LT} & 0 & 0 \\
0 & 0 & 0 & 0 & G_{LR} & 0 \\
0 & 0 & 0 & 0 & 0 & G_{TR}
\end{bmatrix}$$

**Principal Values (per MAT-02 §3.1):**
- $E_L = 4.5\text{ GPa}$ (longitudinal, along keratin tubules)
- $E_T = 1.8\text{ GPa}$ (transverse, circumferential)
- $E_R = 1.2\text{ GPa}$ (radial, through thickness)
- $\nu_{LT} = 0.35$, $\nu_{TL} = 0.14$ (reciprocity: $\nu_{TL} = \nu_{LT} E_T/E_L$)
- $\nu_{TR} = 0.40$, $\nu_{RT} = 0.27$
- $\nu_{LR} = 0.38$, $\nu_{RL} = 0.10$
- $G_{LT} = 0.65\text{ GPa}$, $G_{LR} = 0.45\text{ GPa}$, $G_{TR} = 0.35\text{ GPa}$
- Density: $\rho = 1.35\text{ g/cm}^3$
- Moisture content: 12-15% (equilibrium at 65% RH, 20°C)

### 1.2 Euler Buckling Analysis for Baleen Stays

**Critical Buckling Load (Pinned-Pinned):**

$$P_{\text{cr}} = \frac{\pi^2 E_L I_{\text{min}}}{L^2} \quad \text{where } I_{\text{min}} = \frac{\pi}{64}(D_o^4 - D_i^4)$$

**Baleen Stay Geometry (per edition):**
- Outer diameter: $D_o = 8\text{ mm}$ (tapered to 5 mm at tips)
- Inner diameter: $D_i = 4\text{ mm}$ (central canal)
- Length: $L = 350\text{ mm}$ (RM), $L = 320\text{ mm}$ (RW)
- $I_{\text{min}} = 1.55 \times 10^{-10}\text{ m}^4$

**Critical Load:**
$$P_{\text{cr}} = \frac{\pi^2 \cdot 4.5\times10^9 \cdot 1.55\times10^{-10}}{(0.35)^2} = 5.8\text{ kN}$$

**Safety Factor (vs. LES Z4 tension 60-80N × 12 stays):**
$$\text{SF} = \frac{P_{\text{cr}}}{12 \cdot T_{\text{max}}} = \frac{5800}{12 \cdot 80} = 6.0 \quad \text{✓ Adequate}$$

### 1.3 Viscoelastic Relaxation (Prony Series)

**Time-Dependent Modulus:**

$$E(t) = E_\infty + \sum_{i=1}^{3} E_i \exp(-t/\tau_i)$$

| $E_i$ (GPa) | $\tau_i$ (s) | Physical Mechanism |
|-------------|--------------|-------------------|
| 0.8 | 0.1 | Molecular chain slippage |
| 0.5 | 10 | Tubule-matrix debonding |
| 0.3 | 1000 | Water redistribution |

**Relaxation Under Constant Strain (LES tension hold):**

$$\sigma(t) = \varepsilon_0 \cdot E(t) \quad \Rightarrow \quad \text{Tension loss} \approx 15\% \text{ over 8 hours}$$

**Re-tensioning Protocol:** LES auto-calibration every 2 hours (per CSMFAB078-A §3.3).

### 1.4 Spiral Steel Boning (17-7 PH CH900)

**Material Properties:**
- $E = 193\text{ GPa}$, $\sigma_y = 1210\text{ MPa}$, $\sigma_{\text{uts}} = 1310\text{ MPa}$
- $\rho = 7.8\text{ g/cm}^3$, $\nu = 0.30$
- Fatigue limit: $\sigma_f = 480\text{ MPa}$ (10⁷ cycles, R=0.1)
- Corrosion resistance: Passive in artificial sweat (ISO 11610)

**Spiral Geometry (per CSMFAB078 Main §4.4):**
- Wire diameter: $d = 1.0\text{ mm}$
- Coil diameter: $D = 5.0\text{ mm}$
- Pitch: $p = 2.5\text{ mm}$
- Active coils: $n_a = 20\text{--}40$ (per stay length)

**Spring Rate:**

$$k = \frac{G d^4}{8 D^3 n_a} = \frac{73\times10^9 \cdot (1.0\times10^{-3})^4}{8 \cdot (5.0\times10^{-3})^3 \cdot 30} = 12.2\text{ N/mm}$$

**Hysteresis (Loading-Unloading Cycle):**

$$\text{Hysteresis Loss} = \frac{\oint \sigma d\varepsilon}{\int \sigma d\varepsilon} \approx 3\% \quad \text{(steel)} \quad \text{vs.} \quad 25\% \quad \text{(baleen)}$$

---

## 2. Cage Crinoline / Pannier System (from DRAFT-04, MAT-02 §4.3, CSMFAB078-A §3.3)

### 2.1 Hoop Geometry Progression

**Elliptical Hoop Parameters (Semi-axes in mm):**

| Hoop | Level | RM-TS (a×b) | RM-TG (a×b) | RW-TS (a×b) | RW-TG (a×b) |
|------|-------|-------------|-------------|-------------|-------------|
| 1 | Waist | 280×200 | 360×260 | 260×190 | 340×240 |
| 2 | Hip | 320×230 | 400×290 | 300×220 | 380×270 |
| 3 | Mid-thigh | 260×190 | 320×240 | 240×180 | 300×230 |
| 4 | Hem | 220×160 | 280×210 | 200×150 | 260×200 |

**Moment of Inertia (Bending Stiffness):**

$$I_x = \frac{\pi}{4} a b^3, \quad I_y = \frac{\pi}{4} a^3 b$$

**Hoop Wire Specification:**
- Material: Spring steel 17-7 PH (same as boning)
- Diameter: 3.0 mm (waist), 2.5 mm (hip), 2.0 mm (lower)
- Collapsible: Telescoping segments with friction locks

### 2.2 Tape Suspension Catenary

**Catenary Equation:**

$$y(x) = c \cosh\left(\frac{x}{c}\right) \quad \text{where } c = \frac{H}{w}$$

$H$ = horizontal tension component (from LES Z5, Z6), $w$ = distributed weight.

**Tape Tension at Waist (Z5):**

$$T_{\text{tape}} = \sqrt{H^2 + (w L/2)^2} \quad \text{Target: } 55\text{--}75\text{ N (per edition)}$$

**Suspension Points:** 8 tapes per hoop (4 front, 4 back), attached to baleen channels.

### 2.3 Collapse Mechanism (Phoenix Protocol)

**Telescoping Hoop Segments:**

$$L_{\text{collapsed}} = \frac{L_{\text{deployed}}}{N_{\text{segments}}} + (N_{\text{segments}}-1) \cdot t_{\text{overlap}}$$

$N_{\text{segments}} = 4$ per hoop, $t_{\text{overlap}} = 15\text{ mm}$.

**Deployment Energy (Spring-Assisted):**

$$U_{\text{spring}} = \frac{1}{2} k_{\text{tape}} (\Delta L)^2 \geq \sum m_{\text{hoop}} g \Delta h$$

$k_{\text{tape}} = 50\text{ N/m}$ (Dyneema-silk tape), $\Delta L = 0.8\text{ m}$.

---

## 3. LES 12-Zone Tension Calibration (from CSMFAB078-A §3.3, MAT-04 §5.1, CSMFAB078 Main §4.5)

### 3.1 Zone Definitions & Base Tensions

| Zone | Anatomical Location | RM Base (N) | RW Base (N) | LES Channel | Historical Lacing |
|------|---------------------|-------------|-------------|-------------|-------------------|
| Z1 | Shoulder apex | 55 | 50 | Shoulder strap | Sleeve head |
| Z2 | Scapular spine | 60 | 55 | Back channel | Watteau back |
| Z3 | Thoracic spine | 65 | 60 | Center back stay | Stay busk |
| Z4 | Lumbar | 70 | 65 | Waist channel | Waist lacing |
| Z5 | Iliac crest | 65 | 60 | Hip channel | Farthingale tape |
| Z6 | Ant. sup. iliac | 60 | 55 | Pannier suspend | Pannier tape |
| Z7 | Sternum | 50 | 45 | Front busk | Front lacing |
| Z8 | Costal margin | 55 | 50 | Lower front | Lower lacing |
| Z9 | Axillary | 45 | 40 | Side gore | Side lacing |
| Z10 | Cervical | 40 | 35 | Collar/coif | Coif tie |
| Z11 | Occipital | 35 | 30 | Hood/coif | Hood draw |
| Z12 | Distal sleeve | 30 | 25 | Cuff | Cuff lacing |

### 3.2 Edition-Specific Calibration

$$T_{z,e} = T_{z,\text{base}} \cdot \left(1 + \alpha_e \cdot \frac{M_e - M_{\text{ref}}}{M_{\text{ref}}}\right) \cdot \beta_{z,e}$$

**Morphology Factors $\alpha_e$:**

| Edition | $\alpha_e$ | $M_e/M_{\text{ref}}$ |
|---------|------------|---------------------|
| RM-TS | -0.08 | 0.92 |
| RM-TG | +0.15 | 1.15 |
| RM-SS | -0.08 | 0.92 |
| RM-SG | +0.15 | 1.15 |

**Zone-Edition Interaction $\beta_{z,e}$ (Sample):**

| Zone | RM-TS | RM-TG | RW-TS | RW-TG |
|------|-------|-------|-------|-------|
| Z1 | 1.00 | 1.05 | 0.95 | 1.00 |
| Z4 | 0.95 | 1.10 | 0.90 | 1.05 |
| Z5 | 1.00 | 1.08 | 0.95 | 1.03 |

### 3.3 Moment Balance Constraint

$$\sum_{z=1}^{12} T_z \cdot \mathbf{r}_z \times \mathbf{n}_z = \mathbf{0} \quad \text{(Static equilibrium)}$$

Where $\mathbf{r}_z$ = position vector of zone $z$, $\mathbf{n}_z$ = normal direction.

---

## 4. Deployment & Locking (from CSMFAB078 Main §4.7, CSMFAB078-A §3.4, DRAFT-04 §3.3)

### 4.1 Spring Energy Storage

**LES Deployment Springs (Z5, Z6):**

$$U_{\text{stored}} = \sum_{z \in \{5,6\}} \frac{1}{2} k_z (\Delta x_z)^2$$

$k_z = 200\text{ N/m}$ (per zone), $\Delta x_z = 0.15\text{ m}$ (pre-compression).

**Total Deployment Energy:** $U_{\text{total}} \approx 4.5\text{ J}$ per side.

### 4.2 Deployment Dynamics

**Equation of Motion:**

$$m_{\text{eff}} \ddot{x} + c \dot{x} + k x = F_{\text{spring}}(t) - F_{\text{friction}}$$

Target: $t_{\text{deploy}} < 5\text{ s}$, overshoot $< 10\%$.

**Damping Ratio:** $\zeta = 0.7$ (critical damping for smooth deployment).

### 4.3 Locking Mechanisms

**Friction Catch (Historical: Hook-and-Eye):**

$$F_{\text{hold}} = \mu_s N \geq 1.5 \cdot F_{\text{deploy}}$$

$\mu_s = 0.4$ (steel-on-steel), $N = 200\text{ N}$ (preload).

**Magnetic Latch (Modern: Ti₃AlC₂ Cleats):**

$$F_{\text{mag}} = \frac{B^2 A}{2\mu_0} \quad B = 0.8\text{ T}, \quad A = 25\text{ mm}^2 \Rightarrow F_{\text{mag}} = 64\text{ N}$$

---

## 5. Ceramic Tile Chassis Integration (from MAT-03 §3.1, CSMFAB078 Main §4.2)

### 5.1 Magnetic Edge Alignment

**Halbach Array Configuration (Per Tile):**

$$\mathbf{B}(x,y,z) = B_0 \exp(-z/\lambda) [\cos(2\pi x/\Lambda), \sin(2\pi x/\Lambda), 0]$$

$\Lambda = 5\text{ mm}$ (period), $\lambda = 2\text{ mm}$ (decay), $B_0 = 0.5\text{ T}$.

**Alignment Force:**

$$F_{\text{align}} = \frac{B^2 A}{2\mu_0} \cdot \frac{\Delta x}{\Lambda} \quad \text{Restoring force} \propto \Delta x$$

Target: $\pm 0.05\text{ mm}$ positional accuracy.

### 5.2 Gasket Seal (EMI + Environmental)

**Conductive Silicone Gasket (MXene-loaded):**

$$\sigma_{\text{gasket}} = \sigma_0 \phi_{\text{MXene}}^{1.5} \geq 100\text{ S/m}$$

$\phi_{\text{MXene}} = 0.25$ (volume fraction).

**Seal Pressure (Bolted Chassis):**

$$P_{\text{seal}} = \frac{F_{\text{bolt}}}{A_{\text{gasket}}} = 0.5\text{ MPa} \quad \text{(per CSMFAB078 Main §4.2)}$$

---

## 6. Traceability Matrix

| Section | Source Document | Section/Location | Key Values/Equations |
|---------|----------------|------------------|---------------------|
| 1.1 Baleen tensor | MAT-02 | §3.1 | Full C matrix, principal values |
| 1.2 Euler buckling | MAT-02 | §3.2 | $P_{\text{cr}} = 5.8\text{ kN}$, SF=6.0 |
| 1.3 Viscoelastic | MAT-02 | §3.2 | Prony series 3-term |
| 1.4 Steel boning | MAT-02 | §4.1 | 17-7 PH, $k=12.2\text{ N/mm}$ |
| 2.1 Hoop geom | DRAFT-04 | §3.1 | Elliptical progression table |
| 2.1 Hoop geom | MAT-02 | §4.3 | $I_x, I_y$ formulas |
| 2.2 Catenary | DRAFT-04 | §3.2 | $T(z) = \sqrt{H^2 + (wL/2)^2}$ |
| 2.3 Collapse | DRAFT-04 | §4.3 | Telescoping $N=4$ segments |
| 3.1 Zones | CSMFAB078-A | §3.3 Table 3.3 | 12 zones, base tensions |
| 3.2 Calibration | MAT-04 | §5.1 | $\alpha_e$, $\beta_{z,e}$ tables |
| 3.3 Moment balance | CSMFAB078-A | §3.3 | Equilibrium constraint |
| 4.1 Spring energy | CSMFAB078 Main | §4.7 | $U=4.5\text{ J}$, $k=200\text{ N/m}$ |
| 4.2 Dynamics | CSMFAB078 Main | §4.7 | $\zeta=0.7$, $t<5\text{s}$ |
| 4.3 Locking | CSMFAB078 Main | §4.4 | Friction catch, magnetic latch |
| 5.1 Magnetic align | MAT-03 | §3.1 | Halbach array, $\pm0.05\text{mm}$ |
| 5.2 Gasket | MAT-03 | §3.1 | $\sigma_{\text{gasket}}\geq100\text{ S/m}$ |

---

## 7. Standards Compliance Summary

| Standard | Application | Layer/System |
|----------|-------------|--------------|
| **ISO 12107** | Metallic materials fatigue testing | Steel boning |
| **ASTM C1423** | Ceramic tile mechanical properties | Tile chassis |
| **ASTM D4935** | EMI shielding effectiveness | Gasket seal |
| **ISO 11610** | Corrosion resistance (artificial sweat) | Steel boning |
| **ISO 15858** | Protective clothing ergonomics | LES tension zones |
| **NIJ STD-0101.06** | Ballistic chassis integration | Tile retention |
| **ISO 7933** | Predicted heat strain (chassis ventilation) | Thermal comfort |

---

## 8. Risk Register — Structural Framework

| Risk ID | Description | Likelihood | Impact | Mitigation |
|---------|-------------|------------|--------|------------|
| SF-01 | Baleen moisture cycling causes dimensional drift | High | Medium | Synthetic alternative qualified, humidity control |
| SF-02 | Steel boning fatigue at spiral stress concentration | Medium | High | Shot peening, $K_t$ reduction, inspection interval |
| SF-03 | Hoop deployment collision with ceramic tiles | Medium | High | Kinematic simulation, staged deployment |
| SF-04 | LES tension calibration drift over duty cycle | High | Medium | Auto-recalibration every 2 hours |
| SF-05 | Magnetic alignment degradation (temperature) | Low | High | NdFeB $T_{\text{max}} = 150^\circ\text{C}$, thermal shield |

---

## 9. Mass Budget — Structural Framework (Validated)

| Component | RM-TS (kg) | RM-TG (kg) | RW-TS (kg) | RW-TG (kg) |
|-----------|------------|------------|------------|------------|
| Baleen stays (24) | 1.2 | 1.5 | 1.0 | 1.3 |
| Steel boning (12) | 0.6 | 0.7 | 0.5 | 0.6 |
| Hoop wires (4×4) | 0.8 | 1.0 | 0.7 | 0.9 |
| Tape suspension | 0.15 | 0.18 | 0.13 | 0.16 |
| Cleats/aglets (Ti₃AlC₂) | 0.05 | 0.06 | 0.04 | 0.05 |
| **Subtotal** | **2.80** | **3.44** | **2.37** | **3.01** |

---

*End of DOC-05 — Structural Framework Specification*  
*Next: DOC-06 Protective Layer Architecture*