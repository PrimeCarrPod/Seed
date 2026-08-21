# A1-35 Worldline_Quantum_Error_Correction.md — Piece 06
## Modular Hamiltonian as Recovery Generator

The modular Hamiltonian $K = -\log \rho$ (A1-33) generates the Petz recovery map, providing a physical implementation of error correction as modular flow.

**Modular Hamiltonian from gaps.** For the thermal state $\rho = e^{-\beta H}/Z$ with $H = \frac{\hbar}{\kappa}\sum d_n^{-1}$ (A1-17), the modular Hamiltonian is $K = \beta H$ (for thermal states). In general, for a state with covariance $\Sigma$ (A1-33):
$$K = \frac{1}{2} x^T \Sigma^{-1} x + \text{const}$$
where $x$ are the worldline position/momentum operators.

**Modular flow as continuous correction.** The modular flow $\alpha_t(A) = \rho^{it} A \rho^{-it} = e^{iKt} A e^{-iKt}$ generates a one-parameter group of automorphisms. For error correction, we consider the flow on the channel output:
$$\mathcal{E}_t(\rho) = \alpha_t(\mathcal{E}(\rho)) = \rho^{it} \mathcal{E}(\rho) \rho^{-it}$$
As $t$ varies, $\mathcal{E}_t(\rho)$ moves through the space of states. At $t = -i/2$, we recover the Petz map.

**Petz map from modular theory.** The Petz recovery map is:
$$\mathcal{R}_{\text{Petz}}(\sigma) = \rho^{1/2} \mathcal{E}^\dagger(\mathcal{E}(\rho)^{-1/2} \sigma \mathcal{E}(\rho)^{-1/2}) \rho^{1/2}$$
This can be written as $\mathcal{R}_{\text{Petz}} = \mathcal{E}^\dagger_{\text{mod}}$ where $\mathcal{E}_{\text{mod}}$ is the modular conjugated channel.

**Modular Hamiltonian gap structure.** For the prime electron worldline, $K = \frac{\beta\hbar}{\kappa}\sum d_n^{-1}$. The modular flow acts on gap operators as:
$$\alpha_t(d_n) = e^{iKt} d_n e^{-iKt} = d_n e^{i\beta\hbar t/(\kappa d_n)}$$
Each gap sector evolves with its own frequency $\omega_n = \beta\hbar/(\kappa d_n)$.

**BPS sector: trivial modular flow.** For BPS states (A1-28), $\rho^{\text{BPS}} = \frac{1}{78}\mathbb{I}_{78}$, so $K^{\text{BPS}} = 0$ and $\alpha_t = \text{id}$. The BPS sector is invariant under modular flow — errors in this sector are perfectly correctable without active recovery.

**Recovery as modular evolution.** The optimal recovery time is $t = -i/2$, giving $\mathcal{R} = \alpha_{-i/2} \circ \mathcal{E}^\dagger \circ \alpha_{i/2}$. This is the modular theory analog of the transpose channel.

**Error correction as modular flow trajectory.** Starting from $\rho$, an error maps $\rho \to \mathcal{E}(\rho)$. The modular flow from $\mathcal{E}(\rho)$ back to $\rho$ is the error correction trajectory. The length of this trajectory in relative entropy is $S(\mathcal{E}(\rho)||\rho)$.

(End of file - 32 lines)