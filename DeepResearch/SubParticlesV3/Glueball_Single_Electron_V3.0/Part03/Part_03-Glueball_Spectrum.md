# V3.0 Deep Dive Series: Glueball Single Electron Theory Synthesis
## Part 3 of 14 — Glueball Spectrum from Diagonalization and Perturbation Theory

---

### Abstract

This installment presents the spectral analysis of glueballs through Hamiltonian diagonalization and perturbative methods, establishing the mass hierarchy and decay channels within the quantum chromodynamic framework.

---

## 1. Hamiltonian Formulation in the Gauge Basis

### 1.1 Canonical Quantization

Starting from the classical Yang-Mills Hamiltonian:

$$H_{\text{YM}} = \int d^3x \left[ \frac{1}{2} E_a^i E_a^i + \frac{1}{4} B_a^i B_a^i \right]$$

where $E_a^i = F_{0i}^a$ is the electric field and $B_a^i = \frac{1}{2} \epsilon^{ijk} F_{jk}^a$ is the magnetic field.

### 1.2 Gauss Law Constraint

The Gauss law requires:

$$\nabla \cdot E_a^i = g f^{abc} A_i^b E_i^c$$

This constraint singles out physical states in the Hilbert space:

$$\hat{G}^a(\vec{x}) |\psi\rangle = 0$$

---

## 2. Perturbative Mass Calculation

### 2.1 First-Order Perturbation Theory

For a two-gluon state with wavefunction $\psi(\vec{x}_1, \vec{x}_2)$:

$$E = \langle \psi | H_{\text{YM}} | \psi \rangle + \langle \psi | H_{\text{int}} | \psi \rangle$$

The interaction Hamiltonian density is:

$$\mathcal{H}_{\text{int}} = g f^{abc} \left( \partial_i A_i^a \right) A_j^b A_j^c + \frac{g^2}{4} f^{abc} f^{ade} A_i^b A_i^c A_j^d A_j^e$$

### 2.2 Chromodynamic Binding Energy

The binding energy for a two-gluon system is estimated via:

$$E_{\text{bind}} = \langle \psi | \mathcal{H}_{\text{int}} | \psi \rangle$$

Using a Gaussian trial wavefunction:

$$\psi(\vec{x}_1, \vec{x}_2) \propto \exp\left( -\frac{|\vec{x}_1 - \vec{x}_2|^2}{2a^2} \right)$$

the binding energy scales as $g^2/a$, balancing the kinetic energy term $\sim 1/a^2$.

---

## 3. Lattice Spectrum Extraction

### 3.1 Effective Hamiltonian Diagonalization

On the lattice, the glueball Hamiltonian is represented as a finite-dimensional matrix. The eigenvalues are extracted via:

$$|\psi_n\rangle = \sum_i c_i^{(n)} |i\rangle$$

where $|i\rangle$ are basis states labeled by gluon field configurations.

### 3.2 Bayesian Inference and Bootstrap Analysis

The spectrum extraction uses Bayesian probability distributions:

$$P(E|\text{data}) \propto P(\text{data}|E) P(E)$$

with bootstrap resampling for systematic error estimation:

$$\sigma_E^2 = \frac{1}{N_{\text{boot}}} \sum_{i=1}^{N_{\text{boot}}} (E_i - \bar{E})^2$$

---

## 4. Decay Widths and Partial Widths

### 4.1 Glueball Decay to Gluons (Photons)

For the decay $G \rightarrow gg$:

$$\Gamma(G \rightarrow gg) = \frac{N_c}{8\pi} m_G^3 |\mathcal{M}|^2$$

where the matrix element is:

$$\mathcal{M} \sim g^2 \epsilon_{\mu\nu\alpha\beta} \epsilon_{1}^{\mu} \epsilon_{2}^{\nu} \epsilon_G^{\alpha} \epsilon_G^{\beta}$$

### 4.2 Glueball Decay to $\mathbf{q\bar{q}}$

Though pure glueballs cannot decay to quark-antiquark pairs in perturbation theory, mixing allows:

$$\Gamma(G \rightarrow q\bar{q}) \sim \theta^2 m_G$$

with mixing parameter $\theta \sim \frac{m_q}{\Lambda_{\text{QCD}}}$.

---

*End of Part 3 — Next: Glueball Mixing with Flavored Hadrons and the Wavefunction Formalism*