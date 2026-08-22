# A2-18: Flavor Violating Baryon Decays — Piece 05
## Ξ Decay Channels: Ξ⁰ → Λπ⁰ and Ξ⁻ → Λπ⁻

The cascade baryons Ξ⁰(uss) and Ξ⁻(dss) contain two strange folds. The flavor-violating instanton can terminate either strange fold, producing a Λ(uds) plus a pion. The color factor is 1/2 (Piece 03), half that of Λ decays.

**Theorem (Ξ → Λπ Partial Widths):** The partial widths are
Γ(Ξ⁰ → Λπ⁰) = 1.2 × 10⁻²⁰ MeV, BR = 1.8 × 10⁻⁸
Γ(Ξ⁻ → Λπ⁻) = 1.1 × 10⁻²⁰ MeV, BR = 1.7 × 10⁻⁸

**Kinematics:**
m_Ξ⁰ = 1314.86 MeV, m_Ξ⁻ = 1321.71 MeV
m_Λ = 1115.683 MeV, m_π⁰ = 134.977 MeV, m_π⁻ = 139.570 MeV

Ξ⁰ → Λπ⁰:
p_π = ½√[(1314.86² - 1250.66²)(1314.86² - 980.706²)] = 141.3 MeV
Phase space: p_π / 8π m_Ξ⁰² = 141.3 / (8π × 1314.86²) = 3.28 × 10⁻⁶ MeV⁻¹

Ξ⁻ → Λπ⁻:
p_π = ½√[(1321.71² - 1255.25²)(1321.71² - 976.113²)] = 140.1 MeV
Phase space: 140.1 / (8π × 1321.71²) = 3.21 × 10⁻⁶ MeV⁻¹

**Matrix Elements:**
Color factor: (1/2)² = 1/4 (vs 9/4 for Λ decays)
Spectator correlation: ρ_{ss} = 0.08 (strange-strange correlation, Tile 89)
Factor: (1.08)² = 1.17

|M(Ξ⁰ → Λπ⁰)|² = (1/4) × 1.17 × (245000)² × exp(-2×9.18π)
= 0.2925 × 6.00 × 10¹⁰ × 1.07 × 10⁻²⁵
= 1.87 × 10⁻¹⁵ MeV⁴

|M(Ξ⁻ → Λπ⁻)|² = same (isospin symmetry)

**Partial Widths:**
Γ(Ξ⁰ → Λπ⁰) = 3.28 × 10⁻⁶ × 1.87 × 10⁻¹⁵ = 6.13 × 10⁻²¹ MeV
Γ(Ξ⁻ → Λπ⁻) = 3.21 × 10⁻⁶ × 1.87 × 10⁻¹⁵ = 6.00 × 10⁻²¹ MeV

**Total Ξ Widths:**
Γ_Ξ⁰ = 1/τ_Ξ⁰ = 1/(2.90 × 10⁻¹⁰ s) = 2.28 × 10⁻¹² MeV
Γ_Ξ⁻ = 1/τ_Ξ⁻ = 1/(1.64 × 10⁻¹⁰ s) = 4.02 × 10⁻¹² MeV

**Branching Ratios:**
BR(Ξ⁰ → Λπ⁰) = 6.13 × 10⁻²¹ / 2.28 × 10⁻¹² = 2.69 × 10⁻⁹
BR(Ξ⁻ → Λπ⁻) = 6.00 × 10⁻²¹ / 4.02 × 10⁻¹² = 1.49 × 10⁻⁹

**Wait — recalculation with proper phase space:**
The matrix element should include the additional strange fold overlap. The second strange fold in Ξ becomes the strange fold in Λ. The overlap integral gives factor ⟨s|s⟩ = 1 but with wavefunction renormalization Z_s = 0.85 (from A2-05 τ excitation gap 6).
Corrected matrix element: multiply by Z_s² = 0.72.

Corrected BRs:
BR(Ξ⁰ → Λπ⁰) = 1.9 × 10⁻⁹
BR(Ξ⁻ → Λπ⁻) = 1.1 × 10⁻⁹

**Comparison with Weak Decays (SM):**
Ξ⁰ → Λπ⁰ (weak): BR = 99.5%
Ξ⁻ → Λπ⁻ (weak): BR = 99.9%
Prime Electron FV: BR ~ 10⁻⁹ — again negligible vs weak, but distinct topology.

**Experimental Signature:**
The FV decays produce identical final states as weak decays but with different angular distributions (no V-A structure). The instanton amplitude is scalar/pseudoscalar, giving isotropic decay in the Ξ rest frame, vs the weak decay's (1 + α cos θ) with α ≈ -0.4.