# A1-40 Worldline_PrimeBookOne.md — Piece 05
## Modular Hamiltonian Matrix — 3500×3500

The modular Hamiltonian matrices from A1-33 encode the modular flow generators at all scales.

**Matrix definition.** For each book $b$, the modular Hamiltonian is:
$$K_b = -\log \rho_b$$
For the thermal state, $K_b = \beta H_b$. For general Gaussian states:
$$K_b = \frac{1}{2} x_b^T \Sigma_b^{-1} x_b$$
where $x_b$ are the worldline operators for book $b$.

**3500×3500 modular matrix.** The modular Hamiltonian matrix stores the action of $K_b$ on the full Hilbert space:
$$\mathcal{K}_{bb'} = \text{Tr}_{b'}(K_b \rho_{b'})$$
This is the expectation of $K_b$ in the state of book $b'$. Diagonal entries $\mathcal{K}_{bb} = S(\rho_b)$.

**Modular flow generator.** The modular flow from book $b$ to $b'$ is:
$$\alpha_t^{(b)}(\rho_{b'}) = e^{i t K_b} \rho_{b'} e^{-i t K_b}$$
PrimeBookOne stores the flow trajectory operators for $t \in [0, 2\pi]$.

**BPS modular Hamiltonian.** For BPS books, $K_{\text{BPS}} = 0$ (A1-33, A1-39). The BPS block of $\mathcal{K}$ is identically zero:
$$\mathcal{K}_{bb'} = 0 \quad \text{for } b, b' \in \text{BPS}$$

**KMS condition matrix.** The KMS condition at inverse temperature $\beta_b$:
$$\mathcal{K}_{bb'} = \frac{1}{\beta_b} \log \text{Tr}(e^{-\beta_b H_b} \mathcal{O}_{b'})$$
At $d=16$ (book $b_{16} \sim 1750$), $\beta_{16} = 2\pi$.

**Tomita-Takesaki data.** The modular conjugation operator $J_b$ and the modular operator $\Delta_b = e^{-K_b}$ are stored for each book. The Tomita-Takesaki theorem gives $J_b \Delta_b^{it} J_b = \Delta_b^{-it}$.

**Modular flow as RG.** The RG flow from book $b$ to $b'$ is the modular flow with $t = \log(p_{b'}/p_b)$ (A1-36). PrimeBookOne encodes the full RG trajectory.

(End of file - 34 lines)