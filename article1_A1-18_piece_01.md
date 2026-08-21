# A1-18: Worldline Path Integral — Piece 01
## Introduction: Path Integral from Prime Gap Action

The path integral formulation of the Prime Electron worldline follows from the action principle in A1-16. The quantum amplitude for the worldline to propagate from proper time τ_i to τ_f is:
Z = ∫ D[x] exp(i S[x]/ℏ)
where the measure D[x] = Π_n d⁴x_n integrates over all intermediate positions x_1...x_{N-1} for fixed endpoints x_0, x_N.

The action S = Σ_n L_n with L_n = (m_e c/2) d_n Ω_n η_μν v^u_n v^v_n from A1-16 Piece 02. The path integral becomes:
Z = ∫ Π_n d⁴x_n exp(i/ℏ Σ_n (m_e c/2) d_n Ω_n η_μν (x^u_{n+1} - x^u_n)(x^v_{n+1} - x^v_n)/d_n²)
= ∫ Π_n d⁴x_n exp(i m_e c/2ℏ Σ_n Ω_n η_μν (Δx^u_n Δx^v_n)/d_n)

This is a discrete Gaussian path integral with gap-dependent conformal factors Ω_n = √(1 + λ C(d_n)). The prime gaps d_n = p_{n+1} - p_n provide the fundamental discretization scale.

For the free theory (λ = 0, Ω = 1), the integral is exactly solvable:
Z_0 = ∫ Π_n d⁴x_n exp(i m_e c/2ℏ Σ_n η_μν (Δx^u_n Δx^v_n)/d_n)
The propagator is the standard relativistic particle propagator in discrete proper time.

With λ ≠ 0, the Ω_n factors introduce correlations through the gap correlation function C(d_n, d_m). The path integral computes:
Z = Z_0 ⟨exp(i m_e c λ/2ℏ Σ_n C(d_n) η_μν Δx^u_n Δx^v_n/d_n)⟩_0

The correlation function C(d_n) has Fourier transform encoding the Riemann zeta zeros (from A1-04):
C̃(k) = Σ_n C(d_n) e^{i k τ_n} = Σ_n C(d_n) e^{i k κ(p_{n+1} - 2)}
The zeta zero resonances γ_n appear as poles in the path integral kernel.

The total number of steps is N = 3.67×10⁹ (directory 3.0 complete). The path integral sums over all worldline histories with this fixed number of steps. The 3500 books from A1-10 correspond to 3500 independent path integral segments that must be joined at the book boundaries.