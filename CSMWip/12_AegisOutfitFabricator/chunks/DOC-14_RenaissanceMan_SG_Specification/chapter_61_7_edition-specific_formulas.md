## 7. Edition-Specific Formulas

### 7.1 Aerogel Thickness Scaling

$$t_{aero,SG} = t_{aero,SS} \times \left(1 + 1.5\alpha_e\right) = 2 \times 1.12 = \textbf{3.0 mm}$$

### 7.2 Stack R-Value (RM-SG)

$$R_{SG} = \frac{0.003}{0.014} + \frac{0.0035}{0.3} + 0.03 = 0.214 + 0.012 + 0.03 = \textbf{0.256 m}^2\text{K/W}$$

### 7.3 Skin Temperature (Lumped Capacitance, 300s)

$$T_{skin}(t) = T_{ext} - (T_{ext} - T_0) \exp\left(-\frac{t}{\tau}\right) + \frac{M \times R_{total}}{A}$$

$$\tau = \rho c_p L_{eff} R_{total} = 1200 \times 1000 \times 0.005 \times 0.256 = 1536 \text{ s}$$

$$T_{skin}(300) = 1100 - 1075 \exp(-300/1536) + \frac{100 \times 0.256}{1.58} = \textbf{52°C}$$

### 7.4 PHS Allowable Exposure Time

$$t_{allow} = \frac{Q_{max} - Q_{initial}}{M \times (1 - \eta) - E_{max}}$$

RM-SG: $t_{allow} = \textbf{3.5 hours}$ (at 100 W metabolic, 50% RH, 25°C ambient)

---
