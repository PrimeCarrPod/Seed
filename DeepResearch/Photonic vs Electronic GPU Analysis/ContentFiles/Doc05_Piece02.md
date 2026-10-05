# Document 5: Wavelength Division Multiplexing Mathematics
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

*End of Piece 2. Next: Piece 3 - Channel Crosstalk: Coherent vs. Incoherent Accumulation*