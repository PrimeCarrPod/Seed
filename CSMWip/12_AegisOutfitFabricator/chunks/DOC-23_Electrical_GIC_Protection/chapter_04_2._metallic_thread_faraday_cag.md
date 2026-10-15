## 2. Metallic Thread Faraday Cage — Layers 3 and 6

### 2.1 Metallic Thread Specification (MAT-01 §3.1, CSMFAB078 §4.4)

**Core Thread:**
```
Material: Bombyx mori silk fibroin (degummed, 12-15 denier)
Coating: Cu (electroless) → Ag (electrolytic, 2-5 μm)
Final diameter: 22-30 μm (core + coating)
Conductivity: σ ≥ 3.5×10⁷ S/m (Cu), ≥ 6.3×10⁷ S/m (Ag)
Tensile strength: ≥400 MPa (silk core retained)
Flex life: >50,000 cycles (MIT fold, ASTM D3822)
```

**Thread Variants by Layer:**

| Layer | Thread Type | Diameter | Coating | Pattern | Function |
|-------|-------------|----------|---------|---------|----------|
| 3 (Primary) | Cu/Ag silk | 25 μm | Ag 3μm | Hilbert curve FSS | 30 MHz-3 GHz bandstop |
| 6 (Backup) | Cu/Ag silk | 22 μm | Ag 2μm | Jerusalem cross FSS | 1-10 GHz bandstop |

### 2.2 Fractal Hilbert Curve FSS — Layer 3 (CSMFAB078-B §4.2)

**Geometry:**
```
Iteration: 4th order Hilbert curve (16 segments per unit cell)
Unit cell size: 12 mm × 12 mm (λ/8 @ 3 GHz)
Thread spacing: 0.8 mm (center-to-center)
Coverage ratio: 65% metallic thread
Embroidery density: 4.7 stitches/cm (Class 301 lockstitch)
```

**Frequency Response (Simulated CST Studio Suite):**
| Frequency | Bandstop Rejection | Insertion Loss (Passband) | SE (Shielding) |
|-----------|-------------------|---------------------------|----------------|
| 30 MHz | -2 dB | <0.1 dB | 40 dB |
| 100 MHz | -8 dB | <0.1 dB | 55 dB |
| 1 GHz | -25 dB | <0.3 dB | 85 dB |
| 3 GHz | -35 dB | <0.5 dB | 92 dB |
| 10 GHz | -15 dB | <1.0 dB | 75 dB |

**Equivalent Circuit Model:**
```
Hilbert unit cell → LC ladder network
L = μ₀ × l_eff / w = 4π×10⁻⁷ × 0.12 / 0.0008 = 1.88 μH
C = ε₀ε_r × A/d = 8.85×10⁻¹² × 3.5 × (0.012²) / 0.0008 = 5.6 pF
f_res = 1/(2π√(LC)) = 1/(2π√(1.88×10⁻⁶ × 5.6×10⁻¹²)) = 1.55 GHz
```

### 2.3 Jerusalem Cross FSS — Layer 6 (CSMFAB078-B §4.2)

**Geometry:**
```
Unit cell: 8 mm × 8 mm (λ/4 @ 10 GHz)
Cross arm: 6 mm length, 0.6 mm width
Gap: 1 mm between arms
Thread spacing: 0.6 mm
Coverage ratio: 58%
```

**Frequency Response:**
| Frequency | Bandstop Rejection | SE |
|-----------|-------------------|----|
| 1 GHz | -12 dB | 60 dB |
| 3 GHz | -28 dB | 88 dB |
| 5 GHz | -42 dB | 95 dB |
| 10 GHz | -38 dB | 90 dB |
| 18 GHz | -22 dB | 78 dB |

**Higher Iteration (Layer 6 adds 2nd iteration):**
```
2nd order Jerusalem cross → 4× density
Additional bandstops at 15, 22, 28 GHz (mmWave)
```

### 2.4 MXene Coating Enhancement (MAT-03 §2, CSMFAB078-B §4.1)

**MXene: Ti₃C₂Tₓ (T = -OH, -F, -O)**
```
Synthesis: HF etching Ti₃AlC₂ MAX phase → delamination → 1-5 layer flakes
Conductivity: 4,600 S/cm (film), 15,000 S/cm (aligned)
Application: Dip coating on metallic thread (post-embroidery)
Thickness: 50-100 nm conformal coating
```

**Benefits:**
- Corrosion protection for Ag/Cu thread
- Additional conductivity (parallel path)
- Mechanical lubrication (reduces thread wear)
- Chemical sensing capability (NO₂, NH₃ detection)

**Effective Conductivity Enhancement:**
```
σ_eff = σ_thread + σ_MXene × (A_MXene/A_thread)
A_MXene/A_thread ≈ 2πr_thread × t_MXene / (πr_thread²) = 2t_MXene/r_thread
= 2 × 75nm / 12.5μm = 0.012
σ_eff ≈ 3.5×10⁷ + 1.5×10⁷ × 0.012 ≈ 3.68×10⁷ S/m (5% gain)
```

---
