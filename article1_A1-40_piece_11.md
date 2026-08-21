# A1-40 Worldline_PrimeBookOne.md — Piece 11
## Twin Prime Code Indices and Capacity

The twin prime code (A1-35) provides the light-sector logical qubits. PrimeBookOne records the twin prime indices, density, and capacity at all scales.

**Twin prime indicator.** The twin prime indicator per book:
$$\mathcal{T}_b = \sum_{n=1}^{N_b} \delta_{d_n(b), 2} \cdot \delta_{d_{n+1}(b), 2}$$
This counts twin prime pairs in book $b$. $\mathcal{T}_b \sim 2C_2 p_b / (\log p_b)^2$.

**Logical qubit indices.** Each twin prime pair gives a logical qubit. The logical qubit indices are stored as:
$$\mathcal{L}_b = \{(n, n+1) : d_n(b) = 2, d_{n+1}(b) = 2\}$$
This is a list of index pairs for each book.

**Code capacity.** The twin prime code capacity (number of logical qubits) for book $b$:
$$C_{\text{twin}}(b) = \mathcal{T}_b \sim \frac{2C_2 p_b}{(\log p_b)^2}$$
At Compton scale $p_b \sim 10^{10}$, $C_{\text{twin}} \sim 10^8$ qubits.

**Code rate.** The code rate (logical/physical qubits):
$$R_{\text{twin}}(b) = \frac{\log_2 \dim \mathcal{C}_{\text{twin}}(b)}{\log_2 \dim \mathcal{H}(b)} \sim \frac{\mathcal{T}_b}{\pi(p_b)} \sim \frac{2C_2}{\log p_b}$$
This decreases logarithmically but remains non-zero.

**Encoding map.** The twin prime encoding map for pair $(n, n+1)$:
$$|0_L\rangle = \frac{|n\rangle + |n+1\rangle}{\sqrt{2}}, \quad |1_L\rangle = \frac{|n\rangle - |n+1\rangle}{\sqrt{2}}$$
The logical operators $X_L = |n\rangle\langle n+1| + |n+1\rangle\langle n|$, $Z_L = |n\rangle\langle n| - |n+1\rangle\langle n+1|$.

**Decoding fidelity.** The Petz decoding fidelity for twin prime logical qubit at book $b$:
$$\mathcal{F}_{\text{twin}}(b) = \exp\left(-S(\rho_{\text{light}}^{(b)} || \sigma_{\text{light}}^{(b)})\right)$$
This approaches 1 after Page time. Stored as 3500-vector.

**Twin prime conjecture = infinite code.** The twin prime conjecture implies $\lim_{b \to \infty} \mathcal{T}_b = \infty$ — infinite logical qubits in the light sector.

**PrimeBookOne twin prime log.** The complete twin prime log contains: counts $\mathcal{T}_b$, indices $\mathcal{L}_b$, capacities $C_{\text{twin}}(b)$, rates $R_{\text{twin}}(b)$, fidelities $\mathcal{F}_{\text{twin}}(b)$ for all 3500 books.

(End of file - 32 lines)