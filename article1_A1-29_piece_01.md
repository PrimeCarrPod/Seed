# A1-29 Worldline_Wall_Crossing.md — Piece 01
## Introduction — Wall Crossing in Prime Gap Spectrum

The BPS spectrum of the prime electron worldline is not invariant across the full moduli space of gap configurations. As the effective gap scale flows from UV to IR, or as the reference gap $d_{\text{ref}}$ varies, the central charge phases $\arg Z_k$ for the 78 BPS states can align, triggering wall crossing transitions. The wall crossing formula of Kontsevich and Soibelman (KS) governs how the BPS degeneracies $\Omega(\gamma)$ change when crossing walls of marginal stability in the moduli space.

**Moduli space of the prime electron.** The moduli space $\mathcal{M}$ is parameterized by the prime gap sequence $\{d_n\}$ modulo the IR/UV duality $d_n \leftrightarrow 1/d_n$ (A1-26 piece 09). The physical chamber corresponds to the actual prime gaps as they appear in PrimeBookOne. Other chambers correspond to "deformed" gap sequences obtained by scaling or applying the duality. The walls of marginal stability are loci where $\arg Z_i = \arg Z_j$ for some pair of BPS charges $\gamma_i, \gamma_j$.

**Central charge phases.** From A1-28, all 78 BPS states share the same central charge magnitude $|Z| = 78$, but their individual phases are determined by the complex structure of the gap sequence. In the supersymmetric limit, the central charge is real and positive: $Z_k = 78$ for all $k$. However, when we consider the deformation of the theory by gap ratios (the "moduli"), the central charge becomes complex:

$$Z_k(u) = \sum_n c_{k,n} d_n(u)$$

where $u \in \mathcal{M}$ are the moduli (gap ratios), and $c_{k,n}$ are coefficients from the index theorem (A1-24). The phases $\arg Z_k(u)$ vary with $u$.

**Wall crossing as gap class transitions.** From A1-19, instanton solutions describe tunneling between gap classes. A wall crossing event corresponds to a gap class transition where a record gap is "overtaken" by a new configuration. The KS formula gives the precise change in the BPS degeneracies:

$$\Omega'(\gamma) = \sum_{n \geq 1} \frac{(-1)^{n-1}}{n} \sum_{\substack{\gamma_1+\dots+\gamma_n = \gamma \\ \arg Z_{\gamma_1} = \dots = \arg Z_{\gamma_n}}} \Omega(\gamma_1) \cdots \Omega(\gamma_n) \langle \gamma_1, \dots, \gamma_n \rangle$$

where $\langle \gamma_1, \dots, \gamma_n \rangle$ is the higher symplectic pairing on the charge lattice $\Gamma = \mathbb{Z}^{78}$.

**Prime gap data as scattering diagram.** The PrimeBookOne dataset provides the complete history of record gaps — the 78 walls that have been crossed in the actual physical evolution of the worldline. Each record gap $d_{\text{rec}}^{(k)}$ marks a wall crossing event where the BPS spectrum jumped from $k-1$ to $k$ states. The full scattering diagram is encoded in the 3.67 billion gap differences across 3500 books.