## 5. Metallic Thread Engineering (SYNTH-01 §5, MAT-01 §1.6)

### 5.1 Historical Gilded Thread (Research Doc 1 §2.2)

```
Manufacturing: Au-Hg amalgam on Ag substrate
Process:
  1. Au-Hg amalgam coated onto silver substrate
  2. Thermal decomposition: Hg driven off at controlled temperature
  3. Intermetallic AuHg compound formation
  4. Cross-section: Interstitial Hg diffusion + vacancy Ag diffusion
  5. Micro-strip cutting and helical winding on silk core

Composite Properties (Rule of Mixtures):
σ_composite = V_silk × σ_silk + V_AuHg × σ_AuHg
E_composite = V_silk × E_silk + V_AuHg × E_AuHg
σ_AuHg ≈ 200-300 MPa, E_AuHg ≈ 80-100 GPa

Geometry:
r_core = 5-10 μm (silk fibroin radius)
t_foil = 0.5-1 μm (AuHg foil thickness)
n_wraps = 50-100 wraps/mm
```

### 5.2 Modern MXene-Coated Thread (MAT-03 §2, CSMFAB078-B §7)

```
Base thread: Historical gilded thread (above)
MXene coating: Ti₃C₂Tₓ via dip/spray coating
Coating process:
  - MXene dispersion: 5-10 mg/mL in water/ethanol
  - Dip coating: 0.5-2 m/s, 3-5 passes
  - Dry: 80°C, 2 min between passes
  - Post-cure: 150°C, 10 min
  - H-bonding: Ti₃C₂Tₓ -OH/-F ↔ silk -OH groups
  - Mechanical interlocking: MXene flakes penetrate fiber interstices

Final Architecture:
[Silk Core] → [AuHg Gilded Foil] → [MXene Ti₃C₂Tₓ (2μm)] → [Beeswax/Cotton Sheath]

Properties:
- Tensile: >500 MPa
- EMI SE: 12-20 dB per thread layer @ 1GHz
- Thermal: Beeswax sink + cotton sheath insulation
- Aesthetic: Gold metallic appearance preserved
```

### 5.3 Unified Faraday Cage Thread Specification

```
Thread Architecture:
[Silk Core] → [AuHg Gilded Foil] → [MXene Ti₃C₂Tₓ] → [Beeswax/Cotton Sheath]

System Integration:
- Warp threads (MXene-coated): SE_warp ≈ 15 dB
- Weft threads (MXene-coated): SE_weft ≈ 15 dB
- Double layer (warp + weft): SE_total ≈ 30 dB
- Fractal FSS embroidery: +15-20 dB at bandstop frequencies
- System SE: 45-50 dB (Renaissance equivalent)
```
