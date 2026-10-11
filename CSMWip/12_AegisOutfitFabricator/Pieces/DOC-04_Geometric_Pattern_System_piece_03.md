**SVG ViewBox:** `0 0 560 L_max` where $L_max$ = max pattern length

---

## 2. Proportional Scaling System (from DRAFT-02, Research Doc 1 §4.3, CSMFAB078-A §3.1, SYNTH-01 §3.2, CSMFAB078 Main §5.2)

### 2.1 Anthropometric Measurement System

**Primary Measurements (Garsault Base + LES Calibration):**

| Measurement | Symbol | RM Base | RW Base | LES Zone |
|-------------|--------|---------|---------|----------|
| Stature | $H$ | 1800 mm | 1680 mm | — |
| Chest/Bust | $C$ | 980 mm | 920 mm | Z7, Z8 |
| Waist | $W$ | 820 mm | 700 mm | Z4, Z5 |
| Hip | $H_p$ | 960 mm | 1000 mm | Z5, Z6 |
| Nape-to-waist | $NW$ | 420 mm | 395 mm | Z2, Z3 |
| Across-back | $AB$ | 370 mm | 350 mm | Z2 |
| Sleeve length | $SL$ | 640 mm | 580 mm | Z1, Z12 |
| Shoulder slope | $\theta_s$ | 22° | 24° | Z1 |

### 2.2 Edition-Specific Affine Transformation

$$\mathbf{P}_e = \mathbf{S}_e \cdot \mathbf{P}_{\text{base}} + \mathbf{T}_e$$

**Scale Matrix $\mathbf{S}_e = \text{diag}(s_x, s_y, s_z)$:**

| Edition | $s_x$ (circ.) | $s_y$ (len.) | $s_z$ (depth) |
|---------|---------------|--------------|---------------|
| RM-TS | 0.92 | 1.08 | 0.90 |
