# Graviton Physics — V5.0 Deep Dive Series
## Part 4 of 14 — Quantum Gravity: EFT of Gravity & Asymptotic Safety

---

### Abstract

Effective Field Theory (EFT) of gravity. Asymptotic Safety scenario. RG flow of Newton's constant. Graviton loops. Non-perturbative RG fixed point.

---

### 1. EFT of Gravity (Donoghue)

**Lagrangian**:
$$\mathcal{L} = \frac{2}{\kappa^2} \sqrt{-g} R + c_1 R^2 + c_2 R_{\mu\nu}R^{\mu\nu} + c_3 R_{\mu\nu\rho\sigma}R^{\mu\nu\rho\sigma} + \dots$$

**Power counting**: $\kappa^2 = 32\pi G_N \sim 1/M_{\text{Pl}}^2$
**Loops**: Graviton loops suppressed by $(E/M_{\text{Pl}})^2$

**Predictions**: 
- Quantum corrections to Newton potential: $V(r) = -\frac{GM}{r} \left[1 + \frac{41}{10\pi} \frac{G\hbar}{r^2} + \dots\right]$
- Graviton-graviton scattering at low energy

---

### 2. Asymptotic Safety (Weinberg)

**Conjecture**: Gravity has UV fixed point $g_*$ where $\beta(g_*) = 0$
**Dimensionless couplings**: $g = G k^2$, $\lambda = \Lambda/k^2$
**Fixed point**: $g_* > 0$, $\lambda_* > 0$ → UV complete

**Functional RG** (Wetterich equation):
$$\partial_t \Gamma_k = \frac{1}{2} \text{STr} \left[(\Gamma_k^{(2)} + R_k)^{-1} \partial_t R_k\right]$$

**Results** (2024):
- Fixed point exists in $f(R)$, $R^2$, matter-coupled truncations
- Critical exponents: $\theta_1 \sim 2$, $\theta_2 \sim -2$
- Predictivity: 2-3 relevant directions

---

### 3. RG Flow: Newton's Constant & Cosmological Constant

**Running**: $G(k) = g_*/k^2$, $\Lambda(k) = \lambda_* k^2$
**IR limit**: $G(0) = G_N$, $\Lambda(0) = \Lambda_{\text{obs}}$
**Scale setting**: $k \sim 1/r$ (position space)

**Worldline**: RG scale $k$ = proper-time resolution. UV = short proper-time.

---

### 4. Graviton Loops in EFT

**1-loop**: 
- Graviton self-energy
- Vertex corrections
- $R^2$, $R_{\mu\nu}^2$ counterterms

**2-loop** (2024): 
- Divergences in $R^3$ operators
- Requires higher-derivative counterterms

**Power counting**: $E^{2L+2}/M_{\text{Pl}}^{2L+2}$ for $L$ loops

---

### 5. Worldline Picture: EFT as Worldline Effective Action

**Worldline path integral**: $Z = \int \mathcal{D}x \, e^{i S_{\text{wl}}[x]}$
**Effective action**: $\Gamma[g] = -i \ln Z$
**EFT expansion** = worldline proper-time derivative expansion

---

### 6. References

1. Donoghue (1994) — Phys. Rev. D 50, 3874
2. Asymptotic Safety — Reuter & Saueressig (2019)
3. Functional RG — Wetterich (1993)
4. Prime-Electron Foundation §3
5. PrimeBookOne dir 3.0

---

*End of Part 4a — Next: Part 4b — Asymptotic Safety Details & Matter Coupling*

---

**Status**: Part 4a complete (~95 lines).