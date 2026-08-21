# A1-40 Worldline_PrimeBookOne.md — Piece 09
## RG Flow Matrices — 3500 Scales

The RG flow data from A1-36 gives the scale dependence of all couplings and observables. PrimeBookOne stores the complete RG trajectory.

**Beta function matrix.** The gap beta function $\beta(d) = \mu \frac{d d}{d\mu}$ evaluated at each book:
$$\mathcal{B}_b = \beta(d_{\text{typical}}(b))$$
where $d_{\text{typical}}(b)$ is the median gap in book $b$. The zero at $d=16$ (book $b_{16} \sim 1750$) is the self-dual fixed point.

**Running couplings.** The running $\kappa$, $\hbar$, $\beta$, and central charge $c$ at each book:
$$\kappa(b) = \kappa_0 \left(1 - \frac{\beta_0}{\kappa_0} \log\frac{p_b}{p_0}\right)^{-1}$$
$$\hbar(b) = \hbar_0 \left(\frac{p_b}{p_0}\right)^{\gamma_\hbar}$$
$$c(b) = c_{\text{UV}} - \frac{3}{\pi} \int_{p_0}^{p_b} \beta(d) \frac{\partial c}{\partial d} \frac{dd}{d}$$
These are stored as 3500-vectors.

**Light/heavy split flow.** The light sector dimension $D_{\text{light}}(b)$ and heavy sector dimension $D_{\text{heavy}}(b)$:
$$D_{\text{light}}(b) = \sum_{d<16} m_{b,d}, \quad D_{\text{heavy}}(b) = \sum_{d>16} m_{b,d}$$
These grow with $b$. At $b_{16}$, $D_{\text{light}} \approx D_{\text{heavy}}$.

**Matching conditions.** At $b = b_{16}$ (book with $d=16$), the matching conditions from A1-36 are verified:
- Correlation functions continuous: $\langle \mathcal{O} \mathcal{O} \rangle_{\text{light}} = \langle \mathcal{O} \mathcal{O} \rangle_{\text{heavy}}$
- Relative entropy additive: $\Sigma = \Sigma_{\text{light}} + \Sigma_{\text{heavy}}$
- Hamiltonian continuous: $H_{\text{int}} = 0$

**Duality transformation.** The IR/UV duality $d \leftrightarrow 256/d$ maps book $b$ to book $b^*$ where $p_{b^*} \sim 256/p_b$. The duality matrix:
$$\mathcal{D}_{bb'} = \delta_{b, b^*(b')}$$
This relates UV books to IR books.

**Anomaly matching.** The anomaly coefficient (A1-23) is RG invariant:
$$\mathcal{A}(b) = \text{Index}(D) = 78 \quad \text{for all } b$$
PrimeBookOne stores the anomaly at each scale as verification of index theorem.

(End of file - 32 lines)