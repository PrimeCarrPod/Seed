## 2. Pattern Sizing Derived from Anthropometrics (DRAFT-01, DRAFT-02, DRAFT-03, DRAFT-04)

### 2.1 Alcega Directrix Curves for RW-SG

**Torso Directrix (Front — Convolute for Bust):**
$$D_f(u) = \begin{bmatrix} \frac{B_e}{4} \sin(\pi u) \cdot (1 + 0.15\alpha_e) \\ H_e \cdot u \cdot 0.42 \\ \frac{W_e}{2\pi} (1 - \cos(2\pi u)) \cdot 0.35 \end{bmatrix}, \quad u \in [0,1]$$

Where $B_e = 105$ cm, $H_e = 155$ cm, $W_e = 95$ cm, $H_{p,e} = 115$ cm, $\alpha_e = -0.08$

**Torso Directrix (Back — Watteau Pleat Accommodation):**
$$D_b(u) = \begin{bmatrix} \frac{B_e}{4} \sin(\pi u) \cdot 1.18 \cdot (1 + 0.15\alpha_e) \\ H_e \cdot u \cdot 0.48 \\ 0 \end{bmatrix}$$

Back panel width at bust = 31.0 cm (Watteau pleat allowance included)

**Sleeve Directrix (Conical Developable):**
$$D_s(v) = \begin{bmatrix} (r_{cuff} + (r_{armscye} - r_{cuff})v) \cos(2\pi v) \\ L_{sleeve} \cdot v \\ (r_{cuff} + (r_{armscye} - r_{cuff})v) \sin(2\pi v) \end{bmatrix}$$

Where $r_{armscye} = 19$ cm, $r_{cuff} = 9.5$ cm, $L_{sleeve} = 72.2$ cm

### 2.2 Garsault Proportional Strips (Scaled for Female Compact Curvy)

| Strip | RW-TS Length | RW-SG Length | Formula |
|-------|--------------|--------------|---------|
| **Stature Strip (1/8 H)** | 24.06 cm | 19.38 cm | $H_e / 8$ |
| **Bust Strip (1/4 B)** | 22.75 cm | 26.25 cm | $B_e / 4$ |
| **Waist Strip (1/2 W)** | 36.5 cm | 47.5 cm | $W_e / 2$ |
| **Hip Strip (1/4 Hip)** | 28.75 cm | 28.75 cm | $H_{p,e} / 4$ |
| **Back Length Strip** | 43 cm | 40 cm | Measured |

### 2.3 Panel Count Optimization (Zero-Waste Nesting, DRAFT-05)

| Panel Type | RW-TS Count | RW-SG Count | Area Each (cm²) | Total Area (cm²) |
|------------|-------------|-------------|-----------------|------------------|
| Bodice Front (L/R) | 2 | 2 | 2,450 | 4,900 |
| Bodice Back (Watteau) | 1 | 1 | 3,800 | 3,800 |
| Bodice Side Panel | 2 | 2 | 1,200 | 2,400 |
| Skirt Front (Gored) | 4 | 4 | 1,500 | 6,000 |
| Skirt Back (Gored) | 4 | 4 | 1,700 | 6,800 |
| Skirt Side/Gusset | 4 | 4 | 800 | 3,200 |
| Sleeve Upper | 2 | 2 | 1,200 | 2,400 |
| Sleeve Lower | 2 | 2 | 950 | 1,900 |
| Collar/Stand | 2 | 2 | 300 | 600 |
| **Total Panels** | **32** | **32** | — | **35,800** |
| **Loom Width (560mm)** | 560 mm | 560 mm | — | — |
| **Estimated Yardage** | 15.5 m | 14.2 m | — | — |

---
