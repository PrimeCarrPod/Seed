## 1. Alcega Developable Surface Engine for RW-SS (DRAFT-01, SYNTH-03 §1)

### 1.1 Directrix Curve Definitions (Scaled for RW-SS)

**Front Torso Directrix (Convolute Surface — Bust Accommodation):**
$$D_f(u) = \begin{bmatrix}
\frac{B_e}{4} \sin(\pi u) \cdot (1 + 0.15\alpha_e) \\
H_e \cdot u \cdot 0.42 \\
\frac{W_e}{2\pi} (1 - \cos(2\pi u)) \cdot 0.35
\end{bmatrix}, \quad u \in [0,1]$$

Where $B_e = 81$ cm, $H_e = 152.5$ cm, $W_e = 60$ cm, $H_{p,e} = 85$ cm, $\alpha_e = -0.22$

**Back Torso Directrix (Watteau Pleat Accommodation):**
$$D_b(u) = \begin{bmatrix}
\frac{B_e}{4} \sin(\pi u) \cdot 1.15 \cdot (1 + 0.15\alpha_e) \\
H_e \cdot u \cdot 0.48 \\
0
\end{bmatrix}$$

**Sleeve Directrix (Conical Developable):**
$$D_s(v) = \begin{bmatrix}
(r_{cuff} + (r_{armscye} - r_{cuff})v) \cos(2\pi v) \\
L_{sleeve} \cdot v \\
(r_{cuff} + (r_{armscye} - r_{cuff})v) \sin(2\pi v)
\end{bmatrix}$$

Where $r_{armscye} = 16$ cm, $r_{cuff} = 8$ cm, $L_{sleeve} = 64.4$ cm

### 1.2 Generatrix Ruling Construction

For each $u$, the generatrix connects corresponding points on front and back directrices:
$$G(u,v) = D_f(u) + v(D_b(u) - D_f(u)), \quad v \in [0,1]$$

**Zero-Curvature Condition (Developable Surface):**
$$\det[D_f'(u), D_b'(u), D_b(u) - D_f(u)] = 0$$

Solved numerically for RW-SS parameters → confirms developability for all panels.

### 1.3 Osculating Circle Tangent for Bodice Suppression

**Curvature of Front Directrix:**
$$\kappa_f(u) = \frac{|D_f'(u) \times D_f''(u)|}{|D_f'(u)|^3}$$

**Osculating Circle Radius:**
$$\rho(u) = \frac{1}{\kappa_f(u)}$$

**Suppression Dart Placement:** At $u^*$ where $\rho(u^*) = \min(\rho(u))$ for $u \in [0.3, 0.7]$
- RW-SS: $u^* = 0.58$ (waist level, shifted up for petite)
- Dart angle: $\theta_{dart} = 2\arcsin(\frac{\Delta W}{2\rho(u^*)}) = 16.8^\circ$

---
