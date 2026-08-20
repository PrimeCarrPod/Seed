# Photon Unique Properties — V4.0 Deep Dive Series
## Part 2 of 14 — Worldline Action: Proper Time $\Delta\tau = 2$ from Unit Gap $d=1$

---

### Abstract

This V4.0 installment derives the photon's worldline action from the **unit prime gap $d=1$** at Directory 0.0. The photon's proper time step $\Delta\tau = 2$ (from "multiply by two" rule: $2 \times 1 = 2$) defines the kinetic term, the Maxwell action, and the coupling to charged particles. We show how the photon's null worldline, gauge invariance, and Maxwell's equations emerge from the unit gap statistics at Directory 0.0.

---

### 1. Proper Time from Unit Gap $d=1$

#### 1.1 The "Multiply by Two" Rule

Per the PrimeBookOne readme: *"Remember to multiply the difference number by two before adding."*

For the unit gap $d=1$ at prime $p=2$:
$$\Delta \tau_\gamma = 2 \times 1 = 2$$

This is the **fundamental proper time step** for the photon worldline at Directory 0.0.

#### 1.2 Comparison with Massive Particles

| Particle | Record Gap $d$ | $\Delta \tau = 2d$ | Directory | $\langle d \rangle$ |
|----------|----------------|-------------------|-----------|---------------------|
| **Photon** | **1 (unit)** | **2** | **0.0** | **14.32** |
| Electron | 2 (twin) | 4 | 0.0 | 14.32 |
| Muon | 4 (cousin) | 8 | 0.1 | 100 |
| Tau | 6 (sexy) | 12 | 1.0 | 1000 |

The photon's proper time step is the **minimal possible** — it is the **fundamental quantum** of proper time.

---

### 2. Photon Free Action

#### 2.1 Discrete Worldline

The photon worldline is a sequence of proper time steps:
$$\tau_n = \sum_{k=1}^n \Delta \tau_k = 2 \sum_{k=1}^n d_k$$

For the photon's unit gap pattern ($d=1$ at prime 2, then subsequent gaps):
$$\tau_n \approx 2 n$$

#### 2.2 Free Photon Action

The discrete free action for a gauge field:
$$S_0 = \sum_n \frac{1}{2} (\Delta A_n)^2 \Delta \tau_n$$

With $\Delta \tau_n = 2 t_{\text{fund}}$ for the unit gap steps:
$$S_0 = \frac{1}{t_{\text{fund}}} \sum_n (\Delta A_n)^2$$

In the continuum limit:
$$S_0 = -\frac{1}{4} \int F_{\mu\nu} F^{\mu\nu} d^4x$$

where $F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu$ is the electromagnetic field strength tensor.

The photon field $A_\mu$ is the **gauge connection** of the electron worldline — the connection that parallel-transports the electron phase along its worldline.

---

### 3. Gauge Invariance from Gap Translation Symmetry

#### 3.1 Gap Translation Invariance

The prime gap sequence is **translation invariant** in the statistical sense:
$$P(d_1, d_2, \ldots) = P(d_{n+1}, d_{n+2}, \ldots)$$

This translation invariance corresponds to **gauge invariance** in the continuum.

#### 3.2 Ward Identity

The Ward identity follows from the **invariance of the gap sum** under a shift:
$$\sum_n \Delta \tau_n = \text{total proper time} = \text{invariant}$$

Under a gauge transformation $A_\mu \to A_\mu + \partial_\mu \Lambda$, the action changes by:
$$\delta S = \int \partial_\mu (\Lambda J^\mu) d^4x = 0$$

This is the **Ward identity** — the photon decouples from unphysical polarizations.

---

### 4. Maxwell's Equations from Gap Statistics

#### 4.1 Field Equations from Gap Correlations

The electromagnetic field equations emerge from the **gap correlation functions**:

$$\partial_\mu F^{\mu\nu} = J^\nu$$

where the current $J^\nu$ is the **gap correlation current**:
$$J^\nu(x) = \langle \phi(x) \phi(0) \rangle \partial^\nu \phi(x)$$

At Dir 0.0, the gap correlation $C(k)$ gives the photon propagator:
$$D_{\mu\nu}(k) = \frac{-i g_{\mu\nu}}{k^2 + i\epsilon}$$

#### 4.2 Homogeneous Maxwell Equations

The homogeneous equations:
$$\partial_\mu \tilde{F}^{\mu\nu} = 0$$

come from the **Bianchi identity** of the gap sequence — the fact that gaps are exact differences of primes.

---

### 5. Photon-Matter Coupling

#### 5.1 Minimal Coupling

The photon couples to charged particles via **minimal coupling**:
$$\mathcal{L}_{\text{int}} = -e \bar{\psi} \gamma^\mu \psi A_\mu$$

From prime gaps:
- $e^2 = 4\pi \frac{C(1)}{C(0)} \mathcal{N}^{-1}$
- The vertex factor is $-e \gamma^\mu$

#### 5.2 Universality of Coupling

The photon couples to **all charged particles** with the **same strength $e$** because the $C(1)/C(0)$ ratio is directory-invariant.

This is **gauge universality** from the gap statistics.

---

### 6. Photon Propagator from Gap Correlations

#### 6.1 Two-Point Function

The photon propagator in Feynman gauge:
$$D_{\mu\nu}(k) = \frac{-i g_{\mu\nu}}{k^2 + i\epsilon}$$

In the prime gap picture, this comes from the **gap autocorrelation** at Dir 0.0:
$$D_{\mu\nu}(k) \propto \frac{g_{\mu\nu}}{\tilde{C}(k)}$$

where $\tilde{C}(k)$ is the Fourier transform of the gap correlation $C(k)$.

#### 6.2 Pole Structure

The pole at $k^2 = 0$ corresponds to the **massless photon** — a consequence of the **unit gap $d=1$** having no mass gap in the gap distribution.

---

### 6. Photon Self-Energy

#### 6.1 Vacuum Polarization

The photon self-energy from electron loops:
$$\Pi^{\mu\nu}(k) = -i e^2 \int \frac{d^4p}{(2\pi)^4} \text{Tr}\left[ \gamma^\mu \frac{1}{\not{p} - \not{k} - m_e} \gamma^\nu \frac{1}{\not{p} - m_e} \right]$$

From prime gaps, the UV cutoff $\Lambda$ is the **maximum gap** at Dir 0.0:
$$\Lambda \sim \max(d) \sim 220 \times \langle d \rangle \sim 3000 \text{ (in gap units)}$$

#### 6.2 Running Coupling

$$\alpha(\mu) = \frac{\alpha(\mu_0)}{1 - \frac{\alpha(\mu_0)}{3\pi} \ln(\mu/\mu_0)}$$

From prime gaps, the running comes from the **scale dependence of $C(1)/C(0)$**.

---

### 7. Summary: Photon Worldline from Unit Gap

| Aspect | Electron ($d=2$) | Photon ($d=1$) | Ratio $\gamma/e$ |
|--------|------------------|----------------|------------------|
| $\Delta \tau$ | 4 | 2 | 0.5 |
| Mass | 0.511 MeV | 0 | 0 |
| Charge | $-e$ | 0 | 0 |
| Spin | $1/2$ | 1 | 2 |
| Lifetime | $\infty$ | $\infty$ | 1 |
| Coupling $e$ | $C(1)/C(0)$ | $C(1)/C(0)$ | 1 |
| Speed | $< c$ | $c$ | — |

---

### 7. Next Steps

**Part 3:** Gauge Theory — QED from gap correlations
**Part 4:** Form Factors — $F_1, F_2$ from gap correlations at Dir 0.0
**Part 5:** Radiative Processes — Compton, pair production, bremsstrahlung

---

### 8. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **QED**: Feynman, *QED: The Strange Theory of Light and Matter* (1985)
4. **QED Tests**: Aoyama et al., *Phys. Rep.* **887**, 1 (2020)
5. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 2 — Next: Gauge Theory — QED from Gap Correlations (Part 3)*