# A1-17: Worldline Hamiltonian — Piece 01
## Introduction: Hamiltonian from Proper Time Operator

The Hamiltonian for the Prime Electron worldline emerges from the proper time operator τ̂ established in A1-12. The proper time eigenvalues are τₙ = κ(pₙ₊₁ − 2) with κ = ℏ/(mₑc²) ≈ 1.288×10⁻²¹ s. The conjugate momentum to proper time is the energy operator, and the Hamiltonian generates translations in proper time.

From the action principle in A1-16, the canonical Hamiltonian is:
H = Σₙ Hₙ = −(mₑc³/2) Σₙ dₙ Ωₙ
where dₙ = pₙ₊₁ − pₙ are prime gaps and Ωₙ = √(1 + λ C(dₙ)) is the conformal factor.

However, the fundamental Hamiltonian in the proper time representation is simpler. The proper time operator τ̂ has discrete spectrum {τₙ}. The evolution generator in proper time is the inverse of the proper time step:
Ĥ = ℏ/κ Σₙ dₙ⁻¹ |n⟩⟨n|
where |n⟩ are the proper time eigenstates τ̂|n⟩ = τₙ|n⟩.

This follows from the canonical commutation relation [τ̂, Ĥ] = iℏ in the discrete setting. The proper time step between adjacent eigenvalues is Δτₙ = τₙ₊₁ − τₙ = κ dₙ. The energy spacing is ΔEₙ = ℏ/Δτₙ = ℏ/(κ dₙ).

The total Hamiltonian is the sum over all 3.67 billion gaps in the UV-complete PrimeBookOne directory 3.0:
H = Σ_{n=1}^{3.67×10⁹} ℏ/(κ dₙ) = (mₑc²) Σₙ 1/dₙ

This is the central result: the Prime Electron Hamiltonian is a sum over inverse prime gaps, weighted by the electron rest energy mₑc².

The spectrum of H is discrete and unbounded above. The ground state corresponds to the maximum gap (which is infinite in the limit, but practically bounded by the UV cutoff at directory 3.0). The low-lying excitations correspond to small gaps: twin primes (d=2) give the largest energy contributions ℏ/(2κ) = mₑc²/2.