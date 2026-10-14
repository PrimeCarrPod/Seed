## 4. Metallic Thread Integration in Silk Matrix

### 4.1 Historical Gilded Thread (Research Doc 1 §2.2, Lines 19-21)
- Au-Hg amalgam on Ag substrate → thermal decomposition → AuHg intermetallic
- Interstitial diffusion of Hg, vacancy diffusion of Ag
- Micro-strip winding on silk core: tensile strength + reflectance

### 4.2 Cross-Sectional Mechanics
```
r_core = silk fibroin radius ≈ 5-10 μm
t_foil = AuHg foil thickness ≈ 0.5-1 μm
n_wraps = wraps per mm ≈ 50-100
```

**Volume Fractions:**
```
V_silk = π r_core² / (π (r_core + t_foil)²)
V_AuHg = 1 - V_silk ≈ 0.1-0.2
```

### 4.3 Composite Tensile Strength (Rule of Mixtures)
```
σ_composite = V_silk × σ_silk + V_AuHg × σ_AuHg
E_composite = V_silk × E_silk + V_AuHg × E_AuHg
```

Where V = volume fraction, σ_AuHg ≈ 200-300 MPa, E_AuHg ≈ 80-100 GPa

**Halpin-Tsai Model for Wrapped Geometry:**
```
E_composite = E_silk × (1 + ξηV_AuHg) / (1 - ηV_AuHg)
η = (E_AuHg/E_silk - 1) / (E_AuHg/E_silk + ξ)
ξ = 2 (aspect ratio for helical wraps)
```

### 4.4 Modern MXene-Coated Thread (CSMFAB078-B §7)
- Ti₃C₂Tₓ MXene: spray/dip coating on metallic threads
- Coating thickness: 1-5 μm, conductivity ~10⁴ S/m
- EMI shielding: 92 dB @ 1GHz per 45μm film → thread coating scaled

**EMI Shielding Effectiveness (Thread Coating):**
```
SE_thread = 20 log₁₀(σ_t × t / (2 ε₀ c))  (absorption dominant)
σ_t ≈ 10⁴ S/m (MXene conductivity)
t = 2 μm (coating thickness)
SE_thread ≈ 92 × (2/45) × 0.4 ≈ 3.3 dB per thread layer
```

### 4.5 Unified Faraday Cage Thread Specification
```
Thread Architecture:
[Silk Core] → [AuHg Gilded Foil] → [MXene Ti₃C₂Tₓ Coating] → [Beeswax/Cotton Sheath]

Properties:
- Tensile: >500 MPa (silk + AuHg composite)
- EMI SE: >60 dB @ 1GHz (MXene coating)
- Thermal: beeswax thermal sink + cotton sheath insulation
- Historical aesthetic: gold metallic appearance preserved
```

### 4.6 Brocade-Level EMI Shielding (SYNTH-02 Integration)
**Double-layer brocade (warp + weft coated):**
```
SE_brocade = SE_warp + SE_weft + SE_coupling
SE_warp ≈ 3.3 dB × N_warp × packing_factor
SE_weft ≈ 3.3 dB × N_weft × packing_factor
packing_factor ≈ 0.4 (thread volume fraction)
SE_brocade ≈ 15-25 dB per layer
```

**With Fractal FSS Embroidery (Layer 4 mapping):**
```
SE_total = SE_brocade + SE_FSS
SE_FSS ≈ 15-20 dB at target frequencies (1-10 GHz)
System target: >60 dB (Renaissance equivalent of AIMES 148-165 dB)
```
