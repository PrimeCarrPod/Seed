# Piece 06: Supercharge on 8-Bit Hilbert Space — 256-Dim Representation

The 8-bit Hilbert space from A1-25 Piece 05 has dimension $2^8 = 256$, corresponding to the 256 possible configurations of the 8-bit prime difference array per tile (PrimeBookOne: each difference is an 8-bit integer 0-255). The basis states are $|b_7 b_6 b_5 b_4 b_3 b_2 b_1 b_0\rangle$ where $b_i \in \{0,1\}$.

The supercharge $Q$ acts as a 256×256 matrix. Using the gap-pair structure from Piece 02, we decompose the 8 bits into 4 gap pairs: $(b_0,b_1) \to d_1$, $(b_2,b_3) \to d_2$, $(b_4,b_5) \to d_3$, $(b_6,b_7) \to d_4$. The fermionic operators are $\psi_n = \sigma^-_n \otimes \mathbf{1}_{\neq n}$ where $\sigma^- = |0\rangle\langle 1|$ acts on the $n$-th gap pair qubit.

The chiral grading operator $(-1)^F = \prod_{n=1}^4 \sigma^z_n$ splits $\mathcal{H} = \mathcal{H}_+ \oplus \mathcal{H}_-$ with $\dim \mathcal{H}_\pm = 128$. Explicitly, $\mathcal{H}_+$ has even number of 1-bits among the 4 gap pairs, $\mathcal{H}_-$ has odd.

The supercharge matrix in the computational basis:

$$
Q = \sum_{n=1}^3 \sqrt{d_n d_{n+1}} \, \sigma^-_n \sigma^+_{n+1} \otimes \mathbf{1}_{\text{rest}}
$$

where $\sigma^+ = |1\rangle\langle 0|$ and the sum runs over adjacent gap pairs. This is a sparse matrix with non-zero entries only connecting states differing by a fermion hop between adjacent pairs.

The 128|128 block structure in the $(-1)^F$ eigenbasis:

$$
Q = \begin{pmatrix} 0 & Q_{+-} \\ Q_{-+} & 0 \end{pmatrix}, \quad Q^\dagger = \begin{pmatrix} 0 & Q_{-+}^\dagger \\ Q_{+-}^\dagger & 0 \end{pmatrix}
$$

where $Q_{+-}: \mathcal{H}_+ \to \mathcal{H}_-$ and $Q_{-+}: \mathcal{H}_- \to \mathcal{H}_+$. Each block is 128×128. The Hamiltonian $H = \frac{1}{2}\{Q, Q^\dagger\}$ is block-diagonal:

$$
H = \begin{pmatrix} Q_{+-}Q_{-+}^\dagger & 0 \\ 0 & Q_{-+}Q_{+-}^\dagger \end{pmatrix} + \frac{Z}{2}\mathbf{1}
$$

The central charge $Z = 78$ acts as $Z/2 = 39$ times identity on both blocks.

For PrimeBookOne Tile 0.0, the gap values $d_n$ are the 8-bit differences mod 256. The matrix elements $\sqrt{d_n d_{n+1}}$ range from 2 to ~14. The 78 BPS states are the 78 basis states corresponding to record gap configurations, annihilated by both $Q_{+-}$ and $Q_{-+}$.

**Explicit 256×256 matrix construction:**

Label basis states by integers $k = 0, \dots, 255$ corresponding to binary $b_7 b_6 b_5 b_4 b_3 b_2 b_1 b_0$. The gap pairs are:
- Pair 0: bits 0,1 → $d_1 = 2b_1 + b_0 + 1$ (mapped to actual gap values)
- Pair 1: bits 2,3 → $d_2 = 2b_3 + b_2 + 1$
- Pair 2: bits 4,5 → $d_3 = 2b_5 + b_4 + 1$
- Pair 3: bits 6,7 → $d_4 = 2b_7 + b_6 + 1$

The supercharge matrix elements are:

$$
Q_{k,k'} = \sum_{n=1}^3 \sqrt{d_n d_{n+1}} \, \delta_{k', k \oplus (1 \ll 2n) \oplus (1 \ll (2n+1))}
$$

where $\oplus$ is bitwise XOR and the shift indices correspond to the two bits of each gap pair. The matrix is extremely sparse: only 3×128 = 384 non-zero entries out of 65,536.

**Chiral basis transformation:**

The grading operator $(-1)^F = \prod_{n=0}^3 \sigma^z_n$ is diagonal in the computational basis with eigenvalues $(-1)^{\sum b_i}$. The unitary transformation to the chiral basis reorders basis states by fermion parity. In this basis, $Q$ has the off-diagonal block form shown above.

**Eigenvalue spectrum of $Q Q^\dagger$:**

The operator $Q Q^\dagger$ is block-diagonal with blocks $Q_{+-}Q_{-+}^\dagger$ and $Q_{-+}Q_{+-}^\dagger$. Its eigenvalues are the gap pair products $d_n d_{n+1}$ for each transition. The 78 BPS states correspond to zero eigenvalues of $Q Q^\dagger - (Z/2)^2$, i.e., states where the gap pair product equals $39^2 = 1521$. This selects the record gap configurations where $d_n d_{n+1} \approx 1521$.

**Connection to A1-08 Proper Time Fluctuation Spectrum:**

From A1-08, the proper time fluctuation spectrum has peaks at frequencies corresponding to gap pair products. The supercharge matrix eigenvalues $\sqrt{d_n d_{n+1}}$ are precisely these frequencies. The 78 BPS states correspond to the 78 spectral peaks at the record gap products.