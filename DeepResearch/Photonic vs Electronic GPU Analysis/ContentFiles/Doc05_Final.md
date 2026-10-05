# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 1: Coupled-Mode Theory for Arrayed Waveguide Gratings (AWG)

---

### 5.1 Coupled-Mode Theory for Arrayed Waveguide Gratings (AWG)

Arrayed Waveguide Gratings (AWGs) are the primary wavelength multiplexers/demultiplexers in silicon photonics, enabling dense WDM with 100+ channels. Their operation is governed by coupled-mode theory and Fourier optics principles, where the phased array creates wavelength-dependent focusing.

#### 5.1.1 AWG Structure and Operating Principle

**Layout**:
- Input waveguide → Free Propagation Region (FPR1) → Arrayed Waveguides → FPR2 → Output waveguides

**Phase array**: N waveguides with length increment ΔL
- L_m = L_0 + m ΔL, m = 0, 1, ..., N-1

**Wavelength routing**:
Input light at wavelength λ diffracts in FPR1, couples to array waveguides
Phase shift in waveguide m: φ_m = (2π/λ) n_eff ΔL × m
In FPR2, phases combine constructively at angle θ:
n_s sin θ = (λ/ΔL) × (ΔL/λ) n_eff? Actually:

Focusing condition: θ(λ) = (n_eff ΔL)/(n_s F) × (λ_0 - λ)/λ_0
where F = FPR focal length, n_s = slab index

#### 5.1.2 Coupled-Mode Theory for Waveguide Arrays

**Coupled-mode equations** for array waveguides:
dA_m/dz = -j Σ_n κ_{mn} A_n e^{jΔβ_{mn} z}

For uniform array with nearest-neighbor coupling:
dA_m/dz = -j κ (A_{m-1} + A_{m+1}) - j β_m A_m

where β_m = β_0 + m Δβ (linear phase gradient)

**Solution via discrete Fourier transform**:
A_m(z) = Σ_k Ã_k e^{j k m} e^{-j β_k z}
β_k = β_0 + 2κ cos(k) + Δβ m?

Actually for phased array, the coupling is weak, main effect is phase shift.

**Phase shift accumulation**:
After length L_m: A_m = A_0 exp(-j β L_m)
= A_0 exp(-j β L_0) exp(-j m β ΔL)

#### 5.1.3 Fourier Optics Formulation of FPR

**FPR as Fourier transformer**:
Field at output plane: E_out(x) = ∫ E_in(x') h(x - x') dx'
where h is point spread function (PSF)

**Fraunhofer diffraction** (far-field):
E_out(x) ∝ ∫ E_in(x') exp(-j 2π x x' / λ F) dx'
= Fourier transform of E_in at spatial frequency f_x = x/(λF)

**AWG operation**:
1. Input field at FPR1: E_in(x) (single waveguide mode)
2. Array waveguides sample field at x_m = m d
3. Phase shift: exp(-j β_m L_m)
4. FPR2 performs inverse Fourier transform
5. Output field: E_out(y) = Σ_m E_in(x_m) exp(-j β_m L_m) exp(j 2π y x_m / λ F)

**Wavelength-dependent focusing**:
Phase term: -β_m L_m + 2π y x_m / λ F
= -m (β ΔL - 2π d y / λ F)

Constructive interference when:
β ΔL = 2π d y / λ F
→ y = (β ΔL λ F) / (2π d) = (n_eff ΔL F / d) (λ_0/λ)

Dispersion: dy/dλ = -n_eff ΔL F / (d λ_0)

#### 5.1.4 Channel Spectral Response

**Field at output waveguide k** (centered at y_k):
E_k(λ) = Σ_m rect(x_m) exp[-j m (β ΔL - 2π d y_k / λ F)]

**Transfer function**:
H_k(λ) = |E_k(λ)|² / Σ_j |E_j(λ)|²

**For Gaussian input** (mode-matched):
H_k(λ) ≈ exp[-(λ - λ_k)² / (2 σ_λ²)]

**Channel spacing** (ITU grid):
Δλ = 0.8 nm (100 GHz), 0.4 nm (50 GHz)
FSR = N_ch × Δλ

**Crosstalk**:
Adjacent channel: XT ≈ exp[-(Δλ/2σ_λ)²]
Typical: -25 to -30 dB (demux), -20 to -25 dB (mux)

#### 5.1.5 Phase Error Analysis

**Sources of phase error**:
1. **Length error**: ΔL_m = random variation in L_m
2. **Width variation**: Δn_eff from width fluctuations
3. **Sidewall roughness**: scattering loss, phase noise
4. **Lithography CD variation**: systematic + random

**Phase error**:
Δφ_m = β ΔL_m + L_m Δβ_m

**Impact on spectral response**:
- Broadening: σ_λ increases
- Ripple: passband non-uniformity
- Crosstalk increase

**Statistical model**:
Δφ_m ~ N(0, σ_φ²)
σ_φ² = (2π/λ)² [σ_L² + L² σ_n²]

**Crosstalk from phase errors**:
XT ≈ (σ_φ/π)² for small σ_φ
For σ_φ = 0.1 rad: XT ≈ -30 dB

#### 5.1.6 Apodization for Sidelobe Suppression

**Uniform array**: sinc² response, high sidelobes (~13 dB)
**Apodization**: Amplitude tapering of array coupling

**Gaussian apodization**:
Coupling coefficient: c_m = exp[-(m - N/2)² / (2σ_a²)]

**Result**: Sidelobes suppressed to -30 to -40 dB
Trade-off: 10-20% wider main lobe

**Optimization**: Minimize max sidelobe subject to bandwidth constraint
Chebyshev apodization: equiripple sidelobes

#### 5.1.7 Temperature Dependence

**Thermo-optic coefficient**:
dn/dT = 1.86×10⁻⁴ K⁻¹ (Si)
dλ/dT = λ (1/n) dn/dT ≈ 0.09 nm/K (at 1550 nm)

**Thermal crosstalk**:
Heaters on output waveguides for tuning
Adjacent channel heater affects target channel

**Active thermal control**:
- Monitor channel power (photodiode)
- PID loop to heater
- Response time: ~1 ms (thermal time constant)

**Athermal design**:
- SiN overlay (negative dn/dT)
- Stress engineering
- Polymer cladding (negative dn/dT)

#### 5.1.8 Polarization Dependence

**TE/TM splitting**:
n_eff,TE ≠ n_eff,TM
Δλ_TE-TM ≈ 0.5-1 nm (for typical AWG)

**Polarization diversity**:
- Split TE/TM with polarization beam splitter
- Two identical AWGs (or rotated 90°)
- Combine outputs

**Polarization-independent AWG**:
- Deep-etched waveguides (TM cutoff)
- Sub-wavelength gratings
- Stress-engineered birefringence compensation

#### 5.1.9 AWG Design Parameters (Typical)

| Parameter | Value |
|-----------|-------|
| N (array waveguides) | 100-500 |
| ΔL | 10-50 μm |
| d (waveguide pitch) | 1-2 μm |
| F (FPR focal length) | 100-500 μm |
| n_eff | 2.4 (TE), 1.8 (TM) |
| n_s (slab) | 2.8 |
| Channel spacing | 50/100 GHz |
| Channel count | 16-96 |
| Insertion loss | 3-6 dB |
| Crosstalk | -25 to -30 dB |
| PDL | < 0.5 dB |
| Chromatic dispersion | < 10 ps/nm |

#### 5.1.10 Advanced AWG Architectures

**Flat-top AWG**:
- Parabolic phase profile in array
- Flattened passband (1 dB bandwidth = 0.5×channel spacing)
- Better for high-bit-rate signals

**Cyclic AWG**:
- Multiple FPRs, folded layout
- Compact, lower loss
- Used for > 96 channels

**Echelle grating**:
- Single FPR, blazed grating
- Higher resolution, larger footprint
- Used in spectroscopy

**Integrated AWG with MZI switches**:
- Reconfigurable add-drop (ROADM)
- Silicon photonics platform
- 1×N or N×N switching

---

*End of Piece 1. Next: Piece 2 - Fourier Optics Formulation of Spectral Decomposition*# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 2: Fourier Optics Formulation of Spectral Decomposition

---

### 5.2 Fourier Optics Formulation of Spectral Decomposition

The Fourier optics approach provides a rigorous framework for understanding spectral decomposition in WDM systems. By treating the optical field as a superposition of spatial frequencies, we can analyze how different wavelength components are separated, routed, and processed in photonic circuits.

#### 5.2.1 Scalar Diffraction Theory

**Rayleigh-Sommerfeld integral** (exact):
E(x,y,z) = (1/jλ) ∬ E(x',y',0) exp(jkR)/R (z/R) dx'dy'
R = √((x-x')² + (y-y')² + z²)

**Fresnel approximation** (paraxial):
E(x,y,z) = exp(jkz)/(jλz) ∬ E(x',y',0) exp[jk((x-x')²+(y-y')²)/(2z)] dx'dy'

**Fraunhofer approximation** (far-field):
E(x,y,z) = exp(jkz)/(jλz) exp[jk(x²+y²)/(2z)] ∬ E(x',y',0) exp[-j2π(x x'+y y')/λz] dx'dy'
= Fourier transform of aperture field

#### 5.2.2 Angular Spectrum Method

**Field decomposition**:
E(x,y,z) = ∬ A(k_x,k_y) exp[j(k_x x + k_y y + k_z z)] dk_x dk_y

where k_z = √(k² - k_x² - k_y²), k = 2π/λ

**Angular spectrum at z=0**:
A(k_x,k_y) = (1/2π)² ∬ E(x,y,0) exp[-j(k_x x + k_y y)] dx dy

**Propagation**:
E(x,y,z) = F⁻¹[ A(k_x,k_y) exp(j k_z z) ]

**Evanescent waves** (k_x² + k_y² > k²):
k_z = j√(k_x² + k_y² - k²) → exponential decay
Important for near-field coupling, subwavelength structures

#### 5.2.3 Spectral Decomposition in WDM

**Input field** (multi-wavelength):
E_in(t) = Σ_n a_n(t) exp(-j ω_n t)
where a_n(t) = complex envelope (modulation)

**Frequency domain**:
Ẽ_in(ω) = Σ_n ã_n(ω - ω_n)

**WDM demultiplexer as spectral filter bank**:
H_n(ω) = filter for channel n
Output: Ẽ_out,n(ω) = Ẽ_in(ω) H_n(ω)

**Ideal filter bank**:
H_n(ω) = rect[(ω - ω_n)/Δω] (brick-wall)
Nyquist condition: Δω = 2π/T_s (symbol rate)

**Realizable filters**:
- AWG: sinusoidal-like response
- MRR: Lorentzian
- MZI lattice: programmable

#### 5.2.4 Nyquist WDM and Superchannel Formation

**Nyquist pulse shaping**:
Time domain: p(t) = sinc(t/T_s)
Frequency domain: P(ω) = T_s rect(ω T_s / 2π)

**Zero ISI**: p(kT_s) = δ_k
**Minimum bandwidth**: B = 1/(2T_s) per polarization

**Superchannel**:
N subcarriers at spacing Δf = 1/T_s
Total bandwidth: N/T_s
No guard bands (ideal Nyquist)

**Superchannel generation**:
- Optical frequency comb (microcomb, Kerr comb)
- Each line modulated independently
- Combined and transmitted as single entity

**DSP for superchannel**:
- Joint equalization across subcarriers
- Inter-carrier interference (ICI) mitigation
- Phase noise correlation exploitation

#### 5.2.5 Coherent vs. Incoherent Crosstalk Accumulation

**Coherent crosstalk** (same wavelength, fixed phase):
Fields add: E_total = E_sig + Σ E_xtalk
Power penalty: 10 log₁₀(1 + Σ r_i + 2Σ√r_i cos φ_i)
Worst-case: 10 log₁₀(1 + Σ√r_i)²

**Incoherent crosstalk** (different wavelengths or random phase):
Powers add: P_total = P_sig + Σ P_xtalk
Penalty: 10 log₁₀(1 + Σ r_i)

**Accumulated crosstalk** (N nodes):
Coherent: penalty ∝ N² (if phases align)
Incoherent: penalty ∝ N

**Mitigation**:
- Wavelength guard bands
- Polarization diversity
- Phase scrambling

#### 5.2.6 Four-Wave Mixing (FWM) Induced Crosstalk

**Phase matching condition**:
2ω_p = ω_s + ω_i
2β(ω_p) = β(ω_s) + β(ω_i) + 2γ P_p

**FWM efficiency**:
η = (γ P_p L_eff)² sinc²(Δβ L/2)
L_eff = (1 - exp(-αL))/α

**Crosstalk power**:
P_xtalk = η P_p P_s P_i? Actually:
P_s = η P_p² P_i (for degenerate pump)

**In WDM systems**:
Many pump combinations → many FWM products
FWM products fall on other channels → crosstalk

**Suppression techniques**:
- Unequal channel spacing (non-uniform grid)
- Dispersion management (β₂ ≠ 0)
- Low power per channel
- Phase-conjugated twin waves

#### 5.2.7 Stimulated Raman Scattering (SRS) in WDM

**Raman gain spectrum** (silica):
Peak at ~13.2 THz (100 nm) shift
Bandwidth: ~6 THz (40 nm)

**Power transfer** (counter-propagating):
dP_s/dz = -g_R P_p P_s / A_eff - α P_s
dP_p/dz = +(ω_p/ω_s) g_R P_p P_s / A_eff - α P_p

**SRS tilt** (co-propagating, WDM):
Shorter wavelengths pump longer wavelengths
Power tilt across C-band: ~1 dB per 100 mW per km

**Impact on WDM**:
- Channel power imbalance
- SNR variation across band
- Gain competition in Raman amplifiers

**Mitigation**:
- Pre-emphasis (pre-distort launch powers)
- Bidirectional pumping
- Gain flattening filters

#### 5.2.8 Nonlinear Schrödinger Equation for Pulse Propagation

**Generalized NLSE**:
∂A/∂z + β₁ ∂A/∂t + jβ₂/2 ∂²A/∂t² - β₃/6 ∂³A/∂t³
= -α/2 A + jγ |A|² A
+ Raman term + self-steepening

**For WDM** (coupled NLSE):
∂A_n/∂z + β₁ ∂A_n/∂t + jβ₂/2 ∂²A_n/∂t²
= -α/2 A_n + jγ (|A_n|² + 2Σ_{m≠n}|A_m|²) A_n
+ XPM terms + FWM terms

**Cross-phase modulation (XPM)**:
Phase shift on channel n from channel m:
Δφ_n = 2γ ∫ |A_m|² dz

**FWM terms**:
Coupling between channels satisfying phase matching

#### 5.2.9 Dispersion Management

**Chromatic dispersion**:
β₂ = d²β/dω² = -λ²/(2πc) D
D = dispersion parameter (ps/nm/km)

**SMF-28**: D ≈ 17 ps/nm/km at 1550 nm
**DCF**: D ≈ -80 to -100 ps/nm/km

**Dispersion map**:
Alternating SMF + DCF
Residual dispersion per span: ~±500 ps/nm
Total residual: < ±1000 ps/nm

**For silicon waveguides**:
β₂ from waveguide geometry
Tailored by width, height, slab
Can be engineered to zero (ZDW)

**Dispersion compensation modules (DCM)**:
- Chirped FBG
- DCF
- Virtually Imaged Phased Array (VIPA)

#### 5.2.10 WDM System Design Example

**400GbE (4×100G PAM-4)**:
- 4 wavelengths × 50 GHz spacing
- Each: 53 GBd PAM-4 = 106 Gbps raw
- FEC: KP4 RS(544,514) → 100 Gbps net
- Reach: 2 km (DR4), 10 km (FR4), 40 km (LR4)

**Optical budget** (LR4):
Tx power: -2.9 to +4.0 dBm per lane
Rx sensitivity: -8.5 dBm (OMA)
Link loss: 6.3 dB (max)
Penalties: CD, PMD, nonlinear

**C-band utilization**:
400G DR4: 4λ × 100 GHz = 400 GHz
800G FR8: 8λ × 100 GHz = 800 GHz
1.6T: 16λ × 100 GHz = 1.6 THz (full C-band)

**Future**: 3.2T, 6.4T using 200 GHz, 400 GHz spacing
Requires: higher baud rate, higher-order modulation, better DSP

---

*End of Piece 2. Next: Piece 3 - Channel Crosstalk: Coherent vs. Incoherent Accumulation*# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 3: Channel Crosstalk: Coherent vs. Incoherent Accumulation

---

### 5.3 Channel Crosstalk: Coherent vs. Incoherent Accumulation

Crosstalk in WDM systems arises from imperfect filtering, nonlinear effects, and component limitations. Understanding the statistical nature of crosstalk accumulation—whether coherent (phase-correlated) or incoherent (phase-random)—is essential for system design and power budgeting.

#### 5.3.1 Crosstalk Sources in WDM Systems

**Component-level sources**:
1. **Filter crosstalk**: Finite extinction of AWG, MRR, MZI filters
2. **Nonlinear crosstalk**: FWM, XPM, SRS, Raman
3. **Scattering crosstalk**: Rayleigh backscattering, sidewall roughness
4. **Polarization crosstalk**: PDL, PMD, polarization rotation
5. **Coherent interference**: Multipath, reflections

**System-level accumulation**:
- Cascaded components (mux → fiber → demux → ...)
- Multiple spans (amplifiers, ROADMs)
- Switching nodes (ROADM, OXC)

#### 5.3.2 Coherent Crosstalk Accumulation

**Definition**: Crosstalk fields maintain fixed phase relationship with signal
E_total = E_sig + Σ_i E_xtalk,i exp(jφ_i)

**Power at decision point**:
P = |E_sig|² + Σ_i |E_xtalk,i|² + 2 Σ_i |E_sig||E_xtalk,i| cos(φ_i + φ_sig)
+ 2 Σ_{i<j} |E_xtalk,i||E_xtalk,j| cos(φ_i - φ_j)

**Worst-case** (all phases align):
P_max = (|E_sig| + Σ_i |E_xtalk,i|)²

**Best-case** (phases anti-aligned):
P_min = (|E_sig| - Σ_i |E_xtalk,i|)²

**Penalty** (for OOK, direct detection):
ΔP_dB = 10 log₁₀[(1 + Σ r_i)²] = 20 log₁₀(1 + Σ √XT_i)
where XT_i = P_xtalk,i/P_sig

**Statistical distribution** (random phases):
If φ_i uniform [0,2π], sum is Rayleigh-like
Mean penalty: 10 log₁₀(1 + Σ XT_i)
Variance: 10 log₁₀(1 + 2 Σ XT_i + ...)

#### 5.3.3 Incoherent Crosstalk Accumulation

**Definition**: Crosstalk powers add, phases random/uncorrelated
P_total = P_sig + Σ_i P_xtalk,i

**Penalty**:
ΔP_dB = 10 log₁₀(1 + Σ XT_i)

**Key difference**: No 20 log₁₀ factor
Coherent: 20 log₁₀(1 + Σ √XT)
Incoherent: 10 log₁₀(1 + Σ XT)

**Example**: XT = -30 dB (0.001) per component, 10 components
Coherent: 20 log₁₀(1 + 10×0.0316) = 20 log₁₀(1.316) = 2.4 dB
Incoherent: 10 log₁₀(1 + 10×0.001) = 0.04 dB

**Incoherent assumption valid when**:
- Phases randomize between components
- Wavelength offset > laser linewidth
- Polarization scrambling
- Sufficient path length difference

#### 5.3.4 Cascaded Filter Crosstalk

**AWG cascaded with AWG** (mux → demux):
Each has extinction ratio ER = -XT (dB)

**Coherent accumulation** (same wavelength):
Total XT = XT₁ + XT₂ + 2√(XT₁ XT₂) cos(Δφ)
Worst: XT_total = (√XT₁ + √XT₂)²

**Incoherent** (different polarization, or phase randomization):
Total XT = XT₁ + XT₂

**N cascaded identical filters**:
Coherent worst: XT_N = N² XT_1
Incoherent: XT_N = N XT_1

**Realistic** (partial coherence):
XT_N ≈ N XT_1 + N(N-1) γ √(XT_1²)
where γ = coherence factor (0 to 1)

#### 5.3.5 FWM-Induced Coherent Crosstalk

**FWM product** on channel k from pumps i,j:
E_FWM,k ∝ E_i E_j E*_m (where ω_i + ω_j = ω_k + ω_m)

**Phase correlation**:
φ_FWM = φ_i + φ_j - φ_m
If pumps from same laser (or phase-locked): fully coherent
If independent lasers: partially coherent

**Power penalty**:
Coherent: ΔP = 20 log₁₀(1 + Σ √XT_FWM)
Incoherent: ΔP = 10 log₁₀(1 + Σ XT_FWM)

**FWM crosstalk power**:
XT_FWM = (γ P L_eff)² (sinc(Δβ L/2))² P_pump² / P_sig

**Cascaded spans**:
Each span adds FWM products
Coherent accumulation if phase matching preserved

#### 5.3.6 XPM-Induced Crosstalk

**XPM phase shift**:
Δφ_XPM = 2γ ∫ P_pump(z) dz

**Intensity modulation** (via dispersion):
Pump power variation → phase modulation → intensity modulation after dispersive fiber
XPM crosstalk power:
XT_XPM ≈ (2γ P_pump L_eff D Δλ L)² (for NRZ)
For PAM-4: more complex

**Phase correlation**:
XPM phase follows pump intensity
If pump is signal itself (SPM): deterministic
If pump is another channel: depends on data pattern

**Accumulation**:
Across spans: XPM adds coherently if pump data correlated
With scrambling: partially incoherent

#### 5.3.7 SRS-Induced Incoherent Crosstalk

**SRS power transfer**:
dP_i/dz = g_R/A_eff (P_j - P_i) P_total? Actually:
dP_s/dz = g_R P_p P_s / A_eff (Stokes gains, pump depletes)

**Crosstalk nature**: Power transfer, no phase relationship
Always incoherent accumulation

**Tilt across WDM band**:
Shorter λ pump longer λ
Slope: ~1 dB/100mW/km

**Accumulation over N spans**:
Total tilt = N × tilt_per_span
Incoherent: powers add linearly

**Mitigation**: Pre-emphasis (pre-distort launch powers)

#### 5.3.8 Rayleigh Scattering Crosstalk

**Backscattered light**:
Fraction ρ_R ≈ 10⁻⁷ to 10⁻⁸ per meter (in fiber)
In Si waveguides: higher due to roughness

**Coherent Rayleigh noise** (in coherent systems):
Backscattered field interferes with signal
Beat noise: P_beat ∝ P_sig P_RS

**In direct detection**:
Incoherent: adds to noise floor
P_RS = ρ_R L P_sig

**Double Rayleigh scattering** (in amplified links):
Forward → back → forward
Creates multipath interference (MPI)
Coherent if delay < coherence time

#### 5.3.9 Polarization Crosstalk

**Polarization-dependent loss (PDL)**:
Loss differs for TE/TM
Creates polarization-dependent crosstalk

**Polarization mode dispersion (PMD)**:
Differential group delay (DGD) between PSPs
Pulse broadening, ISI

**Polarization crosstalk in coherent RX**:
Signal in X-polarization leaks to Y
Finite extinction of PBS, polarization rotation

**Accumulation**:
PDL: multiplicative (coherent in Jones calculus)
PMD: statistical (Maxwellian DGD distribution)
Rotation: rotates Jones vector

#### 5.3.10 System Design Guidelines

**Crosstalk budget allocation** (example 400G ZR):
| Source | Budget (dB) | Type |
|--------|-------------|------|
| Mux/Demux | -25 | Coherent/Incoherent |
| ROADM (per pass) | -25 | Coherent |
| Fiber nonlinear (FWM) | -30 | Coherent |
| Fiber nonlinear (XPM) | -28 | Coherent |
| SRS tilt | -35 | Incoherent |
| Rayleigh (coherent) | -40 | Coherent |
| PDL/PMD | -25 | Mixed |

**Total crosstalk penalty** < 0.5 dB target

**Design rules**:
1. Assume coherent for same-wavelength paths
2. Use phase diversity (polarization, wavelength offset)
3. Limit cascade depth (N < 10 for ER=25dB)
4. Monitor crosstalk in commissioning
5. Include margin for aging, temperature

---

*End of Piece 3. Next: Piece 4 - Four-Wave Mixing Induced Crosstalk in Dense WDM*# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 4: Four-Wave Mixing Induced Crosstalk in Dense WDM

---

### 5.4 Four-Wave Mixing Induced Crosstalk in Dense WDM

Four-wave mixing (FWM) is a third-order nonlinear process where two pump photons create signal and idler photons. In dense WDM systems with many closely spaced channels, FWM generates new frequencies that can fall exactly on other channels, causing coherent crosstalk that degrades system performance.

#### 5.4.1 FWM Physics and Phase Matching

**Energy conservation**:
ω_i + ω_j = ω_k + ω_l

**Momentum conservation (phase matching)**:
β_i + β_j = β_k + β_l + 2γ(P_i + P_j - P_k - P_l)

**Degenerate case** (two pumps at same frequency):
2ω_p = ω_s + ω_i
2β_p = β_s + β_i + 2γ(2P_p - P_s - P_i) ≈ 2β_p

**Non-degenerate case** (two different pumps):
ω_p1 + ω_p2 = ω_s + ω_i
β_p1 + β_p2 = β_s + β_i + 2γ(P_p1 + P_p2 - P_s - P_i)

#### 5.4.2 FWM Efficiency

**Coupled amplitude equations**:
dA_s/dz = jγ A_p1 A_p2 A*_i exp(jΔβ z)
dA_i/dz = jγ A_p1 A_p2 A*_s exp(jΔβ z)

where Δβ = β_s + β_i - β_p1 - β_p2 - 2γ(P_p1 + P_p2 - P_s - P_i)

**Solution** (undepleted pumps, P_s, P_i ≪ P_p):
A_s(L) = jγ A_p1 A_p2 A*_i(0) L_eff sinc(Δβ L/2)
L_eff = (1 - e^{-αL})/α

**FWM power**:
P_s(L) = (γ P_p1 P_p2 L_eff)² sinc²(Δβ L/2) P_i(0)

**Conversion efficiency**:
η = P_s/P_i = (γ P_p L_eff)² sinc²(Δβ L/2)

#### 5.4.3 Phase Matching Condition

**Dispersion relation**:
β(ω) = β_0 + β_1(ω-ω_0) + ½β₂(ω-ω_0)² + ⅙β₃(ω-ω_0)³ + ...

**For symmetric pumps** (ω_p1 = ω_0 + Ω, ω_p2 = ω_0 - Ω):
ω_s = ω_0 + Ω', ω_i = ω_0 - Ω'
Δβ = ½β₂(Ω'² - Ω²) + ⅛β₄(Ω'⁴ - Ω⁴) + ... - 2γ(P_p1 + P_p2)

**Perfect phase matching** (Δβ = 0):
Ω'² - Ω² = (4γ/β₂)(P_p1 + P_p2) (ignoring β₄)

**Zero-dispersion wavelength (ZDW)**:
If β₂ = 0 at pump: Δβ ≈ ⅛β₄(Ω'⁴ - Ω⁴) - 2γP_p
Phase matching possible for wider range

#### 5.4.4 FWM in WDM Systems

**Channel frequencies**: ω_n = ω_0 + n Δω (Δω = 2π × 50/100 GHz)

**FWM products** from channels i, j, k:
ω_FWM = ω_i + ω_j - ω_k
Falls on channel: l = i + j - k

**Number of FWM combinations**:
For N channels, number of (i,j,k) with i+j-k = l
≈ N²/2 per channel (for large N)

**FWM product power on channel l**:
P_FWM(l) = Σ_{i,j} (γ P_i P_j L_eff)² sinc²(Δβ_{ijk} L/2)
where k = i + j - l

**Total crosstalk power on channel l**:
XT(l) = P_FWM(l) / P_l

#### 5.4.5 FWM in Standard vs. Non-Zero Dispersion Fiber

**Standard SMF (SMF-28)**:
ZDW at 1310 nm, β₂ ≠ 0 at 1550 nm (D ≈ 17 ps/nm/km)
|β₂| ≈ 20 ps²/km
Phase mismatch: Δβ ≈ β₂ Δω²
For 50 GHz spacing (Δω = 2π×50×10⁹):
Δβ L ≈ 20 × (2π×50×10⁹)² × 80 km ≈ large
sinc²(Δβ L/2) ≈ 0
**FWM suppressed by dispersion**

**Non-zero dispersion-shifted fiber (NZDSF)**:
ZDW shifted to 1550 nm, small β₂
D ≈ 2-6 ps/nm/km
**FWM enhanced** (major limitation for WDM)

**Dispersion-managed links**:
Alternating SMF + DCF
Average β₂ small → FWM in DCF sections
Net FWM depends on map design

#### 5.4.6 FWM in Silicon Waveguides

**Silicon waveguide dispersion**:
β₂ engineered by geometry
Can achieve β₂ = 0 (ZDW) at 1550 nm
High γ = 200-500 W⁻¹m⁻¹

**TPA limitation**:
Two-photon absorption (TPA) generates free carriers
Free-carrier absorption (FCA) increases loss
Effective length reduced: L_eff < L

**FWM efficiency with TPA**:
η_FWM = (γ P_p L_eff)² × TPA_factor
TPA_factor ≈ exp(-β_TPA P_p L)

**Phase matching in Si**:
β₂ ≈ 0 at ZDW → Δβ dominated by β₄, γP
Broadband phase matching possible
Multiple FWM orders generated

#### 5.4.7 FWM Crosstalk Statistics

**Coherent accumulation**:
All FWM fields from same pumps add coherently
Total field: E_FWM = Σ E_FWM,i
Power: |Σ E_i|² = Σ |E_i|² + 2Σ_{i<j} |E_i||E_j| cos(Δφ_{ij})

**Phase correlation**:
Δφ_{ij} = φ_i + φ_j - φ_k - (φ_i' + φ_j' - φ_k')
If all from same laser: fully correlated
If independent lasers: random

**Crosstalk distribution**:
For many independent FWM products:
Central limit theorem → Gaussian field
Rician distribution for |E_total|

**Probability of outage**:
P(XT > XT_th) = Q-function of Rician parameters

#### 5.4.8 FWM Suppression Techniques

**1. Unequal channel spacing**:
Break phase matching symmetry
Δω_n = Δω_0 + ε_n (ε_n random or designed)
Prevents ω_i + ω_j - ω_k = ω_l exactly

**2. Dispersion management**:
Non-zero average dispersion
Increases Δβ, reduces sinc²(Δβ L/2)

**3. Power reduction**:
η ∝ P² → reduce per-channel power
Trade-off with OSNR

**4. Phase-conjugated twin waves**:
Transmit conjugate pairs
FWM products cancel at receiver (digital back-propagation)

**5. Optical phase conjugation (OPC)**:
Mid-link OPC reverses FWM
Cancels phase-matched FWM

**6. Digital FWM compensation**:
DSP at receiver estimates and cancels FWM
Requires pilot tones or blind algorithms

#### 5.4.9 FWM in Coherent Systems

**Coherent detection**:
FWM crosstalk beats with LO
Appears as additional noise in electrical domain

**Digital back-propagation (DBP)**:
Simulates reverse propagation in DSP
Compensates nonlinearity including FWM
Complexity: O(N log N) per step, multiple steps

**Perturbation-based FWM compensation**:
Linearize FWM around linear solution
Estimate FWM products from received signal
Subtract from data

**Machine learning approaches**:
NN learns FWM mapping
End-to-end or block-based

#### 5.4.10 FWM Tolerance in Modern Systems

**400G/800G coherent (PAM-4, 16-QAM, 64-QAM)**:
- FWM less critical due to high dispersion
- XPM and SRS dominate nonlinear penalties
- FWM managed by unequal spacing

**Inter-datacenter (80-120 km)**:
- 100G/200G: FWM negligible (SMF)
- 400G+: FWM managed by design

**Metro/access (20-40 km)**:
- NZDSF possible → FWM critical
- Use SMF or dispersion management

**Intra-datacenter (2-10 km)**:
- Si photonics: high γ, low dispersion
- FWM significant for high channel count
- Mitigation: low power, unequal spacing

**Future**: 1.6T, 3.2T with 200/400 GHz spacing
- Fewer channels → fewer FWM combos
- Higher baud rate → more XPM
- Nonlinear compensation in DSP essential

---

*End of Piece 4. Next: Piece 5 - Stimulated Raman Scattering Threshold in Silicon Waveguides*# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 5: Stimulated Raman Scattering Threshold in Silicon Waveguides

---

### 5.5 Stimulated Raman Scattering Threshold in Silicon Waveguides

Stimulated Raman Scattering (SRS) is a nonlinear process where pump photons create Stokes photons at a lower frequency (longer wavelength) while generating optical phonons. In silicon waveguides, the high Raman gain and tight confinement make SRS a significant effect that limits maximum power and causes crosstalk in WDM systems.

#### 5.5.1 Raman Scattering Physics in Silicon

**Raman process**:
Pump photon (ω_p) → Stokes photon (ω_s) + Optical phonon (Ω_R)
ω_s = ω_p - Ω_R
Ω_R/2π = 15.6 THz (100 nm shift at 1550 nm)

**Raman gain coefficient**:
g_R(Ω) = g_R⁰ / [1 + 4(Ω - Ω_R)²/Γ_R²]
g_R⁰ = 10-20 cm/GW (silicon, 1550 nm pump)
Γ_R = 1.5 THz (FWHM)

**Raman susceptibility**:
χ_R⁽³⁾(Ω) = χ_R⁰ / (Ω_R - Ω - jΓ_R/2)

**Spontaneous Raman**:
Random photon-phonon pairs
Noise source in amplifiers, quantum light sources

**Stimulated Raman**:
Coherent amplification of Stokes
Threshold behavior above critical power

#### 5.5.2 SRS Threshold Condition

**Power evolution** (counter-propagating):
dP_s/dz = g_R P_p P_s / A_eff - α P_s
dP_p/dz = - (ω_p/ω_s) g_R P_p P_s / A_eff - α P_p

**Threshold definition**:
Stokes power grows from noise to comparable to pump
P_s(L) ≈ P_p(0)

**Threshold power** (co-propagating):
P_th ≈ 16 A_eff / (g_R L_eff)

For silicon:
A_eff ≈ 0.1 μm² = 10⁻¹³ m²
g_R ≈ 10 cm/GW = 1000 m⁻¹GW⁻¹
L_eff ≈ 1 cm = 0.01 m (short waveguides)
P_th ≈ 16 × 10⁻¹³ / (1000 × 0.01) = 1.6 mW

**Low threshold!** Silicon waveguides easily reach SRS threshold.

#### 5.5.3 SRS in WDM Systems

**Multi-channel SRS**:
Pump at ω_p depletes to create Stokes at ω_s
If ω_s coincides with another channel → crosstalk

**Power tilt** (co-propagating WDM):
Shorter wavelengths (higher ω) pump longer wavelengths
dP_n/dz = g_R/A_eff (Σ_{m<n} P_m - Σ_{m>n} P_n) P_n? Actually:
dP_n/dz = g_R P_n/A_eff (Σ_{m<n} P_m - Σ_{m>n} P_m) - α P_n

**Tilt across C-band** (4 THz bandwidth):
ΔP/P ≈ g_R P_total L_eff / A_eff
For P_total = 100 mW, L = 10 km (fiber):
ΔP/P ≈ 1.3 dB (fiber)
For silicon (L = 1 cm): negligible tilt per device

**Crosstalk from SRS**:
Stokes from channel i falls on channel j
XT = P_Stokes(j) / P_signal(j)
Depends on channel spacing relative to Ω_R

#### 5.5.4 SRS Threshold with TPA/FCA in Silicon

**Two-Photon Absorption (TPA)**:
β_TPA = 0.5 cm/GW at 1550 nm
dN_c/dt = β_TPA P² / (2ħω A_eff²)

**Free-Carrier Absorption (FCA)**:
α_FCA = σ_e N_e + σ_h N_h
σ_e = 1.45×10⁻¹⁷ cm², σ_h = 1.35×10⁻¹⁷ cm²

**Coupled equations**:
dP_p/dz = -α_lin P_p - β_TPA P_p²/A_eff - α_FCA P_p - g_R P_p P_s/A_eff
dP_s/dz = -α_lin P_s - β_TPA P_s²/A_eff - α_FCA P_s + g_R P_p P_s/A_eff
dN_c/dt = β_TPA (P_p² + P_s²)/(2ħω A_eff²) - N_c/τ_c

**Carrier lifetime**:
τ_c ≈ 1 ns (unpinched)
τ_c ≈ 10-100 ps (reverse-biased p-i-n)

**Effect on SRS threshold**:
FCA increases loss → higher threshold
TPA depletes pump → higher threshold
Net effect: P_th increased 2-5× compared to linear case

#### 5.5.5 SRS in Raman Amplifiers and Lasers

**Raman amplifier**:
Counter-propagating pump
Gain: G = exp(g_R P_p L_eff / A_eff)
Noise figure: NF ≈ 3 dB (quantum limit)

**Distributed Raman amplification (DRA)**:
Pump along transmission fiber
Extends reach, improves OSNR

**Raman laser**:
Cavity with Raman gain
Threshold: g_R P_p L > α L + loss
Silicon Raman laser demonstrated (pulsed, CW)

**Silicon Raman laser challenges**:
TPA/FCA limit CW operation
Pulsed operation: high peak power, low average
P-i-n diode for carrier sweep-out

#### 5.5.6 SRS Noise in Quantum Systems

**Spontaneous Raman noise**:
P_noise = (g_R P_p L_eff / A_eff) (n_th + 1) ħω_s B
n_th = 1/(exp(ħΩ_R/k_BT) - 1) ≈ 0.08 at 300K

**Impact on quantum light sources**:
- FWM photon pair sources: Raman adds noise photons
- CAR (coincidence-to-accidental ratio) limited by Raman
- CAR ≈ P_pair / (P_Raman × τ_c)

**Raman-free operation**:
- Pump below threshold (P_p < P_th)
- Use shorter wavelengths (visible) where Ω_R larger
- Use SiN (no TPA, lower g_R)

#### 5.5.7 SRS in Integrated Photonic Circuits

**On-chip SRS effects**:
- Short lengths (cm) → low absolute gain
- But high power density → low threshold
- Cascaded devices accumulate SRS

**WDM crosstalk**:
Channel at λ_p pumps λ_s = λ_p + 100 nm
If λ_s is another channel → coherent crosstalk

**Power budgeting**:
Total on-chip power < 100 mW typical
SRS threshold ~ few mW per waveguide
Need power management

**Thermal effects**:
SRS power → heat → thermal crosstalk
Coupled electro-thermal-optical simulation needed

#### 5.5.8 SRS Mitigation Techniques

**1. Power limiting**:
Per-waveguide power < P_th/2
Use splitters, attenuators

**2. Wavelength allocation**:
Avoid channel pairs separated by Ω_R
SRS crosstalk only for specific Δλ ≈ 100 nm

**3. Reverse-biased p-i-n**:
Sweep carriers → reduce FCA
Increases SRS threshold
Allows higher power

**4. Pulsed operation**:
Low duty cycle, high peak power
Average power below threshold
Carriers recombine between pulses

**5. Material choice**:
SiN: g_R ≈ 0.7 cm/GW (15× lower)
No TPA at 1550 nm
Better for high-power passive circuits

**6. Dispersion engineering**:
Phase mismatch for SRS (Δβ ≠ 0)
Reduces gain: g_eff = g_R sinc(Δβ L/2)

#### 5.5.9 SRS Characterization Methods

**Gain measurement**:
Counter-propagating pump-probe
Measure Stokes gain vs. pump power
Extract g_R, P_th

**Noise measurement**:
Pump only, measure Stokes ASE
Carrier-to-noise ratio (CNR)

**Time-resolved**:
Pump-probe with ps resolution
Raman response function h_R(t)
h_R(t) = (τ₁²+τ₂²)/(τ₁τ₂²) exp(-t/τ₂) sin(t/τ₁)
τ₁ ≈ 50 fs, τ₂ ≈ 3 ps (silicon)

**Pump-probe spectroscopy**:
Femtosecond pulses
Measure Raman gain spectrum
Extract Γ_R, Ω_R

#### 5.5.10 SRS in Future High-Power Silicon Photonics

**High-power applications**:
- Optical phased arrays (LiDAR): > 1 W
- Nonlinear signal processing: high peak power
- Raman lasers/amplifiers: CW operation needed

**Advanced mitigation**:
- **Slot waveguides**: field in low-index region, lower g_R
- **Hybrid Si/III-V**: gain in III-V, passive Si
- **Photonic crystal waveguides**: slow light enhances g_R (bad) or bandgap suppresses
- **Strained silicon**: modifies Raman spectrum
- **Cryogenic operation**: n_th → 0, but τ_c longer

**Co-integration with electronics**:
- Monitor SRS via on-chip photodiodes
- Dynamic power control
- Thermal-aware routing

**Standardization**:
- SRS-aware design rules
- Power density limits per layer
- Crosstalk budgets including SRS

---

*End of Piece 5. Next: Piece 6 - Nonlinear Schrödinger Equation for Pulse Propagation*# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 6: Nonlinear Schrödinger Equation for Pulse Propagation

---

### 5.6 Nonlinear Schrödinger Equation for Pulse Propagation

The Nonlinear Schrödinger Equation (NLSE) is the fundamental equation governing pulse propagation in nonlinear optical fibers and waveguides. It captures the interplay between dispersion, nonlinearity, and loss, forming the basis for modeling WDM system impairments.

#### 5.6.1 Derivation of NLSE

**Starting from Maxwell's equations**:
∇ × E = -μ₀ ∂H/∂t
∇ × H = ε₀ ∂E/∂t + ∂P/∂t

**Polarization**:
P = P_L + P_NL
P_L = ε₀ χ⁽¹⁾ E (linear)
P_NL = ε₀ χ⁽³⁾ |E|² E (Kerr nonlinearity)

**Slowly varying envelope approximation**:
E(r,t) = ½ [A(z,t) F(x,y) e^{j(β₀z-ω₀t)} + c.c.]

**Wave equation for envelope**:
∂A/∂z + β₁ ∂A/∂t + jβ₂/2 ∂²A/∂t² - β₃/6 ∂³A/∂t³ + ...
= -α/2 A + jγ |A|² A

where γ = n₂ ω₀ / (c A_eff)

#### 5.6.2 NLSE Terms and Physical Meaning

**Linear terms**:
- β₁ = 1/v_g: inverse group velocity (walk-off)
- β₂ = dβ₁/dω: group velocity dispersion (GVD)
- β₃ = dβ₂/dω: third-order dispersion (TOD)
- α: linear loss coefficient

**Nonlinear term**:
γ|A|²A: self-phase modulation (SPM), cross-phase modulation (XPM), four-wave mixing (FWM)

**Raman term** (delayed nonlinearity):
jγ A ∫ h_R(t') |A(t-t')|² dt'
h_R(t) = (τ₁²+τ₂²)/(τ₁τ₂²) e^{-t/τ₂} sin(t/τ₁)

**Self-steepening**:
j ∂/∂t (γ|A|²A)/ω₀
Shock wave formation, optical wave breaking

#### 5.6.3 Soliton Solutions

**Fundamental soliton** (β₂ < 0, anomalous dispersion):
A(z,t) = √P₀ sech(t/T₀) exp(jz/2L_D)

where L_D = T₀²/|β₂| (dispersion length)
L_NL = 1/(γ P₀) (nonlinear length)
Soliton condition: L_D = L_NL → N = 1

**N-th order soliton**:
A(z,t) = N √P₀ sech(t/T₀) × periodic evolution
Period: z₀ = (π/2) L_D

**Dispersion-managed solitons**:
Alternating β₂ > 0 and β₂ < 0
Average β₂ ≈ 0, but pulse breathes
Used in high-capacity systems

#### 5.6.4 WDM: Coupled NLSE

**Multi-channel NLSE** (for channels n = 1..N):
∂A_n/∂z + β₁ ∂A_n/∂t + jβ₂/2 ∂²A_n/∂t²
= -α/2 A_n + jγ [ |A_n|² + 2 Σ_{m≠n} |A_m|² ] A_n
+ 2jγ Σ_{m≠n} A_m² A*_n (XPM with phase correlation)
+ jγ Σ_{i,j,k} A_i A_j A*_k δ(ω_i+ω_j-ω_k-ω_n) (FWM)

**Manakov equation** (random polarization):
∂A/∂z = ... + j(8/9)γ |A|² A
Averaged over fast polarization rotation

#### 5.6.5 Split-Step Fourier Method (SSFM)

**Numerical solution**:
1. Linear step (frequency domain):
   Ã(ω,z+Δz) = Ã(ω,z) exp[( -α/2 + jβ₂ω²/2 - jβ₃ω³/6 ) Δz]
2. Nonlinear step (time domain):
   A(t,z+Δz) = A(t,z) exp[ jγ |A|² Δz + Raman + self-steepening ]
3. Repeat

**Adaptive step size**:
Δz = min( 0.1/γP_max, 0.1 T₀²/|β₂|, ... )

**Symmetrized SSFM** (higher order):
½ Linear → Nonlinear → ½ Linear

#### 5.6.6 Nonlinear Impairments from NLSE

**Self-Phase Modulation (SPM)**:
Phase shift: φ_NL = γ P L_eff
Spectral broadening: Δω ≈ φ_NL / T₀
Chirp: δω(t) = -∂φ_NL/∂t

**Cross-Phase Modulation (XPM)**:
Phase on channel n from m:
φ_XPM = 2γ ∫ P_m(z) dz
More severe than SPM (factor 2)

**Four-Wave Mixing (FWM)**:
Energy transfer between channels
Phase matching: Δβ = 0

**Raman effects**:
SRS: power transfer to longer λ
Raman-induced crosstalk
Raman gain saturation

**Modulation instability**:
CW beam breaks into pulse train
Gain: g = 2√(γ P |β₂| ω) - α
Threshold: P > |β₂|/γ ω²

#### 5.6.7 Perturbation Theory for NLSE

**Linearized NLSE** (small signal on CW background):
A = √P₀ + a(z,t) e^{jγP₀z}
∂a/∂z + β₁ ∂a/∂t + jβ₂/2 ∂²a/∂t² = jγP₀ (a + a*)

**Eigenmode analysis**:
a(z,t) = u e^{j(Ωt - Kz)} + v* e^{-j(Ωt - Kz)}
Dispersion relation:
K² = (β₂Ω²/2)² - (γP₀)² + ...

**Gain spectrum**:
For β₂ < 0: modulation instability gain
For β₂ > 0: no instability (stable)

#### 5.6.8 Variational Method for Pulse Evolution

**Lagrangian density**:
L = (j/2)(A*∂A/∂z - A∂A*/∂z) - β₂/2 |∂A/∂t|² + γ/2 |A|⁴

**Ansatz** (Gaussian pulse):
A(z,t) = √P₀ (T₀/T) exp[ - (1+jC)t²/2T² + jφ ]

**Euler-Lagrange equations**:
dT/dz = β₂ C T / T₀²
dC/dz = β₂ (C² - 1)/T₀² + 2γP₀/√π T₀/T
...

**Pulse parameters evolution**:
Width T(z), chirp C(z), phase φ(z)

#### 5.6.9 NLSE for Silicon Waveguides

**Modified NLSE for Si**:
∂A/∂z = -α/2 A - β_TPA/2 |A|² A - σ_FCA N_c A
+ jβ₂/2 ∂²A/∂t² - β₃/6 ∂³A/∂t³
+ jγ |A|² A + jγ_R A ∫ h_R(t')|A(t-t')|² dt'

**Carrier density**:
∂N_c/∂t = β_TPA/(2ħω) |A|⁴ - N_c/τ_c + D∇²N_c

**Free-carrier effects**:
σ_FCA = σ_e + σ_h
Δn_FC = - (e²λ²/8π²c²ε₀n) (N_e/m_e + N_h/m_h)

**Two-photon absorption**:
β_TPA ≈ 0.5 cm/GW
Limits peak power, effective length

#### 5.6.10 Numerical Validation and Applications

**Validation metrics**:
- Soliton propagation: shape preservation
- SPM spectrum: analytical vs numerical
- FWM efficiency: phase matching curves
- Raman gain: g_R(Ω) vs theory

**Applications**:
- System design (100G, 400G, 800G+)
- Digital back-propagation (DBP) algorithms
- Nonlinear compensation (inverse NLSE)
- Soliton communication systems
- Supercontinuum generation
- Frequency comb generation

**Performance optimization**:
- Step size control (local error)
- Parallelization (channel-level, z-level)
- GPU acceleration (cuFFT)
- Reduced models (moment method, moment closure)

---

*End of Piece 6. Next: Piece 7 - Dispersion Management: β₂, β₃, β₄ Engineering in Si Waveguides*# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 7: Dispersion Management: β₂, β₃, β₄ Engineering in Si Waveguides

---

### 5.7 Dispersion Management: β₂, β₃, β₄ Engineering in Si Waveguides

Dispersion engineering in silicon waveguides is crucial for controlling pulse propagation, phase matching for nonlinear processes, and WDM crosstalk. By tailoring waveguide geometry, the dispersion coefficients β₂ (GVD), β₃ (TOD), and β₄ (FOD) can be optimized for specific applications.

#### 5.7.1 Dispersion Fundamentals

**Propagation constant expansion**:
β(ω) = β₀ + β₁(ω-ω₀) + ½β₂(ω-ω₀)² + ⅙β₃(ω-ω₀)³ + ¹/₂₄β₄(ω-ω₀)⁴ + ...

**Coefficients**:
β₁ = 1/v_g (group velocity)
β₂ = d²β/dω² = -λ²/(2πc) D (GVD)
β₃ = dβ₂/dω (TOD)
β₄ = dβ₃/dω (FOD)

**Dispersion parameter**:
D = -2πc/λ² β₂ (ps/nm/km)

**Zero-dispersion wavelength (ZDW)**:
β₂(λ_ZDW) = 0

#### 5.7.2 Silicon Waveguide Dispersion

**Geometry dependence** (SOI strip waveguide, 220 nm height):
- Width W < 400 nm: anomalous dispersion (β₂ < 0) at 1550 nm
- Width W > 400 nm: normal dispersion (β₂ > 0)
- ZDW tunable from 1300 nm to 1700 nm by width

**Typical values** (450×220 nm):
β₂ ≈ -50 ps²/km (anomalous)
β₃ ≈ 0.1 ps³/km
β₄ ≈ 10⁻⁴ ps⁴/km

**Slot waveguide** (low-index slot):
Enhanced confinement, tailored dispersion
ZDW shift by 100+ nm

**Sub-wavelength grating (SWG)**:
Effective index tuning
Dispersion engineering via period/duty cycle

#### 5.7.3 Dispersion Engineering Techniques

**1. Width tuning**:
W = 300-600 nm → ZDW 1300-1700 nm
β₂ range: -200 to +200 ps²/km

**2. Height tuning**:
H = 180-300 nm
Less sensitive than width

**3. Partial etch / rib waveguide**:
Slab height controls mode confinement
Additional degree of freedom

**4. Stress engineering**:
SiN stressor layer
Stress-optic effect: Δn = C σ
Shifts dispersion by ±50 ps²/km

**4. Sub-wavelength grating (SWG)**:
Period Λ < λ/n_eff
Effective index n_eff(Λ, DC)
Dispersion via Bloch mode engineering

**5. Photonic crystal waveguides**:
Periodic holes
Slow light: v_g → 0, β₂ → ±∞
Tailored dispersion near band edge

#### 5.7.4 Dispersion for Nonlinear Applications

**FWM phase matching**:
Δβ = β₂ Ω² + ⅛β₄ Ω⁴ + ... - 2γP = 0

**For broadband FWM** (octave-spanning):
Need β₂ ≈ 0 (ZDW at pump)
β₄ controls bandwidth
Optimal: β₄ < 0 for symmetric phase matching

**Supercontinuum generation**:
Pump in anomalous dispersion (β₂ < 0)
Soliton fission, dispersive wave emission
β₃, β₄ control spectral edges

**Frequency comb generation**:
Microcavity + anomalous dispersion
Soliton formation, Kerr comb
Dispersion engineering for coherent combs

#### 5.7.5 WDM Crosstalk and Dispersion

**XPM walk-off**:
Δτ = β₂ L Δλ
For 50 GHz (0.4 nm) spacing, L = 1 cm:
Δτ ≈ 50 ps²/km × 0.01 km × 0.4 nm ≈ 0.2 ps
Negligible for on-chip, significant for long fiber

**FWM suppression**:
Non-zero β₂ → phase mismatch
Δβ = β₂ Δω²
For 50 GHz, β₂ = 17 ps²/km (fiber):
Δβ L = 17 × (2π×50×10⁹)² × 80 ≈ large
sinc²(ΔβL/2) ≈ 0

**Si waveguide** (β₂ = 50 ps²/km, L = 1 cm):
Δβ L = 50 × (2π×50×10⁹)² × 0.01 ≈ 0.5
sinc²(0.25) ≈ 0.9 → FWM NOT suppressed!

**Conclusion**: On-chip FWM requires active suppression (unequal spacing, power control)

#### 5.7.6 Higher-Order Dispersion Effects

**Third-order dispersion (β₃)**:
Asymmetric pulse broadening
Temporal skewing
Important for few-cycle pulses

**Fourth-order dispersion (β₄)**:
Symmetric broadening of tails
Controls dispersive wave phase matching
Critical for supercontinuum flatness

**Dispersion length hierarchy**:
L_D2 = T₀²/|β₂|
L_D3 = T₀³/|β₃|
L_D4 = T₀⁴/|β₄|

For T₀ = 1 ps, β₂ = 50 ps²/km, β₃ = 0.1 ps³/km, β₄ = 10⁻⁴ ps⁴/km:
L_D2 = 20 m, L_D3 = 1 km, L_D4 = 10 km
On-chip (cm): all negligible
For fiber (km): β₂ dominates, β₃, β₄ minor

#### 5.7.7 Dispersion Measurement Techniques

**Spectral interferometry (SI)**:
White light + reference arm
Measure spectral phase φ(ω)
Fit polynomial → β₂, β₃, β₄

**Phase-shift method**:
Measure transfer function H(ω) = |H|e^{jφ}
φ(ω) = β(ω)L
Numerical differentiation → β₂, β₃, β₄

**FROG (Frequency-Resolved Optical Gating)**:
Measure pulse spectrogram
Retrieve phase, amplitude
Extract dispersion

**Ring resonator method**:
Resonance wavelengths λ_m
mλ = n_eff L
Fit n_eff(λ) → dispersion

#### 5.7.8 Dispersion Compensation on Chip

**Chirped waveguide gratings**:
Λ(z) varying along waveguide
Reflects different λ at different z
Compensates β₂, β₃

**Coupled resonator optical waveguides (CROW)**:
Coupled microrings
Engineered group delay
Negative β₂ possible

**Photonic crystal waveguides**:
Near band edge: β₂ < 0 (anomalous)
Tailored β₂, β₃

**Digital compensation (DSP)**:
In coherent receivers
Frequency-domain equalization
FIR filter with conjugate phase

#### 5.7.9 Statistical Variation Impact

**Width variation** (σ_W = 1-2 nm):
Δβ₂ ≈ (dβ₂/dW) σ_W
dβ₂/dW ≈ 1-2 ps²/km/nm
σ_β₂ ≈ 1-4 ps²/km

**Impact on FWM**:
Δ(Δβ) = σ_β₂ Δω²
For 50 GHz: Δ(Δβ)L ≈ 0.02 (negligible on-chip)

**Impact on supercontinuum**:
ZDW variation → shot-to-shot spectral variation
Major challenge for reproducible SCG

**Design margin**:
Target β₂ = 0 ± 5 ps²/km for ZDW applications
Requires σ_W < 1 nm (EUV lithography)

#### 5.7.10 Advanced Dispersion Engineering

**Adiabatic dispersion transition**:
Gradual width change
Mode conversion without reflection
Connects different dispersion regimes

**Dispersion-managed waveguide**:
Periodic width modulation
Average β₂ = 0, local β₂ ≠ 0
Quasi-phase-matching for FWM

**Topological dispersion engineering**:
Valley-Hall photonic crystals
Edge states with tailored dispersion
Robust against disorder

**Active dispersion tuning**:
Carrier injection (plasma dispersion)
Δn = -8.8×10⁻²² N_e - 8.5×10⁻¹⁸ N_h
Δβ₂ via carrier density gradient

**Thermal tuning**:
dn/dT = 1.86×10⁻⁴ K⁻¹
Δβ₂ via temperature gradient
Slow (ms), but large range

**Machine learning for inverse design**:
NN maps geometry → dispersion
Optimize for target β₂, β₃, β₄
Inverse design in minutes

---

*End of Piece 7. Next: Piece 8 - Nyquist WDM: Spectral Shaping and Superchannel Formation*# Document 5: Wavelength Division Multiplexing Mathematics
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

*End of Piece 8. Next: Piece 9 - Optical Signal-to-Noise Ratio (OSNR) Budget for 100+ Channels*# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 9: Optical Signal-to-Noise Ratio (OSNR) Budget for 100+ Channels

---

### 5.9 Optical Signal-to-Noise Ratio (OSNR) Budget for 100+ Channels

OSNR is the key metric for optical link performance in amplified WDM systems. For 100+ channel systems spanning C+L bands, the OSNR budget must account for amplifier noise, nonlinear penalties, crosstalk, and component impairments to ensure target BER across all channels.

#### 5.9.1 OSNR Definition and Measurement

**OSNR definition** (per 0.1 nm reference bandwidth):
OSNR = P_sig / P_ASE (in 0.1 nm ≈ 12.5 GHz at 1550 nm)

**In dB**:
OSNR_dB = 10 log₁₀(P_sig/P_ASE) + 10 log₁₀(B_ref/B_meas)
where B_ref = 12.5 GHz, B_meas = measurement resolution

**In-band OSNR (IB-OSNR)**:
Measured within signal bandwidth
IB-OSNR = P_sig / P_noise (in signal BW)

**Polarization-resolved OSNR**:
OSNR_x, OSNR_y (for coherent)
OSNR = (OSNR_x + OSNR_y)/2

#### 5.9.2 ASE Noise from Optical Amplifiers

**EDFA (Erbium-Doped Fiber Amplifier)**:
ASE power spectral density:
S_ASE = n_sp hν (G - 1) (W/Hz)
n_sp = population inversion factor (≥ 1)
G = gain

**Noise figure**:
NF = 2 n_sp (G - 1)/G ≈ 2 n_sp (for G ≫ 1)
Quantum limit: NF = 3 dB (n_sp = 1)
Practical EDFA: NF = 4.5-6 dB

**Raman amplifier**:
Lower NF (can approach 0 dB)
Distributed gain → better OSNR
SRS pump noise transfer

**SOA (Semiconductor Optical Amplifier)**:
High NF (7-10 dB)
Fast gain saturation
Pattern-dependent effects

#### 5.9.3 Cascaded Amplifier OSNR

**N identical spans** (loss = G per span):
OSNR_total = P_sig / (N × P_ASE,span)

**OSNR after N spans**:
1/OSNR_N = N / OSNR_1
OSNR_N = OSNR_1 / N

**In dB**:
OSNR_N,dB = OSNR_1,dB - 10 log₁₀(N)

**Example**: 20 spans, 80 km each, OSNR_1 = 30 dB
OSNR_20 = 30 - 10 log₁₀(20) = 30 - 13 = 17 dB

**Hybrid amplification** (EDFA + Raman):
OSNR improvement: 2-4 dB
Raman provides distributed gain
Reduces effective span loss

#### 5.9.4 OSNR Requirements by Modulation Format

**Required OSNR** (at BER = 10⁻³ pre-FEC, 0.1 nm BW):

| Format | SE (b/s/Hz) | OSNR_req (dB) |
|--------|-------------|---------------|
| BPSK | 1 | 9-10 |
| QPSK | 2 | 12-13 |
| 8-QAM | 3 | 15-16 |
| 16-QAM | 4 | 18-19 |
| 32-QAM | 5 | 21-22 |
| 64-QAM | 6 | 24-25 |
| PAM-4 (direct detect) | 2 | 20-22 |

**With FEC overhead** (20% KP4):
Post-FEC BER < 10⁻¹⁵
Pre-FEC BER ≈ 10⁻³ to 10⁻⁴
OSNR penalty: ~0.5-1 dB vs. uncoded

**Penalty factors**:
- Nonlinear penalty: 0.5-2 dB
- Component penalty: 0.5-1 dB
- Implementation penalty: 0.5-1 dB
- Aging/temp margin: 1-2 dB

#### 5.9.5 OSNR Budget for 100+ Channel System

**System example**: 100 channels × 100 GHz, C+L band (8 THz)
- Reach: 1000 km (12 spans × 80 km)
- EDFA only: NF = 5 dB
- Span loss: 16 dB (80 km SMF)

**Per-span ASE**:
P_ASE = n_sp hν (G-1) B_ch
G = 16 dB = 40
n_sp = 1.6 (NF = 5 dB)
B_ch = 50 GHz (for 100G QPSK)
P_ASE ≈ 1.6 × 1.28e-19 × 39 × 50e9 ≈ 4e-8 W = -44 dBm

**Total ASE after 12 spans**:
P_ASE,total = 12 × (-44 dBm) = -33.2 dBm (in 50 GHz)
Wait: powers add → P_total = P_1 + 10log10(12) = -44 + 10.8 = -33.2 dBm

**Signal power per channel**:
Launch: 0 dBm per channel
After 12 spans: 0 dBm (gain = loss)

**OSNR** (in 50 GHz):
OSNR = 0 - (-33.2) = 33.2 dB (in 50 GHz)
OSNR (0.1 nm) = 33.2 + 10log10(12.5/50) = 33.2 - 6 = 27.2 dB

**Required OSNR** (QPSK): ~13 dB
**Margin**: 27.2 - 13 = 14.2 dB

**Penalties** (subtracted from margin):
- Nonlinear: 1.5 dB
- Component (PDL, PMD, filter): 1 dB
- Crosstalk: 0.5 dB
- Implementation: 1 dB
- Aging/temp: 1.5 dB
Total penalties: 5.5 dB

**Net margin**: 14.2 - 5.5 = 8.7 dB (healthy)

#### 5.9.6 Wavelength-Dependent OSNR

**Gain tilt** (EDFA):
Gain varies with wavelength
C-band: ~3-5 dB tilt
Flattening: gain flattening filter (GFF)

**Raman tilt**:
Shorter λ → higher gain
Tilt across C-band: ~3 dB

**Total tilt** (EDFA + Raman):
Can be compensated by:
- Pre-emphasis (variable attenuator array)
- Dynamic gain equalization (DGE)
- Channel-by-channel power control

**OSNR variation across band**:
ΔOSNR ≈ tilt + ASE variation
Typical: 2-3 dB across C-band
Design for worst-case channel (usually edges)

#### 5.9.7 Nonlinear OSNR Penalty

**GN model** (Gaussian Noise model):
Nonlinear interference (NLI) power:
P_NLI = η_NLI P_ch³
η_NLI = (16/27) γ² / (α |β₂|) × arcsinh(π² β₂ B² N_ch²/2α) / (π β₂ B)

**OSNR with NLI**:
OSNR_NL = P_ch / (P_ASE + P_NLI)

**Effective OSNR penalty**:
ΔOSNR_NL = 10 log₁₀(1 + P_NLI/P_ASE)

**For 400G QPSK, 1000 km**:
P_NLI/P_ASE ≈ 0.1-0.3
ΔOSNR_NL ≈ 0.4-1.2 dB

**For 800G 16-QAM**:
More sensitive to nonlinearity
ΔOSNR_NL ≈ 1-2 dB

**Mitigation**:
- Lower launch power (optimal power)
- Larger effective area fiber
- Digital back-propagation (DBP)

#### 5.9.8 OSNR Monitoring and Control

**In-service OSNR monitoring**:
- **Polarization-nulling**: polarization scrambling + nulling
- **ASE interpolation**: fit ASE between channels
- **Pilot tone**: out-of-band pilot
- **Coherent RX**: direct OSNR estimation from constellation

**Dynamic OSNR control**:
- **VOA array**: per-channel power control
- **DGE (Dynamic Gain Equalizer)**: per-wavelength gain
- **Raman pump control**: adjust tilt
- **EDFA gain/tilt control**: constant power, constant gain

**Control loop**:
1. Monitor OSNR (per channel)
2. Compare to target
3. Adjust VOA/DGE/Raman
4. Converge in < 1 s

#### 5.9.9 OSNR Margin and Link Design

**Design margin** (typical):
- System margin: 3 dB
- Aging: 1 dB
- Temperature: 1 dB
- Repair: 1 dB
- Manufacturing: 1 dB
Total: 7 dB

**Link design process**:
1. Define reach, capacity, BER
2. Choose modulation, FEC
3. Calculate required OSNR
3. Design amplifier chain (span count, type)
4. Calculate OSNR with penalties
5. Verify margin > 0
6. Optimize launch power (minimize NLI)
7. Add margins, verify

**Optimal launch power**:
P_opt = (P_ASE / (2 η_NLI))^{1/3}
Balances ASE and NLI

#### 5.9.10 Future: OSNR for 800G/1.6T and Beyond

**Higher-order modulation**:
64-QAM: OSNR_req ≈ 25 dB
256-QAM: OSNR_req ≈ 30 dB
Requires: lower NF amps, better DSP, lower nonlinearity

**Probabilistic constellation shaping (PCS)**:
0.5-1 dB OSNR reduction at same SE
Adaptive to channel conditions

**Geometric shaping**:
Constellation on sphere (spherical codes)
0.2-0.5 dB gain

**Joint TX/RX optimization**:
End-to-end learned transceivers
Neural network equalizers
Joint optimization with FEC

**Quantum-limited amplifiers**:
Phase-sensitive amplifiers (PSA)
NF → 0 dB (theoretical)
Pump phase noise limitation

**All-optical processing**:
Optical phase conjugation (OPC)
Mid-link spectral inversion
Cancels nonlinear phase noise

---

*End of Piece 9. Next: Piece 10 - Wavelength Routing: Broadcast-and-Select vs. Wavelength-Selective Switch*# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 10: Wavelength Routing: Broadcast-and-Select vs. Wavelength-Selective Switch

---

### 5.10 Wavelength Routing: Broadcast-and-Select vs. Wavelength-Selective Switch

Wavelength routing architectures determine how WDM channels are switched and directed through optical networks. The two primary paradigms—broadcast-and-select and wavelength-selective switching—offer different trade-offs in scalability, loss, crosstalk, and flexibility for ROADMs, OXCs, and datacenter interconnects.

#### 5.10.1 Broadcast-and-Select Architecture

**Principle**: All wavelengths broadcast to all outputs; selection at receiver
- **Broadcast**: Passive splitter (star coupler, AWG)
- **Select**: Tunable filter at each receiver

**Star coupler (N×N)**:
- Input → 1/N splitter → N outputs
- Each output receives all wavelengths
- Receiver uses tunable filter to select desired λ

**AWG-based broadcast**:
- Cyclic AWG (periodic routing)
- Input i → output (i + k) mod N for wavelength k
- All wavelengths at each output (different mapping)

**Receiver-side selection**:
- Tunable filter (MEMS, LC, ring resonator)
- Switching time: μs to ms
- Filter bandwidth: channel spacing

**Advantages**:
- Simple, passive broadcast
- No wavelength conversion needed
- Scalable to many outputs
- Low cost per port

**Disadvantages**:
- 1/N splitting loss (10 log₁₀N dB)
- For N=64: 18 dB loss
- Amplified spontaneous emission (ASE) from pre-amplifier
- Limited by splitter loss budget

#### 5.10.2 Wavelength-Selective Switch (WSS)

**Principle**: Active routing of individual wavelengths
- Input fibers → Wavelength demux → Switching engine → Mux → Output fibers

**WSS configurations**:
- 1×N (add/drop)
- N×M (full switching)
- Flexible grid (37.5/75 GHz slots)

**Switching technologies**:
1. **MEMS (Micro-Electro-Mechanical Systems)**:
   - Tilt mirrors steer beams
   - 1D or 2D arrays
   - Low loss (0.5-1 dB), low crosstalk (-50 dB)
   - Slow (ms), high voltage

2. **LCoS (Liquid Crystal on Silicon)**:
   - Phase hologram on LC pixels
   - Flexible grid, hitless switching
   - Polarization dependent
   - Fast (ms), low voltage

3. **Liquid Crystal (LC) beam steering**:
   - Prism/grating via LC phase profile
   - Continuous steering
   - Low power

4. **Waveguide-based (Si photonics)**:
   - Thermo-optic MZI/MRR switches
   - Fast (μs), integrated
   - Higher loss, crosstalk

5. **Acousto-optic (AO)**:
   - Sound wave creates grating
   - Fast (μs), analog
   - Limited resolution

#### 5.10.3 WSS Architecture Comparison

**MEMS WSS (dominant commercial)**:
- Demux: grating or AWG
- MEMS mirror array (1D or 2D)
- Mux: same grating/AWG
- Ports: 1×4, 1×9, 1×20, 1×50
- Flexible grid: 50 GHz resolution
- IL: 4-6 dB (including demux/mux)
- Crosstalk: -40 to -50 dB
- PDL: < 0.3 dB

**LCoS WSS (emerging)**:
- Single LCoS panel for all ports
- Software-defined spectrum
- Hitless resizing
- IL: 5-7 dB
- PDL: < 0.5 dB (improving)

#### 5.10.4 ROADM Architectures

**CDC-ROADM (Colorless, Directionless, Contentionless)**:
- Any wavelength, any direction, no contention
- Uses WSS for add/drop
- Multiple WSS for directionless

**CD-ROADM (Colorless, Directionless)**:
- No contentionless (shared drop)
- Lower cost

**C-ROADM (Colorless only)**:
- Fixed direction
- Simpler

**Degree-N ROADM**:
- N directions (N = 2-20)
- Mesh networking
- WSS count scales with degree

**ROADM block diagram**:
Line amps → Demux → WSS (express) → Mux → Line amps
                    ↓
              WSS (add/drop)
                    ↓
              Transponders

#### 5.10.5 Broadcast-and-Select vs. WSS: Trade-offs

| Parameter | Broadcast-and-Select | WSS |
|-----------|---------------------|-----|
| Scalability (ports) | Excellent (passive) | Good (active) |
| Insertion loss | 10 log₁₀N dB | 4-7 dB (fixed) |
| Power | Passive (no power) | Active (WSS: 10-50W) |
| Switching speed | Filter speed (μs-ms) | WSS speed (ms) |
| Flexibility | Fixed grid | Flexible grid |
| Cost per port | Low (splitter) | High (WSS) |
| Crosstalk | Limited by filter | -40 to -50 dB |
| Granularity | Channel | Sub-channel (slice) |

**When to use broadcast-and-select**:
- Small N (< 16)
- Fixed wavelength assignment
- Cost-sensitive (access, metro)
- Datacenter (single-hop)

**When to use WSS**:
- Large N (> 16)
- Dynamic wavelength routing
- Mesh networks (core, metro)
- Flexible grid needed
- CDC requirements

#### 5.10.6 Datacenter Interconnect Architectures

**Single-hop (broadcast)**:
- ToR switches → passive star/AWG → servers
- All-to-all connectivity
- No routing latency
- Limited by splitter loss (N ≤ 64)

**Multi-hop (WSS/OXC)**:
- Spine-leaf with optical circuit switching
- OCS (Optical Circuit Switch) for elephant flows
- EPS (Electrical Packet Switch) for mice flows
- Hybrid OCS/EPS

**Optical Circuit Switching (OCS)**:
- MEMS OCS (Google, Microsoft)
- 10-50 μs switching
- Circuit-switched, not packet-switched
- Saves 30-50% power vs. all-electrical

**Wavelength-routed datacenter**:
- Each server: tunable Tx, fixed Rx (or coherent)
- Wavelength = destination
- AWG/star for routing
- Centralized wavelength assignment

#### 5.10.7 Flexible Grid and Elastic Optical Networking

**Flexible grid (ITU-T G.694.1)**:
- Slot width: 12.5 GHz
- Channel = N × 12.5 GHz
- Minimum guard band: 12.5 GHz

**WSS requirements for flex-grid**:
- Slot resolution: 12.5 GHz (or 6.25 GHz)
- Variable bandwidth per channel
- Hitless add/drop/resize

**Elastic optical networking**:
- Bandwidth on demand
- Modulation format adaptation
- Spectrum defragmentation

**Spectrum allocation algorithms**:
- First-fit, best-fit, exact-fit
- Defragmentation: hitless vs. make-before-break
- Fragmentation metric: usable spectrum blocks

#### 5.10.8 OXC (Optical Cross-Connect) Scaling

**OXC generations**:
- OXC-1: Opaque (O-E-O), digital switching
- OXC-2: Transparent (OOO), wavelength switching
- OXC-3: Translucent, selective regeneration

**Port count scaling**:
- MEMS OXC: 1000×1000 demonstrated
- 3D MEMS: 2D mirror arrays
- Waveguide OXC: Si photonics, 128×128

**Switching fabric architectures**:
- **Single-stage**: N×N direct (broadcast or WSS)
- **Two-stage**: N×k → k×N (Clos)
- **Three-stage**: Clos-N (scalable)

**Clos architecture for OXC**:
- Stage 1: N/r × r WSS
- Stage 2: r × N/r WSS
- Non-blocking if r ≥ 2N-1
- Practical: r = N/2 to N

#### 5.10.9 Emerging Wavelength Routing Technologies

**Silicon photonic OXC**:
- Thermo-optic MZI mesh
- 128×128 demonstrated
- μs switching, 10 dB loss
- CMOS compatible

**Hybrid MEMS/SiPh**:
- MEMS for coarse routing
- SiPh for fine add/drop
- Best of both worlds

**Free-space optical switching**:
- MEMS mirrors in free space
- 1000×1000 ports
- Low loss, low crosstalk
- Bulk, alignment sensitive

**Quantum wavelength routing**:
- Entanglement distribution
- Quantum repeaters
- Wavelength-selective Bell measurement

**AI-driven optical networking**:
- ML for traffic prediction
- Proactive wavelength allocation
- Reinforcement learning for routing

#### 5.10.10 Future: Petabit Optical Switching

**Scaling challenges**:
- Port count: 1000 → 10,000 → 100,000
- Power: WSS 10W/port → 100 kW total
- Control plane complexity
- Reliability (MTBF)

**Solutions**:
- **Photonic integration**: SiPh OXC (μW/port)
- **Hierarchical switching**: OCS for bulk, EPS for detail
- **Optical packet switching (OPS)**: label switching
- **Flow-based**: circuit for elephants, packet for mice

**Architecture evolution**:
- 2020s: CDC-ROADM, 400G/800G
- 2025: Flex-grid, 1.6T, open ROADM
- 2030: 10T superchannels, AI-driven
- 2035: Photonic integrated OXC, quantum-ready

**Conclusion**: Broadcast-and-select for small-scale, low-cost; WSS for large-scale, flexible, dynamic networks. Convergence toward photonic integration for power/scaling.

---

*End of Piece 10. Document 5 complete (10 pieces). Next: Glue pieces into Doc05_Final.md*