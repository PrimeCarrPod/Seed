# Photon Physics — V5.0 Deep Dive Series
## Part 6 of N — BSM Photon Physics: Dark Photons, Axion-Photon Mixing, Millicharged Particles, and Hidden Sectors

---

### Abstract

This V5.0 installment explores Beyond Standard Model (BSM) physics accessible through the photon portal: dark photons ($A'$), axion-like particles (ALPs) with photon coupling, millicharged particles, hidden sector photons, and the photon as a gateway to dark sectors. We cover theoretical frameworks, experimental searches, and future prospects.

---

### 1. Dark Photons ($A'$)

#### 1.1 Kinetic Mixing Portal

The dark photon Lagrangian:
$$\mathcal{L} \supset -\frac{1}{4} F'_{\mu\nu} F'^{\mu\nu} + \frac{1}{2} m_{A'}^2 A'_\mu A'^\mu - \frac{\epsilon}{2} F_{\mu\nu} F'^{\mu\nu}$$

After diagonalization:
- $A'_\mu$ couples to SM EM current with strength $\epsilon e$
- $m_{A'}$ can be $< m_e$ (sub-eV to GeV)

#### 1.2 Production Mechanisms

| Process | Diagram | Cross Section |
|---------|---------|---------------|
| $e^+e^- \to \gamma A'$ | $s$-channel | $\sigma \sim \epsilon^2 \alpha^2 / s$ |
| $e^- N \to e^- N A'$ | $t$-channel | $\sigma \sim \epsilon^2 \alpha^3 / m_e^2$ |
| $p p \to p p A'$ | UPC | $\sigma \sim \epsilon^2 \alpha^3 / m_{A'}^2$ |
| $\pi^0 \to \gamma A'$ | Anomaly | $\Gamma \sim \epsilon^2 \Gamma(\pi^0 \to \gamma\gamma)$ |

#### 1.3 Decay Modes

| $m_{A'}$ Range | Dominant Decay | Lifetime $c\tau$ |
|----------------|----------------|------------------|
| $m_{A'} < 2m_e$ | $A' \to \nu\bar{\nu}$ (loop) | $\sim$ km |
| $2m_e < m_{A'} < 2m_\mu$ | $A' \to e^+e^-$ | $\sim 10^{-3}$ m ($\epsilon=10^{-3}$) |
| $2m_\mu < m_{A'} < 2m_\pi$ | $A' \to \mu^+\mu^-$ | $\sim$ m |
| $m_{A'} > 2m_\pi$ | $A' \to \pi^+\pi^-$ | $\sim$ mm |

#### 1.4 Experimental Constraints

| Experiment | Channel | Mass Range | $\epsilon$ Limit |
|------------|---------|------------|------------------|
| NA64 | $e^- N \to e^- N A'$ | $1-50$ MeV | $\epsilon < 10^{-4}$ |
| NA62 | $\pi^0 \to \gamma A'$ | $10-100$ MeV | $\epsilon < 10^{-5}$ |
| BaBar | $e^+e^- \to \gamma A'$ | $0.2-10$ GeV | $\epsilon < 10^{-3}$ |
| LHCb | $A' \to \mu^+\mu^-$ | $0.2-70$ GeV | $\epsilon < 10^{-4}$ |
| LHC (ATLAS/CMS) | $pp \to A' X$ | $10-500$ GeV | $\epsilon < 10^{-3}$ |
| SHiP (future) | $A' \to$ visible | $< 1$ GeV | $\epsilon \sim 10^{-7}$ |

#### 1.5 $(g-2)_\mu$ and Dark Photon

$$a_\mu^{A'} = \frac{\epsilon^2}{2\pi} \frac{m_\mu^2}{m_{A'}^2} \quad (m_{A'} \gg m_\mu)$$

For $m_{A'} \sim 10-100$ MeV, $\epsilon \sim 10^{-3}$ explains $\Delta a_\mu$.

**Tension**: NA64, BaBar exclude most parameter space.

---

### 2. Axion-Like Particles (ALPs) and Photon Coupling

#### 2.1 ALP-Photon Lagrangian

$$\mathcal{L}_{a\gamma\gamma} = \frac{a}{f_a} \frac{\alpha}{2\pi} \mathbf{E} \cdot \mathbf{B} = \frac{a}{4 f_a} F_{\mu\nu} \tilde{F}^{\mu\nu}$$

where $f_a$ = axion decay constant, $m_a \sim \Lambda_{\text{QCD}}^2 / f_a$.

#### 2.2 Photon-ALP Oscillations

In external $B$ field:
$$\gamma \leftrightarrow a \quad \text{probability} \quad P_{\gamma \to a} = \left( \frac{B L}{2 f_a} \right)^2 \sin^2 \left( \frac{\Delta m^2 L}{4\omega} \right)$$

#### 2.3 Production and Detection

| Process | Experiment | Sensitivity |
|---------|------------|-------------|
| $\gamma \to a$ in $B$ (helioscopes) | CAST, IAXO | $f_a > 10^{10}$ GeV |
| $a \to \gamma$ in $B$ (haloscopes) | ADMX, HAYSTAC | $f_a > 10^{12}$ GeV |
| $a \to \gamma\gamma$ (lab) | ALPS, OSQAR | $f_a > 10^8$ GeV |
| $K \to \pi a$ | NA62, KOTO | $f_a > 10^6$ GeV |
| $B \to K a$ | Belle II | $f_a > 10^5$ GeV |
| $a \to \gamma\gamma$ (astrophysical) | SN 1987A, HB stars | $f_a > 10^9$ GeV |

#### 2.4 ALP-Photon Coupling Models

| Model | $C_{a\gamma}$ | $f_a$ Scale |
|-------|---------------|-------------|
| KSVZ axion | $\sim -1.92$ | $10^9-10^{12}$ GeV |
| DFSZ axion | $\sim 0.75$ | $10^9-10^{12}$ GeV |
| ALP (generic) | $\mathcal{O}(1)$ | Any scale |
| String axion | $\mathcal{O}(1)$ | $10^{16}$ GeV |

---

### 3. Millicharged Particles

#### 3.1 Definition

Particles with electric charge $q = \epsilon e$ where $|\epsilon| \ll 1$.
Arise from kinetic mixing with dark $U(1)'$ or extra dimensions.

#### 3.2 Production

- $e^+e^- \to \gamma^* \to \chi\bar{\chi}$ (colliders)
- $p p \to \chi\bar{\chi}$ (LHC)
- $\gamma \to \chi\bar{\chi}$ (supernova, stars)
- $e^- \to e^- \chi\bar{\chi}$ (fixed target)

#### 3.3 Constraints

| Source | $\epsilon$ Limit | $m_\chi$ Range |
|--------|------------------|----------------|
| SLAC $e^-$ beam dump | $\epsilon < 10^{-4}$ | $< 10$ MeV |
| $g-2$ | $\epsilon < 10^{-3}$ | $< 100$ MeV |
| Supernova 1987A | $\epsilon < 10^{-9}$ | $< 100$ MeV |
| CMB | $\epsilon < 10^{-6}$ | $< 1$ MeV |
| LHC (monojet) | $\epsilon < 10^{-3}$ | $> 1$ GeV |
| XENON1T | $\epsilon < 10^{-11}$ | $1-10$ keV |

#### 3.4 XENON1T Excess (2020)

3.5$\sigma$ excess at $\sim 2.4$ keV.
Interpretation: solar axions or millicharged neutrinos?
Later data (XENONnT) disfavors.

---

### 4. Hidden Sector Photons and Dark $U(1)$

#### 4.1 Multiple Dark Photons

$$\mathcal{L} \supset -\frac{1}{4} \sum_i F^{(i)}_{\mu\nu} F^{(i)\mu\nu} + \frac{1}{2} \sum_{i,j} m_{ij}^2 A^{(i)}_\mu A^{(j)\mu} - \frac{1}{2} \sum_i \epsilon_i F_{\mu\nu} F^{(i)\mu\nu}$$

Multiple $A'_i$ with mass mixing.

#### 4.2 Secluded Dark Matter

Dark matter $\chi$ charged under $U(1)'$:
- $\chi \chi \to A' A'$ (annihilation)
- $A' \to$ SM via kinetic mixing
- Correct relic density for $m_\chi \sim 100$ MeV - 10 GeV

#### 4.3 Dark Higgs

$U(1)'$ broken by dark Higgs $\phi'$:
- $A'$ mass from $\langle \phi' \rangle$
- $\phi'$ decays to $A'$ or SM
- $h \to \phi' \phi'$ possible at LHC

---

### 5. Photon Portal to Dark Sectors

#### 5.1 Effective Operators

Dimension-5:
$$\mathcal{O}_5 = \frac{1}{\Lambda} F_{\mu\nu} \bar{\chi} \sigma^{\mu\nu} \chi \quad \text{(magnetic dipole)}$$

Dimension-6:
$$\mathcal{O}_6 = \frac{1}{\Lambda^2} F_{\mu\nu} F^{\mu\nu} \bar{\chi} \chi \quad \text{(scalar portal)}$$
$$\mathcal{O}_6' = \frac{1}{\Lambda^2} F_{\mu\nu} \tilde{F}^{\mu\nu} \bar{\chi} i\gamma_5 \chi \quad \text{(pseudoscalar)}$$

#### 5.2 Freeze-in Dark Matter

For $\epsilon \ll 1$, DM never thermalizes:
$$\Omega_\chi h^2 \approx 0.12 \left( \frac{\epsilon}{10^{-12}} \right)^2 \left( \frac{m_\chi}{10 \text{ keV}} \right)^2$$

Feebly interacting massive particles (FIMPs).

#### 5.3 Photon Portal at Colliders

| Process | Signature | Experiment |
|---------|-----------|------------|
| $e^+e^- \to \gamma + \text{invisible}$ | Mono-photon + MET | Belle II, ILC |
| $pp \to \gamma + \text{MET}$ | Mono-photon + MET | LHC |
| $e^- N \to e^- N + \text{invisible}$ | Missing energy | LDMX, SHiP |
| $\pi^0 \to \gamma + \text{invisible}$ | $BR(\pi^0 \to \gamma \chi\bar{\chi})$ | NA62 |

---

### 6. Photon in Early Universe and Cosmology

#### 6.1 Photon-Dark Sector Equilibrium

For $\epsilon > 10^{-7}$, $A'$ thermalizes in early universe.
BBN constraints: $\Delta N_{\text{eff}} < 0.3 \to \epsilon < 10^{-7}$ for $m_{A'} < 10$ MeV.

#### 6.2 Photon-Dark Sector Decoupling

If $A'$ never thermalizes (freeze-in):
- Relic abundance from photon fusion: $\gamma \gamma \to A' A'$
- $\Omega_{A'} h^2 \propto \epsilon^4 m_{A'}$

#### 6.3 Photon Cooling and CMB

- Photon-$A'$ mixing distorts CMB spectrum (COBE/FIRAS)
- $\mu$-distortion: $\mu \propto \epsilon^2$
- $\mu < 9 \times 10^{-5} \to \epsilon < 10^{-5}$ for $m_{A'} \sim 1$ eV

---

### 7. One-Electron Universe: BSM Photon as Worldline Portal

In the one-electron universe, BSM photon physics = worldline portals to new sectors.

#### 7.1 Dark Photon = Worldline Kink in New Sector

The dark photon $A'$ = kink in a new $U(1)'$ worldline sector.
Kinetic mixing $\epsilon$ = worldline coupling between EM and $U(1)'$ sectors.

#### 7.2 ALP = Worldline Winding in Pseudoscalar Sector

ALP $a$ = worldline winding in $U(1)_a$ fiber.
$a \gamma\gamma$ coupling = worldline anomaly between $U(1)_a$ and $U(1)_{\text{EM}}$.

#### 7.3 Millicharged Particles = Worldline with Fractional Winding

$\chi$ with $q = \epsilon e$ = worldline with fractional EM winding.
Fractional winding = worldline in a $U(1)'$ bundle with kinetic mixing.

#### 7.4 Hidden Sector = Disconnected Worldline Component

Hidden sector = worldline component not connected to EM sector.
Kinetic mixing = thin thread connecting components.

---

### 8. Future Experimental Landscape

| Experiment | Channel | Target Sensitivity | Timeline |
|------------|---------|-------------------|----------|
| **LDMX** | $e^- N \to e^- N A'$ | $\epsilon \sim 10^{-5}$ | 2026+ |
| **SHiP** | $A' \to$ visible | $\epsilon \sim 10^{-7}$ | 2030+ |
| **IAXO** | Solar axions | $f_a \sim 10^{11}$ GeV | 2028+ |
| **Belle II** | $B \to K a$, mono-$\gamma$ | $f_a \sim 10^6$ GeV | 2025+ |
| **FASER** | $A' \to e^+e^-$ | $\epsilon \sim 10^{-5}$ | 2022+ |
| **MATHUSLA** | Long-lived $A'$ | $\epsilon \sim 10^{-6}$ | 2030+ |
| **P2** (MESA) | $e^- p \to e^- p A'$ | $\epsilon \sim 10^{-5}$ | 2025+ |
| **MUonE** | $\mu e \to \mu e A'$ | $\epsilon \sim 10^{-4}$ | 2025+ |

---

### 9. References

1. **Dark Photon**: Holdom, *Phys. Lett. B* **166**, 196 (1986); Pospelov, *Phys. Rev. D* **80**, 095002 (2009)
2. **ALPs**: Sikivie, *Phys. Rev. Lett.* **51**, 1415 (1983); Jaeckel & Ringwald, *Annu. Rev. Nucl. Part. Sci.* **60**, 405 (2010)
3. **Millicharged**: Davidson et al., *Phys. Rev. D* **63**, 025007 (2000); Prinz et al., *Phys. Rev. Lett.* **81**, 1175 (1998)
4. **Kinetic Mixing**: Holdom, *Phys. Lett. B* **166**, 196 (1986); Dienes et al., *Nucl. Phys. B* **436**, 55 (1995)
5. **Experimental**: NA64, *Phys. Rev. Lett.* **123**, 071801 (2019); BaBar, *Phys. Rev. Lett.* **113**, 201801 (2014)
6. **Cosmology**: Pospelov & Ritz, *Phys. Rev. Lett.* **83**, 2228 (1999); Baker et al., *Phys. Rev. D* **104**, 075010 (2021)
7. **One-Electron BSM**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 6 — Next: Photon in Cosmology (CMB, Reionization, 21cm, Photon-Axion Conversion)*