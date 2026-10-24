## 1. Maintenance Intervals — RM-SS (DOC-08, DOC-09, CSMFAB078 Main §6)

### 1.1 Maintenance Schedule Overview

| Interval | Type | Tasks | Duration | Personnel |
|----------|------|-------|----------|-----------|
| **Pre-Mission** | Inspection | Visual, tile tap, MXene continuity, LES verify | 10 min | Wearer |
| **Post-Mission** | Inspection + Clean | Full visual, sweat removal, ventilation | 20 min | Wearer |
| **Weekly (40 hr)** | Preventive | Deep clean, baleen hydration, stitch check | 45 min | Tech |
| **Monthly (160 hr)** | Intermediate | Tile removal/inspect, MXene recoat, chassis check | 2 hr | Tech |
| **Quarterly (500 hr)** | Major | Full disassembly, component replacement, recert | 8 hr | Depot |
| **Annual (2000 hr)** | Overhaul | Complete rebuild, material requal, edition verify | 24 hr | Depot |

### 1.2 Detailed Task Cards

#### Pre-Mission (10 min) — Wearer
- [ ] Visual inspection: tears, burns, delamination, tile cracks
- [ ] Tile tap test: 150 primary + 280 backup (audible ring)
- [ ] MXene continuity: 3 seam points <1 Ω (multimeter)
- [ ] LES verification: Auto-sweep all 12 zones (green)
- [ ] PVDF battery: >20% (wrist module)
- [ ] Lacing cords: No fray, cleats engage
- [ ] Quick-release: CF pull tab, side breakaway, hose Velcro

#### Post-Mission (20 min) — Wearer
- [ ] Remove debris: brush ceramic tiles, shake hose
- [ ] Sweat removal: Silk chiffon wipe (L5 envelope), air dry 30 min
- [ ] Ventilation: Hang on articulated hanger, fans if available
- [ ] Lacing relax: Fully unlace, store cords loose
- [ ] PVDF sync: Auto-download mission data
- [ ] Log: Mission hours, environment, anomalies

#### Weekly Preventive (45 min) — Technician
- [ ] Baleen hydration: Remove 20 stays, soak 40°C 30 min, reinsert
- [ ] Stitch inspection: All structural seams (20 SPI min), repair if <18 SPI
- [ ] MXene spot check: 10 random seams, <1 Ω
- [ ] Tile gap check: Feeler gauge 0.2 mm max at 20 interfaces
- [ ] Chassis alignment: Baleen straightness, steel boning coil integrity
- [ ] Hardware torque: Aglet press-fit, eyelet flare
- [ ] PVDF calibration: Known pressure source, 20 mV/Pa ±10%
- [ ] Battery cycle: Charge to 80%, store at 50%

#### Monthly Intermediate (2 hr) — Technician
- [ ] Tile removal: 10% sample (15 primary, 28 backup) — inspect for:
  - Surface cracks (visual + 10× loupe)
  - Edge chips >0.5 mm
  - MXene gasket adhesion
  - STF saturation (weigh, compare to baseline)
- [ ] MXene recoat: Spray 5 wt% on L3/L6 seams, cure 80°C 30 min
- [ ] Aerogel envelope: Inspect chiffon for tears, microperforation patency
- [ ] Baleen full check: All 20 stays — E-modulus test (portable)
- [ ] Steel boning: Remove 8, inspect coil fatigue, relubricate PTFE
- [ ] LES recalibration: Full 12-zone baseline update

#### Quarterly Major (8 hr) — Depot
- [ ] Full disassembly: All 12 layers separated
- [ ] Component replacement (per wear limits):
  - Primary tiles: Replace if >5 cracked/chipped per 150
  - Backup tiles: Replace if >10 cracked/chipped per 280
  - Aerogel: Replace if λ >0.018 W/m·K (measured)
  - MXene layers: Replace if SE <50 dB @ 1 GHz
  - STF layers: Replace if onset shear rate >2,000 s⁻¹
  - Baleen: Replace if E <3.5 GPa (hydrated)
  - Steel boning: Replace if yield <1000 MPa
  - Silk textiles: Replace if tensile <80% baseline
- [ ] Reassembly per build spec
- [ ] Full recertification: All QA gates (Ch. 118-127)

#### Annual Overhaul (24 hr) — Depot
- [ ] Complete material requalification (all MAT-01/02/03 tests)
- [ ] Edition verification: Confirm RM-SS parameters
- [ ] Configuration audit: CMDB vs. physical
- [ ] Life extension assessment: Remaining useful life
- [ ] Technology refresh: Evaluate new materials (MXene, ceramic, STF)

### 1.3 Wear Limits & Replacement Criteria

| Component | Wear Indicator | Replace If | Baseline |
|-----------|----------------|------------|----------|
| Primary Tiles | Cracks/chips | >5 per 150 | 0 |
| Backup Tiles | Cracks/chips | >10 per 280 | 0 |
| MXene L3/L6 | SE @ 1 GHz | <50 dB | 58.5 dB |
| FSS L4 | Bandstop depth | <20 dB | 25-35 dB |
| Aerogel L5 | λ (thermal cond.) | >0.018 W/m·K | 0.014 |
| STF L8/L9 | γ̇_onset | >2,000 s⁻¹ | 1,200 s⁻¹ |
| Baleen Stays | E (hydrated) | <3.5 GPa | 4.2 GPa |
| Steel Boning | Yield strength | <1000 MPa | 1200 MPa |
| Silk Textiles | Tensile (ISO 13934) | <80% baseline | Per MAT-01 |
| Lacing Cords | Fray/breaks | Any | 0 |
| Aglets/Cleats | Release force | <20 N / >40 N | 25 N |

### 1.4 Cross-References

- DOC-08: Manufacturing process plan
- DOC-09: QA testing protocol
- CSMFAB078 Main §6: Maintenance concept
- Chapter 17: Layer specs (wear limits)
- Chapter 18: Layer-by-layer details
- Chapter 19: Interlayer interfaces
- Chapter 34-38: Chassis maintenance
- Chapter 95: LES verification (pre-mission)
- Framework/Maint_Plan.md: Master maintenance plan

---
