# Piece 06: Casimir Operators and Invariants

The superconformal algebra $\mathfrak{su}(1,1|1)$ has Casimir operators that label irreducible representations. The quadratic Casimir is:

$$
C_2 = H K + K H - 2 D^2 + \frac{1}{2} \{Q, \bar{S}\} + \frac{1}{2} \{\bar{Q}, S\} + \frac{1}{2} R^2
$$

In the prime electron representation, this evaluates on the 256-dim space. For the BPS states, the Casimir takes a specific value determined by the central charge.

**Quadratic Casimir on BPS states:**

For a BPS state $|\text{BPS}\rangle$ with $Q|\text{BPS}\rangle = Q^\dagger|\text{BPS}\rangle = 0$, $H|\text{BPS}\rangle = \frac{|Z|}{2}|\text{BPS}\rangle = 39|\text{BPS}\rangle$, and $D|\text{BPS}\rangle = d|\text{BPS}\rangle$. The Casimir is:

$$
C_2 |\text{BPS}\rangle = \left( H K + K H - 2 D^2 + \frac{1}{2} R^2 \right) |\text{BPS}\rangle
$$

Since $K|\text{BPS}\rangle = \frac{|Z|}{2}|\text{BPS}\rangle = 39|\text{BPS}\rangle$ (dual Hamiltonian), and $R|\text{BPS}\rangle = 0$, we get:

$$
C_2 = 2 \times 39^2 - 2 d^2 = 3042 - 2 d^2
$$

The dilation eigenvalue $d$ for BPS states is determined by the gap products: $d = \frac{1}{4}\sum (\log d_n + \log d_{n+1}) \approx \frac{1}{2}\log(\text{gap product})$. For record gaps, this gives specific values.

**Cubic Casimir:**

The cubic Casimir $C_3$ involves the central charge and R-symmetry:

$$
C_3 = Z (H K - D^2) + \dots
$$

On BPS states, $C_3 \sim Z \cdot 39^2 = 78 \times 1521 = 118,638$.

**Prime gap realization:**

The Casimir operators are functions of the prime gaps. $C_2$ depends on $\sum d_n d_{n+1}$ and $\sum \log d_n$. For PrimeBookOne directory 0.0, $C_2 \sim 10^7$ for typical states, and $C_2 \sim 3000$ for BPS states.

**Invariant polynomials:**

The algebra has polynomial invariants in the generators. The basic invariants are:
1. $Z = 78$ (central charge)
2. $W = H K - D^2$ (superconformal Casimir)
3. $R$ (R-charge)

These three invariants label the irreducible representations. The 78 BPS states have $Z=78$, $W = 39^2 - d^2$, $R=0$. The non-BPS states have continuous $W$ and $R$ values.

**Connection to A1-04 Riemann Zeros:**

The Riemann zeros $\gamma_n$ from A1-04 appear as eigenvalues of the dilation operator $D$ on certain states. The Hilbert-Pólya conjecture suggests $D$ has spectrum $\{\gamma_n\}$. In our superconformal algebra, $D$ generates dilations of the gap sequence, and its spectrum is related to $\log d_n$. The Riemann zeros would correspond to specific gap configurations where $D$ has imaginary eigenvalues.

**Connection to A1-12 Proper Time Operator:**

The proper time operator $\hat{\tau}$ from A1-12 has spectral asymmetry 78. The Casimir $C_2$ on the worldline is related to $\hat{\tau}^2$ by $C_2 \sim \hat{\tau}^2 / \kappa^2$. The 78 zero modes of $\hat{\tau}$ correspond to the 78 BPS states with $C_2$ taking the minimal value.