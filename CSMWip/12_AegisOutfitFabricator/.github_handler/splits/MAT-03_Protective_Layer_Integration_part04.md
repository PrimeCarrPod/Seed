- MXene-coated (5μm): 20,000 cycles (40% retention)
- Target: ≥2μm coating, ≥60% flexibility retention

**Adhesion Energy (Work of Adhesion):**
```
W_ad = γ_MXene + γ_fiber - γ_interface
γ_MXene ≈ 45 mJ/m², γ_silk ≈ 40 mJ/m²
W_ad ≈ 60-80 mJ/m² (target > 50 mJ/m²)
```

### 2.4 EMI Shielding Effectiveness
**Per Layer (CSMFAB078 §2):**
- 45μm film: 92 dB @ 1GHz (absorption-dominant)
- Thread coating (2μm): SE_thread ≈ 92 × (2/45) × packing_factor
- Packing factor in weave: ~0.3-0.5 (thread volume fraction)
- SE_effective ≈ 12-20 dB per thread layer

**Faraday Cage in Brocade (SYNTH-02 Mapping):**
- Metallic thread brocade: warp/weft both coated
- Double layer (warp + weft): 24-40 dB
- With fractal FSS embroidery (Layer 4): +15-20 dB at target frequencies
- System target: >60 dB (Renaissance equivalent of AIMES 148-165 dB)

**Total Shielding Effectiveness:**
```
SE_total = SE_reflection + SE_absorption + SE_multiple
SE_R = 20 log₁₀(σ/(4πfε₀))
SE_A = 20 log₁₀(exp(t/δ))
δ = √(2/ωμσ)  (skin depth)
```
