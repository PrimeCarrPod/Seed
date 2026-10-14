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
