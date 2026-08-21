# A1-37 Worldline_Emergent_Spacetime.md — Piece 06
## BPS States as Boundary CFT — 78 Boundary Operators

The 78 BPS states (A1-28) form the boundary CFT$_1$ dual to the AdS$_2$ bulk. Their properties are determined by the record gap spectrum.

**BPS as boundary primaries.** Each BPS state corresponds to a boundary primary operator $\mathcal{O}_i$ with conformal weight:
$$h_i = \frac{d_i^{\text{record}}}{16}$$
where $d_i^{\text{record}}$ is the $i$-th record gap. The 78 record gaps give 78 primary operators.

**Modular invariance.** The boundary partition function is:
$$Z(\beta) = \sum_{i=1}^{78} e^{-\beta h_i} = \text{Tr}_{\mathcal{H}_{\text{BPS}}} e^{-\beta H_{\text{BPS}}}$$
with $H_{\text{BPS}} = \frac{\hbar}{\kappa} \sum_{i=1}^{78} \frac{1}{d_i^{\text{record}}} |i\rangle\langle i|$. This is modular invariant under $\beta \leftrightarrow 4\pi^2/\beta$ due to the IR/UV duality.

**Boundary relative entropy.** For boundary states $\rho_{\text{BPS}}, \sigma_{\text{BPS}}$, the relative entropy is zero (A1-34):
$$S(\rho_{\text{BPS}} || \sigma_{\text{BPS}}) = 0$$
This means the boundary CFT has no distinguishable states — it is a topological theory.

**Boundary OPE.** The operator product expansion of boundary primaries is:
$$\mathcal{O}_i(z) \mathcal{O}_j(0) \sim \sum_k C_{ij}^k z^{h_k - h_i - h_j} \mathcal{O}_k(0)$$
The OPE coefficients $C_{ij}^k$ are determined by the gap correlation matrix.

**Boundary modular Hamiltonian.** The boundary modular Hamiltonian is:
$$K_{\text{boundary}} = -\log \rho_{\text{BPS}} = 0$$
since $\rho_{\text{BPS}} = \frac{1}{78}\mathbb{I}_{78}$. This is the $d=16$ fixed point where modular flow is trivial.

**Bulk-boundary correspondence.** A bulk field $\phi(z,t)$ at radial position $z \sim d/16$ is dual to a boundary operator $\mathcal{O}_d$ with weight $h = d/16$. The bulk-boundary propagator is:
$$\langle \phi(z,t) \mathcal{O}_d(0) \rangle \sim z^{h} e^{-t^2/z^2}$$

**Twin prime boundary operators.** The twin prime gaps $d=2$ give boundary operators with $h = 2/16 = 1/8$. These are light boundary operators (UV).

**PrimeBookOne boundary data.** The 3500 books give the boundary correlation functions $\langle \mathcal{O}_i \mathcal{O}_j \rangle_b$ at scale $\mu_b$. The BPS block (78×78) is constant (zero relative entropy).

(End of file - 34 lines)