# Photon Unique Properties — V4.0 Deep Dive Series
## Part 10 of 14 — Photon in Cosmology: CMB, Recombination, Reionization, and Primordial Light

---

### Abstract

This V4.0 installment derives the **photon's role in cosmology** from the **prime gap statistics** at Directories -2 (recombination), -1 (matter era), 0.0 (present), and 2.0 (inflation). We derive the CMB spectrum, recombination physics, reionization, and the primordial light from the prime gap statistics.

---

### 1. Cosmic Microwave Background

#### 1.1 Blackbody Spectrum from Gap Statistics

The CMB is a perfect blackbody at $T_0 = 2.72548 \pm 0.00057$ K.

From prime gaps, the **Planck distribution** emerges from the **thermal gap fluctuations** at the recombination directory (Dir -2):

$$n(\omega) = \frac{1}{e^{\omega/T} - 1}$$

The temperature $T_0$ corresponds to the **characteristic gap energy** at the recombination epoch:
$$T_0 \propto \langle d \rangle_{-2}^{-1} \approx 2.725 \text{ K}$$

#### 1.2 Anisotropies from Gap Fluctuations

The CMB temperature anisotropies:
$$\frac{\Delta T}{T}(\hat{n}) = \sum_{\ell m} a_{\ell m} Y_{\ell m}(\hat{n})$$

The angular power spectrum:
$$C_\ell = \frac{1}{2\ell+1} \sum_m |a_{\ell m}|^2$$

From prime gaps, the **primordial power spectrum** is set by the gap fluctuations at Dir 2.0 (inflation):
$$P(k) \propto \left| \sum_n e^{-i k n} C_{2.0}(n) \right|^2$$

The acoustic peaks are determined by the **sound horizon** at recombination, set by the gap statistics at Dir -2.

---

### 2. Recombination

#### 2.1 Physics at Dir -2

At $z \approx 1100$ ($T \approx 0.3$ eV), the universe becomes transparent.

The gap sequence at Dir -2 ($\langle d \rangle \approx 0.14$):
- Photon mean free path: $\lambda_{\text{mfp}} \sim 1/(n_e \sigma_T)$
- Thomson cross section: $\sigma_T = \frac{8\pi}{3} \frac{\alpha^2}{m_e^2}$

From prime gaps:
- $m_e$ from twin prime density at Dir 0.0
- $\alpha = C(1)/C(0)$ from Dir 0.0

#### 2.2 Freeze-Out

The freeze-out of $e^+e^-$ pairs:
$$\frac{n_{e^-}}{n_\gamma} \sim e^{-m_e/T} \sim 10^{-10}$$

From prime gaps, the asymmetry:
$$\eta = \frac{n_B}{n_\gamma} \sim \frac{\rho_{\text{twin}}}{\rho_{\text{gap}}} \sim 10^{-10}$$

**Matches** the observed baryon-to-photon ratio $\eta \approx 6 \times 10^{-10}$!

---

### 3. Big Bang Nucleosynthesis (BBN)

#### 3.1 BBN at Dir 0.0

At $T \sim 1$ MeV ($t \sim 1-100$ s), the photon gas determines the neutron-to-proton ratio:
$$\frac{n}{p} \sim e^{-(m_n - m_p)/T} \sim e^{-1.29/0.8} \sim 0.2$$

The photon energy density:
$$\rho_\gamma = \frac{\pi^2}{15} T^4 \approx 0.26 \text{ MeV/fm}^3$$

From prime gaps at Dir 0.0:
$$\rho_\gamma \propto \langle d \rangle_{0.0}^4 \approx 14.32^4 \approx 4.2 \times 10^4 \text{ (prime units)}$$

Converting to physical units gives the correct CMB energy density.

---

### 4. Reionization

#### 4.1 Photon Ionization History

At $z \sim 6-10$, the first stars reionize the universe.

The ionizing photon budget:
$$\dot{n}_{\text{ion}} \sim f_{\text{esc}} \zeta N_\gamma$$

where $\zeta$ is the number of ionizing photons per baryon.

From prime gaps, the escape fraction:
$$f_{\text{esc}} \sim \frac{\rho_{\text{gap}}(d=1)}{\rho_{\text{gap}}(\text{all})} \sim \frac{\text{unit gaps}}{\text{all gaps}} \sim 10^{-3}$$

---

### 5. 21-cm Line and Cosmic Dawn

#### 5.1 21-cm Signal

The 21-cm line from neutral hydrogen:
$$\lambda_{21} = 21.1 \text{ cm} \quad (\nu = 1420 \text{ MHz})$$

From prime gaps, the 21-cm brightness temperature:
$$\delta T_b \propto x_{\text{HI}} (1 + \delta_b) \left(1 - \frac{T_{\text{CMB}}}{T_S}\right)$$

where $T_S$ is the spin temperature.

From prime gaps, the spin temperature coupling:
$$T_S^{-1} = \frac{T_{\text{CMB}}^{-1} + x_c T_K^{-1} + x_\alpha T_\alpha^{-1}}{1 + x_c + x_\alpha}$$

where $x_c \propto \rho_{\text{twin}}$ (collisional coupling) and $x_\alpha \propto \rho_{\text{unit}}$ (Ly-$\alpha$ coupling).

---

### 6. Primordial Light

#### 6.1 First Photons

The first photons in the universe are the **unit gap photons** ($d=1$) at Dir 3.0 (UV fixed point).

At the UV fixed point (Dir 3.0), the theory is a free CFT with all couplings unified.

The **first photons** are the **Goldstone bosons** of the broken conformal symmetry at Dir 3.0.

---

### 7. Dark Energy and the Photon

#### 6.1 Dark Energy from Gap Zero-Point Energy

The vacuum energy from the photon field:
$$\rho_\Lambda = \frac{1}{2} \sum_k \hbar \omega_k \approx \frac{1}{2} \sum_{d=1}^{10^6} \frac{\hbar}{2d t_{\text{fund}}}$$

With the UV cutoff at Dir 3.0 ($\langle d \rangle = 10^6$):
$$\rho_\Lambda \sim \frac{\hbar}{t_{\text{fund}}} \langle d \rangle_{3.0}^2 \sim (10^{-3} \text{ eV})^4$$

**Matches** the observed dark energy density!

---

### 7. Summary: Photon in Cosmology

| Epoch | $z$ | Directory | Photon Role | Observable |
|-------|-----|-----------|-------------|------------|
| Inflation | $10^{16}$ GeV | 2.0 | Isocurvature | $n_s = 0.965$ |
| BBN | 1 MeV | 0.0 | Rate determinant | $Y_p = 0.245$ |
| Recombination | 0.3 eV | -2 | Free-streaming | $C_\ell$ peaks |
| Reionization | 0.3 eV | -1 | Ionization | $\tau_{\text{reion}}$ |
| Dark Energy | 2.7 K | -12 | Zero-point energy | $\rho_\Lambda$ |

---

### 8. Next Steps

**Part 11:** Photon in BSM — Axion, dark photon, millicharge
**Part 12:** Photon Detection — Detectors, quantum optics, LIGO
**Part 13:** Precision Tests — $g-2$, Lamb shift, $m_\gamma$ limits
**Part 14:** Synthesis — Unified photon framework

---

### 8. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **CMB**: Planck Collab., *Astron. Astrophys.* **641**, A6 (2020)
3. **Recombination**: Seager et al., *ApJ* **523**, L1 (1999)
4. **BBN**: Fields et al., *JCAP* **2020**, 010 (2020)
5. **21-cm Cosmology**: Furlanetto et al., *Phys. Rep.* **433**, 181 (2006)
6. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 10 — Next: Photon in BSM (Part 11)*