**Protection Functions $\Pi_t(\mathbf{x})$** derived from layer stack physics (DOC-01 §2.2, MAT-03, MAT-04).

### 3.3 Pareto Frontier Methodology (NSGA-II)

$$\mathcal{P}^* = \{\mathbf{x} \in \mathcal{X} \mid \nexists \mathbf{y} \in \mathcal{X}: \text{HAS}(\mathbf{y}) \geq \text{HAS}(\mathbf{x}) \land \text{PES}(\mathbf{y}) \geq \text{PES}(\mathbf{x}) \land (\text{HAS}(\mathbf{y}) > \text{HAS}(\mathbf{x}) \lor \text{PES}(\mathbf{y}) > \text{PES}(\mathbf{x}))\}$$

**Algorithm Parameters:**
- Population: 200 designs per edition
- Generations: 500
- Crossover: SBX ($\eta_c = 15$)
- Mutation: Polynomial ($\eta_m = 20$)
- Constraint handling: Feasibility-first with $\epsilon$-constraint relaxation

**Decision Variables $\mathbf{x}$ (per edition):**
- Layer thicknesses $t_k$ (12 variables)
- Material selections $m_k$ (categorical, 3-5 options per layer)
- LES tensions $T_z$ (12 variables)
- Pattern scaling factors $s_x, s_y, s_z$ (3 variables)
- Metallic thread density $\rho_{\text{Au}}$ (1 variable)

---

