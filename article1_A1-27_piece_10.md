# Piece 10: Superalgebra Cohomology and Deformations

The superconformal algebra $\mathfrak{su}(1,1|1)$ has cohomology groups $H^k(\mathfrak{g}, \mathfrak{g})$ that classify deformations and anomalies. For the prime electron worldline, the relevant cohomology is with coefficients in the adjoint representation.

**Second cohomology $H^2(\mathfrak{g}, \mathbb{C})$:**

This classifies central extensions. For $\mathfrak{su}(1,1|1)$, $H^2$ is 1-dimensional, giving the unique central charge $Z$. The value $Z=78$ is fixed by the index theorem (A1-24) and is the topological invariant of the theory. There are no other central extensions.

**Second cohomology $H^2(\mathfrak{g}, \mathfrak{g})$:**

This classifies infinitesimal deformations of the algebra structure. The prime gap sequence induces a deformation of the superconformal algebra by breaking the conformal symmetry explicitly. The deformation parameters are the gap ratios $d_n / \langle d \rangle_n$. The deformed algebra has:

$$
\{Q, Q^\dagger\} = 2H + Z + \delta H, \quad [D, Q] = -\frac{1}{2} Q + \delta Q
$$

where $\delta H \sim \sum (d_n - \langle d \rangle_n)^2$ and $\delta Q \sim \sum (d_n - \langle d \rangle_n) \psi_n$. These deformations are irrelevant in the IR (they vanish for the twin prime sector $d_n = 2$) but become important in the UV.

**Third cohomology $H^3(\mathfrak{g}, \mathbb{C})$:**

This classifies anomalies. The anomaly coefficient $k = 16896$ from A1-23 is the image of the anomaly class in $H^3$. The anomaly polynomial is $\mathcal{A} = \frac{k}{24\pi^2} \text{Tr}(F \wedge F)$ for the R-symmetry gauge field. The superalgebra cohomology reproduces this as the 3-cocycle $\omega(X,Y,Z) = \text{Str}([X,Y]Z)$ for $X,Y,Z \in \mathfrak{g}$.

**Prime gap realization of cohomology:**

The gap sequence $d_n$ provides a 1-cocycle in $H^1(\mathfrak{g}, \mathfrak{g}^*)$ via the map $X \mapsto \langle d, X \rangle$ where $\langle d, X \rangle$ is the pairing of the gap sequence with the algebra generator. The coboundary of this 1-cocycle gives the deformation 2-cocycle.

**Deformation to full Virasoro-like algebra:**

The 1D superconformal algebra can be enhanced to a 2D super-Virasoro algebra by introducing a second proper time coordinate (the worldline embedding in 2D). The central charge of the Virasoro algebra is $c = 12Z = 936$ (from $c = 12 \times \text{Index}$). This connects to the Brown-Henneaux central charge of AdS$_3$ in A1-38.

**Modular invariance:**

The partition function $Z(\tau) = \text{Tr}((-1)^F q^H \bar{q}^{\bar{H}})$ with $q = e^{2\pi i \tau}$ is modular invariant due to the superalgebra structure. The central charge $Z=78$ ensures modular invariance of the BPS sector. The full partition function includes the non-BPS sector which breaks modular invariance explicitly (SUSY breaking by the Goldstino).

**Connection to A1-38 Holography:**

The superalgebra $\mathfrak{su}(1,1|1)$ is the isometry algebra of AdS$_2$. The central charge $Z=78$ is the Brown-Henneaux central charge. The superalgebra cohomology classifies the boundary CFT deformations. The 78 BPS states correspond to 78 boundary operators with conformal dimension $\Delta = 1/2$.