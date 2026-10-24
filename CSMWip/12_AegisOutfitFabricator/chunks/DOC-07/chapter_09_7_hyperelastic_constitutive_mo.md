## 7. Hyperelastic Constitutive Modeling (SYNTH-01 §8)

### 7.1 Finite Strain Framework (Research Doc 2 §5)

```
Deformation gradient: F = ∂x/∂X
Right Cauchy-Green tensor: C = F^T · F
Invariants for orthotropic materials:
  I₁ = tr(C)
  I₂ = ½[(tr C)² - tr(C²)]
  I₄ = a₀ · C a₀ (warp/fiber direction)
  I₆ = b₀ · C b₀ (weft/cross-fiber direction)
  a₀, b₀ = unit vectors in reference configuration
```

### 7.2 Strain Energy Density Function (Yeoh Orthotropic)

```
W = C₁₀(I₁ - 3) + C₂₀(I₁ - 3)² + C₃₀(I₁ - 3)³
    + (1/D₁)(J - 1)²
    + Σ Cᵢⱼ(I₄ - 1)ⁱ(I₆ - 1)ʲ  (fiber reinforcement terms)

Material parameters (silk brocatelle):
C₁₀ = 0.8-1.2 MPa, C₂₀ = 0.1-0.3 MPa, C₃₀ = 0.01-0.05 MPa
D₁ = 0.001-0.01 MPa⁻¹ (near-incompressible)
Cᵢⱼ fitted to biaxial test data
```

**Yeoh Orthotropic Strain Energy:**
```
$W = C_{10}(I_1 - 3) + C_{20}(I_1 - 3)^2 + C_{30}(I_1 - 3)^3 + \frac{1}{D_1}(J - 1)^2 + \sum C_{ij}(I_4 - 1)^i(I_6 - 1)^j$
```
```
$S = 2 \frac{\partial W}{\partial C} + p C^{-1}$  (2nd Piola-Kirchhoff stress)
```
```
\sigma = \frac{1}{J} F \cdot S \cdot F^T$  (Cauchy stress)
```

### 7.3 Second Piola-Kirchhoff Stress

```
S = 2 × ∂W/∂C + p × C⁻¹
Cauchy stress: σ = (1/J) × F · S · F^T
```
