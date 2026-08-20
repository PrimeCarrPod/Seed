# A1-17: Worldline Hamiltonian — Piece 05
## Self-Adjointness and Domain of the Hamiltonian

The Hamiltonian H = hbar/kappa Sum_n d_n^{-1} |n><n| is a diagonal operator in the proper time basis. Its self-adjointness is determined by the behavior of the eigenvalues at the boundaries of the spectrum.

The eigenvalues are E_n = hbar/(kappa d_n) = m_e c^2/d_n. Since d_n >= 2 (minimum gap is 2 for twin primes), the eigenvalues are bounded above by:
E_max = m_e c^2/2 = 0.2555 MeV

As d_n grows, E_n -> 0. The maximum gap in the UV-complete directory 3.0 is finite (bounded by the prime number theorem: d_n < p_n^0.525 for large n). The maximum gap in 3.67 billion gaps is approximately d_max ~ log^2 p_N ~ 25^2 ~ 625. So:
E_min ~ m_e c^2/625 ~ 0.82 keV

Thus the Hamiltonian has a bounded spectrum: 0.82 keV <= E_n <= 0.2555 MeV. The operator is bounded and therefore self-adjoint on the full Hilbert space H = l^2(N) where N = 3.67e9 is the number of gaps.

The domain of H is the full Hilbert space since H is a bounded operator:
||H|| = sup_n |E_n| = m_e c^2/2 < infinity

The resolvent (H - z)^{-1} exists for all z not in the spectrum [E_min, E_max]. The spectral measure is:
d mu(E) = Sum_n delta(E - E_n) dE

The Hilbert space of the Prime Electron worldline is H = C^N with N = 3.67e9 (or the infinite-dimensional limit). The Hamiltonian acts as multiplication by the sequence {E_n}.

The time evolution is unitary:
U(t) = exp(-i H t/hbar) = Sum_n exp(-i E_n t/hbar) |n><n|
with |U(t)| = 1 for all t.

The boundedness of H has physical implications. The proper energy of the electron worldline is bounded above by m_e c^2/2 (half the rest energy). This is a consequence of the minimum prime gap d=2. The maximum proper energy corresponds to the minimum proper time step Delta tau_min = 2 kappa ~ 2.576e-21 s.

The UV cutoff at directory 3.0 (3500 books * 2^20 gaps) provides a natural IR cutoff on the proper energy (minimum energy ~ 0.82 keV). The full theory would require the infinite gap sequence, where d_n can be arbitrarily large (though with decreasing frequency), giving E_n -> 0.

The self-adjoint extension problem is trivial here since H is bounded. However, if we consider the inverse Hamiltonian H^{-1} = kappa/hbar Sum_n d_n |n><n|, this is unbounded (d_n grows without bound). The inverse Hamiltonian generates evolution in the conjugate variable to proper time (which is related to the phase of the worldline wavefunction).