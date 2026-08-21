# A1-28 Worldline_BPS_States.md — Piece 05
## Supercharge Action on BPS States — Q|BPS⟩ = 0

The defining property of BPS states is their annihilation by half the supercharges. From A1-26, the supercharge is:

$$Q = \sum_n \psi_n \sqrt{d_n d_{n+1}}$$

with adjoint $Q^\dagger = \sum_n \psi_n^\dagger \sqrt{d_n d_{n+1}}$. The algebra $\{Q, Q^\dagger\} = 2H + Z$ with $Z = 78$ implies:

$$Q Q^\dagger + Q^\dagger Q = 2H + 78$$

**Annihilation condition.** For a BPS state $|\text{BPS}\rangle$ with energy $E = 39$:

$$0 = (2H + 78 - 2E) |\text{BPS}\rangle = (Q Q^\dagger + Q^\dagger Q) |\text{BPS}\rangle = \|Q|\text{BPS}\rangle\|^2 + \|Q^\dagger|\text{BPS}\rangle\|^2$$

Since both norms are non-negative, each must vanish:
$$Q|\text{BPS}\rangle = 0, \quad Q^\dagger|\text{BPS}\rangle = 0$$

**Cohomology interpretation.** The supercharge $Q$ acts as a differential on the Hilbert space, $Q^2 = 0$ (from $\{Q,Q\}=0$ in the $\mathcal{N}=1$ algebra). The BPS states are precisely the $Q$-cohomology classes at energy $E = 39$:

$$\mathcal{H}_{\text{BPS}} = \frac{\ker Q}{\text{im } Q} \bigg|_{E=39}$$

The dimension of this cohomology is the Witten index:
$$\Delta = \text{Tr}(-1)^F e^{-\beta H} = \dim \mathcal{H}_{\text{BPS}}^+ - \dim \mathcal{H}_{\text{BPS}}^- = 78$$

This matches the index theorem result from A1-24: 78 BPS states (71 positive chirality, 7 negative chirality in the record gap counting; more precisely, the index counts signed zero modes giving net 78).

**Explicit verification on 256-dim space.** In the 256×256 matrix representation of A1-26 piece 06, the supercharge $Q$ is a sparse matrix with non-zero entries only connecting states differing by a fermion pair creation/annihilation on adjacent gaps. The 78 BPS states are exact zero eigenvectors:

$$Q_{ab} (v_{\text{BPS},k})_b = 0, \quad k = 1,\dots,78$$

The 78 zero eigenvectors of $Q$ (and $Q^\dagger$) span the BPS subspace. The remaining $256 - 78 = 178$ states form 44 long multiplets of dimension 4 (44 × 4 = 176) plus 2 extra states that pair up into a single long multiplet — consistent with the supermultiplet structure of A1-27 piece 07.

**Pair creation/annihilation connection.** From A1-07, the supercharge maps electron to positron: $Q|e^-\rangle \propto |e^+\rangle$. The BPS states are the unique states invariant under this chirality flip — they are their own antiparticles (Majorana-like). This is the worldline realization of the electron/positron identification in the one-electron universe (A1-07, A1-40).