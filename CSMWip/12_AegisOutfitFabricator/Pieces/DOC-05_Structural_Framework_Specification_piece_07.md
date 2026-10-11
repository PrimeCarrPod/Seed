**Zone-Edition Interaction $\beta_{z,e}$ (Sample):**

| Zone | RM-TS | RM-TG | RW-TS | RW-TG |
|------|-------|-------|-------|-------|
| Z1 | 1.00 | 1.05 | 0.95 | 1.00 |
| Z4 | 0.95 | 1.10 | 0.90 | 1.05 |
| Z5 | 1.00 | 1.08 | 0.95 | 1.03 |

### 3.3 Moment Balance Constraint

$$\sum_{z=1}^{12} T_z \cdot \mathbf{r}_z \times \mathbf{n}_z = \mathbf{0} \quad \text{(Static equilibrium)}$$

Where $\mathbf{r}_z$ = position vector of zone $z$, $\mathbf{n}_z$ = normal direction.

---

## 4. Deployment & Locking (from CSMFAB078 Main §4.7, CSMFAB078-A §3.4, DRAFT-04 §3.3)

### 4.1 Spring Energy Storage

**LES Deployment Springs (Z5, Z6):**

$$U_{\text{stored}} = \sum_{z \in \{5,6\}} \frac{1}{2} k_z (\Delta x_z)^2$$

$k_z = 200\text{ N/m}$ (per zone), $\Delta x_z = 0.15\text{ m}$ (pre-compression).

**Total Deployment Energy:** $U_{\text{total}} \approx 4.5\text{ J}$ per side.

### 4.2 Deployment Dynamics

