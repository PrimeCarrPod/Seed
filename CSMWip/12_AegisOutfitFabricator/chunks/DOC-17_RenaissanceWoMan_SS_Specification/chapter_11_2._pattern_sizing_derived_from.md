## 2. Pattern Sizing Derived from Anthropometrics (DRAFT-01, DRAFT-02, DRAFT-03, DRAFT-04)

### 2.1 Alcega Directrix Curves for RW-SS

**Torso Directrix (Front — Convolute for Bust):**
$$D_f(u) = \begin{bmatrix} \frac{B_e}{4} \sin(\pi u) \cdot (1 + 0.15\alpha_e) \\ H_e \cdot u \cdot 0.42 \\ \frac{W_e}{2\pi} (1 - \cos(2\pi u)) \cdot 0.35 \end{bmatrix}, \quad u \in [0,1]$$

Where $B_e = 81$ cm, $H_e = 152.5$ cm, $W_e = 60$ cm, $H_{p,e} = 85$ cm, $\alpha_e = -0.22$

**Torso Directrix (Back — Watteau Pleat Accommodation):**
$$D_b(u) = \begin{bmatrix} \frac{B_e}{4} \sin(\pi u) \cdot 1.15 \cdot (1 + 0.15\alpha_e) \\ H_e \cdot u \cdot 0.48 \\ 0 \end{bmatrix}$$

Back panel width at bust = 23.3 cm (Watteau pleat allowance included)

**Sleeve Directrix (Conical Developable):**
$$D_s(v) = \begin{bmatrix} (r_{cuff} + (r_{armscye} - r_{cuff})v) \cos(2\pi v) \\ L_{sleeve} \cdot v \\ (r_{cuff} + (r_{armscye} - r_{cuff})v) \sin(2\pi v) \end{bmatrix}$$

Where $r_{armscye} = 16$ cm, $r_{cuff} = 8$ cm, $L_{sleeve} = 70.2$ cm

### 2.2 Garsault Proportional Strips (Scaled for Female Petite)

| Strip | RW-TS Length | RW-SS Length | Formula |
|-------|--------------|--------------|---------|
| **Stature Strip (1/8 H)** | 24.06 cm | 19.06 cm | $H_e / 8$ |
| **Bust Strip (1/4 B)** | 22.75 cm | 20.25 cm | $B_e / 4$ |
| **Waist Strip (1/2 W)** | 36.5 cm | 30.0 cm | $W_e / 2$ |
| **Hip Strip (1/4 Hip)** | 28.75 cm | 21.25 cm | $H_{p,e} / 4$ |
| **Back Length Strip** | 43 cm | 37 cm | Measured |

### 2.3 Panel Count Optimization (Zero-Waste Nesting, DRAFT-05)

| Panel Type | RW-TS Count | RW-SS Count | Area Each (cm²) | Total Area (cm²) |
|------------|-------------|-------------|-----------------|------------------|
| Bodice Front (L/R) | 2 | 2 | 1,650 | 3,300 |
| Bodice Back (Watteau) | 1 | 1 | 2,800 | 2,800 |
| Bodice Side Panel | 2 | 2 | 850 | 1,700 |
| Skirt Front (Gored) | 4 | 3 | 1,200 | 3,600 |
| Skirt Back (Gored) | 4 | 3 | 1,400 | 4,200 |
| Skirt Side/Gusset | 4 | 3 | 600 | 1,800 |
| Sleeve Upper | 2 | 2 | 900 | 1,800 |
| Sleeve Lower | 2 | 2 | 700 | 1,400 |
| Collar/Stand | 2 | 2 | 250 | 500 |
| **Total Panels** | **32** | **28** | — | **21,600** |
| **Loom Width (560mm)** | 560 mm | 560 mm | — | — |
| **Estimated Yardage** | 15.5 m | 10.8 m | — | — |

---
