# A1-40 Worldline_PrimeBookOne.md — Piece 03
## Relative Entropy Matrix — 3500×3500

The relative entropy matrix from A1-34 is a central object in PrimeBookOne. It encodes all distinguishability information between books.

**Matrix definition.** The relative entropy matrix is:
$$\Sigma_{bb'} = S(\rho_b || \rho_{b'})$$
where $\rho_b$ is the thermal state for book $b$ (A1-31): $\rho_b = e^{-\beta H_b}/Z_b$ with $H_b = \frac{\hbar}{\kappa} \sum_n d_n(b)^{-1} |n\rangle\langle n|$.

**Gaussian exact formula.** For Gaussian states (A1-34):
$$\Sigma_{bb'} = \frac{1}{2} \text{Tr}\left[ \Sigma_{b'}^{-1} \Sigma_b - \mathbb{I} - \log(\Sigma_{b'}^{-1} \Sigma_b) \right]$$
where $\Sigma_b$ is the covariance matrix of book $b$ from gap correlations.

**BPS blocks = 0.** The 78 BPS states (A1-28) correspond to the record gap books. For any BPS book indices $b, b' \in \text{BPS}$:
$$\Sigma_{bb'} = 0$$
This 78×78 zero block is the topological signature of exact BPS preservation (A1-34, A1-39).

**Light/heavy block structure.** The matrix block-diagonalizes at the self-dual scale $d=16$ (A1-36):
$$\Sigma = \begin{pmatrix} \Sigma_{\text{light}} & 0 \\ 0 & \Sigma_{\text{heavy}} \end{pmatrix}$$
where light block has $d < 16$ (UV), heavy block has $d > 16$ (IR, includes BPS).

**Diagonal entries.** $\Sigma_{bb} = 0$ for all $b$ (relative entropy of a state with itself is zero).

**Asymmetry.** $\Sigma_{bb'} \neq \Sigma_{b'b}$ generally. The symmetrized version $\Sigma_{bb'} + \Sigma_{b'b}$ gives the Jensen-Shannon divergence.

**Page time signature.** For $b < b_{\text{Page}} \sim 1750$, $\Sigma_{bb'}$ increases with $|b-b'|$. For $b > b_{\text{Page}}$, it decreases — the Page curve in matrix form.

**PrimeBookOne storage.** The 3500×3500 matrix $\Sigma$ is stored in compressed form (sparse for light block, dense for heavy).

(End of file - 35 lines)