# A1-18: Worldline Path Integral — Piece 06
## Book Structure and Segment Joining

From A1-10, the 3500 books in directory 3.0 correspond to 3500 worldline segments. Each book has M = 2²⁰ = 1,048,576 gaps. The path integral for the full worldline is a product of segment path integrals joined at the boundaries.

For book b (b = 1,...,3500), the segment action is:
S_b = Σ_{n=(b-1)M+1}^{bM} (m_e c/2) d_n Ω_n η_μν (Δx^u_n Δx^v_n)/d_n

The segment propagator is:
K_b(x_{bM}, x_{(b-1)M}) = ∫ D[x] exp(i S_b/ℏ)

The full propagator is the product over books:
K_full = K_{3500} ∘ K_{3499} ∘ ... ∘ K_1
where ∘ denotes composition (integration over intermediate boundary points).

The boundary conditions at book junctions are:
x_{bM} = x_{(b+1)M} for b = 1,...,3499
with x_0 and x_{3500M} fixed.

The composition of propagators gives:
K_full(x_f, x_i) = ∫ Π_{b=1}^{3499} d⁴x_{bM} Π_{b=1}^{3500} K_b(x_{bM}, x_{(b-1)M})

This is a path integral over 3500 segments with 3499 internal boundaries. Each boundary integration enforces continuity of the worldline.

The book structure provides a natural UV/IR decomposition. The IR physics (long-distance) is captured by the first few books (small prime gaps). The UV physics (short-distance) is captured by the later books (large prime gaps).

The running of couplings with book number is:
α(b) = α_0 / Ω_b²
where Ω_b is the conformal factor for book b. This matches the QED running coupling.

The PrimeBookOne directory structure (0.0, 1.0, 2.0, 3.0) corresponds to different levels of coarse-graining:
- Directory 0.0: 189 tiles × 500 gaps = 94,500 gaps (books 1-90 approximately)
- Directory 1.0: 189 tiles × 500 gaps = 94,500 gaps (next scale)
- Directory 2.0: 189 tiles × 500 gaps = 94,500 gaps (next scale)
- Directory 3.0: 3500 books × 2²⁰ gaps = 3.67e9 gaps (complete UV)

The path integral at each directory level is a coarse-grained version of the full path integral. The convergence as directory level increases is a test of the framework.