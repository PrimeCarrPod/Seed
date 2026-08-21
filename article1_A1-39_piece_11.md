# A1-39 Worldline_Information_Preservation.md — Piece 11
## PrimeBookOne Information Flow Log

The 3500 books of PrimeBookOne provide the complete information flow log at all RG scales. Each book is a snapshot of the information state.

**Book as information slice.** Book $b$ corresponds to RG scale $\mu_b = p_b$. The information state at this slice is:
- Entanglement entropy $S_A(b)$ for all subregions $A$
- Relative entropy matrix $\Sigma_{bb'} = S(\rho_b || \rho_{b'})$
- Modular Hamiltonian $K_b = -\log \rho_b$
- QEC syndrome matrix for all codes

**Information flow trajectory.** The trajectory of information through the 3500 books traces the Page curve:
1. Early books ($b \ll 1750$): Heavy sector dominates, entropy rising
2. Middle books ($b \sim 1750$): Page time at $d=16$, entropy peaking
3. Late books ($b \gg 1750$): Light sector dominates, entropy falling

**3500×3500 information matrix.** The full information matrix is:
$$\mathcal{I}_{bb'} = S(\rho_b || \rho_{b'}) + S(\rho_{b'} || \rho_b)$$
This symmetric matrix encodes the information distance between all book pairs.

**BPS block: zero information distance.** The 78×78 BPS block of $\mathcal{I}_{bb'}$ is identically zero. BPS information has zero distance — exact preservation.

**Light/heavy blocks: Page curve.** The light-light and heavy-heavy blocks show the Page curve behavior. At $b \sim 1750$, the blocks have maximum values.

**RG flow = information flow.** The RG flow equations (A1-36) are the information flow equations:
$$\frac{d \mathcal{I}_{bb'}}{d \log \mu} = \beta_{\mathcal{I}}(\mathcal{I})$$
where $\beta_{\mathcal{I}}$ is the information beta function.

**Decoding trajectory.** The Hayden-Preskill decoding trajectory is the path from heavy block to light block in the syndrome matrix. The Petz map at each book gives the decoding fidelity.

**Complete information record.** PrimeBookOne contains the full information history: Page curves, relative entropy bounds, QEC syndromes, modular Hamiltonians, all derived from prime gaps.

(End of file - 34 lines)