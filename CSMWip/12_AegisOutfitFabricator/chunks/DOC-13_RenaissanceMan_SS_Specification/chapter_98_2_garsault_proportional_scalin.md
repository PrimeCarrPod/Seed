## 2. Garsault Proportional Scaling System for RM-SS (DRAFT-02, SYNTH-03 §2)

### 2.1 Scaled Paper Strip Mathematics

| Proportional Strip | Formula | RM-TS Value | RM-SS Value | Scaling Factor |
|--------------------|---------|-------------|-------------|----------------|
| **Stature (1/8 H)** | $H/8$ | 23.75 cm | 20.31 cm | 0.855 |
| **Chest (1/4 C)** | $C/4$ | 22.5 cm | 20.25 cm | 0.900 |
| **Waist (1/2 W)** | $W/2$ | 37.5 cm | 35.0 cm | 0.933 |
| **Hip (1/4 Hip)** | $Hip/4$ | 22.5 cm | 21.25 cm | 0.944 |
| **Back Length** | Measured | 47 cm | 41 cm | 0.872 |
| **Sleeve Length** | $0.45 \times H$ | 85.5 cm | 73.1 cm | 0.855 |

### 2.2 Continuous Adaptation Algorithm (LES 12-Zone → Historical Lacing)

$$\mathbf{P}_e = \mathbf{T}(\alpha_e) \cdot \mathbf{P}_{ref} + \mathbf{\Delta}_{nonlin}(\alpha_e)$$

Where:
- $\mathbf{P}_e$ = edition pattern coordinates
- $\mathbf{P}_{ref}$ = RM-TS reference pattern
- $\mathbf{T}(\alpha_e)$ = affine transform diag$(1+\alpha_e\gamma_x, 1+\alpha_e\gamma_y)$
- $\mathbf{\Delta}_{nonlin}$ = non-linear correction for curvature

**Zone-Specific Scaling Factors $\gamma_z$:**
$$\gamma = [0.9, 0.95, 1.0, 1.0, 1.05, 1.1, 0.9, 0.85, 0.85, 0.8, 0.75, 0.7]$$

---

