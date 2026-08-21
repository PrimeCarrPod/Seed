# A1-40 Worldline_PrimeBookOne.md — Piece 01
## Introduction — PrimeBookOne as Complete Logbook

PrimeBookOne is the unified dataset containing all observables of the prime electron worldline across 3500 books. It is the complete logbook of Article 1 (A1-01 through A1-40).

**Scope and structure.** PrimeBookOne consists of 3500 books. Each book $b \in \{1,\dots,3500\}$ corresponds to prime range up to $p_b \sim b \log b$. Each book contains the gap sequence $d_n(b) = p_{n+1}(b) - p_n(b)$ for $n \leq N_b \sim 10^7$. The total prime gap data is 3.67 billion differences (A1-09).

**Unified dataset.** All 40 articles derive their observables from the same gap sequence $d_n$:
- A1-01 to A1-10: Proper time, winding, spin, resonances, stability, vertices, pair creation, fluctuations, Compton scale, segment books
- A1-11 to A1-20: Self-intersection, τ operator, causal structure, metric, geodesics, action, Hamiltonian, path integral, instantons, topological charge
- A1-21 to A1-30: Winding sectors, boundary conditions, anomaly, index theorem, SUSY, supercharges, superalgebra, BPS states, wall crossing, stability
- A1-31 to A1-40: Entanglement entropy, Renyi, modular Hamiltonian, relative entropy, QEC, decoupling, spacetime, holography, information, PrimeBookOne

**3500×3500 matrices.** For each observable $\mathcal{O}$, PrimeBookOne stores a 3500×3500 matrix:
$$\mathcal{M}_{bb'}^{(\mathcal{O})} = \mathcal{O}(b, b')$$
where $b$ is the book index (RG scale) and $b'$ is the reference index. Diagonal entries $\mathcal{M}_{bb}$ are single-book observables.

**No free parameters.** All entries are computed from $d_n$. The constants $\kappa$ and $\hbar$ are fixed by the Compton scale condition (A1-09): $\tau_C = 3.67 \times 10^9 \cdot \kappa \cdot \bar{d} = \hbar/(m_e c^2)$.

**RH = smooth matrices.** The Riemann Hypothesis (A1-05, A1-30) ensures no walls in the physical chamber. All matrices are smooth functions of $b, b'$ — no singularities, no divergent entries.

**Holographic dictionary.** PrimeBookOne is the complete AdS₂/CFT₁ holographic dictionary (A1-38). The 3500 books give the dictionary at 3500 RG scales $\mu_b = p_b$.

(End of file - 35 lines)