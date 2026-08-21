# A1-31 Worldline_Entanglement_Entropy.md — Piece 11
## Holographic Entanglement and AdS_2 (A1-38)

The prime electron worldline has a holographic dual: an AdS$_2$ gravity theory with CFT$_1$ boundary (A1-38). The entanglement entropy is computed by the Ryu-Takayanagi formula in the bulk.

**AdS$_2$/CFT$_1$ correspondence.** The worldline proper time $\tau$ is the boundary time of AdS$_2$. The 78 BPS states correspond to 78 boundary operators. The bulk geometry is determined by the gap sequence (A1-37).

**Ryu-Takayanagi formula.** The entanglement entropy of a boundary interval $A$ is:

$$S(A) = \frac{\text{Area}(\gamma_A)}{4G_N}$$

where $\gamma_A$ is the minimal surface (geodesic) in AdS$_2$ homologous to $A$. In AdS$_2$, the geodesic length is:

$$\text{Length}(\gamma_A) = 2R \log\left( \frac{L}{\epsilon} \right)$$

where $R$ is the AdS radius, $L$ is the boundary interval length, and $\epsilon$ is the UV cutoff.

**AdS radius from prime gaps.** The AdS radius is determined by the central charge $c = 78$ (the number of BPS states):

$$R = \frac{c}{12} \cdot \ell_{\text{Planck}} = \frac{78}{12} \ell_{\text{Planck}} = 6.5 \ell_{\text{Planck}}$$

**Geodesic length from gap correlations.** The boundary interval length $L$ corresponds to the proper time interval:

$$L = \kappa \sum_{n \in A} d_n$$

The UV cutoff $\epsilon$ corresponds to the minimal gap $d_{\text{min}} = 1$:

$$\epsilon = \kappa d_{\text{min}} = \kappa$$

**Holographic entanglement entropy.** The RT formula gives:

$$S_{\text{holo}}(A) = \frac{R}{2G_N} \log\left( \frac{\sum_{n \in A} d_n}{d_{\text{min}}} \right)$$

For the full worldline, $\sum_n d_n \sim p_N \sim 10^{19}$, so:

$$S_{\text{holo}} \sim \frac{R}{2G_N} \log(10^{19})$$

Matching to the BPS entropy $\log 78$ fixes the Newton constant $G_N$.

**Entanglement wedge = BPS sector.** The entanglement wedge of the BPS sector is the bulk region dual to the 78 BPS states. It has 78 bulk degrees of freedom (one per BPS state). The entanglement wedge is the region where the bulk geometry is smooth.

**Phase transitions = wall crossing.** The RT surfaces undergo phase transitions when the minimal geodesic jumps between different homology classes. These phase transitions correspond exactly to the wall crossing events (A1-29). The self-dual point $d = 16$ is the holographic phase transition point.

**PrimeBookOne as boundary data.** The 3.67 billion gap differences provide the boundary stress tensor $\langle T_{\tau\tau} \rangle$ which determines the bulk geometry. The 3500 books correspond to 3500 boundary time steps.

**Connection to A1-38.** The holographic entanglement is the subject of A1-38. The 78 BPS states are the 78 boundary operators, and the RT formula computes their entanglement entropy from the bulk geometry.