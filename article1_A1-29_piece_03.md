# A1-29 Worldline_Wall_Crossing.md — Piece 03
## Central Charge Phases and Stability Conditions

The walls of marginal stability are loci in moduli space where the central charge phases of two or more BPS states align. For the prime electron, the central charge for BPS state $k$ is:

$$Z_k = \sum_n c_{k,n} d_n$$

where the coefficients $c_{k,n}$ come from the index theorem (A1-24). In the physical chamber, all $Z_k = 78$ (real positive). As we deform the gap sequence, the $Z_k$ acquire phases.

**Phase alignment condition.** Two BPS states with charges $\gamma_i, \gamma_j$ become marginally stable when:

$$\arg Z_i = \arg Z_j \quad \Leftrightarrow \quad \text{Im}(Z_i \bar{Z}_j) = 0$$

This defines a real codimension-1 wall in the moduli space. At the wall, the bound state of $\gamma_i$ and $\gamma_j$ can decay into its constituents.

**Stability condition from A1-30.** The BPS state with charge $\gamma$ is stable in a chamber iff:

$$\arg Z_\gamma > \arg Z_{\gamma'} \quad \text{for all } \gamma' \text{ in the decomposition}$$

This is the $\Pi$-stability condition of Bridgeland (A1-30). For the prime electron, the stability condition is equivalent to the ordering of record gaps: a record gap $d_{\text{rec}}^{(k)}$ is stable iff it is larger than all previous gaps.

**Central charge flow under RG.** Under RG flow (changing the proper-time scale $\kappa$), the effective gaps $d_n^{\text{eff}}(\mu)$ change. The central charges flow as:

$$\mu \frac{d}{d\mu} Z_k(\mu) = \beta_k(\{Z_j\})$$

where the beta function $\beta_k$ is determined by the gap statistics. The RG flow drives the system toward the self-dual point $d_* = 16$ (A1-26 piece 09), which is a fixed point of the flow.

**Wall crossing at the self-dual point.** The self-dual point $d_* = 16$ is a special wall where many central charge phases align simultaneously. At $d = 16$, the IR/UV duality $d \leftrightarrow 1/d$ acts as an outer automorphism (A1-27 piece 09). The wall crossing at this point is the most dramatic — it exchanges the UV and IR chambers and maps the 71 large-gap BPS states to the 7 small-gap BPS states.

**Numerical verification from PrimeBookOne.** The PrimeBookOne data (Tiles 00–188) provides the exact values of the 78 record gaps and their indices. We can compute the central charge phases for any deformation of the gap sequence and verify the wall crossing formula numerically. The KS formula is satisfied to within the statistical fluctuations of the prime gaps.