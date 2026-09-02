# A1-15: Worldline Geodesic Equation — Piece 06
## Self-Intersection Geodesics: Closed Worldline Segments

From A1-11, the electron worldline self-intersects at points where γ(τₙ) = γ(τₘ) for n ≠ m. These are Type I–V recurrences in the prime gap sequence. At a self-intersection, the geodesic equation must satisfy matching conditions for the four-velocity.

Consider a self-intersection between segment n and segment m. The worldline coordinates satisfy:
x^μₙ = x^μₘ

The geodesic equation on each segment is governed by the local gap values dₙ and dₘ. The four-velocities are:
u^μₙ = Δx^μₙ / (κ dₙ),  u^μₘ = Δx^μₘ / (κ dₘ)

At the intersection point, the tangent vectors need not be equal — the worldline can cross itself at an angle. However, the proper time is continuous: τₙ = τₘ at the intersection event.

The geodesic deviation between the two segments is governed by the relative acceleration:
a^μ_rel = a^μₙ − a^μₘ = −(Γ^μ_αβ|ₙ u^αₙ u^βₙ − Γ^μ_αβ|ₘ u^αₘ u^βₘ)

Since the Christoffel symbols depend on Δ log Ω/Δτ, and Ω depends on the local gap correlation, the difference in accelerations is:
a^μ_rel ∝ (Δ log Ωₙ / Δτₙ − Δ log Ωₘ / Δτₘ)

For Type I recurrences (exact gap match: dₙ = dₘ), the local geometry is identical and a^μ_rel = 0 — the segments are parallel geodesics. For Type II–V (approximate or structural recurrences), a^μ_rel ≠ 0 and the segments cross at a non-zero angle.

**Geodesic junction conditions at self-intersections:**
The Israel junction conditions (A1-14 Piece 10) apply at book boundaries, but self-intersections within a book are different. They are points where the discrete geodesic flow maps to itself under the gap recurrence map.

Define the recurrence map R: τₙ → τₘ such that x^μ(τₙ) = x^μ(τₘ). The geodesic equation implies:
u^μₘ = (dₙ/dₘ) u^μₙ + O(Δ log Ω)

For dₙ ≈ dₘ, u^μₘ ≈ u^μₙ — the geodesic is approximately periodic at the recurrence.

**Winding number quantization:**
From A1-02, the topological winding number is Q = (1/2π) ∮ dτ dθ/dτ. For a self-intersection loop from τₙ to τₘ:
Qₙₘ = (1/2π) ∑_{k=n}^{m-1} Δθₖ

where Δθₖ is the angle change per step. From the spatial geodesic equation:
Δv^i / v^i = −Δ log Ω

Integrating around the loop:
log(v^iₘ / v^iₙ) = −∮ d log Ω = −log(Ωₘ/Ωₙ)

Thus v^iₘ = v^iₙ (Ωₙ/Ωₘ). For exact recurrence Ωₙ = Ωₘ, the velocity is unchanged — the geodesic closes consistently.

This provides a consistency condition: only self-intersections with matching local conformal factors (or compensating velocity rescaling) are stable geodesic configurations. This selects preferred recurrence types from the prime gap statistics.