# Photon Physics — V5.0 Deep Dive Series
## Part 3 of N — Precision QED Tests: Electron/Muon g-2, Fine Structure Constant, Lamb Shift, and Hadronic Contributions

---

### Abstract

This V5.0 installment covers the precision frontier of quantum electrodynamics: the electron and muon anomalous magnetic moments ($g-2$), the fine structure constant $\alpha$, the Lamb shift, and the critical hadronic vacuum polarization and light-by-light contributions. These measurements test QED to parts-per-billion precision and probe Beyond Standard Model physics through hadronic and potential new physics contributions.

---

### 1. Electron Anomalous Magnetic Moment $a_e$

#### 1.1 Definition and Significance

$$a_e = \frac{g_e - 2}{2} = \frac{1}{2} \left( \frac{g_e}{2} - 1 \right)$$

The electron $g$-factor is the most precisely measured quantity in physics:
- $g_e/2 = 1.00115965218073(28)$ (Harvard 2008)
- $a_e = 0.00115965218073(28)$ — relative precision $0.24$ ppb

#### 1.2 QED Contributions (5 Loops)

$$a_e^{\text{QED}} = \sum_{n=1}^5 C_n^{(e)} \left( \frac{\alpha}{\pi} \right)^n$$

| Loop | Coefficient $C_n^{(e)}$ | Value |
|------|------------------------|-------|
| 1 | $C_1 = \frac{1}{2}$ | 0.5 |
| 2 | $C_2 = \frac{197}{144} + \frac{\pi^2}{12} - \frac{\pi^2}{2} \ln 2 + \frac{3}{4} \zeta(3)$ | -0.328478... |
| 3 | $C_3$ (1996) | 1.181241... |
| 4 | $C_4$ (2012) | -1.9144(35) |
| 5 | $C_5$ (2015, 2019) | 7.68(38) |

Kinoshita, Nio, et al. (1990-2019): Analytical + numerical evaluation.

#### 1.3 Hadronic and Weak Contributions

| Contribution | Value ($\times 10^{-12}$) | Uncertainty |
|--------------|---------------------------|-------------|
| $a_e^{\text{had,VP}}$ | 1.875 | 0.018 |
| $a_e^{\text{had,LbL}}$ | 0.036 | 0.010 |
| $a_e^{\text{weak}}$ | 0.030 | 0.001 |

Hadronic VP from $e^+e^- \to$ hadrons + lattice (BMW 2024).

#### 1.4 Determination of $\alpha$ from $a_e$

Inverting the QED series:
$$\alpha^{-1}(a_e) = 137.035999084(21) \quad \text{(Harvard 2008, $\alpha$ from $a_e$)}$$

Most precise $\alpha$ determination (0.15 ppb).

---

### 2. Muon Anomalous Magnetic Moment $a_\mu$

#### 2.1 Experimental Status

**BNL E821 (2004)**:
$$a_\mu^{\text{exp}} = 116592089(63) \times 10^{-11} \quad (0.54 \text{ ppm})$$

**Fermilab E989 (Run 1, 2021)**:
$$a_\mu^{\text{exp}} = 116592040(54) \times 10^{-11} \quad (0.46 \text{ ppm})$$

**Combined (2023)**:
$$a_\mu^{\text{exp}} = 116592059(22) \times 10^{-11} \quad (0.19 \text{ ppm})$$

#### 2.2 SM Prediction (2023 White Paper)

| Contribution | Value ($\times 10^{-10}$) | Uncertainty |
|--------------|---------------------------|-------------|
| QED (5 loops) | 116584718.931 | 0.004 |
| Hadronic VP (LO) | 6931 | 40 |
| Hadronic VP (NLO) | -98.3 | 0.7 |
| Hadronic VP (NNLO) | 12.4 | 0.1 |
| Hadronic LbL | 92 | 18 |
| Weak (2 loops) | 153.6 | 1.0 |
| **Total SM** | **116591810** | **43** |

**Discrepancy**:
$$\Delta a_\mu = a_\mu^{\text{exp}} - a_\mu^{\text{SM}} = (251 \pm 59) \times 10^{-11} \quad (4.2\sigma)$$

#### 2.3 Hadronic Vacuum Polarization — The Core Tension

**$e^+e^-$ based** (KNT 2019, DHMZ 2019):
$$a_\mu^{\text{had,VP}} = 6931(40) \times 10^{-10}$$

**Lattice QCD** (BMW 2020, 2024):
$$a_\mu^{\text{had,VP}} = 7075(55) \times 10^{-10} \quad \text{(physical point, continuum)}$$

**Tension**: $2.6\sigma$ between $e^+e^-$ and lattice.

If lattice is correct, $\Delta a_\mu \approx (100 \pm 60) \times 10^{-11}$ ($1.7\sigma$).

#### 2.4 Hadronic Light-by-Light Scattering

$$a_\mu^{\text{had,LbL}} = 92(18) \times 10^{-10}$$

Dispersive approach (Colangelo et al. 2014-2020):
- $\pi^0, \eta, \eta'$ poles: $62.9(5.0)$
- $\pi\pi$ continuum: $17.2(2.5)$
- Scalars, tensors: $< 5$

Lattice (Mainz, RBC/UKQCD 2022): $106(15)$ — consistent.

---

### 3. Fine Structure Constant $\alpha$

#### 3.1 Independent Determinations

| Method | $\alpha^{-1}$ | Relative Uncertainty |
|--------|---------------|---------------------|
| $a_e$ (Harvard 2008) | 137.035999084(21) | 0.15 ppb |
| $a_e$ (Berkeley 2020, Cs) | 137.035999046(27) | 0.20 ppb |
| $a_e$ (Berkeley 2023, Rb) | 137.035999166(15) | 0.11 ppb |
| $h/m_{\text{Cs}}$ (Paris 2017) | 137.035999036(41) | 0.30 ppb |
| $h/m_{\text{Rb}}$ (Berkeley 2023) | 137.035999166(15) | 0.11 ppb |

#### 3.2 The $\alpha$ Tension

| Comparison | Difference | Significance |
|------------|------------|--------------|
| Cs vs Rb recoil | $120(31) \times 10^{-12}$ | $3.9\sigma$ |
| $a_e$ (Cs) vs $a_e$ (Rb) | $82(31) \times 10^{-12}$ | $2.6\sigma$ |
| $e^+e^-$ vs lattice $a_\mu^{\text{had}}$ | $\sim 2.6\sigma$ | — |

**Implications**: Systematic in recoil measurements? New physics in $\alpha$ running?

#### 3.3 $\alpha$ Running

$$\alpha(Q^2) = \frac{\alpha(0)}{1 - \Delta\alpha(Q^2)}$$

At $M_Z^2$:
$$\alpha(M_Z^2)^{-1} = 127.950(10) \quad \text{(from $e^+e^-$ data)}$$
$$\alpha(M_Z^2)^{-1} = 127.943(13) \quad \text{(from lattice + $a_e$)}$$

---

### 4. Lamb Shift and Proton Radius

#### 4.1 Muonic Hydrogen Lamb Shift

$$\Delta E_{\text{Lamb}} = E(2S_{1/2}) - E(2P_{1/2}) = 206.2949(32) \text{ meV}$$

**Proton charge radius** (CREMA 2010, 2013):
$$r_p = 0.84087(39) \text{ fm} \quad \text{(muonic H)}$$

**Electronic H spectroscopy** (CODATA 2018):
$$r_p = 0.8751(61) \text{ fm}$$

**Discrepancy**: $5.6\sigma$ ($4\%$ difference).

#### 4.2 Electronic Hydrogen 2S-2P (Paris 2022)

$$r_p = 0.833(10) \text{ fm} \quad \text{(closer to muonic)}$$

**Tension**: Resolving toward muonic value.

#### 4.3 Deuteron Radius

$$r_d = 2.12562(78) \text{ fm} \quad \text{(muonic D)}$$

Consistent with $r_p$ from muonic H.

---

### 5. Hadronic Contributions: Lattice vs Dispersive

#### 5.1 Vacuum Polarization

$$a_\mu^{\text{had,VP}} = \frac{\alpha^2}{3\pi^2} \int_{4m_\pi^2}^\infty ds \, \frac{K(s)}{s} \sigma(e^+e^- \to \text{hadrons})$$

Kernel $K(s) \sim 1/s$ at large $s$.

#### 5.2 Lattice Method

$$a_\mu^{\text{had,VP}} = 4\alpha^2 \int_0^\infty dQ^2 \, f(Q^2) \Pi(Q^2)$$

Time-momentum representation (TMR):
$$\Pi(Q^2) = \int_0^\infty dt \, t^2 G(t) j_0(Q t)$$

where $G(t)$ = vector current correlator.

BMW 2024: $N_f=2+1+1$, physical point, $a \approx 0.04$ fm, $L \approx 6$ fm.

#### 5.3 $e^+e^-$ Data Systematics

- $\pi\pi$ channel: $\sigma(e^+e^- \to \pi^+\pi^-)$ (KLOE, BaBar, BESIII)
- Radiative corrections
- Isospin breaking
- $K\bar{K}$ channel

---

### 6. BSM Sensitivity

#### 6.1 $a_\mu$ and New Physics

$$\Delta a_\mu \approx \frac{m_\mu^2}{M_{\text{NP}}^2} \times \text{coupling}^2$$

| Model | $M_{\text{NP}}$ for $\Delta a_\mu \sim 250 \times 10^{-11}$ |
|-------|-------------------------------------------------------------|
| SUSY (light smuon/neutralino) | $\sim 500$ GeV |
| Dark photon ($A'$) | $m_{A'} \sim 10-100$ MeV, $\epsilon \sim 10^{-3}$ |
| Leptoquark | $M_{\text{LQ}} \sim 1$ TeV |
| Z' ($L_\mu - L_\tau$) | $M_{Z'} \sim 100$ MeV, $g' \sim 10^{-3}$ |

#### 6.2 $a_e$ Constraints

$a_e$ agreement $\to$ strong constraints on BSM with $m_e/m_\mu$ suppression.

---

### 7. One-Electron Universe: Precision QED as Worldline Self-Interaction

In the one-electron universe, $g-2$ and $\alpha$ are worldline self-interaction effects.

#### 7.1 $g-2$ = Worldline Kink Self-Energy

The electron interacts with its own EM field:
$$a_e = \frac{1}{2m_e} \langle \mathcal{W} | \vec{\sigma} \cdot \vec{B}_{\text{self}} | \mathcal{W} \rangle$$

Loops = worldline kinks:
- 1-loop: one kink
- 2-loop: two kinks
- 5-loop: five kinks

#### 7.2 $\alpha$ = Worldline Coupling Strength

$$\alpha = \frac{e^2}{4\pi} = \text{worldline EM charge}^2$$

Running $\alpha(Q^2)$ = worldline screening/anti-screening by virtual pairs.

#### 7.3 Hadronic Contributions = Worldline QCD Dressing

Hadronic VP/LbL = worldline dressed by QCD strings:
- VP: worldline with quark loop insertion
- LbL: worldline with four-gluon insertion

Lattice $a_\mu^{\text{had}}$ = worldline path integral with QCD action.

#### 7.4 $\alpha$ Tension = Worldline Inconsistency?

Different $\alpha$ measurements = different worldline sectors.
Tension = inconsistency in worldline EM coupling across sectors.

---

### 8. References

1. **$a_e$**: Hanneke et al., *Phys. Rev. Lett.* **100**, 120801 (2008); Aoyama et al., *Phys. Rev. Lett.* **109**, 111807 (2012)
2. **$a_\mu$**: Muon $g-2$ Collab., *Phys. Rev. Lett.* **131**, 161802 (2023); BNL E821, *Phys. Rev. D* **73**, 072003 (2006)
3. **SM White Paper**: Aoyama et al., *Phys. Rept.* **887**, 1 (2020)
4. **Lattice $a_\mu^{\text{had}}$**: BMW, *Nature* **593**, 51 (2021); *Phys. Rev. Lett.* **130**, 152001 (2023)
4. **$e^+e^-$ had VP**: KNT, *Phys. Rev. D* **99**, 014014 (2019); DHMZ, *Eur. Phys. J. C* **79**, 849 (2019)
5. **Hadronic LbL**: Colangelo et al., *Phys. Lett. B* **738**, 6 (2014); *JHEP* **2020**, 006
6. **$\alpha$**: Parker et al., *Science* **360**, 191 (2018); Morel et al., *Nature* **588**, 61 (2020)
7. **Lamb shift**: Pohl et al., *Nature* **466**, 213 (2010); *Science* **353**, 669 (2016)
8. **One-Electron $g-2$**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 3 — Next: Photon Structure (GPDs, TMDs, EIC Tomography, Photon PDFs)*