# A1-15: Worldline Geodesic Equation — Piece 10
## Numerical Algorithm: Solving the Discrete Geodesic Equation

Given the PrimeBookOne gap data (reference only, not cloned locally), we can formulate a numerical algorithm to solve the discrete geodesic equation for the Prime Electron worldline.

**Input data (referenced from PrimeBookOne):**
- Directory 0.0: Tiles 00–188, each with 500 gaps d^{(0)}_k
- Directory 1.0: Tiles 00–188, each with 500 gaps d^{(1)}_k
- Directory 2.0: Tiles 00–188, each with 500 gaps d^{(2)}_k
- Directory 3.0: Books 0001–3500, each with 2²⁰ gaps d^{(3)}_n

**Algorithm:**
1. **Initialize:** Set initial position x^μ₀ = (0, 0, 0, 0), initial four-velocity u^μ₀ = (1, 0, 0, 0) in comoving frame.
2. **For each directory level ℓ = 0, 1, 2, 3:**
   a. For each tile/book b in directory ℓ:
      i. Load gap sequence {d^{(ℓ)}_n} (500 for ℓ<3, 2²⁰ for ℓ=3)
      ii. Compute local conformal factor Ω^{(ℓ)}_n = √(1 + λ C^{(ℓ)}_n)
         where C^{(ℓ)}_n is the gap correlation function computed from the tile/book data
      iii. For each step n in the tile/book:
           - Compute Δτ_n = κ d^{(ℓ)}_n
           - Compute Christoffel symbols: Γ⁰_00 = Δ log Ω_n / Δτ_n, etc.
           - Update four-velocity:
             u⁰_{n+1} = u⁰_n − Δτ_n [Γ⁰_00 (u⁰_n)² + Γ⁰_ij u^i_n u^j_n]
             u^i_{n+1} = u^i_n − 2 Δτ_n Γ^i_0j u⁰_n u^j_n
           - Update position:
             x⁰_{n+1} = x⁰_n + Δτ_n u⁰_n
             x^i_{n+1} = x^i_n + Δτ_n u^i_n
      iv. At tile/book boundary, apply junction conditions from Piece 09
   b. At directory boundary, apply directory transition matching
3. **Output:** Worldline coordinates {x^μ_n} for all 3.67B steps

**Computational complexity:**
- Total steps: 3.67×10⁹
- Memory: O(1) per step (streaming algorithm)
- Time: ~10⁹ operations, feasible on HPC

**Verification checks:**
1. Four-velocity normalization: g_μν u^μ u^ν = −1 at each step
2. Energy conservation: p_μ u^μ = constant within each book
3. Self-intersection detection: Check x^μ_n = x^μ_m for n ≠ m (A1-11)
4. Proper time accumulation: τ_N = κ ∑ d_n matches A1-09 Compton scale
5. Metric reconstruction: Verify g_μν from x^μ matches A1-14

**Expected results:**
- The trajectory x^μ(τ) will show discrete "jitter" at scale κ ~ 10⁻²¹ s
- Self-intersections will occur at Type I–V recurrence points
- The spatial coordinates will trace the emergent spatial geometry from A1-13
- The total proper time τ_total will match the Compton time derivation

**Implementation note:** Since PrimeBookOne data is accessed by reference only, the algorithm assumes a data access API that can stream gaps from the 189 tiles per directory and 3500 books in directory 3.0. The gap correlation function C_n requires a sliding window over the gap sequence.