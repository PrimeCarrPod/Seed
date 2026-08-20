# A1-18: Worldline Path Integral — Piece 11
## Quantum Entanglement and Entropy from Path Integral

The path integral formulation allows computation of entanglement entropy between worldline segments. For a bipartition of the worldline into regions A and B, the reduced density matrix is:
ρ_A = Tr_B |Ψ⟩⟨Ψ|
where |Ψ⟩ = ∫ D[x] exp(i S[x]/ℏ) |x⟩ is the path integral state.

The entanglement entropy is:
S_A = -Tr(ρ_A log ρ_A) = -∂_n Tr(ρ_A^n) |_{n=1}

In the replica trick, Tr(ρ_A^n) is computed by a path integral on an n-sheeted Riemann surface. For the discrete worldline, this corresponds to n copies of the worldline joined cyclically along region A.

The entanglement entropy from prime gaps is:
S_A = Σ_{n in A} f(d_n)
where f(d) is a function of the gap size. For small gaps (twin primes), f(2) is large. For large gaps, f(d) is small.

The total entanglement entropy for a book (segment) is:
S_book = Σ_{n=1}^{M} f(d_n)
For M = 2²⁰, this is a sum over 1 million gaps.

The Renyi entropies are:
S_n = (1/(1-n)) log Tr(ρ_A^n)
= (1/(1-n)) log Z_n / Z_1^n
where Z_n is the partition function on the n-sheeted geometry.

The modular Hamiltonian K_A = -log ρ_A is:
K_A = Σ_{n in A} K(d_n)
where K(d) = -log(exp(-β m_e c²/d)) = β m_e c²/d

The relative entropy between two gap distributions ρ and σ is:
S(ρ||σ) = Tr(ρ log ρ - ρ log σ)
= Σ_n [f(d_n) log f(d_n) - f(d_n) log g(d_n)]
where f(d) and g(d) are the gap distributions for the two states.

These entanglement quantities will be developed further in A1-31 through A1-34.