# A1-18: Worldline Path Integral — Piece 02
## Discrete Path Integral and Propagator

The discrete path integral for the Prime Electron can be evaluated exactly for the quadratic action. The propagator from (x_0, τ_0) to (x_N, τ_N) is:
K(x_N, τ_N; x_0, τ_0) = ∫ D[x] exp(i S[x]/ℏ)
with S = Σ_{n=0}^{N-1} (m_e c/2) d_n Ω_n η_μν (x^u_{n+1} - x^u_n)(x^v_{n+1} - x^v_n)/d_n

For constant Ω_n = 1 (flat space), this is a product of Gaussian integrals. The result is:
K_0(x_N, x_0; N) = (m_e c/2π i ℏ)^{2N} Π_n d_n^{-2} exp(i m_e c/2ℏ Σ_n η_μν (Δx^u_n Δx^v_n)/d_n)

For the full sequence with varying d_n and Ω_n, the path integral can be computed by completing the square. The classical path satisfies the discrete geodesic equation from A1-15:
(x^u_{n+1} - 2x^u_n + x^u_{n-1})/d_n² + Γ^u_{vρ} v^v_n v^ρ_n = 0

The propagator is:
K = K_0 exp(i S_cl/ℏ)
where S_cl is the classical action evaluated on the geodesic.

The path integral measure includes the Van Vleck determinant:
D[x] = Π_n d⁴x_n det(∂²S/∂x^u_n ∂x^v_n)^{1/2}

For the conformal metric g_μν = Ω² η_μν, the Van Vleck determinant is:
det = Π_n (Ω_n Ω_{n+1})^{d/2} d_n^{-d} (1 + O(R))
where d=4 is the spacetime dimension and R is the curvature.

The discrete propagator in momentum space is:
K(p, p'; N) = ∫ d⁴x_N d⁴x_0 e^{-i p·x_N + i p'·x_0} K(x_N, x_0; N)
= Π_n (m_e c d_n/2π i ℏ)^{d/2} Ω_n^{-d/2} exp(-i ℏ/(2 m_e c) Σ_n d_n/Ω_n (p_n - p_{n+1})²)
where p_n are intermediate momenta.

The sum over all paths gives the full quantum amplitude. The self-interaction vertices from A1-16 Piece 05 are included by expanding the exponential of the interaction action.