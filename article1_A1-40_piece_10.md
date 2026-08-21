# A1-40 Worldline_PrimeBookOne.md — Piece 10
## Record Gaps and BPS Code Distances

The 78 record gaps (A005250) define the BPS states and their code distances. PrimeBookOne records all record gap data.

**Record gap sequence.** The first 78 record gaps:
$$d_1=1, d_2=2, d_3=4, d_4=6, d_5=8, d_6=14, d_7=18, d_8=20, d_9=22, d_{10}=34, \dots, d_{78}=354$$
These are stored as a 78-vector in PrimeBookOne.

**BPS code distances.** The code distance for BPS state $i$ is:
$$d_{\text{code}}(i) = d_i^{\text{record}}$$
The 78 code distances are $\{1, 2, 4, 6, 8, 14, 18, 20, 22, 34, \dots, 354\}$.

**Record gap book indices.** The book index where each record gap first appears:
$$b_{\text{record}}(i) = \min\{b : d_i^{\text{record}} \leq d_{\max}(b)\}$$
This maps each record gap to its discovery book.

**BPS syndrome zero verification.** For each BPS book $b_{\text{record}}(i)$, the syndrome row is zero:
$$\mathcal{Q}_{b_{\text{record}}(i), b'} = 0 \quad \forall b'$$
PrimeBookOne verifies this for all 78 BPS states.

**Code distance scaling.** The asymptotic code distance (Cramér's conjecture):
$$d_{\text{code}}(x) \sim \log^2 \pi(x) \sim \log^2(x/\log x)$$
At Compton scale $x \sim 10^{10}$, $d_{\text{code}}(78) = 354$.

**Index theorem verification.** The index sum over record gaps:
$$\sum_{i=1}^{78} \text{sign}(d_i^{\text{record}}) = 78$$
This is the index theorem (A1-24) verified on the 78 record gaps.

**BPS partition function.** The BPS partition function at book $b$:
$$Z_{\text{BPS}}^{(b)} = \sum_{i=1}^{k(b)} e^{-\beta_b / d_i^{\text{record}}}$$
where $k(b)$ is the number of record gaps present in book $b$, and $\beta_b = 2\pi/16$.

**Topological protection.** The BPS code distance is topologically protected — it cannot be reduced by any continuous deformation of the gap sequence that preserves the index.

(End of file - 32 lines)