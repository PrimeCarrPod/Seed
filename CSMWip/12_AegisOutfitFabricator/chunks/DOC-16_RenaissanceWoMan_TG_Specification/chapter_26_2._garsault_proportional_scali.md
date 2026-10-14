## 2. Garsault Proportional Scaling System for RW-TG (DRAFT-02, SYNTH-03 §2)

### 2.1 Scaled Paper Strip Mathematics

| Proportional Strip | Formula | RW-TS Value | RW-TG Value | Scaling Factor |
|--------------------|---------|-------------|-------------|----------------|
| **Stature (1/8 H)** | $H/8$ | 24.06 cm | 21.88 cm | 0.909 |
| **Bust (1/4 B)** | $B/4$ | 22.75 cm | 28.75 cm | 1.264 |
| **Waist (1/2 W)** | $W/2$ | 36.5 cm | 50.0 cm | 1.370 |
| **Hip (1/4 Hip)** | $Hip/4$ | 28.75 cm | 30.0 cm | 1.043 |
| **Back Length** | Measured | 43 cm | 44 cm | 1.023 |
| **Sleeve Length** | $0.43 \times H$ | 82.9 cm | 75.3 cm | 0.909 |

### 2.2 Continuous Adaptation Algorithm (LES 12-Zone → Historical Lacing)

$$\mathbf{P}_e = \mathbf{T}(\alpha_e) \cdot \mathbf{P}_{ref} + \mathbf{\Delta}_{nonlin}(\alpha_e)$$

Where:
- $\mathbf{P}_e$ = edition pattern coordinates
- $\mathbf{P}_{ref}$ = RW-TS reference pattern
- $\mathbf{T}(\alpha_e)$ = affine transform diag$(1+\alpha_e\gamma_x, 1+\alpha_e\gamma_y)$
- $\mathbf{\Delta}_{nonlin}$ = non-linear correction for curvature

**Zone-Specific Scaling Factors $\gamma_z$:**
$$\gamma = [0.9, 1.0, 1.1, 1.1, 1.2, 1.2, 1.0, 0.95, 0.95, 0.9, 0.85, 0.8]$$

---
