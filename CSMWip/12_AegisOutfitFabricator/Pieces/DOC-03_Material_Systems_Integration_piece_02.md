
I₁ = tr(C), I₄ = a₀·Ca₀ (warp), I₆ = b₀·Cb₀ (weft)
C₁₀ = 0.15 MPa, C₂₀ = 0.02 MPa, C₃₀ = 0.005 MPa [TBD:RESEARCH]
D₁ = 0.01 MPa⁻¹ (near-incompressible)
```

### 1.3 Metallic Thread Integration

**Historical Gilded Thread** (Research Doc 1 §2.2, Lines 19-21):
```
Au-Hg amalgam on Ag substrate → thermal decomposition → AuHg intermetallic
Interstitial diffusion of Hg, vacancy diffusion of Ag
Micro-strip winding on silk core: tensile strength + reflectance
```

**Composite Cross-Section Mechanics** (MAT-01 §1.6):
```
r_core = silk fibroin radius ≈ 5-10 μm
t_foil = AuHg foil thickness ≈ 0.5-1 μm
n_wraps = wraps per mm ≈ 50-100

σ_composite = V_silk × σ_silk + V_AuHg × σ_AuHg
E_composite = V_silk × E_silk + V_AuHg × E_AuHg

σ_AuHg ≈ 200-300 MPa, E_AuHg ≈ 80-100 GPa
V_silk ≈ 0.6-0.7, V_AuHg ≈ 0.3-0.4
```

**Modern MXene-Coated Thread** (CSMFAB078-B §7; MAT-03 §2):
```
Ti₃C₂Tₓ MXene: spray/dip coating on metallic threads
Coating thickness: 1-5 μm, conductivity ~10⁴ S/m
EMI shielding: 92 dB @ 1GHz per 45μm film → thread coating scaled
SE_thread ≈ 92 × (t_coating/45μm) × packing_factor
Packing factor in weave: ~0.3-0.5
SE_effective ≈ 12-20 dB per thread layer
```

**Unified Faraday Cage Thread Specification** (MAT-01 §1.6):
```
Thread Architecture:
[Silk Core] → [AuHg Gilded Foil] → [MXene Ti₃C₂Tₓ Coating] → [Beeswax/Cotton Sheath]

Properties:
- Tensile: >500 MPa (silk + AuHg composite)
- EMI SE: >60 dB @ 1GHz (MXene coating + brocade geometry)
- Thermal: beeswax thermal sink + cotton sheath insulation
- Historical aesthetic: gold metallic appearance preserved
```

