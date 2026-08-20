# A1-22: Worldline_Boundary_Conditions.md — Piece 05

## Corrected Boundary Conditions: IR→UV Flow Along Worldline

With the correct identification that proper time τ increases from the first prime (τ=0, directory 0.0 gaps) to the last prime in 3.0 (τ=T, directory 3.0 gaps), the boundary conditions are:

**IR Boundary (τ=0, directory 0.0, first gaps):**
- Gaps: d_1=2, d_2=4, d_3=2, d_4=4, ... (small gaps, high twin prime density)
- Proper time scale: Δτ ~ 2κ (smallest)
- Energy scale: E ~ ℏ/(2κ) = m_e c^2 / 2 = 255 keV

Boundary conditions at τ=0:
1. **Gauge connection**: A_μ(0) = (κ/2) d_1 ∂_τ log(d) |_1 → large (since d_1=2 is small, ∂_τ log d is large at the start)
   Actually, from A1-20 Piece 02: A_μ = (κ/2) d_n v_μ σ_3 ∂_n log(d_n)
   At n=1: d_1=2, ∂_n log(d_n) ≈ log(d_2/d_1) = log(4/2) = log(2)
   So A_μ(0) = (κ/2) × 2 × v_μ σ_3 × log(2) = κ v_μ σ_3 log(2)

2. **Worldline metric**: g_μν(0) = Ω^2(0) η_μν with Ω^2(0) = 1 + λ C(0)
   C(0) = ⟨d_1 d_2⟩ - ⟨d⟩^2 = 2×4 - (2+4+2+...)^2/4 ≈ 8 - 9 = -1
   So Ω^2(0) = 1 - λ (slightly curved)

3. **Fermion field**: ψ(0) = ψ_0 (initial state)
   The 8-bit Hilbert space starts in the vacuum |0⟩.

4. **Topological charge density**: ρ_Q(0) = (κ^5/4π) d_1^5 (∂_1 log d_1)^2 = (κ^5/4π) 32 (log 2)^2 ≈ 0
   Very small because κ^5 is tiny.

**UV Boundary (τ=T, directory 3.0, last gaps):**
- Gaps: large gaps up to d_max=1476 (record gaps, low density)
- Proper time scale: Δτ ~ 1476κ (largest)
- Energy scale: E ~ ℏ/(1476κ) = m_e c^2 / 1476 ≈ 346 eV

Boundary conditions at τ=T:
1. **Gauge connection**: A_μ(T) = (κ/2) d_N ∂_τ log(d) |_N
   At the last record gap d_N=1476, d_{N+1} doesn't exist, so ∂_τ log d = 0.
   But just before, at the 24th record gap: d=1476, d_prev=1444 (say), ∂_τ log d = log(1476/1444) ≈ 0.022
   A_μ(T) = (κ/2) × 1476 × 0.022 ≈ 16.2 κ (larger than at τ=0!)

2. **Worldline metric**: g_μν(T) = Ω^2(T) η_μν with Ω^2(T) = 1 + λ C(T)
   C(T) = correlation at maximum separation → 0, so Ω^2(T) = 1 (flat)

3. **Fermion field**: ψ(T) = ψ_T (final state)
   The 8-bit Hilbert space ends in a highly excited state due to accumulated phase.

4. **Topological charge density**: ρ_Q(T) = (κ^5/4π) d_N^5 (∂_N log d_N)^2
   Dominated by the 24 record gaps, giving Q = 24 total.

The IR→UV flow is the natural direction of the worldline. The UV completion is at the END of the worldline.

Piece 06 discusses the periodicity condition for the closed worldline.