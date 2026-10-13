
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

