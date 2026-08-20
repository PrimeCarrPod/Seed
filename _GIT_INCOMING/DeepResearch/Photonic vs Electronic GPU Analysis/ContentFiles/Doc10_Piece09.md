# Document 10: Heterogeneous Integration and III-V/Silicon Epitaxy
## Piece 9: Wafer-Scale Integration: 300mm Si Photonics Foundry Flow

---

### 10.9 Wafer-Scale Integration: 300mm Si Photonics Foundry Flow

The transition from research-scale to volume manufacturing of silicon photonics requires a standardized, CMOS-compatible 300mm wafer foundry flow. This piece details the end-to-end process flow, key process modules, yield considerations, and design rules for high-volume Si photonics manufacturing.

#### 10.9.1 Foundry Flow Overview

**Design-to-GDSII flow**:
1. PDK (Process Design Kit) installation
2. Schematic entry & simulation
3. Layout (GDSII) with DRC/LVS
4. MPW (Multi-Project Wafer) or dedicated run
5. Foundry fabrication (12-16 weeks)
6. Wafer-level test & characterization
7. Dicing, packaging, final test

**MPW vs. Dedicated runs**:
- MPW: Shared wafer, 1-4 reticles, lower cost, fixed schedule
- Dedicated: Full wafer, custom reticles, higher cost, flexible schedule
- MPW typical: 1-2 runs/quarter per foundry

**Key foundries** (300mm Si photonics):
- GlobalFoundries (GF 45SPCLO, 45CLO)
- TSMC (N16FFC, N7)
- Intel (Intel 4, 3)
- Samsung (28FD-SOI, 14LPP)
- Tower Semiconductor (SiPho 180, 65)
- IMEC (pilot line, 200/300mm)
- CEA-Leti (300mm pilot)

#### 10.9.2 Front-End (FEOL) Process Modules

**Starting material**:
- SOI wafer: 220 nm Si / 2-3 μm BOX / 725 μm Si handle
- Or bulk Si with local oxidation (LOCOS) for isolation
- Resistivity: 10-20 Ω·cm (high-resistivity for low loss)

**Active region definition**:
- Shallow trench isolation (STI): 300-400 nm depth
- Or mesa etch (older flows)
- Critical for waveguide isolation

**Doping implants**:
- p+/n+ for modulators, detectors
- p/n for phase shifters, heaters
- Implant energies: 10-100 keV
- Doses: 1e13-1e15 cm⁻²
- Anneal: 900-1000°C (RTA)

**Germanium epitaxy** (for detectors):
- Selective Ge growth on Si (aspect ratio trapping)
- Ge thickness: 0.5-1.5 μm
- n/p/i doping in-situ or implant
- CMP planarization

**High-k/metal gate** (for advanced modulators):
- HfO₂/Al₂O₃ gate dielectric
- TiN/TaN metal gate
- Enables accumulation-mode modulators

#### 10.9.3 Waveguide Formation (Critical Module)

**Waveguide etch** (most critical for loss):
- Deep UV (193nm) or 193i lithography
- Etch: Cl₂/HBr/HeO₂ plasma
- Sidewall roughness: < 2 nm RMS (target)
- Angle: 85-90° (vertical)
- Depth: 220 nm (full etch) or partial (rib)

**Waveguide dimensions** (standard):
- Strip: 450-500 nm × 220 nm
- Rib: 600-1000 nm × 90 nm slab + 130 nm rib
- Slot: 2×150 nm rails, 100 nm slot

**Corner rounding** (bends):
- Minimum radius: 5 μm (strip), 10 μm (rib)
- Euler bends for lower loss
- Adiabatic transitions

**Etch uniformity** (across 300mm):
- CD uniformity: < ±2 nm (3σ)
- Etch depth uniformity: < ±5 nm
- Sidewall angle: 87-89°

#### 10.9.4 Passive Components Fabrication

**Grating couplers** (fiber I/O):
- Etch: partial (70-100 nm) or full
- Period: 600-650 nm (for 1550 nm)
- Duty cycle: 50-70%
- Apodized for uniform coupling
- SWG (subwavelength grating) for broadband

**Splitters/combiners**:
- Y-junction: adiabatic taper
- MMI: 1×2, 2×2, 1×4, 2×4
- MMI length: 50-200 μm
- Width: 4-20 μm

**Filters**:
- Ring resonators: R = 5-20 μm
- Coupling gap: 100-300 nm
- Bragg gratings: corrugated waveguide
- AWG: phased array (see AWG section)

**Polarization management**:
- TE/TM converters: asymmetric waveguide
- Polarization rotators: asymmetric taper
- Polarization diversity: dual-grating

#### 10.9.5 Active Components Fabrication

**Modulators** (carrier depletion/injection):
- PN/PIN junction across waveguide
- Doping: 1e17-1e18 cm⁻³
- Length: 0.5-2 mm
- Doping implants: tilted, multiple energies
- Salicide (NiSi, PtSi) for contacts

**Ge photodetectors**:
- Ge on Si (ART, selective growth)
- PIN structure: n-Ge / i-Ge / p-Si
- Thickness: 1-1.5 μm
- RTA: 400-500°C (Ge/Si interdiffusion)
- Responsivity: > 0.8 A/W at 1550 nm

**Heaters** (thermal phase shifters):
- TiN, NiCr, or doped Si
- Resistance: 100-1000 Ω
- Power: 10-50 mW per π shift
- Thermal isolation trenches

**Modulators** (electro-optic, hybrid):
- LiNbO₃, BaTiO₃, BTO on Si
- Heterogeneous integration (wafer bonding)
- Poling for EO coefficient

#### 10.9.6 BEOL and Interconnect

**Metal layers** (typical 5-9 layers):
- M1-M2: Local interconnect (tungsten, copper)
- M3-M4: Signal routing (copper)
- M5-M6: Power/ground (thick copper)
- M7-M9: Global routing, RF (thick copper)

**Copper damascene**:
- Barrier: TaN/Ta (15-30 nm)
- Seed: Cu PVD (50-100 nm)
- Plating: Cu electroplating
- CMP: planarization, recess < 20 nm

**Low-k dielectrics**:
- SiCOH (k=2.5-3.0)
- Porous SiCOH (k=2.0-2.5)
- Air gaps (k≈1.0) for critical nets

**Vias and contacts**:
- Via size: 40-80 nm (advanced nodes)
- Aspect ratio: < 5:1
- Barrier/seed: conformal ALD/PVD
- Fill: Cu electroplating or W CVD

**RF/High-speed interconnects**:
- Coplanar waveguide (CPW)
- Ground-signal-ground (GSG)
- Shielded lines for > 50 GHz
- Redistribution layers (RDL) for fan-out

#### 10.9.7 III-V Integration in Foundry Flow

**Option A: Wafer bonding (pre-BEOL)**:
1. III-V wafer prep (epitaxy, fabrication)
2. Bond to Si photonics wafer (hybrid bond)
3. III-V substrate removal (grind, etch)
4. III-V device completion (etch, contacts)
4. BEOL on bonded wafer

**Option B: μTP (post-BEOL)**:
1. Si photonics wafer complete (BEOL done)
2. III-V devices μTP onto wafer
2. RDL for III-V contacts
3. Passivation, test

**Option C: III-V epitaxy on Si (monolithic)**:
- Low-T epitaxy (< 450°C)
- ART, graded buffers
- Limited to GaAs, InGaAs (not InP yet)

**Foundry approach**: Most use Option A or B
- Option A: higher performance, more risk
- Option B: lower risk, CMOS-compatible

#### 10.9.8 Process Control and Yield Management

**In-line metrology**:
- CD-SEM: waveguide CD, etch depth
- Ellipsometry: film thickness, n/k
- Four-point probe: sheet resistance
- Overlay: lithography alignment
- Defect inspection: bright/dark field

**Key control parameters**:
| Parameter | Target | Control Limit |
|-----------|--------|---------------|
| Waveguide width | 500 nm | ±2 nm (3σ) |
| Etch depth | 220 nm | ±5 nm |
| Sidewall angle | 88° | ±1° |
| Ge thickness | 1000 nm | ±20 nm |
| Doping sheet ρ | 500 Ω/□ | ±10% |
| Metal recess | < 20 nm | < 30 nm |

**Statistical Process Control (SPC)**:
- Control charts (X-bar, R)
- Cp/Cpk > 1.33 (target > 1.67)
- Real-time feedback to tools
- Automatic recipe adjustment

**Yield management**:
- Kill ratio analysis (defect Pareto)
- Yield learning curve tracking
- Defect density targets: < 0.1/cm² (killer)
- Parametric yield: > 90% (typical)

#### 10.9.9 Design Rules and PDK

**Waveguide design rules**:
- Min width: 400 nm (strip), 500 nm (rib)
- Min bend radius: 5 μm (strip), 10 μm (rib)
- Min spacing: 200 nm (evanescent coupling)
- Max crossing angle: 15° (low loss)

**Active device rules**:
- Modulator min length: 500 μm
- Heater min width: 1 μm
- Ge detector min area: 10×10 μm²
- Implant block margin: 0.5 μm

**Layout rules**:
- Min metal spacing: 40-80 nm (advanced nodes)
- Min via enclosure: 10-20 nm
- Antenna rules: max area/perimeter ratio
- Density rules: metal fill 30-70%

**PDK contents**:
- Technology file (layer map, rules)
- Device models (SPICE, Verilog-A)
- PCells (parameterized cells)
- DRC/LVS decks
- Simulation models (Compact, TCAD)

#### 10.9.10 Future: 300mm Photonics Foundry Evolution

**Next-generation nodes**:
- 300mm Gen 2: 45nm/28nm CMOS + photonics
- 300mm Gen 3: 16nm/12nm + photonics
- 300mm Gen 4: 7nm/5nm + photonics (co-packaged)

**Advanced integration**:
- 3D photonics (multi-layer waveguides)
- Monolithic III-V (low-T epitaxy)
- CMOS-compatible III-V (GeSn, GeSiSn)
- Cryogenic photonics (for quantum)

**Automation and AI**:
- AI-driven process control
- Digital twin for fab
- Predictive yield modeling
- Automated layout optimization

**Standardization**:
- Open PDK initiatives (SiCloud, OpenPDK)
- Standard cell libraries for photonics
- Interoperable PDKs across foundries
- Photonics design automation (EDA)

---

*End of Piece 9. Next: Piece 10 - Known Good Die (KGD) Testing and Binning Strategy*