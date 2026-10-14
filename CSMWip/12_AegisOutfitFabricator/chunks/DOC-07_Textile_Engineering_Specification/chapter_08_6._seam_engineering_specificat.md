## 6. Seam Engineering Specification (SYNTH-01 §7)

### 6.1 Historical Stitch Density and Thread Mechanics

**Stitch Density (Research Doc 1 §6.1):**
```
Modern industrial: 10-12 SPI
Historical structural seams: 18-22 SPI (high-stress areas)
Ceramic tile mounting seams: 22-25 SPI (maximum)
Framework attachment seams: 20-22 SPI
```

### 6.2 ISO 4915 Stitch Classification Mapping (SYNTH-01 §7.1)

| ISO Class | Architecture | Mechanical Dominance | Historical Equivalent | Application |
|-----------|-------------|---------------------|----------------------|-------------|
| 100 | Intralooping (single) | High elasticity, catastrophic raveling | Running stitch | Basting, gathering only |
| 200 | Planar bidirectional | Aesthetic, minimal strength | Hand sewing replication | Decorative only |
| 300 | Mid-plane interlocking | Max static tensile, longitudinal inelasticity | **Backstitch** | **Primary structural seams** |
| 400 | Interlooping double chain | Dynamic load distribution | **Cartridge pleating** | **Skirt attachment, volumetric compression** |
| 500 | Edge encapsulation | Fray prevention, high stretch | Whipstitch/overcast | Seam allowance finishing |
| 600 | Multiaxial flatseam | Extreme multidirectional elasticity | N/A (modern) | Not used in historical |

### 6.3 Seam Integrity Formulas (ASTM D1683, SYNTH-01 §7.2)

**Seam Efficiency:**
```
η = F_seamed / F_unseamed × 100%
Target: η ≥ 80% for structural seams
```

**CRE Tensile Testing Parameters:**
```
Specimen: 50mm × 200mm
Gauge length: 50mm
Extension rate: 50mm/min
Temperature: 21±1°C, RH: 65±2%
```

**Standard Seam Specifications:**
```
Ssa-1: 301 lockstitch (backstitch equivalent), 4.7±0.5 SPI, 13mm allowance
       → High-density silk (brocatelle, lampas)
SSn-2: 301 lockstitch, 4.7±0.5 SPI, 25mm allowance
       → Medium-density (damask, liner)
SSd-2: 401 chainstitch (cartridge pleating equivalent), 3.1±0.5 SPI, 40mm allowance
       → Low-density heavy yarns (quilting, framework attachment)
```

**Failure Modes:**
```
1. Thread rupture (under-stitched) → Increase SPI or thread strength
2. Fabric rupture (over-stitched) → Reduce SPI or increase seam allowance
3. Seam slippage (yarn displacement) → Onset at 3mm standardized seam opening
   → Increase stitch density or use backstitch (Class 300)
```

### 6.4 Cartridge Pleating Volumetric Compression (SYNTH-01 §7.3, Research Doc 1 §6.2)

```
S-curve fold geometry: y(x) = A·sin(2πx/λ) + B·x
Compression ratio: 3:1 (planar : finished width)
Stress diffusion: F_gravitational / N_pleats per anchor point
Pleat depth: d = (W_unpleated - W_finished) / (2 × N_pleats)
Thread requirement: Beeswax-coated linen, σ_thread_max ≈ 300 MPa
```
