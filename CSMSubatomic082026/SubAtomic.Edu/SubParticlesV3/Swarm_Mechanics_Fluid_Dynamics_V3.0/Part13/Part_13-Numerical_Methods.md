# V3.0 Deep Dive Series: Swarm Mechanics and Fluid Dynamics
## Part 13 of 14 — Numerical Methods and Discretization

---

### Abstract

This installment develops discretization schemes for solving swarm and fluid dynamics equations, including finite difference, finite volume, and spectral methods.

---

## 1. Finite Difference Discretization

### 1.1 Second-Order Central Difference

$$\frac{\partial f}{\partial x} \approx \frac{f_{i+1} - f_{i-1}}{2\Delta x}$$
$$\frac{\partial^2 f}{\partial x^2} \approx \frac{f_{i+1} - 2f_i + f_{i-1}}{\Delta x^2}$$

---

## 2. Upwind Schemes for Advection

For $\vec{v} \cdot \nabla \phi$:

$$\frac{\partial \phi}{\partial t} + v \frac{\partial \phi}{\partial x} = 0$$

Upwind discretization based on flow direction.

---

## 3. Particle-Based Swarm Methods

Smoothed Particle Hydrodynamics (SPH) for swarm:

$$\rho_i = \sum_j m_j W(r_{ij}, h)$$

where $W$ is a smoothing kernel.

---

*End of Part 13 — Next: Future Directions and Open Problems*
