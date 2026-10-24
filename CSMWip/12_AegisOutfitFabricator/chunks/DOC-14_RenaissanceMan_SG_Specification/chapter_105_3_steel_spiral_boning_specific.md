## 3. Steel Spiral Boning Specification (MAT-02 §4, DOC-05 §3.3)

### 3.1 Material Properties

| Property | Value | Test Standard | Notes |
|----------|-------|---------------|-------|
| **Material** | Spring steel (17-7 PH, Condition CH900) | — | High strength, corrosion resistant |
| **Young's Modulus (E)** | 200 GPa | ASTM E111 | — |
| **Shear Modulus (G)** | 79 GPa | Calculated | G = E/2(1+ν) |
| **Yield Strength** | 1200 MPa | ASTM A370 | 0.2% offset |
| **Ultimate Tensile** | 1350 MPa | ASTM A370 | — |
| **Fatigue Limit** | 550 MPa (10⁷ cycles) | ASTM E466 | R=0.1 |
| **Density** | 7.8 g/cm³ | — | — |
| **Corrosion** | Passivated, ASTM A967 | — | Medical grade |

### 3.2 RM-SG Spiral Boning Geometry

| Boning ID | Location | Length | Wire Ø | Coil OD | Coils | Function |
|-----------|----------|--------|--------|---------|-------|----------|
| SB-SC-L/R | Sleeve Cap | 180 mm | 4 mm | 8 mm | 12 | Arm articulation |
| SB-Waist-L/R | Waistband | 200 mm | 4 mm | 8 mm | 14 | Waist support |
| SB-Knee-L/R | Knee Gusset | 140 mm | 4 mm | 8 mm | 10 | Knee hinge |

**Total:** 12 pieces (4 per sleeve cap + 2 waist + 2 knee)

### 3.3 Spiral Stiffness Analysis

**Axial Stiffness (Helical Spring):**
$$k = \frac{G d^4}{8 D^3 N_{coils}}$$

Where d = wire diameter, D = coil mean diameter, N = active coils.

For sleeve cap (d=4 mm, D=8 mm, N=12, G=79 GPa):
$$k = \frac{79 \times 10^9 \times (4 \times 10^{-3})^4}{8 \times (8 \times 10^{-3})^3 \times 12} = \textbf{18.5 N/mm}$$

**Operating Deflection:** 12 mm (arm raise) → Force = 222 N

**Bending Stiffness (2D Flexure):**
$$EI_{bend} = \frac{E \pi d^4}{64} = \frac{200 \times 10^9 \times \pi \times (4 \times 10^{-3})^4}{64} = \textbf{2.51 \times 10^{-3} N·m²}$$

Allows 2D curvature in sleeve cap channel while resisting axial compression.

### 3.4 Channel Integration

- **Channel Width:** 10 mm (allows 8 mm coil + 1 mm clearance each side)
- **Stitching:** ISO 301, 18 SPI, silk core-spun thread
- **End Caps:** MAX phase aglets (Ti₃AlC₂) prevent wire protrusion
- **Lubrication:** PTFE coating on wire (reduces channel friction 40%)

### 3.5 Cross-References

- MAT-02 §4: Steel spiral boning specification
- DOC-05 §3.3: Structural framework boning
- Research Doc 2 §3.4: Core-spun thread mechanics
- CSMFAB078-A §3.3: LES zone tensions (Z2, Z5, Z7, Z10)

---
