# A1-38 Worldline_Holography.md — Piece 04
## Holographic QEC — Bulk Operators as Logical Operators

The holographic correspondence is exactly a quantum error correcting code (A1-35). Bulk operators are logical operators of the boundary QEC code.

**Holography = QEC.** The AdS$_2$/CFT$_1$ duality is a QEC code where:
- Physical qubits: boundary degrees of freedom (gap sectors at $d=16$)
- Logical qubits: bulk degrees of freedom (gap sectors at $d \neq 16$)
- Code subspace: states with fixed boundary conditions
- Encoding map: HKLL bulk-to-boundary map

**Bulk operators as logical operators.** A bulk operator $\phi(z)$ at radial position $z = d/16$ is a logical operator of the QEC code. Its code distance is:
$$d_{\text{code}}(z) = 16z = d$$
This is the minimal gap difference needed to distinguish the bulk operator (A1-37, A1-35).

**Code subspace structure.** The code subspace $\mathcal{C}$ factorizes as (A1-35, A1-36):
$$\mathcal{C} = \mathcal{C}_{\text{light}} \otimes \mathcal{C}_{\text{heavy}}$$
where $\mathcal{C}_{\text{light}}$ (twin prime code, $d=2$) encodes UV bulk fields, and $\mathcal{C}_{\text{heavy}}$ (BPS code, $d > 16$) encodes IR bulk fields.

**Entanglement wedge = correctable region.** The entanglement wedge $\mathcal{E}_A$ (A1-37) is exactly the set of bulk points where erasure of $A^c$ is correctable:
$$\mathcal{E}_A = \{ z : \text{bulk operator at } z \text{ is correctable against erasure of } A^c \}$$
This is the Harlow-Pastawski-Qi-Roberts (HPQR) holographic QEC picture.

**Petz map = HKLL map.** The Petz recovery map (A1-35, A1-37) is exactly the HKLL bulk reconstruction map:
$$\mathcal{R}_A(\phi_{\text{boundary}}) = \phi_{\text{bulk}}(z)$$
For Gaussian states, this is the smearing function:
$$\phi_{\text{bulk}}(z,t) = \int dt' \, K(z,t;t') \phi_{\text{boundary}}(t')$$
where the smearing kernel $K$ is determined by gap ratios.

**BPS sector: exact reconstruction.** The BPS bulk operators (record gaps $> 16$) are exactly reconstructible from any boundary subregion containing the heavy sector. Their code distance is maximal.

**Light sector: approximate reconstruction.** The light bulk operators ($d < 16$) require the full boundary for exact reconstruction. Their code distance is small ($\sim 2$).

**PrimeBookOne QEC holography.** The 3500×3500 syndrome matrix (A1-35) gives the reconstruction fidelity for each bulk operator at each book scale.

(End of file - 34 lines)