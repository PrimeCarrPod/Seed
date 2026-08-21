# A1-38 Worldline_Holography.md — Piece 03
## Boundary CFT1 — 78 BPS Primary Operators

The boundary CFT$_1$ is a quantum mechanical system with 78 primary operators corresponding to the 78 BPS states (record gaps).

**BPS states as boundary primaries.** Each BPS state $|i\rangle$ (A1-28) corresponds to a boundary primary operator $\mathcal{O}_i$ with conformal weight:
$$h_i = \frac{d_i^{\text{record}}}{16}$$
where $d_i^{\text{record}}$ is the $i$-th record gap. The 78 record gaps give weights ranging from $h_1 = 1/16$ to $h_{78} = 354/16 \approx 22.1$.

**Modular invariant partition function.** The boundary partition function is:
$$Z(\beta) = \text{Tr}_{\mathcal{H}_{\text{BPS}}} e^{-\beta H_{\text{BPS}}} = \sum_{i=1}^{78} e^{-\beta h_i}$$
with $H_{\text{BPS}} = \sum_i h_i |i\rangle\langle i|$. This is modular invariant under $\beta \leftrightarrow 4\pi^2/\beta$ due to the IR/UV duality $d \leftrightarrow 256/d$ (A1-36).

**Boundary OPE.** The operator product expansion of boundary primaries is:
$$\mathcal{O}_i(t) \mathcal{O}_j(0) \sim \sum_k C_{ij}^k |t|^{h_k - h_i - h_j} \mathcal{O}_k(0)$$
The OPE coefficients $C_{ij}^k$ are determined by the gap correlation matrix (A1-14) and the index theorem (A1-24).

**Boundary two-point function.** The two-point function of primaries is:
$$\langle \mathcal{O}_i(t) \mathcal{O}_j(0) \rangle = \frac{\delta_{ij}}{|t|^{2h_i}}$$
This follows from conformal invariance in 1D. The BPS relative entropy zero (A1-34) implies no mixing between different BPS primaries.

**Boundary stress tensor.** The boundary stress tensor $T(t)$ has central charge $c = 78$ (the BPS count). The Virasoro algebra is:
$$[L_m, L_n] = (m-n)L_{m+n} + \frac{78}{12}(m^3 - m)\delta_{m+n,0}$$
This is the N=1 superconformal algebra from A1-27 restricted to the BPS sector.

**Boundary modular Hamiltonian.** For a boundary interval $A$, the modular Hamiltonian is:
$$K_A = -\log \rho_A = 2\pi \int_A dt \, \frac{(t-t_1)(t_2-t)}{t_2-t_1} T(t)$$
This is the 1D analog of the Bisognano-Wichmann formula. $K_A$ generates boundary time evolution = bulk modular flow (A1-37).

**Twin prime boundary operators.** The twin prime gaps $d=2$ give boundary operators with $h = 1/8$. These are the light boundary operators (UV), dual to bulk fields near the boundary $z \ll 1$.

**PrimeBookOne boundary data.** The 3500 books give boundary correlation functions at all scales. The BPS two-point functions are constant (zero relative entropy).

(End of file - 35 lines)