# PIECE 10: Superspace Formulation — N=1 Superspace on the Prime Worldline

The N=1 supersymmetry on the prime electron worldline can be formulated in **superspace** — a supermanifold with coordinates $(\tau, \theta, \bar{\theta})$ where $\tau$ is proper time and $\theta, \bar{\theta}$ are Grassmann coordinates. This provides a geometric unification of the supercharges and Hamiltonian.

**Superspace Coordinates:**
$$z = (\tau, \theta, \bar{\theta}), \quad \tau \in \mathbb{R} \text{ (discrete steps } \tau_n\text{)}, \quad \theta, \bar{\theta} \in \Lambda_1 \text{ (Grassmann)}$$

The superderivatives are:
$$D = \frac{\partial}{\partial \theta} - \bar{\theta} \frac{\partial}{\partial \tau}, \quad \bar{D} = \frac{\partial}{\partial \bar{\theta}} - \theta \frac{\partial}{\partial \tau}$$
satisfying $\{D, \bar{D}\} = -2 \frac{\partial}{\partial \tau}$, $\{D, D\} = \{\bar{D}, \bar{D}\} = 0$.

**Superfield:**
The worldline superfield is a function on superspace:
$$\Phi(z) = \phi(\tau) + \theta \psi(\tau) + \bar{\theta} \bar{\psi}(\tau) + \theta \bar{\theta} F(\tau)$$
where $\phi$ is the bosonic proper-time coordinate, $\psi, \bar{\psi}$ are the fermionic chiralities, and $F$ is the auxiliary field.

For the prime electron:
- $\phi(\tau_n) = \tau_n = \kappa \sum_{i=1}^n d_i$
- $\psi(\tau_n)$ = left-chirality fermion (electron component)
- $\bar{\psi}(\tau_n)$ = right-chirality fermion (positron component)
- $F(\tau_n)$ = auxiliary field, eliminated by EOM

**Superspace Action:**
The N=1 SQM action in superspace is:
$$S = \int d\tau \, d\theta \, d\bar{\theta} \left[ \frac{1}{2} \bar{D}\Phi D\Phi + W(\Phi) \right]$$

where $W(\Phi)$ is the superpotential. For the prime electron:
$$W(\Phi) = \sum_n \left( \log d_n + \text{sign}(d_n - \langle d \rangle_{\text{local}}) \right) \Phi$$

The $\theta \bar{\theta}$ component gives the component action:
$$S = \int d\tau \left[ \frac{1}{2} \dot{\phi}^2 + \frac{1}{2} W'(\phi)^2 + \bar{\psi} \left( i \frac{d}{d\tau} + W''(\phi) \right) \psi + F^2 \right]$$

**Discrete Superspace:**
Since the worldline is discrete (proper-time steps $\tau_n$), we use a **discrete superspace** (lattice supersymmetry). The Grassmann coordinates live at each site: $\theta_n, \bar{\theta}_n$. The superderivatives become difference operators:
$$D_n \Phi_n = \psi_n - \bar{\theta}_n (\phi_{n+1} - \phi_n), \quad \bar{D}_n \Phi_n = \bar{\psi}_n - \theta_n (\phi_{n+1} - \phi_n)$$

The discrete action is:
$$S = \sum_n \left[ \frac{1}{2} (\phi_{n+1} - \phi_n)^2 + \frac{1}{2} W'(\phi_n)^2 + \bar{\psi}_n (\psi_{n+1} - \psi_n + W''(\phi_n) \psi_n) \right]$$

This is the **lattice N=1 SQM action** for the prime electron worldline.

**Supercharges as Superspace Translations:**
The supercharges are the generators of superspace translations:
$$Q = \int d\theta \, \theta \bar{D}, \quad Q^\dagger = \int d\bar{\theta} \, \bar{\theta} D$$

In discrete form:
$$Q = \sum_n \psi_n \sqrt{d_n d_{n+1}}, \quad Q^\dagger = \sum_n \bar{\psi}_n \sqrt{d_n d_{n+1}}$$

The SUSY algebra $\{Q, Q^\dagger\} = 2H + Z$ follows from the superspace geometry: the anticommutator of supercharges is the translation generator in $\tau$ plus a central charge from the superpotential boundary term.

**Central Charge from Superspace Boundary Term:**
The central charge arises from the boundary term in the superspace action:
$$Z = \int_{\partial \mathcal{M}} d\theta \, d\bar{\theta} \, W(\Phi)$$
where $\partial \mathcal{M}$ is the boundary of the worldline (IR and UV ends). For the prime electron:
$$Z = W(\tau_{\text{UV}}) - W(\tau_{\text{IR}}) = \sum_n \text{sign}(d_n - \langle d \rangle_{\text{local}}) = 78$$

The log term $\log d_n$ gives a divergent boundary contribution that cancels between IR and UV; only the topological sign term survives.

**8-Bit Hilbert Space in Superspace:**
The 256 states of $\mathcal{H}$ correspond to the **components of the superfield** evaluated at a single site. The Grassmann algebra $\Lambda(\theta, \bar{\theta})$ has dimension 4, but the 8-bit structure means we have 8 fermionic coordinates (bits 0-6 for the 7 non-chiral bits, bit 7 for chirality). The full Grassmann algebra is $\Lambda(\theta_1, \dots, \theta_8)$ with dimension $2^8 = 256$. The superfield is:
$$\Phi = \phi + \sum_i \theta_i \psi_i + \sum_{i<j} \theta_i \theta_j B_{ij} + \cdots + \theta_1 \cdots \theta_8 F$$

The 256 components are the physical fields of the worldline theory.

**Superspace Path Integral (Connection to A1-18):**
The path integral over superspace is:
$$\int \mathcal{D}\Phi \, e^{i S[\Phi]} = \int \mathcal{D}\phi \, \mathcal{D}\psi \, \mathcal{D}\bar{\psi} \, \mathcal{D}F \, e^{i S_{\text{comp}}}$$

This reproduces the worldline path integral of A1-18 with the SUSY structure built in. The fermionic integral over $\psi, \bar{\psi}$ gives the determinant $\det(i \partial_\tau + W'')$, which is the index theorem determinant.

**Advantage of Superspace Formulation:**
1. **Manifest SUSY**: The action is manifestly supersymmetric
2. **Central charge as boundary term**: $Z$ is clearly topological
3. **Non-renormalization**: The superpotential $W$ is not renormalized (gap sequence is fixed)
4. **Anomaly inflow**: The boundary term in superspace is the anomaly inflow current (A1-23)

This piece provides the geometric superspace formulation that unifies all SUSY structures on the prime electron worldline.