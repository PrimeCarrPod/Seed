# Pion-Kaon Chiral Dynamics — V4.0 Deep Dive Series
## Part 3 of N — Weak Decays, |V_us|, and CP Violation in the Kaon System

---

### Abstract

This V4.0 installment covers semileptonic and rare decays of pions and kaons, the determination of the CKM element |V_us| from $K_{\ell3}$ and $K_{\ell4}$ decays, and CP violation in the neutral kaon system including $\epsilon_K$, $\epsilon'/\epsilon$, and the $\Delta I = 1/2$ rule.

---

### 1. Semileptonic Decays: $K_{\ell3}$ and $\pi_{\ell3}$

#### 1.1 $K_{\ell3}$ Decays ($K \to \pi \ell \nu$)

The differential decay rate:

$$\frac{d\Gamma}{dq^2} = \frac{G_F^2 |V_{us}|^2}{192\pi^3 M_K^3} \lambda^{3/2}(M_K^2, M_\pi^2, q^2) \left(1 + \frac{m_\ell^2}{2q^2}\right) \left|f_+(q^2)\right|^2 \left(1 + \delta_{\text{EM}} + \delta_{\text{SU(2)}}\right)$$

where $\lambda(a,b,c) = a^2 + b^2 + c^2 - 2(ab+ac+bc)$.

#### 1.2 Vector Form Factor $f_+(q^2)$

Parameterizations:

- **Taylor**: $f_+(q^2) = f_+(0) \left[1 + \lambda_+' \frac{q^2}{M_\pi^2} + \frac{1}{2} \lambda_+'' \frac{q^4}{M_\pi^4} + \cdots\right]$
- **z-expansion**: $f_+(q^2) = \frac{1}{1 - q^2/M_{K^*}^2} \sum_{k=0}^{K_{\max}} a_k z^k$
- **Dispersive**: Omnès representation with $\pi K$ phase shifts

FLAG 2024 lattice + dispersive average:

$$f_+(0) = 0.9698 \pm 0.0017$$

Slope parameters (KTeV, NA48, ISTRA+):

$$\lambda_+' = (24.9 \pm 0.4) \times 10^{-3}, \quad \lambda_+'' = (1.7 \pm 0.2) \times 10^{-3}$$

#### 1.3 Scalar Form Factor $f_0(q^2)$

$$f_0(q^2) = f_+(0) \left[1 + \lambda_0 \frac{q^2}{M_\pi^2} + \cdots\right]$$

Callan-Treiman relation at $q^2 = M_K^2 - M_\pi^2$:

$$f_0(M_K^2 - M_\pi^2) = \frac{F_K}{F_\pi} + \Delta_{\text{CT}}$$

with $\Delta_{\text{CT}} = (-3.5 \pm 0.8) \times 10^{-3}$ (NNLO ChPT).

#### 1.4 $\pi_{\ell3}$ Decays ($\pi \to e \nu$)

$$\Gamma(\pi \to e \nu) = \frac{G_F^2 |V_{ud}|^2}{8\pi} F_\pi^2 m_e^2 M_\pi \left(1 - \frac{m_e^2}{M_\pi^2}\right)^2 (1 + \delta_{\text{EM}}^\pi)$$

Provides $|V_{ud}|$ cross-check. PDG 2024:

$$\Gamma(\pi \to e \nu) = (1.2327 \pm 0.0023) \times 10^4 \text{ s}^{-1}$$

---

### 2. $K_{\ell4}$ Decays and $\pi\pi$ Scattering

#### 2.1 $K \to \pi\pi \ell \nu$ Form Factors

Eight form factors: $F, G, H, R$ for $S$- and $P$-waves. S-wave projection:

$$F^S(s) = f_+(0) \left[1 + \frac{s}{M_\pi^2} \left(\frac{F_S'}{f_+(0)}\right) + \cdots\right]$$

#### 2.2 NA48/2 and E865 Measurements

NA48/2 (1.1M $K^\pm \to \pi^+\pi^- e^\pm \nu$):

$$\frac{F_S'}{f_+(0)} = 0.152 \pm 0.007 \pm 0.005, \quad \frac{G_P'}{f_+(0)} = 0.086 \pm 0.006 \pm 0.004$$

Combined with Roy equations $\to$ precise $a_0^0, a_0^2$.

---

### 3. Determination of |V_us|

#### 3.1 From $K_{\ell3}$

$$|V_{us}| = \frac{1}{f_+(0)} \sqrt{\frac{\Gamma(K_{\ell3}) \cdot 192\pi^3 M_K^3}{G_F^2 \lambda^{3/2} (1 + \delta_{\text{EM}} + \delta_{\text{SU(2)}})}}$$

FLAG 2024 input:

| Quantity | Value |
|----------|-------|
| $f_+(0)$ | $0.9698 \pm 0.0017$ |
| $\Gamma(K_{e3})$ | $(7.51 \pm 0.03) \times 10^6 \text{ s}^{-1}$ |
| $\Gamma(K_{\mu3})$ | $(5.13 \pm 0.02) \times 10^6 \text{ s}^{-1}$ |

Result:

$$|V_{us}|_{K_{\ell3}} = 0.22333 \pm 0.00044$$

#### 3.2 From $K_{\ell2}$ ($\Gamma(K \to \mu\nu) / \Gamma(\pi \to \mu\nu)$)

$$\frac{\Gamma(K_{\mu2})}{\Gamma(\pi_{\mu2})} = \frac{|V_{us}|^2}{|V_{ud}|^2} \frac{F_K^2}{F_\pi^2} \frac{M_K (1 - m_\mu^2/M_K^2)^2}{M_\pi (1 - m_\mu^2/M_\pi^2)^2} (1 + \delta_{\text{EM}}^{K/\pi})$$

FLAG 2024: $F_K/F_\pi = 1.1932 \pm 0.0019$

Result:

$$|V_{us}|_{K_{\ell2}} = 0.2252 \pm 0.0005$$

#### 3.3 From Hyperon Decays

$$\Lambda \to p e \nu, \quad \Sigma^- \to n e \nu, \quad \Xi^- \to \Lambda e \nu$$

Combined (PDG 2024):

$$|V_{us}|_{\text{hyperon}} = 0.2250 \pm 0.0027$$

#### 3.4 CKM Unitarity Test

$$|V_{ud}|^2 + |V_{us}|^2 + |V_{ub}|^2 = 1$$

$|V_{ud}| = 0.97370 \pm 0.00014$ (superallowed $0^+ \to 0^+$)

$$|V_{ud}|^2 + |V_{us}|^2 + |V_{ub}|^2 = 0.9999 \pm 0.0005$$

Tension at $\sim 2\sigma$ with unitarity (the "Cabibbo angle anomaly").

---

### 4. Rare Kaon Decays

#### 4.1 $K^+ \to \pi^+ \nu\bar{\nu}$

SM prediction (NNLO QCD + NLO EW):

$$\text{BR}(K^+ \to \pi^+ \nu\bar{\nu})_{\text{SM}} = (8.60 \pm 0.42) \times 10^{-11}$$

NA62 2024 measurement (Run 1+2):

$$\text{BR}(K^+ \to \pi^+ \nu\bar{\nu})_{\text{exp}} = (12.6 \pm 2.7) \times 10^{-11}$$

$2.3\sigma$ above SM — possible BSM signal.

#### 4.2 $K_L \to \pi^0 \nu\bar{\nu}$

SM prediction:

$$\text{BR}(K_L \to \pi^0 \nu\bar{\nu})_{\text{SM}} = (3.00 \pm 0.30) \times 10^{-11}$$

KOTO 2024 limit: $< 4.9 \times 10^{-9}$ (90% CL). J-PARC E70 aims for SM sensitivity.

#### 4.3 $K \to \pi \ell^+\ell^-$

$K^+ \to \pi^+ e^+e^-$: BR = $(3.00 \pm 0.09) \times 10^{-7}$ (NA48/2)

$K_L \to \pi^0 e^+e^-$: CP-violating, BR $\sim 3 \times 10^{-11}$ (SM)

$K_L \to \pi^0 \mu^+\mu^-$: BR $< 3.8 \times 10^{-11}$ (KTeV)

---

### 5. CP Violation in Neutral Kaons

#### 5.1 $K^0$-$\bar{K}^0$ Mixing

Mass eigenstates:

$$|K_S\rangle = \frac{1}{\sqrt{1+|\epsilon|^2}} (|K_1\rangle + \epsilon |K_2\rangle)$$
$$|K_L\rangle = \frac{1}{\sqrt{1+|\epsilon|^2}} (|K_2\rangle + \epsilon |K_1\rangle)$$

where $|K_{1,2}\rangle$ are CP eigenstates ($CP|K_1\rangle = +|K_1\rangle$, $CP|K_2\rangle = -|K_2\rangle$).

#### 5.2 Indirect CP Violation: $\epsilon_K$

$$\epsilon_K = \frac{\langle K_2 | H_W | K_1 \rangle}{M_{K_L} - M_{K_S} + i(\Gamma_S - \Gamma_L)/2}$$

SM prediction (RBC+UKQCD 2022 lattice + CKMfitter 2024):

$$\text{Re}(\epsilon_K) = (1.81 \pm 0.18) \times 10^{-3}$$

Experimental:

$$\text{Re}(\epsilon_K)_{\text{exp}} = (2.228 \pm 0.011) \times 10^{-3}$$

$2.5\sigma$ tension — possible new CP-violating phase.

#### 5.3 Direct CP Violation: $\epsilon'/\epsilon$

$$\frac{\epsilon'}{\epsilon} = \frac{i}{\sqrt{2}} \frac{\text{Im} A_2}{\text{Re} A_2} \left(1 - \frac{\text{Im} A_0}{\text{Re} A_0} \frac{\text{Re} A_2}{\text{Im} A_2}\right)$$

$A_0, A_2$ are $\Delta I = 1/2, 3/2$ amplitudes for $K \to \pi\pi$.

RBC+UKQCD 2022 (physical $m_\pi$):

$$\text{Re}(\epsilon'/\epsilon) = (1.38 \pm 5.15 \pm 4.59) \times 10^{-4}$$

Experimental (NA48, KTeV):

$$\text{Re}(\epsilon'/\epsilon)_{\text{exp}} = (1.66 \pm 0.23) \times 10^{-3}$$

Consistent but large theory uncertainty. $\Delta I = 1/2$ enhancement remains a key challenge.

#### 5.4 The $\Delta I = 1/2$ Rule

$$\frac{A_0}{A_2} \approx 22.5$$

Lattice QCD (RBC+UKQCD 2021, $m_\pi = 140$ MeV):

$$\text{Re} A_0 = (3.3 \pm 0.5) \times 10^{-7} \text{ GeV}, \quad \text{Re} A_2 = (1.5 \pm 0.1) \times 10^{-8} \text{ GeV}$$

Emerges from QCD penguin operators and final-state interactions. Not fully understood analytically.

---

### 6. $\pi^0$ and $\eta$ Rare Decays

#### 6.1 $\pi^0 \to e^+e^-$

BR$_{\text{SM}} = (6.23 \pm 0.09) \times 10^{-8}$ (ChPT + dispersive)

Experimental (NA62): $(6.44 \pm 0.25 \pm 0.22) \times 10^{-8}$ — consistent.

#### 6.2 $\eta \to \mu^+\mu^-$, $\eta \to e^+e^-$

Test of chiral anomaly and possible dark photon.

#### 6.3 $\pi^0 \to \gamma A'$ (Dark Photon)

NA62, NA64 limits on $A'$ mixing $\epsilon < 10^{-4}$ for $m_{A'} \sim 10-100$ MeV.

---

### 7. One-Electron Universe: Weak Decays as Worldline Branchings

In the one-electron universe, weak decays correspond to worldline topology changes where the single electron worldline:

1. **Emits a $W$ boson** → worldline splits into quark + lepton branches
2. **Changes flavor** → worldline winding in flavor space changes
3. **CP violation** → worldline acquires a complex phase under time reversal

#### 7.1 $K^0$-$\bar{K}^0$ Oscillation as Worldline Periodicity

The oscillation $K^0 \leftrightarrow \bar{K}^0$ corresponds to a worldline orbit with period:

$$T_{\text{osc}} = \frac{2\pi}{\Delta m_K} = 1.19 \times 10^{-9} \text{ s}$$

The CP-violating parameter $\epsilon_K$ is a Berry phase accumulated over one oscillation period:

$$\epsilon_K \sim \exp\left(i \oint A_{\text{flavor}} \cdot d\tau\right)$$

#### 7.2 Rare Decays as Worldline Tunneling

$K^+ \to \pi^+ \nu\bar{\nu}$: worldline tunnels through a flavor-changing neutral current (FCNC) barrier — suppressed by GIM mechanism in SM, enhanced in BSM.

The $2.3\sigma$ tension in NA62 may indicate a new worldline sector with modified topology.

---

### 8. References

1. **$K_{\ell3}$ Form Factors**: Bijnens & Talavera, *Nucl. Phys. B* **669**, 341 (2003); FLAG 2024
2. **$K_{\ell4}$**: NA48/2, *Eur. Phys. J. C* **70**, 635 (2010); E865, *Phys. Rev. Lett.* **87**, 081801 (2001)
3. **|V_us|**: Flavour Lattice Averaging Group, *Eur. Phys. J. C* **84**, 1 (2024); PDG 2024
4. **Rare Kaon Decays**: NA62, *Phys. Lett. B* **830**, 137172 (2022); KOTO, *Phys. Rev. Lett.* **126**, 121801 (2021)
5. **$\epsilon_K$**: RBC+UKQCD, *Phys. Rev. D* **105**, 074512 (2022); CKMfitter 2024
6. **$\epsilon'/\epsilon$**: RBC+UKQCD, *Phys. Rev. Lett.* **129**, 112001 (2022)
7. **$\Delta I = 1/2$**: RBC+UKQCD, *Phys. Rev. D* **104**, 074510 (2021)
8. **One-Electron Weak**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Dunne & Schubert, *Phys. Rev. D* **72**, 105004 (2005)

---

*End of Part 3 — Next: Chiral Lagrangian with External Sources, Radiative Decays ($\pi^0 \to \gamma\gamma$, $K \to \pi\gamma\gamma$), and Anomalies*