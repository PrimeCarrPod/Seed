## 5. Cell-to-Cell Handoff and Transport

### 5.1 AIMES Stack Transport System

**Gantry-Mounted Transport Frame:**
```
Frame: Carbon fiber sandwich (Nomex core, CFRP skins)
Mass: 45 kg (empty), 85 kg (loaded 12-layer stack)
Dimensions: 1200×800×50 mm (L×W×H)
Registry: 4× kinematic mounts (Kelvin coupling, ±0.01 mm)
```

**Inter-Cell Transfer Sequence:**
```
Cell 1 (Sewbo Prep) → Buffer 1 → Cell 2 (Sewing) → Buffer 2 → Cell 3 (US Weld)
→ Buffer 3 → Cell 4 (RF Weld) → Buffer 4 → Cell 5 (Inspection) → Output

Buffer capacity: 3 frames each (FIFO, RFID tracked)
Cycle time sync: All cells synchronized to 4.5 min takt
```

### 5.2 Registry Fiducial System

**Fiducial Design (per SYNTH-03 §1.6):**
```
Type: 3-point kinematic (1 planar, 2 spherical, 1 diamond)
Material: Tungsten carbide (WC-Co), Ø 6 mm
Location: 4 corners of transport frame + 2 mid-edge
Detection: Machine vision (Section 2.4) + touch probe (Renishaw OMP400)
```

**Coordinate Transformation:**
```
Frame-to-cell registration:
T_cell = T_fiducial → cell_base
T_cell = [R | t; 0 0 0 1] ∈ SE(3)

Composite stack alignment:
For each layer L_i: offset_i = f(edition, zone, material_shrinkage)
Total stack alignment error: ||Σ offset_i|| < 0.15 mm (RSS)
```

---
