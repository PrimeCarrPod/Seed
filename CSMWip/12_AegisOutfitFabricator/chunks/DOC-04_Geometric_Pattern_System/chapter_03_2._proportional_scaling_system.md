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
| RM-TG | 1.15 | 1.08 | 1.12 |
| RM-SS | 0.92 | 0.92 | 0.90 |
| RM-SG | 1.15 | 0.92 | 1.12 |
| RW-TS | 0.90 | 1.07 | 0.88 |
| RW-TG | 1.18 | 1.07 | 1.15 |
| RW-SS | 0.90 | 0.93 | 0.88 |
| RW-SG | 1.18 | 0.93 | 1.15 |

**Translation Vector $\mathbf{T}_e$ (mm):**

| Edition | $\Delta x$ | $\Delta y$ | $\Delta z$ |
|---------|------------|------------|------------|
| RM-TS | +15 | +40 | -10 |
| RM-TG | -20 | +40 | +25 |
| RM-SS | +15 | -35 | -10 |
| RM-SG | -20 | -35 | +25 |

### 2.3 Grade Rules for Intermediate Sizes

**Linear Interpolation Between Editions:**

$$\mathbf{P}(\alpha) = (1-\alpha) \mathbf{P}_{e_1} + \alpha \mathbf{P}_{e_2}, \quad \alpha \in [0,1]$$

**Non-Linear Correction (Per DRAFT-02 §3.3):**

$$\mathbf{P}_{\text{corrected}} = \mathbf{P}(\alpha) + \mathbf{C}(\alpha) \odot \mathbf{P}_{\text{base}}$$

Where $\mathbf{C}(\alpha)$ = correction tensor from historical grading tables.

---
