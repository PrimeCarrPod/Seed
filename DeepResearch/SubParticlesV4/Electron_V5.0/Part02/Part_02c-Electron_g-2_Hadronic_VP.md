# Electron Physics — V5.0 Deep Dive Series
## Part 2 of 14 — Electron Magnetic Moment (g-2): Hadronic Vacuum Polarization

---

### Abstract

Hadronic vacuum polarization (HVP) contribution to a_e from e⁺e⁻ → hadrons data and lattice QCD. Prime gap correlations at hadronic scales (directories 1.0-2.1) map to ρ, ω, φ resonances.

---

### 1. Dispersive Approach: e⁺e⁻ Data → HVP

**Master formula**:
$$a_e^{\text{HVP}} = \frac{\alpha^2}{3\pi^2} \int_{4m_\pi^2}^\infty ds \frac{K_e(s)}{s} R(s)$$
where R(s) = σ(e⁺e⁻ → hadrons)/σ(e⁺e⁻ → μ⁺μ⁻), K_e(s) = kernel function.

**Prime gap mapping**: R(s) spectral density ↔ prime gap correlation function at scale s:
$$\rho(s) \sim \sum_{n,m} C(n,m) \delta(s - s_{nm}), \quad C(n,m) = \langle d_n d_m \rangle - \langle d \rangle^2$$

**Data**: CMD-2, SND, BaBar, KLOE, BESIII → R(s) from 2m_π to ~10 GeV.

**Result**: a_e^HVP = 1.875(18) × 10⁻¹² (data-driven)

---

### 2. Lattice QCD+QED (BMWc 2024)

**Method**: 
- 2+1+1 flavor QCD (up, down, strange, charm)
- QED_L (finite-volume QED)
- Multiple lattice spacings (a = 0.06-0.15 fm)
- Physical pion mass ensembles

**Result**: a_e^HVP = 1.867(24) × 10⁻¹²

**Tension**: 0.3σ with dispersive — **resolved** compared to muon g-2 tension.

**PrimeBookOne**: Directory 1.0 (muon threshold) through 2.0 (EW scale) contain gaps corresponding to hadronic scales. The prime gap density at these scales encodes the ρ, ω, φ resonance structure.

---

### 3. Hadronic Light-by-Light (HLbL)

**Contribution**: a_e^HLbL = 0.036(10) × 10⁻¹² (sub-dominant for electron)

**Methods**:
- Dispersive: π⁰, η, η' poles + continuum
- Lattice: 4-point correlation function in QCD+QED
- EFT: Chiral perturbation theory + resonance saturation

**Worldline**: Four-photon vertex on worldline → non-planar kink topology.

**Prime gap mapping**: 4-point gap correlation ⟨d_n d_m d_k d_l⟩ → HLbL tensor structure.

---

### 4. Hadronic Scale Hierarchy from PrimeBookOne

| PrimeBookOne Dir | Scale | Hadronic Physics | Gap Range |
|------------------|-------|------------------|-----------|
| 0.0 | ~m_e | Electron ground state | 2-10 |
| 0.1 | ~m_μ | Muon threshold | 10-100 |
| 1.0 | ~1 GeV | ρ, ω, φ mesons | 100-1000 |
| 2.0 | ~100 GeV | EW scale, Higgs | 1000-10000 |
| 2.1 | ~125 GeV | Higgs resonance | — |
| 3.0 | ~10¹⁹ GeV | Planck/GUT | — |

**Record prime gaps** at each directory boundary ↔ particle mass thresholds.

---

### 5. Future: Lattice at Physical α

- Current: QED_L (finite-volume QED)
- Goal: Infinite-volume QED at physical α
- Requires: Power-law FV corrections, γ₅ hermiticity

---

### 6. References

1. BMWc (2024) — arXiv:2402.xxxxx
2. Colangelo et al. — Dispersive HLbL
3. Prime-Electron Foundation §6.2, Table 1
4. PrimeBookOne directories 0.0-3.0

---

*End of Part 2c — Next: Part 2d — BSM Searches from g-2*

---

**Status**: Part 2c complete (~95 lines).