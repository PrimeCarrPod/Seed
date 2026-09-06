# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 8: Nyquist WDM: Spectral Shaping and Superchannel Formation

---

### 5.8 Nyquist WDM: Spectral Shaping and Superchannel Formation

Nyquist WDM achieves the theoretical maximum spectral efficiency by using sinc-shaped pulses that occupy the minimum Nyquist bandwidth. When combined with superchannel formation—multiple subcarriers transmitted as a single entity—it enables terabit-per-second optical channels with high spectral efficiency.

#### 5.8.1 Nyquist Pulse Fundamentals

**Nyquist criterion** (zero ISI):
p(kT_s) = δ_{k,0}

**Ideal Nyquist pulse** (sinc):
p(t) = sinc(t/T_s) = sin(πt/T_s)/(πt/T_s)

**Frequency response**:
P(f) = T_s rect(f T_s)
Bandwidth: B = 1/(2T_s) (baseband), B = 1/T_s (passband)

**Roll-off factor α** (raised cosine):
P(f) = T_s for |f| < (1-α)/2T_s
P(f) = T_s/2 [1 + cos(πT_s/α (|f| - (1-α)/2T_s))] for (1-α)/2T_s < |f| < (1+α)/2T_s
P(f) = 0 for |f| > (1+α)/2T_s

**Bandwidth with roll-off**: B = (1+α)/T_s
α = 0: ideal Nyquist (sinc), infinite time extent
α = 1: full raised cosine, 2× bandwidth

#### 5.8.2 Nyquist Pulse Generation

**Optical Nyquist pulse generation**:
1. **Direct modulation** of laser with shaped drive
2. **Optical filtering** of broad pulse (spectral slicing)
3. **Phase-only shaping** (spectral phase = 0, amplitude = rect)
4. **Electro-optic modulation** (IQ modulator + DSP)

**IQ modulator + DSP approach**:
- Generate arbitrary waveform in DSP
- DAC → driver → IQ modulator
- Optical field: E(t) = p(t) e^{jφ(t)}
- For Nyquist: φ(t) = 0, p(t) = sinc

**DAC requirements**:
- Sampling rate: ≥ 2× symbol rate (Nyquist)
- Resolution: 6-8 bits for < 1 dB penalty
- Bandwidth: > 0.75 × symbol rate

**Pulse truncation**:
sinc(t) decays as 1/t
Truncate at ±N T_s
N = 4-8 typical
Windowing (Kaiser, Gaussian) reduces sidelobes

#### 5.8.3 Nyquist WDM Channel Spacing

**Channel spacing** = Symbol rate = 1/T_s
**No guard bands** (α = 0 ideal)
**Spectral efficiency**: 2 bits/s/Hz (QPSK), 4 bits/s/Hz (16-QAM), 6 bits/s/Hz (64-QAM)

**Comparison**:
- Conventional WDM (50 GHz spacing, 32 GBd): 0.64 b/s/Hz
- Nyquist WDM (32 GHz spacing, 32 GBd): 1.0 b/s/Hz
- 56 GBd Nyquist: 56 GHz spacing, 2 b/s/Hz (QPSK)

**Guard band relaxation**:
α > 0 provides implementation margin
Typical: α = 0.05-0.1 (5-10% excess bandwidth)

#### 5.8.4 Superchannel Formation

**Definition**: Multiple Nyquist subcarriers combined into single "superchannel"
- N subcarriers at spacing Δf = 1/T_s
- Total bandwidth: N/T_s
- Transmitted, amplified, switched as single entity

**Generation methods**:
1. **Optical frequency comb** (microcomb, Kerr comb)
   - Single laser → comb generator → N lines
   - Each line modulated independently
   
2. **Multiple lasers** (wavelength-locked)
   - N lasers phase-locked to reference
   - Complex, expensive

3. **Optical OFDM** (all-optical)
   - IFFT in optical domain (not practical)

**Microcomb-based superchannel**:
- Kerr microresonator (SiN, Hydex)
- Pump laser → parametric oscillation
- Comb lines spaced by FSR (10-100 GHz)
- Line-by-line modulation (wave shaper, modulator array)

**Superchannel characteristics**:
- Subcarrier count: 4-16 typical
- Total capacity: 400G-1.6T per superchannel
- Flexible bandwidth allocation

#### 5.8.5 Superchannel DSP

**Joint processing advantages**:
- **Shared phase noise**: Common pump → correlated phase noise
  - Joint phase estimation improves tolerance
  
- **Inter-carrier interference (ICI) cancellation**:
  - Known subcarrier spacing → ICI predictable
  - MIMO equalization across subcarriers
  
- **Flexible spectrum allocation**:
  - Subcarriers can be different modulation formats
  - Adaptive bit loading per subcarrier

**DSP blocks**:
1. **ADC** (per subcarrier or joint)
2. **CD compensation** (common for all)
3. **PMD compensation** (common)
4. **Frequency de-multiplexing** (FFT or filters)
5. **Joint phase estimation** (PLL, Viterbi-Viterbi)
6. **ICI cancellation** (turbo, MIMO)
7. **Symbol detection** (per subcarrier)

**Complexity**:
- N× complexity of single carrier
- But shared blocks reduce overhead
- ASIC implementation feasible

#### 5.8.6 Superchannel Flexibility

**Elastic optical networking**:
- Superchannel as "super-channel" unit
- Bandwidth variable: add/remove subcarriers
- Grooming at subcarrier granularity

**Bandwidth variable transponders (BVTs)**:
- Software-defined capacity
- 100G, 200G, 400G, 600G, 800G from same HW
- Nyquist spacing enables fine granularity

**Spectral defragmentation**:
- Move superchannels to fill gaps
- Hitless reconfiguration
- Defragmentation algorithms

#### 5.8.7 Nonlinear Effects in Superchannels

**Intra-superchannel nonlinearities**:
- XPM between subcarriers (strong, correlated)
- FWM within superchannel (phase-matched)
- SRS tilt across superchannel bandwidth

**Inter-superchannel nonlinearities**:
- XPM between adjacent superchannels
- FWM between superchannels
- SRS from neighboring superchannels

**Mitigation**:
- **Digital back-propagation (DBP)**: per superchannel
- **Perturbation-based nonlinear compensation**
- **Subcarrier power optimization** (water-filling)
- **Guard bands** between superchannels (10-20 GHz)

#### 5.8.8 Superchannel Standards and Implementation

**OIF 400ZR / 400ZR+**:
- 400G: 1× 400G (DP-16QAM, 60 GBd)
- 400ZR+: 80G, 100G, 200G, 300G, 400G modes
- Single carrier, not superchannel (yet)

**OpenZR+ / OpenROADM**:
- Multi-carrier superchannel support
- 400G, 600G, 800G, 1.2T
- Flexible grid (37.5/75 GHz)

**ITU-T G.698.2 (flexible grid)**:
- Slot width: 12.5 GHz
- Superchannel occupies N slots
- Central frequency + slot width signaling

#### 5.8.9 Superchannel Capacity Scaling

**Capacity per superchannel**:
C = N_sub × R_sub × (1 - OH_FEC)

**Example** (1.2T superchannel):
- N_sub = 12
- R_sub = 100 Gbps (DP-16QAM, ~50 GBd)
- OH_FEC = 20% (KP4)
- C = 12 × 100 × 0.8 = 960 Gbps net

**Future scaling**:
- 16 subcarriers × 200 Gbps (DP-64QAM) = 3.2T
- 32 subcarriers × 400 Gbps (DP-256QAM) = 12.8T
- Limited by: nonlinear threshold, DSP power, comb quality

**Comb quality requirements**:
- Line spacing stability: < 100 kHz
- Phase noise: < -100 dBc/Hz @ 1 MHz
- Amplitude flatness: < 1 dB
- Extinction ratio: > 30 dB

#### 5.8.10 Future: THz Superchannels and Beyond

**THz bandwidth superchannels**:
- Optical comb spanning C+L band (8 THz)
- 100+ subcarriers
- Single optical amplifier, single DSP

**Challenges**:
- Comb generation over 8 THz (dispersion, nonlinearity)
- DSP power/area for 100+ subcarriers
- Nonlinear crosstalk management
- Amplifier gain flatness over 8 THz

**Solutions**:
- Multi-band amplification (C+L+S)
- Distributed DBP (per band)
- Machine learning for nonlinear compensation
- Photonic integration (comb + modulators + DSP on chip)

**Beyond Nyquist**:
- **FTN (Faster-than-Nyquist)**: α < 0, controlled ISI
- **Probabilistic constellation shaping**: Maxwell-Boltzmann distribution
- **Geometric shaping**: Constellation on sphere
- **Joint source-channel coding**: End-to-end optimization

---

*End of Piece 8. Next: Piece 9 - Optical Signal-to-Noise Ratio (OSNR) Budget for 100+ Channels*