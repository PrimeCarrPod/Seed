# Piece 08: Superalgebra and the Index Theorem — Index = Str(e^{-βH})

The Witten index $\Delta = \text{Tr}((-1)^F e^{-\beta H})$ is the fundamental invariant of the superalgebra. From A1-24 and A1-25, $\Delta = 78$ for the topological sector. The index can be expressed as a supertrace over the full Hilbert space:

$$
\Delta = \text{Str}(e^{-\beta H}) = \text{Tr}((-1)^F e^{-\beta H}) = \sum_{\text{states}} (-1)^F e^{-\beta E}
$$

This is independent of $\beta$ because non-BPS states come in boson-fermion pairs that cancel in the supertrace. Only the BPS states (with $E = |Z|/2 = 39$) contribute, giving $\Delta = 78 \times e^{-\beta \cdot 39} \times (-1)^{F_{\text{BPS}}}$. But the BPS states have $F=0$ in the topological sector (they are annihilated by $Q$ and $Q^\dagger$), so $(-1)^F = +1$. Thus $\Delta = 78 e^{-\beta \cdot 39}$.

Wait — the Witten index is usually defined as $\Delta = \lim_{\beta \to \infty} \text{Tr}((-1)^F e^{-\beta H})$, which gives the number of bosonic ground states minus fermionic ground states. For our system, the BPS states are all bosonic in the topological sector (they are annihilated by $Q$ and $Q^\dagger$, so they have no fermionic excitations). Thus $\Delta = 78$.

**Index theorem from superalgebra:**

The index theorem of A1-24 can be derived from the superalgebra. The Dirac operator $D_\tau$ is related to the supercharge by $D_\tau = Q + Q^\dagger$. Then $\text{Index}(D_\tau) = \text{Index}(Q + Q^\dagger) = \text{Tr}((-1)^F e^{-\beta (Q+Q^\dagger)^2}) = \text{Tr}((-1)^F e^{-\beta \{Q,Q^\dagger\}}) = \text{Tr}((-1)^F e^{-\beta (2H+Z)})$.

Since $[H, Z] = 0$ and $Z$ is central, this gives $\text{Tr}((-1)^F e^{-\beta Z} e^{-2\beta H})$. For $\beta \to \infty$, only the ground states contribute, giving $\text{Index} = 78$.

**Heat kernel derivation (A1-24 Piece 03 revisited):**

The local index density from the heat kernel is $I_n = \text{str}(e^{-t D_\tau^2})|_{x_n}$. In the superalgebra language, $D_\tau^2 = \{Q, Q^\dagger\} = 2H + Z$. The heat kernel trace is $\text{Str}(e^{-t(2H+Z)})$. The small-$t$ expansion gives the local index density which integrates to 78.

**Prime gap realization:**

The supertrace is computed over the 256-dim space. For each basis state $|b_1 \dots b_{255}\rangle$, the fermion parity is $(-1)^{\sum b_i}$, and the energy is $E = \frac{1}{2}\sum d_n d_{n+1}$. The supertrace is:

$$
\Delta = \sum_{b \in \{0,1\}^{255}} (-1)^{\sum b_i} \exp\left(-\beta \cdot \frac{1}{2}\sum_n d_n d_{n+1}\right)
$$

For the topological sector (record gaps), the energy is exactly 39, and the states are bosonic ($(-1)^F = +1$), giving $\Delta_{\text{top}} = 78 e^{-39\beta}$. For non-topological states, the boson-fermion pairing gives exact cancellation.

**Connection to A1-23 Anomaly Inflow:**

The anomaly coefficient $k = 16896 = 78 \times 216$ is the index of the Dirac operator on the 1+1D boundary. The 216 factor comes from the 8-bit structure: $2^8 = 256$, chiral split gives 128, and the anomaly polynomial is degree 3. The superalgebra index $\Delta = 78$ is the bulk index that matches the boundary anomaly.

**Connection to A1-05 RH Stability:**

The Riemann Hypothesis ensures that the gap distribution is such that the supertrace converges and the index is well-defined. If RH fails, there would be gap configurations with negative energy that could spoil the cancellation mechanism, making the index ill-defined. The RH is equivalent to the unitarity of the superalgebra representation.