# A1-16: Worldline Action Principle — Piece 11
## Numerical Implementation: Action Evaluation from PrimeBookOne Data

The action S = Σₙ Lₙ can be evaluated numerically from the PrimeBookOne data. Directory 0.0 provides 189 tiles × 500 gaps = 94,500 gaps (IR regime). Directory 3.0 provides 3500 books × 2²⁰ gaps = 3,670,016,000 gaps (UV complete).

Algorithm for computing S from tile data:
1. Load tile T_{k} from directory D (0.0, 1.0, 2.0, or 3.0)
2. For each gap d_i in the tile, compute L_i = (mₑc/2) d_i Ω(d_i) η_μν vᵘ_i vᵛ_i
3. Sum over all gaps: S_tile = Σ_i L_i
4. Sum over all tiles: S_total = Σ_k S_tile

The conformal factor Ω(d) = √(1 + λ C(d)) requires the local correlation function C(d). For a single tile with 500 gaps, C(d) is estimated from the gap distribution within the tile:
C(d) = (1/500) Σ_{j=1}^{500} (d_j − ⟨d⟩)²
where ⟨d⟩ = (1/500) Σ_j d_j.

For the full UV sequence, the correlation function uses the full 3.67 billion gaps:
C_full(d) = lim_{N→∞} (1/N) Σ_{n=1}^N (d_n − ⟨d⟩_N)²
where ⟨d⟩_N = (1/N) Σ_{n=1}^N d_n = log p_N + O(1).

The running of the action with directory level (IR to UV) is:
S(D) = (mₑc/2) Σ_{tiles in D} Σ_{gaps in tile} d Ω_D(d)
where Ω_D(d) uses the correlation function at directory level D.

The convergence of S(D) as D increases is a test of the framework. From the PrimeBookOne structure:
- D=0.0: 94,500 gaps, p ∼ 10⁶
- D=1.0: 94,500 gaps, p ∼ 10⁹
- D=2.0: 94,500 gaps, p ∼ 10¹²
- D=3.0: 3.67×10⁹ gaps, p ∼ 10¹⁸

The action per gap ⟨L⟩ = S/N_gaps should approach a constant as D increases, with corrections of order 1/log p.

Pseudo-code for action evaluation:
```
function compute_action(directory_level):
    total_action = 0
    for tile in load_tiles(directory_level):
        gaps = extract_gaps(tile)
        mean_gap = mean(gaps)
        var_gap = variance(gaps)
        for d in gaps:
            Omega = sqrt(1 + lambda * var_gap / mean_gap^2)
            L = (m_e * c / 2) * d * Omega * (v^2)  # v^2 = -c^2 in rest frame
            total_action += L
    return total_action
```

The parameter λ is fixed by requiring that the effective coupling α = α₀/Ω² matches the measured fine-structure constant α ≈ 1/137 at the electron scale (twin primes, d=2).

Verification using PrimeBookOne data:
- Compute S for each directory level
- Check convergence: |S(D+1) − S(D)| / S(D) → 0
- Extract α(D) = α₀ Ω(D)⁻² and compare to QED running
- Verify Ward identities numerically from discrete vertex functions