# A1-37 Worldline_Emergent_Spacetime.md — Piece 07
## Bulk Reconstruction from QEC — Logical Operators

The quantum error correction framework (A1-35) provides the bulk reconstruction map. Bulk operators are logical operators of the QEC code.

**Bulk reconstruction as QEC decoding.** A bulk operator $\phi(z)$ at radial position $z \sim d/16$ is reconstructed on boundary subregion $A$ if and only if $d \in \mathcal{E}_A$ (the entanglement wedge). The reconstruction map is the Petz recovery map (A1-35, Piece 06):
$$\mathcal{R}_A(\cdot) = \rho_A^{1/2} \mathcal{E}^\dagger(\mathcal{E}(\rho_A)^{-1/2} \cdot \mathcal{E}(\rho_A)^{-1/2}) \rho_A^{1/2}$$
where $\mathcal{E}$ is the encoding map from bulk to boundary.

**Logical operators from gap sectors.** The BPS logical operators (A1-35, Piece 04) are heavy-sector operators with $d > 16$. They are reconstructed from the heavy-sector code. The twin prime logical operators (A1-35, Piece 07) are light-sector operators with $d=2$.

**Code distance = radial position.** The code distance for reconstructing a bulk operator at $z$ is:
$$d_{\text{code}}(z) \sim z \cdot 16 = d$$
This is the minimal gap difference needed to distinguish the bulk operator. At $d=16$ ($z=1$), $d_{\text{code}} = 16$ (the Planck scale).

**Entanglement wedge = correctable region.** The entanglement wedge $\mathcal{E}_A$ is exactly the set of bulk points where the QEC code can correct erasures of $A^c$:
$$\mathcal{E}_A = \{ z : \text{bulk operator at } z \text{ is correctable against erasure of } A^c \}$$
This is the Harlow-Pastawski-Qi-Roberts (HPQR) holographic QEC picture.

**Modular flow as reconstruction flow.** The modular flow $\alpha_t$ (A1-33) moves bulk operators radially:
$$\alpha_t(\phi(z)) = \phi(z e^{2\pi t})$$
This is the bulk time evolution = radial evolution in AdS$_2$.

**BPS sector: exact reconstruction.** The BPS bulk operators (at $z > 1$) are exactly reconstructible from any boundary subregion containing the heavy sector. Their code distance is maximal ($\sim \log^2 x$).

**Light sector: approximate reconstruction.** The light-sector bulk operators (at $z < 1$) require the full boundary for exact reconstruction. Their code distance is small ($\sim 2$).

**PrimeBookOne reconstruction.** The 3500×3500 syndrome matrix (A1-35, Piece 11) gives the reconstruction fidelity for each bulk operator at each book scale.

(End of file - 33 lines)