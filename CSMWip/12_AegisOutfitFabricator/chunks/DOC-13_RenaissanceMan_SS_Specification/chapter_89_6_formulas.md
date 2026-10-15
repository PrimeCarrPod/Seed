## 6. Formulas (Mass Budget Chapter)

### 6.1 System Mass Equation
$$M_{sys} = \sum_{i=1}^{12} \rho_{A,i} A_i + \sum_{j} \rho_{V,j} V_j + \sum_{k} m_{k,hardware} + m_{electronics}$$

### 6.2 Areal Density by Layer
$$\rho_{A,i} = \rho_{bulk,i} \times t_i \times \eta_{packing,i} \times \eta_{coverage,i}$$

Where $\eta_{coverage}$ = zone coverage fraction (1.0 for full, <1.0 for zone-selective)

### 6.3 Morphology Scaling (CSMFAB078-A Eq. 3.2.3)
$$\frac{M_e}{M_{ref}} = (1 + \alpha_e)^{1.8} \times \left[1 + \gamma \cdot \max(0, \alpha_e)\right]$$

With $\gamma = 0.35$ (girth penalty)

### 6.4 Component Mass Scaling
$$m_{e,comp} = m_{ref,comp} \times (1 + \alpha_e)^{\beta_{comp}}$$

$\beta_{comp}$ per Table in Chapter 86 §3.2

### 6.5 Center of Gravity
$$\vec{r}_{CoG} = \frac{\sum m_i \vec{r}_i}{\sum m_i}$$

### 6.6 CoG Shift from Movement
$$\Delta \vec{r}_{CoG}(t) = \frac{\sum m_i \Delta \vec{r}_i(t)}{M_{sys}}$$

Tile articulation: $\Delta \theta = \pm 12° \rightarrow \Delta z_{tile} \approx \pm 4$ mm

### 6.7 Stability Margin
$$\text{Margin} = 1 - \frac{|X_{CoG}|}{R_{BOS}}$$

### 6.8 Mass Fractions
$$\text{Ceramic Fraction} = \frac{M_{L2} + M_{L7}}{M_{sys}} = \frac{3.48 + 1.92}{13.73} = 39.3\%$$
$$\text{Textile Fraction} = \frac{M_{textiles}}{M_{sys}} = \frac{3.56}{13.73} = 25.9\%$$
$$\text{Chassis Fraction} = \frac{M_{L10}}{M_{sys}} = \frac{0.90}{13.73} = 6.6\%$$

---