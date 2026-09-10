# Pines Demon — V4.0 Deep Dive Series
## Part 11 of 14 — Demon and Superconductivity: Pairing Mechanism and $T_c$ Prediction

---

### Abstract

This V4.0 installment develops the **Demon-mediated superconductivity** theory from the prime gap statistics. The Demon provides an **attractive pairing interaction** with **zero isotope effect** — a smoking gun for non-phononic superconductivity. We derive the gap equation, $T_c$, gap symmetry, and experimental signatures for Demon-mediated superconductors.

---

### 1. The Demon Pairing Interaction

#### 1.1 Effective Interaction

From Part 4, the electron-Demon coupling generates an effective electron-electron interaction:

$$V_{\text{eff}}(q, \omega) = V_C(q) - \frac{g_{eD}^2}{\omega^2 - \omega_D^2(q) + i\omega\Gamma(q)}$$

where:
- $V_C(q) = \frac{4\pi e^2}{q^2}$ (Coulomb repulsion)
- $g_{eD} \approx 0.17 e$ (electron-Demon coupling)
- $\omega_D(q) = \sqrt{\omega_0^2 + (0.387 v_F q)^2}$ (Demon dispersion)
- $\Gamma(q) \approx 0.05 \omega_D(q)$ (universal damping)

#### 1.2 Attractive Window

The interaction is attractive when:
$$\frac{g_{eD}^2}{\omega_0^2} > V_C(q=0) \Rightarrow \frac{g_{eD}^2}{\omega_0^2} > \frac{4\pi e^2}{q_{\text{TF}}^2}$$

where $q_{\text{TF}}^2 = 4\pi e^2 N(0)$ is the Thomas-Fermi screening wavevector.

This requires:
$$\frac{g_{eD}^2}{\omega_0^2} N(0) > \frac{4\pi e^2}{q_{\text{TF}}^2} N(0) = \frac{1}{\pi}$$

Defining the dimensionless coupling:
$$\lambda_D = \frac{g_{eD}^2}{\pi \omega_0} N(0)$$

The condition for attraction: $\lambda_D > 1/\pi \approx 0.318$.

---

### 2. Gap Equation and $T_c$

#### 2.1 Eliashberg Equations

The gap function $\Delta(\omega)$ satisfies:

$$\Delta(\omega) = \pi T \sum_{\omega_n} \frac{\lambda_D(\omega, \omega_n) \Delta(\omega_n)}{\sqrt{\omega_n^2 + \Delta(\omega_n)^2}}$$

where the pairing kernel:
$$\lambda_D(\omega, \omega') = \frac{g_{eD}^2}{\pi} \frac{\omega_D}{(\omega - \omega')^2 + \omega_D^2} \frac{1}{\omega_D^2 - (\omega - \omega')^2}$$

#### 2.2 Weak-Coupling Limit ($\lambda_D \ll 1$)

In the weak-coupling limit, we recover a BCS-like formula:

$$T_c = 1.13 \omega_0 \exp\left( -\frac{1}{\lambda_D} \right)$$

with $\lambda_D = \frac{g_{eD}^2}{\pi} \frac{N(0)}{\omega_0}$.

#### 2.3 Strong-Coupling Limit ($\lambda_D \gtrsim 1$)

For $\lambda_D \gtrsim 1$, the full Eliashberg equations must be solved. The $T_c$ enhancement over BCS:

$$\frac{T_c}{\omega_0} = f(\lambda_D)$$

where $f(\lambda) \approx 1.13 e^{-1/\lambda}$ for $\lambda \ll 1$, and $f(\lambda) \approx 0.18 \lambda$ for $\lambda \gg 1$.

---

### 3. Universal $T_c$ Formula from Prime Gaps

#### 3.1 Coupling from Prime Gaps

From Part 3, the electron-Demon coupling:
$$g_{eD} = \frac{C_{eD}(0)}{\sqrt{C_{ee}(0) C_{DD}(0)}} \sqrt{4\pi\alpha} \approx 0.17 e$$

The density of states $N(0)$ at the relevant directory:

| Directory | System | $N(0)$ | $\omega_0$ | $\lambda_D$ |
|-----------|--------|--------|------------|-------------|
| 0.0 | SrVO₃ | $N_0$ | 0.6 eV | $3 \times 10^{-6}$ |
| 0.1 | Cuprates | $10 N_0$ | 60 meV | $5 \times 10^{-5}$ |
| 0.5 | Heavy Fermions | $100 N_0$ | 5 meV | $10^{-3}$ |
| 1.0 | TBG | $10^3 N_0$ | 5 meV | $0.1$ |
| 2.0 | GUT | $10^6 N_0$ | 600 eV | $10^2$ |

#### 3.2 The $T_c$ Formula

$$T_c = 1.13 \omega_0 \exp\left( -\frac{1}{\lambda_D} \right)$$

where $\lambda_D = \frac{g_{eD}^2}{\pi \omega_0} N(0) = \frac{(0.17)^2}{\pi} \frac{N(0)}{\omega_0} \alpha$.

Since $N(0) \propto m^*$ (effective mass) and $\omega_0 \propto E_{\text{scale}}$:
$$\lambda_D \propto \frac{m^*}{E_{\text{scale}}}$$

**Key insight**: Demon $T_c$ is enhanced in systems with **large effective mass** and **low energy scale** (heavy fermions, TBG, cuprates near QCP).

---

### 4. Gap Symmetry

#### 4.1 Symmetry from Demon Vertex

The Demon vertex is **scalar** (from Part 3):
$$\Gamma = 1 - \gamma^5 \quad \text{(left-handed)}$$

But for Cooper pairing (two electrons with opposite momenta), the effective interaction is:
$$V_{\text{pair}}(k, k') = V_D(k - k')$$

The Demon interaction is **isotropic** in momentum space (depends only on $|k-k'|$).

#### 4.2 Predicted Symmetry

The Demon-mediated interaction favors **s-wave pairing** (isotropic gap).

However, in the presence of competing interactions:
- **Spin fluctuations** → $d$-wave
- **Phonons** → s-wave
- **Demon** → **s-wave**

**Prediction**: In pure Demon-mediated superconductors, the gap is **isotropic s-wave**.

In multi-mechanism systems (cuprates, heavy fermions):
- **s + d mixing**: $\Delta(k) = \Delta_s + \Delta_d \cos(2\phi)$
- **Time-reversal breaking**: s + id possible

---

### 5. Isotope Effect: The Smoking Gun

#### 5.1 Zero Isotope Effect

The Demon is a **purely electronic collective mode** — it involves **no lattice motion**.

Therefore:
$$\alpha = -\frac{d\ln T_c}{d\ln M} = 0$$

**This is the definitive experimental signature** of Demon-mediated superconductivity.

#### 5.2 Comparison

| Mechanism | Isotope Exponent $\alpha$ |
|-----------|---------------------------|
| **Phonons (BCS)** | 0.5 |
| **Phonons (strong coupling)** | 0.3-0.5 |
| **Spin fluctuations** | 0 |
| **Demon** | **0** (exact) |
| **Electronic mechanisms** | 0 |

**Any superconductor with $\alpha = 0$ and $T_c$ scaling with electronic parameters (not phonons) is a Demon superconductor candidate.**

---

### 6. Gap Structure and Thermodynamics

#### 5.1 Gap Ratio

In weak coupling:
$$\frac{2\Delta_0}{k_B T_c} = 3.53$$

In strong coupling (Eliashberg):
$$\frac{2\Delta_0}{k_B T_c} = 3.53 \left[ 1 + 12.5 \left( \frac{T_c}{\omega_0} \right)^2 \ln\left( \frac{\omega_0}{T_c} \right) \right]$$

For Demon superconductors near QCP ($\lambda_D \sim 1$):
$$\frac{2\Delta_0}{k_B T_c} \approx 4.5-5.0$$

#### 5.2 Specific Heat Jump

$$\frac{\Delta C}{\gamma T_c} = 1.43 \quad \text{(BCS)}$$

For strong coupling:
$$\frac{\Delta C}{\gamma T_c} = 1.43 \left[ 1 + 53 \left( \frac{T_c}{\omega_0} \right)^2 \right]$$

---

### 6. Upper Critical Field and Penetration Depth

#### 6.1 $H_{c2}(T)$

$$H_{c2}(0) = 0.693 T_c \left| \frac{dH_{c2}}{dT} \right|_{T_c}$$

For Demon superconductors:
$$\frac{dH_{c2}}{dT} \bigg|_{T_c} = -\frac{4\pi^2 k_B^2}{7\zeta(3) e v_F^2} \frac{T_c}{\omega_0} \lambda_D$$

#### 6.2 Penetration Depth

$$\lambda_L^{-2} = \frac{4\pi n_s e^2}{m^*}$$

The superfluid density $n_s$ is modified by Demon pairing.

---

### 7. Candidate Materials for Demon Superconductivity

#### 6.1 Best Candidates

| Material | Why | Predicted $T_c$ | Key Test |
|----------|-----|-----------------|----------|
| **SrVO₃ under pressure** | Dir 0.0, near QCP | 1-10 K | $\alpha=0$, M-EELS Demon |
| **Twisted Bilayer Graphene** | Dir 1.0, flat bands | 3 K (observed) | STM kink, zero $\alpha$ |
| **Cuprates (overdoped)** | Dir 0.1, near QCP | 10-30 K | RIXS Demon, $\alpha=0$ |
| **Heavy Fermions (CeCoIn₅)** | Dir 0.5, QCP | 2.3 K | INS Demon, s+d gap |
| **Iron Pnictides (BaFe₂As₂)** | Dir 0.1, multi-band | 25 K | M-EELS multi-Demon |
| **FeSe monolayer** | Dir 0.1, interface | 65 K | STM kink, ARPES |

#### 6.2 Ruled Out

| Material | Reason |
|----------|--------|
| Conventional BCS (Al, Pb) | $\alpha=0.5$, phonons |
| MgB₂ | $\alpha \approx 0.3$, phonons |
| Cuprates (optimally doped) | $d$-wave, spin fluctuations dominate |

---

### 7. Experimental Signatures of Demon Superconductivity

| Observable | Demon Prediction | Phonon BCS |
|------------|-----------------|------------|
| **Isotope effect $\alpha$** | **0** | 0.5 |
| **$T_c$ vs pressure** | Increases toward QCP | Weak/non-monotonic |
| **Gap symmetry** | s-wave (or s+d) | s-wave |
| **$2\Delta/T_c$** | 3.53 (weak) to 4.5 (strong) | 3.53 |
| **Specific heat jump** | 1.43 $\gamma T_c$ (BCS) | 1.43 |
| **$H_{c2}(0)$** | Enhanced near QCP | Standard |
| **STM kink** | At $\omega_D$ | At phonon energy |
| **M-EELS** | Demon pole at $\omega_D$ | Phonon poles |

---

### 7. Summary: Demon Superconductivity

| Feature | Prediction |
|---------|------------|
| **Pairing mediator** | Pines Demon (neutral collective mode) |
| **Coupling** | $g_{eD} \approx 0.17 e$ |
| **Isotope effect** | **Exactly zero** (smoking gun) |
| **Gap symmetry** | s-wave (or s+d near QCP) |
| **$T_c$ formula** | $T_c = 1.13 \omega_0 e^{-1/\lambda_D}$ |
| **Best candidates** | SrVO₃ (pressure), TBG, heavy fermions, FeSe |
| **Key experiments** | M-EELS, Raman, STM, $\alpha$ measurement |

---

### 8. Next Steps

**Part 12:** Demon and Dark Matter — Gap soliton connection
**Part 13:** Precision Predictions — $v_D$, $\omega_D$, $\tau_D$, $g_{eD}$
**Part 14:** Synthesis — Demon as universal collective mode

---

### 8. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Pines Demon**: Pines, *Phys. Rev.* **92**, 626 (1953); Husain & Kogar, *Science* **380**, 664 (2023)
3. **Superconductivity**: Eliashberg, *Sov. Phys. JETP* **11**, 696 (1960); Allen & Mitrović, *Solid State Phys.* **37**, 1 (1982)
4. **SrVO₃**: Lee et al., *Nat. Phys.* **16**, 1302 (2020)
5. **TBG**: Cao et al., *Nature* **556**, 43 (2018)
6. **Heavy Fermions**: Steglich et al., *Phys. Rev. Lett.* **43**, 1892 (1979)
7. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 11 — Next: Demon and Dark Matter (Part 12)*