## 5. Edition-Specific Formulas

### 5.1 Tile Count Optimization

$$N_{tiles,L2} = \left\lceil \frac{A_{coverage} \times \eta_{pack}}{A_{tile}} \right\rceil = \left\lceil \frac{1.78 \times 0.85}{0.0016} \right\rceil = 140$$

$$N_{tiles,L7} = \left\lceil \frac{1.78 \times 0.85}{0.0004} \right\rceil = 380$$

### 5.2 Stack Mass Summation

$$M_{stack} = \sum_{i=1}^{12} \rho_i \times t_i \times A_{coverage} \times \eta_{cover,i} = 11.71 \text{ kg}$$

Where $\eta_{cover,i}$ = coverage fraction (1.0 for full, 0.85 for skirt-partial L5).

### 5.3 Combined EMI Shielding Effectiveness

$$SE_{total} = SE_{L3} + SE_{L6} + 20\log_{10}(1 + \frac{Z_0}{2Z_s}) = 35 + 35 + 3.5 = 63.5 \text{ dB}$$

Where $Z_0$ = 377 Ω (free space), $Z_s$ = surface impedance of MXene layer.

### 5.4 Thermal Resistance Stack

$$R_{total} = \sum \frac{t_i}{\lambda_i} = \frac{0.005}{0.014} + \frac{0.004}{1.2} + \dots = 0.357 \text{ m}^2\text{K/W} \text{ (aerogel dominant)}$$

---
