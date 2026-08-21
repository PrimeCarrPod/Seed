# A1-40 Worldline_PrimeBookOne.md — Piece 04
## Entanglement Entropy Matrix — 3500×3500

The entanglement entropy matrix from A1-31 gives the von Neumann entropy for each book and subregion.

**Matrix definition.** For a subregion $A$ (set of books), the entropy matrix is:
$$\mathcal{S}_{bb'}^{(A)} = S(\rho_{b,A}) \delta_{bb'} + S(\rho_{b,A} || \rho_{b',A}) (1 - \delta_{bb'})$$
Diagonal entries are single-book entropies; off-diagonal are relative entropies.

**Single-book entropy.** The diagonal entries are:
$$\mathcal{S}_{bb} = S(\rho_b) = -\text{Tr}(\rho_b \log \rho_b) = \sum_{d} m_{b,d} \left[ \frac{\beta\hbar}{\kappa d} \frac{e^{-\beta\hbar/(\kappa d)}}{1+e^{-\beta\hbar/(\kappa d)}} + \log\left(1+e^{-\beta\hbar/(\kappa d)}\right) \right]$$

**Page curve trajectories.** For each book $b$, the Page curve is the sequence $\{\mathcal{S}_{bb}^{(A)}\}$ as $A$ grows from 1 to $b$. The Page time $b_P(b)$ is where entropy peaks:
$$b_P(b) = \arg\max_A \mathcal{S}_{bb}^{(A)}$$
PrimeBookOne stores $b_P(b)$ for all 3500 books.

**BPS entropy contribution.** The BPS sector contributes constant $\log 78$ to all books containing the 78 record gaps:
$$\mathcal{S}_{bb} \supset \log 78 \quad \text{for } b \geq b_{\text{BPS}} \sim 78$$

**Light/heavy split.** The entropy splits at $d=16$ (A1-36):
$$\mathcal{S}_{bb} = \mathcal{S}_{bb}^{\text{light}} + \mathcal{S}_{bb}^{\text{heavy}} + \log 78$$

**Thermal time.** The thermal time $\beta(b)$ for book $b$ is stored as a 3500-vector. At $d=16$, $\beta = 2\pi$ (KMS condition, A1-38).

**Renyi entropy matrices.** For $n \in \{2, 3, \dots, \infty\}$, the Renyi entropy matrices $\mathcal{S}_n$ from A1-32 are stored as additional 3500×3500 matrices.

(End of file - 34 lines)