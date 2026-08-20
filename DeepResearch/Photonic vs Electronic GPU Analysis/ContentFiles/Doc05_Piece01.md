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

*End of Piece 1. Next: Piece 2 - Fourier Optics Formulation of Spectral Decomposition*