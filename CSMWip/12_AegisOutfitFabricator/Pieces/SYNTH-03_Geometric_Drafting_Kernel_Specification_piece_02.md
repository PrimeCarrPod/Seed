```
D₁(u) = (x₁(u), y₁(u), z₁(u))  -- Front bodice directrix
D₂(u) = (x₂(u), y₂(u), z₂(u))  -- Back bodice directrix

Where each is a cubic B-spline through landmarks:
D(u) = Σᵢ Nᵢ,₃(u) · Pᵢ  (N = basis functions, P = control points)
```

### 1.3 Generatrix Ruling Construction

**Developable Surface Generation:**
```
A plane moving in space, tangent to two directrix curves, generates a developable surface.
The segment determined by the points of tangency constitutes the generatrix.

S(u,v) = D₁(u) + v × (D₂(u) - D₁(u)) / |D₂(u) - D₁(u)|
Where v ∈ [0, 1] parameterizes along the ruling.
```

**Gaussian Curvature Constraint (Zero for Developable):**
```
K = det(II) / det(I) = 0
Where I = first fundamental form, II = second fundamental form
This requires: (Sᵤ × Sᵥ) · Sᵤᵥ = 0
```

### 1.4 Osculating Circle Tangent Calculation (Bodice Suppression)

For extreme bodily suppression (corsetry), the zero-curvature direction gives the bodice panel boundaries:

