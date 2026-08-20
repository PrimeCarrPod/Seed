# A1-22: Worldline_Boundary_Conditions.md — Piece 10

## PrimeBookOne Implementation: Boundary Conditions by Directory

The boundary conditions are naturally implemented using the PrimeBookOne directory structure. Each directory provides the data for the corresponding proper time regime.

**Directory 0.0 (IR, τ ∈ [0, T_0.0]):**
- 189 tiles × 500 gaps = 94,500 gaps
- Gaps: d = 2, 4, 2, 4, 6, 2, 6, 4, 2, 4, ... (small gaps, high twin prime density)
- Boundary at τ=0: First gap d_1=2
- Boundary condition data: Tile00.zip contains the first 500 gaps
- Initial gauge connection: A_μ(0) = (κ/2) d_1 v_μ σ_3 log(d_2/d_1) = κ v_μ σ_3 log(2)
- Initial metric: Ω^2(0) = 1 + λ C(0) with C(0) from first 500 gaps
- Initial fermion state: |ψ(0)⟩ = |0⟩ in 8-bit Hilbert space

**Directory 3.0 (UV, τ ∈ [T - T_3.0, T]):**
- 3500 books × 2^20 gaps = 3,670,016,000 gaps
- Gaps: large gaps up to d=1476, including 24 record gaps
- Boundary at τ=T: Last gap in book 3500
- Boundary condition data: Last book (book 3500) contains the final 2^20 gaps
- Final gauge connection: A_μ(T) = (κ/2) d_N v_μ σ_3 log(d_N/d_{N-1}) ≈ 0 (since d_N is record gap, d_{N+1} unknown)
- Actually, the final gap in the dataset is not necessarily a record gap. The last gap is the gap before the last prime in the dataset.
- Final metric: Ω^2(T) = 1 + λ C(T) ≈ 1 (correlations decay)
- Final fermion state: |ψ(T)⟩ = U(T,0) |ψ(0)⟩ where U is time evolution

**Matching Conditions at Directory Interfaces:**
The boundaries between directories (0.0/1.0, 1.0/2.0, 2.0/3.0) are not physical boundaries but matching surfaces for the RG flow. The fields must be continuous across these surfaces:
- A_μ continuous
- g_μν continuous
- ψ continuous

The RG flow is implemented by integrating out high-frequency modes (large gaps) as one moves from 3.0 to 0.0. But since the worldline flows 0.0 → 3.0, the physical process is the reverse: modes are added as proper time increases.

**Numerical Algorithm for Boundary Conditions:**
1. Load Tile00.zip (first 500 gaps) → initialize τ=0 boundary
2. Load directory 0.0 tiles → propagate to τ=T_0.0
3. Load directory 1.0 tiles → propagate to τ=T_0.0+T_1.0
4. Load directory 2.0 tiles → propagate to τ=T_0.0+T_1.0+T_2.0
5. Load directory 3.0 books → propagate to τ=T
6. At τ=T, extract boundary values for matching

The periodicity condition x^μ(T) = x^μ(0) + 2π R^μ is enforced by adjusting the total displacement.

Piece 11 discusses the effective boundary action.