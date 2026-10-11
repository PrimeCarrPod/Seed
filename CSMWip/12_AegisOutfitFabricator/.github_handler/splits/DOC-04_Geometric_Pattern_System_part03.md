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
