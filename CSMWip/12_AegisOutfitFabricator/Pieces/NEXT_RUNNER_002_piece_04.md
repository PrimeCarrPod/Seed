## 🔬 MAT-01: SILK FIBROIN ENGINEERING SPECIFICATION — TEMPLATE (CONTINUED)

### 1.6 Metallic Thread Integration in Silk Matrix

**Historical Gilded Thread (Research Doc 1 §2.2, Lines 19-21):**
- Au-Hg amalgam on Ag substrate → thermal decomposition → AuHg intermetallic
- Interstitial diffusion of Hg, vacancy diffusion of Ag
- Micro-strip winding on silk core: tensile strength + reflectance

**Cross-Sectional Mechanics:**
```
r_core = silk fibroin radius ≈ 5-10 μm
t_foil = AuHg foil thickness ≈ 0.5-1 μm
n_wraps = wraps per mm ≈ 50-100
```

**Composite Tensile Strength (Rule of Mixtures):**
```
σ_composite = V_silk × σ_silk + V_AuHg × σ_AuHg
E_composite = V_silk × E_silk + V_AuHg × E_AuHg
```

Where V = volume fraction, σ_AuHg ≈ 200-300 MPa, E_AuHg ≈ 80-100 GPa

**Modern MXene-Coated Thread (CSMFAB078-B §7):**
- Ti₃C₂Tₓ MXene: spray/dip coating on metallic threads
- Coating thickness: 1-5 μm, conductivity ~10⁴ S/m
- EMI shielding: 92 dB @ 1GHz per 45μm film → thread coating scaled

**Unified Faraday Cage Thread Specification:**
```
Thread Architecture:
[Silk Core] → [AuHg Gilded Foil] → [MXene Ti₃C₂Tₓ Coating] → [Beeswax/Cotton Sheath]

Properties:
- Tensile: >500 MPa (silk + AuHg composite)
- EMI SE: >60 dB @ 1GHz (MXene coating)
- Thermal: beeswax thermal sink + cotton sheath insulation
- Historical aesthetic: gold metallic appearance preserved
```

### 1.7 Traceability Matrix — MAT-01

| Section | Source Document | Section/Line | Key Values |
|---------|----------------|--------------|------------|
| 1.1 Stress-Strain | Research Doc 1 | §2.1, Lines 12-16 | E=8-12 GPa, σ_uts=500-700 MPa, ε_break=15-25% |
| 1.2 Strain-Rate | Research Doc 1 | §2.1, Line 16 | σ_y = f(ε_p), C≈0.05-0.08 [TBD] |
| 1.3 UV Aging | Research Doc 1 | §2.1, Line 16 | 96% sericin removal → UV vulnerability |
| 1.3 Humidity | Research Doc 1 | §2.1, Line 13 | 11% moisture regain at 65% RH |
| 1.4 Constitutive | Research Doc 2 | §5, Lines 97-102 | W=W(I₁,I₂,I₄,I₆), Yeoh/Holzapfel |
| 1.5 Core-Spun | Research Doc 2 | §3.3, Lines 55-58 | PET 65%, cotton 38mm staple, Z→S twist |
| 1.5 Thermal | Research Doc 2 | §4, Lines 78-93 | β=0.958, k=0.15 W/mK, ΔT∝1/(ρck) |
| 1.6 Historical Gilded | Research Doc 1 | §2.2, Lines 19-21 | Au-Hg/Ag, AuHg intermetallic |
| 1.6 Modern MXene | CSMFAB078-B | §7, Line 113 | Ti₃AlC₂ → LiF/HCl → 45μm film @ $65/kg |

**Standards Referenced:**
- ASTM D3822 (Tensile Properties of Single Textile Fibers)
- ISO 5079 (Determination of Breaking Force and Elongation)
- ASTM D1776 (Conditioning Textiles for Testing)
- CIETA Vocabulary (Textile Structure Definitions)
- NIJ STD-0101.06 (Ballistic Resistance - for composite context)