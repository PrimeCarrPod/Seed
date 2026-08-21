# A1-36 Worldline_Decoupling_Limits.md — Piece 07
## PrimeBookOne RG Flow — 3500 Books Under Scale

The 3500 books of PrimeBookOne provide a discrete set of RG scales. The RG flow across books reveals the scale dependence of all worldline observables.

**Book index as RG scale.** Book $b \in \{1, \dots, 3500\}$ corresponds to prime range up to $p_b \sim b \log b$. The RG scale is $\mu_b = p_b$. As $b$ increases, we flow from UV to IR.

**Gap sequence flow.** The gap sequence for book $b$ is $d_n(b) = p_{n+1}(b) - p_n(b)$ for $n \leq N_b$. As $b$ increases, new larger gaps appear, and the distribution shifts to larger $d$.

**Relative entropy flow.** The relative entropy matrix $\mathcal{S}_{bb'} = S(\rho_b || \rho_{b'})$ (A1-34) flows under RG. For fixed $b'$, $\mathcal{S}_{bb'}$ as a function of $b$ shows the RG trajectory of book $b$ relative to reference $b'$.

**Light sector flow.** For $b$ such that max gap in book $b$ is $< 16$, the book is purely in the light sector. The relative entropy is dominated by UV gap fluctuations.

**Heavy sector onset.** When book $b$ first contains a gap $d > 16$, the heavy sector appears. This occurs at the book containing the first record gap $> 16$, which is $d=18$ (the 7th record gap).

**BPS block flow.** The BPS block (78×78 zero submatrix) remains exactly zero for all $b$. This is the RG invariant subspace. The book indices corresponding to BPS books (record gap books) have identically zero syndrome vectors.

**Syndrome matrix RG flow.** The full syndrome matrix $\Sigma_{bb'}$ (A1-35, Piece 11) satisfies:
$$\Sigma_{bb'} = \Sigma_{\text{light}, bb'} \theta(16 - d_{\text{max}}(b)) + \Sigma_{\text{heavy}, bb'} \theta(d_{\text{min}}(b) - 16) + \Sigma_{\text{mixed}, bb'}$$
Under RG flow $b \to b+1$, the light block shrinks, heavy block grows. At the transition book, $\Sigma_{\text{mixed}} = 0$ by decoupling.

**RG flow of correlations.** The gap correlation matrix $C_{bb'}(r) = \langle d_n(b) d_{n+r}(b') \rangle$ flows from short-range (light) to long-range (heavy). The correlation length $\xi_b$ increases with $b$.

**Compton scale as RG endpoint.** The flow terminates at the Compton scale (A1-09): 3.67 billion steps. This is the physical IR cutoff where the worldline reaches the electron Compton wavelength.

**Scaling collapse.** Plotting $\mathcal{S}_{bb'}$ vs $|b-b'|/b$ shows scaling collapse, confirming the RG fixed point at $d=16$.

(End of file - 35 lines)