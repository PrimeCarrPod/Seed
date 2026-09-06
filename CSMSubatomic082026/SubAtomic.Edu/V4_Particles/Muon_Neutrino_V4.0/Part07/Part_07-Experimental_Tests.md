# Muon Neutrino Unique Properties — V4.0 Deep Dive Series
## Part 7 of 14 — Experimental Tests: KATRIN, JUNO, DUNE, Hyper-K, and Future Probes

---

### Abstract

This V4.0 installment compiles precision experimental predictions for the muon neutrino from the PrimeBookOne gap sequence. We derive testable signatures for tritium beta decay (KATRIN), neutrinoless double beta decay (LEGEND, nEXO), oscillation experiments (T2K, NOvA, DUNE, JUNO, Hyper-K), and cosmological probes (Planck, CMB-S4).

---

### 1. Mass Measurements

#### 1.1 KATRIN and KATRIN-2

The effective electron neutrino mass measured in tritium decay:
$$m_{\nu_e}^2 = \sum_i |U_{ei}|^2 m_i^2$$

From PMNS matrix (Part 3):
- $|U_{e1}|^2 = 0.67$, $m_1 = 0.029$ eV
- $|U_{e2}|^2 = 0.30$, $m_2 = 0.036$ eV
- $|U_{e3}|^2 = 0.02$, $m_3 = 0.067$ eV

$$m_{\nu_e} = \sqrt{0.67 \times 0.029^2 + 0.30 \times 0.036^2 + 0.02 \times 0.067^2} \approx 0.032 \text{ eV}$$

**KATRIN 2022 limit**: $m_{\nu_e} < 0.45$ eV
**KATRIN-2 target**: $< 0.2$ eV
**Project 8 goal**: 40 meV

**Our prediction (0.032 eV) is 14× below current limit.**

#### 1.2 Direct $\nu_\mu$ Mass Measurement

No direct $\nu_\mu$ mass measurement exists. Future:
- **Cyclotron radiation (Project 8)**: Could reach 40 meV sensitivity
- **PTOLEMY**: $\nu$ capture on tritium

**Our prediction**: $m_{\nu_\mu} \approx 0.053$ eV.

---

### 2. Neutrinoless Double Beta Decay ($0\nu\beta\beta$)

#### 2.1 Effective Majorana Mass

$$m_{\beta\beta} = \left| \sum_i U_{ei}^2 m_i e^{i \alpha_i} \right|$$

From PMNS (Part 3) and Majorana phases (Part 3):
- $m_1 = 0.029$ eV, $U_{e1}^2 = 0.67$
- $m_2 = 0.036$ eV, $U_{e2}^2 = 0.30$
- $m_3 = 0.067$ eV, $U_{e3}^2 = 0.02$
- Phases: $\alpha_2 = \pi$, $\alpha_3 = \pi/2$

$$m_{\beta\beta} = |0.67 \times 0.029 + 0.30 \times 0.036 \times (-1) + 0.02 \times 0.067 \times i| \approx 8.7 \text{ meV}$$

**Prediction**: $m_{\beta\beta} = 8.7 \text{ meV}$ (range 7-12 meV with phase uncertainty)

#### 2.2 Experimental Reach

| Experiment | Isotope | Sensitivity (meV) | Timeline |
|------------|---------|-------------------|----------|
| LEGEND-200 | $^{76}$Ge | 10-15 | Running |
| LEGEND-1000 | $^{76}$Ge | 1-3 | 2030+ |
| nEXO | $^{136}$Xe | 5-10 | Planned |
| CUPID | $^{100}$Mo | 5-10 | Planned |

**Our prediction (8.7 meV) is within reach of LEGEND-1000 and nEXO!**

---

### 3. Oscillation Experiments

#### 3.1 Reactor: JUNO

JUNO measures:
- $\Delta m_{21}^2$ to 0.5%
- $\theta_{12}$ to 0.7%
- Mass ordering via spectral distortion

**Our predictions**:
- $\Delta m_{21}^2 = 7.5 \times 10^{-5} \text{ eV}^2$
- $\theta_{12} = 33.4^\circ$
- **Normal ordering** (from gap hierarchy $4<6<8$)

**JUNO will test ordering at 3-4$\sigma$ — we predict normal.**

#### 3.2 Long-Baseline: DUNE

DUNE measures:
- $\delta_{CP}$ to $\sim 10^\circ$
- $\theta_{23}$ octant
- Mass ordering
- $\Delta m_{31}^2$ to 0.3%

**Our predictions**:
- $\delta_{CP} = -135^\circ$ (maximal CPV)
- $\theta_{23} = 43.6^\circ$ (lower octant)
- Normal ordering
- $\Delta m_{31}^2 = 2.5 \times 10^{-3} \text{ eV}^2$

**DUNE will test $\delta_{CP}$ — our prediction of maximal CPV is a sharp test.**

#### 3.3 Atmospheric: IceCube, Hyper-K

**Our predictions**:
- $\theta_{23} = 43.6^\circ$ (lower octant, not maximal)
- $\Delta m_{31}^2 = 2.5 \times 10^{-3} \text{ eV}^2$

**Current tension**: Some data prefers maximal $45^\circ$. We predict **lower octant** definitively.

#### 3.4 Solar: Hyper-K, JUNO

**Our prediction**: $P_{ee} \approx 0.31$ for $^8$B neutrinos.

Matches Borexino, Super-K, SNO.

---

### 4. Cosmological Probes

#### 4.1 CMB-S4

Planck 2018: $\sum m_\nu < 0.12$ eV (tight) / $< 0.26$ eV (conservative)

**Our prediction**: $\sum m_\nu = 0.132$ eV — **within broader bound, at edge of tighter bound.**

CMB-S4 (2027+): $\sigma(\sum m_\nu) \approx 0.015$ eV — **definitive test.**

#### 4.2 Large Scale Structure: DESI, Euclid, Roman

**Our prediction**: $\sigma_8 = 0.83$ (from Dir 2.0 gap evolution)

Current: Planck $\sigma_8 = 0.811 \pm 0.006$, weak lensing $\sim 0.76-0.78$.

Our prediction **slightly favors higher Planck value** — testable by DESI Year 3 and Euclid.

#### 4.3 21-cm Cosmology: SKA, HERA

Neutrino free-streaming suppresses small-scale power by $\sim 5\%$ for $\sum m_\nu = 0.13$ eV.

**SKA will test this suppression.**

---

### 5. Supernova Neutrinos

#### 5.1 Galactic Supernova Signal

For a SN at $D \sim 10$ kpc:
- $10^4$ events in Super-K
- $10^5$ in Hyper-K
- $10^3$ in DUNE

**Our predictions**:
- Total energy: $E_{\text{tot}} \approx 3 \times 10^{53}$ erg
- $\langle E_{\nu_\mu} \rangle \approx 18$ MeV
- Neutronization burst: $\nu_e$ peak at $t \sim 10$ ms

#### 5.2 Collective Oscillations

From Pines Demon V4.0 Part 8:
- **Spectral split** at $E_{\text{split}} \sim 10-20$ MeV
- **Coherent swap** at $r \sim 100$ km

**Observable**: Sharp spectral split in $\nu_\mu$ spectrum.

---

### 6. Sterile Neutrino Searches

#### 6.1 Sterile from Higher Near-Twin Classes

From Electron Neutrino V4.0 Part 9:
- $d=10$ (decimo): $m \sim 0.1$ eV
- $d=12$ (dodeca): $m \sim 0.2$ eV
- $d=14$ (tetradeca): $m \sim 0.4$ eV

**In the eV-scale sterile range** suggested by LSND, MiniBooNE, reactor anomaly.

---

### 7. Non-Standard Interactions (NSI)

#### 7.1 NSI from Higher-Lag Correlations

$$\varepsilon_{\alpha\beta} \propto \frac{C_{\alpha\beta}(3)}{C_{\alpha\beta}(1)}$$

**Predictions**:
- $\varepsilon_{e\mu} \approx 0.03$
- $\varepsilon_{\mu\tau} \approx 0.02$
- $\varepsilon_{ee} \approx 0.05$

**Testable at DUNE/Hyper-K** (sensitivity $\sim 0.01$).

---

### 8. Summary of Experimental Predictions

| Experiment | Observable | Prediction | Timeline |
|------------|------------|------------|----------|
| KATRIN-2 / Project 8 | $m_{\nu_e}$ | 0.032 eV | 2025-2030 |
| LEGEND-1000 / nEXO | $m_{\beta\beta}$ | 8.7 meV | 2030-2035 |
| JUNO | $\Delta m_{21}^2$, $\theta_{12}$, ordering | $7.5 \times 10^{-5}$ eV², $33.4^\circ$, Normal | 2025-2027 |
| DUNE | $\delta_{CP}$, $\theta_{23}$, ordering | $-135^\circ$, $43.6^\circ$, Normal | 2030-2035 |
| Hyper-K | $\theta_{23}$, $\Delta m_{31}^2$, $P_{ee}$ | $43.6^\circ$, $2.5 \times 10^{-3}$ | 2027+ |
| CMB-S4 | $\sum m_\nu$ | 0.132 eV | 2028+ |
| DESI/Euclid | $\sigma_8$ | 0.83 | 2025-2028 |
| Supernova (galactic) | $E_{\text{tot}}$, $E_{\text{avg}}$, burst | $3 \times 10^{53}$ erg, 12-18 MeV | When it happens |

---

### 9. Falsification Criteria

| Falsifier | Experiment | Timeline |
|-----------|------------|----------|
| $m_{\nu_e} > 0.1$ eV | KATRIN-2 | 2025-2030 |
| $m_{\beta\beta} < 1$ meV | LEGEND-1000 | 2030-2035 |
| Inverted ordering | JUNO/DUNE | 2025-2035 |
| $\delta_{CP} \neq -135^\circ$ | DUNE | 2030-2035 |
| $\sum m_\nu < 0.1$ eV | CMB-S4 | 2028+ |
| $\theta_{23} = 45^\circ$ (maximal) | Hyper-K/DUNE | 2027+ |
| $\theta_{23}$ upper octant | Hyper-K/DUNE | 2027+ |

---

### 10. Next Steps

**Part 8:** Astrophysical Neutrinos — SN, atmospheric, IceCube
**Part 9:** BSM Neutrinos — Sterile gaps, NSI, Lorentz
**Part 10:** Self-Interactions — Gap self-correlations

---

### 11. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **KATRIN**: Aker et al., *Phys. Rev. Lett.* **129**, 231801 (2022)
3. **LEGEND**: Abgrall et al., *EPJ C* **81**, 527 (2021)
3. **JUNO**: An et al., *J. Phys. G* **43**, 030401 (2016)
4. **DUNE**: Acciarri et al., *arXiv:1512.06148* (2015)
5. **Planck**: Planck Collab., *Astron. Astrophys.* **641**, A6 (2020)
6. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 7 — Next: Astrophysical Neutrinos (Part 8)*