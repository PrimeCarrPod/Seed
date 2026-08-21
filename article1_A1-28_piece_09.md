# A1-28 Worldline_BPS_States.md — Piece 09
## IR/UV Duality Action on BPS States — dₙ ↔ 1/dₙ

The IR/UV duality $d_n \leftrightarrow 1/d_n$ (A1-26 piece 09, A1-27 piece 09) is an exact symmetry of the prime electron worldline at the self-dual point $d_* = 16$. It acts as an outer automorphism of the superconformal algebra (A1-27 piece 09), exchanging $H \leftrightarrow K$ and $Q \leftrightarrow S$.

**Action on BPS states.** The duality maps record gaps to their inverses:

$$\mathcal{U}_{\text{dual}} : d_{\text{rec}}^{(k)} \mapsto \frac{d_*^2}{d_{\text{rec}}^{(k)}} = \frac{256}{d_{\text{rec}}^{(k)}}$$

Since the record gaps are defined by $d_{\text{rec}}^{(k)} > d_{\text{rec}}^{(j)}$ for all $j < k$, the duality reverses the ordering. The largest record gap $d_{\text{rec}}^{(78)} \approx 1550$ maps to $256/1550 \approx 0.165$, which is not a record gap in the original sequence. However, in the dual sequence (where gaps are measured as $1/d_n$), this becomes a record.

**BPS state mapping.** The 78 BPS states transform under duality as:

$$\mathcal{U}_{\text{dual}} |\text{BPS}_k\rangle = \sum_j S_{kj} |\text{BPS}_j\rangle$$

where $S_{kj}$ is the modular $S$-matrix of the duality transformation. The $S$-matrix is determined by the overlap of BPS wavefunctions (piece 04) under the duality:

$$S_{kj} = \langle \text{BPS}_k | \mathcal{U}_{\text{dual}} | \text{BPS}_j \rangle = \delta_{k, \tilde{j}}$$

where $\tilde{j}$ is the index of the BPS state whose dual gap equals the inverse of gap $j$. Since the dual of a record gap is generally not a record gap in the original sequence, the duality maps the 78 BPS states to 78 states in the *dual* Hilbert space $\tilde{\mathcal{H}}$, which is isomorphic but distinct.

**Self-dual BPS states.** A BPS state is self-dual if $d_{\text{rec}}^{(k)} = d_* = 16$. Since 16 is not a record gap, there are no exactly self-dual BPS states. However, the 7 BPS states with $d_{\text{rec}} < 16$ are "near" self-dual in the sense that their duals $256/d_{\text{rec}}$ are large ($\sim 256/14 \approx 18$, $256/8 = 32$, etc.), which correspond to the smaller record gaps in the dual sequence.

**Chirality flip.** The duality exchanges the chirality sectors:

$$\mathcal{U}_{\text{dual}} : \mathcal{H}_+ \longleftrightarrow \mathcal{H}_-$$

The 71 positive-chirality BPS states in $\mathcal{H}_+$ map to 71 states in $\mathcal{H}_-$ of the dual theory, and vice versa. Since the dual theory has the same BPS spectrum (78 states), this is consistent.

**Hamiltonian duality.** The Hamiltonian $H = \frac{1}{2}\sum d_n d_{n+1}$ (A1-26 piece 04) maps to the special conformal generator $K = \frac{1}{2}\sum (1/d_n)(1/d_{n+1})$ under duality. The BPS energy $E = 39$ is invariant because $|Z| = 78$ is invariant. The duality is a symmetry of the BPS spectrum, not a dynamical equivalence of the full spectrum — the long multiplets (44 × 4 = 176 states) are reorganized non-trivially.

**Physical interpretation.** The IR/UV duality corresponds to reversing the direction of proper time on the worldline (A1-13, A1-14). The BPS states, being zero modes of $Q$ and $Q^\dagger$, are invariant under this reversal up to the modular $S$-matrix. This is the worldline analog of T-duality in string theory, with the self-dual gap $d_* = 16$ playing the role of the self-dual radius.