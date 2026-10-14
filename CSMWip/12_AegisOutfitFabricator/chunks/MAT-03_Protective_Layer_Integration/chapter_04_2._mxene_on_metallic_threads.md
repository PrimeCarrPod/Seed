## 2. MXene on Metallic Threads

### 2.1 MXene Synthesis (CSMFAB078 §6 Step 6)
```
Ti₃AlC₂ (MAX Phase, $45/kg in-house) 
    → LiF/HCl etch 35°C/24h 
    → delamination (intercalation + sonication)
    → Ti₃C₂Tₓ flakes (T = -OH, -F, -O)
    → spray/dip coating → 45μm film @ $65/kg
```

**Etch Kinetics:**
```
Ti₃AlC₂ + 3 LiF + 3 HCl → 3 LiCl + AlF₃ + 2 Ti + C
Rate: d[Al]/dt = k_etch × [LiF]^a × [HCl]^b
k_etch ≈ 10⁻⁶ m/s at 35°C [TBD:RESEARCH]
```

### 2.2 Thread Coating Process
**Dip Coating:**
```
Thread speed: v = 0.5-2 m/s
MXene dispersion: 5-10 mg/mL in water/ethanol
Dip cycles: 3-5 passes
Dry: 80°C, 2 min between passes
Final thickness: 1-5 μm on thread
```

**Coating Thickness Control (Landau-Levich):**
```
t = 0.94 × (η v / γ)^(2/3) × (η / ρ g)^(1/6)
η = viscosity, γ = surface tension, ρ = density
```

**Spray Coating (for woven fabric):**
- Electrostatic spray: 20-50 kV, pattern width 100-300 mm
- Deposition efficiency: 60-80%
- Post-cure: 150°C, 10 min (remove residual water)

### 2.3 Coating Adhesion & Flexibility Retention
**Adhesion Mechanisms:**
- Hydrogen bonding: Ti₃C₂Tₓ -OH/-F groups ↔ cotton/silk -OH groups
- Mechanical interlocking: MXene flakes penetrate fiber interstices
- Covalent: silane coupling agents (APTES, GPTMS) [TBD:RESEARCH]

**Flexibility Retention Test (ASTM D4966 Martindale):**
- Uncoated thread: 50,000 cycles to failure
- MXene-coated (1μm): 40,000 cycles (80% retention)
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
