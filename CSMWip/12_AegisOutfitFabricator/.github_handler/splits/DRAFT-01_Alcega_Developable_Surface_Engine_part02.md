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
