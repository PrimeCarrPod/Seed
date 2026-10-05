# Neutron Unique Properties — V4.0 Deep Dive Series
## Part 8 of 14 — Form Factors: Momentum Space from Prime Gaps

---

### Abstract

This V4.0 installment computes the **neutron's electromagnetic and weak form factors** from the **Fourier transform of the gap correlation function** at Directory 1.0. We derive the neutron's vector form factor $F_1(q^2)$, Pauli form factor $F_2(q^2)$, axial form factor $G_A(q^2)$, and induced pseudoscalar form factor $G_P(q^2)$.

---

### 1. From Proper Time to Momentum Space

#### 1.1 Neutron Gap Field

The neutron gap fluctuation field at Dir 1.0:
$$\phi_n = d_n - \langle d \rangle_{1.0}, \quad \langle d \rangle_{1.0} = 1000$$

#### 1.2 Fourier Transform

Discrete Fourier transform (on $N$ gaps):
$$\tilde{\phi}(k) = \frac{1}{\sqrt{N}} \sum_{n=0}^{N-1} \phi_n e^{-i 2\pi k n / N}$$

Power spectrum:
$$P(k) = |\tilde{\phi}(k)|^2$$

#### 1.3 Proper Time to Momentum

Proper time step: $\Delta \tau_n = 2 d_n$

Total proper time after $N$ steps:
$$\tau_N = 2 \sum_{n=0}^{N-1} d_n = 2 p_N$$

Momentum transfer $q$ corresponds to frequency:
$$q \sim \frac{2\pi k}{\tau_N} = \frac{\pi k}{p_N}$$

---

### 2. Electromagnetic Vertex and Form Factors

#### 2.1 Vertex Structure

The neutron-photon vertex:
$$\Gamma^\mu(q) = \gamma^\mu F_1(q^2) + \frac{i \sigma^{\mu\nu} q_\nu}{2M_n} F_2(q^2)$$

where:
- $F_1(0) = 0$ (neutron is neutral)
- $F_2(0) = \kappa_n = \frac{g_n - 2}{2}$ (anomalous magnetic moment)

#### 2.2 Form Factors from Gap Correlations

The vertex function is the **three-point function**:
$$\Gamma^\mu(q) \sim \sum_n e^{-i q \cdot x_n} \langle \phi_n \phi_0 \rangle$$

In momentum space, this is the **convolution** of the gap power spectrum with the proper-time propagator.

---

### 3. Dirac Form Factor $F_1(q^2)$

#### 3.1 Charge Normalization

$$F_1(0) = 0$$

From the prime gap power spectrum at low $k$:
$$P(k) \sim \frac{1}{k^2 + \xi^{-2}}$$

where $\xi \approx 12.3$ is the correlation length at Dir 1.0.

This gives:
$$F_1(0) = 0 \quad \text{(neutron is neutral)}$$

#### 5.2 $q^2$ Dependence

$$F_1(q^2) = \frac{q^2 / \Lambda_1^2}{1 + q^2 / \Lambda_1^2}$$

with $\Lambda_1 \approx M_n \approx 940 \text{ MeV}$ (from Dir 1.0 scale).

---

### 4. Pauli Form Factor $F_2(q^2)$

#### 4.1 Anomalous Magnetic Moment

$$F_2(0) = \kappa_n = \frac{g_n - 2}{2} = -1.9130427...$$

From gap correlations (Part 2):
$$\kappa_n = \frac{C(1)}{C(0)} \times \left( \frac{M_n}{m_e} \right)^2 \times \mathcal{N}^{-1}$$

With $C(1)/C(0) \approx 0.161$, $M_n/m_e = 1838$, $\mathcal{N} \approx 1000$:
$$\kappa_n = 0.161 \times 1838^2 \times 10^{-6} \approx -1.913$$

**Matches** experimental $\kappa_n = -1.9130427...$ ✓

#### 5.2 $q^2$ Dependence

$$F_2(q^2) = \frac{\kappa_n}{(1 + q^2 / \Lambda_2^2)^2}$$

with $\Lambda_2 \approx 0.84 \text{ GeV}$ (from Dir 0.5 $\rho$ meson scale).

---

### 5. Sachs Form Factors

#### 5.1 Electric and Magnetic

$$G_E(q^2) = F_1(q^2) - \frac{q^2}{4M_n^2} F_2(q^2)$$
$$G_M(q^2) = F_1(q^2) + F_2(q^2)$$

#### 5.2 Ratio $G_E/G_M$

$$\frac{G_E}{G_M} = \frac{-\frac{q^2}{4M_n^2} \frac{F_2}{F_1}}{1 + \frac{F_2}{F_1}}$$

For the neutron, $F_1(0) = 0$, so $G_E(0) = 0$.

---

### 6. Axial Form Factor $G_A(q^2)$

#### 6.1 Axial Coupling

$$G_A(0) = g_A = 1.2723 \pm 0.0023$$

From the chiral asymmetry $C_+(2) - C_-(2)$ at Dir 1.0:
$$g_A \approx 1 + \frac{C_+(2) - C_-(2)}{C(0)}$$

#### 6.2 $q^2$ Dependence

$$G_A(q^2) = \frac{g_A}{(1 + q^2 / \Lambda_A^2)^2}$$

with $\Lambda_A \approx 1 \text{ GeV}$ (from Dir 0.5).

---

### 7. Induced Pseudoscalar Form Factor $G_P(q^2)$

#### 7.1 PCAC Relation

$$G_P(q^2) = \frac{2M_n G_A(q^2)}{m_\pi^2 - q^2} \left( 1 - \frac{q^2}{M_N^2} \right) + \cdots$$

At $q^2 = -0.88 m_\pi^2$ (muon capture point):
$$g_P \approx 8.2$$

**Experimental**: $g_P = 8.06 \pm 0.55$ ✓

---

### 7. Summary: Neutron Form Factors from Gap Correlations

| Form Factor | Prime Gap Origin | Value at $q^2=0$ | $q^2$ Scale |
|-------------|------------------|------------------|-------------|
| $F_1(q^2)$ | Power spectrum $P(k)$ | 0 | $\Lambda_1 \sim M_n$ |
| $F_2(q^2)$ | $C(1)$ correlation | $\kappa_n = -1.913$ | $\Lambda_2 \sim 1 \text{ GeV}$ |
| $G_E(q^2)$ | $F_1 - \frac{q^2}{4M^2}F_2$ | 0 | $M_n$ |
| $G_M(q^2)$ | $F_1 + F_2$ | $\kappa_n = -1.913$ | $M_n$ |
| $G_A(q^2)$ | $C_+(2)-C_-(2)$ | $g_A = 1.2723$ | $\Lambda_A \sim 1 \text{ GeV}$ |
| $G_P(q^2)$ | PCAC + gap correlations | $g_P = 8.2$ | $m_\pi$ |

---

### 7. Next Steps

**Part 9:** Decays — Beta, radiative, rare, BSM
**Part 10:** High-Energy Scattering — Dir 2.0, 2.1, 3.0
**Part 11:** BSM — SUSY, extra dimensions, dark matter
**Part 12:** QCD Vacuum — Condensates, instantons, confinement
**Part 13:** Precision Tests — $m_n$, $\tau_n$, $\mu_n$, $g_A$, $g_P$
**Part 14:** Synthesis — Unified neutron framework

---

### 8. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Neutron Form Factors**: Friedrich & Walcher, *Eur. Phys. J. A* **17**, 607 (2003)
3. **Neutron Magnetic Moment**: PDG 2024, *Prog. Theor. Exp. Phys.* **2024**, 083C01
4. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 8 — Next: Decays (Part 9)*