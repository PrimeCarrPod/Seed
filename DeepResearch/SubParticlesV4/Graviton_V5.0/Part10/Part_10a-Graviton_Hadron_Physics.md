# Graviton Physics — V5.0 Deep Dive Series
## Part 10 of 14 — Graviton in Nuclear/Hadron Physics: Gravitational Form Factors, Energy-Momentum Tensor

---

### Abstract

Gravitational interaction with hadrons. Energy-momentum tensor (EMT) form factors. Mass, spin, pressure, shear distributions. Lattice QCD calculations. JLab experiments.

---

### 1. Hadronic Energy-Momentum Tensor

**EMT operator**: $T_{\mu\nu} = \sum_q \bar{q} \gamma_\mu i\overleftrightarrow{D}_\nu q + \frac{1}{4} g_{\mu\nu} F^2 + \dots$
**Matrix element**: $\langle p'| T_{\mu\nu} |p \rangle = \bar{u}(p') \left[ A(q^2) \frac{P_\mu P_\nu}{M} + B(q^2) \frac{i\sigma_{\mu\nu} q^\nu}{2M} + C(q^2) \frac{q_\mu q_\nu - g_{\mu\nu} q^2}{M} + \bar{C}(q^2) M g_{\mu\nu} \right] u(p)$

**Form factors**:
- $A(q^2)$: Mass distribution
- $B(q^2)$: Angular momentum (spin)
- $C(q^2)$: Pressure/shear distribution
- $\bar{C}(q^2)$: Trace anomaly (mass)

---

### 2. Gravitational Form Factors & Physical Interpretation

**Mass radius**: $\langle r^2 \rangle_M = 6 A'(0)$
**Pressure distribution**: $p(r) = \frac{1}{6M r^2} \frac{d}{dr} r^2 \frac{d}{dr} C(r)$
**Shear forces**: $s(r) = -\frac{1}{2r} \frac{d}{dr} r^2 \frac{d}{dr} C(r)$
**Stability**: $\int_0^\infty dr r^2 p(r) = 0$ (von Laue condition)

**D-term**: $D = C(0)$ — related to pressure integral

---

### 3. Lattice QCD Calculations (2024)

**Moments**: $\langle x \rangle_{q,g}$, $\langle x^2 \rangle_{q,g}$ from lattice
**EMT form factors**: Direct calculation of $A(q^2), C(q^2)$ at physical pion mass
**Results**: 
- Proton mass radius: $\langle r^2 \rangle_M^{1/2} \sim 0.55$ fm
- Pressure: Positive core, negative periphery
- D-term: $D \sim -2$ to $-3$

**Gluon vs quark**: Gluons carry ~50% of mass, ~90% of spin

---

### 4. Experimental Access: JLab & EIC

**DVCS**: $\gamma^* p \to \gamma p$ — Compton form factors $\to$ EMT
**Hard exclusive**: $\gamma^* p \to \pi^0 p, \eta p$ — GPDs $\to$ EMT
**EIC**: 3D imaging of pressure, shear, mass distributions

**Gravitational coupling**: $h_{\mu\nu} T^{\mu\nu}$ — graviton couples to EMT

---

### 5. Trace Anomaly & Mass Generation

**QCD trace anomaly**: $T^\mu_\mu = \frac{\beta(g)}{2g} G^2 + \sum m_q \bar{q} q$
**Proton mass**: 
- Trace anomaly (gluons): ~90%
- Quark masses: ~10%

**Graviton couples to trace** → sees mass generation mechanism

---

### 6. Worldline Picture: Hadron as Worldline Bundle

**Hadron** = worldline bundle (3 quark folds)
**EMT** = worldline bundle stress-energy
**Graviton** = probes worldline bundle geometry

**Pressure/shear** = internal worldline bundle forces

---

### 7. References

1. Polyakov (2018) — Phys. Lett. B 778, 120
2. Lattice EMT — Shanahan et al. (2021), 2024 results
3. JLab DVCS — Burkert et al. (2023)
4. Prime-Electron Foundation §5
5. PrimeBookOne dir 1.0-2.0

---

*End of Part 10a — Next: Part 11 — BSM: Extra Dimensions, KK Gravitons*

---

**Status**: Part 10a complete (~95 lines).