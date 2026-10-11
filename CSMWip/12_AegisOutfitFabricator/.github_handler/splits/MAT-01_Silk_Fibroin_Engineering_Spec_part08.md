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

## 5. Traceability Matrix — MAT-01

| Section | Source Document | Section/Line | Key Values |
