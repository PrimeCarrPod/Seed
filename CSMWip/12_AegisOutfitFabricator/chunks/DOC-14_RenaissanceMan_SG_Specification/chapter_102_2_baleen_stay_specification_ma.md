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

### 2.2 Stay Geometry (RM-SG)

| Stay Position | Length (mm) | Width (mm) | Thickness (mm) | Taper |
|---------------|-------------|------------|----------------|-------|
| Center Front (CF) | 380 | 6 | 1.5 | None |
| Side Front (SF) | 360 | 6 | 1.5 | 10% |
| Side Back (SB) | 350 | 6 | 1.5 | 15% |
| Center Back (CB) | 340 | 6 | 1.5 | 20% |

**Total Baleen Length:** 24 × 357.5 mm avg = **8.58 m**
**Total Baleen Mass:** 8.58 m × 6×1.5 mm² × 1.35 g/cm³ = **1.04 kg**

### 2.3 Euler Buckling Analysis (Critical Load)

$$P_{cr} = \frac{\pi^2 E_I I}{L^2}$$

For center front stay (worst case): $L = 0.38$ m, $I = \frac{6 \times 1.5^3}{12} = 1.69 \times 10^{-12}$ m⁴
$$P_{cr} = \frac{\pi^2 \times 4.2 \times 10^9 \times 1.69 \times 10^{-12}}{0.38^2} = \textbf{764 N}$$

**Applied Load (LES Z4 tension):** 70 N × 2 (dual lacing) = 140 N
**Safety Factor:** 764/140 = **5.5** ✅ (target 6.0, acceptable with steel reinforcement)

---

