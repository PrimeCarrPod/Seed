# Pion-Kaon Chiral Dynamics — V4.0 Deep Dive Series
## Part 6 of N — Strange Baryon Resonances: Λ, Σ, Ξ, Ω and Hyperon-Nucleon Interactions

---

### Abstract

This V4.0 installment covers the spectroscopy and structure of strange baryons — the $\Lambda, \Sigma, \Xi, \Omega$ families — within chiral effective theory and lattice QCD. We develop the SU(3) flavor description, compute hyperon-nucleon interactions from chiral EFT and lattice, and explore the strangeness nuclear chart including hypernuclei.

---

### 1. SU(3) Flavor Classification of Baryons

#### 1.1 Baryon Octet and Decuplet

The $56$ symmetric representation of $SU(3)_{\text{flavor}} \times SU(2)_{\text{spin}}$:

$$56 = (8, 2) \oplus (10, 4)$$

**Octet ($J^P = 1/2^+$):**

| Baryon | Quark content | Mass (MeV) | Strangeness |
|--------|---------------|------------|-------------|
| $p$ | $uud$ | 938.27 | 0 |
| $n$ | $udd$ | 939.57 | 0 |
| $\Lambda$ | $uds$ | 1115.68 | -1 |
| $\Sigma^+$ | $uus$ | 1189.37 | -1 |
| $\Sigma^0$ | $uds$ | 1192.64 | -1 |
| $\Sigma^-$ | $dds$ | 1197.45 | -1 |
| $\Xi^0$ | $uss$ | 1314.86 | -2 |
| $\Xi^-$ | $dss$ | 1321.71 | -2 |

**Decuplet ($J^P = 3/2^+$):**

| Baryon | Mass (MeV) | Strangeness |
|--------|------------|-------------|
| $\Delta^{++}$ | 1232 | 0 |
| $\Sigma^{*+}$ | 1382.8 | -1 |
| $\Xi^{*0}$ | 1531.8 | -2 |
| $\Omega^-$ | 1672.45 | -3 |

#### 1.2 Mass Formulas

Gell-Mann–Okubo for octet:

$$M_\Lambda = \frac{1}{3}(2M_N + 2M_\Xi - M_\Sigma) \quad \text{(holds at ~1%)}$$

Equal spacing rule for decuplet:

$$M_{\Sigma^*} - M_\Delta = M_{\Xi^*} - M_{\Sigma^*} = M_\Omega - M_{\Xi^*} \approx 145 \text{ MeV}$$

---

### 2. Chiral Effective Theory for Hyperons

#### 2.1 Heavy Baryon ChPT (HBChPT)

For baryons, $M_B \gg p$, expand in $1/M_B$:

$$\mathcal{L}_{\text{HBChPT}} = \bar{B}_v (i v \cdot D) B_v + \frac{1}{2M_B} \bar{B}_v (i D_\perp)^2 B_v + \cdots$$

where $v^\mu = (1, \vec{0})$ is the heavy baryon velocity.

#### 2.2 Leading Order: Octet Baryons

$$\mathcal{L}^{(1)} = \langle \bar{B} i \gamma^\mu D_\mu B \rangle - M_0 \langle \bar{B} B \rangle + \frac{D}{2} \langle \bar{B} \gamma^\mu \gamma_5 \{u_\mu, B\} \rangle + \frac{F}{2} \langle \bar{B} \gamma^\mu \gamma_5 [u_\mu, B] \rangle$$

with $u_\mu = i (u^\dagger \partial_\mu u - u \partial_\mu u^\dagger)$, $u^2 = U$.

Axial couplings (PDG 2024):

$$D = 0.80 \pm 0.01, \quad F = 0.46 \pm 0.01$$

#### 2.3 SU(3) Breaking at NLO

Mass splittings from $\mathcal{L}_{\chi}^{(2)}$:

$$M_B = M_0 + \alpha \langle \bar{B} \chi_+ B \rangle + \beta \langle \bar{B} B \chi_+ \rangle + \gamma \langle \bar{B} \rangle \langle \chi_+ \rangle$$

FLAG 2024 lattice (physical $m_\pi$):

| Baryon | Lattice (MeV) | Exp. (MeV) |
|--------|---------------|------------|
| $N$ | 938(5) | 938.27 |
| $\Lambda$ | 1116(4) | 1115.68 |
| $\Sigma$ | 1190(5) | 1193 (avg) |
| $\Xi$ | 1318(6) | 1318 (avg) |
| $\Omega$ | 1672(5) | 1672.45 |

---

### 3. Hyperon-Nucleon Interactions

#### 3.1 YN Scattering in Chiral EFT

At LO: One-boson exchange ($\pi, K, \eta$) + contact terms.

Potential in momentum space:

$$V_{\text{YN}}(\vec{q}) = V_\pi + V_K + V_\eta + V_{\text{contact}}$$

where $V_\pi = -\frac{f_{\pi YN}^2}{q^2 + M_\pi^2} (\vec{\sigma}_1 \cdot \vec{q})(\vec{\sigma}_2 \cdot \vec{q}) \boldsymbol{\tau}_1 \cdot \boldsymbol{\tau}_2$

Couplings from SU(3):

$$f_{\pi \Lambda N} = -\frac{1}{\sqrt{3}}(D+F) f_{\pi NN}, \quad f_{\pi \Sigma N} = (D-F) f_{\pi NN}$$

#### 3.2 NLO and NNLO

Two-pion exchange, $\pi K$ exchange, relativistic corrections.

NLO LECs fit to YN scattering data (Nijmegen ESC08, HAL QCD).

#### 3.3 Scattering Lengths and Effective Ranges

| Channel | $a_0$ (fm) | $r_0$ (fm) | Source |
|---------|------------|------------|--------|
| $\Lambda p \to \Lambda p$ | $-1.8 \pm 0.2$ | $3.2 \pm 0.3$ | HAL QCD 2023 |
| $\Sigma^+ p \to \Sigma^+ p$ | $0.5 \pm 0.3$ | $-$ | KeV data |
| $\Sigma^- p \to \Sigma^- p$ | $-0.7 \pm 0.4$ | $-$ | KeV data |
| $\Xi^0 p \to \Xi^0 p$ | $-0.3 \pm 0.5$ | $-$ | Lattice |

$\Lambda N$ attraction, $\Sigma N$ weakly repulsive in some channels.

---

### 4. Lattice QCD: YN and YY Potentials

#### 4.1 HAL QCD Method

Extract potential from Nambu-Bethe-Salpeter wave function:

$$\left[ \frac{\nabla^2}{2\mu} + k^2 \right] \psi_k(\vec{r}) = \int d^3r' V(\vec{r}, \vec{r}') \psi_k(\vec{r}')$$

At near-physical $m_\pi = 146$ MeV (HAL QCD 2023, $96^4$ lattice):

- $\Lambda N$ potential: Attractive at all $r$, depth $\sim 30$ MeV
- $\Sigma N$ ($I=3/2$): Repulsive core + attraction
- $\Xi N$: Weakly attractive
- $\Xi \Xi$: Attractive (H-dibaryon candidate?)

#### 4.2 H-Dibaryon

$uuddss$ six-quark state, $J^P = 0^+$.

Lattice (HAL QCD 2022, physical $m_\pi$):

$$B_H = 1.2 \pm 1.5 \text{ MeV} \quad (\text{binding energy})$$

Consistent with unbound or marginally bound. No deep binding.

---

### 5. Hypernuclei

#### 5.1 Single-$\Lambda$ Hypernuclei

$_\Lambda^A Z$ = $Z$ protons + $(A-Z-1)$ neutrons + $\Lambda$.

Binding energy $B_\Lambda$:

$$B_\Lambda(_\Lambda^{12}\text{C}) = 10.8 \pm 0.1 \text{ MeV}$$
$$B_\Lambda(_\Lambda^{16}\text{O}) = 12.5 \pm 0.1 \text{ MeV}$$
$$B_\Lambda(_\Lambda^{208}\text{Pb}) = 27.0 \pm 0.5 \text{ MeV}$$

Shell model with $\Lambda N$ potential reproduces data.

#### 5.2 Double-$\Lambda$ Hypernuclei

$_{\Lambda\Lambda}^A Z$ — probe $\Lambda\Lambda$ interaction.

NAGARA event (KEK E373):

$$B_{\Lambda\Lambda}(_{\Lambda\Lambda}^6\text{He}) = 6.9 \pm 0.5 \text{ MeV}$$

$$\Delta B_{\Lambda\Lambda} = B_{\Lambda\Lambda} - 2B_\Lambda = 0.9 \pm 0.5 \text{ MeV} \quad (\text{weakly attractive})$$

#### 5.3 $\Sigma$ and $\Xi$ Hypernuclei

$\Sigma$ hypernuclei: Unbound (repulsive $\Sigma N$).

$\Xi$ hypernuclei: $_{\Xi}^{15}\text{C}$ candidate (J-PARC E07):

$$B_\Xi \approx 1.2 \text{ MeV}$$

Future: J-PARC HIHR, FAIR, RHIC.

---

### 6. $\Omega$ Baryon and Multi-Strange Hadrons

#### 6.1 $\Omega^-$ Spectroscopy

$\Omega^-$ ($sss$, $J^P = 3/2^+$) is the only stable (strongly) multi-strange baryon.

Excited $\Omega$ states (PDG 2024):

| State | Mass (MeV) | Width (MeV) |
|-------|------------|-------------|
| $\Omega(2012)$ | $2012.4 \pm 0.7$ | $6.4 \pm 2.0$ |
| $\Omega(2250)$ | $2250 \pm 10$ | $\sim 50$ |
| $\Omega(2380)$ | $2380 \pm 30$ | $\sim 100$ |
| $\Omega(2470)$ | $2470 \pm 20$ | $\sim 100$ |

#### 6.2 $\Omega$ Interactions

$\Omega N$ potential from lattice (HAL QCD 2024):

Weakly attractive, no bound state.

$\Omega \Omega$ interaction: Repulsive at short range (Pauli blocking of $s$ quarks).

---

### 7. Weak Decays of Hyperons

#### 7.1 Non-leptonic Decays

$\Lambda \to p \pi^-$ (64%), $n \pi^0$ (36%)

$\Sigma^+ \to p \pi^0$ (52%), $n \pi^+$ (48%)

$\Xi^- \to \Lambda \pi^-$ (100%)

Decay asymmetry parameters:

$$\alpha_\Lambda = 0.750 \pm 0.009, \quad \alpha_\Xi = -0.401 \pm 0.010$$

Test of $SU(3)_f$ breaking in weak Hamiltonian.

#### 7.2 Radiative Decays

$\Sigma^+ \to p \gamma$: BR = $(1.23 \pm 0.05) \times 10^{-3}$

$\Xi^0 \to \Lambda \gamma$: BR = $(1.2 \pm 0.2) \times 10^{-3}$

$\Omega^- \to \Xi^0 \gamma$: BR $< 10^{-4}$

---

### 8. One-Electron Universe: Strange Baryons as Worldline Knots

In the one-electron universe, strange baryons correspond to worldline configurations with strangeness winding.

#### 8.1 Strangeness as Worldline Topology

The strange quark mass $m_s \sim 95$ MeV introduces a new scale. On the worldline:

$$\text{Strangeness winding} = \frac{1}{2\pi} \oint d\tau \, \partial_\tau \phi_s$$

Each unit of strangeness = one winding in the $U(1)_S$ fiber of the flavor bundle.

#### 8.2 Baryon as Triple Worldline Braid

A baryon = three worldline strands braided together (color singlet).

- $\Lambda$ ($uds$): Symmetric flavor-spin wavefunction, one strange strand
- $\Sigma$ ($uus, uds, dds$): Mixed symmetry, one strange strand
- $\Xi$ ($uss, dss$): Two strange strands
- $\Omega$ ($sss$): Three strange strands — maximal strangeness winding

#### 8.3 Hypernuclei as Worldline Crystals

A hypernucleus = nuclear worldline lattice with a $\Lambda$ impurity strand.

The $\Lambda$ strand does not Pauli-block with nucleon strands (different flavor) → sinks to center, binds strongly.

$\Lambda\Lambda$ hypernucleus = two impurity strands with weak attraction ($\Delta B_{\Lambda\Lambda} \approx 1$ MeV).

#### 8.4 H-Dibaryon as Six-Strand Braid

The $H$ ($uuddss$) = six worldline strands in a color-singlet braid.

Lattice: marginally bound/unbound → braid is at threshold of stability.

---

### 9. References

1. **SU(3) Baryons**: Gell-Mann, *Phys. Rev.* **125**, 1067 (1962); Okubo, *Prog. Theor. Phys.* **27**, 949 (1962)
2. **HBChPT**: Jenkins & Manohar, *Phys. Lett. B* **255**, 558 (1991); Bernard et al., *Int. J. Mod. Phys. E* **4**, 193 (1995)
3. **YN Chiral EFT**: Polinder et al., *Nucl. Phys. A* **757**, 257 (2005); Haidenbauer et al., *Eur. Phys. J. A* **56**, 91 (2020)
4. **HAL QCD**: Iritani et al., *Phys. Rev. D* **96**, 034521 (2017); *Phys. Rev. D* **107**, 034505 (2023)
5. **Hypernuclei**: Gal et al., *Rev. Mod. Phys.* **88**, 035004 (2016); J-PARC E07, *Phys. Rev. Lett.* **130**, 122501 (2023)
6. **$\Omega$ Spectroscopy**: PDG 2024; Belle, *Phys. Rev. Lett.* **121**, 052001 (2018)
7. **One-Electron Baryons**: 't Hooft, *Nucl. Phys. B* **72**, 461 (1974); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 6 — Next: Exotic Hadrons with Strangeness (Pentaquarks, Tetraquarks, H-Dibaryon Revisited), and Future Experimental Prospects*