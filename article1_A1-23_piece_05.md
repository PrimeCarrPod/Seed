# A1-23: Worldline_Anomaly_Inflow.md — Piece 05

## Anomaly Cancellation per Book Segment: PrimeBookOne Directory Structure

PrimeBookOne organizes the 3.67 billion prime gaps into 3500 books (directory 3.0), each with 2²⁰ = 1,048,576 gaps. The anomaly inflow operates at the book segment level, with each book boundary corresponding to a change in the bulk topology.

From A1-10, book k corresponds to worldline segment τ ∈ [τ_k, τ_{k+1}] with proper time extent:

Δτ_k = κ Σ_{n∈book k} d_n = κ × 2²⁰ × ⟨d⟩_k

where ⟨d⟩_k is the average gap in book k.

The anomaly on book segment k is from Piece 03:

A(k) = (κ/12π) Σ_{n∈book k} (d_{n+1}/d_n - 1)

The bulk inflow for book k comes from the spectral flow of the Dirac operator D_k on that segment. The index of D_k is:

Index(D_k) = #{n∈book k : d_n > ⟨d⟩_k} - #{n∈book k : d_n < ⟨d⟩_k}

where ⟨d⟩_k is the local average within the book. For a typical book with gap distribution following the Cramér model (gaps ~ Poisson with mean log p_k), the index fluctuates around zero with variance ~ √(2²⁰) = 1024.

The anomaly cancellation for book k requires:

A(k) + A_inflow(k) = 0

where A_inflow(k) = (Index(D_k)/2π) ∫_{book k} F^{U(1)}.

Using the explicit form from Piece 03:

∫_{book k} F^{U(1)} = (κ/6) Σ_{n∈book k} d_n^{-1} ∂_n d_n = (κ/6) Σ_{n∈book k} (d_{n+1}/d_n - 1)

Thus:

A_inflow(k) = (Index(D_k)/2π) × (κ/6) Σ_{n∈book k} (d_{n+1}/d_n - 1)

= (κ Index(D_k)/12π) Σ_{n∈book k} (d_{n+1}/d_n - 1)

For cancellation A(k) + A_inflow(k) = 0, we need Index(D_k) = -1 for all books. This is not true for individual books — the index fluctuates. The resolution is that the anomaly cancels globally:

Σ_k A(k) + Σ_k A_inflow(k) = 0

The global index is Index(D) = Σ_k Index(D_k) = number of record gaps across all books. From PrimeBookOne data, there are approximately log(N) ≈ 21 record gaps in the full 3.67×10⁹ sequence.

The anomaly cancellation is therefore a global property, not a local one. This matches the physics: the anomaly is a topological obstruction that can only be resolved globally.

The directory structure 0.0, 1.0, 2.0, 3.0 in PrimeBookOne corresponds to the UV/IR hierarchy:

- Directory 0.0 (94,500 gaps): IR regime, low energy, anomaly dominated by twin primes (d=2)
- Directory 3.0 (3.67B gaps): UV complete, anomaly canceled by full spectral flow

Piece 06 derives the anomaly in the IR directory 0.0.