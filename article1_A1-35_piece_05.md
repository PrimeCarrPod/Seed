# A1-35 Worldline_Quantum_Error_Correction.md — Piece 05
## Relative Entropy Bounds for QEC — Uncorrectable Errors

The relative entropy $S(\mathcal{E}(\rho)||\rho)$ (A1-34) provides a fundamental bound on quantum error correctability. This piece derives the threshold between correctable and uncorrectable errors.

**Relative entropy error detection.** For a channel $\mathcal{E}$ and input state $\rho$, the relative entropy $S(\mathcal{E}(\rho)||\rho)$ measures how much the channel disturbs the state. From A1-34, for Gaussian states:
$$S(\mathcal{E}(\rho)||\rho) = \frac{1}{2} \text{Tr}\left[ \Sigma_{\mathcal{E}(\rho)}^{-1} \Sigma_\rho - \mathbb{I} - \log(\Sigma_{\mathcal{E}(\rho)}^{-1} \Sigma_\rho) \right]$$

**Correctable errors: zero relative entropy.** An error is correctable iff there exists a recovery channel $\mathcal{R}$ such that $\mathcal{R} \circ \mathcal{E}(\rho) = \rho$. This implies $\mathcal{E}(\rho) = \rho$ on the code space, so:
$$S(\mathcal{E}(\rho)||\rho) = 0 \quad \Leftrightarrow \quad \text{error is correctable}$$
In the prime electron worldline, this holds exactly for the BPS sector (A1-28, A1-34): $S(\mathcal{E}(\rho^{\text{BPS}})||\rho^{\text{BPS}}) = 0$ for all $\mathcal{E}$ preserving the BPS subspace.

**Uncorrectable errors: $\Delta\epsilon$ bound.** For errors that take the state out of the code space, the relative entropy is bounded below by the energy gap $\Delta\epsilon$:
$$S(\mathcal{E}(\rho)||\rho) \gtrsim \Delta\epsilon = \frac{\hbar}{\kappa} \left(\frac{1}{d_{\min}} - \frac{1}{d_{\max}}\right)$$
where $d_{\min}, d_{\max}$ are the min/max gaps affected by the error. This follows from the Hamiltonian $H = \frac{\hbar}{\kappa}\sum d_n^{-1}$ (A1-17): energy change $\Delta E \sim \Delta\epsilon$ implies relative entropy $\gtrsim \Delta\epsilon/T$ at temperature $T$.

**Petz recovery fidelity bound.** The Petz recovery map $\mathcal{R}_{\text{Petz}}(\cdot) = \rho^{1/2} \mathcal{E}^\dagger(\mathcal{E}(\rho)^{-1/2} \cdot \mathcal{E}(\rho)^{-1/2}) \rho^{1/2}$ achieves fidelity:
$$F(\rho, \mathcal{R}_{\text{Petz}} \circ \mathcal{E}(\rho)) \geq e^{-S(\mathcal{E}(\rho)||\rho)}$$
For correctable errors ($S=0$), fidelity $=1$. For uncorrectable errors, fidelity decays exponentially with $S$.

**Gap ratio and relative entropy.** For small gap perturbations $d_n \to d_n + \delta_n$, the relative entropy is:
$$S(\mathcal{E}(\rho)||\rho) \approx \frac{1}{2} \sum_n \left(\frac{\delta_n}{d_n}\right)^2$$
Errors with large fractional gap changes $\delta_n/d_n$ are uncorrectable; small fractional changes are correctable.

**Twin prime code threshold.** For the twin prime code ($d=2$), the threshold is $\delta_n/d_n < 1/2$ (cannot change $d=2$ to $d\neq 2$). This gives $S < \frac{1}{2}(1/2)^2 = 1/8$ per gap.

(End of file - 34 lines)