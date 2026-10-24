## 4. Repair Procedures

### 4.1 O-Level Repairs (Field, ≤4 hours)

```
REPAIR 4.1.1 — Ceramic Tile Replacement (Layer 2)
  TRIGGER: Crack/chip >2mm, magnetic alignment loss, tile loss
  PROCEDURE:
    1. Identify tile location (RFID + visual grid map)
    2. Remove damaged tile: Pry magnetic edge (tool: ceramic wedge)
    3. Clean mating surfaces: IPA, lint-free, inspect gasket
    4. Install replacement: Align magnetic edges (audible click)
    5. Verify: Adjacent tiles articulation, magnetic hold force >15N
    6. BIT: PBIT 02 (MHD), 04 (MR), 08 (Seal)
  TIME: 15 minutes/tile
  SPARES: Edition-specific tile kit (Bay 7)
  TOOLS: Ceramic wedge, torque wrench, RFID reader

REPAIR 4.1.2 — Seal Patch (MXene Tape)
  TRIGGER: He leak rate 1-5×10⁻⁶ cm³/s, gasket cut <10mm
  PROCEDURE:
    1. Locate leak: He sniffer or bubble test (IPA)
    2. Clean area: 50mm radius, IPA, abrade lightly (Scotch-Brite)
    3. Apply MXene tape (3M VHB 4950 + MXene bridge): 40mm overlap
    4. Roller press: 20 N/cm², 30 seconds
    5. Cure: 30 minutes (room temp) or 5 min @ 60°C
    6. Verify: He leak ≤1×10⁻⁶ cm³/s
  TIME: 30 minutes
  SPARES: MXene tape roll (thigh pocket + Bay 7)

REPAIR 4.1.3 — Lacing Adjustment / Cleat Replace
  TRIGGER: Tension >±10% target, cleat skip/fail, Dyneema fray
  PROCEDURE:
    1. De-tension zone: Release cleat, unwind Dyneema
    2. If cleat: Remove (2× M3 Torx), install new Ti₃AlC₂ cleat
    3. If Dyneema: Cut frayed section, splice (Fisherman's knot + heat shrink)
    4. Re-tension: Torque wrench 2.5±0.2 Nm per edition table
    5. Verify: Force sensor readback ±5%, morphology calibration <90s
  TIME: 20 minutes/zone
  SPARES: Dyneema SK99 spool, cleat kit (12 per edition)

REPAIR 4.1.4 — Sensor Node Bypass
  TRIGGER: PVDF-TrFE node FAIL (open/short), OFS channel loss
  PROCEDURE:
    1. Identify node/channel (BIT code + wrist HUD map)
    2. Software bypass: HFET config → mark channel bad
    3. Neural net retrain: Exclude bad channel (auto, <60s)
    4. Verify: 239/240 nodes green, inference accuracy >99%
  TIME: 5 minutes
  SPARES: None (software-only)

REPAIR 4.1.5 — RF Mesh Node Replace
  TRIGGER: Node dropout >1hr, RSSI <-95dB, hardware FAIL
  PROCEDURE:
    1. Locate node (mesh topology map)
    2. Remove: Snap-fit from FSS embroidery pocket
    3. Install spare: Snap-fit, auto-join mesh (<10s)
    4. Verify: Mesh depth ≤4 hops, latency <50ms
  TIME: 10 minutes
  SPARES: 4 spare nodes (Bay 7)
```

### 4.2 I-Level Repairs (Shop, 24-72 hours)

```
REPAIR 4.2.1 — MR Fluid Service / Replace
  TRIGGER: Yield stress drift >15%, particle settling >5%, contamination
  PROCEDURE:
    1. Drain: Gravity + vacuum assist (30 min, 12 zones parallel)
    2. Flush: PAO-40 carrier, 3× volume, filter 1µm
    3. Inspect: Bladder walls (boroscope), fittings, check valves
    4. Refill: Fresh MR fluid (Bay 5 reserve or new batch)
       - Carbonyl iron 3-5µm, 35 vol%, σ=800 S/m
       - Fill to 0.5 bar, degas 10 min vacuum
    5. Calibrate: Yield stress 80±8 kPa @ 250 kA/m (rheometer)
    6. BIT: PBIT 04 full
  TIME: 4 hours
  SPARES: MR fluid 20L drum, bladder repair kit

REPAIR 4.2.2 — Battery Module Replace (Li-S Pack)
  TRIGGER: Capacity <80% rated, cell imbalance >100mV, impedance >10mΩ
  PROCEDURE:
    1. Safe discharge: 28V bus → load bank to 20% SOC
    2. Remove: 4× M6 bolts, HV interlock (keyed)
    3. Install new module: Pre-balanced, calibrated BMS
    4. Commission: BMS handshake, capacity verify C/10
    5. BIT: PBIT 03 full
  TIME: 2 hours
  SPARES: Li-S module (6.8kg, Bay 6)

REPAIR 4.2.3 — Aerogel Panel Replace (Layer 5)
  TRIGGER: Compression springback <85%, quilting damage >3 broken stitches
  PROCEDURE:
    1. Remove outer layers (1-4) to access Layer 5
    2. Unstitch damaged panel (seam ripper, preserve brocade)
    3. Install new panel: Diamond/trapunto quilting match
    4. Restitch: 18-22 SPI, silk thread (MAT-01), backstitch
    5. Reassemble layers 1-4, verify magnetic alignment
    6. BIT: PBIT 05 (thermal), 08 (seal)
  TIME: 6 hours
  SPARES: Edition-specific aerogel panel kit (Bay 2)

REPAIR 4.2.4 — FSS Embroidery Repair (Layer 4)
  TRIGGER: Broken conductive threads >5, bandstop shift >10%
  PROCEDURE:
    1. Map damage: VNA sweep, photo documentation
    2. Remove panel: Unstitch from substrate
    3. Re-embroider: CNC embroidery machine (Sierpiński G3 pattern)
       - Thread: MXene-coated metallic (MAT-01)
       - Stitch: Satin, 2.5mm width, 0.4mm spacing
    4. Verify: VNA sweep 1.8MHz/150MHz/2.4GHz bandstop
    5. Reinstall, BIT: PBIT 06 (OFS), 07 (RF)
  TIME: 8 hours (includes CNC setup)
  SPARES: Pre-embroidered panels (Bay 2)

REPAIR 4.2.5 — Framework Alignment / Baleen Replace
  TRIGGER: Laser tracker >1mm deviation, baleen permanent set >2mm
  PROCEDURE:
    1. Disassemble to framework (remove all soft layers)
    2. Baleen replace: Heat form (steam 100°C, 5min) to anatomical mold
    3. Steel boning: Straighten (press) or replace (spring steel 1.5mm)
    4. Hoops: Verify circularity <0.5mm, tape suspension integrity
    5. Realign: Laser tracker, shim channels (PTFE 0.1mm increments)
    6. Reassemble, morphology calibration <90s
    7. BIT: PBIT 12 (lacing)
  TIME: 12 hours
  SPARES: Baleen blanks, steel boning, hoop kits
```

### 4.3 D-Level Repairs (Depot, 2-4 weeks)

```
REPAIR 4.3.1 — BFRP Structural Chassis Repair/Replace
  TRIGGER: UT-PA/ECT indication >2mm, tensile coupon <900MPa
  PROCEDURE:
    1. Full disassembly to chassis
    2. Damage assessment: CT scan + coupon test
    3. Repair option A (minor): VARTM patch (basalt UD, Elium®)
       - Scarf joint 12:1, vacuum bag, RT cure 90min
    4. Repair option B (major): Replace segment (torso/limb)
       - Factory VARTM, 1000 MPa tensile cert
    5. Non-destructive validation: UT-PA 100%, coupon tensile
    6. Reassemble full suit, Phase E acceptance test
  TIME: 1-2 weeks
  SPARES: Chassis segments (factory)

REPAIR 4.3.2 — MHD Channel Array Refurbishment
  TRIGGER: >10% channels degraded, electrode corrosion, magnet demag
  PROCEDURE:
    1. Extract MR fluid loop (Layer 8)
    2. Channel inspection: Borescope, electrode resistance map
    3. Electrode replate: Pt-coated Ti (POCO AXF-5Q) or graphite
    4. Magnet check: Hall map, remagnetize if <0.75T (NdFeB N52)
    5. Reassemble, flow test 600 channels parallel
    6. Power test: 500W @ 28V, efficiency >90%
  TIME: 2 weeks
  SPARES: Electrode kits, magnet segments

REPAIR 4.3.3 — Neuromorphic ASIC / Verified Runtime Refresh
  TRIGGER: Inference drift >2%, watchdog trips >1/day, model hash mismatch
  PROCEDURE:
    1. Extract compute module (shielded DIM)
    2. Burn-in test: 1000h at 5W, thermal cycling -20°C/+60°C
    3. Firmware update: seL4 kernel + model load (signed)
    4. Adversarial re-certification: CROWN-IBP bounds
    5. Integration test: Full DOC-30 PBIT suite
  TIME: 1 week
  SPARES: Compute module (rotating pool)

REPAIR 4.3.4 — Ceramic Tile Re-sintering (Phoenix Protocol)
  TRIGGER: Fleet-wide tile aging, flexural strength <500MPa
  PROCEDURE:
    1. Tile recovery: H₂SO₄ leach → ZrO₂ (85-92% recovery)
    2. Re-boronization: B₄C addition, flash sinter (300V/cm, 1580°C, 10s)
    3. Quality: 96.9% density, grain 2.1µm, flexural 590MPa
    4. Re-coat: YInMn Blue + CsPbBr₃ QD (150µm + 80µm)
    5. Re-certify: NIJ IV, thermal 1100°C/300s
  TIME: 3 weeks (batch)
  SPARES: Recovered tile inventory
```

---
