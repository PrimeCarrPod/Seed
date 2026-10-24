## 4. Cage Crinoline Hoop Architecture

### 4.1 Hoop Geometry (Research Doc 1 §5.3, Lines 77-78)
- Concentric steel hoops suspended by vertical cotton tapes
- Moment of inertia: I = πr³t (thin-walled cylinder approximation)
- Hoop stress: σ_θ = P × r / t (from internal pressure P)

**Hoop Geometry:**
- Radius progression: r₁ < r₂ < ... < r_n (ellipses, not circles)
- Typical: 4-6 hoops, r_max ≈ 500-800 mm (skirt hem)
- Wall thickness: t ≈ 1-2 mm spring steel wire

**Elliptical Hoop Equation:**
```
x²/a² + y²/b² = 1, a > b for front-fullness
```

**Elliptical Moment of Inertia:**
```
I_ellipse = π a b³ / 4  (bending about minor axis)
I_ellipse = π a³ b / 4  (bending about major axis)
```

### 4.2 Tape Suspension (Catenary)
```
y(x) = a cosh(x/a)  where a = H / w
H = horizontal tension, w = weight per unit length
```

**Tension Distribution:**
- Vertical tapes: N tapes sharing total skirt weight W
- Tension per tape: T = W / N (ideal, equal sharing)
- Actual: T_i varies with hoop angle, friction at waistband

**Catenary Parameter:**
```
a = H / (ρ_tape × g × A_tape)
Sag at midspan: δ = a (cosh(L/2a) - 1)
```

### 4.3 Volumetric Efficiency
```
Volume enclosed: V ≈ Σ π r_i² × h_i (hoop height segments)
Mass: M ≈ Σ 2π r_i × t × ρ_steel × h_i
Ratio V/M maximized by large r, thin t → buckling constraint
```

**Buckling Constraint for Hoops:**
```
σ_cr = (π² E / (12(1-ν²))) × (t/r)²
σ_θ = P r / t < σ_cr / SF
SF = 2.0 (safety factor)
```

### 4.4 Dynamic Deployment Kinematics
**Spring Energy Storage:**
```
U = ½ k θ² per hoop (torsional spring)
k = G J / L  (torsional stiffness)
J = π r³ t  (torsional constant for thin ring)
```

**Deployment Equation of Motion:**
```
I θ̈ + c θ̇ + k θ = 0
θ(0) = θ_collapsed, θ̇(0) = 0
Target: θ(5s) ≈ θ_expanded
```

