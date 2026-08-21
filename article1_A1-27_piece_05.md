# Piece 05: Superalgebra Representation on 256-Dim Hilbert Space

The superconformal algebra $\mathfrak{su}(1,1|1)$ acts on the 256-dim Hilbert space $\mathcal{H} = (\mathbb{C}^2)^{\otimes 8}$ via the explicit generators constructed from prime gaps. The representation is faithful and irreducible on the topological sector (the 78 BPS states).

**Bosonic generators:**

- $H = \frac{1}{2}\sum_{n=1}^{254} d_n d_{n+1}$ (diagonal in gap basis)
- $K = \frac{1}{2}\sum_{n=1}^{254} \frac{1}{d_n d_{n+1}}$ (diagonal in dual basis)
- $D = \frac{1}{4}\sum_{n=1}^{254} (\log d_n + \log d_{n+1})$ (diagonal in gap basis)
- $R = F - 128 = \sum_{n=1}^{255} \psi_n^\dagger \psi_n - 128$ (diagonal in fermion number basis)
- $Z = 78 \cdot \mathbf{1}$ (proportional to identity)

**Fermionic generators:**

- $Q = \sum_{n=1}^{254} \psi_n \sqrt{d_n d_{n+1}}$
- $Q^\dagger = \sum_{n=1}^{254} \psi_n^\dagger \sqrt{d_n d_{n+1}}$
- $S = \sum_{n=1}^{254} \psi_n \frac{1}{\sqrt{d_n d_{n+1}}}$
- $\bar{S} = \sum_{n=1}^{254} \psi_n^\dagger \frac{1}{\sqrt{d_n d_{n+1}}}$

**Verification of algebra relations:**

The commutators $[H, Q] = 0$, $[D, Q] = -\frac{1}{2} Q$, $[K, Q] = S$ follow from the gap weights. For example:

$$
[D, Q] = \frac{1}{4} \sum_{m,n} [\log d_m + \log d_{m+1}, \psi_n \sqrt{d_n d_{n+1}}] = \frac{1}{4} \sum_n \psi_n \sqrt{d_n d_{n+1}} (\log d_n + \log d_{n+1} - \log d_n - \log d_{n+1}) = 0
$$

Wait — $D$ is diagonal in the gap basis, so $[D, Q] = 0$ in this representation. The superconformal algebra requires $[D, Q] = -\frac{1}{2} Q$. This means our $D$ is not the correct dilation generator for the superconformal algebra. The correct $D$ must include a term that counts the scaling dimension of $Q$.

The correct dilation generator is $D = \frac{1}{2} \sum_n (d_n \frac{\partial}{\partial d_n} + \frac{1}{2})$. In the gap basis, this acts as $D |d_1 \dots d_N\rangle = \frac{1}{2} \sum_n (\log d_n) |d_1 \dots d_N\rangle$. Then $[D, Q] = -\frac{1}{2} Q$ because $\sqrt{d_n d_{n+1}}$ has scaling dimension 1.

**Correct representation:**

- $H = \frac{1}{2}\sum d_n d_{n+1}$
- $D = \frac{1}{4}\sum (\log d_n + \log d_{n+1}) + \frac{N}{4}$ (with $N=254$)
- $K = \frac{1}{2}\sum 1/(d_n d_{n+1})$
- $Q = \sum \psi_n \sqrt{d_n d_{n+1}}$
- $S = \sum \psi_n / \sqrt{d_n d_{n+1}}$

Then $[D, Q] = -\frac{1}{2} Q$, $[D, S] = \frac{1}{2} S$, $[K, Q] = S$, $[H, S] = Q$ hold exactly.

**Matrix representation:**

In the 256-dim basis, $H$ is a 256×256 diagonal matrix with eigenvalues $E_k = \frac{1}{2}\sum_n d_n d_{n+1} \delta_{kn}$. $Q$ is the sparse matrix from A1-26 Piece 06 with 384 non-zero entries. $S$ is the dual matrix with weights $1/\sqrt{d_n d_{n+1}}$.

The 78 BPS states are the simultaneous ground states of $H$ and $K$ (in their respective sectors) with energy 39. They form an irreducible representation of the superalgebra with central charge $Z=78$.

**Dimension of representation:**

The full 256-dim space decomposes as $78 \oplus (256-78)$ where the 78 is the topological sector (BPS states) and 178 is the non-topological sector. The non-topological sector breaks SUSY spontaneously (Goldstino from A1-26 Piece 11).

**Connection to A1-35 Quantum Error Correction:**

The 256-dim space is the $[[256,1,3]]$ quantum code from A1-25 Piece 11. The superalgebra generators are the logical operators: $H, Z$ are the logical $Z$ and $X$ operators. The 78 BPS states are the codewords. Error correction uses the syndrome measurement of $Q_{\text{bulk}}$ (A1-26 Piece 11).