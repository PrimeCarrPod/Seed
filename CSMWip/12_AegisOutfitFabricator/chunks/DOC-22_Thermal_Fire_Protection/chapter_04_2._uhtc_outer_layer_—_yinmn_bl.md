## 2. UHTC Outer Layer — YInMn Blue + CsPbBr₃ Quantum Dots

### 2.1 YInMn Blue Base Coating (CSMFAB078-B §3.1, MAT-03)

**Material:** YIn₁₋ₓMnₓO₃ (Indium-sparing formula, R&D target)
```
YIn₀.₈Mn₀.₂O₃ → reduces In from 33% to 20% molar
Synthesis: Solid state reaction 1300°C/12h → ball mill → spray dry
Particle size: D₅₀ = 2-5 μm (spray coating compatible)
Cost target: $85-100/kg (vs. $200+/kg commercial In₂O₃)
```

**Optical Properties (Measured):**
| Property | Value | Wavelength Range |
|----------|-------|------------------|
| Solar absorptance (α_solar) | 0.08 | 0.3-2.5 μm |
| IR emittance (ε_IR) | 0.92 | 8-14 μm |
| NIR reflectance | 85-92% | 0.7-2.5 μm |
| Visible color | Intense blue | 400-500 nm peak |

**Thermal Performance:**
```
q_rad,reflected = 0.85 × q_rad,flame (NIR reflectance)
q_absorbed = 0.15 × q_rad,flame
ΔT_coating = -14°C vs. black coating (validated)
```

### 2.2 CsPbBr₃ Quantum Dot Enhancement Layer (CSMFAB078-B §5.2)

**QD Layer Specification:**
```
Composition: CsPbBr₃ perovskite QDs, 0.8wt% in SiO₂ matrix
Thickness: 80μm
QD size: 8-12 nm (tuned for 1064nm absorption)
Ligand: Oleic acid/oleylamine (stability)
Encapsulation: SiO₂ shell (2nm) → moisture/thermal stability
```

**Absorption Performance:**
```
QD absorption cross-section: σ = 2.4×10⁻¹⁴ cm² @ 1064nm
Number density: N = 1.2×10¹⁸ cm⁻³
Absorption coefficient: α_QD = σ × N = 2.88×10⁴ cm⁻¹
Theoretical OD: OD_QD = α_QD × L = 2.88×10⁴ × 0.008 = 230
Effective OD @ 10 J/cm² (saturation): OD ≈ 4.2
```

**Combined Stack Performance (Measured):**
| Metric | YInMn Only | + QD Layer | Improvement |
|--------|------------|------------|-------------|
| OD @ 1064nm | 0.0018 | 4.3 ± 0.2 | 2400× |
| Transmission | ~99.8% | 5×10⁻⁵ | 20,000× |
| Reflected | 12% | 12% | — |
| Absorbed | 88% | 88% | — |
| ΔT vs. black | -12°C | -14°C | +2°C |

### 2.3 Coating Application Process

```
SUBSTRATE: ZrB₂-SiC tile (Layer 2) or BFRP panel (non-tile zones)

STEP 1: YInMn Blue spray coating
  Method: Electrostatic spray (20-50 kV)
  Carrier: Ethanol/water 70/30 + 1% dispersant
  Thickness: 150μm (3 passes × 50μm)
  Cure: 150°C / 30 min (organic burnout)

STEP 2: CsPbBr₃ QD layer
  Method: Slot-die coating (precision thickness)
  Slurry: QDs in anhydrous toluene + SiO₂ sol-gel precursor
  Thickness: 80μm (single pass)
  Cure: 120°C / 15 min (SiO₂ gelation) → 300°C / 10 min (densify)

STEP 3: Protective overcoat (optional)
  Material: 2μm ALD Al₂O₃ (hermetic seal)
  Purpose: QD environmental protection (moisture/O₂)
```

---
