## 5. Edition-Specific Formulas

### 5.1 Tile Count Optimization

$$N_{tiles,L2} = \left\lceil \frac{A_{coverage} \times \eta_{pack}}{A_{tile}} \right\rceil = \left\lceil \frac{1.42 \times 0.85}{0.0004} \right\rceil = 150$$

$$N_{tiles,L7} = \left\lceil \frac{1.42 \times 0.85}{0.000225} \right\rceil = 280$$

### 5.2 Stack Mass Summation

$$M_{stack} = \sum_{i=1}^{12} \rho_i \times t_i \times A_{coverage} \times \eta_{cover,i} = 7.99 \text{ kg}$$

Where $\eta_{cover,i}$ = coverage fraction (1.0 for full, 0.65 for zone-selective L8).

### 5.3 Combined EMI Shielding Effectiveness

$$SE_{total} = SE_{L3} + SE_{L6} + 20\log_{10}(1 + \frac{Z_0}{2Z_s}) = 32 + 32 + 4.5 = 58.5 \text{ dB}$$

Where $Z_0$ = 377 Ω (free space), $Z_s$ = surface impedance of MXene layer.

### 5.4 Thermal Resistance Stack

$$R_{total} = \sum \frac{t_i}{\lambda_i} = \frac{0.002}{0.014} + \frac{0.003}{1.2} + \dots = 0.143 \text{ m}^2\text{K/W} \text{ (aerogel dominant)}$$

---
