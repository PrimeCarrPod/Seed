# A1-38 Worldline_Holography.md — Piece 08
## Boundary OPE and Bulk Locality

Bulk locality in AdS$_2$ is equivalent to the convergence of the boundary operator product expansion (OPE). The gap statistics determine the OPE coefficients.

**Boundary OPE from gaps.** The OPE of two boundary primaries $\mathcal{O}_i, \mathcal{O}_j$ corresponding to gaps $d_i, d_j$ is:
$$\mathcal{O}_i(t) \mathcal{O}_j(0) \sim \sum_k C_{ij}^k(d_i, d_j) |t|^{h_k - h_i - h_j} \mathcal{O}_k(0)$$
where $h_i = d_i/16$, and the OPE coefficients $C_{ij}^k$ are determined by the gap correlation function:
$$C_{ij}^k \sim \langle d_i d_j d_k \rangle_{\text{connected}}$$

**Bulk locality = OPE convergence.** In the bulk, two fields $\phi(z_1), \phi(z_2)$ commute at spacelike separation. In the boundary, this is equivalent to the OPE converging when $|t| > |z_1 - z_2|$. The gap ratio $d_{\text{next}}/d$ controls the OPE convergence radius.

**Gap correlation and bulk commutator.** The bulk commutator is:
$$[\phi(z_1), \phi(z_2)] \sim \sum_{d_i, d_j} C_{ij}^k \langle d_i d_j \rangle |z_1 - z_2|^{\Delta_k - \Delta_i - \Delta_j}$$
Locality requires this to vanish for $|z_1 - z_2| > 0$, which imposes constraints on the gap correlations.

**Light-cone OPE.** For light-like separation in the boundary ($t \to 0$), the OPE is dominated by the identity operator:
$$\mathcal{O}_i(t) \mathcal{O}_j(0) \sim \frac{\delta_{ij}}{|t|^{2h_i}} + \text{regular}$$
The regular terms are determined by the connected gap correlations.

**BPS OPE: trivial.** For BPS operators ($d > 16$), the OPE is trivial because $S(\rho_{\text{BPS}}||\sigma_{\text{BPS}}) = 0$ (A1-34). The BPS operators commute exactly:
$$[\mathcal{O}_i^{\text{BPS}}, \mathcal{O}_j^{\text{BPS}}] = 0$$
This is the topological nature of the BPS sector.

**Twin prime OPE.** For twin prime operators ($d=2$, $h=1/8$), the OPE has the standard 1D CFT form with non-trivial coefficients determined by the twin prime correlation function.

**Bulk reconstruction from OPE.** The HKLL map (Piece 06) reconstructs bulk fields from the boundary OPE. The smearing kernel is the boundary-to-bulk propagator, which is the OPE coefficient of the identity.

**PrimeBookOne OPE data.** The 3500 books give the OPE coefficients $C_{ij}^k(b)$ at each scale. The coefficients flow under RG (A1-36) and converge to the continuum CFT$_1$ values.

(End of file - 32 lines)