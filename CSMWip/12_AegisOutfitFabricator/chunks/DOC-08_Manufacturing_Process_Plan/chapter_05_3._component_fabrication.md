## 3. Component Fabrication

### 3.1 Ceramic Tile Fabrication (CSMFAB078 §6 Steps 4-5, SYNTH-02 §4.1)

```
Slurry Preparation:
  ZrB₂ (70 wt%) + SiC (30 wt%) + PVB (6 wt%) + DBP (3 wt%)
  Ball mill: 24 hr, ethanol, zirconia media
  Solids loading: 55 vol%, viscosity: 500-1000 mPa·s

Tape Casting (Doctor Blade):
  Thickness: 250μm green tape
  Drying: 40°C, controlled humidity (50% RH)
  Lamination: 12-24 ply (0°/90° alternating)
  Isostatic Pressing: 200 MPa, 70°C, 30 min

Flash Sintering (V2.0 Protocol):
  Electrode: Graphite foil (top/bottom)
  Field: 300 V/cm DC
  Flash onset: 1580°C (vs. 1900°C conventional SPS)
  Densification: 8-15 seconds
  Final density: 96.9% theoretical
  Grain size: 2.1 μm
  Flexural strength: 590 MPa

Renaissance Miniaturization (SYNTH-02 §2.1):
  Scale factor: s = 1/6 (25mm) to 1/3 (50mm)
  Voltage scaling: V_ren = V_aimes × s
  Time scaling: t_ren = t_aimes × s²
  Kiln firing alternative: 1300-1400°C, 4-6 hr soak, slow cool
```

### 3.2 BFRP Panel VARTM Molding (CSMFAB078 §6 Step 3)

```
Preform: Basalt UD (0°/±45°/90°), 60% FVF
Mold: Aluminum, heated to 80°C
Infusion: Elium® resin, vacuum 50 mbar
Cure: 90 min at 80°C + 30 min post-cure at 120°C
Demold: 40°C
Properties: 1000 MPa tensile, 85 GPa modulus, 2.1 g/cm³
Panel sizes: Edition-specific (per SYNTH-02 §3)
```

### 3.3 Metallic Thread Production (SYNTH-02 §4.2, MAT-03 §2)

```
Gilded Thread Base (Historical):
  1. Silk core: Degummed, 20-22 denier
  2. Au-Hg amalgam: Electrodeposition on Ag foil
  3. Thermal decomposition: 350°C, 30 min, N₂ atmosphere
  4. Micro-strip cutting: 20μm wide strips
  5. Helical winding: 50-100 wraps/mm on silk core

MXene Coating (Modern):
  Dip coating line:
    - Bath: MXene 5 mg/mL in water/ethanol (50/50)
    - Speed: 1 m/s, 4 passes
    - Dry: 80°C, 2 min between passes
    - Post-cure: 150°C, 10 min
  Quality: Coating thickness 2μm ±0.5μm
  Adhesion: >90% retention after Martindale 40,000 cycles
```

### 3.4 STF Impregnation (SYNTH-02 §4.3, MAT-03 §4)

```
STF Bath: SiO₂ (20-50 nm) 55 wt% in PEG-400
  Viscosity: 50-100 mPa·s at 40°C
  Degassing: 10 mbar, 10 min

Impregnation Cycle:
  1. Fabric load: Silk/linen 150-250 g/m²
  2. Vacuum: 10-50 mbar, 30-60 min at 50°C
  3. Pressure release: 1 mbar/s (capillary penetration)
  4. Centrifuge: 500 rpm, 2 min
  5. Cure: 80°C, 2 hr

Add-on: 15-25% weight gain
Flexibility retention: >70%
```

### 3.5 Coating Application (CSMFAB078 §6 Step 9)

```
Multi-Layer Coating Stack:
1. ZrO₂ Primer: 20μm, plasma spray or sol-gel dip
2. YInMn Blue Base: 150μm, HVLP spray
   - Solvent: Butyl acetate/xylene blend
   - Binder: Silicone resin (stable to 250°C)
   - Pigment loading: 40-50 vol%
3. CsPbBr₃ QD Topcoat: 80μm, UV-cure
   - QD: 8-12 nm, PLQY >80%
   - Fluorescence: 520 nm ±5 nm (diagnostic)
   - UV cure: 365 nm, 500 mJ/cm²
```
