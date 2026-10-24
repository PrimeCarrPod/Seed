## 2. Pattern Sizing Derived from Anthropometrics (DRAFT-01, DRAFT-02, DRAFT-03)

### 2.1 Alcega Directrix Curves for RW-TS (Female Torso)

**Front Torso Directrix (Convolute Surface):**
$$D_f(u) = \begin{bmatrix} \frac{B_e}{4} \sin(\pi u) \cdot (1 + 0.1\alpha_e) \\ H_e \cdot u \cdot 0.42 \\ \frac{W_e}{2\pi} (1 - \cos(2\pi u)) \cdot 0.25 \end{bmatrix}, \quad u \in [0,1]$$

Where $B_e = 91$ cm, $H_e = 192.5$ cm, $W_e = 73$ cm, $\alpha_e = -0.12$

**Back Torso Directrix (Watteau Pleat Accommodation):**
$$D_b(u) = \begin{bmatrix} \frac{B_e}{4} \sin(\pi u) \cdot 1.15 \cdot (1 + 0.1\alpha_e) \\ H_e \cdot u \cdot 0.48 \\ 0 \end{bmatrix}$$

**Sleeve Directrix (Conical Developable):**
$$D_s(v) = \begin{bmatrix} (r_{cuff} + (r_{armscye} - r_{cuff})v) \cos(2\pi v) \\ L_{sleeve} \cdot v \\ (r_{cuff} + (r_{armscye} - r_{cuff})v) \sin(2\pi v) \end{bmatrix}$$

Where $r_{armscye} = 17.5$ cm, $r_{cuff} = 9.0$ cm, $L_{sleeve} = 84$ cm

### 2.2 Garsault Proportional Strips (Scaled)

| Strip | RW-TG Length | RW-TS Length | Formula |
|-------|--------------|--------------|---------|
| **Stature Strip (1/8 H)** | 24.06 cm | 24.06 cm | $H_e / 8$ |
| **Bust Strip (1/4 B)** | 29.25 cm | 22.75 cm | $B_e / 4$ |
| **Waist Strip (1/2 W)** | 50.0 cm | 36.5 cm | $W_e / 2$ |
| **Hip Strip (1/4 Hip)** | 27.5 cm | 23.75 cm | $Hip_e / 4$ |
| **Back Length Strip** | 50 cm | 45 cm | Measured |

### 2.3 Panel Count Optimization (Zero-Waste Nesting, DRAFT-05)

| Panel Type | RW-TG Count | RW-TS Count | Area Each (cm²) | Total Area (cm²) |
|------------|-------------|-------------|-----------------|------------------|
| Bodice Front (L/R) | 2 | 2 | 2,100 | 4,200 |
| Bodice Back (Watteau) | 1 | 1 | 3,800 | 3,800 |
| Bodice Side | 2 | 2 | 1,050 | 2,100 |
| Skirt Front Panel | 2 | 2 | 2,200 | 4,400 |
| Skirt Back Panel | 2 | 2 | 2,400 | 4,800 |
| Skirt Side/Gore | 6 | 4 | 1,200 | 4,800 |
| Sleeve Upper | 2 | 2 | 1,200 | 2,400 |
| Sleeve Lower | 2 | 2 | 900 | 1,800 |
| Farthingale Hoops | 6 | 4 | 350 | 1,400 |
| Collar/Partlet | 2 | 2 | 300 | 600 |
| **Total Panels** | **36** | **32** | — | **30,300** |
| **Loom Width (560mm)** | 560 mm | 560 mm | — | — |
| **Estimated Yardage** | 15.8 m | 13.5 m | — | — |

---

