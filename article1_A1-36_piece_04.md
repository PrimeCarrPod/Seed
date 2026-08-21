# A1-36 Worldline_Decoupling_Limits.md — Piece 04
## Matching at the Self-Dual Point d = 16

The self-dual point $d=16$ (A1-35, Piece 10) is where light and heavy sectors meet. Matching conditions ensure continuity of physics across the RG boundary.

**Matching scale.** The RG cutoff is $\Lambda = 16$. Gaps $d < 16$ are integrated out to define the heavy effective theory; gaps $d > 16$ are integrated out to define the light effective theory. At $d=16$, the two descriptions must agree.

**Operator matching.** Gap operators $d_n$ are matched across the boundary. For an operator $\mathcal{O}_d$ in the light theory with gap $d < 16$, its heavy theory counterpart $\mathcal{O}_{d'}$ with $d' = 256/d$ (by $d \leftrightarrow 256/d$ duality, since $16^2 = 256$) has the same correlation functions.

**Correlation function matching.** The light-light and heavy-heavy correlators must match at the boundary:
$$\lim_{d \to 16^-} \langle \mathcal{O}_d \mathcal{O}_d \rangle_{\text{light}} = \lim_{d \to 16^+} \langle \mathcal{O}_d \mathcal{O}_d \rangle_{\text{heavy}}$$
This fixes the matching conditions for the effective couplings.

**Relative entropy matching.** From A1-34, the relative entropy additivity at $d=16$ is exact:
$$S(\rho||\sigma)\big|_{d=16} = S(\rho_{\text{light}}||\sigma_{\text{light}}) + S(\rho_{\text{heavy}}||\sigma_{\text{heavy}})$$
The matching condition is that the cross-terms vanish identically at $d=16$.

**Hamiltonian matching.** The full Hamiltonian $H = H_{\text{light}} + H_{\text{heavy}} + H_{\text{int}}$ must have $H_{\text{int}} = 0$ at $d=16$. The interaction term $H_{\text{int}}$ couples light and heavy gaps. At the self-dual point, $H_{\text{int}}$ vanishes by gap inversion symmetry $d \leftrightarrow 256/d$.

**Entropy matching.** The total entropy decomposes as:
$$S(\rho) = S_{\text{light}}(\rho_{\text{light}}) + S_{\text{heavy}}(\rho_{\text{heavy}}) + S_{\text{int}}(\rho)$$
At $d=16$, $S_{\text{int}} = 0$ by decoupling (A1-34). The entropies match continuously.

**QEC matching (A1-35).** The light/heavy code concatenation (A1-35, Piece 09) matches at $d=16$: the light code has distance $d_{\text{light}} \sim 2$; the heavy code has $d_{\text{heavy}} \sim 18$. The concatenated code has distance $d_{\text{code}} = d_{\text{light}} \times d_{\text{heavy}} \sim 36$.

**PrimeBookOne matching.** The 3500×3500 syndrome matrix (A1-35, Piece 11) block-diagonalizes at book index corresponding to $d=16$. The matching condition is that off-diagonal blocks are zero.

(End of file - 34 lines)