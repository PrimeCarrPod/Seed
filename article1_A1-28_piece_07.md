# A1-28 Worldline_BPS_States.md — Piece 07
## Wall Crossing and Gap Transitions — Kontsevich-Soibelman

The BPS spectrum of the prime electron worldline is not static — it undergoes wall crossing as the moduli (gap parameters) vary. The wall crossing formula of Kontsevich and Soibelman (KS) governs how the BPS degeneracies change when the central charge phases align.

**Central charge phases.** The central charge for BPS state $k$ is $Z_k = Z = 78$ (all BPS states share the same central charge magnitude). The phase is $\arg(Z_k) = \arg(78) = 0$ for all $k$ in the physical chamber. However, the individual gap contributions to the central charge have phases:

$$Z_k = \sum_n c_{k,n} d_n, \quad \arg(Z_k) = \arg\left(\sum_n c_{k,n} d_n\right)$$

where $c_{k,n}$ are coefficients from the index theorem (A1-24). As the gaps $d_n$ vary (e.g., under RG flow or changing the reference scale), the phases $\arg(Z_k)$ can align, triggering wall crossing.

**Gap transitions as wall crossing.** From A1-19, instanton solutions describe tunneling between gap classes. A transition where a record gap is "overtaken" by a new larger gap corresponds to a wall crossing event. The KS formula states that the BPS degeneracies $\Omega(\gamma)$ (where $\gamma$ is the charge vector) change by:

$$\Omega'(\gamma) = \sum_{n \geq 1} \frac{(-1)^{n-1}}{n} \sum_{\substack{\gamma_1+\dots+\gamma_n = \gamma \\ \arg Z_{\gamma_1} = \dots = \arg Z_{\gamma_n}}} \Omega(\gamma_1) \cdots \Omega(\gamma_n) \langle \gamma_1, \dots, \gamma_n \rangle$$

For the prime electron, the charge lattice is $\Gamma = \mathbb{Z}^{78}$ (one dimension per BPS state), and the symplectic pairing $\langle \gamma_i, \gamma_j \rangle$ is determined by the intersection form on the worldline self-intersections (A1-11).

**Prime gap wall crossing.** The most dramatic wall crossing occurs at the self-dual point $d = 16$ (A1-26 piece 09). As the effective gap scale flows from UV ($d \gg 16$) to IR ($d \ll 16$), the BPS spectrum reorganizes:
- In the UV chamber: 71 BPS states with $d > 16$, 7 with $d < 16$
- In the IR chamber: the roles reverse under duality

The KS wall crossing formula for this transition involves the 78 BPS states and their duals. The total Witten index $\Delta = 78$ is invariant, as it must be for a topological invariant.

**Stokes data from prime gaps.** The Stokes matrices encoding the wall crossing are determined by the overlap of BPS wavefunctions (piece 04). The Stokes sector is labeled by the record gap index $k$, and the Stokes multiplier is:

$$\mathbb{S}_k = \exp\left( \sum_{j<k} \Omega(\gamma_j) \langle \gamma_j, \gamma_k \rangle X_{\gamma_j} \right)$$

where $X_\gamma$ are the Darboux coordinates on the moduli space of gap configurations. The prime gap statistics determine the intersection pairing $\langle \gamma_j, \gamma_k \rangle$ — it is non-zero only when the record gaps $j$ and $k$ are "close" in the prime gap sequence (within the same book or adjacent books, A1-10).

**Physical interpretation.** Wall crossing corresponds to a change in the ground state degeneracy of the worldline Hamiltonian $H$ (A1-17) as the proper-time scale crosses a threshold where a new instanton solution (A1-19) becomes dominant. The BPS states are the stable ground states; wall crossing rearranges them but preserves the total index 78.