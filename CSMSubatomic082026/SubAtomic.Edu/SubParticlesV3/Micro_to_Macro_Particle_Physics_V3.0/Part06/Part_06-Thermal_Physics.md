# V3.0 Deep Dive Series: Micro to Macro Particle Physics
## Part 6 of 14 — Thermal Physics and the Partition Function

---

### Abstract

This installment develops the statistical mechanical foundation connecting microscopic quantum states to macroscopic thermodynamic observables through the canonical partition function.

---

## 1. Canonical Partition Function

### 1.1 Definition and Properties

$$Z = \sum_n e^{-\beta E_n}$$

where $\beta = \frac{1}{k_B T}$ and $E_n$ are the energy eigenvalues.

Thermodynamicrelations:
- $F = -k_B T \ln Z$ (Helmholtz free energy)
- $\langle E \rangle = -\frac{\partial \ln Z}{\partial \beta}$
- $C_V = \frac{\partial \langle E \rangle}{\partial T}$

---

## 2. Density of States

### 2.1 Phase Space Integration

For $N$ particles:

$$\Omega(E) = \frac{1}{N! h^{3N}} \int_{H<E} d^{3N}q \, d^{3N}p$$

### 2.2 Maxwell-Boltzmann Statistics

Classical partition function:

$$Z_{\text{cl}} = \frac{1}{N!} \left( \frac{V}{\lambda_T^3} \right)^N$$

where $\lambda_T = \sqrt{\frac{2\pi\hbar^2}{mk_BT}}$ is the thermal de Broglie wavelength.

---

## 3. Ideal Gas Equation of State

### 3.1 Virial Expansion

$$PV = Nk_B T \left[ 1 + \frac{B_2(T)}{V} + \frac{B_3(T)}{V^2} + \cdots \right]$$

The second virial coefficient for hard spheres:

$$B_2(T) = 4 \int_0^\infty [1-e^{-V_{\text{int}}(r)/k_BT}] \, r^2 dr$$

---

*End of Part 6 — Next: Phase Transitions and Critical Phenomena*
