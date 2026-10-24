## 4. Mission Profiles

### 4.1 Profile A: Structural Firefighting (RM-TS/RW-TS)

```
Threat Environment:
- Thermal: 1100°C flash fire, 300s duration
- Structural collapse: Falling debris, impact
- Smoke/toxic gas: CO, HCN, particulate
- Duration: 30-60 min operational

Garment Configuration:
- Full ceramic tile coverage (42 tiles RM-TS)
- Maximum aerogel batting (200 g/m²)
- Double STF layers (8+9)
- MR fluid active (shoulders, chest, back)
- PVDF-TrFE monitoring: Core temp, heart rate

Operational Limits:
- Max continuous exposure: 300s @ 1100°C
- Duty cycle: 20 min work / 40 min rest
- Core temp limit: 39°C (monitored via PVDF-TrFE)
- Hydration: 250 mL/20 min work cycle
```

**Key Formulas:**
- Fire temperature: $T_{fire} = 1100^\circ\text{C}$
- Exposure duration: $t_{exp} = 300 \text{ s}$
- Ceramic tile count (RM-TS): $N_{tiles} = 42$
- Aerogel areal density: $\rho_{aerogel} = 200 \text{ g/m}^2$
- Max continuous exposure: $t_{max} = 300 \text{ s at } 1100^\circ\text{C}$
- Duty cycle: $t_{work} = 20 \text{ min}, \; t_{rest} = 40 \text{ min}$
- Core temp limit: $T_{core,max} = 39^\circ\text{C}$
- Hydration rate: $\dot{V}_{hydration} = 250 \text{ mL / 20 min}$

### 4.2 Profile B: HazMat/CBRNE Response (RM-TG/RW-TG)

```
Threat Environment:
- Chemical: Sarin, VX, mustard, chlorine
- Biological: Anthrax, plague, viral
- Radiological: Alpha, beta, gamma, neutron
- Duration: 4-8 hours

Garment Configuration:
- Full EMI shielding (MXene warp+weft+FSS)
- Ceramic tiles: Chemical resistant glazing
- Double-gasket joints: ePTFE + ZrO₂-silicone
- PVDF-TrFE: Chem/bio sensor integration
- Positive pressure option: MR bladder inflation

Operational Limits:
- Permeation breakthrough: >8 hrs (ASTM F739)
- Decontamination: 0.5% hypochlorite, rinse, air dry
- Filter change: Every 4 hrs (CBRNA PAPR)
```

**Key Formulas:**
- Mission duration: $t_{mission} = 4\text{--}8 \text{ hours}$
- Permeation breakthrough time: $t_{breakthrough} > 8 \text{ hrs} \quad (\text{ASTM F739})$
- Decontamination concentration: $C_{hypochlorite} = 0.5\%$
- Filter change interval: $t_{filter} = 4 \text{ hrs}$
- Positive pressure: $P_{MR} = \text{MR bladder inflation pressure}$

### 4.3 Profile C: Electrical Utility Arc Flash (RM-SS/RW-SS)

```
Threat Environment:
- Arc flash: 8 kA, 500ms, 480V (NFPA 70E)
- EMI/RFI: Substation switching, harmonics
- GIC: Carrington-class geomagnetic storm
- Duration: 2-4 hours

Garment Configuration:
- Maximum EMI shielding (45-50 dB system)
- CoAl₂O₄ Schumann absorption (Layer 12)
- BFRP dielectric chassis (no conductive path)
- YInMn Blue: Arc flash reflection
- PVDF-TrFE: GIC coupling monitoring

Operational Limits:
- Arc flash ATPV: ≥50 cal/cm²
- GIC coupling: <1 mV interior
- EMI SE: >45 dB @ 1GHz
- Duty cycle: Continuous (low metabolic)
```

**Key Formulas:**
- Arc flash current: $I_{arc} = 8 \text{ kA}$
- Arc flash duration: $t_{arc} = 500 \text{ ms}$
- Arc flash voltage: $V = 480 \text{ V}$
- ATPV: $ATPV \geq 50 \text{ cal/cm}^2$
- GIC coupling limit: $V_{int} < 1 \text{ mV}$
- EMI shielding: $SE > 45 \text{ dB at } 1 \text{ GHz}$
- System EMI SE: $SE_{system} = 45\text{--}50 \text{ dB}$

### 4.4 Profile D: Military Tactical (RM-SG/RW-SG)

```
Threat Environment:
- Ballistic: NIJ IV (.30-06 APM2)
- Blast: 500g C-4 @ 5m
- Directed energy: HPM, laser
- Duration: 6-12 hours

Garment Configuration:
- Maximum ceramic tiles (56 RM-SG)
- Auxetic metamaterial cladding (embroidered FSS)
- MR fluid all 12 zones
- STF double layer (8+9)
- PVDF-TrFE: Blast pressure, bio-acoustic

Operational Limits:
- Ballistic: 6 shots/panel, 0mm penetration
- Blast: Injury criteria met @ 5m
- Mobility: Full combat ROM
- Weight: ≤26 kg (RM-SG target)
```

**Key Formulas:**
- Mission duration: $t_{mission} = 6\text{--}12 \text{ hours}$
- Ceramic tile count (RM-SG): $N_{tiles} = 56$
- Blast charge: $m_{C4} = 500 \text{ g at } 5 \text{ m}$
- Ballistic shots: $N_{shots} = 6 \text{ per panel}$
- Penetration: $p = 0 \text{ mm}$
- Weight limit: $m_{total} \leq 26 \text{ kg} \quad (\text{RM-SG})$
- MR fluid zones: $N_{zones} = 12$
- STF layers: Double (8+9)

### 4.5 Profile E: Carrington Event Response (All Editions)

```
Threat Environment:
- GIC: 10-50 A/m² induced currents
- EMI: 1-10 GHz, 1-10 kV/m
- Duration: 24-72 hours (grid down)
- Secondary: Civil unrest, fire, structural

Garment Configuration:
- All editions: Maximum EMI/GIC protection
- BFRP dielectric citadel (no conductive path)
- CoAl₂O₄ Schumann absorption
- PVDF-TrFE: Continuous GIC monitoring
- Battery: 50Wh LiFePO₄ (72 hr standby)

Operational Limits:
- GIC coupling: Zero measured interior
- EMI SE: 148-165 dB system
- Communications: Optical fiber only
- Power: Solar recharge (YInMn QD fluorescence diagnostic)
```

**Key Formulas:**
- GIC induced current density: $J_{GIC} = 10\text{--}50 \text{ A/m}^2$
- EMI frequency range: $f = 1\text{--}10 \text{ GHz}$
- EMI field strength: $E = 1\text{--}10 \text{ kV/m}$
- Duration: $t = 24\text{--}72 \text{ hours}$
- GIC coupling limit: $V_{int} = 0 \text{ mV} \quad (\text{measured interior})$
- System EMI SE: $SE_{system} = 148\text{--}165 \text{ dB}$
- Battery capacity: $E_{battery} = 50 \text{ Wh} \quad (\text{LiFePO}_4)$
- Battery standby: $t_{standby} = 72 \text{ hours}$
