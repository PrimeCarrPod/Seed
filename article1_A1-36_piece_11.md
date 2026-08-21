# A1-36 Worldline_Decoupling_Limits.md — Piece 11
## Decoupling and QEC — Code Concatenation RG

The light/heavy code concatenation from A1-35 (Piece 09) has a natural RG interpretation: the RG flow generates the code hierarchy.

**Concatenated code structure.** The full QEC code is $\mathcal{C} = \mathcal{C}_{\text{light}} \otimes \mathcal{C}_{\text{heavy}}$ (A1-35, Piece 09). The RG flow maps this to a single effective code at scale $\mu$.

**RG as code concatenation.** Integrating out light modes (UV) maps the light code into an effective contribution to the heavy code:
$$\mathcal{C}_{\text{light}} \otimes \mathcal{C}_{\text{heavy}} \xrightarrow{\text{RG}} \mathcal{C}_{\text{eff}}(\mu)$$
At $\mu = 16$, $\mathcal{C}_{\text{eff}} = \mathcal{C}_{\text{heavy}}$ (light modes fully integrated out).

**Running code distance.** The code distance runs with RG scale:
$$d_{\text{code}}(\mu) = \begin{cases}
d_{\text{light}} \sim 2 & \mu \ll 16 \text{ (UV)} \\
d_{\text{light}} \times d_{\text{heavy}}(\mu) & \mu \sim 16 \\
d_{\text{heavy}}(\mu) \sim \log^2 \mu & \mu \gg 16 \text{ (IR)}
\end{cases}$$
At $\mu = 16$, $d_{\text{code}}(16) \sim 36$ (from matching, Piece 04).

**Syndrome matrix RG flow.** The syndrome matrix $\Sigma_{bb'}$ (A1-35, Piece 11) flows under RG. The light block (small gaps) shrinks as modes are integrated out. The heavy block grows. The BPS zero block is invariant.

**Petz map RG flow.** The Petz recovery map (A1-35, Piece 06) $\mathcal{R}_{\text{Petz}}(\mu) = \rho(\mu)^{1/2} \mathcal{E}^\dagger(\mathcal{E}(\rho(\mu))^{-1/2} \cdot \mathcal{E}(\rho(\mu))^{-1/2}) \rho(\mu)^{1/2}$ flows with $\mu$. At $\mu=16$, it factorizes: $\mathcal{R}_{\text{Petz}} = \mathcal{R}_{\text{light}} \otimes \mathcal{R}_{\text{heavy}}$.

**Error threshold flow.** The error threshold $\epsilon_{\text{th}}(\mu) \sim \Delta\epsilon(\mu)$ (A1-35, Piece 05) runs as:
$$\epsilon_{\text{th}}(\mu) = \frac{\hbar(\mu)}{\kappa(\mu)} \left(\frac{1}{d_{\text{min}}(\mu)} - \frac{1}{d_{\text{max}}(\mu)}\right)$$
At $\mu=16$, $d_{\text{min}}=16$, $d_{\text{max}}=16$, so $\epsilon_{\text{th}}(16)$ is maximized (self-dual point has maximum error tolerance).

**Code rate flow.** The code rate $R(\mu) = \log \dim \mathcal{C}(\mu) / \log \dim \mathcal{H}(\mu)$ decreases with $\mu$:
$$R(\mu) \sim \frac{\log \mu}{\mu} \to 0 \text{ as } \mu \to \infty$$
The IR code (BPS) has zero rate in the infinite volume limit, but finite distance.

**PrimeBookOne QEC RG.** The 3500 books give the discrete RG trajectory of the QEC code. The syndrome matrix at each book index is the code at that scale.

(End of file - 32 lines)