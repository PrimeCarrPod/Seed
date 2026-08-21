# A1-29 Worldline_Wall_Crossing.md — Piece 05
## Wall Crossing at Self-Dual Point d* = 16

The self-dual point $d_* = 16$ under the IR/UV duality $d_n \leftrightarrow 1/d_n$ (A1-26 piece 09, A1-27 piece 09) is the most significant wall of marginal stability in the prime electron moduli space. At this point, the duality acts as an outer automorphism of the superconformal algebra, exchanging $H \leftrightarrow K$ and $Q \leftrightarrow S$.

**Central charge alignment at $d = 16$.** At the self-dual point, the effective gap scale is such that many record gaps simultaneously satisfy the marginal stability condition. The central charge phases for the 7 BPS states with $d_{\text{rec}} < 16$ and the 71 with $d_{\text{rec}} > 16$ align in pairs:

$$\arg Z_{d<16} = \arg Z_{256/d>16} \quad \text{at } d = 16$$

This is because $Z(d) \sim d$ and $Z(256/d) \sim 256/d$, and at $d = 16$ they are equal.

**KS transformation at the self-dual wall.** The wall crossing at $d = 16$ is described by the KS operator:

$$\mathbb{K}_{16} = \prod_{k: d_{\text{rec}}^{(k)} \approx 16} \mathbb{K}_{\gamma_k}$$

Since no record gap exactly equals 16 (the closest are 14 and 18), the wall is crossed when the effective gap scale flows through 16. The product is over all 78 record gaps, ordered by their distance from 16.

**BPS spectrum reorganization.** Crossing the $d = 16$ wall exchanges the UV and IR chambers:
- UV chamber ($d \gg 16$): 71 BPS states with $d > 16$, 7 with $d < 16$
- IR chamber ($d \ll 16$): 7 BPS states with $d < 16$, 71 with $d > 16$ (in dual variables)

The total number of BPS states (78) is invariant, as required by the topological invariance of the Witten index $\Delta = 78$.

**Modular S-matrix.** The duality transformation at $d = 16$ is implemented by the modular $S$-matrix on the 78 BPS states:

$$\mathcal{U}_{\text{dual}} |\text{BPS}_k\rangle = \sum_j S_{kj} |\text{BPS}_j\rangle$$

where $S_{kj} = \delta_{k, \tilde{j}}$ with $\tilde{j}$ the dual index. The $S$-matrix satisfies $S^2 = (-1)^F$ (the fermion parity), so $\mathcal{U}_{\text{dual}}^2 = (-1)^F$ — two duality transformations give a fermion parity flip.

**Fixed point CFT.** At the exact self-dual point $d = 16$, the theory is invariant under the duality. This is a fixed point of the RG flow (A1-30) and corresponds to a conformal field theory on the worldline. The central charge of this CFT is $c = 78$ (the number of BPS states). The fixed point theory has enhanced symmetry: the superconformal algebra extends to include the duality as an automorphism.

**Physical interpretation.** The self-dual point $d = 16$ corresponds to the proper-time scale where the Compton wavelength of the electron matches the average prime gap spacing (A1-09). It is the scale where the worldline transitions from particle-like ($d \gg 16$) to wave-like ($d \ll 16$) behavior. The wall crossing at this scale is the worldline analog of T-duality in string theory.