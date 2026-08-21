# A1-39 Worldline_Information_Preservation.md — Piece 02
## Modular Flow as Page Time Evolution

The modular Hamiltonian generates the Page time evolution. The Page curve $S_A(t)$ for a subregion $A$ is the entanglement entropy under modular flow.

**Modular Hamiltonian from gaps.** For a subregion $A$ (books $b_1$ to $b_2$), the modular Hamiltonian is:
$$K_A = -\log \rho_A = \frac{1}{2} x_A^T \Sigma_A^{-1} x_A$$
where $x_A$ are the worldline operators restricted to $A$, and $\Sigma_A$ is the gap covariance matrix for $A$ (A1-34).

**Modular flow = Page evolution.** The modular flow $\alpha_t = \rho_A^{it} \cdot \rho_A^{-it}$ acts on the heavy sector as:
$$\alpha_t(\phi_{\text{heavy}}(z)) = \phi_{\text{heavy}}(z e^{2\pi t})$$
This is the bulk time evolution in the entanglement wedge (A1-37). The flow parameter $t$ is the Page time.

**Page time from heavy sector dimension.** The Page time is:
$$t_P = \frac{1}{2\pi} \log \dim \mathcal{H}_{\text{heavy}} \sim \frac{1}{2\pi} \log\left(\prod_{d>16} m_d\right)$$
where $m_d$ are the gap multiplicities for $d > 16$. At $t = t_P$, the entanglement entropy peaks.

**Entanglement entropy under flow.** The entropy of subregion $A$ under modular flow is:
$$S_A(t) = S(\rho_A(t)), \quad \rho_A(t) = \alpha_t(\rho_A)$$
For the heavy sector, $S_A(t)$ rises linearly for $t < t_P$ (information falling in), peaks at $t_P$, then falls for $t > t_P$ (information returning).

**Light sector as radiation.** The light sector ($d < 16$) plays the role of Hawking radiation. Its entropy $S_{\text{light}}(t)$ mirrors the Page curve: it rises after $t_P$ as information is emitted.

**BPS sector: constant entropy.** The BPS sector has $K_{\text{BPS}} = 0$, so $\alpha_t^{\text{BPS}} = \text{id}$. The BPS entropy $S_{\text{BPS}} = \log 78$ is constant — topological information never decays.

**Flow across books.** The modular flow from book $b$ to $b'$ is the RG flow (A1-36). The Page time for book $b$ is $t_P(b) \sim \log(p_b)$.

**PrimeBookOne Page data.** The 3500 books give the Page curve at each scale. The entropy matrix $\mathcal{S}_{bb'} = S(\rho_b || \rho_{b'})$ encodes the curve.

(End of file - 35 lines)