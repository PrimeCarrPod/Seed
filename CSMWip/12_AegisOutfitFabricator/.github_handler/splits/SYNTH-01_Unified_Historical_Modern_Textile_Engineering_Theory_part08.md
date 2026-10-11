C = F^T · F
```

**Strain Energy Density Function (Orthotropic):**
```
W = W(I₁, I₂, I₄, I₆)
```
Where invariants for orthotropic materials:
- I₁ = tr(C)
- I₂ = ½[(tr C)² - tr(C²)]
- I₄ = a₀ · C a₀ (warp direction)
- I₆ = b₀ · C b₀ (weft direction)

**Yeoh Model (Orthotropic Adaptation):**
```
W = C₁₀(I₁ - 3) + C₂₀(I₁ - 3)² + C₃₀(I₁ - 3)³
    + (1/D₁)(J - 1)²
    + Σ Cᵢⱼ(I₄ - 1)ⁱ(I₆ - 1)ʲ
```

**2nd Piola-Kirchhoff Stress:**
```
S = 2 × ∂W/∂C + p × C⁻¹
```

## 9. Thread Material Science: Historical to Modern

From Research Doc 2 §3 (Lines 38–62):

| Material | Tenacity | Thermal Limit | Historical Analog |
|----------|----------|---------------|-------------------|
