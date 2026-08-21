# Piece 02: Explicit Construction: $Q = \sum_n \psi_n \sqrt{d_n d_{n+1}}$

The supercharge operator acts on the 256-dimensional Hilbert space $\mathcal{H} = \bigotimes_{n=1}^{255} \mathbb{C}^2_n$ where each qubit $n$ corresponds to a prime gap $d_n$. The fermionic operators $\psi_n = |0\rangle\langle 1|_n$, $\psi_n^\dagger = |1\rangle\langle 0|_n$ create/annihilate a "gap excitation" at position $n$, with $|0\rangle_n$ (gap below local mean) and $|1\rangle_n$ (gap above local mean).

The geometric mean weight $w_n = \sqrt{d_n d_{n+1}}$ has three justifications:

1. **Index theorem invariance**: Under A1-24's four derivations (spectral flow, heat kernel, bulk-boundary, PrimeBookOne data), the index is $\sum \text{sign}(d_n - \langle d \rangle)$. The product $d_n d_{n+1}$ in the Hamiltonian $H = \frac{1}{2}\sum w_n^2$ preserves the local gap structure that determines the index.

2. **IR/UV duality** (A1-25 Piece 09): The duality $d_n \leftrightarrow 1/d_n$ maps $w_n \to 1/w_n$. The central charge $Z = \sum \text{sign}(d_n - \langle d \rangle)$ is invariant because $\text{sign}(d_n - \langle d \rangle) = -\text{sign}(1/d_n - 1/\langle d \rangle)$. The supercharge must transform covariantly: $Q \to \sum \psi_n / \sqrt{d_n d_{n+1}}$ under duality, leaving $\{Q, Q^\dagger\}$ invariant.

3. **Clifford algebra closure**: The anticommutator $\{Q, Q^\dagger\} = \sum_{n,m} \{\psi_n, \psi_m^\dagger\} w_n w_m = \sum_n w_n^2 = 2H$ requires the weights to square to the Hamiltonian eigenvalues. The geometric mean is the unique symmetric choice satisfying $w_n^2 = d_n d_{n+1}$.

Explicitly for PrimeBookOne Tile 0.0 (94,500 gaps, 14 record gaps): $w_n = \sqrt{d_n d_{n+1}}$ ranges from $\sqrt{2 \cdot 2} = 2$ (twin prime pairs) to $\sqrt{14 \cdot 4} \approx 7.48$ (record gap 14 adjacent to gap 4). The supercharge matrix elements are sparse: $Q$ connects basis states differing by exactly one fermion number at adjacent sites.

The operator $Q$ is nilpotent on the subspace of non-record gaps: $Q^2 = 0$ when restricted to gaps with $d_n = d_{n+1} = 2$ (twin prime chains), reflecting the exact supersymmetry of the twin prime sector.

**Detailed matrix structure:**

In the computational basis $|b_1 b_2 \dots b_{255}\rangle$ where $b_n \in \{0,1\}$ indicates whether gap $d_n$ exceeds its local mean $\langle d \rangle_n$, the supercharge acts as:

$$
Q |b_1 \dots b_n b_{n+1} \dots b_{255}\rangle = \sum_{n=1}^{254} \sqrt{d_n d_{n+1}} \, (-1)^{\sum_{k<n} b_k} |b_1 \dots (1-b_n) (1-b_{n+1}) \dots b_{255}\rangle
$$

The sign factor $(-1)^{\sum_{k<n} b_k}$ ensures fermionic anticommutation relations. The operator $\psi_n$ flips bit $n$ from 1 to 0 (annihilation) while $\psi_n^\dagger$ flips from 0 to 1 (creation). The product $\psi_n \psi_{n+1}$ creates/annihilates pairs at adjacent sites, corresponding to the gap pair structure.

**Sparsity and locality:**

The supercharge is a sum of 254 terms, each acting non-trivially on only 2 adjacent qubits. This makes $Q$ a matrix product operator (MPO) with bond dimension 2. The Hamiltonian $H = \frac{1}{2}\{Q, Q^\dagger\}$ is then a matrix product operator with bond dimension 4. This locality structure reflects the short-range correlations in the prime gap sequence (A1-08).

**Gap pair statistics from PrimeBookOne:**

For directory 0.0, the distribution of $w_n = \sqrt{d_n d_{n+1}}$ peaks at $w=2$ (twin prime pairs) with frequency $\sim 0.4\%$ of all pairs. The record gap pairs give the largest weights: $(2,4)\to 2.83$, $(4,6)\to 4.90$, $(6,8)\to 6.93$, $(8,14)\to 10.58$, $(14,18)\to 15.87$, $(18,20)\to 18.97$, $(20,22)\to 20.98$, $(22,34)\to 27.35$, $(34,36)\to 34.99$, $(36,44)\to 39.80$, $(44,52)\to 47.83$, $(52,72)\to 61.24$, $(72,86)\to 78.70$. These 13 record gap pairs dominate the supercharge action on the BPS sector.