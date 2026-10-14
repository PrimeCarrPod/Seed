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

### 2.2 Stay Geometry (RW-TS)

| Stay Position | Length (mm) | Width (mm) | Thickness (mm) | Taper |
|---------------|-------------|------------|----------------|-------|
| Center Front (CF) | 420 | 6 | 1.5 | None |
| Side Front (SF) | 400 | 6 | 1.5 | 10% |
| Side Back (SB) | 390 | 6 | 1.5 | 15% |
| Center Back (CB) | 380 | 6 | 1.5 | 20% |

**Total Baleen Length:** 24 × 397.5 mm avg = **9.54 m**
**Total Baleen Mass:** 9.54 m × 6×1.5 mm² × 1.35 g/cm³ = **1.16 kg**

### 2.3 Euler Buckling Analysis

$$P_{cr} = \frac{\pi^2 E_I I}{L^2} = \frac{\pi^2 \times 4.2 \times 10^9 \times 1.69 \times 10^{-12}}{0.42^2} = \textbf{630 N}$$

**Applied Load (LES Z3 tension):** 60 N × 2 = 120 N
**Safety Factor:** 630/120 = **5.3** ✅

---
