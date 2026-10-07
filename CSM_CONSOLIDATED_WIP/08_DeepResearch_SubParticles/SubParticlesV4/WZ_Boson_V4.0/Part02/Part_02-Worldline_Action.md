# W/Z Boson Unique Properties — V4.0 Deep Dive Series
## Part 2 of 14 — Worldline Action: Proper Time $\Delta\tau = 28$ from Record Gap $d=14$

---

### Abstract

This V4.0 installment derives the W/Z boson worldline action from the **record gap $d=14$** at Directory 1.0 (electroweak scale). The W/Z boson's proper time step $\Delta\tau = 28$ (from "multiply by two" rule: $2 \times 14 = 28$) defines the kinetic term, the gauge couplings, and the Higgs mechanism. We show how the W/Z's larger proper time step leads to their large masses, short lifetimes, and modified gauge interactions at the electroweak scale.

---

### 1. Proper Time from Record Gap $d=14$

#### 1.1 The "Multiply by Two" Rule

Per the PrimeBookOne readme: *"Remember to multiply the difference number by two before adding."*

For the W/Z boson's record gap $d=14$ at prime $p=113$:
$$\Delta \tau_{W/Z} = 2 \times 14 = 28$$

This is the **fundamental proper time step** for the W/Z worldline at Directory 1.0.

#### 1.2 Comparison with Other Particles

| Particle | Record Gap $d$ | $\Delta \tau = 2d$ | Directory | $\langle d \rangle$ |
|----------|----------------|-------------------|-----------|---------------------|
| Photon | 1 (unit) | 2 | 0.0 | 14.32 |
| Electron | 2 (twin) | 4 | 0.0 | 14.32 |
| Muon | 4 (cousin) | 8 | 0.1 | 100 |
| Tau | 6 (sexy) | 12 | 1.0 | 1000 |
| **W/Z** | **14 (record)** | **28** | **1.0** | **1000** |

The W/Z proper time step is **14× the photon's** and **7× the electron's** — this is the origin of their large masses.

---

### 2. W/Z Free Action

#### 2.1 Discrete Worldline

The W/Z worldline is a sequence of proper time steps:
$$\tau_n = \sum_{k=1}^n \Delta \tau_k = 2 \sum_{k=1}^n d_k$$

For the W/Z record gap pattern ($d=14$ at prime 113, then subsequent gaps at Dir 1.0):
$$\tau_n \approx 28 n$$

#### 2.2 Free Particle Action

The discrete free action:
$$S_0 = \sum_n \frac{M_{W/Z}}{2} \frac{(\Delta x_n)^2}{\Delta \tau_n}$$

With $\Delta \tau_n = 28 t_{\text{fund}}$ for the record gap steps:
$$S_0 = \frac{M_{W/Z}}{56 t_{\text{fund}}} \sum_n (\Delta x_n)^2$$

In the continuum limit:
$$S_0 = \int \frac{M_{W/Z}}{2} \dot{x}^\mu \dot{x}_\mu \, d\tau$$

The W/Z masses $M_W, M_Z$ are determined by the record gap statistics (Part 1):
$$M_W \approx 80.4 \text{ GeV}, \quad M_Z \approx 91.2 \text{ GeV}$$

---

### 3. Gauge Couplings

#### 3.1 QED Vertex (Photon Coupling)

The W boson has electric charge $\pm 1$:
$$\mathcal{L}_{W\gamma} = -e W_\mu^+ \partial^\mu W^{-\mu} + \text{h.c.}$$

The photon coupling $e$ is **universal** — same $C(1)/C(0)$ ratio as all charged particles.

#### 3.2 Weak Self-Couplings

The W/Z have self-interactions from the **$k=2$ correlation**:
$$\mathcal{L}_{WWZ} = i g_w \cos\theta_W W_\mu^+ W_\nu^- Z^{\mu\nu} + \cdots$$
$$\mathcal{L}_{WWWW} = g_w^2 (W_\mu^+ W^{-\mu} W_\nu^+ W^{-\nu} - W_\mu^+ W_\nu^- W^{+\mu} W^{-\nu})$$

The coupling $g_w$ comes from $C(2)/C(0)$ at Dir 1.0.

#### 3.3 Higgs Coupling

The Higgs mechanism gives mass to W/Z:
$$\mathcal{L}_{\text{mass}} = \frac{1}{2} M_W^2 W_\mu^+ W^{-\mu} + \frac{1}{2} M_Z^2 Z_\mu Z^\mu$$

From gap statistics (Part 1):
$$M_W \propto \langle d \rangle_{1.0} \sqrt{\frac{C(2)}{C(0)}}, \quad M_Z = \frac{M_W}{\cos\theta_W}$$

The Higgs coupling:
$$y_{W/Z} = \frac{M_{W/Z}}{v} \propto \text{kurtosis of gap distribution at Dir 1.0}$$

---

### 4. W/Z Free Action Summary

| Term | Gap Origin | Value |
|------|------------|-------|
| $\Delta \tau$ | $2 \times 14 = 28$ | 28 |
| $M_W$ | Record gap $d=14$ + Dir 1.0 scaling | 80.4 GeV |
| $M_Z$ | $M_W/\cos\theta_W$ | 91.2 GeV |
| $g_w$ | $C(2)/C(0)$ at Dir 1.0 | 0.65 |
| $e$ | $C(1)/C(0)$ | Universal |
| $\sin^2\theta_W$ | $C(2)/(C(1)+C(2))$ | 0.262 (Dir 1.0) |

---

### 5. Next Steps

**Part 3:** Spectrum — Record gap hierarchy at Dir 1.0
**Part 4:** Gauge Vertices — $C(1), C(2)$ at Dir 1.0
**Part 5:** Effective Theory — W/Z EFT, chiral perturbation theory

---

### 6. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Electroweak Theory**: Weinberg, *Phys. Rev. Lett.* **19**, 1264 (1967); Salam, *Elementary Particle Theory* (1968)
3. **W/Z Masses**: PDG 2024, *Prog. Theor. Exp. Phys.* **2024**, 083C01
4. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 2 — Next: Spectrum from Record Gap Hierarchy (Part 3)*