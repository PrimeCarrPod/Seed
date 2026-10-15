## 7. Edition-Specific Formulas

### 7.1 Aerogel Thickness Scaling

$$t_{aero,SS} = t_{aero,TS} \times \left(1 + \alpha_e\right)^{0.5} = 3 \times 0.85^{0.5} = \textbf{2.0 mm}$$

### 7.2 Stack R-Value (RM-SS)

$$R_{SS} = \frac{0.002}{0.014} + \frac{0.0035}{0.3} + 0.03 = 0.143 + 0.012 + 0.03 = \textbf{0.185 m}^2\text{K/W}$$

### 7.3 Skin Temperature (Lumped Capacitance, 300s)

$$T_{skin}(t) = T_{ext} - (T_{ext} - T_0) \exp\left(-\frac{t}{\tau}\right) + \frac{M \times R_{total}}{A}$$

$$\tau = \rho c_p L_{eff} R_{total} = 1200 \times 1000 \times 0.005 \times 0.185 = 1110 \text{ s}$$

$$T_{skin}(300) = 1100 - 1075 \exp(-300/1110) + \frac{100 \times 0.185}{1.42} = \textbf{58°C}$$

### 7.4 PHS Allowable Exposure Time

$$t_{allow} = \frac{Q_{max} - Q_{initial}}{M \times (1 - \eta) - E_{max}}$$

RM-SS: $t_{allow} = \textbf{2.3 hours}$ (at 100 W metabolic, 50% RH, 25°C ambient)

---
