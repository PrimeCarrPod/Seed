# A1-22: Worldline_Boundary_Conditions.md — Piece 03

## IR Boundary Conditions: Directory 0.0 as Physical Infrared Limit

The IR boundary at τ → T corresponds to PrimeBookOne directory 0.0, the lowest energy (largest proper time) regime. Directory 0.0 contains 189 tiles × 500 = 94,500 prime gaps, representing the infrared tail of the prime gap distribution.

The minimum gap in directory 0.0 is d_min = 2 (twin primes). The corresponding maximum proper time interval is:
Δτ_max = κ d_min ≈ 1.288×10^{-21} s × 2 ≈ 2.58×10^{-21} s

Wait, this is the minimum interval. The IR limit is actually about the accumulation of many small gaps. The total proper time for directory 0.0 is:
T_0.0 = κ Σ_{n=1}^{94500} d_n ≈ κ × 94500 × ⟨d⟩_0.0 ≈ 1.288×10^{-21} × 94500 × 4.5 ≈ 5.5×10^{-16} s

The full worldline proper time T is dominated by directory 3.0:
T = T_3.0 + T_2.0 + T_1.0 + T_0.0 ≈ T_3.0 ≈ 1.05×10^{-10} s

The IR boundary conditions for the fields are:

1. **Gauge connection A_μ**: A_μ(τ=T) = A_μ^{pure gauge} = i g^{-1} ∂_μ g
   With g = exp(i θ σ_3/2) and θ = 0 (A1-20 Piece 11), this gives A_μ(τ=T) = 0.
   However, the IR limit has non-trivial holonomy from the accumulated phase:
   Hol = P exp(i ∫_0^T A_μ dx^μ) = exp(i (κ/2) Σ_n ∂_n d_n) = exp(i (κ/2) (d_N - d_1))
   
   For the full sequence, d_N ≈ 1476, d_1 = 2, giving Hol = exp(i (κ/2) × 1474).
   Since κ = ℏ/(m_e c^2) ≈ 1.288×10^{-21} s, this phase is extremely small (O(10^{-18})), so effectively A_μ(T) = 0.

2. **Worldline metric g_μν**: g_μν(τ=T) = Ω^2(T) η_μν
   From A1-14, Ω^2(T) = 1 + λ C(T). The two-point correlation at maximum separation C(T) = ⟨d_n d_{n+N}⟩ - ⟨d⟩^2.
   For the prime gap sequence, the correlation decays, so C(T) → 0 as T → ∞. Thus Ω^2(T) → 1.

3. **Proper time operator τ̂**: τ̂(T) = T (maximum proper time)
   The spectrum ends at τ_N = κ(p_{N+1} - 2).

4. **Fermion field ψ**: ψ(τ=T) = ψ_T
   The IR boundary state in the 8-bit Hilbert space is the filled Fermi sea. From A3-08 (Error_Correction_Twin_Primes), the twin primes provide error correction, so the IR state is a protected logical state.

5. **Instanton field**: All instantons are integrated out
   The 24 record gaps (instantons) have been integrated out by the RG flow from UV to IR. The IR theory is purely perturbative with no topological sectors (Q = 0 only).

The IR boundary is the endpoint of the RG flow. The matching between UV and IR is the statement that the full partition function is independent of the RG scale.

Piece 04 discusses the RG flow between directories.