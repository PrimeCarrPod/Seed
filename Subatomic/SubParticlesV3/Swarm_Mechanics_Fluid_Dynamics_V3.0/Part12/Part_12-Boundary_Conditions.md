# V3.0 Deep Dive Series: Swarm Mechanics and Fluid Dynamics
## Part 12 of 14 — Boundary Conditions and Domain Decomposition

---

### Abstract

This installment examines boundary conditions for fluid/swarm systems, including no-slip, slip, and free-surface conditions, and their impact on swarm confinement.

---

## 1. No-Slip Boundary Condition

$$\vec{v}(\vec{x}_b) = \vec{v}_b \quad \text{on boundary}$$

Typical for viscous fluids and bounded swarms.

---

## 2. Periodic Boundary Conditions

$$\vec{v}(\vec{x} + \vec{L}) = \vec{v}(\vec{x})$$

Useful for unbounded domain simulations.

---

## 3. Wall Effects in Swarm Confinement

For swarm near wall at $z=0$:

$$\frac{\partial v_z}{\partial z} = 0 \quad \text{(free slip)}$$

or

$$v_z = 0 \quad \text{(no penetration)}$$

---

*End of Part 12 — Next: Numerical Methods and Discretization*
