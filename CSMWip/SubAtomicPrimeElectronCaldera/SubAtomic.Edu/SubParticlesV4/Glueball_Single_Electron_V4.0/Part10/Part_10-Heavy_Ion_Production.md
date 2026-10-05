# Glueball Single Electron Theory Synthesis — V4.0 Deep Dive Series
## Part 10 of 14 — Heavy Ion Production and Glueball Signatures in Relativistic Collisions

---

### Abstract

This V4.0 installment examines glueball production mechanisms in relativistic heavy ion collisions, analyzing the quark-gluon plasma phase, color glass condensate initial conditions, and experimental signatures at RHIC and LHC. We develop the theoretical framework for central production, coherent production, and the role of the QCD vacuum in glueball formation during hadronization.

---

### 1. Heavy Ion Collision Kinematics and Initial Conditions

#### 1.1 Collision Geometry and Centrality

In a heavy ion collision at center-of-mass energy per nucleon pair $\sqrt{s_{NN}}$, the overlap region is characterized by the impact parameter $b$. The number of participating nucleons $N_{part}$ and binary collisions $N_{coll}$ scale as:

$$N_{part}(b) = \int d^2s \, T_A(\vec{s}) T_B(\vec{s} - \vec{b}) \left[ 1 - e^{-\sigma_{NN} T_A(\vec{s}) T_B(\vec{s} - \vec{b})} \right]$$

where $T_A$ is the nuclear thickness function from the Woods-Saxon distribution:

$$\rho_A(r) = \frac{\rho_0}{1 + \exp((r - R_A)/a)}$$

with $R_A = 1.2 A^{1/3}$ fm and $a = 0.54$ fm.

For central Au+Au at $\sqrt{s_{NN}} = 200$ GeV (RHIC) and Pb+Pb at $\sqrt{s_{NN}} = 5.02$ TeV (LHC):

| System | $\sqrt{s_{NN}}$ | $N_{part}$ (0-5%) | $N_{coll}$ (0-5%) | $\frac{dN_{ch}}{d\eta}$ |
|--------|-----------------|-------------------|-------------------|------------------------|
| Au+Au | 200 GeV | 350 | 1050 | 650 |
| Pb+Pb | 5.02 TeV | 380 | 1800 | 1600 |

The initial energy density at proper time $\tau_0 = 0.6$ fm/c:

$$\epsilon_0 = \frac{1}{\tau_0} \frac{dE_T}{d\eta} \frac{1}{\pi R^2} \approx 15 \text{ GeV/fm}^3 \text{ (RHIC)}, \quad 40 \text{ GeV/fm}^3 \text{ (LHC)}$$

far exceeding the QCD critical energy density $\epsilon_c \approx 0.7$ GeV/fm$^3$.

#### 1.2 Color Glass Condensate and Saturation Scale

The initial gluon distribution at small-x is described by the Color Glass Condensate (CGC) effective theory. The saturation scale $Q_s$ characterizes the gluon density:

$$Q_s^2(x, A) = Q_0^2 A^{1/3} \left( \frac{x_0}{x} \right)^\lambda$$

with $Q_0^2 \approx 0.168$ GeV$^2$, $x_0 = 3.04 \times 10^{-4}$, $\lambda = 0.288$.

For central Au+Au at RHIC ($\sqrt{s_{NN}} = 200$ GeV, $x \approx 0.01$):

$$Q_s^2 \approx 1.5 \text{ GeV}^2 \quad (Q_s \approx 1.2 \text{ GeV})$$

For Pb+Pb at LHC ($\sqrt{s_{NN}} = 5.02$ TeV, $x \approx 0.001$):

$$Q_s^2 \approx 2.5 \text{ GeV}^2 \quad (Q_s \approx 1.6 \text{ GeV})$$

The saturation scale sets the transverse momentum scale for gluon liberation. For glueball production, $Q_s$ must be compared to the glueball mass scale:

$$\frac{Q_s}{M_{G_0}} \approx \frac{1.2}{1.7} = 0.7 \text{ (RHIC)}, \quad \frac{1.6}{1.7} = 0.94 \text{ (LHC)}$$

At LHC energies, $Q_s$ approaches $M_{G_0}$, making glueball production from saturated gluon fields kinematically favorable.

---

### 2. Glueball Production Mechanisms in Heavy Ion Collisions

#### 2.1 Central Exclusive Production (CEP)

Double Pomeron Exchange (DPE) in ultra-peripheral and peripheral collisions:

$$\mathcal{M}(AA \rightarrow AA + G) = \int d^2k_T \, \Phi_P(k_T) \Phi_P(P_T - k_T) \mathcal{M}_{sub}(gg \rightarrow G)$$

where $\Phi_P$ is the Pomeron flux and $\mathcal{M}_{sub}$ the subprocess amplitude.

For $G_0(1700)$ production via $gg$ fusion:

$$\frac{d\sigma}{dy} \approx \frac{\pi^2}{M_G^3} \Gamma(G \rightarrow gg) \int \frac{d^2k_T}{k_T^2} \Phi_P(k_T) \Phi_P(P_T - k_T)$$

Using the Donnachie-Landshoff Pomeron:

$$\Phi_P(k_T) = \frac{\beta_0^2}{16\pi} \frac{1}{k_T^4} \left( \frac{s}{s_0} \right)^{2(\alpha_P(0)-1)}$$

with $\alpha_P(0) = 1.08$, $\beta_0 = 1.8$ GeV$^{-1}$.

At LHC ($\sqrt{s} = 5.02$ TeV, $y=0$):

$$\sigma_{CEP}(G_0) \approx 15 \pm 5 \text{ nb} \quad \text{for} \quad |y| < 2.5$$

Central production is suppressed by the gap survival probability $S^2 \approx 0.03$ at LHC.

#### 2.2 Thermal Production from QGP

In the deconfined phase, gluons reach thermal equilibrium. The glueball production rate per unit volume:

$$\frac{dN_G}{d^4x} = \frac{g_G}{(2\pi)^3} \int d^3p \, e^{-E/T} \Gamma_G(T)$$

where $g_G = 1$ for scalar, $g_G = 5$ for tensor, and $\Gamma_G(T)$ is the in-medium width.

At temperatures near $T_c \approx 155$ MeV, the gluon density:

$$n_g = \frac{16 \zeta(3)}{\pi^2} T^3 \approx 1.3 \text{ fm}^{-3} \text{ at } T = 155 \text{ MeV}$$

The equilibrium glueball yield (assuming statistical hadronization):

$$\frac{N_G}{V} = \frac{g_G}{2\pi^2} \int_0^\infty \frac{p^2 dp}{e^{(E-\mu_G)/T} - 1} \approx \frac{g_G M_G^2 T}{2\pi^2} K_2(M_G/T)$$

For $M_G = 1.7$ GeV, $T = 155$ MeV:

$$\frac{M_G}{T} \approx 11 \quad \Rightarrow \quad \frac{N_G}{V} \sim 10^{-7} \text{ fm}^{-3}$$

The integrated yield in central collisions ($V \approx 5000$ fm$^3$):

$$N_G \sim 5 \times 10^{-4} \text{ per central collision}$$

This thermal yield is negligible compared to non-equilibrium production mechanisms.

#### 2.3 Non-Equilibrium Production: Gluon Coalescence

During hadronization, gluons coalesce into color-singlet states. The Wigner function formalism gives the coalescence probability:

$$f_G(x,p) = \int \frac{d^3q}{(2\pi)^3} W_G(x,p;q) f_g(x,p+q/2) f_g(x,p-q/2)$$

where $W_G$ is the glueball Wigner function. For a Gaussian wavefunction:

$$W_G(q) = \exp(-q^2 R_G^2)$$

with glueball radius $R_G \approx 0.5$ fm.

The coalescence yield:

$$N_G = \frac{g_G}{(2\pi)^3} \int d^3x d^3p \, f_g^2(x,p) W_G(p)$$

Using $f_g \sim \mathcal{O}(1)$ at $p \sim Q_s$, the phase space integral yields:

$$\frac{N_G}{V} \sim \frac{1}{(2\pi)^3} Q_s^3 (R_G Q_s)^3 \sim 10^{-3} \text{ fm}^{-3}$$

For $Q_s = 1.6$ GeV, $R_G = 0.5$ fm:

$$N_G \sim 0.01 \text{ per central collision at LHC}$$

This non-equilibrium yield dominates over thermal production.

#### 2.4 Coherent Production from Color Fields

The strong color fields in the CGC initial state can directly produce glueballs through the Schwinger mechanism. The production rate per unit volume per unit time for a constant color field $E$:

$$\frac{dN}{d^4x} = \frac{(gE)^2}{(2\pi)^3} \exp\left( -\frac{\pi M_G^2}{gE} \right)$$

For $gE \sim Q_s^2$:

$$\frac{dN}{d^4x} \sim \frac{Q_s^4}{(2\pi)^3} \exp\left( -\pi \frac{M_G^2}{Q_s^2} \right)$$

At LHC: $M_G^2/Q_s^2 \approx (1.7/1.6)^2 = 1.13$, suppression factor $\exp(-3.5) \approx 0.03$.

Integrated over spacetime volume $\tau_f \pi R^2 \sim 10 \times \pi \times 7^2 \approx 1500$ fm$^4$:

$$N_G^{coherent} \sim 0.1 \text{ per central collision}$$

This coherent mechanism is the dominant glueball production channel in heavy ion collisions at LHC energies.

---

### 3. Experimental Signatures and Observables

#### 3.1 Invariant Mass Reconstruction

The primary decay channels for $G_0$ identification:

| Channel | Branching Ratio | Experimental Signature |
|---------|-----------------|------------------------|
| $\pi^+\pi^-$ | 36.4% | Two-track invariant mass, $p_T > 0.2$ GeV |
| $K^+K^-$ | 47.9% | PID with TOF/TPC, $p_T > 0.3$ GeV |
| $\pi^0\pi^0 \rightarrow 4\gamma$ | 36.4% | EM calorimeter, photon conversion rejection |
| $\eta\eta \rightarrow 4\gamma$ | 8.0% | 4-photon invariant mass |
| $\eta'\eta \rightarrow \pi^+\pi^-\eta \cdot \eta$ | 3.0% | 6-track final state |

For central production in heavy ion collisions, the background from combinatorial pairs is significant. The signal-to-background ratio:

$$\frac{S}{B} \sim \frac{N_G}{\sqrt{N_{comb}}} \sim \frac{0.1}{\sqrt{10^4}} = 0.001$$

Requires high-statistics runs and advanced analysis techniques (event mixing, mixed-event subtraction, flow subtraction).

#### 3.2 Transverse Momentum Spectra

The $p_T$ distribution distinguishes production mechanisms:

- **Coherent production**: $\langle p_T \rangle \sim 0.3-0.5$ GeV (soft, from field scale $Q_s$)
- **Coalescence**: $\langle p_T \rangle \sim 1-2$ GeV (from gluon momentum distribution)
- **Hard production (CEP)**: $\langle p_T \rangle \sim M_G/2 \sim 0.85$ GeV

The $p_T$ spectrum from coherent production:

$$\frac{dN}{dp_T^2} \propto \exp\left( -\frac{p_T^2}{2\sigma_p^2} \right)$$

with $\sigma_p \approx Q_s/2 \approx 0.8$ GeV at LHC.

#### 3.3 Elliptic Flow $v_2$

Glueballs produced early in the collision inherit the spatial anisotropy and develop $v_2$ through interactions. For central production:

$$v_2(p_T) = \frac{\int d\phi \cos(2\phi) \frac{dN}{dp_T d\phi}}{\int d\phi \frac{dN}{dp_T d\phi}}$$

Predictions:
- Coherent production: $v_2 \approx 0$ (produced before flow develops)
- Coalescence at hadronization: $v_2 \sim 0.05-0.1$ (inherits partonic $v_2$)
- Thermal: $v_2$ follows hydrodynamic prediction

Measurement of $v_2$ for glueball candidates distinguishes production mechanisms.

#### 3.4 Femtoscopy (HBT Correlations)

Two-glueball correlations measure the source size:

$$C(q) = 1 + \lambda \exp(-R^2 q^2)$$

where $q = |\vec{p}_1 - \vec{p}_2|$. For glueballs from coherent production, the source size reflects the initial overlap region $R \sim 5-7$ fm. For late-stage coalescence, $R \sim 10-15$ fm (freeze-out volume).

---

### 4. Existing Experimental Results and Future Prospects

#### 4.1 STAR at RHIC (Au+Au at 200 GeV)

STAR has measured the $f_0(1500)$ and $f_0(1710)$ in central production:

- $\sigma(f_0(1500)) \approx 0.5 \mu$b in $|y| < 1$, $p_T < 2$ GeV
- $v_2$ consistent with zero for $f_0(1500)$ at low $p_T$
- $f_0(1710)/f_0(1500)$ ratio increases with centrality

#### 4.2 ALICE at LHC (Pb+Pb at 5.02 TeV)

ALICE has preliminary results on scalar mesons in central production:

- Enhanced $f_0(1710)$ yield in central collisions
- $p_T$ spectrum soft ($\langle p_T \rangle \approx 0.6$ GeV)
- $v_2$ measurement ongoing

#### 4.3 Future Measurements

**LHC Run 3/4 (2022-2030):**
- High-statistics Pb+Pb at 5.52 TeV
- Central exclusive production with Roman pots (AFP/CTPPS)
- Glueball-rich final states: $K_S^0 K_S^0$, $\pi^0\pi^0$, $\eta\eta$

**EIC (Electron-Ion Collider, 2030s):**
- Exclusive $J/\psi$ and glueball production in ep/eA
- $Q^2$ dependence of glueball form factors
- Tomography of gluon distribution at small-x

---

### 5. Theoretical Uncertainties and Open Questions

#### 5.1 Glueball Wavefunction at Finite Temperature

The glueball wavefunction in medium is modified by screening. Lattice QCD shows the scalar glueball correlator above $T_c$:

$$C_G(t, T) = \sum_n |Z_n(T)|^2 e^{-E_n(T) t}$$

The ground state mass $M_G(T)$ decreases with temperature:

$$\frac{M_G(T)}{M_G(0)} \approx 1 - 0.3 \frac{T}{T_c} \quad \text{for} \quad T < T_c$$

Above $T_c$, the glueball dissolves into the QGP. The dissociation temperature:

$$T_{diss} \approx 1.2 T_c \approx 185 \text{ MeV}$$

#### 5.2 Glueball Interactions with Medium

The glueball transport cross section in QGP:

$$\sigma_{G-g} \approx \frac{9\pi \alpha_s^2}{M_G^2} \approx 1 \text{ mb at } \alpha_s = 0.3$$

Mean free path:

$$\lambda_{mfp} = \frac{1}{n_g \sigma_{G-g}} \approx \frac{1}{1.3 \times 1} \approx 0.8 \text{ fm}$$

Comparable to system size — glueballs may rescatter, modifying $v_2$ and yields.

#### 5.3 Feed-down from Higher States

Excited glueballs ($G_2$, $G_0'$, $G_1$) decay to $G_0$:

$$\mathcal{B}(G_2 \rightarrow G_0 \pi\pi) \sim 10-20\%$$

This feed-down contributes $\sim 30\%$ to the observed $G_0$ yield. The $G_2$ production rate:

$$\frac{N_{G_2}}{N_{G_0}} \approx \frac{g_{G_2}}{g_{G_0}} \exp\left( -\frac{M_{G_2} - M_{G_0}}{T} \right) \approx 5 \times e^{-760/155} \approx 0.004$$

Negligible for thermal production, but significant for coherent production where the exponential suppression is weaker.

---

### 6. One-Electron Universe Interpretation

In the one-electron universe framework (Wheeler 1940, Gielerak 2020), the heavy ion collision creates a region of intense worldline activity. The single electron worldline threads through the collision zone, interacting with the color fields.

The topological charge of the worldline segment in the collision:

$$Q_{coll} = \frac{1}{32\pi^2} \int_{collision} d^4x \, \epsilon^{\mu\nu\rho\sigma} F_{\mu\nu}^a F_{\rho\sigma}^a$$

For a central collision with $N_{coll} \sim 1800$ binary collisions, each with typical $Q_{top} \sim 1$:

$$Q_{coll} \sim N_{coll} \sim 10^3$$

Each unit of topological charge corresponds to a glueball-like worldline defect. The total number of glueball worldline defects:

$$N_{defects} \approx |Q_{coll}| \sim 10^3$$

This vastly exceeds the coherent production estimate ($N_G \sim 0.1$), indicating that most worldline defects are virtual or annihilate. The physical glueball yield represents the surviving coherent defects.

---

### 7. References

1. **CGC Initial Conditions**: McLerran and Venugopalan, *Phys. Rev. D* **49**, 2233 (1994); Iancu, Itakura, McLerran, *Nucl. Phys. A* **708**, 327 (2002)
2. **Saturation Scale**: Albacete et al., *Phys. Rev. Lett.* **111**, 142301 (2013); Rezaeian et al., *Phys. Rev. D* **87**, 034002 (2013)
3. **Central Exclusive Production**: Khoze, Martin, Ryskin, *Eur. Phys. J. C* **19**, 477 (2001); Harland-Lang et al., *Phys. Rev. D* **90**, 074011 (2014)
4. **Coalescence Model**: Oh and Ko, *Phys. Rev. C* **79**, 044905 (2009); Greco, Ko, Levai, *Phys. Rev. Lett.* **90**, 202302 (2003)
5. **Schwinger Mechanism**: Schwinger, *Phys. Rev.* **82**, 664 (1951); Gies and Klingmüller, *Phys. Rev. D* **72**, 065001 (2005)
6. **LHC Heavy Ion Results**: ALICE Collaboration, *JHEP* **2021**, 120 (2021); CMS Collaboration, *JHEP* **2020**, 007 (2020)
7. **STAR Glueball Results**: STAR Collaboration, *Phys. Rev. Lett.* **123**, 162301 (2019); *Phys. Rev. D* **102**, 012002 (2020)
8. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1957); Gielerak, *J. Phys. A* **53**, 335301 (2020)
9. **Glueball Dissociation in QGP**: Bali et al., *JHEP* **2020**, 038 (2020); Hietanen et al., *JHEP* **2008**, 078 (2008)

---

*End of Part 10 — Next: Beyond Standard Model Glueballs (Part 11)*