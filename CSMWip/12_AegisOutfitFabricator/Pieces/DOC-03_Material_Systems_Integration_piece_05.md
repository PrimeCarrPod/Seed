**Volumetric Efficiency** (MAT-02 §4):
```
Volume enclosed: V ≈ Σ π·r_i²·h_i (hoop height segments)
Mass: M ≈ Σ 2π·r_i·t·ρ_steel·h_i
Ratio V/M maximized by large r, thin t → buckling constraint limits
```

*Traceability: Research Doc 1 §5.1-5.3; MAT-02 §1-4; SYNTH-01 §5; DRAFT-04 §2-3*

---

## 3. Protective Layers (from MAT-03)

### 3.1 Ceramic Tile Miniaturization

**AIMES Baseline** (CSMFAB078 §4 Layer 2,7; §6 Step 4-5):
```
Tile size: 150×150×10 mm
Composition: ZrB₂ (70%) + SiC (30%) + PVB (6%) + DBP (3%)
Process: Doctor blade 250μm → 12-24 ply lamination → isostatic press 200MPa/70°C
Flash sintering: 300 V/cm DC → 1580°C flash onset → 8-15s densification → 96.9% density
Properties: Hv 22-23 GPa, flexural 590 MPa, grain size 2.1μm
```

**Renaissance Scale: 25-50mm Decorative Elements** (MAT-03 §1.2; SYNTH-02 §2):
```
Scale factor: s = 25/150 = 1/6 to 50/150 = 1/3
Volume scaling: V_ren = V_aimes × s³
Surface area: A_ren = A_aimes × s²

Sintering profile changes:
- Voltage scaling: V_ren ≈ V_aimes × s (constant field strength)
- Time scaling: t_ren ≈ t_aimes × s² (diffusion distance squared)
- 25mm tile: ~50 V/cm, 2-4s densification
- 50mm tile: ~100 V/cm, 4-8s densification

Predicted properties:
| Property | 150mm (AIMES) | 50mm | 25mm |
|----------|---------------|------|------|
| Density | 96.9% | 97-98% | 97-98% |
| Grain size | 2.1 μm | 1.5-2.0 μm | 1.0-1.5 μm |
| Flexural strength | 590 MPa | 650-700 MPa | 700-750 MPa |
| Thermal shock ΔT | 300°C | 400°C | 500°C |
```

**Integration as Decorative Elements** (SYNTH-02 §2):
- "Ceramic-gilded decorative elements" mounted in brocade/goldwork patterns
- Magnetic edge alignment (NdFeB N52, 8×3mm) from CSMFAB078 §3.3
- Panel count scales with edition (LE-TS 42, LE-TG 56, LE-SS 36, LE-SG 48)

