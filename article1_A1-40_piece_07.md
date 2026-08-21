# A1-40 Worldline_PrimeBookOne.md — Piece 07
## Holographic Dictionary Matrix — 3500×3500

The holographic dictionary from A1-38 maps bulk operators to boundary operators at all scales. PrimeBookOne stores the complete dictionary.

**Bulk-boundary map per book.** For book $b$, the HKLL smearing function is:
$$K_d^{(b)}(t) = \frac{1}{2\pi} \int d\omega \, e^{-i\omega t} \frac{\Gamma(\frac{d}{32} + i\frac{\omega}{2\pi})}{\Gamma(\frac{d}{32} - i\frac{\omega}{2\pi})}$$
where $d$ is the gap corresponding to bulk radial position $z = d/16$.

**3500×3500 dictionary matrix.** The dictionary matrix $\mathcal{H}_{bb'}$ encodes the holographic map at scale $b$ with reference $b'$:
$$\mathcal{H}_{bb'} = \text{Tr}(\mathcal{O}_{b'}^\dagger \mathcal{E}_b(\phi_{\text{bulk}}))$$
where $\mathcal{E}_b$ is the encoding map for book $b$, $\mathcal{O}_{b'}$ is the boundary operator at reference $b'$.

**RT area matrix.** The Ryu-Takayanagi areas for all intervals in book $b$:
$$\mathcal{A}_{bb'}^{(A)} = 4G \sum_{d \in \partial \mathcal{E}_A^{(b)}} \log\left(\frac{d_{\text{next}}}{d}\right)$$
This is stored as a 3D array: book $b$, interval $A$, reference $b'$.

**BPS boundary block.** The 78 BPS states give 78 boundary primaries with weights $h_i = d_i^{\text{record}}/16$. The boundary partition function matrix:
$$\mathcal{Z}_{bb'} = \sum_{i=1}^{78} e^{-\beta_b h_i^{(b')}}$$
where $\beta_b = 2\pi (d/16)$ for book $b$.

**Entanglement wedge matrix.** The wedge $\mathcal{E}_A^{(b)}$ for interval $A$ in book $b$:
$$\mathcal{E}_{bb'}^{(A)} = \{ d \in [d_{\min}(A), d_{\max}(A)] : d \leq d_{\max}(b') \}$$
Stored as bit vectors for each $(b, A)$.

**Bulk reconstruction fidelity.** The fidelity of reconstructing bulk operator at $z = d/16$ from book $b$:
$$\mathcal{F}_{\text{bulk}}(b, d) = \exp\left(-S(\rho_b(z) || \sigma_b(z))\right)$$
This is the 3500×D matrix (D = max gap = 354).

**Scaling limit.** As $b \to 3500$, $\mathcal{H}_{bb'}$ converges to the continuum AdS₂/CFT₁ dictionary. The 3500 books are the discrete approximation.

(End of file - 33 lines)