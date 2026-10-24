## 2. Developable Surface

**Surface Parametrization:**
```
$\mathbf{r}(u,v) = \mathbf{c}(u) + v \mathbf{d}(u)$  (Ruled surface)
```
```
$\mathbf{d}(u) \cdot \mathbf{c}'(u) = 0$  (Tangent developable condition)
```
```
$\mathbf{d}'(u) \times \mathbf{c}'(u) = 0$  (Cylinder/cone condition)
```

 Mathematics

### 2.1 Convolute Surfaces: Directrix Curves + Generatrix Ruling
A developable surface is a ruled surface with zero Gaussian curvature everywhere:

**Definition:** A surface S is developable iff K_G = 0 at all points, where K_G = det(II)/det(I) is Gaussian curvature.

**Ruled Surface Parametrization:**
```
S(u,v) = α(u) + v × β(u)
```
Where:
- α(u) = directrix curve (base curve in 3D space)
- β(u) = generatrix direction (ruling vector, unit length)
- v = parameter along ruling (0 ≤ v ≤ L(u))

**Developability Condition (Zero Gaussian Curvature):**
```
(α' × β) · β' = 0
```
This means the tangent plane is constant along each ruling.

### 2.2 Plane Moving in Space Tangent to Two Directrices
**Tangent Developable:** Surface formed by tangent lines to a space curve α(u):
```
S(u,v) = α(u) + v α'(u)
```

**Rectifying Developable:** Surface formed by rectifying planes:
```
S(u,v) = α(u) + v (α' × α'')
```

**Convolute Surface (General):** Envelope of 1-parameter family of planes:
```
n(u) · (x - p(u)) = 0
```
Where n(u) = plane normal, p(u) = point on plane.

### 2.3 Osculating Circle Tangent for Bodice Suppression Curves
For bodice waist suppression, the curve transitions from flat to curved. The osculating circle provides the tangent transition:

**Osculating Circle at Point P on Curve C:**
```
Radius: R = 1/κ = |r'|³ / |r' × r''|
Center: C = r + R × n
```
Where κ = curvature, n = principal normal.

**Suppression Curve Parametrization:**
```
r(u) = (x(u), y(u), 0)  for planar curve
κ(u) = |x'y'' - y'x''| / (x'² + y'²)^(3/2)
```

**Tangent Continuity (G¹) at Seam Junctions:**
```
r₁'(u_end) / |r₁'(u_end)| = r₂'(u_start) / |r₂'(u_start)|
```


