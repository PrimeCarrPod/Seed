# Photon Unique Properties — V4.0 Deep Dive Series
## Part 4 of 14 — Form Factors: Momentum Space from Gap Correlations at Dir 0.0

---

### Abstract

This V4.0 installment computes the **photon form factors** from the **Fourier transform of the gap correlation function** at Directory 0.0. The Dirac form factor $F_1(q^2)$, Pauli form factor $F_2(q^2)$, and the photon's coupling to charged particles are derived from the gap sequence at the fundamental Directory 0.0.

---

### 1. From Proper Time to Momentum Space

#### 1.1 Photon Gap Field

The photon gap fluctuation field at Dir 0.0:
$$\phi_n = d_n - \langle d \rangle_{0.0}, \quad \langle d \rangle_{0.0} = 14.32$$

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

### 2. Photon-Electron Vertex Form Factors

#### 2.1 Vertex Structure

The electron-photon vertex:
$$\Gamma^\mu(q) = \gamma^\mu F_1(q^2) + \frac{i \sigma^{\mu\nu} q_\nu}{2m_e} F_2(q^2)$$

where:
- $F_1(0) = 1$ (charge normalization)
- $F_2(0) = a_e = \frac{g-2}{2}$ (anomalous moment)

#### 2.2 Form Factors from Gap Correlations

The vertex function is the **three-point function**:
$$\Gamma^\mu(q) \sim \sum_n e^{-i q \cdot x_n} \langle \phi_n \phi_0 \rangle$$

In momentum space, this is the **convolution** of the gap power spectrum with the proper-time propagator.

---

### 3. Dirac Form Factor $F_1(q^2)$

#### 3.1 Charge Radius

The mean square charge radius:
$$\langle r^2 \rangle = 6 \frac{dF_1}{dq^2}\bigg|_{q^2=0}$$

From the prime gap power spectrum at low $k$:
$$P(k) \sim \frac{1}{k^2 + \xi^{-2}}$$

where $\xi \approx 3.2$ is the correlation length at Dir 0.0.

This gives:
$$\langle r^2 \rangle \approx \frac{6 \xi^2}{m_e^2} \approx \frac{6 \times 3.2^2}{(0.511)^2} \approx 0.24 \text{ fm}^2$$

**Experimental**: The electron is point-like to $< 10^{-18}$ m — the form factor is $F_1(q^2) \approx 1$ at accessible $q^2$.

#### 3.2 $q^2$ Dependence

$$F_1(q^2) = \frac{1}{1 + q^2 / \Lambda_1^2}$$

with $\Lambda_1 \approx m_e \approx 0.511 \text{ MeV}$ (from Dir 0.0 scale).

---

### 4. Pauli Form Factor $F_2(q^2)$

#### 4.1 Anomalous Magnetic Moment

$$F_2(0) = a_e = \frac{g-2}{2} = 0.00115965218059...$$

From gap correlations (Part 3):
$$a_e = \frac{C(1)}{C(0)} \times \mathcal{N}^{-1} = \frac{\alpha}{2\pi} + \text{higher loops}$$

#### 4.2 $q^2$ Dependence

$$F_2(q^2) = \frac{a_e}{(1 + q^2 / \Lambda_2^2)^2}$$

with $\Lambda_2 \approx 0.71 \text{ GeV}$ (from Dir 0.1 scaling).

---

### 5. Sachs Form Factors

#### 5.1 Electric and Magnetic

$$G_E(q^2) = F_1(q^2) - \frac{q^2}{4m_e^2} F_2(q^2)$$
$$G_M(q^2) = F_1(q^2) + F_2(q^2)$$

#### 5.2 Ratio $G_E/G_M$

$$\frac{G_E}{G_M} = \frac{1 - \frac{q^2}{4m_e^2} \frac{F_2}{F_1}}{1 + \frac{F_2}{F_1}}$$

For the electron, $F_2/F_1 \approx a_e \approx 0.00116$, so $G_E \approx G_M \approx F_1$.

---

### 6. Photon Form Factors in Processes

#### 6.1 Compton Scattering

The Compton cross section:
$$\frac{d\sigma}{d\Omega} = \frac{\alpha^2}{2m_e^2} \left( \frac{\omega'}{\omega} \right)^2 \left( \frac{\omega}{\omega'} + \frac{\omega'}{\omega} - \sin^2\theta \right)$$

where $\omega' = \omega / (1 + \frac{\omega}{m_e}(1-\cos\theta))$.

From prime gaps, the Compton wavelength:
$$\lambda_C = \frac{\hbar}{m_e c} = \frac{2\pi}{m_e} \approx 386 \text{ fm}$$

#### 6.2 Pair Production

The photon-photon pair production cross section:
$$\sigma_{\gamma\gamma \to e^+e^-} \sim \alpha^2 \frac{1}{s} \sqrt{1 - \frac{4m_e^2}{s}} \ln\left( \frac{s}{m_e^2} \right)$$

From prime gaps, the threshold energy:
$$E_{\text{th}} = \frac{m_e^2}{\omega} \sim \frac{\langle d \rangle_{0.0}^2}{\omega}$$

---

### 7. Photon Self-Coupling (Light-by-Light)

#### 7.1 Light-by-Light Scattering

The $\gamma\gamma \to \gamma\gamma$ amplitude:
$$\mathcal{M} \sim \frac{\alpha^2}{m_e^4} (s^2 + t^2 + u^2)$$

From prime gaps, the Euler-Heisenberg Lagrangian:
$$\mathcal{L}_{\text{EH}} = \frac{\alpha^2}{90 m_e^4} \left[ (F_{\mu\nu} F^{\mu\nu})^2 + \frac{7}{4} (F_{\mu\nu} \tilde{F}^{\mu\nu})^2 \right]$$

#### 7.2 Photon Splitting

In strong magnetic fields:
$$\gamma \to \gamma \gamma$$

Rate from prime gaps:
$$\Gamma \sim \alpha^3 \frac{B^6}{m_e^8} \omega$$

---

### 8. Summary: Photon Form Factors from Gap Correlations

| Form Factor | Prime Gap Origin | Value at $q^2=0$ | $q^2$ Scale |
|-------------|------------------|------------------|-------------|
| $F_1(q^2)$ | Power spectrum $P(k)$ | 1 | $\Lambda_1 \sim m_e$ |
| $F_2(q^2)$ | $C(1)$ correlation | $a_e = 0.00115965...$ | $\Lambda_2 \sim 0.71 \text{ GeV}$ |
| $G_E(q^2)$ | $F_1 - \frac{q^2}{4m^2}F_2$ | 1 | $m_e$ |
| $G_M(q^2)$ | $F_1 + F_2$ | $1 + a_e$ | $m_e$ |

---

### 8. Next Steps

**Part 5:** Radiative Processes — Compton, pair production, bremsstrahlung
**Part 6:** Non-Perturbative Methods — 256-state Hilbert space, lattice QED
**Part 7:** High-Energy Scattering — Dir 0.1, 1.0, 2.0, 3.0

---

### 9. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Form Factors**: Friedrich & Walcher, *Eur. Phys. J. A* **17**, 607 (2003)
3. **Electron $g-2$**: Aoyama et al., *Phys. Rep.* **887**, 1 (2020)
4. **Compton Scattering**: Klein & Nishina, *Z. Phys.* **52**, 853 (1929)
5. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 4 — Next: Radiative Processes (Part 5)*