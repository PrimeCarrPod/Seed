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
