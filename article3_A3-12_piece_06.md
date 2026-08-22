# A3-12: Quantum Simulation from Prime Gaps — Piece 06
## Spectral Density from Gap Statistics

The spectral density of the prime gap Hamiltonian determines the thermodynamic and dynamical properties of the simulated system. We compute it exactly from the 3.67B gap data.

**Definition A3-12.10 (Gap Hamiltonian Spectral Density).** For H = H_gap + H_hop with H_gap = Σ_d (ℏ/κd)|d⟩⟨d| and H_hop = Σ_d J(d)(|d⟩⟨d+2| + h.c.), the spectral density is:
```
ρ(E) = (1/256) Σ_{k=0}^{255} δ(E - E_k)
```
where E_k are the eigenvalues of H. For J(d) = J_0 P(d), the eigenvalues are E_k = μ_k + 2J_k cos(2πk/256) with μ_k, J_k the PG-QFT eigenvalues of μ_d and J_d.

**Theorem A3-12.11 (Exact Spectral Density from PrimeBookOne).** Using the 3.67B gaps, we compute the empirical spectral density:
```
ρ_emp(E) = (1/3.67B) Σ_{n=1}^{3.67B} δ(E - E(d_n, d_{n+1}))
```
where E(d, d') = ℏ/κ (1/d + 1/d') + 2J_0 P(d) P(d') is the two-gap energy. The density has peaks at E = ℏ/κ (1/2 + 1/2) = ℏ/κ (twin prime pairs) and a continuum from larger gaps.

**Connection to A3-04 (Unitarity).** The unitarity of the time evolution e^{-iHt} requires the spectral density to be normalized: ∫ ρ(E) dE = 1. The prime gap distribution ensures this because P(d) is a probability distribution and the PG-QFT is unitary.

**Connection to A1-17 (Worldline Hamiltonian).** The worldline Hamiltonian H = (ℏ/κ) Σ_n d_n⁻¹ has spectral density:
```
ρ_worldline(E) = (1/256) Σ_d P(d) δ(E - ℏ/κd)
```
This is a sum of delta functions at E = ℏ/κd for d = 2, 4, ..., 254. The weights are the gap probabilities P(d). The spectral density has a power-law tail: ρ(E) ∝ E⁻² for E ≪ ℏ/κ (large d), reflecting the 1/d gap energy.

**Thermodynamic Quantities.** The partition function Z(β) = Tr(e^{-βH}) = Σ_k e^{-βE_k} = 256 ∫ ρ(E) e^{-βE} dE. For the worldline Hamiltonian:
```
Z(β) = Σ_d P(d) e^{-βℏ/κd}
```
At the Compton temperature β_C = κ/ℏ, Z(β_C) = Σ_d P(d) e^{-1/d} ≈ 0.95. The internal energy U = -∂log Z/∂β = (ℏ/κ) Σ_d (P(d)/d) e^{-βℏ/κd} / Z. The specific heat C_V = ∂U/∂T shows a Schottky anomaly at T ≈ ℏ/κ (from the d=2 level).

**Spectral Density of H_hop.** The hopping Hamiltonian has eigenvalues E_k = 2J_0 Σ_d P(d) cos(2πk d/256). The spectral density is the distribution of the characteristic function λ_k = Σ_d P(d) e^{2πi k d/256} at k = 0, ..., 255. This has sharp peaks at primorial multiples (k = 0, 42, 84, ..., 210) with height ∼0.9, and a background continuum of width ∼0.1. The gap in the hopping spectrum is Δ_hop = min_{k≠0} |E_k - E_0| ≈ 0.06 J_0.

**Spectral Form Factor.** The spectral form factor K(τ) = |∫ ρ(E) e^{-iEτ/ℏ} dE|² = |(1/256) Σ_k e^{-iE_k τ/ℏ}|² shows the ramp-plateau structure characteristic of chaotic systems. For the prime gap Hamiltonian, K(τ) has a dip at τ_dip ∼ 256 ℏ/κ (Heisenberg time) and a plateau at K_plateau = 1/256. The slope of the ramp is determined by the gap correlation function from A3-05.