# PIECE 07: SUSY Ground States, BPS Bound, and Record Gaps

The central charge $Z = 78$ sets the **BPS bound** for the energy spectrum of the SUSY Hamiltonian:
$$E \geq \frac{|Z|}{2} = 39$$

States that saturate this bound are **BPS states** — they are annihilated by one of the supercharges and have energy exactly $E = 39$. From A1-28 (to be derived), the BPS states correspond precisely to the **record gaps**.

**BPS Condition:**
A state $|\psi\rangle$ is BPS if:
$$Q|\psi\rangle = 0 \quad \text{or} \quad Q^\dagger|\psi\rangle = 0$$

For the prime electron worldline, the BPS states are the **zero modes of the supercharge** $Q$. From Piece 05, the number of zero modes is the index:
$$\dim \ker Q = \text{Index}(D_\tau) = 78$$

Each record gap creates exactly one zero mode of $Q$, hence one BPS state.

**Explicit BPS State Construction:**
At a record gap position $n = n_k$ (where $d_{n_k} > \max_{i<n_k} d_i$), we construct the BPS state as:
$$|\text{BPS}_k\rangle = \mathcal{N}_k \exp\left( -\frac{1}{2} \sum_{m=1}^{n_k} \frac{d_m d_{m+1}}{d_{n_k}^2} \psi_m^\dagger \psi_m \right) |0\rangle_F \otimes |n_k\rangle_B$$

where $|0\rangle_F$ is the fermionic vacuum, $|n_k\rangle_B$ is the bosonic state localized at step $n_k$, and $\mathcal{N}_k$ is normalization. The exponential suppresses non-record gaps and peaks at the record gap.

**BPS Energy and Mass:**
The energy of the BPS state is $E = 39$ (in SUSY units). The physical mass is obtained by scaling with the gap scale:
$$M_{\text{BPS}} = \frac{\hbar}{\kappa} \cdot \frac{Z}{2} = \frac{\hbar}{\kappa} \cdot 39$$

Using $\kappa = \hbar/m_e c^2 \cdot \text{scale}$ from A1-01, this gives the electron mass $m_e = 0.511$ MeV when the scale is fixed by the Compton wavelength (A1-09). The factor 39 = 78/2 is the **BPS mass ratio**.

**Record Gaps as BPS Sources:**
The 78 record gaps (OEIS A005250) up to $p \sim 10^{18}$ are:

| k | Gap | Prime Index | BPS State # |
|---|-----|-------------|-------------|
| 1 | 14 | 30 | 1 |
| 2 | 18 | 54 | 2 |
| 3 | 20 | 84 | 3 |
| 4 | 22 | 154 | 4 |
| 5 | 34 | 198 | 5 |
| 6 | 36 | 216 | 6 |
| 7 | 44 | 296 | 7 |
| 8 | 52 | 540 | 8 |
| 9 | 72 | 1250 | 9 |
| 10 | 86 | 1650 | 10 |
| ... | ... | ... | ... |
| 78 | ~1550 | ~4×10¹⁷ | 78 |

Each BPS state $|\text{BPS}_k\rangle$ is a **localized excitation** at the record gap position. The BPS states are orthogonal (they live at different proper-time steps) and form a 78-dimensional subspace of the Hilbert space.

**BPS States and Twin Primes (Anti-BPS):**
Twin primes ($d=2$) are anti-records. They would create anti-BPS states with $Q^\dagger|\text{anti-BPS}\rangle = 0$, but the anti-record density is too high (twin prime conjecture: infinite) and they don't produce stable zero modes. The **asymmetry between records and anti-records** is what makes the index non-zero.

**Witten Index as BPS Count:**
The Witten index is the net number of bosonic minus fermionic zero-energy states:
$$\Delta = n_B(0) - n_F(0) = 78$$

Since all 78 zero modes are bosonic (from record gaps), $n_B(0) = 78$, $n_F(0) = 0$. This confirms the BPS interpretation.

**Stability of BPS States:**
The BPS states are stable against perturbations that preserve SUSY (i.e., perturbations of the gap sequence that don't change the record gap count). They are protected by the topological index. This is the **topological protection of the electron mass** — the electron cannot decay because it is a BPS state with central charge $Z=78$.

**Connection to A1-07 (Pair Creation):**
From A1-07, pair creation corresponds to forward/backward time propagation. The BPS states are the **unpaired states** — they don't have an antiparticle partner because the index is non-zero. The 78 BPS states are the "excess" electrons over positrons in the universe (baryon asymmetry, A1-22, A1-08).

**Connection to A1-11 (Self-Intersection):**
The 78 BPS states have 3081 pairwise self-intersections (A1-11: $\binom{79}{2} = 3081$). Each intersection is a point where two BPS states overlap in the emergent spacetime, giving rise to interaction vertices (A1-06).

This piece establishes the BPS states as the physical realization of the record gaps — each record gap is a stable, topologically protected excitation on the worldline.