## 4. Statistical Process Control

### 4.1 SPC Parameters by Process

Process capability: $C_{pk} = \min\left(\frac{USL - \bar{X}}{3\sigma}, \frac{\bar{X} - LSL}{3\sigma}\right)$

| Process | CTQ | Chart | n | Frequency | Cpk Target |
|---------|-----|-------|---|-----------|------------|
| Sewbo Sewing | Stitch density | X̄/R | 5 | Hourly | ≥1.67 |
| US Weld | Amplitude (μm) | X̄/S | 5 | Hourly | ≥1.67 |
| RF Weld | Voltage (kV) | X̄/R | 5 | Hourly | ≥1.67 |
| PVOH Dry | Modulus (GPa) | Indiv | 1 | Per batch | ≥1.33 |
| TFP Embroidery | Stitch placement | X̄/R | 5 | Per panel | ≥2.00 |
| Final Inspect | Leak rate | Cusum | 1 | 100% | ≥2.00 |

### 4.2 Advanced SPC — Multivariate

Hotelling's $T^2$: $T_i^2 = (\mathbf{x}_i - \boldsymbol{\mu})' \boldsymbol{\Sigma}^{-1} (\mathbf{x}_i - \boldsymbol{\mu})$

**MEWMA (Multivariate EWMA):**
```
$\mathbf{z}_i = \lambda \mathbf{x}_i + (1-\lambda) \mathbf{z}_{i-1}$
$\text{UCL} = h^2 \frac{\lambda}{2-\lambda} \left(1-(1-\lambda)^{2i}\right)$
$\lambda = 0.1$, $h = 10$ ($\alpha = 0.0027$)

Monitored Variables: [US_amp, US_force, RF_volt, RF_time, PVOH_mod]
Covariance $\boldsymbol{\Sigma}$: Estimated from Phase I (30 subgroups n=5)
```

**Fault Isolation:**
- Contribution plot: (x_i - μ)_j / σ_j for j=1..p
- Pattern recognition: SVM on SPC residuals
- Root cause: Decision tree (tool wear, material, env)

---
