# A1-22: Worldline_Boundary_Conditions.md — Piece 01

## Introduction: UV/IR Boundary Conditions from PrimeBookOne Directory Structure

The prime electron worldline has two natural boundaries: the UV boundary at τ → 0 (directory 3.0, highest energies, smallest proper time intervals) and the IR boundary at τ → T (directory 0.0, lowest energies, largest proper time intervals). These boundaries are not arbitrary cutoffs but are determined by the PrimeBookOne directory structure, which provides a physical UV completion at directory 3.0 (3500 books × 2^20 gaps = 3.67×10^9 gaps) and a physical IR at directory 0.0 (189 tiles × 500 gaps = 94,500 gaps).

From A1-01 (Worldline_Proper_Time_Quantization), the proper time is discrete: τ_n = κ Σ_{k=1}^n d_k with κ = ℏ/(m_e c^2) ≈ 1.288×10^{-21} s. The total proper time for the full worldline is:
T = κ Σ_{n=1}^{N_gaps} d_n = κ (p_{N_gaps+1} - 2) ≈ κ × 3.67×10^9 × ⟨d⟩ ≈ 1.05×10^{-10} s

The UV boundary corresponds to the first gap (n=1, d_1=2, τ_1 = 2κ), and the IR boundary corresponds to the last gap (n=N_gaps, τ_{N_gaps} = T). The boundary conditions on the gauge connection A_μ(τ) and the worldline field x^μ(τ) must be specified at both ends.

For the gauge connection (A1-20), the UV boundary condition is pure gauge:
A_μ(τ=0) = 0

This reflects asymptotic freedom: at the shortest proper time scales (highest energies), the gauge coupling vanishes. The IR boundary condition is determined by the vacuum angle θ = 0 (A1-20 Piece 11):
A_μ(τ=T) = A_μ^{pure gauge} = i g^{-1} ∂_μ g

with g = exp(i θ σ_3/2) = 1.

For the worldline field x^μ(τ), the boundary conditions are:
x^μ(τ=0) = 0 (origin of worldline)
x^μ(τ=T) = x^μ(T) (free endpoint, or periodic for closed worldline)

The closed worldline condition (periodic in proper time) is appropriate for the one-electron universe where the electron traverses all of spacetime. The periodicity is:
x^μ(T) = x^μ(0) + 2π R^μ

where R^μ is the compactification radius. For the prime electron, the compactification is provided by the PrimeBookOne directory structure itself: directory 3.0 is the UV completion, directory 0.0 is the IR, and the RG flow connects them.

Piece 02 derives the UV boundary conditions from directory 3.0.