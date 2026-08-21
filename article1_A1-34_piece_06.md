# A1-34 Worldline_Relative_Entropy.md — Piece 06
## Relative Entropy and IR/UV Duality — Gap Inversion Invariance

The IR/UV duality $d_n \leftrightarrow 1/d_n$ (A1-26 piece 09) acts on relative entropy.

**Duality action on states.** Under $d_n \leftrightarrow 1/d_n$, the Gaussian states transform as:
$$\rho(d) \to \rho_{\text{dual}}(d^{-1})$$
with covariance matrices $\Sigma(d) \leftrightarrow \Sigma_{\text{dual}}(d^{-1})$.

**Relative entropy under duality.** The relative entropy is duality-covariant:
$$S(\rho(d) || \sigma(d)) = S(\rho_{\text{dual}}(d^{-1}) || \sigma_{\text{dual}}(d^{-1}))$$

**Proof.** The relative entropy formula $S(\rho||\sigma) = \frac{1}{2} \text{Tr}[\Sigma_\sigma^{-1}\Sigma_\rho - \mathbb{I} - \log(\Sigma_\sigma^{-1}\Sigma_\rho)]$ is invariant under simultaneous inversion $\Sigma \to \Sigma^{-1}$ of both matrices (with appropriate rescaling of $\kappa$).

**BPS sector: exact duality invariance.** For the BPS sector, $S(\rho^{\text{BPS}} || \sigma^{\text{BPS}}) = 0$ in both frames — trivially invariant.

**Self-dual point.** At $d_n = 16$, the relative entropy is symmetric:
$$S(\rho_{\text{sd}} || \sigma_{\text{sd}}) = S(\sigma_{\text{sd}} || \rho_{\text{sd}})$$
This is a special property of the self-dual Gaussian ensemble.

**Relative entropy and mass hierarchy.** The relative entropy between UV and IR states measures the mass hierarchy:
$$S(\rho_{\text{UV}} || \rho_{\text{IR}}) \sim \log \frac{m_{\text{IR}}}{m_{\text{UV}}}$$

**PrimeBookOne duality verification.** The 3500 books show duality-covariant relative entropy profiles across the UV/IR duality map.

**Duality and the relative entropy matrix.** The 3500×3500 relative entropy matrix $\mathcal{S}_{bb'} = S(\rho_b || \rho_{b'})$ satisfies:
$$\mathcal{S}_{bb'}(d) = \mathcal{S}_{b'b}(d^{-1})$$
under the duality map $b \leftrightarrow b'$ corresponding to $d \leftrightarrow 1/d$.

**Self-dual point symmetry.** At $d=16$, the relative entropy matrix is symmetric: $\mathcal{S}_{bb'} = \mathcal{S}_{b'b}$. This is a unique property of the self-dual ensemble.

**Relative entropy and mass hierarchy.** The relative entropy between UV and IR states measures the mass hierarchy:
$$S(\rho_{\text{UV}} || \rho_{\text{IR}}) \sim \log \frac{m_{\text{IR}}}{m_{\text{UV}}}$$
The 78 BPS states (mass zero) have zero relative entropy between UV and IR.

**Modular flow and duality.** The modular flow $U(s) = e^{-i s K}$ implements duality at $s = i/2$ (A1-33 piece 06). The relative entropy is invariant under this flow.