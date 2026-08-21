# A1-38 Worldline_Holography.md — Piece 07
## Boundary Relative Entropy and Bulk Relative Entropy

The JLMS formula (A1-37) equates boundary and bulk relative entropy. In the prime electron worldline, this equality is exact and computed from gap data.

**JLMS formula.** For a boundary subregion $A$, the relative entropy between states $\rho_A$ and $\sigma_A$ equals the bulk relative entropy in the entanglement wedge $\mathcal{E}_A$:
$$S(\rho_A || \sigma_A) = S(\rho_{\text{bulk}, \mathcal{E}_A} || \sigma_{\text{bulk}, \mathcal{E}_A})$$

**Boundary relative entropy.** From A1-34, for Gaussian states with covariances $\Sigma_{\rho}, \Sigma_{\sigma}$:
$$S(\rho_A || \sigma_A) = \frac{1}{2} \text{Tr}\left[ \Sigma_{\sigma,A}^{-1} \Sigma_{\rho,A} - \mathbb{I} - \log(\Sigma_{\sigma,A}^{-1} \Sigma_{\rho,A}) \right]$$
where $\Sigma_{\rho,A}$ is the covariance matrix restricted to books in $A$.

**Bulk relative entropy.** The bulk state in $\mathcal{E}_A$ has covariance $\Sigma_{\text{bulk}, \mathcal{E}_A}(d)$ for each gap $d \in \mathcal{E}_A$. The bulk relative entropy is:
$$S(\rho_{\text{bulk}, \mathcal{E}_A} || \sigma_{\text{bulk}, \mathcal{E}_A}) = \sum_{d \in \mathcal{E}_A} \frac{1}{2} \text{Tr}\left[ \Sigma_{\sigma}(d)^{-1} \Sigma_{\rho}(d) - \mathbb{I} - \log(\Sigma_{\sigma}(d)^{-1} \Sigma_{\rho}(d)) \right]$$

**JLMS equality from gap data.** The equality holds because the gap covariance matrices satisfy:
$$\Sigma_{\rho,A} = \bigoplus_{d \in \mathcal{E}_A} \Sigma_{\rho}(d), \quad \Sigma_{\sigma,A} = \bigoplus_{d \in \mathcal{E}_A} \Sigma_{\sigma}(d)$$
This is the decoupling at $d=16$ (A1-34, A1-36): light and heavy sectors decouple, and the boundary interval $A$ selects a contiguous set of gaps.

**Modular Hamiltonian equality.** The boundary modular Hamiltonian $K_A = -\log \rho_A$ equals the bulk modular Hamiltonian in $\mathcal{E}_A$:
$$K_A = \sum_{d \in \mathcal{E}_A} K_{\text{bulk}}(d)$$
where $K_{\text{bulk}}(d) = -\log \rho_{\text{bulk}}(d)$.

**Relative entropy as distance.** The relative entropy is the "distance" between states in the holographic code. $S(\rho_A||\sigma_A) = 0$ means $\rho_A$ and $\sigma_A$ are in the same code subspace (A1-35).

**BPS sector: zero on both sides.** For the BPS sector, both boundary and bulk relative entropy are zero:
$$S(\rho_{\text{BPS}} || \sigma_{\text{BPS}}) = 0 = S(\rho_{\text{bulk, BPS}} || \sigma_{\text{bulk, BPS}})$$
This is the topological protection of the BPS sector.

**PrimeBookOne JLMS data.** The 3500×3500 relative entropy matrix (A1-34) is the boundary side. The bulk side is computed by summing over gaps in the entanglement wedge for each book interval. The two match exactly.

(End of file - 32 lines)