## 3. Field Maintenance Procedures

### 3.1 Daily Maintenance (Post-Mission)

```
Ceramic Tile Inspection:
- Visual: Cracks, chips, delamination
- Magnetic alignment: Verify all tiles seated
- Thermal signature: IR scan for delamination (hot spots)

Fabric & Thread Inspection:
- MXene thread continuity: Multimeter warp/weft (<1Ω)
- FSS embroidery: Visual, no broken threads
- Quilting stitches: Check for broken stitches (>2 = repair)
- Seam integrity: SPI count, backstitch verification

Framework Inspection:
- Baleen stays: Flex test, no permanent deformation
- Steel boning: No kinks, corrosion check
- Hoops: Circular, tape suspension intact
- Lacing: Dyneema SK99 no fraying, cleats functional

Sensor & Coating Check:
- PVDF-TrFE: Diagnostic mode, all 240 nodes reporting
- YInMn Blue: NIR reflectance spot check (>85%)
- CoAl₂O₄: Schumann test (>78 dB @ 7.83 Hz)
- STF layers: Flexibility test (bend 90°, return to flat)

Cleaning:
- Dry brush: Remove debris from tiles, brocade
- Spot clean: Mild soap, cold water, air dry (no heat)
- Do NOT machine wash, dry clean, or use solvents
```

**Key Formulas:**
- EMI continuity: $R_{warp/weft} < 1 \Omega$
- Broken stitch threshold: $N_{broken} > 2 \rightarrow \text{repair required}$
- PVDF-TrFE nodes: $N_{nodes} = 240 \quad (\text{all reporting})$
- NIR reflectance: $R_{NIR} > 85\%$
- Schumann resonance: $SE > 78 \text{ dB} \quad \text{at } 7.83 \text{ Hz}$
- STF flexibility: $\theta_{bend} = 90^\circ \rightarrow \text{returns to flat}$

### 3.2 Weekly Maintenance

```
Deep Inspection:
1. Full disassembly to layer level
2. Ceramic tile tap test (acoustic resonance)
3. Aerogel batting: Compression test (springback >90%)
3. STF rheology: Portable rheometer spot check
4. Lacing tension calibration: All 12 zones
5. Firmware update check: Protonic HFET, PVDF-TrFE
6. Battery check: LiFePO₄ 50Wh (MR fluid activation)
7. Seal integrity: Double-gasket joints (visual + pressure test)

Lubrication:
- Ti₃AlC₂ MAX Phase cleats: Dry film lubricant (MoS₂)
- Lacing pulleys: PTFE spray
- Magnetic tile edges: Anti-corrosion wipe
```

**Key Formulas:**
- Aerogel springback: $\eta_{springback} > 90\%$
- STF rheology range: $\dot{\gamma} = 0.1\text{--}1000 \text{ s}^{-1}$
- LES zones: $N_{zones} = 12$
- Battery capacity: $E_{battery} = 50 \text{ Wh} \quad (\text{LiFePO}_4)$
- MR fluid activation: Powered by battery

### 3.3 Monthly Maintenance (Full Overhaul)

```
Complete Disassembly & Inspection:
1. All 12 layers separated
2. Non-destructive testing:
   - Ceramic tiles: Ultrasonic thickness, µCT (10% sample)
   - BXRP panels: Ultrasonic C-scan (100%)
   - Metallic threads: SEM cross-section (coating thickness)
   - Aerogel: Thermal conductivity (guarded hot plate)
   - STF: Rheology sweep (0.1-1000 s⁻¹)
   - Baleen: Flexural modulus, thermoplastic transition
   - Steel boning: Fatigue test (10k cycles)

Component Replacement Criteria:
- Ceramic tile: Any crack >1mm, density <96%
- MXene thread: Coating thickness <1.5μm, SE <10 dB
- Aerogel batting: Compression springback <85%
- STF layer: η_max/η₀ <500×
- Baleen stay: Permanent set >5%, thermoplastic transition failed
- Steel boning: Yield strength <1000 MPa
- Dyneema lacing: Tensile <90% rated, fraying >2mm
- PVDF-TrFE: >5% nodes non-functional
- CoAl₂O₄ coating: Schumann SE <70 dB
- YInMn Blue: NIR reflectance <80%
```

**Key Formulas:**
- µCT sample rate: $f_{sample} = 10\%$
- C-scan coverage: $100\%$
- STF rheology sweep: $\dot{\gamma} = 0.1\text{--}1000 \text{ s}^{-1}$
- Steel fatigue cycles: $N = 10,000 \text{ cycles}$
- Crack threshold: $a_{crack} > 1 \text{ mm} \rightarrow \text{replace}$
- Tile density threshold: $\rho_{rel} < 96\% \rightarrow \text{replace}$
- MXene coating threshold: $t_{coat} < 1.5 \mu\text{m} \rightarrow \text{replace}$
- MXene SE threshold: $SE < 10 \text{ dB} \rightarrow \text{replace}$
- Aerogel springback threshold: $\eta_{springback} < 85\% \rightarrow \text{replace}$
- STF viscosity ratio threshold: $\eta_{max}/\eta_0 < 500 \rightarrow \text{replace}$
- Baleen permanent set: $\varepsilon_{perm} > 5\% \rightarrow \text{replace}$
- Steel yield threshold: $\sigma_y < 1000 \text{ MPa} \rightarrow \text{replace}$
- Dyneema tensile threshold: $\sigma < 90\% \sigma_{rated} \rightarrow \text{replace}$
- Fraying threshold: $f > 2 \text{ mm} \rightarrow \text{replace}$
- PVDF-TrFE node failure: $N_{dead} > 5\% \times 240 = 12 \text{ nodes} \rightarrow \text{replace}$
- Schumann SE threshold: $SE < 70 \text{ dB} \rightarrow \text{replace}$
- NIR reflectance threshold: $R_{NIR} < 80\% \rightarrow \text{replace}$
