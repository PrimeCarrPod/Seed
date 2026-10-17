## 2. Dielectric Citadel Architecture

### 2.1 Structural Foundation
The electrical protection system utilizes a dielectric citadel concept where non-conductive structural elements prevent current flow while maintaining mechanical integrity:

```
[Exterior] MXene Ti₃C₂Tₓ Film (45nm)
          ↓
      BFRP/Elium® Chassis (variable)
          ↓
   MXene Ti₃C₂Tₓ Film (45nm)
          ↓
[Interior] PVDF-TrFE Sensor Mesh (50μm)
```

### 2.2 BFRP/Elium® Chassis Properties
Basalt fiber reinforced polymer with Elium thermoplastic resin provides dielectric strength and mechanical rigidity:

```
Fiber Content: 60% basalt fiber (SiO₂-Al₂O₃-CaO-MgO)
Resin: 40% Elium® (methyl methacrylate liquid thermoplastic polymer)
Tensile Strength: 800 MPa (longitudinal), 50 MPa (transverse)
Compressive Strength: 300 MPa
Flexural Modulus: 45 GPa
Density: 1800 kg/m³
Dielectric Strength: 15 kV/mm
Volume Resistivity: >10¹² Ω·m
Dielectric Constant: 4.2 (at 1 kHz)
Loss Tangent: 0.02 (at 1 kHz)
```

### 2.3 MXene Ti₃C₂Tₓ Films
Nanomaterial coatings provide EMI shielding while maintaining optical transparency and flexibility:

```
Composition: Ti₃C₂Tₓ (T = F, OH, O)
Thickness: 45±5 nm
Sheet Resistance: 50-100 Ω/sq
Shielding Effectiveness: 
  - 30 dB @ 100 kHz (absorption dominant)
  - 60 dB @ 1 GHz (reflection + absorption)
  - 80 dB @ 10 GHz (reflection dominant)
Optical Transparency: >85% (visible spectrum)
Flexibility: Bend radius ≥5mm without cracking
Adhesion: ZrO₂ primer (20nm) + silane coupling agent
```

### 2.4 Dielectric Citadel Functionality
The triple-layer MXene-BFRP-MXene structure creates a Faraday cage effect:

**Shielding Mechanism:**
```
Reflection Loss: R = 20 log₁₀((Z₀/4Z_s))  (for electric waves)
Absorption Loss: A = 20 log₁₀(e^(t/δ))    (where δ = skin depth)
Multiple Reflections: M = -20 log₁₀(1 - e^(-2t/δ))
Total SE: SE = R + A + M
```
With double MXene layers, SE increases by ~10-15 dB over single layer due to multiple reflections.

**GIC Attenuation:**
The dielectric chassis blocks quasi-DC current flow by breaking conductive paths:
- Chassis resistivity: >10¹² Ω·m
- Typical current path length: 0.5m
- Resistance introduced: >5×10¹¹ Ω
- GIC current reduction: >99.999% (for 10V induced potential)
