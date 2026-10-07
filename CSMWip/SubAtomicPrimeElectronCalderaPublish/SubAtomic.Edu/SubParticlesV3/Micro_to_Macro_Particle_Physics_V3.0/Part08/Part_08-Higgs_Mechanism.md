# V3.0 Deep Dive Series: Micro to Macro Particle Physics
## Part 8 of 14 — The Higgs Mechanism and Gauge Symmetry Breaking

---

### Abstract

This installment develops the Higgs mechanism, showing how gauge symmetry breaking generates particle masses while preserving gauge invariance at the macroscopic level.

---

## 1. Spontaneous Gauge Symmetry Breaking

### 1.1 Complex Scalar Field

$$\mathcal{L} = (D_\mu \phi)^\dagger (D^\mu \phi) - V(\phi)$$

where $D_\mu = \partial_\mu + ig A_\mu$ and $V(\phi) = \mu^2 |\phi|^2 + \lambda |\phi|^4$.

### 1.2 Unitary Gauge

Parameterizing $\phi = \frac{1}{\sqrt{2}} (0, v + H)^T$:

$$\mathcal{L} \supset \frac{1}{2} M_A^2 A_\mu A^\mu + \frac{1}{2} M_H^2 H^2$$

with $M_A = gv$ and $M_H = \sqrt{2\lambda}v$.

---

## 2. Goldstone's Theorem and Its Avoidance

### 2.1 Would-Be Goldstone Modes

Before symmetry breaking, there are massless modes. After breaking:

- Nambu-Goldstone modes are "eaten" by the gauge bosons
- Gauge bosons acquire mass via the Stueckelberg mechanism

---

## 3. Vacuum Expectation Value and Effective Potential

### 3.1 Coleman-Weinberg Potential

$$V_{\text{eff}}(v) = \frac{\lambda}{4} v^4 - \frac{1}{64\pi^2} \left( \frac{3M_H^4}{v^4} \ln\frac{M_H^2}{\mu^2} + \frac{4M_A^4}{v^4} \ln\frac{M_A^2}{\mu^2} \right)$$

---

*End of Part 8 — Next: Renormalization Group and Scale Invariance*
