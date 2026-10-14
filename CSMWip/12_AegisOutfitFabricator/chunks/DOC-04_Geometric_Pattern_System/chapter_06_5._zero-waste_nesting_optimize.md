## 5. Zero-Waste Nesting Optimizer (from DRAFT-05, Research Doc 1 §4.6, SYNTH-01 §3.4, CSMFAB078 Main §6.4, CSMFAB078-E §2)

### 5.1 Bottom-Left + NFP + Simulated Annealing (per DRAFT-05 §3.1, Research Doc 1 §4.6, CSMFAB078 Main §6.4, SYNTH-01 §3.4)

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
| Move types | Translate, Rotate 90°, Swap | Uniform |

### 5.3 Edition-Specific Efficiency Targets

| Edition | $\eta_{\text{nest}}$ Target | Offcut Catalog Size |
|---------|---------------------------|---------------------|
| RM-TS | 0.94 | 12 pieces |
| RM-TG | 0.91 | 18 pieces |
| RM-SS | 0.95 | 10 pieces |
| RM-SG | 0.92 | 15 pieces |
| RW-TS | 0.93 | 14 pieces |
| RW-TG | 0.89 | 20 pieces |
| RW-SS | 0.94 | 11 pieces |
| RW-SG | 0.90 | 17 pieces |

### 5.4 Offcut Utilization (Phoenix Protocol Integration)

$$\text{Recovery Rate} = \frac{\sum A_{\text{offcuts used}}}{\sum A_{\text{offcuts generated}}} \geq 0.85$$

---
