# A1-17: Worldline Hamiltonian — Piece 04
## Hamiltonian in Momentum Space and Prime Zeta Function

The Hamiltonian can be expressed in terms of the prime zeta function. The prime zeta function is:
P(s) = Sum_{p prime} p^{-s}

Our Hamiltonian involves sums over inverse gaps d_n = p_{n+1} - p_n, not inverse primes. However, the gap distribution is related to the prime distribution. The sum over inverse gaps can be expressed as:
Sum_n d_n^{-1} = Sum_n (p_{n+1} - p_n)^{-1}

This sum is related to the difference of the prime zeta function at different arguments. Using the mean value theorem:
(p_{n+1} - p_n)^{-1} = (p_{n+1}^s - p_n^s)/(s xi^{s-1} (p_{n+1} - p_n))
for some xi in (p_n, p_{n+1}) and s -> 0 limit.

More directly, the generating function for the gap distribution is:
G(z) = Sum_n z^{d_n}

The Hamiltonian eigenvalues are derivatives of this at z=1. The spectral zeta function of the Hamiltonian is:
zeta_H(s) = Tr(H^{-s}) = Sum_n (hbar/(kappa d_n))^{-s} = (kappa/hbar)^s Sum_n d_n^s

For s = -1, zeta_H(-1) = (hbar/kappa) Sum_n 1/d_n = Tr(H).

The sum Sum_n d_n^s for various s encodes the moments of the gap distribution:
- s = 1: Sum_n d_n = p_N ~ N log N (total proper time)
- s = -1: Sum_n 1/d_n ~ N/log N (total proper energy)
- s = -2: Sum_n 1/d_n^2 ~ N/log^2 N (related to energy variance)

These sums can be evaluated numerically from PrimeBookOne data. For directory 0.0 (94,500 gaps):
Sum 1/d_n ~ 94500/log(10^6) ~ 94500/13.8 ~ 6850
Sum 1/d_n^2 ~ 94500/13.8^2 ~ 496

The Hamiltonian in the momentum basis (Fourier transform over the worldline) has matrix elements:
H(p, p') = (m_e c^2) Sum_n (1/d_n) e^{i(p-p') tau_n}
where tau_n = kappa(p_{n+1} - 2).

This is a Toeplitz-like matrix with entries determined by the gap sequence. The spectral properties of this matrix are related to the Riemann zeta function through the connection established in A1-04 (Riemann zeros as worldline resonance frequencies).

The Riemann zeta function zeros gamma_n appear as poles in the spectral zeta function of the worldline. The connection is:
zeta_H(s) = (kappa/hbar)^s Sum_n d_n^s = (kappa/hbar)^s * (1/2) Sum_{rho} Gamma(rho) * ... 
where the sum is over Riemann zeros rho = 1/2 + i gamma_n.

This will be developed further in A1-18 (Path Integral) and A1-19 (Instantons).