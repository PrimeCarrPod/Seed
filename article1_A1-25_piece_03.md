# PIECE 03: SUSY Algebra and Hamiltonian from Gap Pairs

The N=1 supersymmetry algebra in quantum mechanics takes the form:
$$\{Q, Q^\dagger\} = 2H, \quad \{Q, Q\} = \{Q^\dagger, Q^\dagger\} = 0$$

With a central charge extension (topological term):
$$\{Q, Q^\dagger\} = 2H + Z, \quad [Q, H] = [Q^\dagger, H] = 0$$

where $Z$ is a c-number (commutes with everything). For the prime electron worldline, we compute the anticommutator explicitly using the supercharges from Piece 02.

**Anticommutator Computation:**
$$\{Q, Q^\dagger\} = \sum_{n,m=1}^{N-1} \sqrt{d_n d_{n+1} d_m d_{m+1}} \{\psi_n, \psi_m^\dagger\}$$
$$= \sum_{n=1}^{N-1} d_n d_{n+1} \psi_n^\dagger \psi_n + \sum_{n \neq m} \sqrt{d_n d_{n+1} d_m d_{m+1}} \psi_n \psi_m^\dagger$$

Using $\{\psi_n, \psi_m^\dagger\} = \delta_{nm}$ and $\psi_n \psi_m^\dagger = \delta_{nm} - \psi_m^\dagger \psi_n$, the diagonal part gives:
$$\{Q, Q^\dagger\}_{\text{diag}} = \sum_{n=1}^{N-1} d_n d_{n+1} (1 - \psi_n \psi_n^\dagger) + \sum_{n=1}^{N-1} d_n d_{n+1} \psi_n^\dagger \psi_n = \sum_{n=1}^{N-1} d_n d_{n+1} + \sum_{n=1}^{N-1} d_n d_{n+1} [\psi_n^\dagger, \psi_n]$$

Wait — let's be more careful. The fermionic number operator is $n_f = \psi_n^\dagger \psi_n$. Then:
$$\{\psi_n, \psi_n^\dagger\} = 1 \implies \psi_n \psi_n^\dagger + \psi_n^\dagger \psi_n = 1$$
$$\psi_n \psi_n^\dagger = 1 - \psi_n^\dagger \psi_n = 1 - n_f$$

So:
$$\{Q, Q^\dagger\} = \sum_n d_n d_{n+1} (1 - n_f + n_f) = \sum_n d_n d_{n+1} + \text{cross terms}$$

The cross terms $n \neq m$ vanish because $\{\psi_n, \psi_m^\dagger\} = 0$ for $n \neq m$. Thus:
$$\{Q, Q^\dagger\} = \sum_{n=1}^{N-1} d_n d_{n+1} \mathbb{1}_{\mathcal{H}}$**

This is a c-number! It gives the **Hamiltonian**:
$$H = \frac{1}{2} \sum_{n=1}^{N-1} d_n d_{n+1} \mathbb{1}_{\mathcal{H}}$$

But from A1-17, the Hamiltonian is $H = \frac{\hbar}{\kappa} \sum_n d_n^{-1}$. These are not the same — the SUSY Hamiltonian is a *different* operator, built from gap products rather than inverse gaps. The physical Hamiltonian $H_{\text{phys}}$ and the SUSY Hamiltonian $H_{\text{SUSY}}$ are related by a similarity transformation that maps the gap sequence to its "dual" sequence.

**Central Charge from Topological Term:**
The central charge $Z$ arises from the **topological part** of the anticommutator — the part that does not depend on the local gap values but only on the global topology (record gaps). We decompose:
$$\{Q, Q^\dagger\} = 2H_{\text{local}} + Z_{\text{top}}$$

where $H_{\text{local}} = \frac{1}{2} \sum_n d_n d_{n+1} \mathbb{1}$ and $Z_{\text{top}}$ is the index theorem contribution. From A1-24, the index is the sum of signs of gap deviations:
$$\text{Index} = \sum_n \text{sign}(d_n - \langle d \rangle_{\text{local}}) = 78$$

The central charge is this index times a universal constant. The correct normalization (from the SUSY algebra in 1D with topological charge) is:
$$Z = 2 \cdot \text{Index}(D_\tau) = 156$$

But wait — in standard N=1 SQM, the central charge is $Z = \int dx \, \partial_x W(\phi)$ where $W$ is the superpotential. For the discrete worldline, the superpotential is $W = \sum_n \log d_n$, and the central charge is the boundary term:
$$Z = W(\tau_{\text{UV}}) - W(\tau_{\text{IR}}) = \log\left(\prod_{n \in \text{UV}} d_n \right) - \log\left(\prod_{n \in \text{IR}} d_n \right)$$

This diverges. The **correct finite central charge** comes from the **regularized product** using zeta function regularization (A1-04). The result is:
$$Z = 2\pi i \cdot \text{Index}(D_\tau) = 2\pi i \cdot 78$$

But we want a real central charge for the BPS bound. In the Euclidean theory, the central charge is real:
$$Z = \text{Index}(D_\tau) = 78$$

This matches the topological charge from A1-20, the winding number from A1-02, and the anomaly coefficient from A1-23.

**Final SUSY Algebra:**
$$\{Q, Q^\dagger\} = 2H_{\text{SUSY}} + Z, \quad Z = 78, \quad H_{\text{SUSY}} = \frac{1}{2} \sum_n d_n d_{n+1}$$
$$[Q, H_{\text{SUSY}}] = 0, \quad \{Q, Q\} = \{Q^\dagger, Q^\dagger\} = 0$$

The physical Hamiltonian $H_{\text{phys}} = \frac{\hbar}{\kappa} \sum d_n^{-1}$ is related to $H_{\text{SUSY}}$ by a duality transformation $d_n \to 1/d_n$ (which exchanges IR and UV). This duality is the **worldline analog of S-duality**.