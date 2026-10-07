# V3.0 Deep Dive Series: Swarm Mechanics and Fluid Dynamics
## Part 8 of 14 — Vorticity Dynamics and Helicity

---

### Abstract

This installment examines vorticity as a measure of rotational motion in fluids and swarms, developing the Helmholtz vortex theorems and their applications.

---

## 1. Vorticity Definition

$$\vec{\omega} = \nabla \times \vec{v}$$

### 1.1 Vorticity Transport Equation

$$\frac{D\vec{\omega}}{Dt} = (\vec{\omega} \cdot \nabla) \vec{v} + \nu \nabla^2 \vec{\omega}$$

---

## 2. Helmholtz Vortex Theorems

### 2.1 First Theorem (Vortex Lines Move with Fluid)

If $\vec{\omega} \cdot \nabla \phi = 0$ initially, it remains true.

### 2.2 Second Theorem (Vortex Strength Conserved)

$$\frac{d}{dt} \oint_C \vec{v} \cdot d\vec{l} = 0$$

for a material contour $C$.

---

## 3. Helicity and Linkage

### 3.1 Magnetic Helicity Analogy

$$H = \int \vec{A} \cdot \vec{B} \, d^3x$$

For fluid helicity:

$$\mathcal{H} = \int \vec{v} \cdot \vec{\omega} \, d^3x$$

Linkage number preservation in ideal flow.

---

*End of Part 8 — Next: Dimensional Analysis and Scaling Laws*
