# A1-21: Worldline_Winding_Sectors.md — Piece 05

## Sector Wavefunctions and Instanton Gas

The sector wavefunction |Q⟩ is the ground state in the sector with topological charge Q. For the prime electron, these are not exact energy eigenstates because instantons mix sectors. The true eigenstates are the θ-vacua. However, for the dilute instanton gas approximation (valid since S_inst is small but instantons are rare), we can construct approximate sector states.

The instanton gas partition function is:
Z = Σ_{Q} e^{-F_Q/ℏ} = Σ_{Q} e^{-Q S_inst} Z_0 = Z_0 / (1 - e^{-S_inst})^2

for the sum over Q ∈ ℤ (positive and negative instantons). The instanton density is:
n_inst = (1/T) ⟨Q^2⟩^{1/2} = (1/T) [ Σ_Q Q^2 e^{-|Q| S_inst} ]^{1/2} / [ Σ_Q e^{-|Q| S_inst} ]^{1/2}

With S_inst ≈ 0.29, this gives n_inst ~ 1/T, consistent with 24 instantons in total time T.

The sector wavefunction overlap is:
⟨Q|Q'⟩ = δ_{Q,Q'} (orthonormal basis)

The Hamiltonian matrix elements between sectors are:
⟨Q| H |Q'⟩ = E_0 δ_{Q,Q'} + V_{Q-Q'}

where V_k is the instanton-induced transition amplitude. For k = ±1:
V_{±1} = ℏ n_inst e^{-S_inst/2} ≈ ℏ/T · 24 · e^{-0.145} ≈ 20.8 ℏ/T

The spectrum of the Hamiltonian in the instanton gas approximation is:
E_n = E_0 - 2 |V_1| cos(2π n / N_inst)

where N_inst = 24 is the number of instantons. This gives a band of width ~ 40 ℏ/T around E_0.

Piece 06 discusses the spectral flow between sectors.