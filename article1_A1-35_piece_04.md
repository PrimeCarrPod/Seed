# A1-35 Worldline_Quantum_Error_Correction.md — Piece 04
## Code Distance and Record Gaps — BPS Protection

The code distance of the prime electron QEC is determined by the record gaps. BPS states, corresponding to record gaps, provide the maximum distance protection.

**Code distance from record gaps.** The code distance $d_{\text{code}}$ is the minimum weight of a non-trivial logical operator. In the gap language, a logical operator must map between different degenerate gap sectors. The minimum gap difference required is the smallest record gap:
$$d_{\text{code}} = \min\{d_{\text{record}} : d_{\text{record}} \text{ is a record gap}\}$$
Record gaps are the sequence of maximal gap values observed up to $x$: $d_{\text{record}} \in \{1, 2, 4, 6, 8, 14, 18, 20, 22, 34, \dots\}$ (A005250).

**BPS states as record gaps.** The 78 BPS states (A1-28) correspond to the first 78 record gaps. Each BPS state is associated with a record gap $d_k^{\text{record}}$. The BPS subspace is the span of these 78 states.

**BPS protection = zero logical error.** For any error $E$ with support on gaps $< d_{78}^{\text{record}}$, the Knill-Laflamme condition holds exactly in the BPS subspace:
$$\langle \text{BPS}_i| E | \text{BPS}_j\rangle = C_{ij} \delta_{ij}$$
because $E$ cannot connect different record gap sectors. The logical error rate is exactly zero.

**Wall crossing and code distance.** At a wall (A1-29), the gap spectrum changes discontinuously. Record gaps can jump. The code distance is not constant across walls:
$$d_{\text{code}}(\text{chamber } \mathcal{C}) = \text{min record gap in chamber } \mathcal{C}$$
In the physical chamber (where RH holds), the record gap sequence is well-behaved and $d_{\text{code}}$ grows.

**Twin prime distance.** For the twin prime code ($d=2$ subspace), the effective distance is the gap to the next gap value. Since $d=2$ is the smallest even gap, the distance is determined by the next record gap $>2$, which is $4$.

**Asymptotic code distance.** As $x \to \infty$, record gaps grow as $d_{\text{record}}(x) \sim \log^2 x$ (Cramér's conjecture). The code distance grows logarithmically with the number of primes:
$$d_{\text{code}}(x) \sim \log^2 \pi(x) \sim \log^2(x/\log x)$$

**3500 books and distance.** The 3500 books sample the gap sequence up to $\sim 10^{10}$. The largest record gap in this range is 354 (A005250), giving $d_{\text{code}} = 354$ for the full BPS sector.

(End of file - 33 lines)