# V3.0 Deep Dive Series: Micro to Macro Particle Physics
## Part 2 of 14 — Second Quantization and Many-Particle States

---

### Abstract

This installment develops the formalism of second quantization for describing many-particle systems, establishing the mathematical framework for particle statistics and quantum field theory.

---

## 1. Fock Space Construction

### 1.1 Hilbert Space Tensor Product

For $N$ identical particles:

$$\mathcal{H} = \sum_{N=0}^{\infty} \mathcal{H}_N$$

where $\mathcal{H}_N$ is the $N$-particle Hilbert space.

### 1.2 Creation/Annihilation Algebra

For bosons:

$$[a_i, a_j^\dagger] = \delta_{ij}$$

For fermions:

$$\{c_i, c_j^\dagger\} = \delta_{ij}$$

---

## 2. Many-Particle States

### 2.1 Bosonic States

$$|n_1, n_2, \ldots\rangle = \prod_i \frac{(a_i^\dagger)^{n_i}}{\sqrt{n_i!}} |0\rangle$$

The vacuum satisfies $a_i |0\rangle = 0$.

### 2.2 Fermionic States

$$|n_1, n_2, \ldots\rangle = \prod_i (c_i^\dagger)^{n_i} |0\rangle$$

with $n_i \in \{0, 1\}$ due to the Pauli exclusion principle.

---

## 3. Field Commutation Relations

### 3.1 Bosonic Field

$$[\phi(\vec{x},t), \pi(\vec{y},t)] = i\hbar \delta^3(\vec{x}-\vec{y})$$

### 3.2 Fermionic Field (Grassmann Variables)

$$\{ \psi(\vec{x},t), \psi^\dagger(\vec{y},t) \} = \delta^3(\vec{x}-\vec{y})$$

---

## 4. Second Quantization Formulation

### 4.1 Hamiltonian in Second Quantization

$$H = \int d^3x \, \psi^\dagger(\vec{x}) \left( -\frac{\hbar^2\nabla^2}{2m} + V(\vec{x}) \right) \psi(\vec{x})$$

Plus interaction terms:

$$H_{\text{int}} = \frac{1}{2} \int d^3x \, d^3y \, \psi^\dagger(\vec{x}) \psi^\dagger(\vec{y}) V_{\text{int}}(|\vec{x}-\vec{y}|) \psi(\vec{y}) \psi(\vec{x})$$

---

*End of Part 2 — Next: Many-Body Correlations and the Density Matrix*

---

## Appendix B: Operator Ordering

### B.1 Normal Ordering

$:AB:$ denotes normal ordering (all creation operators to the left).

$$\langle : \hat{H} : \rangle = \langle \hat{H} \rangle - \text{vacuum energy}$$

### B.2 Wick's Theorem

For time-ordered products:

$$T \{ a(t_1) a^\dagger(t_2) a(t_3) \} = : a(t_1) a^\dagger(t_2) a(t_3) : + \text{contractions}$$