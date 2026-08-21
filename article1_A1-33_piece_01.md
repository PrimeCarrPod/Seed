# A1-33 Worldline_Modular_Hamiltonian.md — Piece 01
## Introduction — Modular Hamiltonian from Prime Gaps

The modular Hamiltonian $K = -\log \rho$ generates the modular flow $\alpha_s(\cdot) = e^{i s K} \cdot e^{-i s K}$, which is the central object in Tomita-Takesaki modular theory. For the prime electron worldline, $K$ is explicitly computable from the prime gap covariance matrix.

**Modular Hamiltonian definition.** For a density matrix $\rho = e^{-\beta H}/Z$ (thermal state at inverse temperature $\beta$), the modular Hamiltonian is:
$$K = -\log \rho = \beta H - \log Z$$

For the worldline, $H = \frac{\hbar}{\kappa} \sum_n d_n^{-1}$ (A1-17) and $\beta$ is the inverse temperature. The modular flow is proper-time evolution rescaled by $\beta$: $\alpha_s = e^{i s \beta H} \cdot e^{-i s \beta H}$.

**Gap-weighted modular Hamiltonian.** For a spatial region A, the reduced density matrix $\rho_A = \text{Tr}_B(\rho)$ has modular Hamiltonian $K_A = -\log \rho_A$. For Gaussian states (A1-31), $K_A$ is quadratic in fermion/boson operators:
$$K_A = \sum_{k} \epsilon_k b_k^\dagger b_k + \text{const.}$$
where $\epsilon_k = \log\left(\frac{\nu_k + 1/2}{\nu_k - 1/2}\right)$ are the modular energies, and $\nu_k$ are symplectic eigenvalues of the gap covariance matrix $\Sigma_A$ (A1-32 piece 02).

**PrimeBookOne as modular data.** The 3.67 billion gap differences provide the exact covariance $\Sigma_{nm} = \kappa^2 \langle d_n d_m \rangle - \kappa^2 \langle d_n \rangle \langle d_m \rangle$ for any region. The modular Hamiltonian spectrum $\{\epsilon_k\}$ is determined by the gap ratios in that region.

**BPS sector modular Hamiltonian.** For the 78 BPS states (A1-28), $\rho_{\text{BPS}} = \frac{1}{78}\mathbb{I}_{78}$, so $K_{\text{BPS}} = \log 78 \cdot \mathbb{I}_{78}$. The modular flow is trivial (identity) on the BPS sector — topological protection.

**Modular flow as RG flow.** The modular parameter $s$ is related to proper time $\tau$ by $s = \tau / \beta$. The modular flow generates the renormalization group flow in the IR/UV duality (A1-26 piece 09): $s \to \infty$ is IR, $s \to -\infty$ is UV.

**Modular Hamiltonian and entanglement.** The entanglement entropy is the expectation value of $K$: $S = \langle K \rangle_\rho = \text{Tr}(\rho K)$. For the BPS sector, $S_{\text{BPS}} = \log 78$. For the full system, $S = \sum_k \left[ (\nu_k+1/2)\log(\nu_k+1/2) - (\nu_k-1/2)\log(\nu_k-1/2) \right]$ (A1-31 piece 02).

**Connes cocycle and modular automorphism.** The relative modular operator $\Delta_{\rho,\sigma} = \rho \sigma^{-1}$ generates the Connes cocycle. For the worldline, this is $\Delta_{\rho,\sigma} = e^{-\beta(H_\rho - H_\sigma)}$, computable from gap sequences.

**Modular Hamiltonian and the Tomita-Takesaki Theorem.** The modular operator $\Delta_\rho = \rho \otimes \rho^{-1}$ on the doubled Hilbert space generates the modular automorphism group $\sigma_t^\rho(A) = \Delta_\rho^{it} A \Delta_\rho^{-it}$. For the worldline, this is the modular flow on the algebra of gap operators.

**KMS Condition for Prime Gaps.** The modular flow satisfies the KMS condition at temperature $1/\beta$: $\langle A \alpha_{i\beta}(B) \rangle_\rho = \langle B A \rangle_\rho$ for all gap operators $A, B$. This encodes the thermal nature of the worldline state.