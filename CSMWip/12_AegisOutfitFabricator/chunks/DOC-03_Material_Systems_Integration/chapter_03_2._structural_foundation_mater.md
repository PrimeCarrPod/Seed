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
