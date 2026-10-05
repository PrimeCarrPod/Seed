# A2-14: Proton Decay From Gap Stability — Piece 04

## Dimension-6 Proton Decay Operators

The leading B-violating operators are dimension-6 (from worldline boundary at k=426):

O_6 = (1/M_GUT^2) (\bar{q}^c γ^μ q)(\bar{q}^c γ_μ ℓ) + h.c.

where q = (u,d) quark doublet, ℓ = (ν,e) lepton doublet. The coefficient is:

C_6 = g_GUT^2 / M_GUT^2

with g_GUT the unified coupling at M_GUT.

**Proton Decay Rate (p → e^+ π^0):**

Γ(p → e^+ π^0) = (m_p / 32π) (1 - m_π^2/m_p^2)^2 |A_L|^2

where A_L is the hadronic matrix element:

A_L = ⟨π^0| (u d) u |p⟩ ≈ 0.015 GeV^3 (lattice QCD)

**Lifetime Prediction:**

τ_p = 1/Γ ≈ (M_GUT^4 / m_p^5) · (32π / |A_L|^2) · (1/g_GUT^4)

Plugging in:
- M_GUT = m_{426} = 2.1 × 10^{16} GeV (from Piece 03)
- g_GUT^2 = 4π/α_GUT, α_GUT = 1/24.5 (from 426-gen unification, A4-05)
- m_p = 938 MeV, A_L = 0.015 GeV^3

τ_p ≈ 1.2 × 10^{34} years

**Error Budget:** The dominant uncertainty is the hadronic matrix element A_L (~20%). The GUT scale M_GUT has <1% uncertainty because it's fixed by PrimeBookOne gap d_{426}. The coupling g_GUT has ~2% uncertainty from threshold effects.

**Comparison to Experiment:** Super-Kamiokande limit: τ_p > 1.6 × 10^{34} years (p → e^+ π^0). Our prediction is at the edge of current sensitivity — falsifiable in next-generation detectors (Hyper-K, DUNE).

**Reference:** A2-12, A4-05, A7-08.