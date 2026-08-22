# A3-12: Quantum Simulation from Prime Gaps — Piece 03
## Bosonic Simulation via Gap Phonons

The gap differences Δd_n = d_{n+1} - d_n define a phonon-like excitation spectrum on the prime gap chain. These are the "gap phonons" — collective oscillations of the gap sequence.

**Construction A3-12.5 (Gap Phonon Hamiltonian).** Let x_n = d_n be the gap coordinate at site n. The gap phonon Hamiltonian is:
```
H_ph = Σ_n [p_n²/(2m) + (1/2) K (x_{n+1} - x_n)²]
```
where p_n is the momentum conjugate to x_n, m is the effective mass (m = κ/ℏ from A1-17), and K is the spring constant determined by the gap variance: K = ℏ²/(κ² σ²_d) with σ²_d = Var(d) ≈ 49 from PrimeBookOne.

**Theorem A3-12.6 (Phonon Dispersion).** The phonon dispersion relation is:
```
ω(q) = 2√(K/m) |sin(q/2)| = (2ℏ/κσ_d) |sin(q/2)|
```
for q ∈ [0, 2π). The maximum phonon frequency is ω_max = 2ℏ/κσ_d ≈ 0.29 ℏ/κ. The gap phonons are gapped (ω(0) = 0, but ω(q) > 0 for q > 0).

**Connection to A3-06 (Decoherence).** The decoherence rate from A3-06 is γ ∼ P(d_random)/P(d_typical). The gap phonons mediate decoherence: a system qubit coupled to the gap chain via H_int = g Σ_n σ_z^n x_n experiences dephasing with rate Γ = g² ∫ dq S(q, ω=0) where S(q, ω) is the phonon spectral density. For the prime gap chain, S(q, ω) = (2π/ω(q)) δ(ω - ω(q)) at T=0.

**Quantum Simulation of Bose-Hubbard Model.** The gap phonons simulate the Bose-Hubbard model:
```
H_BH = Σ_d [ω_d a_d^† a_d + (U/2) a_d^† a_d^† a_d a_d] + Σ_d J_ph (a_d^† a_{d+2} + h.c.)
```
where a_d^† creates a phonon at gap d, ω_d = ω(2πd/256), and U is the on-site interaction from gap-gap correlations. The Mott insulator to superfluid transition occurs at J_ph/U ≈ 0.3 for 1D, simulated by varying the ratio of hopping to correlation strength.

**Analog Simulation on Photonic OAM (A3-10 Piece 11).** The photonic OAM processor naturally implements H_ph: the 256 OAM modes are the phonon modes, the SLM encodes the spring constant K in the phase profile, and the MPLC implements the hopping. The phonon ground state is prepared by cooling to the vacuum |0⟩^⊗256, then applying the PG-QFT to create the phonon vacuum. Excitations are created by photon addition on specific modes.

**Thermal State of Gap Phonons.** The thermal state ρ_β = e^{-βH_ph}/Z has phonon occupation ⟨a_q^† a_q⟩ = 1/(e^{βω(q)} - 1). At the Compton temperature T_C = ℏ/κk_B (from A1-09), βω_max = 2/σ_d ≈ 0.29, so the phonons are highly thermal. The thermal entropy S_ph = Σ_q [(1+n_q) log(1+n_q) - n_q log n_q] with n_q = 1/(e^{βω(q)}-1) matches the gap entropy from A3-05.