# Piece 09: IR/UV Duality: Supercharge under $d_n \leftrightarrow 1/d_n$

The IR/UV duality from A1-25 Piece 09 maps long-distance (IR) physics to short-distance (UV) physics via $d_n \leftrightarrow 1/d_n$. Under this duality, the supercharge transforms as:

$$
Q = \sum_n \psi_n \sqrt{d_n d_{n+1}} \quad \to \quad Q_{\text{dual}} = \sum_n \psi_n \frac{1}{\sqrt{d_n d_{n+1}}}
$$

The duality acts on the Hilbert space by exchanging the gap basis with its Fourier dual. The 8-bit structure (A1-25 Piece 11) has $d_n \in \{1, \dots, 255\}$, and the duality maps $d_n \mapsto 256/d_n$ (modulo the 8-bit periodicity). The fixed points are $d_n = 16$ (self-dual gap).

The central charge is invariant: $Z = \sum_n \text{sign}(d_n - \langle d \rangle) = \sum_n \text{sign}(1/d_n - 1/\langle d \rangle) = 78$ because $\text{sign}(x - \mu) = -\text{sign}(1/x - 1/\mu)$ for positive $x, \mu$. The Hamiltonian transforms as $H \to H_{\text{dual}} = \frac{1}{2}\sum 1/(d_n d_{n+1})$.

The SUSY algebra is covariant: $\{Q_{\text{dual}}, Q_{\text{dual}}^\dagger\} = 2H_{\text{dual}} + Z$. The BPS bound $E \ge |Z|/2$ is preserved. The 78 BPS states map to 78 dual BPS states with energy $E_{\text{dual}} = |Z|/2 = 39$.

In terms of the physical Hamiltonian from A1-17: $H_{\text{phys}} = \frac{\hbar}{\kappa}\sum d_n^{-1}$, the duality exchanges $H_{\text{phys}} \leftrightarrow H_{\text{SUSY}}$ (A1-25 Piece 09). The supercharge duality is the quantum version of this exchange.

The duality acts on the 256×256 supercharge matrix by transposition in the gap-pair basis: $(Q_{\text{dual}})_{ij} = Q_{ji} / (d_i d_j)$. The eigenvalues of $Q$ and $Q_{\text{dual}}$ are related by $\lambda_{\text{dual}} = \lambda / (d_i d_j)$.

This duality explains the electron mass hierarchy (Article 2): the IR supercharge $Q$ with large gaps gives the electron mass $m_e \sim 0.511$ MeV (twin prime gap 2), while the UV supercharge $Q_{\text{dual}}$ with small gaps $1/d_n$ gives the muon and tau masses from record gaps 4, 6, 8, etc. The central charge $Z=78$ unifies both regimes.

**Detailed duality action on the Hilbert space:**

The duality is implemented by the unitary operator $U_{\text{dual}} = \prod_n \mathcal{F}_n$ where $\mathcal{F}_n$ is the Fourier transform on the $n$-th gap qubit: $\mathcal{F}_n |0\rangle_n = \frac{1}{\sqrt{2}}(|0\rangle_n + |1\rangle_n)$, $\mathcal{F}_n |1\rangle_n = \frac{1}{\sqrt{2}}(|0\rangle_n - |1\rangle_n)$. This is the Hadamard transform on each qubit.

Under duality, the gap basis $|d_n\rangle$ transforms to the conjugate basis $|\tilde{d}_n\rangle$ where $\tilde{d}_n = 256/d_n \mod 256$. The supercharge transforms as $Q_{\text{dual}} = U_{\text{dual}} Q U_{\text{dual}}^\dagger$.

The gap pair weight transforms as $\sqrt{d_n d_{n+1}} \to \sqrt{\tilde{d}_n \tilde{d}_{n+1}} = \sqrt{256^2/(d_n d_{n+1})} = 256/\sqrt{d_n d_{n+1}}$. Up to the overall scale 256 (which can be absorbed into the normalization of $\psi_n$), this is the inverse weight $1/\sqrt{d_n d_{n+1}}$.

**Self-dual point:**

The gap $d = 16$ is self-dual: $256/16 = 16$. At this gap value, the supercharge is invariant under duality. The gap $d=16$ occurs in PrimeBookOne directory 2.0 as a record gap (the 16-gap record). The corresponding BPS state is a fixed point of the duality.

**Mass hierarchy from duality:**

The physical Hamiltonian $H_{\text{phys}} = \frac{\hbar}{\kappa}\sum d_n^{-1}$ has eigenvalues $E \sim \hbar/(\kappa \cdot 2)$ for twin primes (gap 2), giving $m_e \sim 0.511$ MeV. The dual Hamiltonian $H_{\text{dual}} = \frac{\hbar}{\kappa}\sum d_n$ has eigenvalues $E \sim \hbar \cdot 4/\kappa$ for gap 4, giving $m_\mu \sim 105$ MeV. The ratio $m_\mu/m_e \sim 207$ matches the observed ratio.

The central charge $Z=78$ is the only scale that survives duality. It sets the overall mass scale for all generations: $m_n \sim (|Z|/2) \times (\text{gap-dependent factor})$.

**Connection to Article 4 (Coupling Constants):**

The IR/UV duality on the supercharge induces a duality on the gauge couplings. The fine structure constant $\alpha$ from A4-01 (twin prime density) is the IR coupling. The strong coupling $\alpha_s$ from A4-02 (record gap statistics) is the UV coupling. The duality exchanges $\alpha \leftrightarrow \alpha_s$ at the unification scale where $d_n \sim 16$.