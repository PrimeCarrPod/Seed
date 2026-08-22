# A2-18: Flavor Violating Baryon Decays — Piece 03
## Color Structure: SU(3) Flow in Λ → nπ⁰ and Ξ → Λπ

The strange quark fold in the Prime Electron framework carries color charge in the fundamental representation of SU(3)_color (A7-01). The flavor-violating decay proceeds through a color-singlet instanton where the strange fold terminates while the two spectator folds (u,d for Λ; u,s or d,s for Ξ) continue as the daughter baryon folds.

**Theorem (Color Flow in Fold Termination):** The ΔS = 1 instanton is a color singlet. The amplitude factorizes as M = M_color ⊗ M_flavor ⊗ M_spatial where M_color = δ_{ij}/√3 for the terminating fold, and the spectator folds maintain their color correlations through the 't Hooft vertex (A2-17, Piece 03).

**Color Wavefunctions:**

Λ⁰(uds) color wavefunction (antisymmetric in u,d):
|Λ⟩ = (1/√6) ε_{ijk} |u^i d^j s^k⟩

n⁰(udd) color wavefunction:
|n⟩ = (1/√6) ε_{ijk} |u^i d^j d^k⟩

The instanton vertex replaces the strange fold s^k with a down fold d^k while emitting a π⁰ fold (color singlet: (uū - dđ)/√2).

**'t Hooft Vertex for ΔS = 1:**
V_{FV} = κ_FV · exp(-S_inst^FV) · (ū d)(d̄ s) + h.c.
where κ_FV = (S_inst^FV/2π)^{1/2} · Λ_QCD² ≈ 2.12 Λ_QCD²

The color structure contracts as:
(ū^i d_i)(d̄^j s_j) → δ^i_i δ^j_j = 3 × 3 = 9 color combinations
But the baryon wavefunctions project onto color singlet: factor 1/√6 × 1/√6 = 1/6
Net color factor: 9/6 = 3/2 enhancement over naive count.

**Spectator Fold Correlations (from A1-25, A1-26):**
The two spectator folds (u,d in Λ → n) maintain their prime-gap correlation:
⟨d_u d_d⟩ = ⟨d²⟩ + Cov(d_u, d_d) = ⟨d²⟩(1 + ρ_{ud})
where ρ_{ud} = 0.15 from PrimeBookOne Tile 47 (u-d gap correlation).
This gives a 1.15 enhancement in the nuclear matrix element.

**Ξ → Λπ Color Structure:**
Ξ⁰(uss) → Λ(uds)π⁰: One strange fold terminates, one strange fold becomes down fold.
Color factor: (1/√6)(1/√6) × 3 = 1/2 (suppressed vs Λ decay)
Ξ⁻(dss) → Λ(uds)π⁻: Same color factor 1/2.

**Σ → pπ Color Structure:**
Σ⁺(uus) → p(uud)π⁰: Color factor 3/2 (same as Λ)
Σ⁻(dds) → n(udd)π⁻: Color factor 3/2

**Summary of Color Factors:**
| Decay | Initial | Final | Color Factor |
|-------|---------|-------|--------------|
| Λ → nπ⁰ | ε_{ijk}u^i d^j s^k | ε_{lmn}u^l d^m d^n | 3/2 |
| Λ → pπ⁻ | ε_{ijk}u^i d^j s^k | ε_{lmn}u^l u^m d^n | 3/2 |
| Ξ⁰ → Λπ⁰ | ε_{ijk}u^i s^j s^k | ε_{lmn}u^l d^m s^n | 1/2 |
| Ξ⁻ → Λπ⁻ | ε_{ijk}d^i s^j s^k | ε_{lmn}u^l d^m s^n | 1/2 |
| Σ⁺ → pπ⁰ | ε_{ijk}u^i u^j s^k | ε_{lmn}u^l u^m d^n | 3/2 |
| Σ⁻ → nπ⁻ | ε_{ijk}d^i d^j s^k | ε_{lmn}u^l d^m d^n | 3/2 |

These factors directly determine the relative branching ratios (Piece 07).