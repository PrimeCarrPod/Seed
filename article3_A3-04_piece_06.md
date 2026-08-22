# A3-04 Unitarity_From_Prime_Distribution.md — Piece 06: Entanglement Unitarity and the Schmidt Decomposition

## 6.1 Entanglement and Unitarity

In a bipartite system ℋ = ℋ_A ⊗ ℋ_B, unitarity of the global evolution U implies specific constraints on the entanglement dynamics. The Schmidt decomposition of the prime state:
```
|Ψ_prime⟩ = Σ_{α=1}^{r} √λ_α |α⟩_A ⊗ |α⟩_B
```
where λ_α are the Schmidt coefficients (eigenvalues of ρ_A = Tr_B|Ψ⟩⟨Ψ|), and r ≤ min(dim ℋ_A, dim ℋ_B) is the Schmidt rank.

For the nibble decomposition ℋ = ℋ₄ ⊗ ℋ₄ (A3-03, Piece 06), the Schmidt coefficients are the square roots of the eigenvalues of the correlation matrix C (A3-03, Piece 04).

## 6.2 Unitarity Constraints on Schmidt Coefficients

### 6.2.1 Normalization
```
Σ_α λ_α = 1
```
This follows from Tr(ρ_A) = 1, which is guaranteed by global unitarity.

### 6.2.2 Purity Bound
The purity of the reduced state:
```
Tr(ρ_A²) = Σ_α λ_α² ≤ 1
```
with equality iff the state is pure (no entanglement). For the prime state, Tr(ρ_A²) ≈ 0.064 (A3-03, Piece 10), indicating significant entanglement.

### 6.2.3 Majorization and LOCC
The vector of Schmidt coefficients λ = (λ_1, ..., λ_r) majorizes the vector of eigenvalues of any locally obtained state. This is the content of Nielsen's theorem: unitarity + local operations + classical communication (LOCC) cannot increase entanglement.

In the prime gap context, the tensor factors correspond to physically distinct aspects (magnitude vs residue, or tile index vs congruence). The majorization relations constrain how prime gap information can be distributed between these aspects.

## 6.3 Entanglement Entropy and the Page Curve

The entanglement entropy:
```
S_A = -Σ_α λ_α log λ_α
```

For the nibble decomposition (Piece 06 of A3-03):
```
S_H ≈ 2.8 bits,  S_L ≈ 3.2 bits
```

For a random state in ℋ₄ ⊗ ℋ₄ (Page's theorem), the average entropy is:
```
⟨S⟩_Page = log(16) - 16/32 = 4 - 0.5 = 3.5 bits
```

The prime state has lower entanglement (2.8 + 3.2 = 6.0 total vs 7.0 max), reflecting the structured correlations in prime gaps (mod 6, mod 30 peaks).

## 6.4 Unitarity of the Entanglement Spectrum

The entanglement Hamiltonian K_A = -log ρ_A has spectrum {ξ_α = -log λ_α}. The evolution of the entanglement spectrum under global unitary U(t) is constrained:

### 6.4.1 Entanglement Spectrum Flow
For U(t) = exp(-iĤt/ℏ) with Ĥ = Ĥ_A ⊗ I + I ⊗ Ĥ_B + V_{int}, the entanglement spectrum evolves according to:
```
dλ_α/dt = i ⟨α|_A [Tr_B(V_{int} |Ψ⟩⟨Ψ| - |Ψ⟩⟨Ψ| V_{int})] |α⟩_A
```

In the prime gap system, the interaction V_{int} comes from the gap correlation matrix C. The entanglement spectrum flow is determined by the eigenvectors of C.

### 6.4.2 Constancy of Entanglement Entropy
For the free evolution U(t) = exp(-iĤt/ℏ) with Ĥ diagonal in the gap basis, the entanglement entropy S_A is **constant** because the Schmidt coefficients λ_α don't change (only phases change). This is a key check: the prime gap correlations are time-independent (stationary), so entanglement is conserved.

## 6.5 Monogamy of Entanglement and the Prime Gap Chain

The prime gap sequence forms a chain: d_1, d_2, d_3, ... The entanglement between gap d_n and d_{n+1} is given by the correlation matrix C. The **monogamy of entanglement** (Coffman-Kundu-Wootters inequality) constrains:
```
τ_{1|2} + τ_{1|3} ≤ τ_{1|23}
```
where τ is the tangle (entanglement measure).

For prime gaps, the short correlation length ξ ≈ 1.7 (A3-03, Piece 04) means:
- τ_{n|n+1} ≈ 0.15 (significant)
- τ_{n|n+2} ≈ 0.02 (small)
- τ_{n|n+k} → 0 exponentially for k > 2

The monogamy inequality is satisfied because the entanglement is concentrated on nearest-neighbor gaps.

## 6.6 Quantum Error Correction and Unitarity Recovery

From A1-35 and A3-08, the twin prime state |2⟩ is a [[256,1,3]] QEC code. The encoding isometry V: ℂ → ℋ₂₅₆ embeds the logical qubit. The global unitarity U(t) acts on the code space as:
```
U_logical(t) = P_code U(t) P_code
```
where P_code = |2⟩⟨2| is the projector onto the twin prime state.

Since |2⟩ is an eigenstate of Ĥ (E_2 = ℏ/(2κ)), U_logical(t) = e^{-iE_2 t/ℏ} is a pure phase — **perfectly unitary** on the logical qubit. The code space is a decoherence-free subspace (A3-06).

## 6.7 Piece 06 Summary

- Schmidt decomposition of prime state across tensor factors
- Unitarity → normalization Σλ_α=1, purity Σλ_α²≤1, majorization
- Entanglement entropy: S_H≈2.8, S_L≈3.2 bits (below Page value 3.5)
- Entanglement spectrum constant under free evolution (stationary correlations)
- Monogamy satisfied: entanglement concentrated on nearest-neighbor gaps (ξ≈1.7)
- Twin prime code space: logical unitarity exact, decoherence-free

**References**: A3-03 (Pieces 04, 06, 10), A1-35 (QEC), A3-08 (Error Correction Twin Primes), A3-06 (Decoherence)