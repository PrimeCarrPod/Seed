## 5. Alcega's Developable Surface Methods

### 5.1 Historical Context
Juan de Alcega's *Libro de Geometría, Practica y Traca* (1589) presents the first systematic treatise on garment pattern geometry. His methods for developing three-dimensional garment shapes from flat cloth prefigure modern differential geometry.

**Alcega's Geometric Constructions:**
```
$\text{Pattern Piece} = \text{Developable Surface} \cap \text{Body Surface}$
```
```
$\text{Seam Line} = \gamma(t) \text{ where } \kappa_n(\gamma) = 0$
```
```
$\text{Dart Angle} = \int_{\text{apex}}^{\text{base}} \kappa_g ds$
```



### 5.2 Cone Development
Conical surfaces (sleeves, skirts) develop isometrically to circular sectors:

```
$\text{Sector Angle: } \phi = 2\pi \frac{r_{\text{base}}}{r_{\text{slant}}} = 2\pi \sin(\alpha)$
```
```
$\text{Arc Length: } L = r_{\text{slant}} \cdot \phi$
```
```
$\text{Overlap: } \Delta = r_{\text{slant}} \cdot (2\pi - \phi)$
```



### 5.3 Cylinder Development
Cylindrical surfaces (torsos, limbs) develop to rectangles:

```
$\text{Width: } W = 2\pi r_{\text{body}}$
```
```
$\text{Height: } H = L_{\text{body}}$
```
```
$\text{Seam Allowance: } S = W \cdot \varepsilon_{\text{stretch}}$
```



### 5.4 Tangent Developable Surfaces
Tangent developables (draping over shoulders, bust) have rectifying developable rulings:

```
$\mathbf{r}(u,v) = \mathbf{c}(u) + v \mathbf{t}(u)$  where $\mathbf{t} = \mathbf{c}'/|\mathbf{c}'|$
```
```
$\text{Edge of Regression: } \mathbf{c}(u) \text{ (curve of regression)}$
```
```
$\text{Cuspidal Edge: } \mathbf{c}(u) + v_e(u) \mathbf{t}(u)$
```



### 5.5 Numerical Flattening Algorithm
For non-developable approximations (modern extension):

```
$\min_{\phi} \sum_{i} w_i \| \nabla \phi(\mathbf{p}_i) - \mathbf{I} \|^2_F$
```
```
$\text{s.t. } \phi(\mathbf{p}_i) = \mathbf{q}_i \text{ (boundary constraints)}$
```
```
$\text{Optimality: } \nabla^2 \phi = 0 \text{ (harmonic map)}$
```


