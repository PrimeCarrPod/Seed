## 2. Baleen Stay Specification (MAT-02 §3.1, SYNTH-01 §5.1)

### 2.1 Material Properties (Hydrated Keratin)

| Property | Value | Test Standard |
|----------|-------|---------------|
| **Longitudinal Modulus (E_L)** | 4.2 GPa | ISO 527-2 |
| **Transverse Modulus (E_T)** | 1.8 GPa | ISO 527-2 |
| **Shear Modulus (G_LT)** | 1.2 GPa | ISO 14129 |
| **Poisson's Ratio (ν_LT)** | 0.35 | ISO 527-2 |
| **Tensile Strength (σ_uts)** | 180 MPa | ISO 527-2 |
| **Compressive Strength** | 220 MPa | ISO 604 |
| **Thermoplastic Transition** | 60-80°C | DSC (ASTM E793) |
| **Density (hydrated)** | 1.35 g/cm³ | ASTM D792 |
| **Water Content (equilibrium)** | 22% | Karl Fischer |

### 2.2 Stay Geometry (RW-SG)

| Stay Position | Length (mm) | Width (mm) | Thickness (mm) | Taper |
|---------------|-------------|------------|----------------|-------|
| Center Front (CF) | 400 | 7 | 1.8 | None |
| Side Front (SF) | 380 | 7 | 1.8 | 10% |
| Side Back (SB) | 370 | 7 | 1.8 | 15% |
| Center Back (CB) | 360 | 7 | 1.8 | 20% |
| Skirt Support (SS) | 340 | 6 | 1.5 | 10% |

**Total Baleen Length:** 28 × 370 mm avg = **10.36 m**
**Total Baleen Mass:** 10.36 m × 7×1.8 mm² × 1.35 g/cm³ = **1.18 kg**

### 2.3 Euler Buckling Analysis (Critical Load)

$$P_{cr} = \frac{\pi^2 E_I I}{L^2}$$

For center front stay (worst case): $L = 0.40$ m, $I = \frac{7 \times 1.8^3}{12} = 3.40 \times 10^{-12}$ m⁴
$$P_{cr} = \frac{\pi^2 \times 4.2 \times 10^9 \times 3.40 \times 10^{-12}}{0.40^2} = \textbf{878 N}$$

**Applied Load (LES Z4 tension):** 62 N × 2 (dual lacing) = 124 N
**Safety Factor:** 878/124 = **7.1** ✅

---
