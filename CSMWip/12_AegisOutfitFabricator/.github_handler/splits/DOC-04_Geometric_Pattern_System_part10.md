**No-Fit Polygon (NFP) for Irregular Shapes:**

$$\text{NFP}(A, B) = \{ \mathbf{t} \in \mathbb{R}^2 \mid \text{int}(A) \cap \text{int}(B + \mathbf{t}) = \emptyset \}$$

**Objective Function:**

$$\min \quad L_{\text{used}} = \max_i (y_i + h_i)$$

Subject to:
- $x_i \geq 0, \quad x_i + w_i \leq 560$ (loom width)
- $\text{NFP}(P_i, P_j) \cap \{\mathbf{0}\} = \emptyset \quad \forall i \neq j$ (no overlap)
- Grain direction constraint: $\angle(\mathbf{g}_i, \mathbf{e}_y) \leq 5^\circ$

### 5.2 Simulated Annealing Parameters

| Parameter | Value | Schedule |
|-----------|-------|----------|
| Initial temp | 1000 | — |
| Cooling rate | 0.95 | Geometric |
| Min temp | 0.1 | — |
| Iterations/temp | 500 | — |
