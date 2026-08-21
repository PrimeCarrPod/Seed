# A1-29 Worldline_Wall_Crossing.md — Piece 09
## Wall Crossing and Instanton Solutions (A1-19)

The instanton solutions of A1-19 describe tunneling between gap classes on the worldline. Each wall crossing event corresponds to the condensation of an instanton — the moment when the tunneling amplitude becomes large enough to change the vacuum structure.

**Instanton solutions for gap transitions.** From A1-19, the instanton solution for the transition from gap class $C_{k-1}$ to $C_k$ is a worldline configuration $x_{\text{inst}}(\tau)$ that interpolates between the two gap class vacua. The instanton action is:

$$S_{\text{inst}}^{(k)} = \int d\tau \left( \frac{1}{2} \dot{x}^2 + V_k(d_n) \right)$$

where the potential $V_k$ has minima at the gap values of class $C_{k-1}$ and $C_k$, with a barrier between them.

**Instanton zero modes and BPS states.** Each instanton solution carries fermion zero modes from the supercharge $Q$ (A1-26). The number of zero modes is given by the index theorem (A1-24) applied to the instanton background:

$$\text{Index}(D_{\text{inst}}) = \text{sign}(d_{\text{rec}}^{(k)} - d_{\text{ref}}) = 1$$

The single zero mode corresponds to the new BPS state $|\text{BPS}_k\rangle$ created at the $k$-th wall crossing.

**Multi-instanton configurations.** When multiple walls are crossed simultaneously (e.g., at the self-dual point $d = 16$), multi-instanton configurations dominate. The $n$-instanton action is:

$$S_{n\text{-inst}} = \sum_{i=1}^n S_{\text{inst}}^{(k_i)} + \text{interaction terms}$$

The interaction terms are determined by the intersection pairing $\langle \gamma_{k_i}, \gamma_{k_j} \rangle$ (A1-11). This is the worldline analog of the D-brane instanton calculus in string theory.

**Wall crossing from instanton condensation.** The KS wall crossing formula can be derived from the instanton partition function. The generating function of BPS degeneracies is the partition function of the instanton gas:

$$Z = \sum_{\{n_k\}} \exp\left( -\sum_k n_k S_{\text{inst}}^{(k)} + \sum_{k<j} n_k n_j \langle \gamma_k, \gamma_j \rangle \log X_{\gamma_k} \right)$$

The saddle point of this partition function gives the BPS spectrum. Wall crossing occurs when the saddle point changes, which happens when $\arg Z_k = \arg Z_j$.

**Instanton calculus from PrimeBookOne.** The PrimeBookOne data provides the exact values of the instanton actions $S_{\text{inst}}^{(k)}$ and the intersection pairings $\langle \gamma_k, \gamma_j \rangle$. The 3500 books correspond to 3500 instanton sectors. The instanton actions are:

$$S_{\text{inst}}^{(k)} = \frac{1}{\hbar} \kappa d_{\text{rec}}^{(k)} \cdot \text{(book length)}$$

where the book length is $2^{20}$ gaps.

**Resurgence and Borel summation.** The instanton series for the worldline partition function is asymptotic but Borel summable. The singularities in the Borel plane are at the instanton actions $S_{\text{inst}}^{(k)}$. The Stokes data at these singularities is precisely the KS wall crossing data. The prime gap statistics provide the exact resurgence coefficients for the Borel transform.

**Physical interpretation.** The instantons are the "knots" in the one-electron worldline where the proper time makes a large jump. The wall crossing is the process by which these knots are tied — the worldline self-intersects and creates a new topological sector. The 78 record gaps are the 78 knots, and the 78 wall crossings are the 78 tying events.