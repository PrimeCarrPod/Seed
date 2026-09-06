# Document 5: Wavelength Division Multiplexing Mathematics
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

*End of Piece 5. Next: Piece 6 - Nonlinear Schrödinger Equation for Pulse Propagation*