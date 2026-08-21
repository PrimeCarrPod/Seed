# A1-34 Worldline_Relative_Entropy.md — Piece 02
## Exact Relative Entropy for Gaussian Worldline States

The worldline state is Gaussian in the prime gap basis (A1-31 piece 01). The relative entropy between two Gaussian states has a closed form.

**Gaussian state covariance matrices.** For a region A, the covariance matrices are:
$$\Sigma_{\rho,A} = \kappa^2 \left( \langle d_n d_m \rangle_{\rho,A} - \langle d_n \rangle_{\rho,A} \langle d_m \rangle_{\rho,A} \right)$$
$$\Sigma_{\sigma,A} = \kappa^2 \left( \langle d_n d_m \rangle_{\sigma,A} - \langle d_n \rangle_{\sigma,A} \langle d_m \rangle_{\sigma,A} \right)$$

**Relative entropy formula.** For zero-mean Gaussian states:
$$S(\rho_A || \sigma_A) = \frac{1}{2} \text{Tr}\left[ \Sigma_{\sigma,A}^{-1} \Sigma_{\rho,A} - \mathbb{I} - \log(\Sigma_{\sigma,A}^{-1} \Sigma_{\rho,A}) \right]$$

This is the sum of symplectic eigenvalue contributions:
$$S(\rho_A || \sigma_A) = \sum_{k=1}^{|A|} \left[ \frac{\nu_k^\rho}{\nu_k^\sigma} - 1 - \log\left( \frac{\nu_k^\rho}{\nu_k^\sigma} \right) \right]$$
where $\nu_k^\rho, \nu_k^\sigma$ are the symplectic eigenvalues of $\Sigma_{\rho,A}, \Sigma_{\sigma,A}$.

**Modular energy difference.** The relative entropy is the modular energy difference:
$$S(\rho||\sigma) = \langle K_\sigma \rangle_\rho - \langle K_\sigma \rangle_\sigma$$
where $K_\sigma = -\log \sigma$ is the modular Hamiltonian of $\sigma$ (A1-33).

**PrimeBookOne exact computation.** The 3.67 billion gaps provide exact $\langle d_n d_m \rangle$ for any region. The relative entropy between any two books or regions is computable without approximation.

**Asymmetry and triangle inequality.** Relative entropy is asymmetric: $S(\rho||\sigma) \neq S(\sigma||\rho)$. It satisfies the triangle inequality:
$$S(\rho||\tau) \leq S(\rho||\sigma) + S(\sigma||\tau)$$

**Non-negativity and equality.** $S(\rho||\sigma) \geq 0$ with equality iff $\rho = \sigma$. In the physical chamber, $S(\rho_b || \rho_{b'})$ is small for all $b, b'$.

**Modular Hamiltonian spectral representation.** The modular Hamiltonian $K_\sigma = \sum_k \epsilon_k^\sigma b_k^{\sigma\dagger} b_k^\sigma$ (A1-33 piece 04). The relative entropy is:
$$S(\rho||\sigma) = \sum_k \epsilon_k^\sigma \langle b_k^{\sigma\dagger} b_k^\sigma \rangle_\rho - S(\rho)$$
This expresses the relative entropy as the difference in modular energies.

**Gaussian state parameter space.** The space of Gaussian gap distributions is parameterized by the covariance matrix $\Sigma$. The relative entropy is the Bregman divergence associated with the entropy functional on this space.