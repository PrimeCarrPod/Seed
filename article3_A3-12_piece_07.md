# A3-12: Quantum Simulation from Prime Gaps — Piece 07
## Thermal State Preparation

Preparing thermal states of the prime gap Hamiltonian is essential for simulating finite-temperature physics and for quantum algorithms like quantum Metropolis sampling.

**Theorem A3-12.12 (Thermal State via PG-QFT).** The thermal state ρ_β = e^{-βH}/Z for H = H_gap + H_hop is prepared by:
1. Prepare the infinite-temperature state ρ_∞ = I/256
2. Apply the imaginary-time evolution e^{-βH/2} via the PG-QFT:
   ρ_β = V_{PG}^† diag(e^{-βE_k}) V_{PG} / Z
3. The diagonal gate diag(e^{-βE_k/2}) is implemented by the phase gradient technique on the PG-QFT basis.

**Algorithm A3-12.13 (Purification-based Thermal Preparation).**
1. Prepare two copies of the system: |Ψ⟩ = Σ_k |k⟩|k⟩ (maximally entangled)
2. Apply e^{-βH/2} on the first copy: (e^{-βH/2} ⊗ I)|Ψ⟩ = Σ_k e^{-βE_k/2} |k⟩|k⟩
3. The reduced state on the first copy is ρ_β = Σ_k (e^{-βE_k}/Z) |k⟩⟨k|
4. To measure observables, apply V_{PG} and measure in the computational basis

**Connection to A3-06 (Decoherence).** The decoherence process from A3-06 naturally thermalizes the system. The gap-biased noise channel N(ρ) = Σ_d P(d) X_d ρ X_d^† has the thermal state as its fixed point when β = log((1-p)/p) / (ℏ/κd). For p = 10⁻³, β ≈ 6.9 κ/ℏ, corresponding to T ≈ 0.14 T_C.

**Quantum Metropolis Sampling.** The quantum Metropolis algorithm (Temme et al. 2011) uses the prime gap distribution as the proposal distribution:
1. Current state |ψ⟩ with energy E
2. Propose new gap d' ∼ P(d) (sample from PrimeBookOne)
3. Compute energy difference ΔE = E(d') - E
4. Accept with probability min(1, e^{-βΔE})
5. The PG-QFT enables coherent implementation of the accept/reject step

**Thermal State of Fermionic System (Piece 02).** For the Fermi-Hubbard model, the thermal state is a Gaussian fermionic state characterized by the correlation matrix C_{dd'} = ⟨c_d^† c_{d'}⟩ = (e^{βH_FH} + I)⁻¹_{dd'}. This is prepared by:
1. Diagonalize H_FH via PG-QFT: H_FH = V_{PG}^† diag(ε_k) V_{PG}
2. Prepare occupation numbers n_k = 1/(e^{βε_k} + 1) via phase estimation
3. Apply V_{PG} to transform back to gap basis

**Experimental Thermal Preparation (Photonic).** On the photonic OAM processor (A3-10 Piece 11):
- The thermal state is prepared by mixing photon number states with probabilities given by the Bose-Einstein distribution n_q = 1/(e^{βω(q)} - 1) for phonons (Piece 03) or Fermi-Dirac for fermions
- The SLM encodes the occupation numbers as classical probabilities
- Photon counting then samples from the thermal distribution
- For β = κ/ℏ, the twin prime mode (d=2) has occupation n_2 = 1/(e^{1/2} + 1) ≈ 0.38 (fermion) or n_2 = 1/(e^{1/2} - 1) ≈ 1.54 (boson)

**Resource Estimate.** Preparing ρ_β for β = κ/ℏ on 256 modes:
- PG-QFT depth: 128
- Diagonal phase gate: 256 Z-rotations (depth 8)
- Total depth: 136 per purification step
- For ε = 10⁻³ accuracy in energy, need O(β²/ε) = O(10⁶) measurements
- Total runtime: 10⁶ × 136 × 50 ns = 6.8 seconds (superconducting) or 10⁶ × 2 ms = 2000 seconds (photonic, limited by SLM refresh)