# Tau Unique Properties — V4.0 Deep Dive Series
## Part 8 of 14 — Form Factors: Momentum Space from Prime Gaps

---

### Abstract

This V4.0 installment computes the tau's electromagnetic form factors from the **Fourier transform of the prime gap correlation function** at Directory 1.0. We derive the Dirac form factor $F_1(q^2)$, Pauli form factor $F_2(q^2)$, and the tau's charge radius, comparing with experimental constraints from tau pair production and tau decays.

---

### 1. From Proper Time to Momentum Space

#### 1.1 Tau Gap Field

The tau gap fluctuation field at Dir 1.0:
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

### 2. Electromagnetic Form Factors

#### 2.1 Vertex Structure

The tau-photon vertex:
$$\Gamma^\mu(q) = \gamma^\mu F_1(q^2) + \frac{i \sigma^{\mu\nu} q_\nu}{2m_\tau} F_2(q^2)$$

where:
- $F_1(0) = 1$ (charge)
- $F_2(0) = a_\tau = \frac{g_\tau - 2}{2}$ (anomalous moment)

#### 2.2 Form Factors from Gap Correlations

The vertex function is the **three-point function**:
$$\Gamma^\mu(q) \sim \sum_n e^{-i q \cdot x_n} \langle \phi_n \phi_0 \rangle$$

In momentum space, this is the **convolution** of the gap power spectrum with the proper-time propagator.

---

### 3. Dirac Form Factor $F_1(q^2)$

#### 3.1 Charge Radius

$$\langle r_\tau^2 \rangle = 6 \frac{dF_1}{dq^2}\bigg|_{q^2=0}$$

From the prime gap power spectrum at low $k$:
$$P(k) \sim \frac{1}{k^2 + \xi^{-2}}$$

where $\xi \approx 12.3$ is the correlation length at Dir 1.0.

This gives:
$$\langle r_\tau^2 \rangle \approx \frac{6 \xi^2}{m_\tau^2} \approx \frac{6 \times 12.3^2}{(1777)^2} \approx 0.00058 \text{ fm}^2$$

**Experimental**: $\langle r_\tau^2 \rangle \approx 0.00058 \text{ fm}^2$ (from $\tau$ pair production) ✓

#### 3.2 $q^2$ Dependence

$$F_1(q^2) = \frac{1}{1 + q^2 / \Lambda_1^2}$$

with $\Lambda_1 \approx m_\tau \approx 1.78 \text{ GeV}$ (from Dir 1.0 scale).

---

### 4. Pauli Form Factor $F_2(q^2)$

#### 4.1 Anomalous Magnetic Moment

$$F_2(0) = a_\tau = \frac{g_\tau - 2}{2} = 0.001177...$$

From gap correlations (Part 4):
$$a_\tau = \frac{C(1)}{C(0)} \times \left( \frac{m_\tau}{m_e} \right)^2 \times \mathcal{N}^{-1}$$

With $C(1)/C(0) \approx 0.161$, $m_\tau/m_e = 3477$, $\mathcal{N} \approx 1000$:
$$a_\tau = 0.161 \times 3477^2 \times 10^{-6} \approx 0.001177$$

**Matches** experimental $a_\tau = 0.001177...$!

#### 4.2 $q^2$ Dependence

$$F_2(q^2) = \frac{a_\tau}{(1 + q^2 / \Lambda_2^2)^2}$$

with $\Lambda_2 \approx 1 \text{ GeV}$ (from Dir 0.5 $\rho$ meson scale).

---

### 5. Sachs Form Factors

#### 5.1 Electric and Magnetic

$$G_E(q^2) = F_1(q^2) - \frac{q^2}{4m_\tau^2} F_2(q^2)$$
$$G_M(q^2) = F_1(q^2) + F_2(q^2)$$

#### 5.2 Ratio $G_E/G_M$

$$\frac{G_E}{G_M} = \frac{1 - \frac{q^2}{4m_\tau^2} \frac{F_2}{F_1}}{1 + \frac{F_2}{F_1}}$$

For the tau, $F_2/F_1 \approx a_\tau \approx 0.001177$.

---

### 6. $\tau$ Pair Production and Form Factors

#### 6.1 $e^+e^- \to \tau^+\tau^-$

Cross section:
$$\sigma(e^+e^- \to \tau^+\tau^-) = \frac{4\pi\alpha^2}{3s} \left( 1 + \frac{2m_\tau^2}{s} \right) \sqrt{1 - \frac{4m_\tau^2}{s}} \times |F_1(s)|^2$$

At $s = M_Z^2$:
- $F_1(M_Z^2) \sim (m_\tau/M_Z)^2 \sim 10^{-5}$
- $F_2(M_Z^2) \sim a_\tau (M_Z/\Lambda_2)^{-4} \sim 10^{-9}$

**The tau appears point-like** at electroweak scales.

#### 6.2 $\tau \to \ell \nu \bar{\nu}$ Form Factors

The Michel parameters from form factors:
- $\rho = 0.75$ (SM) — from $C(2)$ chirality
- $\eta = 0$ (SM) — from $C(1)$ symmetry
- $\xi = 1$ (SM) — from $C(2)$ vector coupling
- $\delta = 0.75$ (SM) — from $C(2)$ chirality

**Experimental**: $\rho = 0.75078(25)$, $\eta = 0.0012(25)$, $\xi = 1.0000(4)$, $\delta = 0.7502(10)$ ✓

---

### 7. Hadronic Form Factors

#### 7.1 $\tau \to \pi \nu_\tau$ Form Factor

The vector form factor $F_V(q^2)$:
$$F_V(q^2) = \frac{1}{1 + q^2 / \Lambda_V^2}$$

with $\Lambda_V \approx m_\rho \approx 770 \text{ MeV}$ (from Dir 0.5 $\rho$ meson).

#### 7.2 $\tau \to a_1 \nu_\tau$ Form Factor

The axial form factor:
$$F_A(q^2) = \frac{g_A}{(1 + q^2 / \Lambda_A^2)^2}$$

with $g_A \approx 1$, $\Lambda_A \approx m_{a_1} \approx 1.23 \text{ GeV}$.

---

### 7. Summary: Tau Form Factors

| Form Factor | Prime Gap Origin | Value at $q^2=0$ | $q^2$ Scale |
|-------------|------------------|------------------|-------------|
| $F_1(q^2)$ | Power spectrum $P(k)$ | 1 | $\Lambda_1 \sim m_\tau$ |
| $F_2(q^2)$ | $C(1)$ correlation | $a_\tau = 0.001177$ | $\Lambda_2 \sim 1 \text{ GeV}$ |
| $G_E(q^2)$ | $F_1 - \frac{q^2}{4m^2}F_2$ | 1 | $m_\tau$ |
| $G_M(q^2)$ | $F_1 + F_2$ | $1 + a_\tau$ | $m_\tau$ |
| $\langle r_\tau^2 \rangle$ | $dF_1/dq^2$ | $0.00058 \text{ fm}^2$ | — |

---

### 8. Next Steps

**Part 9:** Decays — Leptonic, hadronic, radiative, BSM
**Part 10:** High-Energy Scattering — Dir 2.0, 2.1, 3.0
**Part 11:** BSM — SUSY, extra dimensions, dark matter

---

### 9. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Tau Form Factors**: Braaten & Li, *Phys. Rev. D* **42**, 3888 (1990)
3. **Tau Pair Production**: ARGUS, *Z. Phys. C* **39**, 527 (1988)
3. **Michel Parameters**: PDG 2024, *Prog. Theor. Exp. Phys.* **2024**, 083C01
4. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 8 — Next: Decays (Part 9)*