# A2-19: Baryon Number Violation In Collisions — Piece 03
## Parton-Level Cross Sections: qq → q̄q̄, qqq → q̄q̄q̄

The fundamental BNV processes at parton level arise from worldline fold intersections where incoming quark folds annihilate or terminate, producing antiquark folds. The cross sections are computed from the instanton amplitude with energy-dependent action.

**Theorem (Parton BNV Cross Sections):** For a 2→2 process qq → q̄q̄ (ΔB=2) and 3→3 process qqq → q̄q̄q̄ (ΔB=3), the cross sections are:
σ(qq → q̄q̄) = (π/√s²) C_2 exp[-π d_eff(√s)]
σ(qqq → q̄q̄q̄) = (π²/√s⁴) C_3 exp[-π d_eff(√s)]

**Instanton Amplitude at Finite Energy:**

The Euclidean instanton amplitude is A_inst = κ exp(-S_inst). At finite CM energy √s, the amplitude is analytically continued to Minkowski space with the replacement S_inst → S_inst(√s) - i π S_inst'(√s) √s τ (from saddle point).

For the 2→2 process, the matrix element is:
M(qq → q̄q̄) = g_s² C_F κ_2 exp[-S_inst(√s)]
where C_F = 4/3 is the color factor, κ_2 = (S_inst/2π) from determinant.

**Color Structure:**
Initial: two quarks in 3 ⊗ 3 = 6 ⊕ 3̄
Final: two antiquarks in 3̄ ⊗ 3̄ = 6̄ ⊕ 3
The instanton vertex projects onto color singlet in the t-channel: (3 ⊗ 3) ⊗ (3̄ ⊗ 3̄) → 1
Color factor: Tr[T^a T^b] Tr[T^a T^b] = C_F² = 16/9 for qq → q̄q̄.

**Cross Section Formula (2→2):**
σ(qq → q̄q̄) = (1/16π s) |M|² × (phase space)
For massless quarks, phase space = 1/2.
|M|² = (g_s² C_F κ_2)² exp[-2S_inst(√s)]
= (g_s⁴ × (16/9)² × (S_inst/2π)²) exp[-2S_inst(√s)]

At √s = 14 TeV (LHC), d_eff = 36, S_inst = 18π:
κ_2 = (18π/2π) = 9
|M|² = g_s⁴ × (256/81) × 81 × exp[-36π] = g_s⁴ × 256 × exp[-36π]

g_s² = 4πα_s, α_s(14 TeV) ≈ 0.09 → g_s⁴ ≈ (4π×0.09)² ≈ 1.28
|M|² ≈ 1.28 × 256 × exp[-113.1] ≈ 328 × 3.1×10⁻⁴⁹ ≈ 1.0×10⁻⁴⁶

σ(qq → q̄q̄) = (1/16π s) × 1.0×10⁻⁴⁶ × (1/2) = 1.0×10⁻⁴⁶ / (32π × (1.4×10⁴ GeV)²)
= 1.0×10⁻⁴⁶ / (1.96×10¹⁰ GeV²) ≈ 5×10⁻⁵⁷ GeV⁻² = 5×10⁻³⁵ pb

**3→3 Process qqq → q̄q̄q̄ (ΔB=3):**
Color factor: 3 quarks in 3 ⊗ 3 ⊗ 3 = 10 ⊕ 8 ⊕ 8 ⊕ 1
Color singlet projection gives factor 1.
Matrix element: M = g_s³ κ_3 exp[-S_inst(√s)] with κ_3 = (S_inst/2π)^{3/2}
Cross section: σ = (1/2!) (1/512π³ s²) |M|² × phase space
Phase space for 3→3: (π²/8) / s² (for massless)

At √s = 14 TeV, d_eff = 36 (ΔB=4) or 30 (ΔB=3)?
For 3→3, ΔB=3 → d=30, S_inst = 15π.
κ_3 = (15π/2π)^{3/2} = 7.5^{1.5} = 20.5
|M|² = g_s⁶ × (20.5)² × exp[-30π] = (4πα_s)³ × 420 × exp[-94.2]
g_s⁶ ≈ 1.4, |M|² ≈ 1.4 × 420 × 2.3×10⁻⁴¹ ≈ 1.4×10⁻³⁸

σ(qqq → q̄q̄q̄) = (1/1024π³ s²) × 1.4×10⁻³⁸ × (π²/8) / s²
= 1.4×10⁻³⁸ / (8192π s⁴) ≈ 10⁻⁶⁸ GeV⁻⁴ = 10⁻⁴⁶ pb

**Comparison with SM Processes:**
σ_QCD(pp → jets) ~ 10⁸ pb at 14 TeV
σ_BNV / σ_QCD ~ 10⁻⁴³ (2→2) or 10⁻⁵⁴ (3→3)

**Conclusion:** Parton-level BNV cross sections are EXTREMELY suppressed at LHC energies. The exponential suppression exp(-π d_eff) with d_eff ≥ 36 makes them unobservable in standard channels.

**However** — there are enhancement mechanisms:
1. **Coherent enhancement** in heavy ions (Piece 05)
2. **Sphaleron-like transitions** at high multiplicity (Piece 07)
3. **Resonant production** from fold intersection states (Piece 09)