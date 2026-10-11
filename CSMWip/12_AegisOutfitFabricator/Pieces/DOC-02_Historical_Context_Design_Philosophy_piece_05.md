### 2.1 Algorithmic Constraints from Historical Regulation

Sumptuary laws (1550-1700) imposed **quantifiable limits** on materials, construction, and display — directly translatable to design constraints.

| Constraint | Historical Law | Algorithmic Form | Layer Impact |
|------------|----------------|------------------|--------------|
| **Gold thread width** | Elizabethan 1574: "no gold thread > 1/8 inch" | $w_{\text{Au}} \leq 3.175\text{ mm}$ | L3, L4, L6 metallic thread |
| **Dye chemistry** | Spanish 1582: "no cochineal on silk < 20 ducats/yard" | $\text{Cost}_{\text{dye}} \leq C_{\text{max}}$ | L1 YInMn Blue synthesis |
| **Yardage maximum** | French 1629: "court gown ≤ 15 aunes (19.5 m)" | $A_{\text{total}} \leq 19.5\text{ m}^2$ | Nesting optimization (DRAFT-05) |
| **Guild segregation** | London 1604: "tailors ≠ embroiderers ≠ silkweavers" | $\text{Process}_i \cap \text{Process}_j = \emptyset$ | Fabricator chain topology |
| **Fur restrictions** | Venetian 1562: "ermine only for doge/council" | $\text{Material}_{\text{fur}} \in \{\text{permitted}\}$ | L10 baleen substitution |

### 2.2 Constraint Satisfaction Formulation

$$\text{Find } \mathbf{x} \in \mathcal{X} \text{ s.t. } \mathbf{g}(\mathbf{x}) \leq \mathbf{0}, \quad \mathbf{h}(\mathbf{x}) = \mathbf{0}$$

Where:
- $\mathbf{g}(\mathbf{x})$: Inequality constraints (sumptuary limits, mass budget, thickness)
- $\mathbf{h}(\mathbf{x})$: Equality constraints (geometric closure, LES tension balance)
- $\mathcal{X}$: Feasible set (CIETA weaves, Alcega geometry, material specs)

**Constraint Relaxation for Modern Protection:**
