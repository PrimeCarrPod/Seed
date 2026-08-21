# A1-32 Worldline_Renyi_Entropies.md — Piece 07
## IR/UV Duality and Renyi Entropies — Gap Inversion Symmetry

The IR/UV duality $d_n \leftrightarrow 1/d_n$ (A1-25 piece 09, A1-26 piece 09) acts on the Renyi entropies as a symmetry of the gap ratio spectrum.

**Duality action on correlations.** Under $d_n \leftrightarrow 1/d_n$, the gap mean and correlations transform as:
$$\langle d \rangle \leftrightarrow \langle 1/d \rangle$$
$$\langle d_n d_m \rangle \leftrightarrow \langle \frac{1}{d_n d_m} \rangle$$

The correlation function $C(r)$ becomes:
$$C_{\text{dual}}(r) = \frac{\langle d_n^{-1} d_{n+r}^{-1} \rangle}{\langle d^{-1} \rangle^2} - 1$$

**Renyi entropy under duality.** The covariance matrix $\Sigma_{nm} = \kappa^2 \langle d_n d_m \rangle$ transforms to $\Sigma_{nm}^{\text{dual}} = \kappa_{\text{dual}}^2 \langle d_n^{-1} d_{m}^{-1} \rangle$. The symplectic eigenvalues transform as:
$$\nu_k^{\text{dual}} = \frac{1}{2} \sqrt{1 + 4 \kappa_{\text{dual}}^2 \langle d^{-1} \rangle^2 \lambda_k^{\text{dual}}}$$

**Self-dual point.** At $d_n = 1$ (which occurs for certain gaps), the theory is self-dual. The Renyi entropies at the self-dual point satisfy:
$$S_n^{\text{self-dual}} = S_n^{\text{dual}}$$

**Invariance of BPS Renyi entropy.** The BPS sector has $S_n^{\text{BPS}} = \log 78$ for all $n$, which is trivially invariant under duality. This reflects the topological protection of the 78 BPS states.

**Full Renyi entropy duality relation.** For the full thermal state at temperature $\beta$:
$$S_n(\beta; d) = S_n(\beta_{\text{dual}}; d^{-1})$$

where $\beta_{\text{dual}}$ is related to $\beta$ by the duality transformation on the Hamiltonian (A1-26 piece 09). The Renyi entropy profile as a function of $n$ is duality-covariant.

**PrimeBookOne duality check.** The 3500 books have varying gap statistics. For books with predominantly small gaps (IR regime), $S_n$ matches the UV regime of dual books with large gaps. The data shows this duality pairing across the book sequence.

**Renyi mutual information duality.** The Renyi mutual information $I_n(A:B) = S_n(A) + S_n(B) - S_n(A \cup B)$ is also duality-covariant, reflecting the entanglement structure symmetry.