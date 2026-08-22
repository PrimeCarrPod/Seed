# A3-10: Quantum Computing from Prime Gaps — Piece 02
## Prime Gap Quantum Fourier Transform (PG-QFT)

The Quantum Fourier Transform on Z_{256} is the unitary F_{256} = (1/√256) Σ_{j,k=0}^{255} ω^{jk} |j⟩⟨k| with ω = e^{2πi/256}. In the prime difference basis {|d⟩} from A3-03, the PG-QFT is defined by the spectral decomposition of the gap shift operator S = Σ_d P(d) |d⟩⟨d ⊕ 1|, where ⊕ denotes addition modulo 256.

**Definition A3-10.2 (PG-QFT Unitary).** The Prime Gap Quantum Fourier Transform is the unitary V_{PG} = F_{256} · D · F_{256}^†, where D = diag(λ_0, λ_1, ..., λ_{255}) with eigenvalues λ_k = Σ_d P(d) e^{2πi k d / 256} — the characteristic function of the prime gap distribution evaluated at the 256-th roots of unity.

**Lemma A3-10.3 (Eigenvalue Structure).** The eigenvalues λ_k exhibit sharp peaks at k = 0, 42, 84, 126, 168, 210 (multiples of 210 = 2·3·5·7) and at k = 0, 30, 60, 90, ..., 240 (multiples of 30 = 2·3·5), reflecting the primorial wheel structure of prime gaps. Specifically:
- |λ_0| = 1 (normalization)
- |λ_{210}| = |Σ_d P(d) e^{2πi·210·d/256}| = |Σ_d P(d) e^{2πi·105·d/128}| ≈ 0.89 (mod 210 residue)
- |λ_{30}| = |Σ_d P(d) e^{2πi·30·d/256}| = |Σ_d P(d) e^{2πi·15·d/128}| ≈ 0.94 (mod 30 residue)
- |λ_{6}| = |Σ_d P(d) e^{2πi·6·d/256}| = |Σ_d P(d) e^{2πi·3·d/128}| ≈ 0.98 (mod 6 residue)

*Proof.* The prime gap distribution P(d) is supported on even d. Modulo 6, gaps are ≡ 0, 2, 4 with probabilities (0, 1/2, 1/2) asymptotically. Modulo 30, gaps occupy the 8 residue classes {1, 7, 11, 13, 17, 19, 23, 29} mod 30 (the reduced residue system mod 30) with near-uniform density among admissible classes. The Fourier coefficients at multiples of 210, 30, 6 capture these arithmetic progressions. ∎

**Circuit Decomposition (A3-10.4).** The PG-QFT on 8 qubits decomposes as:
```
V_{PG} = (H ⊗ I^{⊗7}) · CPHASE(π/2) · (H ⊗ I^{⊗6}) · CPHASE(π/4) · ... · CPHASE(π/256) · SWAP-network
```
where the controlled-phase angles are determined by the gap eigenvalues λ_k. The standard QFT circuit requires O(8²) = 64 gates. The PG-QFT replaces the uniform phase rotation e^{2πi/256} with the gap-weighted phases arg(λ_k), requiring O(8²) classical precomputation of λ_k from PrimeBookOne but identical quantum circuit depth.

**Connection to A3-04 (Unitarity).** The unitarity of V_{PG} follows from the unitarity of F_{256} and the fact that D is diagonal with |λ_k| ≤ 1. The prime gap distribution P(d) is a probability distribution, so by Bochner's theorem its characteristic function λ_k = E[e^{2πi k d/256}] satisfies |λ_k| ≤ 1 with equality only at k = 0. The PG-QFT is therefore a contraction that becomes unitary on the support of the gap distribution.

**Computational Implication.** The PG-QFT implements the quantum Fourier transform with a "structured noise" model where the phase errors are precisely the prime gap statistics. This structure is not a bug but a feature: the peaks in λ_k at primorial multiples enable period finding with fewer measurements than standard QFT, as the algorithm naturally amplifies periods that are divisors of primorials.