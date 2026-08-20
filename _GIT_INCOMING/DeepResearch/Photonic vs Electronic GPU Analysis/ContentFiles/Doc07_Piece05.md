# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 5: Two-Photon Absorption (TPA) and Free-Carrier Absorption (FCA)

---

### 7.5 Two-Photon Absorption (TPA) and Free-Carrier Absorption (FCA)

At high optical intensities in silicon microrings, nonlinear absorption effects—two-photon absorption (TPA) and the resulting free-carrier absorption (FCA)—become significant. These effects limit the maximum circulating power, cause resonance shifts, and introduce excess noise.

#### 7.5.1 Two-Photon Absorption in Silicon

**Mechanism**: Simultaneous absorption of two photons
E_photon + E_photon → E_electron (across bandgap)
Threshold: 2ħω > E_g (1.12 eV for Si)
At 1550 nm (0.8 eV): 2ħω = 1.6 eV > E_g → TPA allowed

**TPA coefficient**:
β_TPA = 0.5-1 cm/GW at 1550 nm
= 5-10×10⁻¹² m/W

**Power loss**:
dP/dz = -α_lin P - β_TPA P²/A_eff

**TPA-generated carriers**:
dN_c/dt = β_TPA P²/(2ħω A_eff²) - N_c/τ_c
N_c = N_e = N_h (electron-hole pairs)

#### 7.5.2 Free-Carrier Absorption (FCA)

**FCA cross-sections** (at 1550 nm):
σ_e = 1.45×10⁻¹⁷ cm² (electrons)
σ_h = 1.35×10⁻¹⁷ cm² (holes)

**FCA loss coefficient**:
α_FCA = σ_e N_e + σ_h N_h
≈ 1.4×10⁻¹⁷ N_c (cm⁻¹)

**Free-carrier refraction (FCR)**:
Δn_FC = - (e²λ²/8π²c²ε₀n) (N_e/m_e* + N_h/m_h*)
= -8.8×10⁻²² N_e - 8.5×10⁻¹⁸ N_h (cm³)

**Resonance shift from FCR**:
Δλ_FC = (λ/n_g) Δn_FC
For N_c = 10¹⁷ cm⁻³: Δλ ≈ 0.1 nm

#### 7.5.3 Coupled Equations for Ring with TPA/FCA

**Circulating power P_c**:
dP_c/dt = - (γ_0 + γ_c) P_c + γ_c P_in
- β_TPA P_c²/A_eff (TPA loss)
- (σ_e + σ_h) N_c P_c (FCA loss)

**Carrier density N_c**:
dN_c/dt = β_TPA P_c²/(2ħω A_eff²) - N_c/τ_c

**Resonance frequency shift**:
dω/dt = -ω_0/n_g (dΔn_FC/dt)
Δn_FC = -8.8×10⁻²² N_c

**Steady-state** (CW input):
P_c = P_in γ_c / (γ_0 + γ_c + β_TPA P_c/A_eff + σ_FCA N_c)

**Bistability**: Nonlinear equation → multiple solutions
Hysteresis in transmission vs. input power

#### 7.5.4 TPA/FCA Limitation on Circulating Power

**Maximum circulating power** (before TPA dominates):
Set TPA loss = linear loss:
β_TPA P_max/A_eff = γ_0
P_max = γ_0 A_eff / β_TPA

**For typical values**:
γ_0 = 2π×10 GHz (Q₀ = 10⁵)
A_eff = 0.1 μm²
β_TPA = 0.5 cm/GW
P_max ≈ 1 mW

**At 1 mW circulating**:
TPA loss ≈ linear loss
Carrier density: N_c ≈ 10¹⁷ cm⁻³
FCA loss ≈ linear loss
FCR shift: Δλ ≈ 0.1 nm

**Power handling limit**: ~1-2 mW for high-Q rings

#### 7.5.5 Carrier Lifetime and Dynamic Response

**Carrier recombination mechanisms**:
1. **Radiative**: B N_e N_h (negligible in Si, indirect gap)
2. **Auger**: C N_e² N_h (dominant at high N)
3. **Shockley-Read-Hall (SRH)**: N/τ_SRH (defects)
4. **Surface recombination**: S N_surf

**Carrier lifetime** (unpinched):
τ_c ≈ 1 ns (surface-dominated)

**P-i-n diode (reverse biased)**:
Depletion region sweeps carriers
τ_c ≈ 10-100 ps (field-assisted)

**Sweep-out time**:
τ_sweep = W²/μV
W = 500 nm, μ = 1400 cm²/V·s, V = 10 V
τ_sweep ≈ 18 ps

#### 7.5.6 TPA/FCA in Ring Modulators

**Modulation mechanism**:
Forward bias → inject carriers → Δn_FC → resonance shift
Reverse bias → deplete carriers → reverse shift

**Speed limitation**:
TPA generates carriers → adds to FCA/FCR
τ_c = 1 ns (unpinched) → 100 MHz bandwidth
Pinched: τ_c = 50 ps → 20 GHz bandwidth

**Energy per bit**:
E_bit = P × τ_c
Unpinched: 1 mW × 1 ns = 1 pJ
Pinched: 10 mW × 50 ps = 0.5 pJ

**Extinction ratio limitation**:
FCA adds loss in "on" state
ER = 10 log₁₀[(α_off)/(α_on + α_FCA)]
For α_FCA = α_off: ER = 3 dB max

#### 7.5.7 TPA/FCA in Nonlinear Signal Processing

**Wavelength conversion (FWM)**:
TPA competes with FWM (both χ⁽³⁾)
FWM efficiency ∝ γ², TPA loss ∝ β_TPA
Figure of merit: FOM = γ/(β_TPA λ)
Si: FOM ≈ 0.5 (poor)
SiN: FOM → ∞ (no TPA)

**Raman amplification**:
TPA generates noise photons
Reduces Raman SNR

**Supercontinuum generation**:
TPA limits peak power
FCA broadens spectrum asymmetrically

#### 7.5.8 Mitigation Strategies

**1. Reverse-biased p-i-n diode**:
Sweep carriers in < 100 ps
Reduces FCA/FCR by 10-100×
Increases max power to 10-50 mW

**2. Pulsed operation**:
Low duty cycle (< 1%)
Peak power high, average low
Carriers recombine between pulses

**3. Hydrogenated amorphous Si (a-Si:H)**:
E_g ≈ 1.7 eV → no TPA at 1550 nm
n₂ ≈ 2×10⁻¹⁸ m²/W (lower nonlinearity)

**4. Silicon nitride (SiN)**:
E_g ≈ 5 eV → no TPA at 1550 nm
n₂ ≈ 2.4×10⁻¹⁹ m²/W (10× lower)
Q > 10⁶ demonstrated

**5. Hybrid III-V on Si**:
InGaAsP quantum wells for gain
No TPA in active region

#### 7.5.9 TPA/FCA Noise in Quantum Applications

**Spontaneous TPA**:
Generates random electron-hole pairs
Shot noise on carrier density
ΔN_c/N_c = 1/√N_c

**TPA-induced phase noise**:
Δφ_FCR = (2π/λ) Δn_FC L
Δφ_FCR/φ ≈ ΔN_c/N_c

**Impact on squeezed light**:
TPA adds vacuum noise (loss channel)
Degrades squeezing: r_eff < r_in
Squeezing limit: ~3-5 dB in Si (vs >10 dB in SiN)

**Quantum-limited parametric amplifier**:
Requires no TPA (phase-sensitive)
SiN or χ⁽²⁾ materials preferred

#### 7.5.10 Experimental Characterization

**TPA measurement**:
Pump-probe with fs pulses
Measure transmission vs. pump power
Fit: 1/T = 1 + β_TPA P L_eff / A_eff

**FCA measurement**:
Pump at λ₁, probe at λ₂
Measure probe absorption vs. pump power
Extract σ_e, σ_h

**Carrier lifetime**:
Pump-probe with variable delay
Fit exponential decay
Distinguish surface vs bulk

**Resonance shift dynamics**:
Pump ring, probe transmission
Measure Δλ(t) vs. pump power
Extract FCR coefficient

---

*End of Piece 5. Next: Piece 6 - Kerr Nonlinearity: n₂ = 4.5×10⁻¹⁸ m²/W in Silicon*