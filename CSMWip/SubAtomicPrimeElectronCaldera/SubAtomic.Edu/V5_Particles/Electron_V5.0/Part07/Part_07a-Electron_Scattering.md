# Electron Physics — V5.0 Deep Dive Series
## Part 7 of 14 — Electron Scattering & Form Factors: Møller, Bhabha, Parity Violation

---

### Abstract

Electron scattering as precision probe. Møller (e⁻e⁻), Bhabha (e⁻e⁺), parity-violating Møller (P2, MOLLER). Form factors F₁(q²), F₂(q²). Worldline interaction vertices.

---

### 1. Møller Scattering (e⁻e⁻ → e⁻e⁻)

**t-channel**: Photon exchange (dominant)
**u-channel**: Photon exchange (identical fermions)
**s-channel**: Z exchange (parity violation)

**Cross section**: dσ/dΩ = (α²/4E²) [1/sin⁴(θ/2) + 1/cos⁴(θ/2) - 1/(sin²(θ/2)cos²(θ/2))] + Z interference

**Precision**: MOLLER (JLab) — measure A_PV = (σ_R - σ_L)/(σ_R + σ_L) to 0.7% → sin²θ_W at Q² = 0.0056 GeV²

---

### 2. Bhabha Scattering (e⁻e⁺ → e⁻e⁺)

**t-channel**: Photon exchange
**s-channel**: Photon + Z exchange

**Cross section**: dσ/dΩ = (α²/s) [ (u/s + s/u) + (2m²/t)² + ... ]

**LEP/SLC**: Luminosity monitor (small-angle Bhabha) → 0.1% precision
**Future**: FCC-ee, CEPC — Z-pole Bhabha for sin²θ_W

---

### 3. Parity-Violating Electron Scattering

**MOLLER (JLab 12 GeV)**: e⁻ + e⁻ → e⁻ + e⁻ at 11 GeV
- A_PV = (G_F Q²/4πα√2) [1 - 4sin²θ_W + ...]
- Precision: 0.7% on A_PV → 0.3% on sin²θ_W
- BSM reach: Λ ~ 10 TeV for contact interactions

**P2 (MESA Mainz)**: e⁻ + p → e⁻ + p at 155 MeV
- Measure weak charge of proton Q_W^p
- Precision: 1.5% → sin²θ_W at Q² = 0.0045 GeV²

**SoLID (JLab)**: PVDIS on deuterium — quark-level weak couplings

---

### 4. Form Factors F₁(q²), F₂(q²)

**F₁(q²)**: Dirac form factor — charge distribution
- F₁(0) = 1 (charge renormalization)
- Slope at q²=0 → charge radius

**F₂(q²)**: Pauli form factor — magnetic moment distribution
- F₂(0) = a_e = (g-2)/2

**Worldline**: q² = -Q² = momentum transfer. Form factors = Fourier transform of worldline current density.

---

### 5. Electron-Proton Scattering & Proton Radius

**Rosenbluth separation**: dσ/dΩ ∝ G_E² + τ G_M² (τ = Q²/4m_p²)
**Polarization transfer**: Ratio G_E/G_M directly

**Proton radius puzzle** (see Part 4): μp Lamb shift → r_p = 0.841 fm vs ep scattering → 0.877 fm

**PRad (JLab)**: Windowless H₂ target, low Q² → agrees with μp value

---

### 6. Worldline Picture: Scattering as Vertex

**Incoming worldline** + **outgoing worldline** = interaction vertex
**Momentum transfer q** = difference in worldline proper-time frequency
**Form factors** = worldline vertex function in external field

**Prime gap mapping**: q² scale ↔ prime gap scale in PrimeBookOne directories.

---

### 7. Future: High-Precision Scattering

| Experiment | Energy | Target | Precision Goal |
|------------|--------|--------|----------------|
| **MOLLER** | 11 GeV | e⁻ | sin²θ_W 0.3% |
| **P2** | 155 MeV | p | sin²θ_W 0.15% |
| **SoLID** | 11 GeV | D | d/u weak couplings |
| **FCC-ee** | 91 GeV | e⁺e⁻ | sin²θ_W 0.01% |
| **CEPC** | 91 GeV | e⁺e⁻ | sin²θ_W 0.01% |

---

### 8. References

1. MOLLER CDR — arXiv:1905.xxxxx
2. P2 CDR — arXiv:1802.xxxxx
3. PRad — Nature 575, 147 (2019)
4. Prime-Electron Foundation §7.2

---

*End of Part 7a — Next: Part 8 — Electron at Finite T/μ*

---

**Status**: Part 7a complete (~95 lines).