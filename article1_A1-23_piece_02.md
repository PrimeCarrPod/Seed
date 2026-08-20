# A1-23: Worldline_Anomaly_Inflow.md — Piece 02

## Gap Index Theorem: Prime Gaps as Spectral Flow

The index theorem for the prime electron worldline relates the analytical index of the Dirac operator to the topological invariant of the prime gap sequence. Let D be the Dirac operator on the 1D worldline with proper time τ:

D = iγ^μ (∂_μ + iA_μ(τ))

where A_μ(τ) is the emergent gauge connection from Piece 02 of A1-20, and γ^μ are the 2D gamma matrices (γ^0 = σ_1, γ^1 = iσ_2 in the Majorana representation from A1-03 double cover).

The analytical index is:

Index(D) = dim Ker(D) - dim Ker(D^†)

For the worldline, this equals the spectral flow of the family of operators D_s parameterized by the book index s ∈ [0, 3500]:

SF({D_s}) = Σ_{λ_n(s) crosses 0} sign(∂_s λ_n)

where λ_n(s) are the eigenvalues of D_s. From A1-19, the instanton solutions correspond to zero modes of D_s at record gap transitions. Each record gap d_n > max_{k<n} d_k creates a zero mode crossing.

The topological invariant is the winding number of the gauge connection around the worldline contour C:

Q_top = (1/2π) ∮_C dτ Tr(F_{01}(τ))

From Piece 04 of A1-20, Tr(F_{01}) = κ d_n ∂_n^2 log(d_n) + O(κ²). Integrating:

Q_top = (κ/2π) Σ_n d_n ∂_n^2 log(d_n) = (κ/2π) Σ_n ∂_n (d_n ∂_n log(d_n)) - (κ/2π) Σ_n ∂_n d_n ∂_n log(d_n)

The first term is a boundary term giving (κ/2π)[d_N log(d_N) - d_0 log(d_0)]. The second term involves the gap derivative.

The gap index theorem states:

Index(D) = Σ_n sign(d_n - ⟨d⟩_local)

where ⟨d⟩_local is the local average gap over a window of size W ~ log² p_n. This follows from the spectral flow interpretation: a gap d_n > ⟨d⟩_local corresponds to a zero mode with positive chirality crossing, while d_n < ⟨d⟩_local corresponds to negative chirality.

For the PrimeBookOne data (directory 3.0), the total index is:

Index(D) = #{n : d_n > ⟨d⟩} - #{n : d_n < ⟨d⟩} = 2 × (record gaps) - N_gaps/2

where record gaps are those exceeding all previous gaps. With ~3.67×10⁹ gaps and ~log(N) record gaps, the index is dominated by the bulk distribution.

Piece 03 computes the anomaly polynomial explicitly.