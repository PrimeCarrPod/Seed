# A1-11: Worldline Self-Intersection — γ(τ_n) = γ(τ_m) Topology (Piece 04)

## 16. Self-Intersection in the Worldline Path Integral

### 16.1 Path Integral with Self-Intersections

From A1-18 (Worldline Path Integral), the electron propagator is a sum over worldlines:
$$
\langle x_f | e^{-iH T} | x_i \rangle = \int \mathcal{D}[x(\tau)] e^{i S[x]/\hbar}
$$

In the Prime Electron model, the path integral is **discrete** — a sum over prime gap sequences. Each worldline configuration is a sequence of gaps $\{d_n\}$. The action:
$$
S = \sum_n \left( \frac{m}{2} \frac{(\Delta x_n)^2}{\Delta\tau_n} - V(x_n) \Delta\tau_n \right)
$$
with $\Delta\tau_n = \kappa d_n$.

### 16.2 Self-Intersections as Worldline Crossings

A **self-intersection** in the path integral is a configuration where $x(\tau_n) = x(\tau_m)$ for $n \neq m$. In the discrete sum, this means the **same spatial coordinate** is assigned to two different proper-time steps.

Since the spatial embedding $x_n$ is not yet fully determined (emergent from A1-37), we work with the **gap sequence proxy**: two steps self-intersect if their gap environments match.

### 16.3 Sum Over Self-Intersection Topologies

The path integral decomposes into a sum over **self-intersection topologies**:
$$
Z = \sum_{\text{gap sequences}} e^{iS/\hbar} = \sum_{\mathcal{T}} \sum_{\{d_n\} \in \mathcal{T}} e^{iS/\hbar}
$$
where $\mathcal{T}$ labels the self-intersection graph topology (which steps are identified).

### 16.4 Topological Expansion = Loop Expansion

The sum over topologies $\mathcal{T}$ is exactly the **loop expansion** of QED:
- **Planar topology** (no self-intersections): tree-level
- **One self-intersection loop**: 1-loop
- **Two self-intersection loops**: 2-loop
- **Linked loops**: non-planar diagrams

The **weight** of each topology is determined by the number of gap sequences realizing it.

### 16.5 Instantons as Special Self-Intersections

From A1-19 (Instanton Solutions), **instantons** are tunneling configurations between gap classes. An instanton is a **special self-intersection** where the worldline tunnels through a potential barrier created by a large gap (record gap).

The instanton action:
$$
S_{\text{inst}} \sim \frac{1}{\kappa} \frac{(\Delta x)^2}{\Delta\tau} \sim \frac{m_e c^2}{\kappa} \frac{(p_{\text{record}} - p_{\text{prev}})^2}{d_{\text{record}}} \sim m_e c^2 \frac{d_{\text{record}}}{\kappa}
$$

For record gaps $d \sim \ln^2 p$, $S_{\text{inst}} \sim \ln^2 p$ — **instantons are rare** (suppressed by large action), matching the rarity of record gaps.

---

## 17. Self-Intersection and the Worldline Hamiltonian (A1-17 Connection)

### 17.1 Hamiltonian with Self-Interaction

From A1-17, the worldline Hamiltonian:
$$
H = \frac{\hbar}{\kappa} \sum_n \frac{1}{d_n} + H_{\text{self-int}}
$$

The self-interaction term comes from self-intersections:
$$
H_{\text{self-int}} = \frac{e^2}{2} \sum_{n \neq m} \frac{\delta_{\text{recur}}(n,m)}{|x_n - x_m|}
$$

In proper-time gauge with gap-proxy:
$$
H_{\text{self-int}} \approx \frac{\alpha \hbar}{\kappa} \sum_{n \neq m} \frac{\delta_{d_n, d_m}}{(p_n - p_m)^2}
$$

### 17.2 Self-Intersection as Perturbation

Treating $H_{\text{self-int}}$ as a perturbation on the free worldline:
$$
E = E_0 + \langle 0 | H_{\text{self-int}} | 0 \rangle + \dots
$$

The first-order shift is the **self-energy** (divergent in continuum, finite here). The second-order gives the **Lamb shift**.

### 17.3 Self-Intersection and Energy Levels

The self-interaction splits the degeneracy of worldline states with the same gap sequence but different self-intersection topologies. This is the **fine structure** of the electron's worldline spectrum.

---

## 18. Self-Intersection and the Modular Hamiltonian (A1-33 Connection)

### 18.1 Modular Hamiltonian from Self-Intersection Network

From A1-33, the modular Hamiltonian $K = -\ln \rho$ for a segment. The density matrix $\rho$ is obtained by tracing out the complement. In the self-intersection graph, tracing out a segment means **removing its vertices and edges**.

The resulting reduced density matrix has eigenvalues related to the **self-intersection entanglement spectrum**.

### 18.2 Self-Intersection Entanglement Spectrum

For a segment with $N_{\text{inter}}$ inter-book self-intersections, the entanglement spectrum is:
$$
\lambda_k = \frac{e^{-2\pi k / N_{\text{inter}}}}{Z}, \quad Z = \sum_k e^{-2\pi k / N_{\text{inter}}}
$$

The modular Hamiltonian:
$$
K = \frac{2\pi}{N_{\text{inter}}} \sum_k k |k\rangle\langle k|
$$

This is a **thermal spectrum** with effective temperature $T = N_{\text{inter}}/(2\pi)$ — matching the Unruh-like temperature from A1-10.

### 18.3 Self-Intersection and Relative Entropy (A1-34)

The relative entropy between two segments' reduced density matrices:
$$
S(\rho_b || \rho_{b'}) = \text{Tr}(\rho_b \ln \rho_b - \rho_b \ln \rho_{b'})
$$

In terms of self-intersections, this measures the **difference in self-intersection environments** — how many self-intersections connect $b$ vs $b'$ to the rest of the worldline.

---

## 19. Self-Intersection and Quantum Error Correction (A1-35, A3-08 Connection)

### 19.1 Twin Prime Self-Intersections as QEC

From A1-35, twin primes ($d=2$) form a **quantum error correcting code**. Each twin prime pair is a self-intersection of the shortest possible proper-time separation.

The **code space** is spanned by states with different self-intersection patterns. The **logical qubits** are encoded in the **relative phases** between self-intersection loops.

### 19.2 Error Correction from Self-Intersection Redundancy

A single-gap error (changing $d_n \to d_n'$) changes the self-intersection graph locally. The **redundancy** of the twin prime clique (size $\sim 10^7$) means the logical information is **encoded in the global topology** — local errors don't destroy it.

The **distance** of the code is the minimum number of self-intersections that must be changed to flip a logical qubit. For the twin prime code, distance $\sim \pi_2(N) \sim 10^7$ — **exponentially large protection**.

### 19.3 Decoherence from Self-Intersection Fluctuations

Random fluctuations in the gap sequence cause **self-intersection graph fluctuations** — this is the **decoherence mechanism** (A3-06). The decoherence rate:
$$
\Gamma_{\text{decoh}} \propto \frac{1}{N_{\text{self-int}}}
$$

More self-intersections = better error correction = less decoherence. The IR segments (directory 0.0) have fewer self-intersections — **more decoherent**. The UV segments (directory 3.0) have more — **more coherent**.

---

*End of Piece 04 — Continues in Piece 05: Self-Intersection and the Electron's Spin Structure*