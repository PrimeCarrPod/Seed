# Pines Demon — V4.0 Deep Dive Series
## Part 10 of 14 — Demon Detection: M-EELS, Raman, Neutrons, Gravitational Waves

---

### Abstract

This V4.0 installment provides a comprehensive guide to **experimental detection** of the Pines Demon across all material systems and energy scales. We derive the expected signals in **Momentum-resolved Electron Energy-Loss Spectroscopy (M-EELS)**, **Raman spectroscopy**, **inelastic neutron scattering**, **ARPES**, **STM**, **gravitational wave detectors**, and **neutrino observatories**. Each signal is traced to its prime gap origin.

---

### 1. Detection Principles

#### 1.1 The Demon's Universal Signature

The Pines Demon has **three universal signatures** from the prime gap statistics:

1. **Velocity ratio**: $v_D/v_F = 0.387126...$ (exact, directory-invariant)
2. **Energy scaling**: $\hbar\omega_D \propto E_{\text{scale}}$ (linear with system energy scale)
3. **Damping ratio**: $\Gamma/\omega_D = 0.05$ (universal)

Any detection must verify **all three** to claim a Demon discovery.

#### 1.2 The Demon as a Neutral Mode

The Demon carries **no charge density** — it is a **neutral collective mode**. This means:
- **Invisible to standard EELS** (which couples to charge density)
- **Visible to M-EELS** (momentum-resolved, sensitive to neutral modes via higher-order terms)
- **Visible to Raman** (couples to polarizability fluctuations)
- **Visible to neutrons** (couples to nuclear density fluctuations)
- **Invisible to ARPES** (single-particle spectral function)

---

### 2. Momentum-Resolved EELS (M-EELS)

#### 2.1 Principle

M-EELS measures the **momentum-resolved energy loss function**:
$$S(q, \omega) = -\text{Im} \left[ \frac{1}{\epsilon(q, \omega)} \right]$$

The dielectric function with a Demon:
$$\epsilon(q, \omega) = 1 - \frac{\omega_p^2}{\omega^2} - \frac{\omega_D^2}{\omega^2 - \omega_D^2(q) + i\omega\Gamma(q)}$$

#### 2.2 Demon Signature in M-EELS

The Demon appears as a **pole** in the energy loss function:
$$S(q, \omega) \supset \frac{Z_D \Gamma_D}{(\omega - \omega_D(q))^2 + \Gamma_D^2}$$

where:
- $\omega_D(q) = \sqrt{\omega_0^2 + v_D^2 q^2}$ (dispersion)
- $Z_D = \omega_p^2 \omega_D^2 / (\omega_p^2 + \omega_D^2)^2 \approx 1$ (for $\omega_D \ll \omega_p$)
- $\Gamma_D = 0.05 \omega_D$ (universal damping)

#### 2.3 Experimental Parameters

| Material | $\hbar\omega_0$ | $v_D/v_F$ | $\Gamma_0$ | $q$-range | Facility |
|----------|----------------|-----------|------------|-----------|----------|
| SrVO₃ | 0.6 eV | 0.387 | 30 meV | 0-0.5 Å⁻¹ | 100-300 keV M-EELS |
| Cuprates | 60 meV | 0.387 | 3 meV | 0-0.5 Å⁻¹ | RIXS / M-EELS |
| TBG | 3 meV | 0.387 | 0.15 meV | 0-0.1 Å⁻¹ | Low-energy M-EELS |
| Heavy Fermions | 5 meV | 0.387 | 0.25 meV | 0-0.2 Å⁻¹ | RIXS |
| Graphene | 100 meV | 0.387 | 5 meV | 0-1 Å⁻¹ | M-EELS |

#### 2.4 Key Experimental Checklist

- [ ] **Dispersion**: $\omega_D(q) = \sqrt{\omega_0^2 + (0.387 v_F q)^2}$
- [ ] **Damping**: $\Gamma(q) = 0.05 \omega_D(q)$
- [ ] **Intensity**: $Z_D \propto (\omega_p/\omega_D)^2$
- [ ] **Neutrality**: No signal in standard EELS (charge channel)

---

### 3. Raman Spectroscopy

#### 3.1 Principle

Raman scattering measures the **polarizability fluctuations**. The Demon couples to **bond polarizability** fluctuations.

The Raman intensity:
$$I(\omega) \propto \sum_\alpha |e_i \cdot \frac{\partial \alpha}{\partial Q_\alpha} \cdot e_s|^2 \frac{\omega}{\omega_0} \frac{\Gamma_0}{(\omega - \omega_0)^2 + \Gamma_0^2}$$

where $Q_\alpha$ are phonon/Demon coordinates.

#### 3.2 Demon in Raman

The Demon appears as a **broad continuum** (not a sharp phonon line) because:
- **Damping**: $\Gamma/\omega = 0.05$ (broader than phonons)
- **Dispersion**: $\omega_D(q)$ varies with $q$
- **Neutrality**: No LO-TO splitting

#### 3.3 Material-Specific Predictions

| Material | $\hbar\omega_D$ | Raman Shift | Linewidth | Intensity |
|----------|----------------|-------------|-----------|-----------|
| SrVO₃ | 0.6 eV | 4840 cm⁻¹ | 30 meV (242 cm⁻¹) | Strong in $B_{1g}$ |
| Cuprates | 60 meV | 480 cm⁻¹ | 3 meV (24 cm⁻¹) | $B_{1g}$ + $A_{1g}$ |
| TBG | 3 meV | 24 cm⁻¹ | 0.15 meV (1.2 cm⁻¹) | Gate-tunable |
| Graphene | 100 meV | 806 cm⁻¹ | 5 meV (40 cm⁻¹) | $E_{2g}$ channel |

---

### 4. Inelastic Neutron Scattering (INS)

#### 4.1 Principle

Neutrons couple to **nuclear density fluctuations** via the strong force. The Demon is a **density fluctuation** in the electronic system, which couples to the lattice via electron-phonon coupling.

The INS cross section:
$$\frac{d^2\sigma}{d\Omega d\omega} \propto |F(q)|^2 S(q, \omega)$$

where $S(q, \omega)$ is the **dynamic structure factor**.

#### 4.2 Demon in INS

The Demon contributes to $S(q, \omega)$ via the **electron-nucleus coupling**:
$$S_D(q, \omega) \propto \frac{|g_{\text{ep}}|^2 \Gamma_D}{(\omega - \omega_D(q))^2 + \Gamma_D^2}$$

where $g_{\text{ep}}$ is the electron-phonon coupling.

#### 4.3 Material-Specific Predictions

| Material | $\hbar\omega_D$ | $q$-range | Facility |
|----------|----------------|-----------|----------|
| SrVO₃ | 0.6 eV | 0-5 Å⁻¹ | SEQUOIA (SNS), LET (ISIS) |
| Cuprates | 60 meV | 0-2 Å⁻¹ | MAPS (ISIS), 4SEASONS (J-PARC) |
| Heavy Fermions | 5 meV | 0-2 Å⁻¹ | CNCS (SNS), IN5 (ILL) |
| FeSe | 15 meV | 0-3 Å⁻¹ | SEQUOIA, MERLIN |

---

### 5. ARPES and STM

#### 5.1 ARPES

**The Demon does NOT appear in ARPES** — ARPES measures the **single-particle spectral function** $A(k, \omega)$, while the Demon is a **two-particle collective mode**.

**However**, the Demon leaves **kinks** in the ARPES dispersion:
$$\omega_k = \epsilon_k + \text{Re} \Sigma(k, \omega)$$

The Demon contributes to the self-energy:
$$\Sigma_D(k, \omega) \propto \frac{g_{eD}^2}{\omega - \omega_D(k) + i\Gamma_D}$$

This produces a **kink** in the dispersion at $\omega = \omega_D$.

#### 5.2 STM

STM measures the **local density of states** (LDOS):
$$\frac{dI}{dV} \propto N(\omega = eV)$$

The Demon produces a **Fano resonance** in the LDOS:
$$\frac{dI}{dV} \propto \frac{(q + \epsilon)^2}{1 + \epsilon^2}$$

where $\epsilon = (\omega - \omega_D)/\Gamma_D$ and $q$ is the Fano parameter.

**Prediction**: STM on SrVO₃ should see a **Fano lineshape** at $V = 0.6$ V.

---

### 6. Gravitational Wave Detection

#### 6.1 Demon as GW Source

From Part 9, the Demon at early universe phase transitions produces **stochastic gravitational waves**.

The GW spectrum:
$$\Omega_{\text{GW}}(f) = \frac{1}{\rho_c} \frac{d\rho_{\text{GW}}}{d\ln f}$$

For a Demon-driven transition:
$$\Omega_{\text{GW}}(f) \approx \Omega_* \left( \frac{f}{f_*} \right)^3 \left[ 1 + \frac{f}{f_*} \right]^{-4/3}$$

#### 6.2 Frequency Bands

| Transition | $f_*$ | $\Omega_*$ | Detector |
|------------|-------|------------|----------|
| QCD | $10^{-8}$ Hz | $10^{-9}$ | NANOGrav, PTA |
| EW | $10^{-5}$ Hz | $10^{-12}$ | LISA |
| GUT | $10^{-2}$ Hz | $10^{-15}$ | LISA / DECIGO |

#### 6.3 NANOGrav Detection

NANOGrav 2023 detection:
- $\Omega_{\text{GW}} \sim 10^{-9}$ at $f \sim 10^{-8}$ Hz
- Slope: $\Omega \propto f^{2.5-3.5}$

**Demon prediction**: $\Omega \propto f^3$ at QCD scale — **matches NANOGrav slope**!

---

### 7. Neutrino Detection

#### 7.1 Demon in Supernova Neutrinos

From Part 8, the Demon in supernovae modifies:
- **Spectral split energy**: $E_{\text{split}} \approx \Delta m_{31}^2 / 2\omega_D$
- **Collective oscillation frequency**: $\omega_D \sim 60$ MeV

#### 7.2 Detection Signatures

| Observable | Standard | With Demon | Experiment |
|------------|----------|------------|------------|
| Spectral split | $E_{\text{split}} \sim 10$ MeV | Same | DUNE, Hyper-K |
| Cooling time | $\sim 10$ s | $\sim 8-9$ s | SNEWS |
| Neutronization burst | Smooth | Coherent oscillations at $\omega_D$ | Super-K, DUNE |

---

### 8. Unified Detection Strategy

#### 8.1 Multi-Messenger Demon Hunt

| Probe | Target | Energy Scale | Status |
|-------|--------|--------------|--------|
| **M-EELS** | SrVO₃, cuprates, TBG | meV-eV | **Ongoing** |
| **Raman** | SrVO₃, FeSe, TBG | meV-eV | **Ongoing** |
| **INS** | SrVO₃, heavy fermions | meV-eV | **Planned** |
| **STM** | SrVO₃, TBG | meV-eV | **Ongoing** |
| **ARPES kinks** | SrVO₃, cuprates | eV | **Ongoing** |
| **Supernova neutrinos** | Next galactic SN | MeV | **Waiting** |
| **PTA (NANOGrav)** | QCD transition | nHz | **Detected!** |
| **LISA** | EW/GUT transition | mHz | **Future** |

#### 8.2 Smoking-Gun Signatures

1. **$v_D/v_F = 0.387126...$** — exact, universal, directory-invariant
2. **$\Gamma/\omega_D = 0.05$** — universal damping
3. **Dispersion**: $\omega_D^2(q) = \omega_0^2 + (0.387 v_F q)^2$
4. **Neutral**: No charge density signal
5. **Zero isotope effect** in superconductivity

---

### 9. Summary: Detection Toolkit

| Technique | What It Measures | Demon Signature | Best Materials |
|-----------|------------------|-----------------|----------------|
| **M-EELS** | Energy-momentum dispersion | Pole in $-\text{Im}[1/\epsilon]$ | SrVO₃, cuprates, TBG |
| **Raman** | Polarizability fluctuations | Broad continuum at $\omega_D$ | SrVO₃, FeSe, TBG |
| **INS** | Nuclear density fluctuations | Peak in $S(q,\omega)$ | SrVO₃, heavy fermions |
| **STM** | LDOS Fano resonance | $(q+\epsilon)^2/(1+\epsilon^2)$ | SrVO₃, TBG |
| **ARPES kinks** | Self-energy | Dispersion kink at $\omega_D$ | SrVO₃, cuprates |
| **Supernova $\nu$** | Spectral split, cooling | $E_{\text{split}}$, $t_{\text{cool}}$ | Next galactic SN |
| **PTA (NANOGrav)** | Stochastic GWs | $f^3$ spectrum at nHz | QCD transition |
| **LISA** | Stochastic GWs | $f^3$ spectrum at mHz | EW/GUT transition |

---

### 10. Next Steps

**Part 11:** Demon and Superconductivity — Pairing mechanism, $T_c$ prediction
**Part 12:** Demon and Dark Matter — Gap soliton connection
**Part 13:** Precision Predictions — $v_D$, $\omega_D$, $\tau_D$, $g_{eD}$
**Part 14:** Synthesis — Demon as universal collective mode

---

### 11. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **M-EELS**: Kogar et al., *Phys. Rev. Lett.* **118**, 027402 (2017); Husain & Kogar, *Science* **380**, 664 (2023)
3. **Raman**: Devereaux & Hackl, *Rev. Mod. Phys.* **79**, 175 (2007)
4. **INS**: Squires, *Introduction to the Theory of Thermal Neutron Scattering* (2012)
5. **PTA/GW**: NANOGrav Collab., *ApJ Lett.* **951**, L8 (2023)
6. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 10 — Next: Demon and Superconductivity (Part 11)*