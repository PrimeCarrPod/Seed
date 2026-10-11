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
