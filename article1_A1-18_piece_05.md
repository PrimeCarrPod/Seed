# A1-18: Worldline Path Integral — Piece 05
## Fermionic Path Integral and Spin

From A1-03, the Prime Electron has spin-1/2 from the double cover of SU(2). The fermionic degrees of freedom are incorporated via a Grassmann path integral.

The full action including fermions is:
S = S_B + S_F
where S_B = Σ_n (m_e c/2) d_n Ω_n η_μν v^u_n v^v_n is the bosonic action, and S_F is the fermionic action.

The fermionic action for a Dirac particle on the worldline is:
S_F = Σ_n (i/2) ψ^†_n γ^0 (ψ_{n+1} - ψ_n) - (i m_e c/2) d_n ψ^†_n ψ_n
where ψ_n are Grassmann-valued spinors.

In the 8-bit Hilbert space from A1-17 Piece 09, the fermions are 8-component spinors (256 states). The gamma matrices are 8×8.

The path integral over fermions gives a determinant:
∫ D[ψ, ψ†] exp(i S_F/ℏ) = det(i ∂_τ - m_e c)

In the discrete setting:
det(i (ψ_{n+1} - ψ_n)/d_n - m_e c ψ_n) = Π_n det(i/d_n - m_e c)
= Π_n (i - m_e c d_n)^8

The fermionic determinant modifies the bosonic partition function:
Z = Z_B Z_F = Σ_n exp(-β m_e c²/d_n) × Π_n (i - m_e c d_n)^8

The spin-statistics theorem is satisfied because the fermionic path integral gives a minus sign for loop diagrams with an odd number of fermion lines.

The supercharges from A1-17 Piece 11 act on the path integral:
Q = Σ_n ψ_n d_n
The supersymmetric path integral has equal numbers of bosonic and fermionic degrees of freedom at each step.

The index theorem (A1-24) relates the path integral to the topological charge:
Index = ∫ D[x] D[ψ] exp(i S/ℏ) = Σ_n sign(d_n)
This will be developed in A1-24.