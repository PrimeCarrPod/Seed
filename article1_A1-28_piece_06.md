# A1-28 Worldline_BPS_States.md — Piece 06
## BPS Mass Spectrum — Gap Ratios and Scaling

All 78 BPS states are degenerate at the BPS bound $E = |Z|/2 = 39$ in units of the proper-time scale $\kappa = \hbar/m_e c^2$ (A1-01). This degeneracy is exact, protected by the central charge $Z = 78$ and the non-zero Witten index $\Delta = 78$. However, the BPS states carry distinct quantum numbers determined by their associated record gaps.

**Record gap values as quantum labels.** Each BPS state $|\text{BPS}_k\rangle$ is labeled by the record gap value $d_{\text{rec}}^{(k)}$ and its index $k = 1,\dots,78$. The sequence of record gaps grows irregularly:

$$d_{\text{rec}}^{(k)} \sim \log^2 p_k \quad \text{(Cramér's conjecture)}$$

From PrimeBookOne data (Tiles 00–188), the 78 record gaps range from $d = 1$ (between 2 and 3) to $d \approx 1550$ (near $p \sim 10^{19}$). The ratios between successive record gaps:

$$\frac{d_{\text{rec}}^{(k+1)}}{d_{\text{rec}}^{(k)}} \in [1.2, 2.5]$$

provide a natural hierarchy of mass scales when the BPS states are coupled to gravity or gauge fields (A1-37, A1-38).

**Effective mass splittings from SUSY breaking.** While the BPS bound is exact in the supersymmetric limit, the soft SUSY breaking from the Goldstino sector (A1-25 piece 11, A1-26 piece 11, A1-27 piece 11) induces tiny mass splittings:

$$\delta M_k \sim m_{3/2} \frac{d_{\text{rec}}^{(k)}}{d_*} \sim 10^{-8} \times \frac{d_{\text{rec}}^{(k)}}{16} \quad \text{(in units of } m_e)$$

where $m_{3/2} \sim 10^{-8} m_e$ is the gravitino mass scale from the bit-7 Goldstino. The heaviest BPS state ($d \approx 1550$) gets a splitting $\sim 10^{-6} m_e \sim 0.5 \text{ eV}$, remarkably close to the neutrino mass scale.

**Scaling with book index.** The position of each record gap in the 3500-book sequence (A1-10) gives an additional label. Let $b_k \in \{1,\dots,3500\}$ be the book containing the $k$-th record gap. The "worldline time" of the BPS state is $\tau_k = \kappa \sum_{i=1}^{b_k} d_i$. The mass spectrum as a function of $\tau$:

$$M(\tau_k) = 39 + \mathcal{O}(10^{-8})$$

is nearly flat, with variations only from the soft breaking. The flatness of the BPS spectrum is a direct consequence of the topological protection — the central charge $Z = 78$ is a topological invariant (A1-24) and cannot change continuously.

**IR/UV duality and mass hierarchy.** Under the duality $d_n \leftrightarrow 1/d_n$ (A1-26 piece 09, A1-27 piece 09), the record gaps map to their inverses. The self-dual point $d_* = 16$ is fixed. The 7 record gaps with $d < 16$ are dual to the 7 smallest gaps in the inverted spectrum. This duality relates the UV (large gap) and IR (small gap) ends of the BPS spectrum, with the self-dual point $d = 16$ as the pivot. The BPS states near $d = 16$ are self-dual and have the highest symmetry.