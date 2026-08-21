# Piece 02: Superconformal Generators — S, K, D, R

The N=1 superconformal algebra in 1D extends the Poincaré superalgebra with the dilation generator $D$, special conformal generator $K$, and superconformal charges $S, \bar{S}$. The full set of generators is $\{H, D, K, Q, \bar{Q}, S, \bar{S}, R, Z\}$.

The (anti)commutation relations are:

$$
[D, H] = -H, \quad [D, K] = K, \quad [H, K] = 2D
$$

$$
[D, Q] = -\frac{1}{2} Q, \quad [D, \bar{Q}] = -\frac{1}{2} \bar{Q}, \quad [D, S] = \frac{1}{2} S, \quad [D, \bar{S}] = \frac{1}{2} \bar{S}
$$

$$
[K, Q] = S, \quad [K, \bar{Q}] = \bar{S}, \quad [H, S] = Q, \quad [H, \bar{S}] = \bar{Q}
$$

$$
\{Q, \bar{Q}\} = 2H + Z, \quad \{S, \bar{S}\} = 2K + Z, \quad \{Q, S\} = 2D + R, \quad \{\bar{Q}, \bar{S}\} = 2D - R
$$

$$
[R, Q] = Q, \quad [R, \bar{Q}] = -\bar{Q}, \quad [R, S] = -S, \quad [R, \bar{S}] = \bar{S}
$$

In the prime electron worldline, these generators have explicit realizations in terms of prime gaps. The dilation $D$ generates scale transformations of the gap sequence: $d_n \to \lambda d_n$. The special conformal $K$ generates inversion: $d_n \to 1/d_n$ (the IR/UV duality of A1-25 Piece 09 and A1-26 Piece 09). The R-symmetry $R = F - 128$ from A1-26 Piece 03.

The superconformal charges $S = [K, Q]$ and $\bar{S} = [K, Q^\dagger]$ are:

$$
S = \sum_n \psi_n \frac{1}{\sqrt{d_n d_{n+1}}}, \quad \bar{S} = \sum_n \psi_n^\dagger \frac{1}{\sqrt{d_n d_{n+1}}}
$$

These are precisely the dual supercharges from A1-26 Piece 09! The duality $d_n \leftrightarrow 1/d_n$ maps $Q \leftrightarrow S$, $Q^\dagger \leftrightarrow \bar{S}$. The algebra $\{S, \bar{S}\} = 2K + Z$ gives the dual Hamiltonian $K = \frac{1}{2}\sum 1/(d_n d_{n+1})$ and the same central charge $Z=78$.

The central charge $Z$ is invariant under the full superconformal group: $[D, Z] = [K, Z] = [R, Z] = 0$. This is the topological protection from A1-24.

The prime gap realization provides a concrete 256-dim representation of the superconformal algebra. The generators act on the 8-bit Hilbert space with $H = \frac{1}{2}\sum d_n d_{n+1}$, $K = \frac{1}{2}\sum 1/(d_n d_{n+1})$, $D = \frac{1}{4}\sum (\log d_n + \log d_{n+1})$, and the supercharges as above.