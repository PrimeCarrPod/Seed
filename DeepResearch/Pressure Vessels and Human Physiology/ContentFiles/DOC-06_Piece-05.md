# DOC-06: Viewport Engineering — Acrylic Mechanics & ASME PVHO-1
## Document 6 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4901-5000 | Piece 5 of 9 | ~100 Lines

---

#### 6.5 Thermo-ViscoDamage Models (BPVC VIII Appendix 48)

**6.5.1 The Need for a Unified Constitutive Model**

PMMA behavior couples:
- **Viscoelasticity** (time-dependent recoverable strain)
- **Viscoplasticity** (time-dependent irrecoverable strain)
- **Damage** (stiffness degradation, crack growth)
- **Temperature dependence** (WLF shift, $T_g$ proximity)

**Appendix 48** provides a **thermodynamically consistent framework** for all three.

**6.5.2 Free Energy Potential & Dissipation**

**Helmholtz Free Energy (Per Unit Volume):**
$$\psi = \psi^e(\boldsymbol{\epsilon}^e, T) + \psi^v(\boldsymbol{\epsilon}^v, T) + \psi^d(\omega, T)$$

Where:
- $\boldsymbol{\epsilon}^e$ = elastic strain
- $\boldsymbol{\epsilon}^v$ = viscoelastic/viscoplastic strain
- $\omega$ = scalar damage variable ($0$ = virgin, $1$ = failed)

**Elastic Energy:**
$$\psi^e = \frac{1}{2} \boldsymbol{\epsilon}^e : \mathbb{C}(T) : \boldsymbol{\epsilon}^e$$

**Viscoelastic Energy (Prony Series):**
$$\psi^v = \sum_{i=1}^N \frac{1}{2} G_i(T) \boldsymbol{\epsilon}^v_i : \boldsymbol{\epsilon}^v_i$$

**Damage Energy:**
$$\psi^d = \frac{1}{2} \omega \cdot Y_0 \quad \text{($Y_0$ = damage energy release rate)}$$

**Total Stress:**
$$\boldsymbol{\sigma} = \frac{\partial \psi}{\partial \boldsymbol{\epsilon}} = (1-\omega) \mathbb{C}(T) : \boldsymbol{\epsilon}^e$$

**6.5.3 Evolution Equations**

**Viscoelastic Flow (Linear, Prony):**
$$\dot{\boldsymbol{\epsilon}}^v_i = \frac{1}{\tau_i(T)} \left( \boldsymbol{\epsilon}^e - \boldsymbol{\epsilon}^v_i \right)$$
$$\tau_i(T) = \tau_{i0} \exp\left[\frac{E_a}{R}\left(\frac{1}{T} - \frac{1}{T_0}\right)\right] \quad \text{(Arrhenius)}$$
**WLF Shift (Near $T_g$):**
$$\log a_T = \frac{-C_1 (T - T_0)}{C_2 + (T - T_0)}$$

**Viscoplastic Flow (Perzyna, Power Law):**
$$\dot{\boldsymbol{\epsilon}}^{vp} = \left\langle \frac{\Phi(\boldsymbol{\sigma}, \kappa)}{K} \right\rangle^m \frac{\partial \Phi}{\partial \boldsymbol{\sigma}}$$
Where $\Phi = \sigma_{\text{eq}} - \sigma_y(\kappa, T)$ (overstress), $\kappa$ = hardening variable.

**Damage Evolution (Thermo-ViscoDamage):**
$$\dot{\omega} = \left\langle \frac{Y - Y_0}{S} \right\rangle^r$$
Where $Y = -\partial \psi / \partial \omega = \frac{1}{2} \boldsymbol{\epsilon}^e : \mathbb{C} : \boldsymbol{\epsilon}^e$ (strain energy release rate).

**Deviatoric Stress Invariant Formulation (Appendix 48 Specific):**
$$\dot{\omega} = A \left( \frac{J_2}{J_{20}} \right)^p \exp\left(-\frac{Q_d}{RT}\right) (1-\omega)^q$$

Where $J_2 = \frac{1}{2} \boldsymbol{s} : \boldsymbol{s}$ (second deviatoric stress invariant), $\boldsymbol{s}$ = deviatoric stress tensor.

**This maps damage nucleation directly to shear-driven processes** (crazing, shear banding in PMMA).

**6.5.4 Model Calibration — Required Test Matrix**

| Test | Purpose | Parameters Identified |
|------|---------|----------------------|
| **Tensile (Multiple Strain Rates)** | Elastic + Viscoplastic | $E, \nu, \sigma_y(\dot{\epsilon}), K, m$ |
| **Creep (Multiple $\sigma, T$)** | Viscoelastic + Viscoplastic | Prony $G_i, \tau_i$, $Q, K, m$ |
| **Stress Relaxation** | Viscoelastic | Prony validation |
| **Cyclic (R-ratio sweep)** | Viscoplastic + Damage | Hardening $\kappa$, Damage $Y_0, S, r$ |
| **Fracture Toughness ($K_{IC}$)** | Damage Initiation | $Y_0, J_{20}$ |
| **Fatigue (Multiple $\Delta\sigma$)** | Damage Growth | $A, p, q, Q_d$ |
| **Thermal Expansion (Dilatometry)** | $\alpha(T)$ | Thermal strain |
| **DMA (Dynamic Mechanical Analysis)** | $E', E''$ vs. $T, \omega$ | WLF $C_1, C_2$, Prony |

**6.5.5 Implementation in FEA (ABAQUS/ANSYS/LS-DYNA)**

**UMAT/VUMAT Subroutine Required** for:
- Internal state variables: $\boldsymbol{\epsilon}^v_i, \kappa, \omega$
- Consistent tangent modulus for Newton-Raphson convergence
- Automatic time stepping (creep requires small steps initially)

**Element Type:** 3D solid (C3D20R / SOLID186) — **not shell** (through-thickness gradients critical).

**Mesh Requirements:**
- Clamp edge: 5+ elements through thickness
- Radial: Geometric progression from edge ($h_{\min} = t/10$)
- Axisymmetric model acceptable for flat/conical/spherical

**Output Tracking:**
- $\omega(r,z,t)$ — damage field
- $\sigma_{\text{eq}}(r,z,t)$ — von Mises stress
- $J_2(r,z,t)$ — deviatoric invariant (damage driver)
- Deflection $w(t)$ — serviceability

**6.5.6 Acceptance Criteria (Appendix 48)**

| Criterion | Limit | Evaluation |
|-----------|-------|------------|
| **Damage at Design Life** | $\omega_{\max} < 0.3$ | FEA at $t = N_{\text{design}}$ |
| **Creep Deflection** | $w/w_{\text{elastic}} < 2.0$ | FEA at $t = 40,000$ hr |
| **Stress (Primary)** | $\sigma_{\text{eq}} < \sigma_{\text{allow}}(T)$ | FEA at $P_{\text{design}}$ |
| **Fatigue Damage** | $D < 0.5$ (Miner) | Cycle-by-cycle integration |
| **Fracture Safety** | $K_I < K_{IC}/\gamma$ | J-integral at max flaw |

**If ALL criteria met → Design accepted without empirical life limits.**

---

*End of Piece 5 — DOC-06 Lines 4901-5000*
*Next: Piece 6 — Section 6.6 Conical & Spherical Viewports (Submersibles, Spacecraft)*