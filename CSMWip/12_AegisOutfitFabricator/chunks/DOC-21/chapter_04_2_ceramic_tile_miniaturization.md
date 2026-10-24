## 2. Ceramic Tile Miniaturization — From AIMES to Renaissance

### 2.1 AIMES Baseline (CSMFAB078 §4 Layer 2, 7; §6 Step 4-5)

The Aegis Iron Man (AIMES-DSV) baseline establishes the reference ceramic specification:

```
AIMES CERAMIC TILE (150×150×10 mm):
  Composition: ZrB₂ (70%) + SiC (30%) + PVB (6%) + DBP (3%)
  Process: Doctor blade 250μm → 12-24 ply lamination (0°/90°) → isostatic press 200MPa/70°C
  Flash sintering: 300 V/cm DC → 1580°C flash onset → 8-15s densification → 96.9% density
  Properties: Hv 22-23 GPa, flexural 590 MPa, grain size 2.1μm
```

**Flash Sintering Kinetics (CSMFAB078-B):**
```
Power density: P = J × E = σ × E²
σ = σ₀ exp(-Eₐ/kT)  (conductivity)
Energy input: Q = ∫ P dt
Density evolution: ρ/ρ₀ = 1 - exp(-k × Q)
```

### 2.2 Renaissance Scale: 25-50mm Decorative Elements

**Geometric Scaling Laws:**
```
Scale factor: s = 25/150 = 1/6  to  50/150 = 1/3
Volume scaling: V_ren = V_aimes × s³
Surface area: A_ren = A_aimes × s²
Linear dimension: L_ren = L_aimes × s
```

**Sintering Profile Adaptation:**
- Smaller tiles → faster heat transfer → lower flash voltage needed
- Voltage scaling: V_ren ≈ V_aimes × s (constant field strength)
- Time scaling: t_ren ≈ t_aimes × s² (diffusion distance squared)

| Tile Size | Scale Factor | Flash Voltage | Densification Time | Predicted Density |
|-----------|--------------|---------------|-------------------|-------------------|
| 150mm (AIMES) | 1.0 | 300 V/cm | 8-15s | 96.9% |
| 50mm (TS/TG) | 1/3 | 100 V/cm | 1-2s | 97-98% |
| 25mm (SS/SG) | 1/6 | 50 V/cm | 0.5-1s | 97-98% |

**Miniaturized Tile Properties (Predicted from MAT-03 §1.2):**

| Property | 150mm (AIMES) | 50mm (TS/TG) | 25mm (SS/SG) |
|----------|---------------|--------------|--------------|
| Density | 96.9% | 97-98% | 97-98% |
| Grain size | 2.1 μm | 1.5-2.0 μm | 1.0-1.5 μm |
| Flexural strength | 590 MPa | 650-700 MPa | 700-750 MPa |
| Vickers hardness | 22-23 GPa | 23-24 GPa | 24-25 GPa |
| Thermal shock ΔT | 300°C | 400°C | 500°C |
| Ballistic limit (NIJ IV) | Pass | Pass | Pass (thinner but stronger) |

### 2.3 Integration as Ceramic-Gilded Decorative Elements (SYNTH-02 Mapping)

Per SYNTH-02 §2-3, AIMES ceramic tiles map to **Renaissance "ceramic-gilded decorative elements"** mounted in brocade/goldwork patterns:

```
DECORATIVE INTEGRATION PARAMETERS:
  Mounting: Magnetic edge alignment (NdFeB N52, 8×3mm) per CSMFAB078 §3.3
  Pattern: Brocade/goldwork layouts per DRAFT-04 Farthingale/Pannier geometry
  Panel count by edition (LES zones):
    RM-TS: 42 panels → 180 tiles
    RM-TG: 56 panels → 210 tiles
    RM-SS: 36 panels → 150 tiles
    RM-SG: 48 panels → 165 tiles
    RW-TS: 40 panels → 170 tiles
    RW-TG: 52 panels → 195 tiles
    RW-SS: 34 panels → 140 tiles
    RW-SG: 46 panels → 160 tiles
```

**Magnetic Edge Alignment Force (from MAT-03 §1.2):**
```
F_mag = (B² × A) / (2μ₀)
B ≈ 0.5 T (NdFeB N52 surface field)
A = 8×3 mm² = 2.4×10⁻⁵ m²
F_mag ≈ 2.4 N per magnet pair
Total retention per tile: 4 magnet pairs → 9.6 N
```

**Tile Mass Calculation:**
```
m_tile = ρ × V = 5600 kg/m³ × (L² × t)
50mm tile: m = 5600 × (0.05² × 0.010) = 14 g/tile
25mm tile: m = 5600 × (0.025² × 0.006) = 2.1 g/tile

Edition mass (tiles only):
RM-TS: 180 × 14g = 2.52 kg
RM-TG: 210 × 14g = 2.94 kg
RM-SS: 150 × 2.1g = 0.32 kg
RM-SG: 165 × 2.1g = 0.35 kg
```

---
