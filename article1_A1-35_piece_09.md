# A1-35 Worldline_Quantum_Error_Correction.md — Piece 09
## Decoupling Additivity — Light/Heavy Code Sectors

The decoupling additivity of relative entropy (A1-34, Piece 07) implies a natural code concatenation structure: light and heavy gap sectors form independent codes.

**Decoupling at $d=16$.** From A1-34, the relative entropy splits at gap scale $d=16$:
$$S(\rho||\sigma) = S(\rho_{\text{light}}||\sigma_{\text{light}}) + S(\rho_{\text{heavy}}||\sigma_{\text{heavy}})$$
where $\rho_{\text{light}}$ has gaps $d < 16$, $\rho_{\text{heavy}}$ has gaps $d > 16$. This is the Wilsonian RG decoupling of UV (small gaps) and IR (large gaps).

**Light sector code.** The light sector ($d < 16$) includes gaps $\{2, 4, 6, 8, 10, 12, 14\}$. These are the common small gaps with high multiplicity. The light code space is:
$$\mathcal{C}_{\text{light}} = \bigoplus_{d<16} \mathcal{H}_d$$
Each $\mathcal{H}_d$ has dimension $m_d$ (multiplicity of gap $d$). The light code is a multi-level code with $d_{\text{light}} \sim 2$.

**Heavy sector code.** The heavy sector ($d > 16$) includes gaps $\{18, 20, 22, \dots\}$ up to record gaps. The heavy code space is:
$$\mathcal{C}_{\text{heavy}} = \bigoplus_{d>16} \mathcal{H}_d$$
The heavy code includes the BPS sector (record gaps) and has $d_{\text{heavy}} \sim 18$.

**Code concatenation.** The full code is the tensor product (concatenation) of light and heavy codes:
$$\mathcal{C}_{\text{full}} = \mathcal{C}_{\text{light}} \otimes \mathcal{C}_{\text{heavy}}$$
Logical qubits: $\mathcal{C}_{\text{light}}$ encodes many low-distance qubits; $\mathcal{C}_{\text{heavy}}$ encodes few high-distance qubits.

**Additivity of error bounds.** For an error $\mathcal{E} = \mathcal{E}_{\text{light}} \otimes \mathcal{E}_{\text{heavy}}$:
$$S(\mathcal{E}(\rho)||\rho) = S(\mathcal{E}_{\text{light}}(\rho_{\text{light}})||\rho_{\text{light}}) + S(\mathcal{E}_{\text{heavy}}(\rho_{\text{heavy}})||\rho_{\text{heavy}})$$
An error is correctable iff it is correctable in both sectors independently.

**RG flow and code hierarchy.** The RG flow $d \to d/b$ maps light sector to heavy sector. At the self-dual point $d=16$, the light and heavy codes have symmetric structure. This is the critical gap value where UV and IR codes meet.

**BPS zero preserved.** The BPS sector is entirely in the heavy code ($d_{\text{record}} > 16$ for all but the first few). The zero relative entropy property $S(\rho_{\text{BPS}}||\sigma_{\text{BPS}}) = 0$ (A1-34) is preserved in the heavy sector additivity.

**PrimeBookOne sector structure.** The 3500×3500 syndrome matrix (A1-34) block-diagonalizes at $d=16$: light-light block, heavy-heavy block, and light-heavy off-diagonals are zero.

(End of file - 32 lines)