# A1-36 Worldline_Decoupling_Limits.md — Piece 08
## Decoupling and Operator Product Expansion

The operator product expansion (OPE) for gap operators realizes the light/heavy decoupling algebraically. The OPE coefficients are determined by gap statistics.

**Gap operators.** Define the gap operator at position $n$:
$$\hat{d}_n = \sum_d d \, |n\rangle\langle n| \delta_{d_n, d}$$
The OPE of two gap operators at nearby positions is:
$$\hat{d}_n \hat{d}_{n+r} \sim \sum_k C_{dd'}^k(r) \hat{\mathcal{O}}_k$$
where $\hat{\mathcal{O}}_k$ are composite operators.

**Light-light OPE.** For $d, d' < 16$:
$$\hat{d}_n \hat{d}_{n+r} \sim \frac{A_{dd'}}{r^{\Delta_{dd'}}} \mathbb{I} + B_{dd'} \hat{d}_n \hat{d}_{n+r} + \dots$$
The leading term is the identity with power-law decay. Exponents $\Delta_{dd'}$ are determined by the gap correlation function.

**Heavy-heavy OPE.** For $d, d' > 16$:
$$\hat{d}_n \hat{d}_{n+r} \sim \delta_{d,d'} \delta_{r,0} \hat{d}_n^2 + \mathcal{O}(e^{-r/\xi})$$
Heavy gaps are sparse; correlations are exponentially suppressed with correlation length $\xi \sim 1/\log(d)$.

**Light-heavy OPE.** For $d < 16$, $d' > 16$:
$$\hat{d}_n \hat{d}_{n+r} \sim 0$$
This is the decoupling theorem: light-heavy OPE coefficients vanish exactly at $d=16$. This is the algebraic origin of the relative entropy additivity (A1-34).

**Self-dual OPE.** At $d = d' = 16$:
$$\hat{d}_n \hat{d}_{n+r} \big|_{d=16} \sim \frac{A_{16}}{r^2} \mathbb{I} + B_{16} \hat{d}_n \hat{d}_{n+r}$$
The marginal operator at $d=16$ has scaling dimension 2, consistent with the self-dual point.

**Gap ratio operators.** The ratio operator $R_n = d_{n+1}/d_n$ (A1-35) has OPE:
$$R_n R_{n+r} \sim \frac{C_R}{r^{\Delta_R}} \mathbb{I} + \dots$$
The ratio operator is marginal at $d=16$ (ratio $\to 1$ for adjacent gaps of similar size).

**QEC operator mapping (A1-35).** The logical operators $X_L, Z_L$ of the twin prime code (A1-35, Piece 07) are light operators ($d=2$). The BPS logical operators are heavy operators ($d > 16$). The OPE separation reflects the code concatenation structure.

**PrimeBookOne OPE data.** The 3500 books give the OPE coefficients $C_{dd'}^k(r)$ empirically. The vanishing of light-heavy coefficients is verified in the data.

(End of file - 33 lines)