# A1-28 Worldline_BPS_States.md — Piece 02
## BPS Bound and Central Charge — E ≥ |Z|/2 = 39

The $\mathcal{N}=1$ superconformal algebra of A1-27 contains the central charge matrix $Z_{IJ} = 78 \delta_{IJ}$ for $I,J = 1,\dots,78$. The anticommutator of supercharges gives the Hamiltonian bound:

$$\{Q_I, Q_J^\dagger\} = 2H \delta_{IJ} + Z_{IJ}$$

For any state $|\psi\rangle$, taking the expectation value yields:

$$\langle\psi| \{Q_I, Q_I^\dagger\} |\psi\rangle = 2\langle H \rangle + 78 = 2\|Q_I|\psi\rangle\|^2 \geq 0$$

Hence $\langle H \rangle \geq -39$. The physical Hilbert space has positive definite norm, so $E = \langle H \rangle \geq 0$. The BPS bound is the stronger condition from the central charge:

$$E \geq \frac{|Z|}{2} = 39$$

**Saturation and short multiplets.** Equality holds iff $Q_I|\text{BPS}\rangle = 0$ for all $I$ (or $Q_I^\dagger|\text{BPS}\rangle = 0$). Such states are annihilated by half the supercharges, reducing the multiplet dimension from 4 (long) to 1 (short = BPS singlet). The 78 BPS states thus form 78 singlets under the superconformal algebra.

**Central charge from index theorem.** From A1-24, three independent proofs establish $Z = \text{Index}(D_\tau) = 78$:
1. **Spectral flow**: $\text{Index} = \sum_n \text{sign}(d_n - d_{\text{ref}}) = 78$
2. **Anomaly inflow**: $\text{Index} = \frac{1}{2\pi}\int d\tau\, \text{Tr}(F \wedge F) = 78$ (A1-23)
3. **Zero mode counting**: 78 normalizable zero modes of $D_\tau$ on the worldline

Each proof uses only the prime gap sequence $\{d_n\}$ from PrimeBookOne. The reference gap $d_{\text{ref}} = 16$ (the self-dual point under $d_n \leftrightarrow 1/d_n$, A1-26 piece 09) is fixed by the IR/UV duality, not a free parameter.

**Mass formula.** The BPS mass is exactly $M_{\text{BPS}} = |Z|/2 = 39$ in units of the proper-time scale $\kappa = \hbar/m_e c^2$ (A1-01). This is not an adjustable mass scale — it emerges from the topology of the prime gap sequence. The 78 BPS states are degenerate at $E = 39$, protected by the non-zero central charge (Witten index $\Delta = 78 \neq 0$, A1-25, A1-27).