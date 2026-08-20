# A1-17: Worldline Hamiltonian — Piece 03
## Connection to A1-16 Action Principle

The Hamiltonian derived here must be consistent with the Hamiltonian formulation of A1-16. From A1-16 Piece 04, the classical Hamiltonian for step n is:
H_n = -(m_e c^3/2) d_n Omega_n
with Omega_n = sqrt(1 + lambda C(d_n)).

In the limit lambda -> 0 (flat metric), Omega_n = 1, and:
H_n = -(m_e c^3/2) d_n

The total classical Hamiltonian is:
H_classical = Sum_n H_n = -(m_e c^3/2) Sum_n d_n

However, the quantum Hamiltonian from the proper time operator is:
H_quantum = Sum_n hbar/(kappa d_n) = m_e c^2 Sum_n 1/d_n

These are not the same operator. The resolution is that H_classical is the Hamiltonian generating evolution in the coordinate time (or an affine parameter), while H_quantum generates evolution in the proper time tau itself.

The relationship between the two Hamiltonians comes from the mass-shell constraint. In the conformal metric g_{mu nu} = Omega^2 eta_{mu nu}, the mass-shell condition is:
g^{mu nu} p_mu p_nu = -m_e^2 c^2
=> Omega^{-2} eta^{mu nu} p_mu p_nu = -m_e^2 c^2
=> eta^{mu nu} p_mu p_nu = -m_e^2 c^2 Omega^2

The canonical Hamiltonian from the action S = Integral dtau [p_u x^u - H] satisfies H = p_0 (the energy conjugate to coordinate time). The proper time Hamiltonian is the operator conjugate to tau.

From the discrete geodesic equation in A1-15, the proper time evolution of the four-momentum is:
p_u^{n+1} - p_u^n = -d_n partial_u H_n
where H_n = (m_e c/2) d_n Omega_n v^2.

The quantum Hamiltonian H_quantum = hbar/kappa Sum d_n^{-1} is the generator of proper time translations in the Hilbert space of worldline states. Its eigenvalues give the proper energy spectrum.

The classical limit of H_quantum is obtained by taking expectation values in coherent states peaked on classical trajectories. For a classical trajectory with gaps d_n, the expectation value is:
<n|H_quantum|n> = hbar/(kappa d_n) = m_e c^2/d_n

This matches the classical proper energy E_proper = m_e c^2/d_n (since dtau = kappa d_n, and E = dS/dtau = m_e c^2/d_n).

The sum over all steps gives the total proper energy:
E_total = Sum_n m_e c^2/d_n
which is the same as the quantum Hamiltonian eigenvalue for the full worldline state.