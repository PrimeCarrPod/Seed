# Photon Physics — V5.0 Deep Dive Series
## Part 9 of N — One-Electron Photon: Complete Worldline Classification, Kink Dynamics, and the Photon as Topological Defect

---

### Abstract

This V5.0 installment provides the complete topological classification of the photon within the one-electron universe framework. We develop the photon as a fundamental worldline kink — a topological defect in the electromagnetic field of the single electron worldline. Every photon process (emission, absorption, scattering, pair production, decay) is a worldline topological operation. This framework unifies all previous V5.0 parts into a single coherent ontology.

---

### 1. The One-Electron Universe Postulates (Recap)

From Pion/Kaon V4.0 Part 09, extended for photon physics:

**Postulate 1 (Worldline Monism)**: All particles are segments of a single worldline $\mathcal{W}: \mathbb{R} \to \mathcal{M}^{1,3}$.

**Postulate 2 (Gauge Dressing)**: The worldline couples to gauge fields, acquiring quantum numbers dynamically.

**Postulate 3 (Topological Quantization)**: Particle quantum numbers = topological invariants of worldline sectors.
- Electric charge = winding in $U(1)_{\text{EM}}$
- Photon = kink in $U(1)_{\text{EM}}$ connection

**Postulate 4 (Anomaly as Topology)**: Axial anomaly = obstruction to extending worldline to 5D.

**Postulate 5 (Photon as Kink)**: The photon is a fundamental topological defect — a kink in the EM field of the worldline.

---

### 2. Photon Topological Classification

#### 2.1 Classification Theorem

Every photon state corresponds to a worldline kink configuration characterized by:

$$\mathcal{T}_\gamma = (n_k, q, \vec{k}, \lambda, \tau, \mathcal{B})$$

where:
- $n_k \in \mathbb{Z}^+$ = kink number (photon number)
- $q = \pm 1$ = topological charge (photon/anti-photon = kink/anti-kink)
- $\vec{k} \in \mathbb{R}^3$ = momentum (kink propagation vector)
- $\lambda = \pm 1$ = helicity (kink twist)
- $\tau \in \mathbb{C}$ = complex proper-time period ($\tau = 1/\omega - i/\Gamma$ for resonances)
- $\mathcal{B} \in \{0,1\}$ = boundary condition (0=periodic, 1=antiperiodic)

#### 2.2 Photon State Table

| State | $n_k$ | $q$ | $\lambda$ | $\tau$ | Description |
|-------|-------|-----|-----------|--------|-------------|
| **Free photon** | 1 | +1 | ±1 | $1/\omega - i0^+$ | Stable kink |
| **Virtual photon** | 1 | +1 | ±1 | $1/\omega - i/\Gamma$ | Off-shell kink |
| **Bound photon** | 1 | +1 | ±1 | $1/\omega - i/\Gamma$ | In medium/plasma |
| **Two-photon** | 2 | +1 | ±1,±1 | product | LbL scattering |
| **Photon pair** | 2 | +1, -1 | ±1,±1 | product | $\gamma\gamma \to e^+e^-$ |

---

### 3. Worldline Kink Dynamics

#### 3.1 Kink Creation and Annihilation

**Emission**: Worldline bend creates kink.
$$\mathcal{W}: \tau \to x^\mu(\tau) \quad \text{bend at } \tau_0 \to \text{kink propagates}$$

**Absorption**: Kink meets worldline, straightens it.
$$\text{kink} + \mathcal{W} \to \mathcal{W}' \quad \text{(bent)}$$

**Annihilation**: Kink + anti-kink $\to$ vacuum.
$$\gamma + \gamma \to e^+e^- \quad \text{kink + anti-kink} \to \text{worldline pair}$$

#### 3.2 Kink Propagation

Free kink = solution of Maxwell's equations on worldline:
$$\partial_\mu F^{\mu\nu} = e \int d\tau \, \dot{x}^\nu(\tau) \delta^4(x - x(\tau))$$

Solution: $A^\mu(x) = e \int d\tau \, \dot{x}^\mu(\tau) \frac{1}{4\pi^2 (x-x(\tau))^2}$

Kink travels at $c$ with momentum $\vec{k}$ and helicity $\lambda$.

#### 3.3 Kink Self-Interaction

Photon-photon scattering = kink-kink interaction.
- Euler-Heisenberg = kink self-energy
- LbL = four-kink vertex

Worldline diagram:
```
    kink1 ────×──── kink1
              ×
    kink2 ────×──── kink2
```

---

### 4. Photon Processes as Worldline Operations

#### 4.1 Emission: $e^- \to e^- \gamma$

Worldline bends, emits kink:
```
worldline ────┐
              ├── kink (γ)
worldline ────┘
```

Energy-momentum conserved at vertex.

#### 4.2 Absorption: $e^- \gamma \to e^-$

Kink meets worldline, straightens it:
```
worldline ──┐
            ├── kink (γ)
worldline ──┘
```

#### 4.3 Compton Scattering: $e^- \gamma \to e^- \gamma$

Kink + worldline $\to$ kink + worldline:
```
in-kink ──┐          out-kink ──┐
          ├── worldline ────┘
          ├── worldline ────┘
```

#### 4.4 Pair Production: $\gamma \to e^+e^-$

Kink creates worldline pair:
```
kink ──┐
       ├── worldline (e⁻)
       ├── anti-worldline (e⁺)
```

Conservation: kink charge +1 $\to$ worldline (+1) + anti-worldline (-1) + net 0.

#### 4.5 Annihilation: $e^+e^- \to \gamma\gamma$

Worldline + anti-worldline $\to$ two kinks:
```
worldline ──┐          kink1 ──
            ├── ────── kink2 ──
anti-w.l. ──┘
```

#### 4.6 Light-by-Light Scattering: $\gamma\gamma \to \gamma\gamma$

Four-kink interaction:
```
kink1 ──×── kink1
        ×
kink2 ──×── kink2
```

Euler-Heisenberg = kink self-interaction kernel.

---

### 5. Photon in Media as Worldline Kink Dressing

#### 5.1 Thermal Medium = Periodic Worldline

At $T>0$, worldline is periodic in imaginary time:
$$\mathcal{W}: \tau \in [0, \beta], \quad \beta = 1/T$$

Thermal photon = kink on periodic worldline.
Matsubara frequencies $\omega_n = 2\pi n T$ = kink frequencies.

#### 5.2 Plasma = Worldline with Gap

Plasma frequency $\omega_{\text{pl}}$ = minimum kink energy.
$$m_\gamma = \omega_{\text{pl}} \neq 0$$

Worldline in plasma = worldline with periodic boundary conditions in space.
Gap = energy to create kink = plasmon mass.

#### 5.3 Magnetic Field = Worldline in External Background

External $B$ field = worldline coupling to background gauge field.
$$S_{\text{int}} = i e \int d\tau \, \dot{x}^\mu A_\mu^{\text{ext}}(x)$$

Landau levels = worldline orbits in $B$.
Photon birefringence = kink splitting in $B$.

---

### 6. Photon as Anomaly: Worldline in 5D

#### 6.1 Anomaly = Worldline Winding in 5D

WZW term = worldline winding number in 5D:
$$\Gamma_{\text{WZW}} \sim \int_{M^5} \text{Tr}[(U^{-1} dU)^5]$$

Photon = gauge field on 4D boundary.
Anomaly = worldline obstruction to extending to 5D.

#### 6.2 $\pi^0 \to \gamma\gamma$ = Worldline Folding

From Pion/Kaon V4.0 Part 09:
- $\pi^0$ = fold in worldline
- $\pi^0 \to \gamma\gamma$ = fold emits two kinks
- Anomaly coefficient $N_c/3$ = number of color sheets

#### 6.3 Axion-Photon Conversion = Sector Hopping

$\gamma \leftrightarrow a$ = worldline kink hops to ALP sector.
Magnetic field = bridge between sectors.
Resonant conversion = worldline resonance.

---

### 7. Complete Photon Topological Dictionary

| Photon Concept | Worldline Description |
|----------------|----------------------|
| **Photon** | Kink in EM field of worldline |
| **Anti-photon** | Anti-kink (same, C-conjugate) |
| **Virtual photon** | Off-shell kink (complex $\tau$) |
| **Real photon** | On-shell kink (real $\tau$) |
| **Helicity** | Kink twist ($\pm 1$) |
| **Momentum** | Kink propagation vector |
| **Polarization** | Kink orientation in transverse plane |
| **Photon number** | Kink count |
| **Photon energy** | Inverse kink period ($1/T$) |
| **Photon mass** | Kink gap (medium) |
| **Emission** | Worldline bend creates kink |
| **Absorption** | Kink straightens worldline |
| **Compton** | Kink + worldline $\to$ kink + worldline |
| **Pair production** | Kink creates worldline pair |
| **Annihilation** | Worldline pair $\to$ kinks |
| **LbL scattering** | Four-kink interaction |
| **Thermal photon** | Kink on periodic worldline |
| **Plasmon** | Gapped kink |
| **Photon in $B$** | Kink in background gauge field |
| **Anomaly** | Worldline winding in 5D |
| **$\pi^0 \to \gamma\gamma$** | Fold emits two kinks |
| **Photon-ALP** | Kink sector hopping |
| **Photon structure** | Kink internal dynamics (GPDs/TMDs) |

---

### 8. Kink Dynamics Equations

#### 8.1 Worldline Action with Kinks

$$S[\mathcal{W}, \{k_i\}] = \int d\tau \left[ \frac{1}{2} \dot{x}^2 + i e A_\mu^{\text{ext}} \dot{x}^\mu \right] + \sum_i S_{\text{kink}}[k_i] + S_{\text{int}}[\mathcal{W}, \{k_i\}]$$

where $S_{\text{kink}}$ = free kink action, $S_{\text{int}}$ = kink-worldline interaction.

#### 8.2 Kink Partition Function

$$Z = \sum_{n=0}^\infty \frac{1}{n!} \int \prod_{i=1}^n \mathcal{D}k_i \, e^{i S[\mathcal{W}, \{k_i\}]}$$

Sum over all kink numbers = coherent state of photons.

#### 8.3 Photon Observables from Kink Correlators

$$\langle A_\mu(x) A_\nu(y) \rangle = \sum_{n} \frac{1}{n!} \int \mathcal{D}\mathcal{W} \mathcal{D}\{k\} \, k_\mu(x) k_\nu(y) e^{i S[\mathcal{W}, \{k\}]}$$

---

### 9. Unification: All Photon Physics from Worldline Kinks

| V5.0 Part | Physics | Worldline Kink Description |
|-----------|---------|---------------------------|
| 1: QED Precision | $g-2$, $\alpha$, radiative decays | Kink self-interactions (1-5 loops) |
| 2: QCD Media | Thermal photons, spectral function | Kinks on periodic worldline, gapped kinks |
| 3: $g-2$, $\alpha$ | Hadronic VP/LbL, $\alpha$ tension | Kink-dressing by QCD strings |
| 4: Photon Structure | GPDs, TMDs, EIC tomography | Kink internal dynamics, 3D kink profile |
| 5: $\gamma\gamma$ Physics | LbL, $\gamma\gamma \to$ hadrons | Kink-kink interaction, kink creates $q\bar{q}$ |
| 6: BSM Photon | Dark photon, ALP, millicharged | Kink in new sector, sector hopping |
| 7: Cosmology | CMB, 21cm, reionization, $\gamma \leftrightarrow a$ | Primordial kinks, spin-flip, sector hopping |
| 8: Non-Perturbative | Lattice QED+QED, photon mass, confinement | Discretized kinks, kink gap, kink in flux tube |
| 9: **This** | Complete classification | **Unified kink ontology** |

---

### 10. Testable Predictions from Kink Ontology

| # | Prediction | Kink Origin | Test |
|---|------------|-------------|------|
| 1 | Photon mass gap in plasma | Kink gap | Heavy-ion, lattice |
| 2 | Photon birefringence in $B$ | Kink splitting in $B$ | LHC UPC, NA64 |
| 3 | $\gamma\gamma$ cross section | 4-kink vertex | ATLAS/CMS LbL |
| 4 | Photon GPDs at EIC | Kink internal structure | EIC DVCS |
| 5 | Photon TMDs | Kink $k_\perp$ distribution | EIC SIDIS |
| 6 | $\pi^0 \to \gamma\gamma$ exact | Fold emits 2 kinks | PrimEx-II |
| 6 | $g-2$ hadronic VP | Kink dressed by QCD | Lattice BMW |
| 7 | $\gamma \leftrightarrow a$ | Kink sector hopping | IAXO, ALPS |
| 8 | Dark photon | Kink in new sector | LDMX, SHiP |
| 9 | 21cm absorption depth | Worldline spin-flip | EDGES, HERA |
| 10 | Photon mass in QGP | Kink gap in plasma | Lattice HotQCD |

---

### 11. References

1. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1957); Gielerak, *J. Phys. A* **53**, 335301 (2020); Strassler, *Nucl. Phys. B* **385**, 145 (1992)
2. **Worldline Formalism**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Schubert, *Phys. Rept.* **355**, 73 (2001)
3. **Photon as Kink**: Faddeev & Niemi, *Nature* **387**, 58 (1997); Faddeev, *Phys. Lett. B* **183**, 255 (1987)
4. **WZW/Anomaly**: Wess & Zumino, *Phys. Lett. B* **37**, 95 (1971); Witten, *Nucl. Phys. B* **223**, 422 (1983)
5. **Pion/Kaon V4.0 Parts 04, 09, 14** — Radiative decays, one-electron synthesis, final synthesis
6. **Photon V5.0 Parts 1-8** — All previous parts

---

*End of Part 9 — Next: Final Synthesis — Unified Photon Ontology, All Predictions, and Complete V5.0 Series Summary*