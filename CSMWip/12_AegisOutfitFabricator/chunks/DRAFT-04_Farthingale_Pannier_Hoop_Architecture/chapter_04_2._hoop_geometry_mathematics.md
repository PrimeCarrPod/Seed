## 2. Hoop Geometry Mathematics

### 2.1 Radius Progression
```
r₁ < r₂ < ... < r_n (ellipses, not circles)
Typical: 4-6 hoops, r_max ≈ 500-800mm (skirt hem)
Wall thickness: t ≈ 1-2mm spring steel wire (E ≈ 200 GPa)
```

### 2.2 Elliptical Hoop Equation
```
x²/a² + y²/b² = 1, a > b for front-fullness
```
Where:
- a = semi-major axis (front-back)
- b = semi-minor axis (side-side)
- Aspect ratio: a/b ≈ 1.5-2.0 (front fuller than sides)

### 2.3 Elliptical Moment of Inertia
```
I_major = π a b³ / 4  (bending about major axis)
I_minor = π a³ b / 4  (bending about minor axis)
I_polar = I_major + I_minor = π a b (a² + b²) / 4
```

### 2.4 Hoop Cross-Section Properties
**Thin-Walled Circular Approximation:**
```
I ≈ π r³ t
A = 2π r t
J = 2I = 2π r³ t (torsional constant)
```

**Rectangular Wire (Spring Steel):**
```
I = b h³ / 12  (b = width, h = height, h > b for vertical stiffness)
A = b × h
```

### 2.5 Hoop Stress Analysis
**Internal Pressure from Skirt Weight:**
```
P = W_skirt / (2π r h)  (distributed pressure)
σ_θ = P × r / t = W_skirt / (2π h t)
```
Where h = hoop height (vertical spacing between hoops).

**Buckling Criterion (Euler for Curved Beam):**
```
σ_cr = (π² E / (12(1-ν²))) × (t/r)²
SF = σ_cr / σ_θ > 2.0
```

### 2.6 Pannier-Specific Geometry
**Flattened Ellipse (Pannier Cross-Section):**
```
x²/a² + y²/b² = 1, a >> b
a ≈ 2-3 × b (extreme lateral)
```

**Hinge Mechanism for Doorway Passage:**
```
Hinge angle: φ_max = 90-120°
Hinge torque: T_hinge = k_hinge × φ
k_hinge = E I_hinge / L_hinge
```
