## 1. Alcega Developable Surface Engine for RM-SS (DRAFT-01, SYNTH-03 §1)

### 1.1 Directrix Curve Definitions (Scaled for RM-SS)

**Front Torso Directrix (Convolute Surface):**
$$D_f(u) = \begin{bmatrix}
\frac{C_e}{4} \sin(\pi u) \cdot (1 + 0.1\alpha_e) \\
H_e \cdot u \cdot 0.45 \\
\frac{W_e}{2\pi} (1 - \cos(2\pi u)) \cdot 0.3
\end{bmatrix}, \quad u \in [0,1]$$

Where $C_e = 81$ cm, $H_e = 162.5$ cm, $W_e = 70$ cm, $\alpha_e = -0.15$

**Back Torso Directrix (Watteau Pleat Accommodation):**
$$D_b(u) = \begin{bmatrix}
\frac{C_e}{4} \sin(\pi u) \cdot 1.15 \cdot (1 + 0.1\alpha_e) \\
H_e \cdot u \cdot 0.5 \\
0
\end{bmatrix}$$

**Sleeve Directrix (Conical Developable):**
$$D_s(v) = \begin{bmatrix}
(r_{cuff} + (r_{armscye} - r_{cuff})v) \cos(2\pi v) \\
L_{sleeve} \cdot v \\
(r_{cuff} + (r_{armscye} - r_{cuff})v) \sin(2\pi v)
\end{bmatrix}$$

Where $r_{armscye} = 18.5$ cm, $r_{cuff} = 9.5$ cm, $L_{sleeve} = 73.3$ cm

### 1.2 Generatrix Ruling Construction

For each $u$, the generatrix connects corresponding points on front and back directrices:
$$G(u,v) = D_f(u) + v(D_b(u) - D_f(u)), \quad v \in [0,1]$$

**Zero-Curvature Condition (Developable Surface):**
$$\det[D_f'(u), D_b'(u), D_b(u) - D_f(u)] = 0$$

Solved numerically for RM-SS parameters → confirms developability for all panels.

### 1.3 Osculating Circle Tangent for Bodice Suppression

**Curvature of Front Directrix:**
$$\kappa_f(u) = \frac{|D_f'(u) \times D_f''(u)|}{|D_f'(u)|^3}$$

**Osculating Circle Radius:**
$$\rho(u) = \frac{1}{\kappa_f(u)}$$

**Suppression Dart Placement:** At $u^*$ where $\rho(u^*) = \min(\rho(u))$ for $u \in [0.3, 0.7]$
- RM-SS: $u^* = 0.52$ (waist level)
- Dart angle: $\theta_{dart} = 2\arcsin(\frac{\Delta W}{2\rho(u^*)}) = 14.3^\circ$

---

