## 2. Garsault Proportional Scaling System for RW-SG (DRAFT-02, SYNTH-03 §2)

### 2.1 Scaled Paper Strip Mathematics

| Proportional Strip | Formula | RW-TS Value | RW-SG Value | Scaling Factor |
|--------------------|---------|-------------|-------------|----------------|
| **Stature (1/8 H)** | $H/8$ | 24.06 cm | 19.38 cm | 0.805 |
| **Bust (1/4 B)** | $B/4$ | 22.75 cm | 26.25 cm | 1.154 |
| **Waist (1/2 W)** | $W/2$ | 36.5 cm | 47.5 cm | 1.301 |
| **Hip (1/4 Hip)** | $Hip/4$ | 28.75 cm | 28.75 cm | 1.000 |
| **Back Length** | Measured | 43 cm | 40 cm | 0.930 |
| **Sleeve Length** | $0.43 \times H$ | 82.9 cm | 66.7 cm | 0.805 |

### 2.2 Continuous Adaptation Algorithm (LES 12-Zone → Historical Lacing)

$$\mathbf{P}_e = \mathbf{T}(\alpha_e) \cdot \mathbf{P}_{ref} + \mathbf{\Delta}_{nonlin}(\alpha_e)$$

Where:
- $\mathbf{P}_e$ = edition pattern coordinates
- $\mathbf{P}_{ref}$ = RW-TS reference pattern
- $\mathbf{T}(\alpha_e)$ = affine transform diag$(1+\alpha_e\gamma_x, 1+\alpha_e\gamma_y)$
- $\mathbf{\Delta}_{nonlin}$ = non-linear correction for curvature

**Zone-Specific Scaling Factors $\gamma_z$:**
$$\gamma = [0.85, 0.9, 0.95, 0.95, 1.0, 1.05, 0.9, 0.85, 0.85, 0.8, 0.75, 0.7]$$

---
