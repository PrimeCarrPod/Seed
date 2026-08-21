# A1-35 Worldline_Quantum_Error_Correction.md — Piece 10
## QEC and IR/UV Duality — Dual Codes

The IR/UV duality of the prime electron worldline (A1-26, A1-34) induces a duality between QEC codes: gap inversion $d \to 1/d$ maps the code to its dual.

**Gap inversion duality.** The IR/UV duality maps gap $d \mapsto \tilde{d} = 1/d$ (in units where the self-dual point is $d=1$). The worldline Hamiltonian transforms as $H = \frac{\hbar}{\kappa}\sum d_n^{-1} \mapsto \tilde{H} = \frac{\hbar}{\kappa}\sum \tilde{d}_n^{-1} = \frac{\hbar}{\kappa}\sum d_n$.

**Dual code space.** Under gap inversion, the code space $\mathcal{C} = \bigoplus_d \mathcal{H}_d$ maps to the dual code space $\tilde{\mathcal{C}} = \bigoplus_{\tilde{d}} \mathcal{H}_{\tilde{d}}$ where $\tilde{d} = 1/d$. The multiplicities are preserved: $\dim \mathcal{H}_d = \dim \mathcal{H}_{1/d}$.

**Dual logical operators.** For a logical operator $L$ in $\mathcal{C}$, the dual operator $\tilde{L}$ in $\tilde{\mathcal{C}}$ acts on the inverted gap sectors. For the twin prime code ($d=2$), the dual is the gap $d=1/2$ sector (which may not exist in the physical spectrum — it's a formal dual).

**Self-dual point $d=1$.** The gap $d=1$ is self-dual. However, $d=1$ does not occur in the prime gap spectrum (gaps are even). The self-dual point is a formal concept; the physical self-dual scale is $d=16$ from decoupling (Piece 09).

**Dual syndrome measurement.** The syndrome matrix $\Sigma_{bb'}$ (Piece 03) transforms under duality as:
$$\tilde{\Sigma}_{bb'} = \Sigma_{bb'}$$
The relative entropy is duality-invariant (A1-34): $S(\rho(d)||\sigma(d)) = S(\rho_{\text{dual}}(d^{-1})||\sigma_{\text{dual}}(d^{-1}))$.

**Dual error channels.** An error channel $\mathcal{E}$ with gap shift $\delta$ maps to a dual error channel $\tilde{\mathcal{E}}$ with gap shift $\tilde{\delta} = -\delta/d^2$ (to first order). The Knill-Laflamme matrix transforms as $C_{ab} \mapsto \tilde{C}_{ab} = C_{ab}$ (invariant).

**Twin prime dual code.** The twin prime code has $d=2$. Its formal dual has $\tilde{d}=1/2$. In the physical spectrum, the closest dual is the heavy sector with large gaps. The duality maps:
$$\text{twin prime code (UV)} \leftrightarrow \text{BPS code (IR)}$$
This is the UV/IR code duality: many low-distance qubits (twin primes) $\leftrightarrow$ few high-distance qubits (BPS/record gaps).

**Duality and error correction.** If an error is correctable in the UV code, its dual is correctable in the IR code. The error threshold is self-dual: $\epsilon_{\text{th}}(d) = \epsilon_{\text{th}}(1/d)$. At $d=16$, the threshold is symmetric.

**PrimeBookOne dual logbook.** The 3500×3500 syndrome matrix is symmetric under book index inversion $b \mapsto 3501-b$ (approximate), reflecting the IR/UV duality in the data.

(End of file - 31 lines)