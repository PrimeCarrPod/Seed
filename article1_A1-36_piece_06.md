# A1-36 Worldline_Decoupling_Limits.md — Piece 06
## BPS Zero as RG Invariant — Protected Sector

The BPS sector's zero relative entropy (A1-34, A1-35) is an RG invariant, protected by the index theorem and topological charge.

**BPS relative entropy zero.** From A1-34:
$$S(\rho_{\text{BPS}}||\sigma_{\text{BPS}}) = 0 \quad \forall \rho_{\text{BPS}}, \sigma_{\text{BPS}} \in \mathcal{H}_{\text{BPS}}$$
The 78 BPS states form a 78-dimensional subspace with trivial relative entropy geometry.

**RG invariance proof.** Under RG, the BPS density matrix transforms as $\rho_{\text{BPS}} \to \mathcal{R}(\rho_{\text{BPS}})$ where $\mathcal{R}$ is the RG transformation. Since the BPS sector has no light modes (all record gaps $> 16$), the RG transformation acts trivially:
$$\mathcal{R}(\rho_{\text{BPS}}) = \rho_{\text{BPS}}, \quad \mathcal{R}(\sigma_{\text{BPS}}) = \sigma_{\text{BPS}}$$
Thus $S(\mathcal{R}(\rho_{\text{BPS}}) || \mathcal{R}(\sigma_{\text{BPS}})) = S(\rho_{\text{BPS}} || \sigma_{\text{BPS}}) = 0$.

**Index theorem protection.** The BPS count 78 is fixed by the index theorem (A1-24):
$$\text{Index}(D) = \sum_n \text{sign}(d_n) = 78$$
This is a topological invariant, unchanged under continuous RG flow. The BPS sector cannot be gapped out or mixed with non-BPS states.

**Modular Hamiltonian triviality.** From A1-33, the BPS modular Hamiltonian is $K_{\text{BPS}} = 0$. Under RG, $K$ transforms as $K \to K' = Z K$ where $Z$ is the wavefunction renormalization. Since $K_{\text{BPS}} = 0$, it remains zero: $K'_{\text{BPS}} = 0$.

**Modular flow invariance.** The modular flow $\alpha_t = \rho^{it} \cdot \rho^{-it}$ is trivial on BPS: $\alpha_t^{\text{BPS}} = \text{id}$. RG flow commutes with modular flow, so triviality is preserved.

**Wall crossing and RG.** At a wall (A1-29), the BPS spectrum jumps. But RG flow is within a chamber; walls are boundaries between chambers. Within the physical chamber (where RH holds, A1-30), there are no walls, so the BPS sector is stable under RG.

**QEC protection (A1-35).** The BPS code has distance $d_{\text{code}} \sim \log^2 x$ (A1-35, Piece 04). Under RG, the code distance scales but remains non-zero. The zero syndrome property (A1-35, Piece 11) is preserved.

**BPS as RG fixed point.** The BPS subspace is a fixed point of the RG flow in the space of density matrices. The RG beta function for the BPS relative entropy is exactly zero:
$$\beta_{S_{\text{BPS}}} = \mu \frac{d}{d\mu} S(\rho_{\text{BPS}}||\sigma_{\text{BPS}}) = 0$$

**PrimeBookOne BPS blocks.** The 3500×3500 syndrome matrix (A1-35, Piece 11) has BPS blocks that are exactly zero for all books. Under RG (book index flow), these blocks remain zero.

(End of file - 32 lines)