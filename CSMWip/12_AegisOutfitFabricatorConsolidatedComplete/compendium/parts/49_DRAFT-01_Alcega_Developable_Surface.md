# DRAFT-01: Alcega Developable Surface

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

 Engine



## AegisOutfitFabricator Geometric Drafting System Document 1




## 1. Historical Foundation (Research Doc 1 §4.1, Lines 45-51)

### 1.1 Juan de Alcega 1589: Libro de Geometría, Práctica y Traça
Juan de Alcega's 1589 treatise established the first systematic approach to zero-waste pattern drafting for rectangular loom widths. Key principles:
- Standard silk loom width: 22 inches (560mm) for 18th C silks
- Absolute minimization of fabric waste through geometric nesting
- Developable surface mapping from 3D body to 2D pattern pieces

### 1.2 Zero-Waste Algorithms for Rectangular Loom Widths
Alcega's method uses the constraint that all pattern pieces must fit within a 560mm width, with length determined by nested arrangement. This directly maps to the modern nesting optimization problem.


## 1. Historical Foundation (Research Doc 1 §4.1, Lines 45-51)

### 1.1 Juan de Alcega 1589: Libro de Geometría, Práctica y Traça
Juan de Alcega's 1589 treatise established the first systematic approach to zero-waste pattern drafting for rectangular loom widths. Key principles:
- Standard silk loom width: 22 inches (560mm) for 18th C silks
- Absolute minimization of fabric waste through geometric nesting
- Developable surface mapping from 3D body to 2D pattern pieces

### 1.2 Zero-Waste Algorithms for Rectangular Loom Widths
Alcega's method uses the constraint that all pattern pieces must fit within a 560mm width, with length determined by nested arrangement. This directly maps to the modern nesting optimization problem.



## 1. Historical Foundation (Research Doc 1 §4.1, Lines 45-51)

### 1.1 Juan de Alcega 1589: Libro de Geometría, Práctica y Traça
Juan de Alcega's 1589 treatise established the first systematic approach to zero-waste pattern drafting for rectangular loom widths. Key principles:
- Standard silk loom width: 22 inches (560mm) for 18th C silks
- Absolute minimization of fabric waste through geometric nesting
- Developable surface mapping from 3D body to 2D pattern pieces

### 1.2 Zero-Waste Algorithms for Rectangular Loom Widths
Alcega's method uses the constraint that all pattern pieces must fit within a 560mm width, with length determined by nested arrangement. This directly maps to the modern nesting optimization problem.




## 2. Developable Surface Mathematics

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



## 2. Developable Surface Mathematics

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



## 3. Coordinate Transformation Pipeline

### 3.1 3D Body Scan → 2D Pattern Pieces via Developable Mapping
**Pipeline Stages:**
1. **Anthropometric Landmark Extraction:** 50+ key points from 3D scan
2. **Directrix Curve Extraction:** Fit B-splines through landmarks
3. **Generatrix Distribution:** Compute rulings for seam placement
4. **Unfolding Algorithm:** Isometric mapping P(3D) → p(2D)

**Landmark Set (Research Doc 1 §4.1):**
```
L = {nsp, ss, bp, wp, hp, nw, sh, ah, el, wr, nk, bk, ...}
nsp = nape of neck (spinal), ss = sternal notch, bp = bust point
wp = waist point, hp = hip point, nw = neck width
sh = shoulder point, ah = armhole, el = elbow, wr = wrist
nk = neck, bk = back width
```

### 3.2 Directrix Curve Extraction from Anthropometric Landmarks
**B-spline Fitting (Cubic, C² continuity):**
```
α(u) = Σ N_i,3(u) P_i
```
Where N_i,3 = cubic B-spline basis functions, P_i = control points from landmarks.

**Directrix Types:**
- **Silhouette Directrix:** Side seam, center front, center back
- **Structure Directrix:** Waistline, bustline, hipline
- **Transition Directrix:** Armhole, neckline, shoulder slope

### 3.3 Generatrix Distribution for Seam Placement
**Seam Lines as Rulings:**
```
β(u) = ∂S/∂v = (S(u, v_max) - S(u, 0)) / L(u)
```

**Seam Allowance Offset:**
```
S_offset(u,v) = S(u,v) + s × n(u,v)
s = 13mm (Ssa-1 default)
n = surface normal = (α' × β) / |α' × β|
```

### 3.4 Unfolding Algorithm: P(3D) → p(2D) with Metric Preservation
**Isometric Mapping (Developable Unfolding):**
For a developable surface, the first fundamental form is preserved:
```
I_3D = E du² + 2F du dv + G dv²
I_2D = du² + dv²  (after unfolding)
```

**Unfolding via Geodesic Polar Coordinates:**
```
p(u,v) = ( ∫₀ᵛ √G(u,0) dv', ∫₀ᵘ √E(u',0) du' )
```
For developable surfaces: √(EG - F²) = √G(u,0) (metric preservation)

**Discrete Unfolding (Triangle Mesh):**
```
For each triangle: preserve edge lengths
Angle defect at vertices: Σ θ_i = 2π - K_G × A ≈ 2π
```


## 3. Coordinate Transformation Pipeline

### 3.1 3D Body Scan → 2D Pattern Pieces via Developable Mapping
**Pipeline Stages:**
1. **Anthropometric Landmark Extraction:** 50+ key points from 3D scan
2. **Directrix Curve Extraction:** Fit B-splines through landmarks
3. **Generatrix Distribution:** Compute rulings for seam placement
4. **Unfolding Algorithm:** Isometric mapping P(3D) → p(2D)

**Landmark Set (Research Doc 1 §4.1):**
```
L = {nsp, ss, bp, wp, hp, nw, sh, ah, el, wr, nk, bk, ...}
nsp = nape of neck (spinal), ss = sternal notch, bp = bust point
wp = waist point, hp = hip point, nw = neck width
sh = shoulder point, ah = armhole, el = elbow, wr = wrist
nk = neck, bk = back width
```

### 3.2 Directrix Curve Extraction from Anthropometric Landmarks
**B-spline Fitting (Cubic, C² continuity):**
```
α(u) = Σ N_i,3(u) P_i
```
Where N_i,3 = cubic B-spline basis functions, P_i = control points from landmarks.

**Directrix Types:**
- **Silhouette Directrix:** Side seam, center front, center back
- **Structure Directrix:** Waistline, bustline, hipline
- **Transition Directrix:** Armhole, neckline, shoulder slope

### 3.3 Generatrix Distribution for Seam Placement
**Seam Lines as Rulings:**
```
β(u) = ∂S/∂v = (S(u, v_max) - S(u, 0)) / L(u)
```

**Seam Allowance Offset:**
```
S_offset(u,v) = S(u,v) + s × n(u,v)
s = 13mm (Ssa-1 default)
n = surface normal = (α' × β) / |α' × β|
```

### 3.4 Unfolding Algorithm: P(3D) → p(2D) with Metric Preservation
**Isometric Mapping (Developable Unfolding):**
For a developable surface, the first fundamental form is preserved:
```
I_3D = E du² + 2F du dv + G dv²
I_2D = du² + dv²  (after unfolding)
```

**Unfolding via Geodesic Polar Coordinates:**
```
p(u,v) = ( ∫₀ᵛ √G(u,0) dv', ∫₀ᵘ √E(u',0) du' )
```
For developable surfaces: √(EG - F²) = √G(u,0) (metric preservation)

**Discrete Unfolding (Triangle Mesh):**
```
For each triangle: preserve edge lengths
Angle defect at vertices: Σ θ_i = 2π - K_G × A ≈ 2π
```




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




## 3. Coordinate Transformation Pipeline

### 3.1 3D Body Scan → 2D Pattern Pieces via Developable Mapping
**Pipeline Stages:**
1. **Anthropometric Landmark Extraction:** 50+ key points from 3D scan
2. **Directrix Curve Extraction:** Fit B-splines through landmarks
3. **Generatrix Distribution:** Compute rulings for seam placement
4. **Unfolding Algorithm:** Isometric mapping P(3D) → p(2D)

**Landmark Set (Research Doc 1 §4.1):**
```
L = {nsp, ss, bp, wp, hp, nw, sh, ah, el, wr, nk, bk, ...}
nsp = nape of neck (spinal), ss = sternal notch, bp = bust point
wp = waist point, hp = hip point, nw = neck width
sh = shoulder point, ah = armhole, el = elbow, wr = wrist
nk = neck, bk = back width
```

### 3.2 Directrix Curve Extraction from Anthropometric Landmarks
**B-spline Fitting (Cubic, C² continuity):**
```
α(u) = Σ N_i,3(u) P_i
```
Where N_i,3 = cubic B-spline basis functions, P_i = control points from landmarks.

**Directrix Types:**
- **Silhouette Directrix:** Side seam, center front, center back
- **Structure Directrix:** Waistline, bustline, hipline
- **Transition Directrix:** Armhole, neckline, shoulder slope

### 3.3 Generatrix Distribution for Seam Placement
**Seam Lines as Rulings:**
```
β(u) = ∂S/∂v = (S(u, v_max) - S(u, 0)) / L(u)
```

**Seam Allowance Offset:**
```
S_offset(u,v) = S(u,v) + s × n(u,v)
s = 13mm (Ssa-1 default)
n = surface normal = (α' × β) / |α' × β|
```

### 3.4 Unfolding Algorithm: P(3D) → p(2D) with Metric Preservation
**Isometric Mapping (Developable Unfolding):**
For a developable surface, the first fundamental form is preserved:
```
I_3D = E du² + 2F du dv + G dv²
I_2D = du² + dv²  (after unfolding)
```

**Unfolding via Geodesic Polar Coordinates:**
```
p(u,v) = ( ∫₀ᵛ √G(u,0) dv', ∫₀ᵘ √E(u',0) du' )
```
For developable surfaces: √(EG - F²) = √G(u,0) (metric preservation)

**Discrete Unfolding (Triangle Mesh):**
```
For each triangle: preserve edge lengths
Angle defect at vertices: Σ θ_i = 2π - K_G × A ≈ 2π
```



## 3. Coordinate Transformation Pipeline

### 3.1 3D Body Scan → 2D Pattern Pieces via Developable Mapping
**Pipeline Stages:**
1. **Anthropometric Landmark Extraction:** 50+ key points from 3D scan
2. **Directrix Curve Extraction:** Fit B-splines through landmarks
3. **Generatrix Distribution:** Compute rulings for seam placement
4. **Unfolding Algorithm:** Isometric mapping P(3D) → p(2D)

**Landmark Set (Research Doc 1 §4.1):**
```
L = {nsp, ss, bp, wp, hp, nw, sh, ah, el, wr, nk, bk, ...}
nsp = nape of neck (spinal), ss = sternal notch, bp = bust point
wp = waist point, hp = hip point, nw = neck width
sh = shoulder point, ah = armhole, el = elbow, wr = wrist
nk = neck, bk = back width
```

### 3.2 Directrix Curve Extraction from Anthropometric Landmarks
**B-spline Fitting (Cubic, C² continuity):**
```
α(u) = Σ N_i,3(u) P_i
```
Where N_i,3 = cubic B-spline basis functions, P_i = control points from landmarks.

**Directrix Types:**
- **Silhouette Directrix:** Side seam, center front, center back
- **Structure Directrix:** Waistline, bustline, hipline
- **Transition Directrix:** Armhole, neckline, shoulder slope

### 3.3 Generatrix Distribution for Seam Placement
**Seam Lines as Rulings:**
```
β(u) = ∂S/∂v = (S(u, v_max) - S(u, 0)) / L(u)
```

**Seam Allowance Offset:**
```
S_offset(u,v) = S(u,v) + s × n(u,v)
s = 13mm (Ssa-1 default)
n = surface normal = (α' × β) / |α' × β|
```

### 3.4 Unfolding Algorithm: P(3D) → p(2D) with Metric Preservation
**Isometric Mapping (Developable Unfolding):**
For a developable surface, the first fundamental form is preserved:
```
I_3D = E du² + 2F du dv + G dv²
I_2D = du² + dv²  (after unfolding)
```

**Unfolding via Geodesic Polar Coordinates:**
```
p(u,v) = ( ∫₀ᵛ √G(u,0) dv', ∫₀ᵘ √E(u',0) du' )
```
For developable surfaces: √(EG - F²) = √G(u,0) (metric preservation)

**Discrete Unfolding (Triangle Mesh):**
```
For each triangle: preserve edge lengths
Angle defect at vertices: Σ θ_i = 2π - K_G × A ≈ 2π
```







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




## 6. Computational Implementation

### 6.1 Discrete Differential Geometry
Using triangle meshes for garment panels:

```
$K_v = 2\pi - \sum_{j} \theta_{vj}$  (Angle defect at vertex v)
```
```
$H_v = \frac{1}{4A_v} \sum_{j} (\cot \alpha_{ij} + \cot \beta_{ij}) (\mathbf{v}_j - \mathbf{v}_i)$
```
```
$\text{Discrete Gaussian Curvature: } K_d = \frac{K_v}{A_v}$
```



### 6.2 Cone Splitting Algorithm
For flattening non-developable regions:

```
$\text{Split along: } \nabla K \cdot \mathbf{n} = 0$
```
```
$\text{Cut graph: } \mathcal{C} = \arg\min_{\mathcal{C}} \sum_{e \in \mathcal{C}} w_e $
```
```
$\text{Boundary parametrization: } \phi: \partial \Omega \to \partial \tilde{\Omega}$
```




## 7. Validation and Testing

### 7.1 Historical Accuracy Metrics
```
$\text{Pattern Match: } \text{IoU}(\text{Alcega}, \text{Computed}) \ge 0.95$
```
```
$\text{Seam Length Error: } \frac{|L_{\text{hist}} - L_{\text{comp}}|}{L_{\text{hist}}} < 0.02$
```
```
$\text{Dart Placement: } \| \mathbf{p}_{\text{hist}} - \mathbf{p}_{\text{comp}} \| < 5 \text{ mm}$
```



### 7.2 Modern Validation
```
$\text{Drape Simulation: } \text{FEM} \text{ with } E=10 \text{ GPa}, \nu=0.35$
```
```
$\text{Wrinkle Amplitude: } A_{\text{wrinkle}} < 2 \text{ mm}$
```
```
$\text{Strain Energy: } U = \frac{1}{2} \int \boldsymbol{\sigma} : \boldsymbol{\varepsilon} dV$
```




## 8. Traceability Matrix — DRAFT-01

| Section | Source | Key Values |
|---------|--------|------------|
| 1.1 Historical Context | Alcega 1589 | Libro de Geometría |
| 2.1 Cone Development | Research Doc 1 §4.1 | $\phi = 2\pi \sin(\alpha)$ |
| 2.2 Cylinder Development | Research Doc 1 §4.2 | $W = 2\pi r$ |
| 3.1 Tangent Developable | SYNTH-03 §3 | $\mathbf{r}(u,v) = \mathbf{c}(u) + v\mathbf{t}(u)$ |
| 4.1 Numerical Flattening | SYNTH-03 §5 | Harmonic map |
| 5.1 Cone Splitting | Research Doc 2 §7 | $\nabla K$ cut graph |
| 6.1 Discrete DG | SYNTH-03 §6 | Angle defect |
| 7.1 Historical Accuracy | Alcega 1589 | IoU $\ge 0.95$ |
| 7.2 Modern Validation | MAT-01 §5 | FEM strain energy |
