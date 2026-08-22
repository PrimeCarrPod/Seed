# A2-40: Synthesis Mass Spectrum — Part 08
## Mass Running and Prime Density

**Theorem (Mass Running from Prime Density):** The renormalization group running of lepton masses is determined by the prime density function π(x) across PrimeBookOne directory versions. The mass ratios run logarithmically with the gap scale.

### 8.1 Prime Density and RG Flow

From A2-07 (Prime_Density_Mass_Running) and A4-04 (Running_Couplings_RG_Flow): The PrimeBookOne directory versions correspond to RG scales:

Directory 0.0 → μ = m_e (IR)
Directory 1.0 → μ = m_μ
Directory 2.0 → μ = m_τ
Directory 3.0 → μ = M_GUT (UV)

The prime density at each scale:

π(x) ~ li(x) + O(√x log x)

The running mass at scale μ:

m_l(μ) = m_l(μ_0) · [π(μ_0) / π(μ)]^{γ_m}

where γ_m is the mass anomalous dimension from gap statistics.

### 8.2 Anomalous Dimension from Gaps

The mass anomalous dimension:

γ_m = (d log m / d log μ) = - (d log d / d log μ) = - (μ/d) (dd/dμ)

From the gap sequence, the effective gap at scale μ is:

d_eff(μ) = 2 · (μ/m_e)

This gives:

γ_m = -1 at leading order

But the prime density corrections modify this:

γ_m(μ) = -1 + c/ log(μ/m_e) + O(1/log²)

### 8.3 Running Mass Predictions

At μ = m_μ:

m_e(m_μ) = m_e(m_e) · (π(m_e)/π(m_μ))^{γ_m} ≈ 0.511 · (1/2)^{0.01} = 0.5106 MeV

At μ = m_τ:

m_e(m_τ) = 0.511 · (1/3)^{0.01} = 0.5104 MeV

At μ = M_Z:

m_e(M_Z) = 0.511 · (1/10^5)^{0.01} = 0.508 MeV

The running is extremely slow (logarithmic) because γ_m ≈ 0 for leptons (no strong interactions).

### 8.4 Quark Mass Running

Quark masses run faster due to QCD (from A7-01, A7-10):

m_q(μ) = m_q(μ_0) [α_s(μ)/α_s(μ_0)]^{γ_m/β_0}

with γ_m = 4, β_0 = 11 - 2/3 n_f.

The gap structure provides the UV boundary conditions at Directory 3.0.

### 8.5 Pole Mass vs MS-bar Mass

The pole masses (experimental) are related to MS-bar masses by:

m_pole = m_MS-bar(μ) [1 + 4α_s(μ)/3π + ...]

For leptons: m_pole ≈ m_MS-bar (QED corrections small)
For quarks: significant difference (e.g., m_t(pole) = 172.5 GeV, m_t(MS-bar) = 163 GeV)

The gap sequence gives the pole masses directly (as record gap excitations). The running is a derived consequence.

### 8.6 UV Fixed Point

At Directory 3.0 (UV completion), the gap sequence terminates at d_max ~ 1476 (d_426). The theory reaches a fixed point where all masses are determined by the finite gap set.

---

**Next: Piece 09 — Completeness Proof: No Missing States**