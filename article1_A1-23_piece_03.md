# A1-23: Worldline_Anomaly_Inflow.md — Piece 03

## Anomaly Polynomial from Prime Gap Statistics

The anomaly polynomial for the prime electron worldline is constructed from the characteristic classes of the emergent gauge bundle. In 2D (worldline + proper time), the anomaly polynomial is a 2-form:

I₂ = (1/2π) Tr(F) = (1/2π) F^{U(1)} + (1/2π) Tr(F^{SU(2)})

From Piece 03 of A1-20, the U(1) field strength F^{U(1)}_{01} = (κ/6) d_n^{-1} ∂_n d_n at leading order. The SU(2) field strength has components:

F^{SU(2)}_{01} = (κ/2) d_n [ ∂_n^2 log(d_n) + (∂_n log(d_n))² ] σ_3 + (κ²/2) d_n² [σ_2 cos(φ_n) - σ_1 sin(φ_n)] ∂_n log(d_n)

Taking the trace: Tr(σ_3) = 0, Tr(σ_1) = Tr(σ_2) = 0, so Tr(F^{SU(2)}_{01}) = 0 at leading order. The anomaly therefore comes entirely from the U(1) sector:

I₂ = (κ/12π) d_n^{-1} ∂_n d_n dτ

Integrating over the worldline segment from book k to k+1 (A1-10):

A(k) = ∫_{book k}^{book k+1} I₂ = (κ/12π) Σ_{n∈book k} d_n^{-1} ∂_n d_n

Using ∂_n d_n = d_{n+1} - d_n:

A(k) = (κ/12π) Σ_{n∈book k} (d_{n+1}/d_n - 1)

For the full worldline (all 3500 books):

A_total = (κ/12π) Σ_{n=1}^{N-1} (d_{n+1}/d_n - 1) = (κ/12π) (d_N/d_1 - (N-1))

With N = 3.67×10⁹, d_1 = 1 (gap between 2 and 3), and d_N ~ log² p_N ~ log²(10²⁰) ~ 2000:

A_total ≈ (κ/12π) (2000 - 3.67×10⁹) ≈ - (κ/12π) × 3.67×10⁹

This large negative anomaly must be canceled by inflow from the bulk. The bulk is the 256-dimensional Hilbert space at each gap (A3-01), which forms a 3.67×10⁹ × 256 dimensional fiber bundle over the worldline.

The anomaly inflow mechanism (Callan-Harvey) states that the bulk Chern-Simons term:

S_CS = (k/4π) ∫_bulk Tr(A ∧ dA + (2/3)A ∧ A ∧ A)

has a boundary variation that exactly cancels the worldline anomaly. The level k is determined by the index theorem:

k = Index(D) = Σ_n sign(d_n - ⟨d⟩_local)

Piece 04 derives the bulk-boundary correspondence explicitly.