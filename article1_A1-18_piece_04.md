# A1-18: Worldline Path Integral — Piece 04
## Euclidean Path Integral and Proper Time Quantization

The Euclidean path integral is obtained by Wick rotation τ → -i τ_E. The Euclidean action is:
S_E = Σ_n (m_e c/2) d_n Ω_n δ_μν v^u_n v^v_n
where δ_μν is the Euclidean metric.

The Euclidean propagator is:
K_E(x_N, τ_E; x_0, 0) = ∫ D[x] exp(-S_E[x]/ℏ)

For the conformal metric g_μν = Ω² δ_μν, the Euclidean action is:
S_E = (m_e c/2) Σ_n d_n Ω_n δ_μν (x^u_{n+1} - x^u_n)(x^v_{n+1} - x^v_n)/d_n²

The Euclidean path integral computes the partition function at inverse temperature β = τ_E:
Z(β) = Tr(exp(-β H)) = ∫ dx K_E(x, β; x, 0)
This matches the partition function from A1-17 Piece 08:
Z(β) = Σ_n exp(-β m_e c²/d_n)

The proper time quantization from A1-01 (Δτ_n = κ d_n) appears naturally in the path integral. The Euclidean proper time steps are Δτ_{E,n} = κ d_n. The total Euclidean proper time is:
β = Σ_n κ d_n = κ (p_N - 2)

For the full UV sequence, β = κ p_N ~ 1.288e-21 × 8e10 ~ 10⁻¹⁰ s. This is the total Euclidean proper time extent of the worldline.

The path integral with periodic boundary conditions x(β) = x(0) computes the thermal partition function. The eigenvalues of the Hamiltonian are E_n = m_e c²/d_n, giving:
Z(β) = Σ_n exp(-β E_n) = Σ_n exp(-κ β m_e c²/d_n)

For β = κ Σ_m d_m, this becomes:
Z = Σ_n exp(-(Σ_m d_m)/d_n)
which is a purely number-theoretic sum over prime gaps.

The Euclidean path integral also computes instanton contributions (A1-19). The instantons are solutions to the Euclidean equations of motion with finite action. The instanton action is:
S_inst = (m_e c/2) Σ_n d_n Ω_n v²
For a trajectory interpolating between gap classes, this gives the tunneling amplitude.

The proper time quantization implies that the path integral is a sum over discrete proper time steps, not a continuum integral. The measure is:
D[x] = Π_n d⁴x_n
with N = 3.67e9 steps. This is a finite-dimensional integral that can be evaluated numerically from PrimeBookOne data.