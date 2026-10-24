## 3. Design Philosophy: Authenticity ↔ Protection

### 3.1 Historical Authenticity Score (HAS)

$$\text{HAS} = \sum_{k=1}^{K} \omega_k \cdot \mathbb{I}[F_k \in \mathcal{H}_{1600-1700}] + \sum_{m=1}^{M} \gamma_m \cdot \text{Sim}(P_m, P_m^{\text{hist}})$$

**Feature Categories ($K=12$):**
1. Silhouette accuracy (Watteau back, farthingale profile)
2. Textile typology compliance (CIETA class match)
3. Stitch class fidelity (ISO 4915 ↔ historical mapping)
4. Seam allowance adherence (Alcega/Garsault specs)
5. Lacing topology (historical eyelet placement)
6. Pleating mathematics (3:1 Watteau, S-curve cartridge)
7. Metallic thread construction (Au-Hg/Ag gilded)
8. Pigment chemistry (historical palette match)
9. Fastener form (aglet, hook/eye, aiglet)
10. Lining technique (bag lining vs. flat lining)
11. Edge finishing (pinked, bound, whipped)
12. Decorative program (embroidery, slashing, pinking)

**Similarity Metric for Continuous Parameters:**

$$\text{Sim}(P_m, P_m^{\text{hist}}) = \exp\left(-\frac{|P_m - P_m^{\text{hist}}|^2}{2\sigma_m^2}\right)$$

Where $\sigma_m$ is historical variance from extant garment measurements (V&A, MET, Kunsthistorisches collections).

### 3.2 Protection Efficacy Score (PES)

$$\text{PES} = \frac{1}{5}\sum_{t \in \mathcal{T}} \min\left(1, \frac{\Pi_t(\mathbf{x})}{\Pi_t^{\text{req}}}\right)$$

**Threat Vector Set $\mathcal{T}$:**
- $t_1$: Ballistic (NIJ IV)
- $t_2$: Thermal (1100°C/300s)
- $t_3$: EMI (60 dB @ 1 GHz)
- $t_4$: Directed Energy (ΔT ≤14°C)
- $t_5$: Force Trauma (≥65% reduction @ 50J)

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

