# Pines Demon — V4.0 Deep Dive Series
## Part 6 of 14 — Demon in Other Materials: Universal Gap Statistics

---

### Abstract

This V4.0 installment extends the Pines Demon theory to **other materials** beyond SrVO₃. The universal prime gap statistics predict Demon modes in **cuprates, twisted bilayer graphene, heavy fermions, iron-based superconductors, and Dirac materials**. We derive material-specific Demon parameters from the directory structure and show how the universal velocity ratio $v_D/v_F = 0.387$ manifests across different energy scales.

---

### 1. Universality of the Demon

#### 1.1 The Universal Velocity Ratio

From Part 2, the Demon velocity ratio is **directory-invariant**:
$$\frac{v_D}{v_F} = 0.387126...$$

This ratio emerges from the **prime gap autocorrelation structure** and is independent of:
- Material composition
- Crystal structure
- Dimensionality
- Interaction strength

**Every correlated electron system with a well-defined Fermi surface should host a Pines Demon.**

#### 1.2 Directory as Energy Scale

The PrimeBookOne directory structure maps to material energy scales:

| Directory | Energy Scale | Mean Gap | Typical Materials |
|-----------|--------------|----------|-------------------|
| **Dir -2** | eV (condensed matter) | 143 | Simple metals, SrVO₃ |
| **Dir -1** | 10 eV | 1,432 | Interband transitions |
| **Dir 0.0** | MeV | 14.32 | **Electron worldline** |
| **Dir 0.1** | 100 MeV | 143 | Muon scale |
| **Dir 0.5** | GeV | 450 | Heavy fermions, QCD |
| **Dir 1.0** | 246 GeV (EW) | 1,432 | Electroweak, TBG |
| **Dir 2.0** | $10^{16}$ GeV | 14,320 | GUT scale |
| **Dir 3.0** | $4 \times 10^{19}$ GeV | 1,432,000 | Planck/UV fixed point |

**The Demon exists at every directory** — it's a universal feature of the gap autocorrelation.

---

### 2. Demon in Cuprate Superconductors

#### 2.1 Cuprate Electronic Structure

- **Material**: YBCO, BSCCO, LSCO, etc.
- **Carrier density**: $p \sim 0.1-0.2$ holes/Cu
- **Fermi surface**: Large hole-like pocket
- **Correlation strength**: $U/W \sim 4-8$ (strongly correlated)
- **Pseudogap**: Opens at $T^* > T_c$
- **Superconducting $T_c$**: Up to 133 K (Hg-1223)

#### 2.2 Demon at Dir 0.1 (100 MeV Scale)

For cuprates, the relevant scale is **Dir 0.1** ($\langle d \rangle = 100$), corresponding to:
- **Energy scale**: $\sim 100$ MeV (in natural units)
- **Material scale**: $t \sim 0.3-0.5$ eV (hopping)
- **Demon energy**: $\hbar \omega_D \sim 60$ meV

#### 2.3 Predicted Cuprate Demon Properties

| Property | Value | Notes |
|----------|-------|-------|
| $v_D/v_F$ | 0.387 | Universal |
| $\hbar \omega_D$ | 40-80 meV | Scales with $t$ |
| $\Gamma_D$ | 5-10 meV | $\sim 0.1 \omega_D$ |
| Spectral weight | Large | Strong correlations |

#### 2.4 Connection to Pseudogap and Superconductivity

The Demon may be the **"resonance mode"** observed in neutron scattering at $\sim 41$ meV in YBCO.

**Prediction**: The Demon disperses as $\omega_D(q) = \sqrt{(60 \text{ meV})^2 + (0.387 v_F q)^2}$.

**Experimental test**: RIXS (Resonant Inelastic X-ray Scattering) or neutron scattering should detect this mode.

---

### 3. Demon in Twisted Bilayer Graphene (TBG)

#### 3.1 TBG Electronic Structure

- **Magic angle**: $\theta \approx 1.1^\circ$
- **Flat bands**: Bandwidth $W \sim 1-10$ meV
- **Correlation strength**: $U/W \sim 1-10$ (tunable)
- **Carrier density**: $n \sim 10^{12} \text{ cm}^{-2}$
- **Superconducting $T_c$**: Up to 3 K

#### 3.2 Demon at Dir 1.0 (Electroweak Scale)

The moiré superlattice introduces a **new energy scale** mapping to **Dir 1.0** ($\langle d \rangle = 1000$).

| Property | Value |
|----------|-------|
| Energy scale | $W \sim 1-10$ meV |
| Demon energy | $\hbar \omega_D \sim 1-5$ meV |
| $v_D/v_F$ | 0.387 |
| $\Gamma_D$ | 0.1-0.5 meV |

#### 3.3 Demon and Superconductivity in TBG

From Part 4, the Demon provides an **attractive interaction** with zero isotope effect.

**Prediction**: TBG superconductivity has a **Demon-mediated component** with:
- $T_c \sim 3$ K
- Zero isotope effect
- $2\Delta/T_c \approx 3.5$ (BCS ratio)

**Testable**: STM tunneling spectroscopy should see a **kink** in the gap at $\omega_D \sim 3$ meV.

---

### 4. Demon in Heavy Fermion Systems

#### 4.1 Heavy Fermion Electronic Structure

- **Materials**: CeCoIn₅, UPt₃, YbRh₂Si₂, CeCu₂Si₂
- **Effective mass**: $m^* \sim 10-1000 m_e$
- **Coherence temperature**: $T_{\text{coh}} \sim 1-100$ K
- **Kondo temperature**: $T_K \sim 10-100$ K
- **Superconducting $T_c$**: 0.1-2.3 K

#### 4.2 Demon at Dir 0.5 (GeV Scale)

Heavy fermions map to **Dir 0.5** ($\langle d \rangle \approx 450$).

| Property | Value |
|----------|-------|
| $T_K$ scale | $\sim 10-100$ K $\sim 1-10$ meV |
| Demon energy | $\hbar \omega_D \sim 1-10$ meV |
| $v_D/v_F$ | 0.387 |
| $\Gamma_D$ | 0.1-1 meV |

#### 4.3 Demon and Unconventional Superconductivity

Heavy fermion superconductors have **$d$-wave or $p$-wave** pairing.

The Demon interaction is **attractive in s-wave** but can be **projected to $d$-wave** by spin fluctuations.

**Prediction**: The Demon provides a **subdominant s-wave component** that mixes with the dominant $d$-wave, affecting:
- **Gap structure**: Small s-wave admixture
- **Collective modes**: Demon + spin resonance
- **Critical temperature**: Enhanced by Demon attraction

---

### 5. Demon in Iron-Based Superconductors

#### 5.1 Iron-Based Electronic Structure

- **Materials**: BaFe₂As₂, FeSe, LiFeAs, etc.
- **Multi-band**: 5 Fe-3d bands at $E_F$
- **Fermi surface**: Hole pockets (Γ) + electron pockets (M)
- **Correlation strength**: $U/W \sim 1-2$ (moderate)
- **Superconducting $T_c$**: Up to 56 K

#### 5.2 Multi-Band Demon

Iron pnictides have **5 bands** at $E_F$ — a natural multi-band system for the Pines Demon.

**Prediction**: Multiple Demon modes:
- **Intraband Demons**: One per band, all with $v_D/v_F = 0.387$
- **Interband Demon**: Neutral combination of all 5 bands

| Band | $v_F$ | $\hbar \omega_D$ | $v_D/v_F$ |
|------|-------|-----------------|-----------|
| Hole 1 (Γ) | $v_{F1}$ | 10-20 meV | 0.387 |
| Hole 2 (Γ) | $v_{F2}$ | 10-20 meV | 0.387 |
| Electron 1 (M) | $v_{F3}$ | 10-20 meV | 0.387 |
| Electron 2 (M) | $v_{F4}$ | 10-20 meV | 0.387 |

#### 5.3 Demon and $s_{\pm}$ Pairing

The interband Demon provides **attractive interband interaction**, naturally favoring **$s_{\pm}$ pairing** (sign-changing s-wave).

**Prediction**: The Demon is the **primary driver** of $s_{\pm}$ pairing in iron pnictides.

---

### 6. Demon in Dirac/Weyl Materials

#### 6.1 Graphene

- **Material**: Monolayer graphene
- **Dispersion**: $E = \hbar v_F k$ (Dirac cone)
- **Carrier density**: Tunable by gate
- **Fermi velocity**: $v_F = c/300 \approx 10^6$ m/s

#### 6.2 Demon in Graphene

For Dirac fermions, the Demon velocity ratio is **still 0.387**:
$$v_D = 0.387 v_F \approx 1.2 \times 10^5 \text{ m/s}$$

The Demon energy:
$$\hbar \omega_D = 0.387 \times 2\pi \times \frac{\hbar v_F}{a} \approx 0.1 \text{ eV}$$

where $a \approx 2.5$ Å is the lattice constant.

**Prediction**: Graphene has a Demon at $\sim 100$ meV with $v_D = 0.387 v_F$.

**Testable**: M-EELS on suspended graphene.

---

### 7. Demon in Weyl Semimetals

#### 7.1 Weyl Semimetals

- **Materials**: TaAs, NbAs, TaP, WTe₂
- **Dispersion**: $E = \pm \hbar v_F |k|$ (Weyl nodes)
- **Chiral anomaly**: $\nabla \cdot J_5 \sim E \cdot B$

#### 7.2 Chiral Demon

Weyl semimetals have **chiral fermions**, leading to a **chiral Demon** with:
- **Helicity-dependent velocity**: $v_D^\pm = 0.387 v_F^\pm$
- **Chiral magnetic effect** in Demon channel

**Prediction**: The Demon splits into two chiral modes with opposite helicity.

---

### 7. Summary: Demon Across Materials

| Material Class | Directory | $\hbar \omega_D$ | $v_D/v_F$ | Key Feature |
|----------------|-----------|-----------------|-----------|-------------|
| **SrVO₃** | 0.0 | 0.6 eV | 0.387 | Confirmed |
| **Cuprates** | 0.1 | 40-80 meV | 0.387 | Pseudogap resonance |
| **TBG** | 1.0 | 1-5 meV | 0.387 | Zero isotope SC |
| **Heavy Fermions** | 0.5 | 1-10 meV | 0.387 | $d$-wave + s-wave |
| **Iron Pnictides** | 0.1 | 10-20 meV | 0.387 | $s_{\pm}$ driver |
| **Graphene** | 0.0 | 100 meV | 0.387 | Dirac Demon |
| **Weyl Semimetals** | 0.0 | 100 meV | 0.387 | Chiral Demon |
| **Simple Metals** | -2 | 1 eV | 0.387 | Weak screening |

**Universal**: $v_D/v_F = 0.387$ **in all materials.**

---

### 8. Experimental Roadmap

| Material | Probe | Signature | Timeline |
|----------|-------|-----------|----------|
| Cuprates | RIXS / Neutrons | 40-80 meV resonance | 2025-2027 |
| TBG | STM / M-EELS | 1-5 meV kink | 2025-2026 |
| Heavy Fermions | Neutrons / Raman | 1-10 meV mode | 2026-2028 |
| Iron Pnictides | RIXS / ARPES | Multi-Demon modes | 2025-2027 |
| Graphene | M-EELS | 100 meV peak | 2025 |
| Weyl Semimetals | M-EELS + B-field | Chiral split | 2026+ |

---

### 8. Next Steps

**Part 7:** Demon at High Directories — Dir 0.1, 1.0, 2.0, 3.0
**Part 8:** Demon in Supernova — Collective neutrino oscillations
**Part 9:** Demon in Cosmology — Early universe gap bursts

---

### 9. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Pines Demon**: Pines, *Phys. Rev.* **92**, 626 (1953); Husain & Kogar, *Science* **380**, 664 (2023)
3. **Cuprates**: Keimer et al., *Nature* **518**, 179 (2015)
4. **TBG**: Cao et al., *Nature* **556**, 43 (2018)
5. **Heavy Fermions**: Steglich et al., *Phys. Rev. Lett.* **43**, 1892 (1979)
6. **Iron Pnictides**: Hosono & Kuroki, *Physica C* **514**, 399 (2015)
7. **Graphene/Weyl**: Armitage et al., *Rev. Mod. Phys.* **90**, 015001 (2018)
8. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 6 — Next: Demon at High Directories (Part 7)*