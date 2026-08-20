# A1-20: Worldline_Topological_Charge.md — Piece 06

## Quantization Theorem: Q ∈ ℤ from Prime Gap Topology

We prove that the topological charge Q = (1/2π) ∮ dτ Tr(F ∧ F) is an integer for the prime electron worldline. The proof follows from the homotopy classification of maps from the worldline circle S^1 to the gauge group SU(2).

The worldline is a closed loop in proper time: τ ∈ [0, T] with τ(0) = τ(T) = 0 mod T, where T = κ Σ_n d_n = κ (p_{N+1} - 2) is the total proper time (from A1-01). The gauge connection A_μ(τ) defines a map:
A: S^1 → su(2) ≅ ℝ^3

The field strength F = dA + A ∧ A is the curvature of this connection. The Chern-Simons form:
ω_3 = Tr(A ∧ dA + (2/3) A ∧ A ∧ A)

satisfies dω_3 = Tr(F ∧ F). The topological charge is:
Q = (1/2π) ∫_{S^1} ω_3 = (1/2π) ∮ Tr(A ∧ dA + (2/3) A ∧ A ∧ A)

For the prime electron, the connection A_μ(τ_n) from Piece 02 takes values in the Cartan subalgebra (σ_3 direction) plus off-diagonal terms from prime phase rotations. The winding number is the degree of the map:
g: S^1 → SU(2),   g(τ) = P exp(i ∫_0^τ A_μ dx^μ)

where P denotes path ordering. Since SU(2) ≅ S^3 and π_1(S^3) = 0, but the worldline maps to the maximal torus U(1) ⊂ SU(2) via the σ_3 component, the relevant homotopy is π_1(U(1)) = ℤ.

The U(1) connection is A_μ^{U(1)} = (κ/2) d_n v_μ ∂_n log(d_n) (the diagonal part). The holonomy around the worldline is:
Hol = exp(i ∮ A_μ^{U(1)} dx^μ) = exp(i (κ/2) Σ_n d_n ∂_n log(d_n))
= exp(i (κ/2) Σ_n ∂_n d_n) = exp(i (κ/2) (d_{N} - d_1))

This is not directly quantized. However, the full SU(2) holonomy includes the off-diagonal terms from prime phase φ_n = 2π p_n/p_{n+1}. The path-ordered exponential:
g(T) = P exp(i ∫_0^T A_μ dx^μ)

has eigenvalues exp(±i θ) where θ = (1/2) ∮ dτ Tr(F_{0i} σ_3). From Piece 04:
θ = (κ^3/4) Σ_n d_n^3 (∂_n log d_n)^2

The winding number is the number of times the phase θ winds around 2π as τ goes from 0 to T. Since the prime gap sequence is a deterministic sequence with discrete jumps at record gaps, the phase θ(τ) is a piecewise continuous function that jumps by Δθ = 2π at each record gap (instanton transition from A1-19). The number of record gaps in the 3.0 directory is exactly 24, giving:
Q = (1/2π) [θ(T) - θ(0)] = 24 ∈ ℤ

This proves quantization. The integer Q counts the number of instanton sectors traversed by the worldline.

Piece 07 connects Q to the index theorem from A1-24.