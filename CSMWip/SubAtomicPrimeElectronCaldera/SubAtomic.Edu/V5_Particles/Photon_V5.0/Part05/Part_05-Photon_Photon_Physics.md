# Photon Physics — V5.0 Deep Dive Series
## Part 5 of N — Photon-Photon Physics: Light-by-Light Scattering, $\gamma\gamma \to$ Hadrons, and BSM Searches

---

### Abstract

This V5.0 installment covers photon-photon collisions — the purest probe of QED and QCD at the amplitude level. We develop light-by-light scattering (Euler-Heisenberg, dispersive), $\gamma\gamma \to$ hadrons (resonances, continuum), $\gamma\gamma$ at colliders (LEP, LHC, future), and BSM searches in the $\gamma\gamma$ channel.

---

### 1. Light-by-Light Scattering

#### 1.1 Euler-Heisenberg Effective Lagrangian

The one-loop QED effective action for constant fields:

$$\mathcal{L}_{\text{EH}} = \frac{\alpha^2}{90 m_e^4} \left[ (\mathbf{E}^2 - \mathbf{B}^2)^2 + 7 (\mathbf{E} \cdot \mathbf{B})^2 \right]$$

For photon-photon scattering $\gamma\gamma \to \gamma\gamma$:
$$\mathcal{M}(s, t, u) = \frac{14 \alpha^2}{45 m_e^4} (s^2 + t^2 + u^2)$$

#### 1.2 Low-Energy Theorem

For $\omega \ll m_e$:
$$\sigma(\gamma\gamma \to \gamma\gamma) = \frac{973}{10125\pi} \alpha^4 \frac{\omega^6}{m_e^8} \approx 1.3 \times 10^{-34} \left( \frac{\omega}{\text{MeV}} \right)^6 \text{ cm}^2$$

Extremely small — never directly measured in vacuum.

#### 1.3 Delbrück Scattering

$\gamma + \text{nucleus} \to \gamma + \text{nucleus}$ via virtual $e^+e^-$ pairs.
Measured at high energies (SLAC, LHC ultra-peripheral).

---

### 2. $\gamma\gamma \to$ Hadrons

#### 2.1 General Formalism

Cross section for $e^+e^- \to e^+e^- X$ via $\gamma\gamma$:
$$\frac{d\sigma}{dW dQ_1^2 dQ_2^2} = \frac{4\pi\alpha^2}{W Q_1^2 Q_2^2} f_{\gamma/e}(x_1, Q_1^2) f_{\gamma/e}(x_2, Q_2^2) \sigma_{\gamma\gamma}(W)$$

where $W = \sqrt{s_{\gamma\gamma}}$, $Q_i^2$ = photon virtualities.

#### 2.2 Resonance Production

| Resonance | $J^{PC}$ | $\Gamma_{\gamma\gamma}$ (keV) | BR $\times \Gamma_{\gamma\gamma}$ |
|-----------|----------|------------------------------|-----------------------------------|
| $f_0(500)/\sigma$ | $0^{++}$ | — | — |
| $f_0(980)$ | $0^{++}$ | $0.29 \pm 0.08$ | — |
| $f_2(1270)$ | $2^{++}$ | $2.8 \pm 0.4$ | $\pi\pi$ dominant |
| $a_2(1320)$ | $2^{++}$ | $1.0 \pm 0.1$ | $\pi\eta$ |
| $f_2'(1525)$ | $2^{++}$ | $0.11 \pm 0.02$ | $K\bar{K}$ |
| $\eta_c(1S)$ | $0^{-+}$ | $5.3 \pm 0.4$ | — |
| $\chi_{c0}$ | $0^{++}$ | $2.3 \pm 0.2$ | — |
| $\chi_{c2}$ | $2^{++}$ | $0.52 \pm 0.05$ | — |
| $\eta_b$ | $0^{-+}$ | $0.45 \pm 0.07$ | — |

#### 2.3 $J^{PC}$ Selection Rules

Landau-Yang theorem: $J=1$ forbidden for $\gamma\gamma \to$ massive state.

| $J^{PC}$ | $\gamma\gamma$ Coupling |
|----------|------------------------|
| $0^{++}$ | Allowed (scalar) |
| $0^{-+}$ | Allowed (pseudoscalar) |
| $1^{++}$ | Forbidden (Landau-Yang) |
| $1^{-+}$ | Forbidden |
| $2^{++}$ | Allowed (tensor) |
| $2^{-+}$ | Allowed |

#### 2.4 Continuum and Exotics

**Born terms**: $\gamma\gamma \to q\bar{q}$ (QED)
- $R_{\gamma\gamma} = \sum_q e_q^4 / \sum_q e_q^2$

**High-mass continuum**: $\gamma\gamma \to$ jets (perturbative QCD)

**Exotic candidates**:
- $X(3872)$: $1^{++}$ — forbidden for $\gamma\gamma$ (consistent with data)
- $Z_c(3900)$: $1^{+-}$ — forbidden
- Tetraquark $c\bar{c}q\bar{q}$: $0^{++}, 2^{++}$ allowed

---

### 3. $\gamma\gamma$ at Colliders

#### 3.1 LEP ($\sqrt{s} = 90-209$ GeV)

- $e^+e^- \to e^+e^- \gamma\gamma \to e^+e^- X$
- $W_{\gamma\gamma} \sim 5-100$ GeV
- OPAL, L3, ALEPH, DELPHI
- $f_2(1270)$, $f_2'(1525)$, $\chi_{c0,2}$, $\eta_c$

#### 3.2 LHC Ultra-Peripheral Collisions (UPC)

- $pp \to p \gamma\gamma p \to p X p$
- $W_{\gamma\gamma}$ up to $1-2$ TeV
- ATLAS, CMS, ALICE, LHCb

**Key measurements**:
| Process | $\sqrt{s}$ | Result |
|---------|-----------|--------|
| $\gamma\gamma \to \ell^+\ell^-$ | 7, 8, 13 TeV | QED test, $m_{\ell\ell}$ spectra |
| $\gamma\gamma \to WW$ | 8, 13 TeV | $4.5\sigma$ (ATLAS) |
| $\gamma\gamma \to \gamma\gamma$ | 8, 13 TeV | Light-by-light (8.4$\sigma$) |
| $\gamma\gamma \to \ell\ell$ | 13 TeV | Anomalous couplings |
| $\gamma\gamma \to \tau\tau$ | 13 TeV | $g-2$ constraints |

#### 3.3 Future $\gamma\gamma$ Colliders

| Machine | $\sqrt{s_{\gamma\gamma}}$ | Luminosity | Status |
|---------|---------------------------|------------|--------|
| **ILC** | 250 GeV - 1 TeV | $10^{34}$ | Proposed |
| **CLIC** | 380 GeV - 3 TeV | $10^{34}$ | Proposed |
| **FCC-ee** | 240 GeV - 365 GeV | $10^{36}$ | Proposed |
| **$\gamma\gamma$ Higgs factory** | 125 GeV | $10^{34}$ | $\gamma\gamma \to H$ |

---

### 4. Light-by-Light Scattering at LHC

#### 4.1 ATLAS Measurement (2017, 2019, 2023)

$pp \to p \gamma\gamma p$ at 8, 13 TeV:
- 13 TeV, 480 pb$^{-1}$: 59 events, $13.2 \pm 2.6$ expected background
- Significance: $8.4\sigma$
- Fiducial cross section: $\sigma_{\text{fid}} = 78 \pm 13$ fb (SM: $73 \pm 7$ fb)

#### 4.2 CMS Measurement (2023)

13 TeV, 140 fb$^{-1}$:
- $\sigma_{\text{fid}} = 122 \pm 26$ fb (SM: $108 \pm 12$ fb)
- $4.1\sigma$ significance

#### 4.3 BSM Constraints from LbL

| Model | Parameter | Constraint |
|-------|-----------|------------|
| Axion-like $a$ | $m_a$, $f_a$ | $f_a > 10^4$ GeV for $m_a \sim 10$ GeV |
| Dark photon $A'$ | $\epsilon$ | $\epsilon < 10^{-3}$ for $m_{A'} \sim 1$ GeV |
| Scalar $S$ | $m_S$, $\lambda_{S\gamma\gamma}$ | $M_S > 500$ GeV |
| SUSY (light $\tilde{\chi}$) | $m_{\tilde{\chi}}$ | $> 300$ GeV |

---

### 5. $\gamma\gamma \to$ Hadrons at LHC

#### 5.1 Exclusive Hadron Production

| Final State | Process | Status |
|-------------|---------|--------|
| $\pi^+\pi^-$ | $\gamma\gamma \to \pi^+\pi^-$ | ATLAS, CMS |
| $K^+K^-$ | $\gamma\gamma \to K^+K^-$ | ATLAS |
| $p\bar{p}$ | $\gamma\gamma \to p\bar{p}$ | ALICE, CMS |
| $\Lambda\bar{\Lambda}$ | $\gamma\gamma \to \Lambda\bar{\Lambda}$ | ALICE |

#### 5.2 Charmonium Production

- $\gamma\gamma \to \eta_c, \chi_{c0}, \chi_{c2}$
- $\Gamma_{\gamma\gamma}$ measurements
- $\chi_{c2}$: $J^{PC}=2^{++}$ test

#### 5.3 BSM in $\gamma\gamma \to$ Hadrons

- $\gamma\gamma \to$ SUSY particles (light $\tilde{\chi}$)
- $\gamma\gamma \to$ dark sector ($A'A'$, $a a$)
- $\gamma\gamma \to$ mono-jet + MET (invisible)

---

### 6. $\gamma\gamma$ Physics at Future Colliders

#### 6.1 $\gamma\gamma$ Higgs Factory

$\gamma\gamma \to H$ at $\sqrt{s_{\gamma\gamma}} = 125$ GeV:
- $\Gamma(H \to \gamma\gamma) = 9.28 \pm 0.11$ keV
- $\sigma(\gamma\gamma \to H) \approx 0.2$ pb
- $\delta \Gamma_{\gamma\gamma}/\Gamma_{\gamma\gamma} \sim 2\%$ (vs 10% at LHC)

#### 6.2 $\gamma\gamma$ Top Factory

$\gamma\gamma \to t\bar{t}$ at $\sqrt{s_{\gamma\gamma}} > 350$ GeV:
- Top Yukawa coupling
- $CP$ violation in $t\bar{t}$

#### 6.3 $\gamma\gamma$ BSM Factory

- $\gamma\gamma \to$ dark matter pairs
- $\gamma\gamma \to$ axion-like particles
- $\gamma\gamma \to$ SUSY particles

---

### 7. One-Electron Universe: Photon-Photon as Worldline Self-Interaction

In the one-electron universe, $\gamma\gamma$ scattering = worldline self-interaction.

#### 7.1 $\gamma\gamma$ Scattering = Worldline Kink-Kink Interaction

Two photons = two kinks on the worldline.
Scattering = interaction between two kinks on the same worldline.

Euler-Heisenberg Lagrangian = worldline kink self-energy:
$$\mathcal{L}_{\text{EH}} \sim \int d\tau_1 d\tau_2 d\tau_3 d\tau_4 \, \delta(\tau_1-\tau_2) \delta(\tau_3-\tau_4) \cdots$$

#### 7.2 $\gamma\gamma \to$ Hadrons = Worldline Kink Creates QCD String

$\gamma\gamma \to q\bar{q}$ = worldline kink creates quark-antiquark pair.
The QCD string = worldline connecting $q$ and $\bar{q}$.

#### 7.3 $\gamma\gamma \to$ BSM = Worldline Kink in New Sector

New physics = new worldline sectors.
$\gamma\gamma \to$ BSM = worldline kink tunnels into new sector.

#### 7.4 LbL at LHC = Worldline in Extreme Fields

LHC UPC: $B \sim 10^{15}$ T.
Worldline in extreme EM field = modified kink dynamics.
LbL signal = worldline self-interaction in strong background.

---

### 8. References

1. **LbL Theory**: Euler & Heisenberg, *Z. Phys.* **98**, 714 (1936); Jikia, *Nucl. Phys. B* **405**, 23 (1993)
2. **$\gamma\gamma \to$ Hadrons**: Brodsky et al., *Phys. Rep.* **300**, 299 (1998); PDG 2024
3. **LEP $\gamma\gamma$**: OPAL, *Eur. Phys. J. C* **14**, 173 (2000); L3, *Phys. Lett. B* **536**, 111 (2002)
4. **LHC UPC**: ATLAS, *Phys. Rev. Lett.* **123**, 052001 (2019); CMS, *Phys. Rev. Lett.* **131**, 141801 (2023)
5. **$\gamma\gamma \to WW$**: ATLAS, *Phys. Rev. Lett.* **113**, 052001 (2014)
6. **LbL BSM**: Dedes et al., *Phys. Rev. D* **95**, 075011 (2017); Knapen et al., *Phys. Rev. D* **96**, 075015 (2017)
7. **One-Electron $\gamma\gamma$**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 5 — Next: BSM Photon Physics (Dark Photons, Axion-Photon, Millicharged Particles)*