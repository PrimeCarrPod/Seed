# A1-30 Worldline_Stability_Conditions.md — Piece 08
## Modular Hamiltonian and Stability (A1-33)

The modular Hamiltonian $K = -\log \rho$ (A1-33) generates the modular flow on the worldline Hilbert space. The stability of the modular flow is equivalent to the stability of the worldline under RG flow.

**Modular Hamiltonian for BPS sector.** For the BPS density matrix $\rho_{\text{BPS}} = \frac{1}{78} \sum_k |\text{BPS}_k\rangle\langle \text{BPS}_k|$, the modular Hamiltonian is:

$$K_{\text{BPS}} = -\log \rho_{\text{BPS}} = \log 78 \cdot \mathbb{1}_{\text{BPS}}$$

This is proportional to the identity on the BPS subspace. The modular flow is trivial: $e^{-i s K_{\text{BPS}}} = 78^{-i s} \mathbb{1}_{\text{BPS}}$.

**Full modular Hamiltonian.** The full density matrix $\rho$ includes the non-BPS states (long multiplets) with thermal weights $e^{-\beta(E - 39)}$. The modular Hamiltonian is:

$$K = -\log \rho = \beta (H - 39) + \log Z(\beta)$$

where $Z(\beta) = \text{Tr}(e^{-\beta(H - 39)})$ is the partition function. The modular flow is:

$$\alpha_s(A) = e^{-i s K} A e^{i s K}$$

**Modular flow = RG flow.** The modular flow parameter $s$ is related to the RG scale $\mu$ by:

$$\mu = \mu_0 e^{s}$$

The modular flow drives the system toward the self-dual point $d = 16$ (piece 04). At the fixed point, the modular Hamiltonian becomes a conformal generator.

**Stability of modular flow.** The modular flow is stable iff the modular Hamiltonian has a positive spectrum. The spectrum of $K$ is:

$$\text{Spec}(K) = \{ \beta(E_n - 39) \}$$

where $E_n$ are the energy eigenvalues. The BPS states have $E = 39$, so $K|\text{BPS}\rangle = 0$. The non-BPS states have $E > 39$, so $K > 0$. The positivity of $K$ is equivalent to the BPS bound, which is equivalent to RH.

**Modular chaos and Lyapunov exponent.** The out-of-time-order correlator (OTOC) for the modular flow defines a Lyapunov exponent:

$$\lambda_L = \lim_{t \to \infty} \frac{1}{t} \log \langle [A(t), B(0)]^2 \rangle$$

For the prime electron, $\lambda_L = 0$ in the physical chamber (integrable), but $\lambda_L > 0$ in other chambers (chaotic). The physical chamber has no modular chaos, which is another manifestation of RH stability.

**Modular energy and gap statistics.** The modular energy $K$ is related to the gap statistics by:

$$K = \frac{\hbar}{2\kappa} \sum_n d_n d_{n+1} - 39$$

The expectation value in the physical state is:

$$\langle K \rangle = \frac{\hbar}{2\kappa} \sum_n \langle d_n d_{n+1} \rangle - 39 = S_{\text{BPS}} = \log 78$$

This connects the modular Hamiltonian to the prime gap correlations (A1-08).

**Connection to A1-34 (Relative Entropy).** The relative entropy $S(\rho||\sigma)$ between the physical state and a reference state measures the distance to instability. It is zero in the physical chamber and positive outside (A1-34).