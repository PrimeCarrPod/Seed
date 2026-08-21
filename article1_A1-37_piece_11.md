# A1-37 Worldline_Emergent_Spacetime.md — Piece 11
## PrimeBookOne Bulk Geometry — 3500 Bulk Snapshots

Each of the 3500 books in PrimeBookOne provides a snapshot of the bulk geometry at a different RG scale. The collection forms a discrete bulk spacetime.

**Book as bulk time slice.** Book $b$ corresponds to RG scale $\mu_b = p_b$ (the $b$-th prime). The bulk geometry at this slice has radial coordinate $z$ ranging from $z_{\min} = 2/16 = 1/8$ to $z_{\max} = d_{\max}(b)/16$.

**Bulk metric per book.** The discrete metric for book $b$ is:
$$ds^2_b = \sum_{d \leq d_{\max}(b)} \frac{dz_d^2 + dt_d^2}{z_d^2}$$
where $z_d = d/16$ and $dt_d = \kappa d$. The number of radial points is the number of distinct gaps in book $b$.

**Einstein tensor per book.** The discrete Einstein tensor $G_{\mu\nu}(b)$ is computed from the gap distribution in book $b$. The Einstein equations $G_{\mu\nu} = 8\pi G T_{\mu\nu}$ hold at each book (A1-37, Piece 04).

**RG flow = bulk time evolution.** Moving from book $b$ to $b+1$ is a step in bulk time. The RG flow equations (A1-36, Piece 05) are the bulk equations of motion:
$$\frac{d g_{\mu\nu}}{d \log \mu} = \beta_{\mu\nu}(g)$$
where $\beta_{\mu\nu}$ is the metric beta function.

**BPS blocks as boundary data.** For each book $b$, the BPS block of the syndrome matrix (A1-35, Piece 11) gives the boundary operator spectrum at that scale. The BPS block is constant (zero relative entropy) across all books.

**Entanglement wedge per book.** The entanglement wedge for book $b$ is $\mathcal{E}_b = \{ d \leq d_{\max}(b) \}$. The wedge grows with $b$ as larger gaps appear.

**Modular Hamiltonian per book.** The modular Hamiltonian $K_b = -\log \rho_b$ generates the bulk time evolution from book $b$ to $b+1$. The flow is $\alpha_t^{(b)} = \rho_b^{it} \cdot \rho_b^{-it}$.

**Bulk reconstruction per book.** The QEC reconstruction map $\mathcal{R}_b$ (A1-37, Piece 07) reconstructs bulk operators at scale $\mu_b$ from boundary data at that scale. The code distance is $d_{\text{code}}(b) \sim \log^2 \mu_b$.

**Scaling limit.** As $b \to 3500$, $\mu_b \to \infty$, the discrete bulk approaches the continuum AdS$_2$ with smooth metric $ds^2 = (dz^2 + dt^2)/z^2$. The 3500 books are the discrete approximation to the continuum bulk.

(End of file - 34 lines)