## 2. Garsault Proportional Scaling System for RW-TS (DRAFT-02, SYNTH-03 §2)

### 2.1 Scaled Paper Strip Mathematics

| Proportional Strip | Formula | RW-TG Value | RW-TS Value | Scaling Factor |
|--------------------|---------|-------------|-------------|----------------|
| **Stature (1/8 H)** | $H/8$ | 24.06 cm | 24.06 cm | 1.000 |
| **Bust (1/4 B)** | $B/4$ | 29.25 cm | 22.75 cm | 0.778 |
| **Waist (1/2 W)** | $W/2$ | 50.0 cm | 36.5 cm | 0.730 |
| **Hip (1/4 Hip)** | $Hip/4$ | 27.5 cm | 23.75 cm | 0.864 |
| **Back Length** | Measured | 50 cm | 45 cm | 0.900 |
| **Sleeve Length** | $0.45 \times H$ | 86.6 cm | 84.0 cm | 0.970 |

### 2.2 Continuous Adaptation Algorithm (LES 12-Zone → Historical Lacing)

$$\mathbf{P}_e = \mathbf{T}(\alpha_e) \cdot \mathbf{P}_{ref} + \mathbf{\Delta}_{nonlin}(\alpha_e)$$

Where:
- $\mathbf{P}_e$ = edition pattern coordinates
- $\mathbf{P}_{ref}$ = RW-TG reference pattern
- $\mathbf{T}(\alpha_e)$ = affine transform diag$(1+\alpha_e\gamma_x, 1+\alpha_e\gamma_y)$
- $\mathbf{\Delta}_{nonlin}$ = non-linear correction for curvature

**Zone-Specific Scaling Factors $\gamma_z$:**
$$\gamma = [0.8, 0.9, 1.0, 1.0, 1.1, 1.2, 0.9, 0.85, 0.85, 0.8, 0.75, 0.7]$$

---

