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

### 2.2 Stay Geometry (RW-TG)

| Stay Position | Length (mm) | Width (mm) | Thickness (mm) | Taper |
|---------------|-------------|------------|----------------|-------|
| Center Front (CF) | 440 | 8 | 2.0 | None |
| Side Front (SF) | 420 | 8 | 2.0 | 10% |
| Side Back (SB) | 410 | 8 | 2.0 | 15% |
| Center Back (CB) | 400 | 8 | 2.0 | 20% |
| Skirt Support (SS) | 380 | 6 | 1.5 | 10% |

**Total Baleen Length:** 30 × 410 mm avg = **12.3 m**
**Total Baleen Mass:** 12.3 m × 8×2 mm² × 1.35 g/cm³ = **1.33 kg**

### 2.3 Euler Buckling Analysis (Critical Load)

$$P_{cr} = \frac{\pi^2 E_I I}{L^2}$$

For center front stay (worst case): $L = 0.44$ m, $I = \frac{8 \times 2^3}{12} = 5.33 \times 10^{-12}$ m⁴
$$P_{cr} = \frac{\pi^2 \times 4.2 \times 10^9 \times 5.33 \times 10^{-12}}{0.44^2} = \textbf{1,086 N}$$

**Applied Load (LES Z4 tension):** 70 N × 2 (dual lacing) = 140 N
**Safety Factor:** 1086/140 = **7.8** ✅

---
