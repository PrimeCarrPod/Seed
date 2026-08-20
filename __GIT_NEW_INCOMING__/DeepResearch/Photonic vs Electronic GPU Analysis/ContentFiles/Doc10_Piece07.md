# Document 10: Heterogeneous Integration and III-V/Silicon Epitaxy
## Piece 7: Thermal Budget Constraints: CMOS Backend < 450°C

---

### 10.7 Thermal Budget Constraints: CMOS Backend < 450°C

The thermal budget is a fundamental constraint in heterogeneous integration of III-V photonics with CMOS electronics. CMOS backend processes (BEOL) are typically limited to < 450°C to prevent dopant diffusion, silicide agglomeration, and dielectric degradation. This constraint fundamentally limits the III-V epitaxial growth and processing temperatures, driving the need for low-temperature epitaxy, wafer bonding, and transfer printing techniques.

#### 10.7.1 CMOS Thermal Budget Limits

**BEOL temperature limits**:
- **Interconnect**: Cu Damascene < 400°C (CMP, barrier deposition)
- **Low-k dielectric**: < 400°C (porous SiO₂, SiCOH)
- **Barrier/liner**: TaN, Ru < 400°C (ALD, PVD)
- **Silicide**: NiSi, CoSi₂ < 500°C (but BEOL < 450°C)
- **Contact**: W plug < 450°C (CVD)

**Critical failure mechanisms above 450°C**:
1. **Dopant diffusion**: B, P, As diffusion in Si
   - Junction broadening, leakage increase
   - B diffusion: D = 0.76 exp(-3.46 eV/kT) cm²/s
   - At 500°C: significant diffusion in minutes

2. **Silicide agglomeration**:
   - NiSi: stable to ~500°C
   - CoSi₂: stable to ~700°C
   - But interface roughening at 450°C+

3. **Dielectric degradation**:
   - Low-k: pore collapse, moisture uptake
   - SiCOH: methyl loss, k increase
   - Porous low-k: pore collapse > 400°C

4. **Metal diffusion**:
   - Cu diffusion into low-k
   - Barrier failure (TaN)
   - Electromigration acceleration

#### 10.7.2 III-V Epitaxy Temperature Requirements

**Conventional MOCVD/MBE growth temperatures**:
- GaAs: 580-650°C
- InP: 550-620°C
- InGaAs: 500-580°C
- GaN: 1000-1100°C
- AlGaAs: 600-700°C

**Growth temperature vs. quality**:
- Higher T: better crystallinity, lower defects
- Lower T: point defects, rougher surface
- Minimum T: ~100°C below optimal

**Low-temperature epitaxy** (for CMOS compatibility):
- **MOCVD**: 350-450°C (reduced quality)
- **MBE**: 250-400°C (better at low T)
- **ALD**: 150-300°C (conformal, slow)
- **RPCVD**: 400-500°C (reduced pressure)

**Low-temperature trade-offs**:
- Higher point defects (As_Ga, Ga_As)
- Lower carrier mobility
- Higher non-radiative recombination
- Rougher interfaces

#### 10.7.3 Wafer Bonding Thermal Budget

**Direct wafer bonding (SiO₂-SiO₂)**:
- Room temp pre-bond
- Anneal: 200-400°C (hydroxyl condensation)
- Compatible with CMOS BEOL

**Plasma-activated bonding**:
- Plasma: 25-200°C
- Bond strength > 10 MPa at 200°C
- No high-temp anneal needed

**Hybrid bonding (Cu-Cu + dielectric)**:
- Pre-bond: room temp
- Anneal: 200-400°C (Cu diffusion, dielectric crosslinking)
- Compatible with CMOS BEOL

**Adhesive bonding (BCB, PI, epoxy)**:
- Cure: 150-250°C
- Lowest thermal budget
- But: CTE mismatch, outgassing, reliability

**Eutectic bonding (Au-Sn, Au-Si)**:
- Au-Sn: 280°C (eutectic)
- Au-Si: 363°C
- Compatible but limited reflow cycles

#### 10.7.3 III-V on Si Integration Strategies

**Strategy 1: Epitaxy BEFORE CMOS (Front-end integration)**
- III-V on Si first (high T)
- Then CMOS front-end (high T)
- Then BEOL (low T)
- **Problem**: III-V thermal budget during CMOS

**Strategy 2: CMOS first, then III-V transfer (Back-end integration)**
- CMOS complete (including BEOL)
- III-V transfer at < 450°C
- μTP, wafer bonding, or low-T epitaxy
- **Preferred for CMOS compatibility**

**Strategy 3: Wafer bonding (CMOS + III-V wafers)**
- Separate fabrication
- Bond at < 400°C
- Hybrid bonding for electrical interconnect
- Most flexible, highest yield

**Strategy 4: Monolithic low-T epitaxy**
- III-V on Si at < 450°C
- Direct growth on CMOS BEOL
- Challenging quality, but simplest flow

#### 10.7.4 Thermal Budget for Specific Processes

**MOCVD low-temperature growth**:
- GaAs: 400°C (vs. 600°C standard)
- InP: 400°C (vs. 550°C standard)
- Quality: 2-5× higher defects
- Mitigation: migration-enhanced epitaxy (MEE)

**MBE low-temperature growth**:
- GaAs: 300-400°C
- InAs QDs: 350-450°C
- Better crystal quality than MOCVD at low T
- In-situ annealing improves quality

**ALD for III-V**:
- InGaAs: 200-300°C
- InP: 250-350°C
- Conformal, slow (Å/min)
- For passivation, not active layers

**Selective area epitaxy (SAE) at low T**:
- ART trenches: local heating possible
- Laser-assisted epitaxy: local heating
- Keeps surrounding CMOS cool

#### 10.7.5 Thermal Budget for Wafer Bonding

**Oxide-oxide bonding**:
- Plasma activation: < 100°C
- Pre-bond: room temp
- Anneal: 200-300°C (1-2 hrs)
- Total thermal budget: < 300°C

**Hybrid bonding**:
- Plasma activation: < 100°C
- Pre-bond: room temp
- Anneal: 200-400°C (30-60 min)
- Cu diffusion: 300-400°C (10-30 min)
- Total thermal budget: < 400°C

**Metal-assisted bonding**:
- Cu-Sn, Cu-In: 200-250°C
- Lowest metal bonding temp
- But: IMC formation, reliability

**Adhesive bonding**:
- BCB: 250°C (1 hr)
- PI: 250-300°C (cure)
- Epoxy: 150-200°C
- Lowest temp, but reliability concerns

#### 10.7.5 Thermal Management During Integration

**Local heating techniques** (keep CMOS cool):
1. **Laser annealing**: localized, ms pulses
   - Si/III-V interface only
   - CMOS unaffected

2. **Inductive heating**: susceptor heating
   - Susceptor absorbs RF, heats III-V
   - Si substrate stays cool

3. **Resistive heating**: embedded heaters
   - In carrier wafer
   - Precise thermal control

3. **Rapid thermal processing (RTP)**:
   - Lamp heating: ms-sec ramps
   - Minimizes thermal diffusion
   - Compatible with BEOL

**Thermal simulation**:
- FEM thermal modeling
- Transient temperature profiles
- Verify CMOS max T < 450°C

#### 10.7.6 Thermal Budget for Specific Device Layers

**Laser (QD, QW)**:
- Active region: grown at high T (if epitaxial)
- Or: transfer printed (low T)
- Contacts: anneal < 400°C

**Modulator (MQW, QD)**:
- MQW: grown at high T (transfer)
- Or: Ge/SiGe (CMOS compatible)
- Phase shifter: doping activation < 450°C

**Detector (Ge, InGaAs)**:
- Ge on Si: 450-550°C (edge of budget)
- InGaAs: transfer print (low T)
- Contacts: NiGe, PtSi < 450°C

**Passive waveguides**:
- Si, SiN: CMOS compatible
- III-V passive: transfer or low-T growth

#### 10.7.6 Advanced Low-Temperature Techniques

**Migration-enhanced epitaxy (MEE)**:
- Alternating group III/V shuttering
- Lower T by 50-100°C
- Better surface morphology

**Atomic layer epitaxy (ALE)**:
- Self-limiting reactions
- 200-350°C
- Monolayer control

**Remote plasma MOCVD**:
- Plasma cracks precursors
- Lower substrate T
- Reduces H₂ etching

**Metal-organic VPE (MOVPE) with new precursors**:
- Lower decomposition T precursors
- Trimethylindium (TMI) vs. triethylindium
- Tertiarybutylarsine (TBAs) vs. arsine

**Area-selective deposition (ASD)**:
- Grow only on III-V, not dielectric
- Self-aligned, no etch
- Low T compatible

#### 10.7.7 Thermal Budget Management in 3D Integration

**Sequential integration** (coolest last):
1. High-T: III-V epitaxy (on native substrate)
2. Medium-T: wafer bonding (300-400°C)
3. Low-T: CMOS BEOL (< 450°C)
4. Lowest-T: packaging, test

**Parallel integration** (separate wafers):
- III-V wafer: high T processes
- CMOS wafer: standard BEOL
- Bond at < 400°C
- Best thermal isolation

**Thermal budget tracking**:
- Cumulative thermal dose: ∫ exp(-E_a/kT) dt
- Track for each critical layer
- Ensure total dose < limit

**Thermal budget allocation** (example):
- III-V growth: 600°C (on native sub)
- Bonding anneal: 350°C (30 min)
- BEOL: 400°C (max)
- Packaging: 250°C
- CMOS never sees > 400°C

#### 10.7.7 Future: Cryogenic and Room-Temperature Integration

**Room-temperature bonding**:
- Surface-activated bonding (SAB)
- Ar plasma + room temp bond
- No thermal budget

**Cryogenic integration**:
- Superconducting qubits (mK)
- III-V devices at 4K
- Thermal contraction management

**Room-temperature epitaxy** (future):
- Plasma-enhanced ALD
- Radical-enhanced growth
- Electrochemical epitaxy
- Goal: < 100°C III-V growth

**Photonic soldering**:
- Optical heating (laser)
- Localized, fast
- No bulk heating

---

*End of Piece 7. Next: Piece 8 - Coefficient of Thermal Expansion (CTE) Mismatch Stress Analysis*