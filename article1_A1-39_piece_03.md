# A1-39 Worldline_Information_Preservation.md — Piece 03
## Page Curve from Worldline Unitarity

The Page curve for the prime electron worldline is derived from the gap statistics and the unitary evolution of the full system.

**Total system is pure.** The full worldline state $\rho_{\text{total}}$ is pure (A1-18 path integral). The von Neumann entropy $S(\rho_{\text{total}}) = 0$. The Page curve arises from entanglement between subregions.

**Subregion entropy.** For a boundary subregion $A$ (set of books), the entropy is:
$$S_A = -\text{Tr}(\rho_A \log \rho_A) = \sum_{d \in A} \left[ \frac{\beta\hbar}{\kappa d} \frac{e^{-\beta\hbar/(\kappa d)}}{1+e^{-\beta\hbar/(\kappa d)}} + \log\left(1+e^{-\beta\hbar/(\kappa d)}\right) \right]$$
This is the sum over gap sectors in $A$ (A1-31).

**Page curve phases.**
1. **Early time ($t < t_P$):** Heavy sector dominates, $S_A \sim t$ (rising).
2. **Page time ($t = t_P$):** $S_A$ peaks at $\frac{1}{2} \log \dim \mathcal{H}_{\text{heavy}}$.
3. **Late time ($t > t_P$):** Light sector (radiation) dominates, $S_A$ falls.

**Unitarity = Page curve return.** The decrease of $S_A$ for $t > t_P$ is the signature of unitary evolution. The information that fell into the heavy sector is returned via the light sector.

**BPS contribution: constant.** The 78 BPS states contribute a constant $\log 78$ to $S_A$ at all times. This is the topological information that never thermalizes.

**Page curve from relative entropy.** The relative entropy $S(\rho_A||\sigma_A)$ (A1-34) measures the deviation from the vacuum. At $t_P$, the relative entropy equals the entanglement entropy:
$$S(\rho_A(t_P)||\sigma_A) = S_A(t_P)$$

**Compton scale as final time.** The worldline reaches the Compton scale after 3.67B steps (A1-09). The final entropy is zero — complete information recovery.

**PrimeBookOne Page curves.** The 3500 books give discrete Page curves $S_A(b)$. The curves converge to the continuum Page curve as $b \to 3500$.

(End of file - 35 lines)