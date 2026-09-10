# V3.0 Deep Dive Series: Microbial Ecosystem Food Chains
## Part 9 of 14 — Population Dynamics and Lotka-Volterra Models

---

### Abstract

This installment develops the theoretical foundation for population dynamics in microbial communities, extending classical models to multispecies food webs.

---

## 1. Multi-Species Lotka-Volterra

$$\frac{dN_i}{dt} = N_i \left( r_i + \sum_{j=1}^n \alpha_{ij} N_j \right)$$

The interaction matrix $\alpha_{ij}$:
- $\alpha_{ii} < 0$ (intraspecific competition)
- $\alpha_{ij} < 0$ for predators ($j$ preys on $i$)
- $\alpha_{ij} > 0$ for mutualistic ($i$ benefits $j$)

---

## 2. Stability Analysis

### 2.1 Jacobian Eigenvalue Criteria

At equilibrium $\mathbf{N}^*$:

$$J_{ij} = \frac{\partial f_i}{\partial N_j}\bigg|_{\mathbf{N}^*}$$

System stable if all eigenvalues have negative real parts.

### 2.2 Routh-Hurwitz Conditions

For 3 species: $a_1 > 0, \quad a_1 a_2 > a_3, \quad a_3 > 0$.

---

*End of Part 9 — Next: Metagenomics and Community Sequencing*
