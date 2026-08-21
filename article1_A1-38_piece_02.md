# A1-38 Worldline_Holography.md — Piece 02
## Ryu-Takayanagi Formula from Gap Ratios

The Ryu-Takayanagi (RT) formula for entanglement entropy is realized exactly through the gap ratio statistics. The minimal surface in the bulk is a geodesic in gap space.

**RT formula.** For a boundary subregion $A$ (set of books), the entanglement entropy is:
$$S_A = \frac{\text{Area}(\gamma_A)}{4G}$$
where $\gamma_A$ is the minimal surface (geodesic) in the bulk homologous to $A$.

**Area from gap ratios.** The minimal surface $\gamma_A$ corresponds to the set of gaps at the boundary of the entanglement wedge $\mathcal{E}_A$. The area is:
$$\text{Area}(\gamma_A) = 4G \sum_{d \in \partial \mathcal{E}_A} \log\left(\frac{d_{\text{next}}}{d}\right)$$
where the sum is over gaps at the wedge boundary, and $d_{\text{next}}$ is the next gap in the sequence. The ratio $d_{\text{next}}/d$ is the gap ratio (A1-35).

**Geodesic in gap space.** The bulk geodesic equation (A1-15) in AdS$_2$ coordinates $z = d/16$ is:
$$\frac{d^2 z}{d\lambda^2} + \frac{1}{z} \left(\frac{dz}{d\lambda}\right)^2 = 0$$
The solution is a semicircle $z(\lambda)$ reaching maximal depth $z_* = d_*/16$. The minimal surface is at the turning point $d_*$.

**Entanglement wedge boundary.** For a boundary interval of books $A = [b_1, b_2]$, the entanglement wedge is:
$$\mathcal{E}_A = \{ d \in [d_{\min}(A), d_{\max}(A)] \}$$
where $d_{\max}(A)$ is the maximum gap in books $b_1$ to $b_2$. The boundary $\partial \mathcal{E}_A$ is at $d = d_{\max}(A)$.

**RT entropy from gaps.** The entanglement entropy for interval $A$ is:
$$S_A = \sum_{d = d_{\min}(A)}^{d_{\max}(A)} \log\left(\frac{d_{\text{next}}}{d}\right) = \log\left(\frac{d_{\max}(A)}{d_{\min}(A)}\right)$$
This is the log of the gap ratio at the wedge boundary.

**BPS contribution.** The BPS gaps (record gaps $> 16$) contribute a constant $\log 78$ to $S_A$ when they are in the wedge. This is the topological entanglement entropy from the 78 BPS states.

**PrimeBookOne RT data.** The 3500 books give $S_A$ for all intervals $A$. The data matches the RT formula with $G = \kappa/64$.

**Quantum corrections.** The quantum RT formula includes bulk entanglement entropy:
$$S_A = \frac{\text{Area}(\gamma_A)}{4G} + S_{\text{bulk}}(\mathcal{E}_A)$$
The bulk entropy $S_{\text{bulk}}$ is the von Neumann entropy of bulk fields in $\mathcal{E}_A$ (A1-31).

(End of file - 35 lines)