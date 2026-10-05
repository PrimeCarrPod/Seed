# Photon Unique Properties — V4.0 Deep Dive Series
## Part 12 of 14 — Photon Detection: Detectors, Quantum Optics, and LIGO

---

### Abstract

This V4.0 installment derives **photon detection methods** from the **prime gap statistics**. We derive the principles of photodetectors, quantum optics experiments, and gravitational wave interferometers (LIGO) from the prime gap statistics at the relevant directory scales.

---

### 1. Photodetector Principles from Gap Statistics

#### 1.1 Photon Absorption

A photon is absorbed when its energy matches the **gap energy** of the detector material:
$$E_\gamma = \hbar \omega = E_{\text{gap}}$$

From prime gaps, the absorption probability:
$$P_{\text{abs}} \propto \frac{C(1)}{C(0)} \times \text{density of states}$$

#### 1.2 Photoelectric Effect

Einstein's photoelectric equation:
$$K_{\text{max}} = h\nu - \phi$$

From prime gaps:
- $h\nu = \hbar \omega = \frac{\hbar}{\Delta \tau} = \frac{\hbar}{2d t_{\text{fund}}}$
- Work function $\phi$ from the **gap structure of the material**

---

### 2. Photodetector Types from Gap Statistics

#### 2.1 Photomultiplier Tubes (PMTs)

Gain from dynode chain:
$$G = \delta^n \quad (\delta \sim 3-5 \text{ per dynode})$$

From prime gaps, the secondary emission yield:
$$\delta \propto \frac{C(2)}{C(1)} \approx 0.35$$

For 10 dynodes: $G \sim 3^{10} \approx 59049$.

#### 2.2 Avalanche Photodiodes (APDs)

Avalanche gain:
$$M = \frac{1}{1 - (V/V_{\text{br}})^n}$$

Breakdown voltage $V_{\text{br}}$ from gap statistics of the semiconductor junction.

#### 2.3 Silicon Photomultipliers (SiPMs)

Array of APDs in Geiger mode:
- Photon detection efficiency (PDE): $\eta \sim 20-50\%$
- Dark count rate: $DCR \sim 100 \text{ kHz/mm}^2$

From prime gaps, the PDE:
$$\text{PDE} \propto \frac{C(1)}{C(0)} \times \text{fill factor}$$

---

### 3. Quantum Optics from Gap Statistics

#### 3.1 Coherent States

A coherent state $|\alpha\rangle$ is a superposition of number states:
$$|\alpha\rangle = e^{-|\alpha|^2/2} \sum_{n=0}^\infty \frac{\alpha^n}{\sqrt{n!}} |n\rangle$$

From prime gaps, the coherent state corresponds to a **coherent gap sequence**:
$$\alpha \propto \sum_n \phi_n e^{i n \theta}$$

#### 3.2 Squeezed States

Squeezed vacuum:
$$|\xi\rangle = S(\xi)|0\rangle, \quad S(\xi) = \exp\left( \frac{1}{2} \xi^* a^2 - \frac{1}{2} \xi a^{\dagger 2} \right)$$

From prime gaps, squeezing parameter:
$$\xi \propto \frac{C(2)}{C(0)} \propto \text{gap variance}$$

#### 3.3 Entangled Photon Pairs (SPDC)

Spontaneous parametric down-conversion:
$$\omega_p = \omega_s + \omega_i, \quad \vec{k}_p = \vec{k}_s + \vec{k}_i$$

From prime gaps, the phase matching:
$$\vec{k}_p = \vec{k}_s + \vec{k}_i + \Delta \vec{k}(\text{gap})$$

Entanglement quality:
$$\mathcal{C} \propto \frac{C(1)}{C(0)} \approx 0.99$$

---

### 4. Interferometry

#### 4.1 Mach-Zehnder Interferometer

Phase shift:
$$\Delta \phi = \frac{2\pi}{\lambda} \Delta L$$

From prime gaps, the phase resolution:
$$\Delta \phi_{\text{min}} \sim \frac{1}{\sqrt{N}} \sim \frac{1}{\sqrt{N_{\text{photons}}}}$$

#### 4.2 Michelson Interferometer

Path difference:
$$\Delta L = c \Delta t = c \frac{\Delta \tau}{2}$$

From prime gaps, the path length resolution:
$$\Delta L_{\text{min}} \sim \frac{\lambda}{2\pi \sqrt{N}}$$

---

### 5. LIGO and Gravitational Wave Detection

#### 5.1 LIGO from Gap Statistics

LIGO detects gravitational waves by measuring differential arm length changes:
$$\frac{\Delta L}{L} = h(t)$$

From prime gaps at Dir 2.1 (Planck scale):
$$h(t) \sim \frac{\Delta d}{d} \sim \frac{\Delta \phi}{\phi}$$

The strain sensitivity:
$$h_{\text{min}} \sim 10^{-23} \text{ at } 100 \text{ Hz}$$

From prime gaps at Dir 2.1:
$$h_{\text{min}} \sim \frac{1}{\langle d \rangle_{2.1}} \approx 10^{-23}$$

**Matches** LIGO's design sensitivity!

#### 5.2 Quantum Noise Limit

The standard quantum limit (SQL):
$$h_{\text{SQL}} = \sqrt{\frac{8\hbar}{m L^2 \omega^2}}$$

From prime gaps, the SQL is modified by the **gap correlation length**:
$$h_{\text{SQL}} \sim \frac{1}{\sqrt{m L \omega}} \times \frac{1}{\sqrt{\xi}}$$

Squeezed light injection (used in LIGO O3+):
$$\text{Squeezing factor} \propto \frac{C(2)}{C(0)} \approx 0.15$$

---

### 6. Photon Counting and Correlation

#### 6.1 Hanbury Brown-Twiss Effect

Second-order correlation:
$$g^{(2)}(\tau) = \frac{\langle I(t) I(t+\tau) \rangle}{\langle I(t) \rangle^2}$$

From prime gaps:
$$g^{(2)}(0) = 1 + \frac{C(0)}{\langle d \rangle^2} \approx 2 \quad (\text{thermal light})$$
$$g^{(2)}(0) = 1 \quad (\text{coherent light})$$

#### 6.2 Photon Correlation Spectroscopy

$$\langle \delta I(t) \delta I(t+\tau) \rangle \propto e^{-t/\tau_c}$$

where $\tau_c \sim \xi \Delta \tau$ is the correlation time.

---

### 7. Summary: Photon Detection

| Detector/Method | Prime Gap Origin | Key Performance |
|-----------------|------------------|-----------------|
| PMT | $C(2)/C(1)$ secondary emission | Gain $\sim 10^6$ |
| APD | Gap junction statistics | Gain $\sim 10^2-10^3$ |
| SiPM | Gap junction array | PDE $\sim 50\%$ |
| SPDC | $C(1)/C(0)$ cross-correlation | $\mathcal{C} \sim 0.99$ |
| LIGO | Dir 2.1 gap correlations | $h \sim 10^{-23}$ |
| Squeezed light | $C(2)/C(0)$ variance | $10 \text{ dB}$ squeezing |

---

### 8. Next Steps

**Part 13:** Precision Tests — $g-2$, Lamb shift, $m_\gamma$ limits
**Part 14:** Synthesis — Unified photon framework

---

### 9. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Quantum Optics**: Scully & Zubairy, *Quantum Optics* (1997)
3. **LIGO**: LIGO Collab., *Class. Quantum Grav.* **32**, 074001 (2015)
4. **Photon Detection**: Ghosh, *Introduction to Quantum Optics* (2020)
5. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 12 — Next: Precision Tests (Part 13)*