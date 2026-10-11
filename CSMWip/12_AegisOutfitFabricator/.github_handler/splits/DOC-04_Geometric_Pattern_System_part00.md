# DOC-04: Geometric Pattern System
## AegisOutfitFabricator Core Document 4

---

## 1. Developable Surface Engine (from DRAFT-01)

### 1.1 Convolute Surface Mathematics

**Historical Foundation** (Research Doc 1 §4.1; DRAFT-01 §2):
Juan de Alcega's 1589 *Libro de Geometría, Práctica y Traça* establishes pattern drafting as **developable surface construction** — surfaces of zero Gaussian curvature that can be flattened without distortion.

**Directrix Curve Definition** (DRAFT-01 §1.1; SYNTH-03 §1.1):
```
Body landmarks → parametric curves:
D₁(u) = (x₁(u), y₁(u), z₁(u))  u ∈ [0,1]  (e.g., center front)
D₂(u) = (x₂(u), y₂(u), z₂(u))  u ∈ [0,1]  (e.g., side seam)
D₃(u) = (x₃(u), y₃(u), z₃(u))  u ∈ [0,1]  (e.g., center back)

Landmarks: neck point, bust point, waist, hip, hem
Spline interpolation: cubic B-spline through landmarks
```

**Generatrix Ruling Construction** (DRAFT-01 §1.2; SYNTH-03 §1.2):
```
Developable surface: S(u,v) = D₁(u) + v · (D₂(u) - D₁(u)) / |D₂(u) - D₁(u)|
  u ∈ [0,1] = parameter along body length (directrix)
  v ∈ [0,1] = ruling parameter (generatrix)
  
Developable condition: Gaussian curvature K = 0
∂²S/∂u² · (∂S/∂u × ∂S/∂v) = 0  (tangent plane constant along ruling)
```

**Osculating Circle Tangent for Bodice Suppression** (DRAFT-01 §1.3; SYNTH-03 §1.3):
```
At waist level u_w, the suppression curve follows zero-curvature direction:
R(u_w) = |D''(u_w)| / |D'(u_w) × D''(u_w)|  (osculating circle radius)
Suppression depth d = R - √(R² - (w/2)²)
Where w = pattern piece width at waist
```

### 1.2 Coordinate Transformation Pipeline

**3D Body Scan → 2D Pattern Pieces** (DRAFT-01 §1.3):
