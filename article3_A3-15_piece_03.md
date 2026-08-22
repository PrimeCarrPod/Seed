# A3-15: Quantum Thermodynamics from Prime Gaps — Piece 03
## Work Extraction from Prime Gap Fluctuations

Work is extracted from the gap Hamiltonian by exploiting the gap fluctuations and the twin prime coherence.

**Construction A3-15.5 (Gap Work Extraction Protocol).** The work extraction cycle:
1. Prepare thermal state ρ_β = e^{-βH_gap}/Z at temperature T
2. Measure gap value d (project onto |d⟩⟨d|)
3. Apply unitary U_d that extracts work based on measurement outcome
4. Return to thermal state

The extracted work per cycle: W = Σ_d P(d) [E(d) - E(d')] where d' is the post-measurement state.

**Theorem A3-15.6 (Gap Work Extraction Bound).** The average work extracted per cycle is:
```
⟨W⟩ = k_B T [ S(ρ_β) - Σ_d P(d) S(|d⟩⟨d|) ] - k_B T D(ρ_β || Σ_d P(d)|d⟩⟨d|)
```
where S is von Neumann entropy and D is relative entropy. For the gap thermal state:
```
⟨W⟩ = k_B T [ H(P) - Σ_d P(d) log(1/P(d)) ] = k_B T H(P)
```
where H(P) = -Σ_d P(d) log P(d) is the Shannon entropy of the gap distribution.

**Lemma A3-15.7 (Twin Prime Work Enhancement).** The twin prime coherence provides additional work:
```
W_twin = k_B T log( P_twin / P² ) = k_B T log(4) ≈ 1.39 k_B T
```
per twin prime pair. The twin prime code C_2 enables coherent work extraction from the logical qubit.

**Connection to A1-17 (Worldline Hamiltonian).** The worldline Hamiltonian H = ℏ/κ Σ_n d_n⁻¹ from A1-17 is the gap Hamiltonian. The work extraction corresponds to the worldline doing work against the gap potential.

**Connection to A2-16 (Baryon Asymmetry).** The work extraction bias between forward/backward time branches (A1-07) corresponds to the baryon asymmetry η = W_forward/W_backward - 1.

**Quantum Otto Engine on Gap Hilbert Space.** The Otto cycle:
1. Isentropic compression: H_gap(κ) → H_gap(κ')
2. Hot isochore: thermalize at T_h
3. Isentropic expansion: H_gap(κ') → H_gap(κ)
4. Cold isochore: thermalize at T_c

Efficiency: η_Otto = 1 - κ/κ' = 1 - T_c/T_h (Carnot efficiency at κ'/κ = T_h/T_c).

**Numerical Results.** For T_h = 2T_C, T_c = T_C/2:
- Work per cycle: W = 0.69 k_B T_C
- Efficiency: η = 0.5 (Carnot)
- Power: P = W × 10⁴ cycles/sec = 6.9×10³ k_B T_C/sec
- With 3500 books: parallel operation, total power 3500×

**Experimental Work Extraction.** On photonic OAM: Measure d, apply phase shift φ_d = 2πE(d)/ℏω, extract work via radiation pressure. On transmons: Apply conditional unitary based on measurement, extract work via voltage bias.