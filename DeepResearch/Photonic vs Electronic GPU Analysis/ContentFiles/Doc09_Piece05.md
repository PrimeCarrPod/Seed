# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 5: ADC Architectures: Flash, SAR, Pipeline, Time-Interleaved

---

### 9.5 ADC Architectures: Flash, SAR, Pipeline, Time-Interleaved

The choice of ADC architecture fundamentally determines the speed-resolution-power trade-off in photonic-electronic interfaces. This piece analyzes the four dominant high-speed ADC architectures—Flash, SAR, Pipeline, and Time-Interleaved—their operating principles, performance limits, and suitability for optical neural network interfaces.

#### 9.5.1 Flash ADC (Parallel Comparator)

**Architecture**: 2^N - 1 comparators + resistor ladder + priority encoder
**Operation**: Single clock cycle
- Resistor ladder generates 2^N - 1 reference voltages
- All comparators fire simultaneously
- Encoder converts thermometer code to binary

**Speed**: Fastest possible (1 cycle)
- f_s,max = 10-100+ GS/s
- Limited by: comparator delay + encoder delay + clock distribution

**Resolution**: Limited to 6-8 bits
- Comparator count: 2^N - 1
- 8-bit: 255 comparators
- 10-bit: 1023 comparators (impractical)

**Power**: High
- P ∝ 2^N × f_s
- 8-bit 10 GS/s: ~1-5 W
- Dominated by: comparator bias + ladder current + clock

**Sparkle codes** (metastability):
- Comparator output settles wrong
- Probability: P_meta ∝ e^{-t_res/τ}
- Gray coding + error correction

**Best for**: Oscilloscopes, direct RF sampling, photonic ADCs
**Photonic flash**: Optical comparators, 50+ GS/s demonstrated

#### 9.5.2 SAR ADC (Successive Approximation Register)

**Architecture**: 1 comparator + DAC + SAR logic
**Operation**: N cycles for N bits
1. Sample input (S/H)
2. Set MSB, compare
3. Keep/clear bit based on comparison
3. Repeat for all bits

**Speed**: Moderate
- f_s,max = 10-500 MS/s (single channel)
- 1 GS/s with time-interleaving
- Limited by: DAC settling + comparator delay × N

**Resolution**: Excellent (12-18 bits)
- No comparator matching required
- Linearity limited by DAC matching
- Self-calibration possible

**Power**: Low
- P ∝ f_s (single comparator)
- 12-bit 100 MS/s: ~1-10 mW
- 16-bit 1 MS/s: ~100 μW

**Best for**: Precision measurement, sensor interfaces, low-power IoT
**Photonic SAR**: Optical comparator + electronic DAC, ~1 GS/s

#### 9.5.3 Pipeline ADC

**Architecture**: M stages × 1.5-2 bits/stage + digital error correction
**Operation**: Pipelined (throughput 1 sample/cycle after latency)
1. Stage 1: Sample, coarse quantize (1.5 bits), residue ×2
2. Stage 2: Quantize residue, new residue
3. ... M stages
4. Digital alignment + error correction

**Speed**: High
- f_s,max = 1-10 GS/s
- Limited by: inter-stage amplifier settling
- Each stage: 1.5 bits → 8-bit = 6 stages

**Resolution**: Good (10-14 bits)
- Error correction tolerates stage errors
- Calibration: foreground/background
- Inter-stage gain calibration critical

**Power**: Moderate
- P ∝ f_s × stages
- 12-bit 2 GS/s: ~100-500 mW
- Inter-stage amps dominate

**Latency**: M cycles (typically 6-12 cycles)
- Important for control loops

**Best for**: Communications, digitizers, high-speed imaging
**Photonic pipeline**: Optical amps + modulators, challenging

#### 9.5.4 Time-Interleaved ADC (TI-ADC)

**Architecture**: M parallel sub-ADCs (any type) + clock phasing
**Operation**: 
- Clocks: φ_k = 2πk/M, k = 0...M-1
- Sub-ADC k samples at t = nT_s + kT_s/M
- Digital multiplexer combines outputs

**Speed**: Scales with M
- f_s,eff = M × f_s,sub
- 4× 25 GS/s → 100 GS/s
- 8× 50 GS/s → 400 GS/s

**Resolution**: Limited by mismatches
- Offset mismatch → spurs at k f_s/M
- Gain mismatch → images at f_s/2 ± f_in
- Timing skew → broadband noise floor
- Bandwidth mismatch → frequency-dependent gain error

**Calibration** (essential):
- **Background**: Continuous, during normal operation
  - Random signal statistics
  - LMS/RLS adaptation
  - Slow (ms to s)
  
- **Foreground**: Dedicated calibration signal
  - Known ramp/sine
  - Fast (μs to ms)
  - Requires calibration mode

- **Built-in self-test (BIST)**:
  - On-chip reference
  - Measures mismatches directly

**Mismatch-induced spurs**:
- Offset: f = k f_s/M (k = 1,2,...)
- Gain: f = f_s/2 ± f_in
- Timing: f = f_in ± k f_s/M
- Bandwidth: frequency-dependent

**State-of-the-art TI-ADC**:
- 8× 50 GS/s flash → 400 GS/s, 6-bit
- 4× 25 GS/s SAR → 100 GS/s, 10-bit
- 16× 10 GS/s pipeline → 160 GS/s, 8-bit

**Best for**: Highest sample rates (>50 GS/s), coherent optical receivers
**Photonic TI-ADC**: Optical sampling + electronic sub-ADCs

#### 9.5.5 Architecture Comparison for Optical Neural Networks

| Parameter | Flash | SAR | Pipeline | TI-ADC |
|-----------|-------|-----|----------|--------|
| Speed | 10-100 GS/s | 0.1-1 GS/s | 1-10 GS/s | 50-400 GS/s |
| Resolution | 6-8 bit | 12-18 bit | 10-14 bit | 6-10 bit |
| Power (10 GS/s) | 1-5 W | N/A | 100-500 mW | 2-5 W |
| Latency | 1 cycle | N cycles | M cycles | 1 cycle |
| Area | Large (2^N) | Small | Medium | M × sub |
| Calibration | Simple | Built-in | Complex | Critical |
| Photonic fit | Excellent | Good | Poor | Excellent |

**For coherent optical receiver** (64 GS/s, 6-8 bit):
- **TI-Flash**: 8× 8 GS/s flash → 64 GS/s, 6-7 bit ENOB
- **Photonic TI**: Optical sampling + 8 electronic SARs

**For D2NN training** (moderate speed, high precision):
- **TI-SAR**: 8× 1 GS/s SAR → 8 GS/s, 10-bit ENOB
- Better precision for gradients

**For D2NN inference** (high speed, moderate precision):
- **TI-Flash** or **Photonic Flash**: 50+ GS/s, 6-7 bit ENOB
- Direct detection: lower speed, higher resolution

#### 9.5.6 Emerging ADC Architectures for Photonics

**Asynchronous ADC** (level-crossing):
- Samples on signal threshold crossing
- No clock, data-driven
- Variable rate, sparse sampling
- Good for sparse optical signals

**Sigma-Delta ADC** (ΣΔ):
- Oversampling + noise shaping
- 10-18 bits at 10-100 MS/s
- Photonic ΣΔ: optical integrator
- For D2NN training (high precision)

**Folding ADC**:
- Folding amplifier + coarse ADC
- 8-10 bits at 1-5 GS/s
- Lower power than flash

**VCO-based ADC**:
- Voltage-controlled oscillator
- Time-to-digital conversion
- Low power, PVT sensitive

**Photonic-specific**:
- **Photonic flash**: Optical comparators (SOA, MZI)
- **Photonic time-stretch**: Dispersion + slow ADC
- **Electro-optic sampling**: EO modulator as sampler
- **Two-photon absorption sampler**: TPA-based, < 100 fs resolution

#### 9.5.7 ADC Selection for D2NN System Design

**Inference path** (high throughput, 6-8 bits):
- Coherent receiver: TI-Flash (64+ GS/s)
- Direct detection: Pipeline (10-12 bits, 2-5 GS/s)
- Photonic: TI with optical sampling

**Training path** (gradient precision, 12-16 bits):
- SAR with time-interleaving
- ΣΔ for ultra-high precision (gradients)
- Lower speed acceptable (batch processing)

**Weight loading** (DAC for phase shifters):
- Precision: 8-10 bits
- Speed: 1-10 MS/s (slow tuning)
- Architecture: String DAC, R-2R, or ΣΔ DAC

**Hybrid approach**:
- Fast TI-Flash for data path (inference)
- Slow high-precision SAR for weight updates
- Shared reference, calibrated together

#### 9.5.8 ADC/DAC Co-Design for Optical Interfaces

**ADC-DAC matching**:
- Same reference voltage
- Calibrated together
- Shared clock (for coherent systems)

**DAC architectures** (for phase shifters):
- **String DAC**: 2^N resistors, best matching
- **R-2R ladder**: Compact, needs matching
- **Current-steering**: Fast, needs calibration
- **ΣΔ DAC**: High precision, slow

**DAC specs for phase shifters**:
- Resolution: 8-10 bits
- Settling: < 1 μs (thermal), < 1 ns (carrier)
- Glitch: < 1 LSB (critical for MZI)
- SFDR: > 60 dB

**Co-design flow**:
1. System budget: ENOB, speed, power
2. ADC/DAC pair selection
3. Joint calibration strategy
4. Shared reference, clock
5. BIST for both

#### 9.5.9 ADC in Advanced Packaging (3D, Chiplet)

**Chiplet-based ADC**:
- ADC as separate chiplet
- UCIe / BoW interface
- Enables process optimization (ADC in 28nm, logic in 3nm)

**3D-stacked ADC**:
- ADC die on logic die
- TSVs for digital output
- Short interconnects → less jitter

**Photonic-electronic co-packaging**:
- ADC next to photodetector
- Minimizes RF loss
- Co-packaged optics (CPO) standard

**UCIe ADC interface**:
- 32 GT/s per lane
- 16 lanes = 512 Gbps
- Multiple ADCs per chiplet

#### 9.5.10 Future: Neuromorphic and Quantum ADC

**Neuromorphic ADC** (event-driven):
- Level-crossing sampling
- Spikes at threshold crossings
- Sparse data → massive power savings
- For sparse optical spike trains

**Spike-based ADC**:
- Input: analog
- Output: spike train (rate = voltage)
- Natural fit for spiking neural networks

**Quantum ADC**:
- Superconducting qubit + resonator
- Quantum non-demolition measurement
- Quantum-limited noise: 1/2 photon
- ENOB → ∞ as T → 0, P_LO → ∞

**Photonic neuromorphic ADC**:
- Spiking photodetectors
- Optical thresholding
- All-optical spike generation
- For all-optical SNN

**In-memory ADC**:
- Compute-in-memory
- ADC integrated in SRAM/ReRAM
- For analog compute acceleration

---

*End of Piece 5. Next: Piece 6 - Walden Figure of Merit: FoM = P/(2^ENOB × f_s)*