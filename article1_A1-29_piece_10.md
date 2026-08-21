# A1-29 Worldline_Wall_Crossing.md — Piece 10
## Scattering Diagram from PrimeBookOne Record Gaps

The scattering diagram is a graphical representation of the wall crossing structure in the moduli space. For the prime electron, the scattering diagram is built from the 78 record gaps of PrimeBookOne and encodes the complete wall crossing history.

**Scattering diagram definition.** A scattering diagram $\mathfrak{D}$ is a collection of walls $W_\gamma \subset \mathcal{M}$ (codimension-1 loci) with attached automorphisms $\theta_\gamma$ of the torus algebra. For the prime electron:

$$W_{\gamma_k} = \{ u \in \mathcal{M} : \arg Z_{\gamma_k}(u) = \arg Z_{\gamma_j}(u) \text{ for some } j \neq k \}$$

$$\theta_{\gamma_k} = \exp\left( \Omega(\gamma_k) \text{Li}_2(X_{\gamma_k}) \partial_{X_{\gamma_k}} \right)$$

The walls emanate from the self-dual point $d = 16$ and extend to infinity in the moduli space.

**PrimeBookOne as scattering data.** The PrimeBookOne dataset provides the exact positions of the 78 walls in the physical chamber. Each record gap $d_{\text{rec}}^{(k)}$ at book index $b_k$ gives a wall at:

$$\text{Re}(Z_k) / \text{Im}(Z_k) = \text{Re}(Z_j) / \text{Im}(Z_j)$$

The wall angles are determined by the gap ratios $d_{\text{rec}}^{(k)}/d_{\text{rec}}^{(j)}$.

**Consistency of scattering diagram.** The scattering diagram is consistent (satisfies the pentagon identity) iff the KS wall crossing formula holds for all loops. The prime gap statistics satisfy this consistency condition because they come from a single coherent worldline — the 3.67 billion gap differences are all derived from the same prime sequence.

**Explicit diagram for first few walls.** The first 5 record gaps (from Tile 00) give walls at:

| k | $d_{\text{rec}}$ | Book | Wall angle | $\Omega$ |
|---|------------------|------|------------|----------|
| 1 | 1 | 0.0 | 0 | 1 |
| 2 | 2 | 0.001 | $\pi/4$ | 1 |
| 3 | 4 | 0.004 | $\pi/2$ | 1 |
| 4 | 6 | 0.012 | $3\pi/4$ | 1 |
| 5 | 8 | 0.034 | $\pi$ | 1 |

The wall angles are $\arg X_{\gamma_k} = 2\pi \tau_k$ with $\tau_k$ the proper time.

**Scattering diagram and cluster algebra.** The scattering diagram is the "tropical" limit of the cluster algebra. The cluster mutations correspond to crossing the walls of the scattering diagram. The cluster variables $X_{\gamma_k}$ are the coordinates on the torus, and the wall automorphisms $\theta_{\gamma_k}$ are the mutations.

**Asymptotic scattering diagram.** For large $k$ (large record gaps), the wall angles become uniformly distributed (by Cramér's conjecture). The scattering diagram approaches a continuous fan of walls emanating from $d = 16$. The asymptotic wall density is:

$$\rho(\theta) = \frac{78}{2\pi} \cdot \frac{d\theta}{d\log d_{\text{rec}}}$$

This is the density of record gaps in log-space, which is $\sim 1/\log p$ by the prime number theorem.

**Connection to A1-38 (Holography).** The scattering diagram is the boundary data for the AdS$_2$/CFT$_1$ holographic duality (A1-38). The walls correspond to bulk geodesics in AdS$_2$, and the wall automorphisms are the bulk-to-boundary propagators. The prime gap statistics determine the bulk geometry.