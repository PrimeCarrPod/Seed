# A1-14: Worldline Metric From Gaps — Piece 04: Spatial Metric from Self-Intersections

## 7. Spatial Geometry from Self-Intersection Network

### 7.1 Self-Intersections as Spatial Points

From A1-11, a self-intersection $(n,m)$ with $d_n = d_m$ means the worldline returns to the same gap environment. The set of all self-intersections forms a **graph** where vertices are gap values and edges are proper time segments between recurrences.

### 7.2 Graph Distance as Spatial Distance

The spatial distance between gap values $d_a$ and $d_b$:
$$
d_{\text{spatial}}(d_a, d_b) = \kappa \times (\text{shortest path in self-intersection graph})
$$

This graph is connected (A1-11 wall crossing) and has dimension 3 in the scaling limit.

### 7.3 Metric from Graph Laplacian

The spatial metric tensor is the inverse of the graph Laplacian:
$$
g^{ij}(d) = \left( \Delta_{\text{graph}} \right)^{-1}_{ij}
$$

where $\Delta_{\text{graph}}$ is the Laplacian on the self-intersection graph. At large scales, this reproduces $g_{ij} \sim \ln n \, \delta_{ij}$.

---

## 8. Self-Intersection Induced Anisotropy

### 8.1 Local Anisotropy from Gap Values

Different gap values have different self-intersection patterns:
- $d=2$ (twin primes): dense network, $\sim \ln n / \ln \ln n$ connections
- $d=4$ (cousin primes): sparser
- $d=6$ (sexy primes): similar to $d=4$
- Record gaps: very few self-intersections

### 8.2 Anisotropic Metric Correction

The metric acquires anisotropic corrections:
$$
g_{ij}(n) = \langle d_n \rangle \delta_{ij} + \sum_{d} \epsilon_d(n) P^{(d)}_{ij}
$$

where $P^{(d)}_{ij}$ are projectors onto gap-class subspaces, and $\epsilon_d(n) \sim 1/\ln n$ are small.

---

*End of Piece 04 — Continues in Piece 05: Emergent Light Cone Structure*