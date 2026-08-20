# A1-22: Worldline_Boundary_Conditions.md — Piece 02

## UV Boundary Conditions: Directory 3.0 as Physical UV Completion

The UV boundary at τ → 0 corresponds to PrimeBookOne directory 3.0, the highest energy (smallest proper time) regime. Directory 3.0 contains 3500 books × 2^20 = 3,670,016,000 prime gaps, providing a physical UV cutoff at the scale of the largest prime gaps in the dataset.

The maximum gap in directory 3.0 is d_max ≈ 1476 (the 24th record gap). The corresponding minimum proper time interval is:
Δτ_min = κ d_max ≈ 1.288×10^{-21} s × 1476 ≈ 1.90×10^{-18} s

This corresponds to an energy scale:
E_UV = ℏ/Δτ_min ≈ 3.5×10^{-16} eV

(Note: This is a low energy scale because the prime gaps in directory 3.0 are still relatively small. The true UV completion would require even larger gaps from higher directories, but directory 3.0 is the published limit.)

The UV boundary conditions for the fields are:

1. **Gauge connection A_μ**: A_μ(τ=0) = 0 (pure gauge, asymptotic freedom)
   The field strength F_{μν}(τ=0) = 0, so the topological charge density vanishes at the UV boundary.

2. **Worldline metric g_μν**: g_μν(τ=0) = η_μν (flat Minkowski)
   From A1-14, the conformal factor Ω^2(τ) = 1 + λ C(τ). At τ=0, C(0) = 0 (no correlations at zero separation), so Ω^2(0) = 1.

3. **Proper time operator τ̂**: τ̂(0) = 0
   From A1-12, the proper time operator has spectrum τ_n = κ(p_{n+1} - 2). At n=0 (before the first gap), τ = 0.

4. **Fermion field ψ**: ψ(τ=0) = ψ_0 (free fermion boundary condition)
   In the 8-bit Hilbert space (A3-01), the UV boundary state is the vacuum |0⟩ with all 256 states empty.

5. **Instanton field**: No instantons at UV boundary
   The instanton solutions (A1-19) have size ρ ~ 1/√(gap density). At the UV, the gap density is highest (d_max), so instantons are smallest but their action S_inst ~ 8π^2/g^2 is largest. The dilute gas approximation breaks down, but the UV boundary is defined before any instanton centers.

The UV boundary is a regular point in the moduli space of the worldline theory. The path integral (A1-18) starts at τ=0 with these boundary conditions.

Piece 03 derives the IR boundary conditions from directory 0.0.