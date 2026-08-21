# A1-33 Worldline_Modular_Hamiltonian.md — Piece 06
## IR/UV Duality as Modular Flow — Gap Inversion Symmetry

The IR/UV duality $d_n \leftrightarrow 1/d_n$ (A1-25 piece 09) is realized as modular flow on $K$.

**Duality action on modular Hamiltonian.** Under $d_n \leftrightarrow 1/d_n$, the worldline Hamiltonian transforms as:
$$H = \frac{\hbar}{\kappa} \sum d_n^{-1} \leftrightarrow H_{\text{dual}} = \frac{\hbar}{\kappa_{\text{dual}}} \sum d_n$$

The modular Hamiltonian $K = \beta H - \log Z$ transforms to $K_{\text{dual}} = \beta_{\text{dual}} H_{\text{dual}} - \log Z_{\text{dual}}$. The duality map on $\beta$ is $\beta_{\text{dual}} = \beta \cdot \frac{\langle d^{-1} \rangle}{\langle d \rangle}$.

**Modular flow as duality generator.** The modular flow $U(s) = e^{-i s K}$ implements the duality at imaginary parameter:
$$U(i/2) H U(-i/2) = H_{\text{dual}}$$
This is the KMS condition for the modular flow at temperature $T = 1/\beta$. The imaginary modular parameter $s = i/2$ generates the duality transformation.

**Self-dual modular Hamiltonian.** At the self-dual point $d_n = 16$ (A1-26 piece 09), $K = K_{\text{dual}}$. The modular spectrum is symmetric: $\epsilon_k = \epsilon_{\text{dual},k}$. The self-dual modular Hamiltonian has a $\mathbb{Z}_2$ symmetry.

**BPS sector duality invariance.** The 78 BPS states have $\epsilon = 0$ in both frames. The modular Hamiltonian restricted to BPS sector is $K_{\text{BPS}} = \log 78 \cdot \mathbb{I}$, which is trivially duality-invariant.

**Modular flow and mass hierarchy.** The modular energies $\epsilon_k$ set the mass scales:
- BPS: $m = 0$ (protected)
- Non-BPS: $m \sim \epsilon_k / \beta$ (gap-dependent)
- Goldstino: $m_{3/2} \sim 10^{-8}$ (SUSY breaking scale)

The modular flow connects UV masses (small gaps) to IR masses (large gaps) via the duality.

**PrimeBookOne duality verification.** The 3500 books show the modular spectrum transforming correctly under $d \leftrightarrow 1/d$ across the duality map. The self-dual point $d=16$ corresponds to the modular energy $\epsilon_{\text{sd}} = \log(1 + \sqrt{2}) \approx 0.88$.