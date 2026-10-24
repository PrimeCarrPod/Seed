## 2. Cartridge Pleating — Skirt Waist Attachment (DRAFT-03 §3.2-3.3, SYNTH-03 §4)

### 2.1 S-Curve Fold Geometry (RW-TS)

Cartridge pleats use **figure-eight (S-curve) folds** perpendicular to waistband.

**Parametric S-Curve:**
$$\begin{cases}
x(t) = A \sin(\omega t) \\
y(t) = B t \\
z(t) = C \sin(2\omega t)
\end{cases}, \quad t \in [0, N_{pleats}]$$

Where:
- $A$ = pleat depth/2 = 1.7 cm (RW-TS)
- $B$ = pleat spacing = 1.4 cm
- $C$ = lateral offset = 0.25 cm
- $\omega = \pi$
- $N_{pleats}$ = 25 (RW-TS skirt waist)

### 2.2 RW-TS Cartridge Pleat Specifications

| Parameter | RW-TS | RW-TG | RW-SS |
|-----------|-------|-------|-------|
| **Waist Circumference** | 73 cm | 100 cm | 68 cm |
| **Pleat Count** | 25 | 35 | 20 |
| **Pleat Depth** | 1.7 cm | 2.5 cm | 1.5 cm |
| **Pleat Spacing** | 1.4 cm | 1.8 cm | 1.2 cm |
| **Fabric Consumption Ratio** | 3:1 | 3:1 | 3:1 |
| **Unpleated Width** | 219 cm | 300 cm | 204 cm |

### 2.3 Stress Diffusion at Waistband

$$\sigma_{waist} = \frac{F_{total}}{N_{pleats} \times A_{anchor}} = \frac{55 \text{ N}}{25 \times 12 \text{ mm}^2} = \textbf{0.18 MPa}$$

**Silk Matrix Protection:** Stress < 0.5 MPa (silk yield) ✅

---

