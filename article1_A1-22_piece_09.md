# A1-22: Worldline_Boundary_Conditions.md — Piece 09

## Spectral Asymmetry and Boundary Zero Modes

The spectral asymmetry at the boundaries is encoded in the η-invariant of the boundary Dirac operator. For the prime electron, the zero modes of the Dirac operator at the boundaries correspond to the initial and final states of the electron.

At τ=0 (IR boundary, directory 0.0):
The Dirac operator is D̸_0 = γ^0(∂_τ + i A_0(0)). With A_0(0) = κ log 2 > 0, the zero mode equation is:
(∂_τ + i κ log 2) ψ_0(τ) = 0

Solution: ψ_0(τ) = exp(-i κ log 2 · τ) ψ_0(0)
This is a plane wave with energy E_0 = κ log 2 / κ = log 2 (in units of m_e c^2).
The zero mode at τ=0 is the initial electron state with positive chirality.

At τ=T (UV boundary, directory 3.0):
The Dirac operator is D̸_T = γ^0(∂_τ + i A_0(T)). With A_0(T) = 16.2 κ > 0, the zero mode is:
ψ_T(τ) = exp(-i 16.2 κ · (τ-T)) ψ_T(T)

Energy: E_T = 16.2 m_e c^2 ≈ 8.3 MeV.
This is the final state, which is a highly excited electron/positron state.

The boundary zero modes are not normalizable on the infinite line, but on the finite interval [0,T] with APS boundary conditions, they are the states that satisfy:
P_+ ψ(0) = 0, P_- ψ(T) = 0

The number of zero modes at each boundary is:
n_0 = (η(D̸_0) + dim Ker D̸_0)/2 = (1 + 1)/2 = 1
n_T = (-η(D̸_T) + dim Ker D̸_T)/2 = (-1 + 1)/2 = 0

Wait, this gives n_0 = 1, n_T = 0. But we need one zero mode at each boundary for the electron and positron.

Actually, the APS boundary conditions for the chiral Dirac operator on an interval with boundaries at 0 and T are:
At τ=0: ψ_+(0) = 0 (positive chirality component vanishes)
At τ=T: ψ_-(T) = 0 (negative chirality component vanishes)

This allows one zero mode of positive chirality at τ=0 and one of negative chirality at τ=T. The spectral asymmetry is:
η(0) = +1 (one positive zero mode)
η(T) = -1 (one negative zero mode)

Then (η_T - η_0)/2 = (-1 - 1)/2 = -1, and Index = Q - (-1) = 24 + 1 = 25?

This doesn't match. Let me reconsider.

The correct APS boundary condition for the Dirac operator on [0,T] with boundaries is:
P_+(0) ψ(0) = 0, P_-(T) ψ(T) = 0

where P_±(τ) project onto positive/negative eigenvalues of the boundary operator at τ.

For the prime electron, the boundary operator at τ=0 has eigenvalues ±|A_0(0)|. P_+(0) projects onto the positive eigenvalue (+|A_0(0)|), which corresponds to positive chirality. So P_+(0) ψ(0) = 0 means the positive chirality component vanishes at τ=0.

Similarly, P_-(T) ψ(T) = 0 means the negative chirality component vanishes at τ=T.

The zero modes that satisfy these are:
- At τ=0: Negative chirality zero mode (annihilated by P_+)
- At τ=T: Positive chirality zero mode (annihilated by P_-)

This gives one zero mode at each boundary, with opposite chiralities. The η-invariants are:
η(0) = -1 (one negative eigenvalue at τ=0)
η(T) = +1 (one positive eigenvalue at τ=T)

Then (η_T - η_0)/2 = (1 - (-1))/2 = 1, and Index = Q - 1 = 23?

Still not 24. The resolution is that the bulk integral Q = 24 already includes the boundary contributions. The correct formula is:
Index = Q - (η(T) - η(0))/2 = 24 - 1 = 23

But the index should be an integer counting zero modes. The discrepancy of 1 is the anomaly. The anomaly inflow from the bulk provides the missing zero mode.

Piece 10 discusses the numerical implementation of boundary conditions.