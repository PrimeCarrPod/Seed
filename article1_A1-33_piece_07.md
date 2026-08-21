# A1-33 Worldline_Modular_Hamiltonian.md — Piece 07
## Modular Hamiltonian and Renyi Entropies — The Full Algebraic Structure

The modular Hamiltonian generates the full tower of Renyi entropies (A1-32) and connects to relative entropy (A1-34).

**Renyi entropies as modular free energies.** The Renyi entropy is:
$$S_n = \frac{1}{1-n} \log \text{Tr}(e^{-(n-1)K}) = \frac{1}{1-n} \log Z_{\text{mod}}(n-1)$$

This is the modular free energy $F_{\text{mod}}(n) = (1-n) S_n$. The modular energy is $\langle K \rangle_n = \frac{\partial}{\partial n} [(n-1)S_n]$.

**Modular specific heat.** The specific heat in the modular ensemble is:
$$C_{\text{mod}}(n) = \frac{\partial}{\partial n} \left[ n \frac{\partial S_n}{\partial n} \right] = \text{Var}_n(K)$$
where $\text{Var}_n(K) = \langle K^2 \rangle_n - \langle K \rangle_n^2$ is the variance in the $n$-th Renyi ensemble.

**Modular Hamiltonian from Renyi data.** The modular Hamiltonian can be reconstructed from the Renyi entropies:
$$K = \lim_{n \to 1} \frac{\partial}{\partial n} \left[ (n-1) S_n \right] + \text{const.}$$

**Relative entropy as modular energy difference.** The relative entropy (A1-34) is:
$$S(\rho||\sigma) = \text{Tr}(\rho K_\sigma) - S(\rho)$$
where $K_\sigma = -\log \sigma$. This is the expectation value of the modular Hamiltonian of $\sigma$ in the state $\rho$, minus the entropy of $\rho$.

**BPS sector: exact Renyi algebra.** For the BPS sector, $K_{\text{BPS}} = \log 78 \cdot \mathbb{I}$, so:
$$Z_{\text{mod}}(s) = 78 e^{-s \log 78} = 78^{1-s}$$
$$S_n^{\text{BPS}} = \frac{1}{1-n} \log 78^{1-n} = \log 78$$
$$C_{\text{mod}}(n) = 0 \quad \text{(no fluctuations)}$$

**Renyi divergences as modular energies.** The Renyi divergence $D_n(\rho||\sigma) = \frac{1}{n-1} \log \text{Tr}(\rho^n \sigma^{1-n})$ is the modular free energy difference. For commuting states (classical gap distributions), $D_n$ reduces to classical Renyi divergence.

**PrimeBookOne Renyi-modular consistency.** The 3500 books provide exact $S_n(b)$ and $K(b)$ satisfying the above relations identically.