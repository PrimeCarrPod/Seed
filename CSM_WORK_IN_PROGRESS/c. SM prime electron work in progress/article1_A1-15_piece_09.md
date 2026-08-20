# A1-15: Worldline Geodesic Equation — Piece 09
## Geodesics in the 3500-Book Structure: Segment-to-Segment Matching

From A1-10, the worldline comprises 3500 segments (books), each containing M = 2²⁰ = 1,048,576 steps. From A1-14 Piece 10, book boundaries are metric junctions with Israel junction conditions. The geodesic equation must be solved within each book and matched across boundaries.

**Within a book (interior):** The gap sequence is homogeneous (same statistical distribution). The conformal factor Ω(τ) varies slowly. The geodesic equation from Piece 03 applies with approximately constant Δ log Ω/Δτ within the book.

Let book b have gap sequence {d^{(b)}_n} for n = 1...M. The proper time within the book is:
τ^{(b)}_n = τ^{(b)}_0 + κ ∑_{k=1}^n d^{(b)}_k

The geodesic solution within book b is:
x^μ(τ) = x^μ(τ^{(b)}_0) + ∫_{τ^{(b)}_0}^τ u^μ(τ') dτ'

With u^μ determined by the geodesic equation. For a comoving electron, u^i = 0, u⁰ = 1/Ω(τ). The trajectory is purely temporal:
x⁰(τ) = x⁰(τ^{(b)}_0) + ∫_{τ^{(b)}_0}^τ dτ'/Ω(τ')

**At book boundary b → b+1:** The metric has a jump in derivatives (A1-14 Piece 10). The Israel junction conditions require:
1. Continuity of the metric: g_μν|_b = g_μν|_{b+1} at the boundary
2. Discontinuity in extrinsic curvature: [K_μν] = −8πG S_μν

where S_μν is the surface stress-energy at the boundary.

For the geodesic, the four-velocity must satisfy the junction condition:
u^μ|_{b+1} = u^μ|_b + Δu^μ

where Δu^μ is determined by the boundary stress-energy. The proper time is continuous: τ^{(b)}_M = τ^{(b+1)}_0.

The change in four-velocity across the boundary is:
Δu^μ = −½ g^μα ([K_αβ] + [K] g_αβ) u^α u^β + O(ΔK²)

Since the boundary separates books with different gap statistics (different directories), the conformal factor has a kink. The extrinsic curvature jump is proportional to the difference in gap correlation functions between directories.

**PrimeBookOne directory structure:**
- Directory 0.0: 189 tiles, 500 diffs/tile = 94,500 gaps (IR, books 1–189)
- Directory 1.0: 189 tiles, 500 diffs/tile = 94,500 gaps (books 190–378)
- Directory 2.0: 189 tiles, 500 diffs/tile = 94,500 gaps (books 379–567)
- Directory 3.0: 3500 books, 2²⁰ diffs/book = 3.67B gaps (UV complete)

The geodesic evolves through all 3500 books. The directory transitions (every 189 books) are major junctions where the gap statistics change character. The geodesic experiences "refraction" at these boundaries, with the four-velocity direction changing according to the jump in Δ log Ω.

**Total worldline proper time:**
τ_total = κ ∑_{b=1}^{3500} ∑_{n=1}^{2²⁰} d^{(b)}_n = κ × 3.67×10⁹ ⟨d⟩

This is the complete geodesic from IR to UV, solving the discrete geodesic equation across all PrimeBookOne data.