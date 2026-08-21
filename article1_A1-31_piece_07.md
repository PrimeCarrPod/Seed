# A1-31 Worldline_Entanglement_Entropy.md — Piece 07
## Modular Hamiltonian K = -log ρ (A1-33)

The modular Hamiltonian $K = -\log \rho$ generates the modular flow on the worldline Hilbert space. Its spectrum and flow are directly related to the entanglement entropy and RG flow.

**Modular Hamiltonian for BPS sector.** For the BPS density matrix $\rho_{\text{BPS}} = \frac{1}{78}\mathbb{1}_{78}$:

$$K_{\text{BPS}} = -\log \rho_{\text{BPS}} = \log 78 \cdot \mathbb{1}_{78}$$

The modular Hamiltonian is proportional to the identity, so the modular flow is trivial: $e^{-i s K_{\text{BPS}}} = 78^{-i s} \mathbb{1}_{78}$.

**Full modular Hamiltonian.** The full density matrix at inverse temperature $\beta$ is:

$$\rho = \frac{e^{-\beta H}}{Z(\beta)}$$

where $H$ is the worldline Hamiltonian (A1-17). The modular Hamiltonian is:

$$K = -\log \rho = \beta H - \log Z(\beta)$$

This is the standard thermal modular Hamiltonian. The modular flow is:

$$\alpha_s(A) = e^{-i s K} A e^{i s K} = e^{-i s \beta H} A e^{i s \beta H}$$

which is just the Heisenberg time evolution with rescaled time $t = s\beta$.

**Modular flow = RG flow.** The modular parameter $s$ is related to the RG scale $\mu$ by:

$$\mu = \mu_0 e^{s}$$

The modular flow drives the system toward the self-dual point $d = 16$ (A1-30 piece 04). The fixed point of the modular flow is the CFT at $d = 16$.

**Modular Hamiltonian spectrum.** The spectrum of $K$ is:

$$\text{Spec}(K) = \{ \beta(E_n - F) \}$$

where $E_n$ are the energy eigenvalues and $F = -\beta^{-1} \log Z$ is the free energy. The BPS states have $E = 39$, so their modular energy is $\beta(39 - F)$. The non-BPS states have higher modular energy.

**Entanglement entropy as modular energy.** The entanglement entropy is the expectation value of the modular Hamiltonian:

$$S = \langle K \rangle = \text{Tr}(\rho K) = \beta \langle H \rangle - \log Z$$

For the BPS sector at low temperature, $\langle H \rangle = 39$ and $Z \approx 78 e^{-39\beta}$, so:

$$S = \beta \cdot 39 - \log(78 e^{-39\beta}) = \log 78$$

**Modular chaos and OTOC.** The out-of-time-order correlator (OTOC) for the modular flow is:

$$C(s) = \langle [A(s), B(0)]^2 \rangle$$

In the physical chamber, $C(s)$ is bounded (no chaos). In other chambers, $C(s) \sim e^{\lambda_L s}$ with Lyapunov exponent $\lambda_L > 0$. The physical chamber has $\lambda_L = 0$, consistent with RH stability.

**Modular energy and gap statistics.** The modular energy expectation value is:

$$\langle K \rangle = \beta \left( \frac{\hbar}{2\kappa} \sum_n \langle d_n d_{n+1} \rangle - F \right)$$

The gap correlations $\langle d_n d_{n+1} \rangle$ (A1-08) determine the modular energy. The RH bound ensures $\langle K \rangle$ is well-behaved.

**Connection to A1-33.** The modular Hamiltonian is the subject of A1-33. Its flow is the RG flow, and its spectrum encodes the entanglement structure.