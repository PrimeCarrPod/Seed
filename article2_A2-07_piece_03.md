# A2-07: Beta Function from Prime Gap Density

The RG beta function for the mass ratio r(μ) = m(μ)/mₑ is derived from the worldline action. From A1-16, A1-17: the Hamiltonian H = ℏ/κ Σ d_n⁻¹. The scale dependence enters through the gap sequence available at scale μ.

At scale μ (corresponding to proper time τ ~ 1/μ), the worldline has accessed gaps up to d_max ~ κμ. The number of record gaps available is N(μ) = max{n : p_n ≤ μ}. The effective Hamiltonian:
H(μ) = ℏ/κ Σ_{i=1}^{N(μ)} d_i⁻¹

The running mass is the eigenvalue of H(μ):
m(μ)/mₑ = Σ_{i=1}^{N(μ)} d_i⁻¹ / d₁⁻¹ = Σ_{i=1}^{N(μ)} 2/d_i

This gives a step function that increases at each record prime. The continuous RG equation comes from smoothing the step function.

Beta function:
β(r) = d(log r)/d(log μ) = (μ/r) · dr/dμ

For μ between record primes, dr/dμ = 0 (no new gaps). At μ = p_n, r jumps by Δr_n = 2/d_n.

The smoothed beta function replaces the step function with a continuous approximation using the prime density:
dr/dμ ≈ (2/d(μ)) · (dN/dμ) = (2/d(μ)) · π'(μ) = 2π'(μ)/d(μ)

Since d(μ) ~ log μ and π'(μ) ~ 1/log μ, we get:
β(r) ≈ (μ/r) · 2/(log μ)²

More precisely, using the exact record gap sequence:
β(r) = (μ/r) Σ_n (2/d_n) δ(μ - p_n)

The continuous RG flow integrates this:
log r(μ) = Σ_{p_n ≤ μ} log(p_n/p_{n-1}) + log(d_n/d_{n-1}) + C

This matches the exact mass ratio formula from A2-03 Piece 07.