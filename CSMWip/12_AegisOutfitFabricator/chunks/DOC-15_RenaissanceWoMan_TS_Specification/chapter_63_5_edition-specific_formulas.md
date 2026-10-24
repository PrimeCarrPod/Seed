## 5. Edition-Specific Formulas

### 5.1 Tile Count Optimization

$$N_{tiles,L2} = \left\lceil \frac{A_{coverage} \times \eta_{pack}}{A_{tile}} \right\rceil = \left\lceil \frac{1.55 \times 0.85}{0.000625} \right\rceil = 160$$

$$N_{tiles,L7} = \left\lceil \frac{1.55 \times 0.85}{0.000225} \right\rceil = 300$$

### 5.2 Stack Mass Summation

$$M_{stack} = \sum_{i=1}^{12} \rho_i \times t_i \times A_{coverage} \times \eta_{cover,i} = 9.17 \text{ kg}$$

Where $\eta_{cover,i}$ = coverage fraction (1.0 for full, 0.7 for zone-selective L8).

### 5.3 Combined EMI Shielding Effectiveness

$$SE_{total} = SE_{L3} + SE_{L6} + 20\log_{10}(1 + \frac{Z_0}{2Z_s}) = 32 + 32 + 4.5 = 68.5 \text{ dB (theoretical)}$$

Measured: **60 dB** @ 1 GHz

### 5.4 Thermal Resistance Stack

$$R_{total} = \sum \frac{t_i}{\lambda_i} = \frac{0.003}{0.014} + \frac{0.0035}{0.3} + \dots = 0.214 \text{ m}^2\text{K/W} \text{ (aerogel dominant)}$$

---

