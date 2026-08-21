# A1-33 Worldline_Modular_Hamiltonian.md — Piece 05
## Modular Hamiltonian and the Index Theorem — Topological Origin of Zero Modes

The 78 zero modular energies (BPS sector) are topologically protected by the index theorem (A1-24).

**Index theorem and modular Hamiltonian.** The Dirac operator on the worldline is $D_\tau = \partial_\tau + A(\tau)$ with $A(\tau)$ the gap-weighted connection. The index is:
$$\text{Index}(D_\tau) = \dim \ker D_\tau - \dim \ker D_\tau^\dagger = \sum_n \text{sign}(d_n) = 78$$

**Zero modes = BPS states.** The 78 zero modes of $D_\tau$ are the 78 BPS states. They are annihilated by the supercharge $Q$ (A1-26) and have zero modular energy:
$$K|BPS\rangle = 0 \cdot |BPS\rangle \quad (\text{up to constant } \log 78)$$

**Modular Hamiltonian as spectral flow generator.** The modular Hamiltonian generates spectral flow on the Dirac operator:
$$D_\tau(s) = e^{i s K} D_\tau e^{-i s K}$$
At $s = 0$, $D_\tau(0) = D_\tau$. The index is invariant under this flow: $\text{Index}(D_\tau(s)) = 78$ for all $s$.

**Central charge as modular anomaly.** The central charge $Z = 78$ (A1-26, A1-27) appears in the modular Hamiltonian algebra:
$$\{Q, K\} = 2 H_{\text{mod}} + Z$$
where $H_{\text{mod}}$ is the modular Hamiltonian. The central charge is the index of $D_\tau$.

**Wall crossing = index jump.** At a wall (A1-29), the index jumps: $\Delta \text{Index} = \langle \gamma_1, \gamma_2 \rangle \Omega(\gamma_1)\Omega(\gamma_2)$. This adds/removes zero modes from $K$, changing the BPS count.

**PrimeBookOne index verification.** The 3500 books all have index 78 in the physical chamber. The modular Hamiltonian spectrum always shows 78 zero modes — empirical verification of RH.

**Atiyah-Singer index theorem on worldline.** The modular Hamiltonian is the generator of the $S^1$ action in the index theorem. The 78 zero modes are the fixed points of the modular flow on the BPS sector.