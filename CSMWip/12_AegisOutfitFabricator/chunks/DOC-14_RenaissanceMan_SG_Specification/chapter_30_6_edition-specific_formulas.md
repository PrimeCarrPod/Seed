## 6. Edition-Specific Formulas

### 6.1 Dart Suppression Volume

$$V_{dart} = \frac{1}{3} \times A_{base} \times h_{dart} = \frac{1}{3} \times (2.8 \times 10.5) \times 4.1 = 39.1 \text{ cm}^3$$

### 6.2 Watteau Pleat Consumption (RM-SG)

$$W_{u,SG} = 3 \times W_{b,SG} = 3 \times 18.3 = 54.9 \text{ cm}$$
$$\text{Fabric consumed} = W_{u,SG} - W_{b,SG} = 36.6 \text{ cm}$$

### 6.3 Sleeve Cap Ease (Scaled)

$$E_{cap} = 0.08 \times C_{armscye} \times (1 + 1.5\alpha_e) = 0.08 \times 58 \times 1.12 = 5.2 \text{ cm}$$

### 6.4 Hose Inseam Curve (Cubic Spline)

$$y(x) = a_3x^3 + a_2x^2 + a_1x + a_0$$
Boundary conditions: $y(0)=0, y'(0)=0, y(L)=0, y'(L)=0$
RM-SG solution: $a_3 = -0.00015, a_2 = 0.0041, a_1 = -0.028, a_0 = 0$

---
