# A1-33 Worldline_Modular_Hamiltonian.md — Piece 04
## Modular Hamiltonian Spectrum and the 256-Dim Hilbert Space

The modular Hamiltonian acts on the full 256-dimensional Hilbert space (A1-25, A1-27).

**Hilbert space decomposition.** The 256 states split into:
- 78 BPS states: $K|BPS\rangle = (\log 78)|BPS\rangle$ (zero modular energy $\epsilon = 0$)
- 176 non-BPS states: $K|\psi_k\rangle = (\beta E_k + \log Z)|\psi_k\rangle$ with $\epsilon_k = \beta E_k$
- 2 Goldstino states: $\epsilon_{\text{Goldstino}} \sim 10^{-8}\beta$

**Modular energy levels.** The modular spectrum $\{\epsilon_k\}$ is:
$$\epsilon_k = \begin{cases}
0 & \text{(78-fold degenerate, BPS)} \\
\beta E_k & \text{(176 non-BPS)} \\
\sim 10^{-8}\beta & \text{(2 Goldstino)}
\end{cases}$$
where $E_k$ are the physical energies from the Hamiltonian $H = \frac{\hbar}{\kappa}\sum d_n^{-1}$.

**Modular partition function.** The modular partition function is the Renyi generating function (A1-32):
$$Z_{\text{mod}}(s) = \text{Tr}(e^{-s K}) = \sum_k e^{-s \epsilon_k}$$
$$Z_{\text{mod}}(s) = 78 + \sum_{\text{non-BPS}} e^{-s \beta E_k} + 2 e^{-s \cdot 10^{-8}\beta}$$

**Renyi entropy from modular spectrum.** $S_n = \frac{1}{1-n} \log Z_{\text{mod}}(n-1)$, recovering A1-32 formula.

**Modular density of states.** The density of modular energies is:
$$\rho(\epsilon) = 78 \delta(\epsilon) + \sum_{\text{non-BPS}} \delta(\epsilon - \beta E_k) + 2 \delta(\epsilon - 10^{-8}\beta)$$

**Thermal modular Hamiltonian.** At finite temperature, the modular Hamiltonian includes thermal weights:
$$K(\beta) = \beta H - \log Z(\beta)$$
The modular flow generates thermal time evolution (Connes-Rovelli thermal time hypothesis). The modular parameter $s$ is the thermal time.

**PrimeBookOne spectral statistics.** The 3500 books provide 3500 modular spectra. The BPS delta peak at $\epsilon=0$ is universal (topological). The non-BPS spectrum varies with gap statistics. The spectral gap $\Delta\epsilon = \min \epsilon_{\text{non-BPS}}$ is positive and constant in the physical chamber.