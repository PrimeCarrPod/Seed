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

**Key Formulas:**
- Composition: $w_{ZrB_2} = 70\%, \; w_{SiC} = 30\%, \; w_{PVB} = 6\%, \; w_{DBP} = 3\%$
- Solids loading: $\phi_{solids} = 55 \text{ vol\%}$
- Slurry viscosity: $\eta_{slurry} = 500\text{--}1000 \text{ mPa·s}$
- Green tape thickness: $t_{green} = 250 \mu\text{m}$
- Pressing pressure: $P_{iso} = 200 \text{ MPa}$
- Electric field: $E = 300 \text{ V/cm}$
- Flash onset temperature: $T_{flash} = 1580^\circ\text{C} \quad (\text{vs. } 1900^\circ\text{C conventional SPS})$
- Densification time: $\Delta t = 8\text{--}15 \text{ s}$
- Relative density: $\rho_{rel} = 96.9\% \rho_{theoretical}$
- Grain size: $d_g = 2.1 \mu\text{m}$
- Flexural strength: $\sigma_{flex} = 590 \text{ MPa}$
- Scale factor: $s = 1/6 \text{ (25mm)} \text{ to } 1/3 \text{ (50mm)}$
- Voltage scaling: $V_{ren} = V_{aimes} \times s$
- Time scaling: $t_{ren} = t_{aimes} \times s^2$

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

**Key Formulas:**
- Fiber volume fraction: $V_f = 60\%$
- Vacuum pressure: $P_{vac} = 50 \text{ mbar}$
- Infusion temperature: $T_{inf} = 80^\circ\text{C}$
- Cure cycle: $t_{cure} = 90 \text{ min at } 80^\circ\text{C} + 30 \text{ min at } 120^\circ\text{C}$
- Tensile strength: $\sigma_{tensile} = 1000 \text{ MPa}$
- Modulus: $E = 85 \text{ GPa}$
- Density: $\rho = 2.1 \text{ g/cm}^3$

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

**Key Formulas:**
- Silk core denier: $D_{silk} = 20\text{--}22 \text{ denier}$
- Thermal decomposition: $T_{decomp} = 350^\circ\text{C}, \; t = 30 \text{ min}, \; N_2 \text{ atmosphere}$
- Micro-strip width: $w_{strip} = 20 \mu\text{m}$
- Helical winding density: $N_{wraps} = 50\text{--}100 \text{ wraps/mm}$
- MXene bath concentration: $C_{MXene} = 5 \text{ mg/mL}$
- Dip coating speed: $v_{dip} = 1 \text{ m/s}$
- Number of passes: $N_{passes} = 4$
- Coating thickness: $t_{coat} = 2 \pm 0.5 \mu\text{m}$
- Post-cure: $T_{cure} = 150^\circ\text{C}, \; t_{cure} = 10 \text{ min}$
- Adhesion retention: $\eta_{adh} > 90\% \quad \text{after Martindale 40,000 cycles}$

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

**Key Formulas:**
- Silica concentration: $C_{SiO_2} = 55 \text{ wt\%}$
- Silica particle size: $d_{SiO_2} = 20\text{--}50 \text{ nm}$
- STF viscosity: $\eta_{STF} = 50\text{--}100 \text{ mPa·s at } 40^\circ\text{C}$
- Degassing: $P_{deg} = 10 \text{ mbar}, \; t_{deg} = 10 \text{ min}$
- Fabric areal density: $\rho_{fabric} = 150\text{--}250 \text{ g/m}^2$
- Vacuum pressure: $P_{vac} = 10\text{--}50 \text{ mbar}$
- Vacuum time: $t_{vac} = 30\text{--}60 \text{ min at } 50^\circ\text{C}$
- Pressure release rate: $\frac{dP}{dt} = 1 \text{ mbar/s}$
- Centrifuge: $N = 500 \text{ rpm}, \; t_{cf} = 2 \text{ min}$
- Cure: $T_{cure} = 80^\circ\text{C}, \; t_{cure} = 2 \text{ hr}$
- Weight gain: $\Delta W = 15\text{--}25\%$
- Flexibility retention: $\eta_{flex} > 70\%$

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

**Key Formulas:**
- ZrO₂ primer thickness: $t_{ZrO_2} = 20 \mu\text{m}$
- YInMn Blue base thickness: $t_{YInMn} = 150 \mu\text{m}$
- Pigment volume loading: $\phi_{pigment} = 40\text{--}50 \text{ vol\%}$
- Binder thermal stability: $T_{binder} > 250^\circ\text{C}$
- QD topcoat thickness: $t_{QD} = 80 \mu\text{m}$
- QD size: $d_{QD} = 8\text{--}12 \text{ nm}$
- Photoluminescence quantum yield: $\text{PLQY} > 80\%$
- Fluorescence wavelength: $\lambda_{fl} = 520 \pm 5 \text{ nm}$
- UV cure wavelength: $\lambda_{cure} = 365 \text{ nm}$
- UV cure dose: $D_{cure} = 500 \text{ mJ/cm}^2$
