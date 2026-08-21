# A1-17: Worldline Hamiltonian — Piece 02
## Spectral Decomposition and Gap Statistics

The Hamiltonian H = (m_e c^2) Sum_n 1/d_n has a spectrum determined entirely by the prime gap distribution. The eigenvalues are sums of inverse gaps. For a worldline segment of M steps from n=a to n=a+M-1:
E(a, M) = m_e c^2 Sum_{k=a}^{a+M-1} 1/d_k

The density of states rho(E) is the distribution of these sums over all starting positions a and lengths M. This is a combinatorial problem on the prime gap sequence.

From the Prime Number Theorem, the average gap is <d> ~ log p. The harmonic sum of gaps over N steps is:
Sum_{n=1}^N 1/d_n ~ N/log p_N
For the full UV sequence with N = 3.67e9 gaps, p_N ~ N log N ~ 8e10, so log p_N ~ 25. The total energy is:
E_total ~ m_e c^2 * 3.67e9 / 25 ~ 1.5e8 m_e c^2 ~ 7.7e13 eV

The low-energy spectrum is dominated by small gaps. Twin primes (d=2) contribute m_e c^2/2 each. The twin prime density is ~ 2 C_2 x/log^2 x where C_2 = 0.66016 is the twin prime constant. The number of twin primes up to p_N is ~ 2 C_2 p_N/log^2 p_N ~ 1e8. Their total energy contribution is ~ 5e7 m_e c^2.

Gaps d=4 (cousin primes) contribute m_e c^2/4 each. Gap d=6 (sexy primes) contribute m_e c^2/6. The energy spectrum thus encodes the prime k-tuple distribution.

The spectral density can be computed from the PrimeBookOne data. For directory 0.0 (94,500 gaps, p ~ 10^6), the histogram of 1/d values shows peaks at 1/2, 1/4, 1/6, 1/8, etc., corresponding to the gap values. The envelope follows the gap frequency distribution.

The Hamiltonian matrix in the proper time basis is diagonal:
<m|H|n> = delta_{mn} hbar/(kappa d_n) = delta_{mn} m_e c^2/d_n

The time evolution operator is:
U(Delta tau) = exp(-i H Delta tau/hbar) = exp(-i Sum_n (Delta tau/kappa d_n) |n><n|)
For a proper time step Delta tau = kappa d_m, U(kappa d_m) = exp(-i d_m/d_n) |n><n|.

The return amplitude (propagator) from n to m is:
<m|U(tau)|n> = delta_{mn} exp(-i tau/(kappa d_n))
This shows that each proper time eigenstate evolves with its own frequency omega_n = 1/(kappa d_n).