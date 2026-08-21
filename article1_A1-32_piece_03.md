# A1-32 Worldline_Renyi_Entropies.md — Piece 03
## BPS Sector Renyi Entropies — Topological Invariance at All n

The 78 BPS states (A1-28) form a protected subspace of the worldline Hilbert space. Their Renyi entropies exhibit a remarkable topological invariance.

**BPS density matrix.** The BPS sector Hamiltonian has exactly 78 zero-energy states. At low temperature $\beta \to \infty$, the density matrix is:

$$\rho_{\text{BPS}} = \frac{1}{78} \sum_{i=1}^{78} |i\rangle\langle i| = \frac{1}{78} \mathbb{I}_{78}$$

**Renyi entropies for maximally mixed state.** For $\rho = \frac{1}{d} \mathbb{I}_d$:

$$\text{Tr}(\rho^n) = \text{Tr}\left(\frac{1}{d^n} \mathbb{I}_d\right) = \frac{d}{d^n} = d^{1-n}$$

$$S_n = \frac{1}{1-n} \log d^{1-n} = \log d$$

With $d=78$ for the BPS sector:

$$S_n^{\text{BPS}} = \log 78 \approx 4.36 \quad \text{for ALL } n \in (0, \infty)$$

**Topological protection.** The $n$-independence of $S_n^{\text{BPS}}$ is a topological signature:
- It reflects the fact that the 78 BPS states are exactly degenerate (index theorem, A1-24)
- No local perturbation can split this degeneracy (Witten index $\Delta = 78 \neq 0$, A1-25)
- The Renyi spectrum is flat: all eigenvalues equal $\frac{1}{78}$

**Contrast with non-BPS sector.** The 176 non-BPS states (44 long multiplets of dimension 4, A1-27) have energy gaps. Their eigenvalues are $p_i = e^{-\beta E_i}/Z$ with $E_i > 0$. Then:

$$S_n^{\text{non-BPS}} = \frac{1}{1-n} \log \sum_i p_i^n$$

This depends strongly on $n$: $S_0^{\text{non-BPS}} = \log 176 \approx 5.17$, $S_1^{\text{non-BPS}} < \log 176$, $S_\infty^{\text{non-BPS}} = -\log \max p_i$.

**Physical chamber constancy.** In the physical chamber (no wall crossing, A1-29), the BPS count is constant at 78. Thus $S_n^{\text{BPS}} = \log 78$ is constant across all 3500 books. The PrimeBookOne data shows no variation in the BPS Renyi profile across the physical chamber — a direct empirical verification of RH $\Leftrightarrow$ smooth $S_n$.