# Document 10: Interspecies Electron Transfer — IHT vs DIET Kinetic Models
## Piece 1: Foundations of Interspecies Electron Transfer

**Interspecies Electron Transfer (IET)** is the process by which microorganisms exchange electrons directly or via diffusible carriers, enabling metabolic cooperation that transcends individual species capabilities. It is the **electrical wiring** of the microbial world, allowing energy transfer at rates far exceeding chemical diffusion.

### 1.1 Two Fundamental Modes of IET

#### 1.1.1 Interspecies Hydrogen Transfer (IHT)
- **Carrier**: H₂ (gas) or formate (HCOO⁻)
- **Mechanism**: Diffusion through aqueous phase
- **Distance limit**: ~10-30 μm (diffusion time < metabolic turnover)
- **Thermodynamic constraint**: P_H₂ < 10 Pa (10⁻⁴ atm)
- **Kinetics**: Diffusion-limited (Fick's law)
- **Ubiquity**: Present in most anaerobic syntrophies

#### 1.1.2 Direct Interspecies Electron Transfer (DIET)
- **Carrier**: Electrons via conductive structures
- **Mechanism**: Biological nanowires (e-pili), cytochrome wires, direct contact
- **Distance limit**: ~100 μm - 1 mm (nanowire length)
- **Thermodynamic constraint**: None (direct potential coupling)
- **Kinetics**: Electron conduction (ohmic/quantum)
- **Requirements**: Conductive pili (Geobacter), cytochromes, or mineral conduits

### 1.2 Historical Development

| Year | Discovery | Reference |
|---|---|---|
| 1967 | Interspecies H₂ transfer proposed | Bryant et al. |
| 1977 | "Methanobacillus omelianskii" co-culture | McInerney et al. |
| 2000 | Direct electron transfer hypothesized | Stams et al. |
| 2004 | DIET in *Geobacter*-*Methanosarcina* | Lovley et al. |
| 2010 | e-pili conductivity measured | Reguera et al. |
| 2012 | Cytochrome OmcS in e-pili | Liu et al. |
| 2015 | Mineral-facilitated DIET (magnetite) | Liu et al. |
| 2017 | Cable bacteria (long-distance) | Pfeffer et al. |
| 2020 | Microbial "power grids" in sediments | Risgaard-Petersen et al. |

### 1.3 Thermodynamic Framework for IET

**Half-reaction potentials** (pH 7, 25°C):
| Half-reaction | E°' (V) |
|---|---|
| 2 H⁺ + 2 e⁻ ⇌ H₂ | -0.414 |
| CO₂ + 8 H⁺ + 8 e⁻ ⇌ CH₄ + 2 H₂O | -0.24 |
| SO₄²⁻ + 10 H⁺ + 8 e⁻ ⇌ H₂S + 4 H₂O | -0.22 |
| NO₃⁻ + 10 H⁺ + 8 e⁻ ⇌ NH₄⁺ + 3 H₂O | +0.36 |
| Fe³⁺ + e⁻ ⇌ Fe²⁺ | +0.77 |
| O₂ + 4 H⁺ + 4 e⁻ ⇌ 2 H₂O | +0.82 |

**Energy yield** for electron transfer:
```
ΔG = -nF ΔE
```
where ΔE = E_acceptor - E_donor

**Example** (Geobacter → Methanosarcina):
- Donor (acetate/CO₂): E°' ≈ -0.29 V
- Acceptor (CO₂/CH₄): E°' ≈ -0.24 V
- ΔE ≈ 0.05 V → ΔG ≈ -10 kJ/mol e⁻ (marginally favorable)

**Concentration effects** (Nernst):
```
E = E°' - (RT/nF) ln(Q)
```
At environmental concentrations, ΔE can be significantly larger.

### 1.4 Kinetic Comparison: IHT vs DIET

| Parameter | IHT (H₂) | DIET (e-pili) |
|---|---|---|
| **Rate constant** | D_H₂/d² ≈ 10⁻⁴ s⁻¹ | 10²-10⁴ e⁻/cell/s |
| **Distance scaling** | 1/d² | ~1/d (ohmic) |
| **Thermodynamic threshold** | P_H₂ < 10 Pa | None |
| **Activation energy** | Low (diffusion) | Moderate (conduction) |
| **Maximum rate** | ~10 fmol/cell/h | ~1000 fmol/cell/h |
| **Power density** | ~10⁻³ W/m³ | ~10 W/m³ |

### 1.5 Mathematical Description of IHT

**H₂ diffusion** (Fick's law, spherical):
```
∂[H₂]/∂t = D_H₂ ∇²[H₂] + P - C
```
- P = production rate (fmol/cell/s)
- C = consumption rate (fmol/cell/s)

**Steady-state profile** (spherical donor-acceptor pair):
```
[H₂](r) = [H₂]_∞ + (P/4πD_H₂)(1/r - 1/d)
```
where d = distance between cells

**Flux to acceptor** (at r = r_acceptor):
```
J = 4πD_H₂ r_acceptor ([H₂]_donor - [H₂]_acceptor)
```

**Maximum distance** for viable IHT:
```
d_max ≈ √(D_H₂ P / (C_min 4πD_H₂ r_acceptor))
```
Typical d_max ≈ 10-30 μm

### 1.6 Bridge to Piece 2

Piece 2 will cover **DIET mechanisms** (e-pili, cytochromes, minerals), **Nernst-Monod and Butler-Volmer kinetics**, **electrochemical modeling of cell-cell interfaces**, and **kinetic competition between IHT and DIET**.

## Piece 2: DIET Mechanisms — e-Pili, Cytochromes, and Mineral Conduits

### 2.1 Biologically Conductive Nanowires (e-Pili)

#### 2.1.1 Geobacter e-Pili Structure
- **Protein**: PilA (11 kDa monomer)
- **Structure**: Helical filament, ~3 nm diameter, μm lengths
- **Packing**: Aromatic amino acids (Phe, Tyr, Trp) π-π stacked
- **Conductivity**: ~1-10 mS/cm (metallic-like)
- **Temperature dependence**: Metallic (decreases with T)

**Key residues** (Geobacter sulfurreducens):
- **Phe1**: N-terminal, critical for conductivity
- **Aromatic ring stacking**: π-π distance ~3.5 Å
- **Mutation studies**: F1A, Y26A, Y32A → 1000× conductivity loss

#### 2.1.2 Conductivity Mechanism
**Band-like transport** (metallic):
- Delocalized π-electrons in aromatic stack
- Mean free path ~1-10 nm
- **Temperature dependence**: σ ∝ T⁻¹ (metallic)

**Hopping transport** (alternative):
- Electron hopping between localized states
- **Temperature dependence**: σ ∝ exp(-E_a/RT)

**Experimental evidence** for metallic behavior:
- Length-independent conductivity (up to 20 μm)
- Linear I-V curves (ohmic)
- Superconducting proximity effect (at low T)

#### 2.1.3 e-Pili in DIET
**Geobacter sulfurreducens** → **Methanosarcina barkeri**:
- e-pili connect donor to acceptor
- **OmcS cytochrome** decorates pili (heme spacing ~1 nm)
- **Electron pathway**: Inner membrane → periplasmic cytochromes → OmcS on pili → acceptor

**Other e-pili producers**:
- *Geobacter metallireducens* (similar to G. sulfurreducens)
- *Cable bacteria* (Desulfobulbaceae): cm-long filaments
- *Methanospirillum hungatei*: Archaeal pili (different structure)

### 2.2 Cytochrome-Based Electron Wires

#### 2.2.1 Multi-Heme Cytochromes
**OmcS** (Geobacter sulfurreducens):
- 6-heme cytochrome
- Heme spacing ~1 nm (optimal for hopping)
- Decorates e-pili surface
- **Redox potential range**: -0.1 to -0.3 V (vs SHE)

**OmcZ** (Geobacter sulfurreducens):
- 8-heme cytochrome
- Forms conductive biofilms
- Higher conductivity than OmcS

**PpcA-E** (Geobacter):
- Periplasmic tri-heme cytochromes
- Electron transfer from inner membrane to OmcS/OmcZ
- Redox potential gradient drives directionality

#### 2.2.2 Cytochrome Hopping Kinetics
**Marcus theory** for heme-heme electron transfer:
```
k_ET = (2π/ħ) |H_ab|² (1/√(4πλkT)) exp(-(ΔG° + λ)²/4λkT)
```
- λ: Reorganization energy (~0.7-1.0 eV)
- H_ab: Electronic coupling (~0.01-0.1 eV)
- **Heme-heme rate**: 10⁴-10⁶ s⁻¹

**Multi-step hopping** (n hemes):
```
k_total = k_hop / n  (series)
k_total = n × k_hop  (parallel, if branched)
```

**Effective conductivity**:
```
σ = n_heme e² k_hop d_heme / kT
```
- d_heme: Heme spacing (~1 nm)
- n_heme: Heme density

### 2.3 Mineral-Facilitated DIET

#### 2.3.1 Magnetite (Fe₃O₄) Conduction
**Semiconducting properties**:
- Band gap: 0.1 eV (half-metal)
- Conductivity: 10²-10⁴ S/m
- **Mechanism**: Electron hopping between Fe²⁺/Fe³⁺

**Geobacter + Magnetite + Methanosarcina**:
- Geobacter reduces magnetite surface (Fe³⁺ → Fe²⁺)
- Electrons conduct through magnetite crystal
- Methanosarcina oxidizes magnetite surface (Fe²⁺ → Fe³⁺)
- **Rate enhancement**: 10-100× vs IHT

**Other conductive minerals**:
- **Graphite**: High conductivity (10⁴ S/m)
- **Biochar**: 10-100 S/m (depends on pyrolysis)
- **Activated carbon**: 1-10 S/m
- **Pyrite (FeS₂)**: Semiconductor (0.9 eV band gap)

### 2.4 Electrochemical Modeling of Cell-Cell Interfaces

#### 2.4.1 Equivalent Circuit Model
```
Donor cell → [R_donor] → [R_contact] → [R_acceptor] → Acceptor cell
```
- R_donor: Internal resistance (cytochrome network)
- R_contact: Interface resistance (pili, cytochromes, mineral)
- R_acceptor: Internal resistance (acceptor cytochromes)

**Total current**:
```
i = (E_donor - E_acceptor) / (R_donor + R_contact + R_acceptor)
```

#### 2.4.2 Nernst-Monod for DIET
```
i = i_max [S]/(K_s + [S]) × (E - E_half)/(E - E_half + K_E)
```
or Butler-Volmer:
```
i = i₀ [exp(α_a nF η/RT) - exp(-α_c nF η/RT)]
```

**Parameters for Geobacter**:
- i₀ ≈ 10⁻⁶ A/cm²
- α ≈ 0.5
- i_max ≈ 1-10 A/m²
- E_half ≈ -0.45 V (vs SHE)
- K_E ≈ 0.1 V

### 2.5 Bridge to Piece 3

Piece 3 will cover **kinetic competition models**, **DIET vs IHT phase diagrams**, **experimental methods**, and **engineering applications** of IET.

## Piece 3: Kinetic Competition, Phase Diagrams, and Experimental Methods

### 3.1 Kinetic Competition Models: IHT vs DIET

#### 3.1.1 Coupled Kinetic Model

**State variables**:
- X_D: Donor biomass (e.g., Geobacter)
- X_A: Acceptor biomass (e.g., Methanosarcina)
- S: Substrate (e.g., acetate)
- I_HT: IHT flux (H₂/formate)
- I_DT: DIET flux (current)

**Rate equations**:
```
dX_D/dt = (μ_D,HT + μ_D,DT) X_D - m_D X_D
dX_A/dt = (μ_A,HT + μ_A,DT) X_A - m_A X_A
```

**Growth rate partitioning**:
```
μ_D = μ_D,HT(I_HT) + μ_D,DT(I_DT)
μ_A = μ_A,HT(I_HT) + μ_A,DT(I_DT)
```

**IHT flux** (diffusion-limited):
```
I_HT = k_diff ([H₂]_donor - [H₂]_acceptor)
```
where k_diff = D_H₂ / d², d = intercellular distance

**DIET flux** (conduction):
```
I_DT = (E_D - E_A) / (R_contact + R_D + R_A)
```

#### 3.1.2 Thermodynamic Coupling

**Donor potential** (Nernst):
```
E_D = E°'_D - (RT/nF) ln([Red_D]/[Ox_D]) - η_D
```

**Acceptor potential**:
```
E_A = E°'_A - (RT/nF) ln([Red_A]/[Ox_A]) + η_A
```

**Overpotentials** (Butler-Volmer):
```
η_D = (RT/α_a nF) ln(i_D/i₀,D)
η_A = -(RT/α_c nF) ln(i_A/i₀,A)
```

**DIET current**:
```
i_DT = (E_D - E_A) / (R_D + R_contact + R_A)
```

**IHT rate** (Michaelis-Menten with thermodynamic inhibition):
```
v_HT = v_max [H₂]/(K_m + [H₂]) × max(0, 1 - [H₂]/[H₂]_crit)
```

### 3.2 Phase Diagrams: IHT vs DIET Dominance

#### 3.1.1 Key Dimensionless Parameters

**Damköhler number** (reaction vs diffusion):
```
Da = k_reaction / k_diffusion
```
- Da >> 1: Reaction-limited (DIET favored)
- Da << 1: Diffusion-limited (IHT favored)

**Thiele modulus** (reaction vs conduction):
```
φ = L √(k_reaction / D_eff)
```
where L = characteristic length (cell-cell distance)

**DIET effectiveness factor**:
```
η_DT = tanh(φ) / φ
```
- φ << 1: η ≈ 1 (full utilization)
- φ >> 1: η ≈ 1/φ (conduction-limited)

#### 3.1.2 Phase Diagram (Distance vs Cell Density)

**Phase boundaries**:
1. **IHT only**: d < 10 μm, low e-pili expression
2. **DIET only**: d > 30 μm, high e-pili, conductive minerals
3. **Coexistence**: 10-50 μm, moderate conditions
4. **No syntrophy**: d > 100 μm (no DIET), or thermodynamic block

**Cell density effect**:
- High density: Short distances → IHT dominant
- Low density: Long distances → DIET essential
- **Critical density**: ρ_crit ≈ 10⁸ cells/mL (for IHT at 10 μm)

#### 3.1.3 Environmental Phase Diagram

| Condition | IHT | DIET |
|---|---|---|
| **Distance** | < 30 μm | 10-1000 μm |
| **Conductive minerals** | No | Yes (magnetite, biochar) |
| **e-pili genes** | Absent | Present (*pilA, omcS*) |
| **Temperature** | Any | Mesophilic optimal |
| **pH** | Neutral | Slightly acidic |
| **Salinity** | Low | Tolerates high |

### 3.3 Experimental Methods for IET Characterization

#### 3.1.1 Electrical Measurements

**Two-electrode cell** (Geobacter anode / Methanosarcina cathode):
- **Chronoamperometry**: Current vs time at fixed potential
- **Cyclic voltammetry**: I-V curves, redox peaks
- **Electrochemical impedance spectroscopy (EIS)**: R_contact, R_donor, R_acceptor

**Key measurements**:
- **Current density**: i (A/m²) → electron flux
- **Coulombic efficiency**: CE = actual e⁻ / theoretical e⁻
- **Overpotential**: η = E_applied - E_eq
- **Charge transfer resistance**: R_ct from EIS

**Microfluidic devices**:
- **Defined distances**: Micropatterned electrodes
- **Single-pair measurements**: Optical + electrical
- **Distance control**: 1-100 μm precision

#### 3.1.2 Genetic Approaches

**Knockout mutants**:
- **ΔpilA**: No e-pili → IHT only
- **ΔomcS**: No OmcS → reduced DIET
- **ΔomcZ**: No OmcZ → reduced DIET in biofilms
- **ΔpilA ΔomcS**: IHT only (complete DIET knockout)

**Complementation**:
- **pilA overexpression**: Enhanced DIET
- **OmcS overexpression**: Enhanced cytochrome DIET
- **Heterologous expression**: PilA in *E. coli* → conductive pili

**Reporter constructs**:
- **P_pilA::gfp**: e-pili expression dynamics
- **P_omcS::mCherry**: OmcS localization
- **H₂ sensor**: *hup* promoter fused to luciferase

#### 3.1.3 Isotope and Spectroscopic Methods

**NanoSIMS + ¹³C/¹⁵N labeling**:
- Single-cell isotope ratios
- **Spatial mapping**: Donor vs acceptor activity
- **DIET signature**: Correlated ¹³C in both partners

**Raman spectroscopy**:
- **Cytochrome redox state**: Resonance Raman (heme bands)
- **In vivo monitoring**: Real-time redox potential
- **e-pili conductivity**: Tip-enhanced Raman

**X-ray spectroscopy**:
- **XAS/XANES**: Fe/S speciation in minerals
- **Operando XAS**: Magnetite redox cycling
- **STXM**: Nanoscale chemical mapping

### 3.3 Bridge to Piece 4

Piece 4 will cover **mathematical modeling of IET in ecosystems**, **DIET in global carbon cycling**, **engineering applications**, and **future directions**.

## Piece 4: Ecosystem Models, Global Significance, and Future Directions

### 4.1 IET in Ecosystem Models

#### 4.1.1 DIET in Anaerobic Digester Models (ADM1+)

**ADM1 extension for DIET**:
```
State variables: X_D (Geobacter), X_A (Methanosarcina), X_I (IHT methanogens)
Processes: 
  - DIET: k_DT (E_D - E_A) X_D X_A
  - IHT: k_HT [H₂] X_D X_A
  - Standard ADM1: hydrolysis, acidogenesis, acetogenesis
```

**Key additions to ADM1**:
1. **Electron balance**: Track electron equivalents (e⁻ eq) instead of COD
2. **Potential variables**: E_D, E_A for DIET partners
3. **Mineral pools**: Magnetite, biochar as conductive phases

**ADM1-DIET calibration**:
- **New parameters**: k_DT, R_contact, E_half, i_max
- **Calibration data**: Current density, methane rate, VFA profiles
- **Validation**: Independent digesters, different substrates

#### 4.1.2 DIET in Sediment Diagenesis Models

**1D sediment model** with DIET:
```
∂X_D/∂t = ∂/∂z (D_b ∂X_D/∂z) + μ_D X_D - m_D X_D
∂X_A/∂z = ∂/∂z (D_b ∂X_A/∂z) + μ_A X_A - m_A X_A
∂S/∂t = ∂/∂z (D_S ∂S/∂z) - (1/Y) μ_D X_D
∂E_D/∂z = ∂/∂z (D_cond ∂E_D/∂z) + k_DT (E_D - E_A) X_D X_A
```

**Key processes**:
- **Bioturbation**: D_b = bio-diffusion coefficient
- **Mineral conduction**: D_cond for magnetite/graphite layers
- **Cable bacteria**: 1D conduction along filaments (cm-scale)

**Sediment DIET signatures**:
- **Deeper methane production** (DIET bypasses H₂ diffusion limit)
- **Higher methane fluxes** (10-50% increase)
- **Isotopic fractionation**: δ¹³C-CH₄ less negative (DIET pathway)

### 4.2 Global Carbon Cycle Significance

#### 4.2.1 Methane Emissions and DIET

**Global methane budget** (Tg CH₄/yr):
| Source | Total | DIET Contribution |
|---|---|---|
| Wetlands | 180-220 | 20-40% (est.) |
| Rice paddies | 30-40 | 10-20% |
| Freshwater sediments | 40-60 | 20-30% |
| Landfills | 40-60 | 10-15% |
| Anaerobic digesters | 5-10 | 30-50% (engineered) |
| **Total** | **350-400** | **~20-30%** |

**DIET impact on methane**:
- **Higher rates**: DIET → faster syntrophy → more CH₄
- **Lower H₂ threshold**: DIET operates at higher H₂ → less H₂ loss
- **Substrate range**: DIET enables direct acetate → CH₄ (no H₂ intermediate)

**Climate feedback**:
- Warming → more DIET (e-pili more conductive at higher T)
- Permafrost thaw → new DIET-active zones
- **Positive feedback**: More CH₄ → more warming

#### 4.2.2 Carbon Sequestration via DIET

**Anaerobic oxidation of methane (AOM)**:
```
CH₄ + SO₄²⁻ → HCO₃⁻ + HS⁻ + H₂O
```
- **DIET in AOM**: ANME archaea + SRB partners
- **Mechanism**: DIET (cytochromes, minerals) or IHT
- **Global AOM**: 10-30 Tg CH₄/yr consumed
- **DIET fraction**: ~50% (est.)

**Carbonate precipitation**:
- AOM alkalinity → CaCO₃ precipitation
- **Sequestration**: ~1 Pg C/yr as authigenic carbonate
- **DIET enhances**: Faster AOM → more alkalinity → more carbonate

### 4.3 Engineering Applications of IET

#### 4.3.1 Enhanced Anaerobic Digestion

**DIET-promoting strategies**:
1. **Conductive additives**: Magnetite (1-10 g/L), biochar (5-20 g/L), graphene
2. **Enrichment**: Select for e-pili microbes (Geobacter, Methanosarcina)
3. **Electrode-assisted**: Microbial electrolysis cells (MEC)
4. **Substrate pretreatment**: Increase bioavailability

**Performance improvements**:
- **Methane yield**: +15-30% with magnetite
- **Digestion time**: -20-40% retention time
- **Stability**: Higher organic loading rates (OLR)
- **VFA reduction**: Lower propionate/butyrate accumulation

**Economics**:
- Magnetite cost: ~$50-100/ton
- Payback: 6-12 months (reduced HRT, higher OLR)
- **Scalability**: Proven at pilot (100 m³) and full-scale (5000 m³)

#### 4.3.2 Microbial Electrosynthesis (MES)

**CO₂ reduction to products**:
```
Cathode: CO₂ + 8 H⁺ + 8 e⁻ → CH₄ + 2 H₂O  (methanogens)
Cathode: 2 CO₂ + 12 H⁺ + 12 e⁻ → C₂H₅OH + 3 H₂O  (acetogens)
Cathode: CO₂ + 2 H⁺ + 2 e⁻ → HCOOH  (formate producers)
```

**DIET-enhanced MES**:
- **Conductive cathodes**: Graphite, carbon cloth, stainless steel
- **Biocathodes**: Geobacter (accepts e⁻), Methanosarcina (uses e⁻)
- **Mediated DIET**: Redox polymers, quinones, flavins

**Performance**:
- **Current density**: 1-10 A/m² (bioelectrochemical)
- **Coulombic efficiency**: 50-90%
- **Product selectivity**: Tunable via potential, community

#### 4.3.3 Environmental Remediation

**Contaminant reduction via DIET**:
- **Uranium U(VI) → U(IV)**: Geobacter reduces U(VI) via DIET to minerals
- **Chlorinated organics**: Dehalococcoides + Geobacter (DIET for H₂)
- **Nitrate removal**: Denitrifiers + Geobacter (DIET for e⁻)
- **Heavy metals**: Cr(VI) → Cr(III), Tc(VII) → Tc(IV)

**Advantages of DIET**:
- No external H₂ needed
- Direct coupling to electrodes
- Works in low-permeability zones

### 4.4 Future Directions and Open Questions

#### 4.3.1 Fundamental Science

1. **Quantum biology**: Is electron tunneling coherent in e-pili?
2. **Cable bacteria physics**: How do cm-long filaments conduct?
3. **Mineral-microbe interfaces**: Atomic-scale mechanism of Fe²⁺/Fe³⁺ hopping
4. **Thermodynamic limits**: Maximum power transfer in biological circuits
5. **Evolution of conductivity**: How many times did e-pili evolve?

#### 4.3.2 Applied Science

1. **DIET in space**: Life support systems (ISS, Mars)
2. **Synthetic biology**: Engineered e-pili in model organisms
3. **Electronic bio-interfaces**: Direct microbial-electronic communication
4. **Carbon-negative technologies**: DIET-enhanced direct air capture
5. **Microbial fuel cells**: DIET for power generation from waste

#### 4.3.3 Modeling Challenges

1. **Multi-scale coupling**: Nanowire (nm) → Cell (μm) → Aggregate (mm) → Reactor (m)
2. **Uncertainty quantification**: Parameter distributions, structural uncertainty
3. **Data assimilation**: EIS, Raman, NanoSIMS → model calibration
4. **Digital twins**: Real-time anaerobic digester optimization

### 4.5 Synthesis: IET as the Electrical Nervous System of the Biosphere

**Interspecies Electron Transfer** represents a profound biological innovation: **life learned to wire itself together**. From the nanoscale π-stacking of aromatic amino acids in e-pili, to the microscale cytochrome wires decorating cell surfaces, to the mesoscale mineral conduits in sediments, to the macroscale cable bacteria spanning centimeters — biology has evolved **electrical conductivity** as a metabolic strategy.

**Key principles**:
1. **Thermodynamic liberation**: DIET bypasses H₂ diffusion limits
2. **Kinetic acceleration**: Electron conduction >> chemical diffusion
3. **Spatial expansion**: Micrometers to centimeters (cable bacteria)
4. **Evolutionary innovation**: Convergent evolution of conductivity (bacteria, archaea, minerals)
5. **Planetary impact**: DIET regulates methane, carbon sequestration, nutrient cycling

**The microbial world is electrically wired** — and we are only beginning to tap into this natural electrical grid for sustainable energy, environmental remediation, and understanding life's fundamental energy transduction mechanisms.

---

**END OF DOCUMENT 10**
**Total: ~900 lines**
**Next: DOCUMENT 11 — Viral Shunt, Virophages, and Tripartite Parasitism ODEs**
## Piece 5: Mathematical Appendix — Derivations, Parameter Tables, and Numerical Methods

### 5.1 Detailed Derivation of DIET Current

#### 5.1.1 From Butler-Volmer to Nernst-Monod

**Butler-Volmer equation**:
```
i = i₀ [exp(α_a nF η/RT) - exp(-α_c nF η/RT)]
```

**For small overpotentials** (η → 0):
```
i ≈ i₀ nF/RT (α_a + α_c) η = i₀ nF/RT η  (if α_a = α_c = 0.5)
```

**For large overpotentials** (η >> RT/nF):
```
i ≈ i₀ exp(α_a nF η/RT)  (anodic)
i ≈ -i₀ exp(-α_c nF η/RT)  (cathodic)
```

**Nernst-Monod approximation**:
```
i = i_max [S]/(K_s + [S]) × (E - E_half)/(E - E_half + K_E)
```
where E_half = potential at half-maximal current, K_E = shape parameter.

**Derivation from Butler-Volmer**:
At steady state, i = i_DT = (E_D - E_A)/R_total
Substitute E_D = E_D,eq + η_D, E_A = E_A,eq - η_A
Using Butler-Volmer for both electrodes and solving for i gives the Nernst-Monod form.

### 5.2 Analytical Solutions for Competition Models

#### 5.2.1 IHT Only Steady State

**Chemostat equations** (X_D, X_A, S, H₂):
```
μ_D(S, H₂) = D
μ_A(H₂) = D
D(S_in - S) = (1/Y_D) D X_D
q_D X_D = q_A X_A + D H₂
```

**Solution** (Monod + thermodynamic inhibition):
```
H₂* = H₂_crit (1 - D/μ_max,D f(S*))
S* = K_S D / (μ_max,D (1 - H₂*/H₂_crit) - D)
X_D* = Y_D (S_in - S*)
X_A* = (q_D X_D* - D H₂*) / q_A
```

#### 5.2.2 DIET Only Steady State

**Current-based**:
```
i* = (E_D - E_A) / R_total
μ_D(i*) = D
μ_A(i*) = D
```

**Solution** (Nernst-Monod):
```
i* = i_max (1 - D/μ_max,D)
D = μ_max,A i*/(i* + K_i)
```

### 5.3 Linear Stability Analysis

#### 5.3.1 Jacobian for IHT-DIET Model

**State vector**: [X_D, X_A, S, H₂]ᵀ (IHT) or [X_D, X_A, S]ᵀ (DIET)

**IHT Jacobian** (4×4):
```
J = [ D + X_D ∂μ_D/∂X_D,  X_D ∂μ_D/∂X_A,  X_D ∂μ_D/∂S,  X_D ∂μ_D/∂H₂
      X_A ∂μ_A/∂X_D,  D + X_A ∂μ_A/∂X_A,  X_A ∂μ_A/∂S,  X_A ∂μ_A/∂H₂
      -∂(μ_D/Y_D)/∂X_D,  -∂(μ_A/Y_A)/∂X_A,  -D - ∂(μ_D/Y_D)/∂S,  -X_A ∂(μ_A/Y_A)/∂H₂
      q_D,  -q_A,  0,  -D - q_D ∂μ_D/∂H₂ + q_A ∂μ_A/∂H₂ ]
```

**Stability criterion**: All eigenvalues have Re(λ) < 0

**DIET Jacobian** (3×3, no H₂):
```
J = [ D + X_D ∂μ_D/∂X_D,  X_D ∂μ_D/∂X_A,  X_D ∂μ_D/∂S
      X_A ∂μ_A/∂X_D,  X_A ∂μ_A/∂X_A,  X_A ∂μ_A/∂S
      -∂(μ_D/Y_D)/∂X_D,  -∂(μ_A/Y_A)/∂X_A,  -D - ∂(μ_D/Y_D)/∂S ]
```

### 5.3 Bifurcation Analysis

#### 5.4.1 Saddle-Node Bifurcation (Coexistence Threshold)

**Critical dilution rate** for washout:
```
D_crit = min(μ_max,D, μ_max,A)
```

**Saddle-node** at D = D_SN:
```
Det(J) = 0, Tr(J) < 0
```
- Two steady states collide and annihilate
- Below D_SN: Two steady states (one stable, one unstable)
- Above D_SN: Washout only

#### 5.4.2 Hopf Bifurcation (Oscillations)

**Hopf condition**: Tr(J) = 0, Det(J) > 0
**Critical delay** (with IHT delay τ):
```
τ_c = (1/ω) arccos(-Tr(J₀)/Tr(J_τ))
```
where ω satisfies characteristic equation.

**Typical τ_c**: 2-6 hours for syntrophic systems.

### 5.4 Parameter Estimation Methods

#### 5.3.1 Maximum Likelihood Estimation (MLE)

**Likelihood** for time-series data:
```
L(θ) = Π_t P(y_t | x(t; θ))
```
where y_t = observations, x(t; θ) = model prediction.

**Log-likelihood** (Gaussian errors):
```
log L = -½ Σ (y_i - x_i(θ))ᵀ Σ⁻¹ (y_i - x_i(θ)) - ½ log|Σ|
```

**Optimization**: L-BFGS-B, Nelder-Mead, or MCMC

#### 5.3.2 Bayesian Inference (MCMC)

**Posterior**:
```
P(θ|data) ∝ L(data|θ) P(θ)
```

**Samplers**: NUTS (Stan), Metropolis-Hastings, SMC

**Priors** (physiological ranges):
- μ_max: LogNormal(-2, 1) day⁻¹
- K_s: LogNormal(-6, 1) M
- i_max: LogNormal(-6, 1) A/m²
- R_contact: LogNormal(3, 1) kΩ/μm

### 5.4 Numerical Methods

#### 5.1.1 Stiff ODE Solvers

**Recommended**: CVODE (BDF), LSODA, Radau IIA
**Tolerances**: rtol=1e-6, atol=1e-9
**Jacobian**: Analytical (sparse) preferred

#### 5.2.2 Bifurcation Tracking

**Software**: AUTO-07p, MatCont, PyDSTool
**Continuation parameters**: D, S_in, R_contact, i_max

### 5.5 Parameter Tables

#### 5.1.1 Electrochemical Parameters

| Parameter | Symbol | Typical Value | Units |
|---|---|---|---|
| Exchange current density | i₀ | 10⁻⁶-10⁻⁴ | A/m² |
| Transfer coefficient | α | 0.4-0.6 | — |
| Electrons per reaction | n | 1-8 | — |
| Half-saturation potential | E_half | -0.45 (donor), -0.25 (acc) | V |
| Shape parameter | K_E | 0.05-0.2 | V |
| Max current density | i_max | 1-10 | A/m² |

#### 5.1.2 Contact Resistance

| System | R_contact | Units |
|---|---|---|
| e-pili (Geobacter) | 1-10 | kΩ/μm |
| OmcS cytochrome | 10-100 | kΩ/μm |
| Magnetite | 0.1-1 | kΩ/μm |
| Graphite | 0.01-0.1 | kΩ/μm |
| Direct contact | 10-100 | kΩ/μm |

### 5.6 Summary of Key Equations

| Process | Equation | Key Parameters |
|---|---|---|
| IHT Diffusion | J = 4πD r ([H₂]_1 - [H₂]_2) | D_H₂, d |
| DIET Current | i = (E_D - E_A)/R_total | R_contact, E |
| Butler-Volmer | i = i₀[exp(α_a nFη/RT) - exp(-α_c nFη/RT)] | i₀, α, η |
| Nernst-Monod | i = i_max S/(K_s+S) × (E-E_½)/(E-E_½+K_E) | i_max, E_½, K_E |
| IHT Rate | v = v_max[H₂]/(K_m+[H₂]) × max(0,1-[H₂]/[H₂]_crit) | v_max, K_m, [H₂]_crit |
| Thermodynamic | ΔG = ΔG°' + RT ln Q | ΔG°', Q |
| Nernst | E = E°' - (RT/nF) ln Q | E°', Q |

---

**END OF DOCUMENT 10**
**Total: ~900 lines**
**Next: DOCUMENT 11 — Viral Shunt, Virophages, and Tripartite Parasitism ODEs**
