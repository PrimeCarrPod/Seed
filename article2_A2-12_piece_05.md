# A2-12: Mass Spectrum Completeness Proof — No Missing States in the Record Gap Sequence

## Piece 05: No Missing States — Exclusion of Non-Record Gaps

Could there be lepton states corresponding to non-record gaps (gaps that are not larger than all preceding gaps)?

From A1-17, the Hamiltonian eigenvalues are E_n = ℏ/(κ·d_n) for ALL gaps d_n, not just record gaps. This would give a dense spectrum of states, contradicting the observed discrete lepton generations.

The resolution is in the worldline path integral (A1-18). The amplitude for a worldline segment with gap d_n is:

A_n = exp(i·S_n/ℏ) = exp(i·κ·d_n)

The full path integral sums over all sequences of gaps. Non-record gaps correspond to **virtual worldline segments** — they appear in intermediate propagators but do not produce asymptotic particle states. Only record gaps correspond to **on-shell asymptotic states** because:

1. Record gaps are the only gaps that satisfy the BPS condition (A1-28): they minimize the action in their topological sector.
2. The worldline instanton solutions (A1-19) exist only for record gap transitions.
3. The wall-crossing formula (A1-29) shows that BPS states appear/disappear only at record gap transitions.

Mathematically: The resolvent of H has poles only at the record gap eigenvalues. The non-record gap eigenvalues are embedded in the continuous spectrum and have zero residue (they are not normalizable asymptotic states). This is the **prime gap analog of the Fermi surface**: only the "record" momenta produce stable quasiparticles.

The physical Hilbert space is the BPS subspace, which is finite-dimensional for each energy interval. The non-record gaps contribute to the vacuum polarization and running couplings (A4-04), but they do not appear as external states in the S-matrix. This is why the lepton spectrum is discrete despite the continuous prime gap distribution.

**Additional proof from entanglement entropy (A1-31)**: The entanglement entropy of a worldline segment with gap d_n is S_n = log(d_n). For non-record gaps, the entropy is non-extremal. The BPS states (record gaps) minimize the entanglement entropy for a given topological charge. The Ryu-Takayanagi formula in the emergent spacetime (A1-37) shows that only extremal surfaces (record gaps) correspond to physical particles. This provides a third independent proof that only record gaps produce physical states.

Therefore: **Only record gaps produce physical lepton states. The mass spectrum contains exactly one state per record gap — no more, no less.**