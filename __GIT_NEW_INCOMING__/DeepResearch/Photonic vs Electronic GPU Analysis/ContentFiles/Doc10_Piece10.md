# Document 10: Heterogeneous Integration and III-V/Silicon Epitaxy
## Piece 10: Known Good Die (KGD) Testing and Binning Strategy

---

### 10.10 Known Good Die (KGD) Testing and Binning Strategy

Known Good Die (KGD) testing is a critical quality gate in heterogeneous integration, ensuring that only fully functional III-V photonic devices are transferred onto silicon photonic circuits. This piece covers the test methodologies, binning strategies, and yield optimization for KGD in silicon photonics manufacturing.

#### 10.10.1 KGD Concept and Importance

**Why KGD is critical**:
- Heterogeneous integration cost: Si photonics wafer + III-V die
- Bad III-V die on good Si = total loss (costly)
- Si photonics wafer cost: $5,000-20,000 (300mm)
- III-V die cost: $10-100 (laser), $5-50 (modulator/detector)
- KGD prevents "known bad die" integration

**KGD definition**:
- Die that passes all electrical/optical tests at wafer level
- Meets all datasheet specifications
- Qualified for integration and reliability
- Traceable to wafer, lot, wafer position

**KGD vs. bare die**:
- Bare die: untested, sold as-is
- KGD: tested, guaranteed specs, premium price
- KGD premium: 2-5× bare die cost

#### 10.10.2 Wafer-Level Test (WLT) Flow

**Probe card design**:
- High-frequency probes (RF, 100+ GHz)
- Optical probes (grating couplers, edge coupling)
- Thermal management (chuck temperature control)
- Precision alignment (< 2 μm accuracy)

**Test sequence**:
1. **Visual inspection**: auto-inspection (defects, scratches)
2. **DC parametric**: IV curves, leakage, breakdown
3. **RF/DC characterization**: S-parameters, bandwidth
4. **Optical characterization**: power, wavelength, ER
5. **Burn-in/stress**: HTOL, THB, ESD
6. **Data logging**: results to MES/database

**Test time per die**:
- DC only: 0.1-0.5 sec
- DC + RF: 1-5 sec
- Full optical: 5-30 sec
- Full + burn-in: 60-300 sec

**Throughput targets**:
- DC: 10,000-50,000 die/hour
- RF: 5,000-20,000 die/hour
- Optical: 1,000-5,000 die/hour

#### 10.10.3 Optical Test Methodologies

**Laser KGD test**:
1. **LIV curve**: Light-Current-Voltage
   - Threshold current (I_th)
   - Slope efficiency (SE)
   - Series resistance (R_s)
   - Kink detection

2. **Spectral characterization**:
   - Peak wavelength (λ_p)
   - Side-mode suppression ratio (SMSR)
   - Linewidth (Δλ or Δν)
   - Temperature tuning (dλ/dT)

3. **Dynamic characterization**:
   - Modulation bandwidth (f_3dB)
   - Relative intensity noise (RIN)
   - Chirp (α-factor)

3. **Reliability screens**:
   - High-temp operating life (HTOL)
   - Thermal cycling
   - ESD (HBM, CDM)

**Modulator KGD test**:
1. **DC**: Capacitance-voltage (C-V), leakage
2. **Optical**: Insertion loss, extinction ratio (ER)
3. **RF**: S-parameters, V_π, bandwidth
3. **Eye diagram**: at target data rate (25-100 Gbps)

**Detector KGD test**:
1. **Dark current**: I_dark at -V_R
2. **Responsivity**: R(λ) at target λ
3. **Bandwidth**: f_3dB (electrical/optical)
3. **Linearity**: 1 dB compression point

#### 10.10.4 Binning Strategy

**Binning criteria** (example: 1310 nm DFB laser):
| Bin | I_th (mA) | SE (mW/mA) | λ_p (nm) | SMSR (dB) | Price |
|-----|-----------|------------|----------|-----------|-------|
| A   | < 10      | > 0.4      | 1310±0.5 | > 40      | 1.0×  |
| B   | 10-15     | 0.3-0.4    | 1310±1.0 | > 35      | 0.7×  |
| C   | 15-20     | 0.2-0.3    | 1310±2.0 | > 30      | 0.5×  |
| Reject | > 20  | < 0.2      | out      | < 30      | 0     |

**Multi-parameter binning**:
- Principal Component Analysis (PCA) on test parameters
- Clusters define natural bins
- Optimize bin boundaries for yield/value

**Dynamic binning**:
- Real-time bin adjustment based on demand
- Inventory optimization
- Customer-specific bin allocation

#### 10.10.5 Statistical Yield Analysis

**Yield components**:
Y_total = Y_fab × Y_probe × Y_KGD × Y_assembly × Y_final

**Probe yield** (wafer probe):
- Typical: 85-95% (mature process)
- Limited by: defects, parametric failures

**KGD yield** (after binning):
- Typical: 70-90% of probed die
- Bin A: 30-50%
- Bin B: 20-30%
- Bin C: 10-20%
- Reject: 10-30%

**Yield learning curve**:
Y(t) = Y_0 + (Y_max - Y_0) × (1 - e^{-t/τ})
Typical: 6-18 months to mature yield

**Yield correlation** (wafer-to-wafer):
- Within-lot correlation: high
- Between-lot correlation: moderate
- Spatial correlation: center vs. edge

#### 10.10.6 Test Data Management and Traceability

**Data architecture**:
- MES (Manufacturing Execution System)
- Test database (time-series, parametric)
- Traceability: wafer → die → package → module
- Genealogy: materials, tools, operators

**Data volume** (per wafer):
- DC: ~1 MB
- RF: ~10 MB
- Optical: ~100 MB
- 300mm wafer (1000 die): 1-100 GB

**Data analytics**:
- Real-time SPC (control charts)
- Yield prediction (ML models)
- Root cause analysis (RCA)
- Predictive maintenance

**Data standards**:
- STDF (Standard Test Data Format)
- ATDF (ASCII Test Data Format)
- SEMI E142 (test data standards)
- ROSA (optical test data)

#### 10.10.7 KGD for Different Device Types

**Laser KGD** (most stringent):
- Full LIV + spectral + dynamic
- Burn-in: 48-168 hrs at 85°C
- Aging projection: < 10% degradation/10yr
- Cost: $50-200/die (KGD)

**Modulator KGD**:
- C-V, ER, V_π, bandwidth
- Eye diagram at 56/112 Gbps
- No burn-in typically
- Cost: $20-50/die (KGD)

**Detector KGD**:
- Dark current, responsivity, bandwidth
- Linearity, saturation power
- Cost: $10-30/die (KGD)

**SOA/Amplifier KGD**:
- Gain, noise figure, saturation power
- Polarization dependence
- Cost: $30-80/die (KGD)

**Passive (AWG, splitter) KGD**:
- Insertion loss, crosstalk, uniformity
- Wafer-level test (no die singulation)
- Cost: $5-15/die (KGD)

#### 10.10.7 KGD in Heterogeneous Integration Flow

**Pre-transfer KGD** (mandatory):
- 100% test before μTP/wafer bonding
- Eliminates known bad die transfer
- Reduces integration yield loss

**Post-transfer test** (sampling):
- 1-10% sampling after transfer
- Verify transfer yield
- Detect transfer-induced damage

**In-situ test** (future):
- Test during μTP (pickup/transfer)
- Real-time yield feedback
- Closed-loop process control

**Known Good Module (KGM)**:
- Tested sub-assembly (e.g., laser + modulator)
- Higher integration level
- Reduces final test complexity

#### 10.10.8 KGD Economics

**Cost model**:
C_KGD = C_bare + C_test + C_yield_loss + C_logistics
C_test = T_test × C_prober/hr
C_yield_loss = (1 - Y_KGD) × C_bare / Y_KGD

**Typical costs** (1310 nm DFB):
- Bare die: $10
- Test: $5 (5 sec × $3600/hr)
- Yield loss (80% KGD): $2.5
- Logistics: $1
- **KGD total: $18.5** (85% premium)

**Break-even analysis**:
- KGD justified if: C_integration_loss > C_KGD_premium
- Integration loss: Si wafer cost / die count
- For 100 die/wafer, $10K wafer: $100/die loss
- KGD premium $8 << $100 → always justified

#### 10.10.8 Future: AI-Driven KGD and Predictive Binning

**AI for test optimization**:
- Test time reduction: skip redundant tests
- Adaptive test: more tests for marginal die
- Virtual metrology: predict unmeasured params

**Predictive binning**:
- ML model: wafer-level params → die performance
- Early binning (pre-probe) for logistics
- Dynamic bin adjustment

**Self-test die**:
- Built-in self-test (BIST) circuitry
- On-die optical test structures
- Reduces external test time

**Quantum KGD**:
- Single-photon purity (g⁽²⁾(0))
- Indistinguishability (HOM)
- Coherence time (T₂)
- Entanglement fidelity

---

*End of Piece 10. Document 10 complete (10 pieces). Next: Glue pieces into Doc10_Final.md*