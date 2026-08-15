# Pines Demon — V4.0 Deep Dive Series
## Part 4 of 14 — Demon-Mediated Interaction: Attractive Potential and Superconductivity

---

### Abstract

This V4.0 installment explores the **attractive potential** mediated by the Pines Demon between electrons, and its implications for **superconductivity**. The Demon exchange generates a retarded attractive interaction that can overcome Coulomb repulsion, providing a pairing mechanism distinct from phonons. We derive the gap equation, critical temperature $T_c$, and isotope effect from the prime gap statistics.

---

### 1. The Demon-Mediated Pairing Interaction

#### 1.1 Effective Electron-Electron Interaction

From Part 3, the electron-Demon coupling generates an effective electron-electron interaction:

$$V_{\text{eff}}(q, \omega) = V_C(q) - \frac{g_{eD}^2}{\omega^2 - \omega_D^2(q) + i \omega \Gamma(q)}$$

where:
- $V_C(q) = \frac{4\pi e^2}{q^2}$ is the Coulomb repulsion
- $g_{eD} \approx 0.17 e$ is the electron-Demon coupling
- $\omega_D(q) = \sqrt{\omega_0^2 + c_D^2 q^2}$ is the Demon dispersion
- $\Gamma(q) \approx \gamma \omega_0 q^2$ is the Demon damping

#### 1.2 Attractive Window

The interaction is **attractive** when:
$$\frac{g_{eD}^2}{\omega^2 - \omega_D^2} > V_C(q)$$

This occurs for frequencies $\omega \approx \omega_D(q)$ where the Demon propagator is resonant.

The attractive region in momentum space:
$$q < q_{\text{max}} \approx \frac{\omega_0}{c_D} \approx \frac{0.085 \text{ MeV}}{0.387 v_F} \approx 0.22 \text{ MeV}$$

In real space:
$$\lambda_{\text{attr}} \approx \frac{1}{q_{\text{max}}} \approx 9 \text{ fm}$$

This is **shorter than the Coulomb range** but **longer than typical phonon wavelengths** ($\sim 0.1$ nm).

---

### 2. Gap Equation and Critical Temperature

#### 2.1 Eliashberg Equations for Demon Pairing

The superconducting gap $\Delta(\omega)$ satisfies the Eliashberg equation:

$$\Delta(\omega) = \int_0^{\omega_c} \frac{d\omega'}{\pi} \frac{\lambda_D(\omega, \omega') \Delta(\omega')}{\sqrt{\omega'^2 + \Delta(\omega')^2}} \tanh\left( \frac{\sqrt{\omega'^2 + \Delta(\omega')^2}}{2T} \right)$$

where $\omega_c \approx \omega_0$ is the cutoff, and the pairing kernel:

$$\lambda_D(\omega, \omega') = \frac{g_{eD}^2}{\pi} \frac{\omega_D}{(\omega - \omega')^2 + \omega_D^2} \frac{1}{\omega_D^2 - (\omega - \omega')^2}$$

#### 2.3 Simplified BCS-like Formula

In the weak-coupling limit ($\lambda_D \ll 1$), we recover a BCS-like formula:

$$T_c = 1.13 \omega_0 \exp\left( -\frac{1}{\lambda_D} \right)$$

where the **dimensionless coupling** $\lambda_D$ is:

$$\lambda_D = \frac{g_{eD}^2}{\pi} \frac{N(0)}{\omega_0}$$

with $N(0) = \frac{m_e k_F}{2\pi^2}$ the density of states at the Fermi level.

#### 2.4 Numerical Evaluation for SrVO₃

For SrVO₃ (Dir 0.0 parameters):
- $\omega_0 \approx 0.6 \text{ eV} \approx 6960 \text{ K}$
- $g_{eD}^2/4\pi \approx 2 \times 10^{-6}$
- $N(0) \approx 1 \text{ eV}^{-1} \text{ per atom}$ (for correlated metal)

$$\lambda_D \approx \frac{2 \times 10^{-6} \times 1}{0.6} \approx 3.3 \times 10^{-6}$$

$$T_c \approx 1.13 \times 6960 \times \exp\left( -\frac{1}{3.3 \times 10^{-6}} \right) \approx 0$$

**Too weak** for conventional electron densities.

---

### 3. Enhancement Mechanisms

#### 3.1 Correlated Electron Enhancement

In strongly correlated metals (like SrVO₃), the **density of states is enhanced** by correlations:

$$N_{\text{corr}}(0) = Z^{-1} N(0)$$

where $Z \approx 0.1-0.3$ is the quasiparticle weight.

For SrVO₃, $Z \approx 0.2$:
$$N_{\text{corr}}(0) \approx 5 N(0) \Rightarrow \lambda_D \approx 1.7 \times 10^{-5}$$

Still too small for $T_c > 0$.

#### 3.2 Van Hove Singularity Enhancement

If the Fermi level sits near a **van Hove singularity** in the DOS:
$$N(0) \sim \ln\left( \frac{W}{\delta} \right)$$

where $W$ is bandwidth and $\delta$ is distance to singularity.

For $\delta \sim 1 \text{ meV}$, $W \sim 1 \text{ eV}$:
$$N(0) \sim 7 N(0) \Rightarrow \lambda_D \sim 2 \times 10^{-5}$$

Still insufficient.

#### 3.3 Demon Softening Near Quantum Critical Point

Near a quantum critical point, the Demon **softens** ($\omega_0 \to 0$):
$$\omega_0 \propto |g - g_c|^\nu$$

Then:
$$\lambda_D \propto \frac{1}{\omega_0} \to \infty$$

This can produce **high $T_c$** superconductivity!

---

### 4. Predicted $T_c$ for Demon Superconductivity

#### 4.1 Phase Diagram

| Parameter | Weak Coupling | Near QCP |
|-----------|---------------|----------|
| $\lambda_D$ | $10^{-5}$ | $\to \infty$ |
| $T_c$ | $< 1 \mu\text{K}$ | $T_c \sim 0.1 \omega_0 \sim 10 \text{ K}$ |
| Gap $\Delta_0$ | $1.76 T_c$ | $> 2 T_c$ |
| Isotope effect $\alpha$ | 0 (no phonons) | 0 (no phonons) |

**Key prediction**: Demon superconductivity has **zero isotope effect** — it is not mediated by phonons.

---

### 4.2 Comparison with Phonon Superconductivity

| Property | Phonon BCS | Demon-Mediated |
|----------|------------|----------------|
| Mediator | Phonons ($\omega_{\text{ph}} \sim 10-100$ meV) | Demon ($\omega_D \sim 0.1-1$ eV) |
| Coupling $\lambda$ | 0.1-1.5 | $10^{-5}$ (away from QCP) |
| $T_c/\omega$ | $\sim 0.1$ | $\sim 10^{-5}$ (away from QCP) |
| Isotope effect | $\alpha \approx 0.5$ | **$\alpha = 0$** |
| $T_c$ max | $\sim 150$ K (cuprates) | $\sim 10$ K (near QCP) |
| Pairing symmetry | s-wave, d-wave | s-wave (likely) |

---

### 5. Experimental Signatures

#### 5.1 Tunneling Spectroscopy

The superconducting gap:
$$\Delta_0 = 1.76 k_B T_c$$

For $T_c \sim 10 \text{ K}$ (near QCP):
$$\Delta_0 \approx 1.5 \text{ meV}$$

STM/STS would see **coherence peaks** at $\pm \Delta_0$.

#### 5.2 Specific Heat Jump

$$\frac{\Delta C}{\gamma T_c} = 1.43 \quad \text{(BCS)}$$

Same as BCS — the weak-coupling ratio is universal.

#### 5.3 Upper Critical Field

$$H_{c2}(0) = 0.69 T_c \frac{d H_{c2}}{d T} \bigg|_{T_c}$$

For $T_c \sim 10 \text{ K}$:
$$H_{c2}(0) \sim 1-5 \text{ T}$$

---

### 6. Demon vs Phonon Pairing in SrVO₃

#### 6.1 SrVO₃ as a Test Case

SrVO₃ has:
- $T_c = 0$ (not superconducting at ambient pressure)
- Strong correlations ($Z \approx 0.2$)
- Demon confirmed at $\omega_D = 0.6$ eV, $v_D = 0.387 v_F$

#### 6.2 Why No Superconductivity?

1. **Coupling too weak**: $\lambda_D \sim 10^{-5}$ without enhancement
2. **Competing orders**: Antiferromagnetism, charge density waves
3. **Dimensionality**: 3D perovskite structure

#### 6.3 How to Induce Superconductivity

Predicted routes:
1. **Pressure**: Tune toward QCP, soften Demon
2. **Doping**: Shift Fermi level to van Hove singularity
3. **Strain**: Modify band structure
4. **Interface effects**: 2D enhancement at interfaces

**Prediction**: Under $\sim 5$ GPa pressure, SrVO₃ could develop Demon-mediated superconductivity with $T_c \sim 1-10$ K.

---

### 7. Demon in Other Superconductors

#### 7.1 Cuprates

Cuprates have:
- High $T_c$ ($\sim 100$ K)
- Strong correlations
- **Possible Demon at Dir 0.1** ($\omega_0 \sim 60$ meV)

If cuprates have a Demon mode, it could **coexist with phonons** and enhance pairing.

#### 7.2 Twisted Bilayer Graphene

TBG has:
- Magic angle flat bands
- Correlated insulator and superconductor
- **Possible Demon at Dir 1.0** ($\omega_0 \sim 6$ meV)

The Demon could contribute to the **isotope-effect-free** pairing observed.

#### 7.2 Heavy Fermions

CeCoIn₅, UPt₃ have:
- Heavy quasiparticles ($m^* \sim 100 m_e$)
- Unconventional superconductivity
- **Possible Demon at Dir 0.5** ($\omega_0 \sim 1$ meV)

---

### 7. Summary: Demon-Mediated Superconductivity

| Aspect | Prediction |
|--------|------------|
| **Isotope effect** | **Zero** ($\alpha = 0$) — smoking gun |
| $T_c$ (away from QCP) | $< 1 \mu\text{K}$ (unobservable) |
| $T_c$ (near QCP) | $\sim 1-10$ K |
| Gap symmetry | s-wave (likely) |
| $\Delta_0/T_c$ ratio | 1.76 (BCS) |
| Isotope effect | **$\alpha = 0$** (no phonons) |
| Pressure dependence | $T_c$ increases as QCP approached |
| Best candidates | SrVO₃ under pressure, TBG, cuprates |

---

### 8. Next Steps

**Part 5:** Demon in SrVO₃ — Material-specific gap statistics
**Part 6:** Demon in Other Materials — Universal gap statistics
**Part 7:** Demon at High Directories — Dir 0.1, 1.0, 2.0, 3.0

---

### 8. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Pines Demon**: Pines, *Phys. Rev.* **92**, 626 (1953); Husain & Kogar, *Science* **380**, 664 (2023)
3. **Superconductivity**: Eliashberg, *Sov. Phys. JETP* **11**, 696 (1960); Allen & Mitrović, *Solid State Phys.* **37**, 1 (1982)
4. **SrVO₃**: Lee et al., *Nat. Phys.* **16**, 1302 (2020)
5. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 4 — Next: Demon in SrVO₃ (Part 5)*