## 2. Pattern Sizing Derived from Anthropometrics (DRAFT-01, DRAFT-02, DRAFT-03, DRAFT-04)

### 2.1 Alcega Directrix Curves for RW-TG

**Torso Directrix (Front — Convolute for Bust):**
$$D_f(u) = \begin{bmatrix} \frac{B_e}{4} \sin(\pi u) \cdot (1 + 0.15\alpha_e) \\ H_e \cdot u \cdot 0.42 \\ \frac{W_e}{2\pi} (1 - \cos(2\pi u)) \cdot 0.35 \end{bmatrix}, \quad u \in [0,1]$$

Where $B_e = 115$ cm, $H_e = 175$ cm, $W_e = 100$ cm, $H_{p,e} = 120$ cm, $\alpha_e = +0.15$

**Torso Directrix (Back — Watteau Pleat Accommodation):**
$$D_b(u) = \begin{bmatrix} \frac{B_e}{4} \sin(\pi u) \cdot 1.2 \cdot (1 + 0.15\alpha_e) \\ H_e \cdot u \cdot 0.48 \\ 0 \end{bmatrix}$$

Back panel width at bust = 34.5 cm (Watteau pleat allowance included)

**Sleeve Directrix (Conical Developable):**
$$D_s(v) = \begin{bmatrix} (r_{cuff} + (r_{armscye} - r_{cuff})v) \cos(2\pi v) \\ L_{sleeve} \cdot v \\ (r_{cuff} + (r_{armscye} - r_{cuff})v) \sin(2\pi v) \end{bmatrix}$$

Where $r_{armscye} = 21$ cm, $r_{cuff} = 11$ cm, $L_{sleeve} = 82$ cm

### 2.2 Garsault Proportional Strips (Scaled for Female Girth)

| Strip | RW-TS Length | RW-TG Length | Formula |
|-------|--------------|--------------|---------|
| **Stature Strip (1/8 H)** | 24.06 cm | 21.88 cm | $H_e / 8$ |
| **Bust Strip (1/4 B)** | 22.75 cm | 28.75 cm | $B_e / 4$ |
| **Waist Strip (1/2 W)** | 36.5 cm | 50.0 cm | $W_e / 2$ |
| **Hip Strip (1/4 Hip)** | 28.75 cm | 30.0 cm | $H_{p,e} / 4$ |
| **Back Length Strip** | 43 cm | 44 cm | Measured |

### 2.3 Panel Count Optimization (Zero-Waste Nesting, DRAFT-05)

| Panel Type | RW-TS Count | RW-TG Count | Area Each (cm²) | Total Area (cm²) |
|------------|-------------|-------------|-----------------|------------------|
| Bodice Front (L/R) | 2 | 2 | 2,850 | 5,700 |
| Bodice Back (Watteau) | 1 | 1 | 4,200 | 4,200 |
| Bodice Side Panel | 2 | 2 | 1,400 | 2,800 |
| Skirt Front (Gored) | 4 | 6 | 1,800 | 10,800 |
| Skirt Back (Gored) | 4 | 6 | 2,000 | 12,000 |
| Skirt Side/Gusset | 4 | 6 | 900 | 5,400 |
| Sleeve Upper | 2 | 2 | 1,400 | 2,800 |
| Sleeve Lower | 2 | 2 | 1,100 | 2,200 |
| Collar/Stand | 2 | 2 | 350 | 700 |
| **Total Panels** | **32** | **36** | — | **46,600** |
| **Loom Width (560mm)** | 560 mm | 560 mm | — | — |
| **Estimated Yardage** | 15.5 m | 19.2 m | — | — |

---
