## 4. Tile Articulation Mechanics (SYNTH-02 §2 Rows 2,7, MAT-03 §3.1, DOC-06 §3.2)

### 4.1 Articulation Geometry (Primary Tiles: 20×20×3 mm)

**Tile-to-Tile Interface:**
- **Gap:** 0.2 mm (MXene-impregnated silk tape gasket)
- **Overlap:** 2 mm (ceramic edge chamfer)
- **Rotation Axis:** Tile center (spherical approximation)

**Degrees of Freedom per Tile:**
1. **θ_pitch:** ±12° (flexion/extension)
2. **θ_yaw:** ±10° (lateral bending)
3. **θ_roll:** ±5° (torsion, limited by gasket)
4. **Δz:** ±0.5 mm (normal compliance, STF gasket)

### 4.2 Hexagonal Close-Pack Kinematics

**Unit Cell (7 tiles: 1 center + 6 neighbors):**
```
       ●
    ●     ●
  ●  (C)  ●
    ●     ●
       ●
```

**Articulation Constraints:**
- Center tile moves → 6 neighbors follow via gasket shear
- Max shear strain in gasket: γ_max = 0.2 mm / 0.2 mm = **100%**
- MXene-silk gasket shear capacity: γ_yield = 150% ✅

### 4.3 Mobility vs. Protection Trade Space

| Articulation Limit | Shoulder Abd. | Hip Flexion | Trunk Flexion | Ballistic V₅₀ |
|-------------------|---------------|-------------|---------------|---------------|
| **±8° / ±6°** | 135° | 85° | 60° | 965 m/s |
| **±12° / ±10° (RM-SS)** | **145°** | **95°** | **70°** | **955 m/s** |
| ±15° / ±12° | 155° | 105° | 80° | 935 m/s |
| ±20° / ±15° | 165° | 115° | 90° | 905 m/s |

**RM-SS Selection:** ±12°/±10° — **optimal Pareto point** (MI=0.89, V₅₀=955 m/s)

### 4.4 Gasket Mechanics (MXene-Impregnated Silk Tape)

**Material:** Silk habotai + MXene 15 wt% + STF 10 wt%
- **Thickness:** 0.2 mm (uncompressed)
- **Shear Modulus (G):** 0.8 MPa (linear), 12 MPa (STF activated)
- **Normal Stiffness:** 45 MPa (compressive)
- **Friction Coefficient:** μ = 0.15 (MXene lubrication)

**Force-Displacement:**
$$F_{shear} = G \cdot A \cdot \gamma = 0.8 \times 10^6 \times (400 \times 10^{-6}) \times \gamma = 320 \cdot \gamma\ \text{N}$$

At γ = 1.0 (max): F = **320 N per tile interface**
Total for 150 tiles: **48 kN** (distributed)

### 4.5 Dynamic Articulation (High-Rate Loading)

**Impact Scenario (Ballistic):**
- Tile acceleration: 50,000 g (typical ceramic)
- Gasket STF activation: γ̇ = 10,000 s⁻¹ >> 1,200 s⁻¹ onset
- **Instant hardening:** G increases 15× (0.8 → 12 MPa)
- **Result:** Tiles lock in <0.5 ms, form monolithic plate

**Mobility Scenario (Sprint):**
- Tile cycling: 2 Hz (stride frequency)
- Gasket strain rate: γ̇ = 2πf·γ_max = 12.6 s⁻¹ << 1,200 s⁻¹
- **STF inactive:** Low shear modulus, free articulation
- **Energy Loss:** Hysteresis = 8% per cycle (measured)

### 4.6 Backup Tile Articulation (15×15×2 mm)

- **Count:** 280 tiles (smaller, more compliant)
- **Articulation:** ±18°/±15° (higher mobility)
- **Gasket:** Same MXene-silk-STF
- **Function:** Conformal to body curvature, spall containment
- **Mass:** 1.92 kg (L7)

### 4.7 Cross-References

- SYNTH-02 §2 Rows 2,7: AIMES L2/L7 mapping
- MAT-03 §3.1: Ceramic tile specification
- DOC-06 §3.2: Protective layer articulation
- MAT-03 §3.5: STF gasket specification
- Chapter 17: Layer specifications (L2, L7)
- Chapter 18: Layer-by-layer details
- Chapter 19: Interlayer interfaces
- Chapter 75: Joint-specific ROM
- Chapter 78: LES tension vs. mobility

---
