## 1. Historical Foundation (Research Doc 1 §4.1, Lines 51-52)

### 1.1 François-Alexandre de Garsault 1769: L'Art du Tailleur
Garsault's 1769 treatise introduced proportional measurement strips for dynamic scaling of patterns to individual anthropometrics. Key innovations:
- Scaled paper strips → algorithms for individual anthropometrics
- Proportional system replacing fixed-size patterns
- Foundation for modern grading systems

### 1.2 Proportional Measurement Strip System
**Physical Implementation (Historical):**
- Paper or parchment strips marked with proportional divisions
- Master strip = full-scale pattern
- Individual strips = scaled for specific client
- Transfer measurements via compass/dividers

**Algorithmic Translation:**
```
Measurement_i = Base_i × Scale_Factor
Scale_Factor = Target_Measurement / Base_Measurement
```

### 1.3 Garsault's Geometric Construction
**Proportional Compass Method:**
```
Given: Base measurement B_base, Target B_target
Construct: Circle with radius B_base
Mark: Point at distance B_target on radius
Ray: From center through mark intersects scaled pattern
Ratio: B_target / B_base = Scale_Factor
```

**Sector Scaling (for curved edges):**
```
r(θ) = r_base(θ) × Scale_Factor(θ)
Scale_Factor(θ) = 1 + (Target(θ) - Base(θ)) / Base(θ)
```
