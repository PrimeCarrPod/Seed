## 2. Garsault Proportional Scaling System for RM-SG (DRAFT-02, SYNTH-03 §2)

### 2.1 Scaled Paper Strip Mathematics

| Proportional Strip | Formula | RM-SS Value | RM-SG Value | Scaling Factor |
|--------------------|---------|-------------|-------------|----------------|
| **Stature (1/8 H)** | $H/8$ | 20.31 cm | 20.31 cm | 1.000 |
| **Chest (1/4 C)** | $C/4$ | 20.25 cm | 27.5 cm | 1.358 |
| **Waist (1/2 W)** | $W/2$ | 35.0 cm | 50.0 cm | 1.429 |
| **Hip (1/4 Hip)** | $Hip/4$ | 21.25 cm | 27.5 cm | 1.294 |
| **Back Length** | Measured | 41 cm | 41 cm | 1.000 |
| **Sleeve Length** | $0.45 \times H$ | 73.1 cm | 73.1 cm | 1.000 |

### 2.2 Continuous Adaptation Algorithm (LES 12-Zone → Historical Lacing)

$$\mathbf{P}_e = \mathbf{T}(\alpha_e) \cdot \mathbf{P}_{ref} + \mathbf{\Delta}_{nonlin}(\alpha_e)$$

Where:
- $\mathbf{P}_e$ = edition pattern coordinates
- $\mathbf{P}_{ref}$ = RM-SS reference pattern
- $\mathbf{T}(\alpha_e)$ = affine transform diag$(1+\alpha_e\gamma_x, 1+\alpha_e\gamma_y)$
- $\mathbf{\Delta}_{nonlin}$ = non-linear correction for curvature

**Zone-Specific Scaling Factors $\gamma_z$:**
$$\gamma = [0.9, 0.95, 1.1, 1.2, 1.3, 1.2, 0.95, 0.9, 1.0, 1.0, 0.9, 0.85]$$

---

