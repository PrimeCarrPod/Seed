## 6. Edition-Specific Formulas

### 6.1 Dart Suppression Volume

$$V_{dart} = \frac{1}{3} \times A_{base} \times h_{dart} = \frac{1}{3} \times (2.1 \times 8.5) \times 3.2 = 19.0 \text{ cm}^3$$

### 6.2 Watteau Pleat Consumption (RM-SS)

$$L_{unpleated} = 3 \times W_{back,finished} = 3 \times 15.5 = 46.5 \text{ cm}$$
$$\text{Fabric consumed} = L_{unpleated} - W_{back,finished} = 31.0 \text{ cm}$$

### 6.3 Sleeve Cap Ease (Scaled)

$$E_{cap} = 0.08 \times C_{armscye} \times (1 + \alpha_e) = 0.08 \times 47 \times 0.85 = 3.2 \text{ cm}$$

### 6.4 Hose Inseam Curve (Cubic Spline)

$$y(x) = a_3x^3 + a_2x^2 + a_1x + a_0$$
Boundary conditions: $y(0)=0, y'(0)=0, y(L)=0, y'(L)=0$
RM-SS solution: $a_3 = -0.00012, a_2 = 0.0034, a_1 = -0.021, a_0 = 0$

---

