# A1-29 Worldline_Wall_Crossing.md — Piece 02
## Kontsevich-Soibelman Formula for Gap Transitions

The KS wall crossing formula describes how the BPS degeneracies $\Omega(\gamma)$ change when crossing a wall of marginal stability. For the prime electron worldline, the charge lattice is $\Gamma = \mathbb{Z}^{78}$ with basis vectors $\gamma_k$ corresponding to the 78 record gaps. The symplectic pairing $\langle \gamma_i, \gamma_j \rangle$ is determined by the worldline self-intersection topology (A1-11).

**Symplectic pairing from self-intersections.** The worldline self-intersection $\gamma(\tau_n) = \gamma(\tau_m)$ (A1-11) defines an intersection form on the charge lattice. For two BPS states associated with record gaps at indices $i$ and $j$, the pairing is:

$$\langle \gamma_i, \gamma_j \rangle = \text{sign}(i - j) \cdot f(d_{\text{rec}}^{(i)}, d_{\text{rec}}^{(j)})$$

where $f$ is a function of the gap values determined by the instanton overlap (A1-19). For well-separated record gaps, $f \approx 1$; for nearby gaps in the same book, $f$ can be larger.

**KS formula for the prime electron.** The KS wall crossing formula states that the generating function of BPS degeneracies (the "wall crossing operator") transforms as:

$$\mathbb{U}_{\text{after}} = \mathbb{K}_{\gamma} \mathbb{U}_{\text{before}}$$

where $\mathbb{K}_{\gamma}$ is the KS operator for the charge $\gamma$ crossing the wall:

$$\mathbb{K}_{\gamma} = \exp\left( \sum_{n \geq 1} \frac{(-1)^{n-1}}{n} \Omega(n\gamma) \text{Li}_2(X_{n\gamma}) \right)$$

Here $\text{Li}_2$ is the dilogarithm, and $X_\gamma$ are Darboux coordinates on the moduli space. For the prime electron, the Darboux coordinates are:

$$X_{\gamma_k} = \exp\left( 2\pi i \tau_k \right), \quad \tau_k = \kappa \sum_{m=1}^{n_k} d_m$$

where $n_k$ is the index of the $k$-th record gap in the prime gap sequence.

**Dilogarithm identities and gap statistics.** The dilogarithm identities appearing in the KS formula are satisfied by the prime gap statistics. For example, the pentagon identity:

$$\text{Li}_2(x) + \text{Li}_2(y) = \text{Li}_2(xy) + \text{Li}_2\left(\frac{x(1-y)}{1-xy}\right) + \text{Li}_2\left(\frac{y(1-x)}{1-xy}\right)$$

corresponds to the relation between three consecutive record gaps. The prime gap distribution satisfies these identities asymptotically, with corrections of order $1/\log p$.

**Cluster algebra structure.** The KS transformations generate a cluster algebra on the moduli space. The cluster variables are the $X_{\gamma_k}$, and the mutations correspond to wall crossing events. The cluster algebra is of type $A_{78}$ (or more precisely, a quiver with 78 nodes given by the record gap adjacency). The cluster complex is the space of all possible gap configurations reachable by wall crossing from the physical configuration.