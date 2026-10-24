## 2. Aerogel Batting Specification (L5) — RM-SG (MAT-03 §3.4)

### 2.1 Material Properties

| Property | RM-SG Value | Test Standard |
|----------|-------------|---------------|
| **Material** | Silica aerogel, hydrophobic (TMCS) | — |
| **Density** | 0.012 g/cm³ (98% porosity) | ASTM D1667 |
| **Thickness** | **3 mm** (baseline, vs. 2 mm RM-SS) | — |
| **Thermal Conductivity (λ)** | **0.014 W/m·K** @ 25°C | ASTM C177 |
| **Thermal Conductivity @ 500°C** | 0.028 W/m·K | ASTM C177 |
| **Specific Heat (c_p)** | 1.0 kJ/kg·K | ASTM E1269 |
| **Max Use Temperature** | 650°C (continuous) | ASTM E1461 |
| **Hydrophobicity** | Contact angle >150° | ASTM D7334 |

### 2.2 Encapsulation System

- **Envelope:** Silk chiffon (CIETA Damask), 8 momme, 0.05 mm each side
- **Bonding:** MXene-epoxy perimeter seal (0.5 mm bead)
- **Venting:** Laser-microperforated (50 µm holes, 1 mm pitch) for moisture
- **Total Encapsulated Thickness:** 3.1 mm

### 2.3 R-Value Calculation (RM-SG)

$$R_{L5} = \frac{t}{\lambda} = \frac{0.003}{0.014} = \textbf{0.214 m}^2\text{K/W}$$

**Temperature Drop Across L5 (Steady State):**
$$\Delta T_{L5} = q \times R_{L5}$$

For $q = 50\ \text{kW/m}^2$ (1100°C radiative flux):
$$\Delta T_{L5} = 50,000 \times 0.214 = \textbf{10,700°C}$$ (theoretical, limited by radiation)

### 2.3 Comparison Across Editions

| Edition | Aerogel Thickness | R-Value | ΔT @ 50 kW/m² |
|---------|-------------------|---------|---------------|
| RM-SS | 2 mm | 0.143 | 7,150°C |
| **RM-SG** | **3 mm** | **0.214** | **10,700°C** |
| RM-TS | 3 mm | 0.214 | 10,700°C |
| RM-TG | 5 mm | 0.357 | 17,850°C |

### 2.4 Cross-References

- MAT-03 §3.4: Aerogel specification
- SYNTH-02 §2 Row 5: AIMES L5 thermal mapping
- DOC-06 §3.4: Thermal protection architecture
- Chapter 55: Thermal architecture overview
- Chapter 57: Full-stack thermal model
- Chapter 58: Thermal comfort & metabolic heat
- ASTM C177: Thermal conductivity
- NFPA 1971 §8.2: Heat transfer performance

---
