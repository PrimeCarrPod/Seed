# Glueball Single Electron Theory Synthesis — V4.0 Deep Dive Series
## Part 11 of 14 — Beyond Standard Model Glueballs and Exotic Extensions

---

### Abstract

This V4.0 installment explores glueball physics beyond the Standard Model, examining exotic extensions including supersymmetric glueballs, extra-dimensional glueballs, dark sector glueballs, and axion-glueball mixing. We develop the theoretical framework for each scenario, compute experimental signatures, and assess discovery potential at current and future facilities.

---

### 1. Supersymmetric Glueballs (Gluino-Glueballs)

#### 1.1 MSSM Gluon-Gluino Sector

In the Minimal Supersymmetric Standard Model (MSSM), the gluon (g) acquires a fermionic superpartner — the gluino (g̃), a Majorana fermion in the adjoint representation of SU(3)_C. The gluino-gluon-glueball system introduces new bound states.

The relevant Lagrangian terms:

$$\mathcal{L} \supset -\frac{1}{4} F_{\mu\nu}^a F^{a\mu\nu} + \frac{1}{2} \bar{\tilde{g}}^a i \gamma^\mu D_\mu^{ab} \tilde{g}^b - \frac{1}{2} M_{\tilde{g}} \bar{\tilde{g}}^a \tilde{g}^a - \frac{g_s}{\sqrt{2}} f^{abc} \bar{\tilde{g}}^a \gamma^\mu \gamma^5 \tilde{g}^b A_\mu^c$$

The last term is the gluino-gluon-gluino vertex, enabling glueball-gluino mixing.

#### 1.2 Gluino-Glueball Mixing

The scalar glueball $G_0$ (0^++) mixes with the gluino-gluino bound state $\tilde{G}_0$ (scalar gluino pair). The mixing matrix:

$$\mathcal{M}^2 = \begin{pmatrix} M_{G_0}^2 & \delta^2 \\ \delta^2 & M_{\tilde{G}_0}^2 \end{pmatrix}$$

where the off-diagonal mixing $\delta^2$ arises from the gluino-gluon-gluino vertex. For $M_{\tilde{g}} \sim 2$ TeV (LHC limit):

$$\delta^2 \sim \frac{\alpha_s}{\pi} \frac{M_{G_0}^2 M_{\tilde{g}}}{M_{\tilde{g}}^2 - M_{G_0}^2} \Lambda_{QCD}^3 \sim (50 \text{ MeV})^2$$

The mixing angle:

$$\tan 2\theta \approx \frac{2\delta^2}{M_{\tilde{G}_0}^2 - M_{G_0}^2} \ll 1$$

Physical states remain predominantly pure, but the gluino-glueball acquires a small hadronic width.

#### 1.3 R-Hadron Glueball Hybrids

In split SUSY scenarios, long-lived gluinos form R-hadrons. The lightest R-hadron is a gluino-glueball hybrid:

$$|\tilde{G}_0\rangle \approx |\tilde{g}\tilde{g}\rangle_{0^{++}} + \epsilon |g\tilde{g}\tilde{g}\rangle$$

Mass prediction (lattice NRQCD):

$$M_{\tilde{G}_0} \approx 2M_{\tilde{g}} + E_{\text{bind}}$$

with $E_{\text{bind}} \approx -100$ MeV from gluino-gluino potential.

#### 1.4 Experimental Signatures

**LHC (13-14 TeV):**
- Displaced vertices from R-hadron decays: $c\tau \sim 1-100$ mm
- Metastable R-hadrons: TOF measurements in ATLAS/CMS
- Monojet + MET from gluino pair production

**Future Colliders:**
- FCC-hh (100 TeV): Gluino reach up to 15 TeV
- CLIC (3 TeV): Precision threshold scan of gluino pair production

#### 1.5 Constraints from LHC Run 2/3

ATLAS/CMS gluino searches (139 fb⁻¹ at 13 TeV):

| Channel | Limit on $M_{\tilde{g}}$ | Assumptions |
|---------|--------------------------|-------------|
| $\tilde{g}\tilde{g} \rightarrow q\bar{q}\tilde{\chi}_1^0$ | 2.2 TeV | Simplified model |
| $\tilde{g}\tilde{g} \rightarrow t\bar{t}\tilde{\chi}_1^0$ | 2.3 TeV | Third-generation |
| R-hadron TOF | 1.8 TeV | Stable gluino |
| Displaced vertices | 1.6 TeV | $c\tau = 10$ mm |

For $M_{\tilde{g}} > 2$ TeV, supersymmetric glueball effects on the SM glueball are $\mathcal{O}(10^{-3})$ — negligible for current glueball searches.

---

### 2. Extra-Dimensional Glueballs (Randall-Sundrum, ADD)

#### 2.1 Warped Extra Dimensions (RS1)

In the Randall-Sundrum model with metric:

$$ds^2 = e^{-2k|y|}\eta_{\mu\nu}dx^\mu dx^\nu + dy^2$$

The SM gauge fields can propagate in the bulk. The KK decomposition of the 5D gluon field:

$$A_\mu^a(x,y) = \frac{1}{\sqrt{\pi R}} \sum_{n=0}^\infty A_\mu^{a(n)}(x) \chi_n(y)$$

The zero mode $\chi_0(y) = \sqrt{k} e^{-k|y|}$ is the SM gluon. Excited modes $n \geq 1$ are massive KK gluons.

#### 2.2 KK Glueball Tower

The 5D pure Yang-Mills action produces a tower of 4D glueball states:

$$\mathcal{M}_n^2 = x_n^2 k^2 e^{-2k\pi R} + M_{G_0}^2$$

where $x_n$ are zeros of Bessel functions. For $kR \approx 11$, $k \sim M_{Pl}$:

$$\mathcal{M}_1 \approx 3-5 \text{ TeV}, \quad \mathcal{M}_2 \approx 6-8 \text{ TeV}, \quad \ldots$$

The lightest KK glueball has $J^{PC} = 0^{++}$ (same as SM $G_0$).

#### 2.3 Holographic Glueballs (AdS/CFT)

Via AdS/CFT, the RS1 model is dual to a 4D CFT with a cutoff. The glueball spectrum maps to:

$$M_n^2 \approx \frac{4\pi^2}{\ln^2(\Lambda_{UV}/\Lambda_{IR})} n^2 \Lambda_{IR}^2$$

where $\Lambda_{IR} \sim \text{TeV}$ is the IR scale. The spectrum is approximately linear (Regge trajectory):

$$M_n^2 \approx M_1^2 \cdot n^2$$

#### 2.4 ADD Large Extra Dimensions

For $n$ flat extra dimensions of size $R$:

$$M_{Pl}^2 = M_{D}^{n+2} R^n$$

KK gluon masses:

$$m_{KK} = \frac{|n|}{R} \quad n \in \mathbb{Z}^n$$

The KK glueball tower starts at $m_{KK} \sim 1/R$. For $M_D \sim 1$ TeV, $n=2$: $R \sim 1$ mm (excluded). For $n=6$: $R \sim 10^{-12}$ m.

#### 2.5 Experimental Signatures

**LHC:** KK gluon resonances in dijet, $t\bar{t}$, $gg$ channels. Current limits:
- $M_{KK} > 4.5$ TeV (RS1, $k/\bar{M}_{Pl}=0.1$)
- $M_{KK} > 6$ TeV (ADD, $n=6$)

**Future:** FCC-hh extends reach to $\sim 30$ TeV for KK modes.

---

### 3. Dark Sector Glueballs

#### 3.1 Hidden Valley Models

A hidden SU(N)_D gauge sector with confinement scale $\Lambda_D$:

$$\mathcal{L}_D = -\frac{1}{4} F_{\mu\nu}^{D,a} F^{D,a\mu\nu} + \sum_f \bar{\psi}_f (i\gamma^\mu D_\mu - m_f) \psi_f$$

Dark glueballs $G_D$ have masses $M_{G_D} \sim \Lambda_D$. Portal interactions:

$$\mathcal{L}_{\text{portal}} = \frac{\epsilon}{2} F_{\mu\nu}^Y F^{D,\mu\nu} + \frac{c_H}{\Lambda^2} |H|^2 F_{\mu\nu}^D F^{D,\mu\nu} + \frac{c_g}{\Lambda^3} G_{\mu\nu}^a G^{D,\mu\nu} G^a$$

#### 3.2 Glueball Portal Decays

For $\Lambda_D \sim \text{GeV}$, dark glueballs decay via kinetic mixing to SM particles:

$$\Gamma(G_D \rightarrow e^+e^-) \approx \frac{\epsilon^2 \alpha^2 M_{G_D}}{3\pi} \left(1 - \frac{4m_e^2}{M_{G_D}^2}\right)^{3/2}$$

With $\epsilon \sim 10^{-4}$, $M_{G_D} \sim 1$ GeV: $c\tau \sim 1$ m.

#### 3.3 Dark Shower Signatures

Dark gluon showers produce collimated "dark jets" at LHC:
- Emerging jets: tracks appearing at large displacement
- Semi-visible jets: MET + visible fraction from portal decays
- Dark shower shape variables distinguish from QCD

#### 3.4 Cosmological Constraints

Dark glueballs as dark matter candidates:
- Freeze-out: $\Omega_D h^2 \sim 0.12$ for $\Lambda_D \sim 100$ MeV - 1 GeV
- Self-interactions: $\sigma/m \sim 1$ cm²/g solves small-scale structure problems
- CMB constraints: $\sigma/m < 0.1$ cm²/g for $v \sim 1000$ km/s

---

### 4. Axion-Glueball Mixing

#### 4.1 QCD Axion and the Glueball

The QCD axion $a$ couples to the topological charge density:

$$\mathcal{L}_{aGG} = \frac{a}{f_a} \frac{g_s^2}{32\pi^2} G_{\mu\nu}^a \tilde{G}^{a\mu\nu}$$

where $f_a$ is the axion decay constant. The axion mass:

$$m_a \approx 5.7 \times 10^{-6} \text{ eV} \left( \frac{10^{12} \text{ GeV}}{f_a} \right)$$

The axion-glueball mixing is governed by the topological susceptibility:

$$\chi = \frac{\partial^2 \mathcal{E}(\theta)}{\partial \theta^2} \bigg|_{\theta=0} = \frac{f_\pi^2 m_\pi^2}{m_u + m_d} \approx (75 \text{ MeV})^4$$

#### 4.2 Axion-Glueball Mass Matrix

In the basis $(a, G_0)$, the mass matrix:

$$\mathcal{M}^2 = \begin{pmatrix} m_a^2 & m_a^2 \frac{f_\pi}{f_a} \\ m_a^2 \frac{f_\pi}{f_a} & M_{G_0}^2 \end{pmatrix}$$

For $f_a \gg f_\pi$, mixing angle:

$$\theta_{aG} \approx \frac{m_a^2 f_\pi}{M_{G_0}^2 f_a} \sim 10^{-14} \left( \frac{10^{12} \text{ GeV}}{f_a} \right)$$

Negligible for QCD axion.

#### 4.3 Axion-Like Particles (ALPs) and Glueballs

For ALPs with $m_a \sim \text{MeV-GeV}$ and $f_a \sim \text{TeV}$:

$$\theta_{aG} \sim 10^{-3} - 10^{-2}$$

This is phenomenologically interesting. The ALP inherits glueball decay channels:

$$\Gamma(a \rightarrow \pi\pi) \approx \theta_{aG}^2 \Gamma(G_0 \rightarrow \pi\pi)$$

#### 4.4 Experimental Searches

**Beam Dump (NA62, SHiP):** $a \rightarrow \pi\pi, \gamma\gamma$ with displaced vertices
**Fixed Target (SeaQuest, DarkQuest):** Prompt $a$ production in $pN$ collisions
**Meson Factories (BESIII, Belle II):** $J/\psi \rightarrow a \gamma$, $a \rightarrow \pi\pi$
**Future (FCC-ee, CEPC):** $Z \rightarrow a \gamma$, $h \rightarrow aa$

Current limits (ALP-glueball mixing):
- $f_a > 10^4$ GeV for $m_a \sim 1$ GeV (from $\pi\pi$ branching ratios)
- $f_a > 10^5$ GeV for $m_a \sim 100$ MeV (from beam dump)

---

### 5. Composite Glueballs in Technicolor/Composite Higgs

#### 5.1 Technicolor Glueballs

In walking technicolor with gauge group SU(N)_TC:

$$\Lambda_{TC} \sim 4\pi v / \sqrt{N} \approx 1 \text{ TeV}$$

Techniglueballs $G_{TC}$ have masses:

$$M_{G_{TC}} \sim \Lambda_{TC} \cdot \frac{M_{G_0}}{\Lambda_{QCD}} \approx 4-5 \text{ TeV}$$

#### 5.2 Composite Higgs Glueballs

In composite Higgs models (e.g., MCHM5, MCHM10), the Higgs is a pseudo-Nambu-Goldstone boson of a broken global symmetry. The confining sector has glueballs at:

$$M_{G_*} \sim g_* f \sim 1-3 \text{ TeV}$$

where $f \sim 800$ GeV is the compositeness scale and $g_* \sim 2-4$.

#### 5.3 Top Partner Glueball Hybrids

Top partners $T$ in composite Higgs mix with techni-glueballs:

$$|G_{TC}\rangle \sim |gg\rangle + \epsilon |T\bar{T}\rangle$$

Signatures: $pp \rightarrow G_{TC} \rightarrow t\bar{t}, h\bar{h}, WW$

---

### 6. String Theory Glueballs

#### 6.1 Open String Glueballs

In Type II string theory, open strings on D-branes give U(N) gauge theory. The mass spectrum:

$$M_n^2 = \frac{n}{\alpha'} + M_0^2 \quad n = 0, 1, 2, \ldots$$

with $\alpha'^{-1/2} = M_s$ (string scale). The leading Regge trajectory:

$$J = \alpha' M^2 + \alpha_0$$

For glueballs: $J = 0, 2, 4, \ldots$ (even spin).

#### 6.2 Closed String Glueballs (Gravitons)

Closed strings give gravity. The massive graviton tower:

$$M_n^2 = \frac{4n}{\alpha'}$$

#### 6.3 Holographic Glueballs from String Theory

In AdS_5 × S^5, glueballs correspond to supergravity modes:
- $0^{++}$: Dilaton mode, $M^2 = 12/L^2$
- $2^{++}$: Graviton KK mode, $M^2 = 24/L^2$
- $0^{-+}$: Axion mode, $M^2 = 16/L^2$

where $L$ is AdS radius. In terms of 't Hooft coupling $\lambda = g_{YM}^2 N$:

$$M_n \approx \frac{2\pi}{\sqrt{\lambda}} \Lambda_{QCD} \times c_n$$

with $c_n = \mathcal{O}(1)$.

---

### 7. Phenomenological Summary Table

| BSM Scenario | Glueball Mass Range | Key Signature | Current Reach | Future Reach |
|--------------|---------------------|---------------|---------------|--------------|
| MSSM Gluino-glueball | 2-15 TeV | Displaced vertices, R-hadrons | 2.3 TeV (gluino) | 15 TeV (FCC-hh) |
| RS1 KK Glueball | 3-30 TeV | Dijet resonance | 4.5 TeV | 30 TeV (FCC-hh) |
| ADD KK Glueball | $1/R$ | High-multiplicity | Model-dep. | Model-dep. |
| Dark Glueball | MeV-GeV | Emerging/semi-visible jets | $\sim$ GeV | SHiP, MATHUSLA |
| ALP-Glueball | MeV-GeV | Displaced $\pi\pi$, $\gamma\gamma$ | $f_a > 10^5$ GeV | FCC-ee, CEPC |
| Technicolor Glueball | 4-5 TeV | $t\bar{t}$, $hh$ resonance | $\sim$ TeV | FCC-hh |
| String Glueball | $M_s$ | Regge trajectory | $M_s >$ TeV | Model-dep. |

---

### 8. One-Electron Universe Perspective

In the one-electron universe (Wheeler 1940, Gielerak 2020), BSM glueballs correspond to worldline sectors with modified topology.

The worldline action in a BSM background:

$$S = \int d\tau \left[ \frac{1}{2} \dot{x}^2 + i \bar{\psi} \dot{\psi} + A_\mu(x) \dot{x}^\mu + \mathcal{L}_{\text{BSM}} \right]$$

The topological classification of worldline sectors:

$$\pi_1(\mathcal{M}_{\text{BSM}}) = \mathbb{Z} \oplus \pi_1(\mathcal{M}_{\text{SM}})$$

Each BSM extension adds new topological sectors. The single electron worldline traverses all sectors, with glueball states representing stable topological defects in each sector.

---

### 9. References

1. **SUSY Glueballs**: Farrar, *Phys. Rev. D* **51**, 3904 (1995); Csáki, *JHEP* **2005**, 027 (2005)
2. **RS1 KK Glueballs**: Csáki, Erlich, Hollowood, Terning, *Phys. Rev. D* **63**, 065019 (2001)
3. **AdS/CFT Glueballs**: Brower, Mathur, Tan, *Nucl. Phys. B* **574**, 219 (2000); Meyer, Teper, *Phys. Lett. B* **605**, 344 (2005)
4. **Dark Sector Glueballs**: Strassler, Zurek, *Phys. Lett. B* **651**, 374 (2007); Pierce, Thaler, *JHEP* **2017**, 016 (2017)
5. **ALP-Glueball Mixing**: Gaillard, Hall, *Phys. Lett. B* **688**, 388 (2010); Bauer, Neubert, Thamm, *JHEP* **2017**, 044 (2017)
6. **Technicolor/Composite**: Weinberg, *Phys. Rev. D* **13**, 974 (1976); Kaplan, *Nucl. Phys. B* **365**, 259 (1991)
7. **String Glueballs**: Polchinski, *String Theory* Vol. 1 (1998); Witten, *JHEP* **1998**, 006 (1998)
8. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1957); Gielerak, *J. Phys. A* **53**, 335301 (2020)
9. **Experimental**: ATLAS, *JHEP* **2021**, 120; CMS, *Phys. Rev. D* **105**, 072001 (2022); LHCb, *JHEP* **2020**, 007

---

*End of Part 11 — Next: QCD Vacuum and Topological Structure (Part 12)*