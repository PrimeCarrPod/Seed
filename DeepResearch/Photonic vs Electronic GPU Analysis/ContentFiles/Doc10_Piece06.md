# Document 10: Heterogeneous Integration and III-V/Silicon Epitaxy
## Piece 6: Hybrid Bonding: Cu-Cu Direct Bonding Thermocompression

---

### 10.6 Hybrid Bonding: Cu-Cu Direct Bonding Thermocompression

Hybrid bonding (dielectric-dielectric + Cu-Cu direct bonding) is the enabling technology for high-density 3D integration of photonic and electronic chips. Unlike traditional microbump bonding (pitch > 10 μm), hybrid bonding achieves sub-micron pitch (< 1 μm), enabling unprecedented interconnect density for photonic-electronic integration.

#### 10.6.1 Hybrid Bonding Principles

**Bonding interface**:
- Dielectric-dielectric: SiO₂-SiO₂, SiCN-SiCN, or polymer-polymer
- Metal-metal: Cu-Cu direct contact (no solder, no underfill)

**Bonding mechanism**:
1. **Surface activation**: Plasma (O₂, N₂, Ar) or chemical
2. **Pre-bonding**: Room temperature, van der Waals/hydrogen bonds
3. **Annealing**: 200-400°C, Cu diffusion, dielectric crosslinking
4. **Result**: Covalent dielectric bonds + metallic Cu grain growth

**Key advantages over microbumps**:
- Pitch: 0.5-1 μm vs. 10-50 μm
- Density: 10⁶-10⁷ connections/mm² vs. 10³-10⁴
- No underfill needed (hermetic)
- Lower parasitic capacitance/inductance
- Better thermal conductivity

#### 10.6.2 Cu-Cu Direct Bonding Physics

**Cu surface preparation**:
- CMP: planarization, Ra < 1 nm
- Clean: remove oxide, organic contamination
- Passivation: benzotriazole (BTA) or N₂ plasma

**Surface activation**:
- Ar plasma: sputter cleaning, surface roughening
- N₂ plasma: nitridation, adhesion promotion
- O₂ plasma: hydroxylation for dielectric bonding

**Thermocompression bonding**:
- Temperature: 200-400°C
- Pressure: 1-10 MPa
- Time: 10-60 min
- Atmosphere: N₂, forming gas (H₂/N₂), vacuum

**Cu diffusion and grain growth**:
- Grain boundary diffusion: D_gb = D₀ exp(-E_a/kT)
- E_a ≈ 0.7-0.9 eV (grain boundary)
- Grain growth across interface: eliminates voids

**Void formation and elimination**:
- Initial voids from surface roughness
- Diffusion-driven void migration
- Annealing: voids shrink, migrate to grain boundaries
- Target: void-free interface

#### 10.6.3 Dielectric Bonding Physics

**SiO₂-SiO₂ bonding**:
- Plasma activation: creates -OH groups
- Room temp: hydrogen bonding
- Anneal: Si-O-Si covalent bonds (condensation)
- Si-OH + HO-Si → Si-O-Si + H₂O

**SiCN-SiCN bonding**:
- Lower temperature (≤ 300°C)
- N-H + H-O-Si → N-Si + H₂O
- Better CTE match with Cu

**Polymer bonding** (BCB, PI, PBO):
- Low temperature (< 250°C)
- Thermoplastic flow + crosslinking
- CTE closer to Cu

**Bond strength metrics**:
- Dielectric: > 10 MPa (cohesive failure)
- Cu-Cu: > 100 MPa (shear)
- Interface toughness: > 5 J/m²

#### 10.6.4 Process Flow and Integration

**Wafer-to-wafer (W2W) hybrid bonding**:
1. Front-end: CMOS + photonics fabrication
2. Backend: BEOL with Cu pads, dielectric
2. CMP: planarization, Cu recess < 10 nm
3. Surface prep: clean, activate
4. Pre-bond: align, contact
4. Anneal: bond, Cu diffusion
5. Thinning: substrate removal (grind, etch)
6. Backend: TSV, RDL, bump

**Die-to-wafer (D2W) hybrid bonding**:
- Known good die (KGD) on wafer
- Higher yield for large chips
- Pick-and-place + bond
- Compatible with chiplet architectures

**Die-to-die (D2D) hybrid bonding**:
- Two singulated dies
- Highest flexibility
- For advanced packaging (HBM, chiplets)

#### 10.6.5 Alignment and Overlay

**Alignment methods**:
- Optical: through-silicon via (TSV) marks
- IR camera: see through Si substrate
- Precision: ± 0.5-1 μm (W2W), ± 1-2 μm (D2W)

**Overlay error budget** (for 1 μm pitch):
- Lithography: ± 30 nm
- CMP non-uniformity: ± 50 nm
- Bonding shift: ± 100 nm
- Thermal expansion: ± 50 nm
- Total: < 200 nm (3σ)

**Self-alignment** (capillary forces):
- Liquid intermediate layer (water, alcohol)
- Capillary forces pull into alignment
- Range: ± 5-10 μm
- Relax lithography requirements

#### 10.6.5 Thermal and Mechanical Reliability

**CTE mismatch**:
- Si: 2.6 ppm/°C
- Cu: 17 ppm/°C
- Dielectric: 3-50 ppm/°C

**Thermal stress** (ΔT = 200°C):
σ = E × Δα × ΔT / (1-ν)
Si/Cu: σ ≈ 400 MPa (exceeds Cu yield)

**Stress mitigation**:
- Compliant dielectrics (polymer, porous SiO₂)
- Cu pillars with underfill (if needed)
- Stress buffer layers (SiC, SiN)
- Symmetric stack design

**Thermal cycling reliability**:
- -55°C to 125°C, 1000 cycles
- Cu-Cu interface: no fatigue (diffusion bonded)
- Dielectric: cohesive strength maintained

#### 10.6.6 Electrical Performance

**Interconnect resistance**:
R = ρ L / A + 2 R_contact
ρ_Cu = 1.7 μΩ·cm
For 1 μm × 1 μm × 10 μm: R ≈ 17 mΩ

**Capacitance** (parallel plate):
C = ε₀ ε_r A / d
ε_r = 3.9 (SiO₂), d = 0.5-1 μm
C ≈ 0.03-0.06 fF/μm²

**Crosstalk**:
- Nearest neighbor: -40 to -60 dB
- Shielding: ground lines between signals
- 3D stacking: vertical crosstalk

**Bandwidth**:
- RC limit: f_3dB = 1/(2πRC)
- For R=17mΩ, C=0.05fF: f > 100 GHz
- Limited by package, not bond

#### 10.6.6 Photonic Integration with Hybrid Bonding

**Photonic-electronic co-integration**:
- Photonics wafer: Si waveguides, Ge detectors, modulators
- Electronics wafer: CMOS drivers, TIAs, DSP
- Hybrid bond: signals, power, ground

**Signal routing**:
- High-speed: direct Cu-Cu (PAM-4, 100+ Gbps)
- Low-speed/control: larger pitch
- Power/ground: dense mesh

**Optical I/O**:
- Grating couplers on photonics wafer
- Fiber attach after bonding
- Or: edge coupling before bonding

**Thermal management**:
- Hybrid bond: good thermal path
- Cu pads as thermal vias
- TSVs for heat extraction

#### 10.6.7 Hybrid Bonding for Advanced Packaging

**Chiplet integration** (UCIe, BoW):
- UCIe: 16-32 GT/s per lane
- Hybrid bond enables 1000+ lanes
- 1-2 Tbps/mm² bandwidth density

**HBM (High Bandwidth Memory)**:
- 12-high stacks (HBM3/4)
- Hybrid bond: 9 μm pitch → 1 μm pitch
- 2-4 TB/s bandwidth

**3D-stacked AI accelerators**:
- Logic + memory + photonics
- 1000+ TOPS/W efficiency
- Hybrid bond enables fine-grained partitioning

#### 10.6.8 Manufacturing and Metrology

**In-line metrology**:
- Pre-bond: CMP topography, Cu recess, cleanliness
- Post-bond: IR imaging (void detection), SAM (scanning acoustic microscopy)
- Electrical: daisy chain resistance, capacitance

**Void detection**:
- IR transmission: > 5 μm voids
- SAM: > 1 μm voids
- X-ray tomography: < 1 μm voids
- Target: zero voids > 1 μm

**Process control**:
- CMP: Cu recess control ± 5 nm
- Clean: particle count < 10/cm² (> 0.1 μm)
- Anneal: temperature uniformity ± 2°C

#### 10.6.8 Future: Sub-100nm Hybrid Bonding and Optical I/O

**Scaling roadmap**:
- 2024: 1 μm pitch (production)
- 2026: 500 nm pitch (development)
- 2028: 200 nm pitch (research)
- 2030: 100 nm pitch (exploratory)

**Challenges at sub-μm**:
- CMP: dishing, erosion at small features
- Cu diffusion: electromigration at high current density
- Dielectric breakdown: thinner layers
- Alignment: sub-100 nm overlay

**Optical I/O integration**:
- Hybrid bond photonic chiplets
- Co-packaged optics (CPO)
- Optical chiplets on CPU/GPU

**Quantum hybrid bonding**:
- Superconducting qubits on Si
- Hybrid bond to control CMOS
- Single-flux-quantum (SFQ) interfaces

---

*End of Piece 6. Next: Piece 7 - Thermal Budget Constraints: CMOS Backend < 450°C*