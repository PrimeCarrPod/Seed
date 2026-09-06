# Document 5: Wavelength Division Multiplexing Mathematics
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

*End of Piece 3. Next: Piece 4 - Four-Wave Mixing Induced Crosstalk in Dense WDM*