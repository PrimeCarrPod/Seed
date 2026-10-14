## 2. Developable Surface Geometry (DRAFT-01 §3.1, DRAFT-02 §3.1)

### 2.1 Surface Type Definitions

**Convolute Surface (Alcega Figs. 12, 18, 20, 28, 42, 46, 54):**
$$S(u,v) = \mathbf{c}(u) + v \cdot \mathbf{r}(u) \quad \text{where } \mathbf{r}(u) \text{ is ruling vector}$$
$$\mathbf{c}(u) = \text{directrix curve (body contour)}$$
$$\mathbf{r}(u) = \frac{\partial \mathbf{c}}{\partial u} \times \mathbf{n}(u) \quad \text{(generatrix perpendicular to normal)}$$

**Developable Surface (Alcega Figs. 14, 44):**
$$K = 0 \quad \text{(Gaussian curvature zero everywhere)}$$
$$\text{Unfolds isometrically to plane without distortion}$$

**Cylindrical Surface (Alcega Fig. 30 - sleeves lower):**
$$S(u,v) = \mathbf{c}(u) + v \cdot \mathbf{e}_z \quad \mathbf{c}(u) = [R\cos u, R\sin u, 0]$$

**Flat Surface (Alcega Figs. 34, 48, 50, 52, 56):**
$$S(u,v) = \mathbf{p}_0 + u \mathbf{e}_1 + v \mathbf{e}_2 \quad \text{(trivial development)}$$

### 2.2 RM-TS Panel Surface Assignments

| Panel | Surface Type | Directrix | Generatrix | Unfolding Method |
|-------|--------------|-----------|------------|------------------|
| P01, P02 | Convolute | Front princess line | Horizontal ruling | DRAFT-01 Alg. 3.2 |
| P03 | Developable | Center back seam | Vertical ruling | DRAFT-01 Alg. 3.1 |
| P04, P05 | Convolute | Side front princess | Horizontal ruling | DRAFT-01 Alg. 3.2 |
| P06, P07 | Convolute | Side back princess | Horizontal ruling | DRAFT-01 Alg. 3.2 |
| P08, P09 | Convolute | Sleeve cap curve | Horizontal ruling | DRAFT-01 Alg. 3.3 |
| P10, P11 | Cylindrical | Arm circumference | Vertical ruling | Trivial (rectangle) |
| P12 | Flat | Neckline curve | N/A | Direct pattern |
| P13, P14 | Convolute | Hip curve | Horizontal ruling | DRAFT-01 Alg. 3.2 |
| P15 | Developable | Center back hip | Vertical ruling | DRAFT-01 Alg. 3.1 |
| P16, P17 | Convolute | Side hip curve | Horizontal ruling | DRAFT-01 Alg. 3.2 |
| P18, P19 | Flat | Diamond gusset | N/A | Direct pattern |
| P20, P21 | Flat | Center front | N/A | Direct pattern |
| P22, P23 | Flat | Hem vent | N/A | Direct pattern |
| P24, P25 | Convolute | Shoulder ridge | Radial ruling | DRAFT-01 Alg. 3.4 |
| P26, P27 | Flat | Pocket opening | N/A | Direct pattern |
| P28, P29 | Convolute | Mirror of P01, P02 | Horizontal ruling | Mirror unfold |
| P30 | Developable | Mirror of P03 | Vertical ruling | Mirror unfold |

---
