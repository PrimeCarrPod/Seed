# A1-32 Worldline_Renyi_Entropies.md — Piece 01
## Introduction — Renyi Entropies from Prime Gap Ratios

The Renyi entropies generalize the von Neumann entanglement entropy (A1-31) by introducing a parameter $n$ that weights the eigenvalues of the density matrix differently. For the prime electron worldline, the Renyi entropies are directly computable from the gap ratio statistics of PrimeBookOne.

**Renyi entropy definition.** For a density matrix $\rho$, the Renyi entropy of order $n$ is:

$$S_n(\rho) = \frac{1}{1-n} \log \text{Tr}(\rho^n), \quad n \in (0,1) \cup (1,\infty)$$

The von Neumann entropy is recovered as $S_1 = \lim_{n \to 1} S_n = -\text{Tr}(\rho \log \rho)$.

**Gap ratio origin.** The eigenvalues of the reduced density matrix $\rho_A$ for a worldline region A are determined by the gap correlations in that region. For Gaussian states (A1-31 piece 01), the eigenvalues are functions of the symplectic eigenvalues $\{\nu_k\}$ of the covariance matrix $\Sigma_A$. The Renyi entropy becomes:

$$S_n = \sum_k \frac{1}{1-n} \log \left[ \left(\nu_k + \frac{1}{2}\right)^n - \left(\nu_k - \frac{1}{2}\right)^n \right]$$

**Gap ratios as Renyi parameters.** The symplectic eigenvalues $\nu_k$ are functions of the gap ratio statistics $\langle d_n d_m \rangle / \langle d \rangle^2$. The Renyi parameter $n$ weights these ratios: $n=2$ emphasizes large eigenvalues (BPS sector), $n \to \infty$ gives the min-entropy (max eigenvalue).

**PrimeBookOne computation.** The 3.67 billion gap differences provide exact values for $\text{Tr}(\rho_A^n)$ at all $n$ for any region A. The 3500 books give 3500 Renyi entropy profiles $S_n(b)$ across proper time.

**BPS sector universality.** For the 78 BPS states (A1-28), the density matrix is maximally mixed on a 78-dimensional subspace: $\rho_{\text{BPS}} = \frac{1}{78} \mathbb{I}_{78}$. Thus:

$$S_n^{\text{BPS}} = \frac{1}{1-n} \log \text{Tr}\left(\frac{1}{78^n} \mathbb{I}_{78}\right) = \log 78 \quad \text{for all } n$$

The Renyi entropies are independent of $n$ in the BPS sector — a signature of topological protection.