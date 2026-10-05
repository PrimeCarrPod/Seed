# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 1: Temporal Coupled-Mode Theory (CMT) for Ring-Bus Coupling

---

### 7.1 Temporal Coupled-Mode Theory (CMT) for Ring-Bus Coupling

Microring resonators (MRRs) are compact, wavelength-selective devices that form the building blocks of many silicon photonic circuits. Their physics is elegantly described by Temporal Coupled-Mode Theory (CMT), which provides a rigorous framework for analyzing energy exchange between optical modes.

#### 7.1.1 CMT Fundamentals

**System**: Two coupled optical modes
- Bus waveguide mode: a(t) (propagating)
- Ring resonator mode: b(t) (localized)

**Coupled-mode equations** (time domain):
da/dt = -jω_a a - (γ_a/2) a - jκ b + √γ_a a_in
db/dt = -jω_b b - (γ_b/2) b - jκ* a

where:
- ω_a, ω_b = resonance frequencies
- γ_a, γ_b = total decay rates (radiative + intrinsic)
- κ = coupling coefficient (complex)
- a_in = input field amplitude

**Power normalization**: |a|² = power in bus, |b|² = energy in ring

#### 7.1.2 Frequency Domain Solution

**Steady-state** (e^{-jωt} convention):
(-jΔω - γ_a/2) a - jκ b = -√γ_a a_in
-jκ* a + (-jΔω - γ_b/2) b = 0

where Δω = ω - ω_0 (detuning from resonance)

**Ring amplitude**:
b = jκ* a / (jΔω + γ_b/2)

**Bus transmission**:
a = [√γ_a / (jΔω + γ_a/2 + |κ|²/(jΔω + γ_b/2))] a_in

**Transmission coefficient**:
t(ω) = a_out/a_in = 1 - γ_a / (jΔω + γ_a/2 + |κ|²/(jΔω + γ_b/2))

#### 7.1.3 Critical Coupling Condition

**Intrinsic loss rate**: γ_0 (absorption, scattering, radiation)
**Coupling rate**: γ_c = |κ|²/(γ_b/2) (for γ_b ≫ Δω)
**Total loss**: γ_b = γ_0 + γ_c

**Critical coupling**: γ_c = γ_0
At critical coupling: t(ω_0) = 0 (complete extinction)

**Over-coupled**: γ_c > γ_0 (dip with residual transmission)
**Under-coupled**: γ_c < γ_0 (shallow dip)

**Loaded Q-factor**:
Q_L = ω_0 / γ_b = ω_0 / (γ_0 + γ_c)

**Intrinsic Q**: Q_0 = ω_0 / γ_0
**Coupling Q**: Q_c = ω_0 / γ_c

**Relationship**: 1/Q_L = 1/Q_0 + 1/Q_c

#### 7.1.4 Ring Resonator Transfer Functions

**Through port** (bus transmission):
T(ω) = |t(ω)|² = |(jΔω + γ_0/2) / (jΔω + γ_b/2)|²

**Drop port** (if add-drop):
D(ω) = |d(ω)|² = γ_c γ_d / |jΔω + γ_b/2|²
where γ_d = drop coupling rate

**All-pass filter** (single bus):
Phase response: φ(ω) = arg(t(ω))
Group delay: τ_g = -dφ/dω

**Notch filter** (add-drop):
Through: notch at resonance
Drop: peak at resonance

#### 7.1.5 Lineshape and Bandwidth

**Lorentzian lineshape** (near resonance):
T(Δω) ≈ 1 - (γ_c/γ_b) / (1 + (2Δω/γ_b)²)

**Full-width at half-maximum (FWHM)**:
Δω_FWHM = γ_b = γ_0 + γ_c
Δλ_FWHM = λ²/(2π n_g Q_L)

**Free spectral range (FSR)**:
FSR = c / (n_g L)
where L = 2πR (ring circumference), n_g = group index

**Finesse**:
F = FSR / Δλ_FWHM = Q_L λ / (n_g L)

**Extinction ratio** (at critical coupling):
ER = T(Δω≫γ) / T(0) → ∞ (theoretically)

#### 7.1.6 Coupling Coefficient from Geometry

**Directional coupler** (bus-ring gap):
κ = (ω/2) ∫ E_bus* · Δε · E_ring dA
Δε = ε_ring - ε_bus (perturbation)

**Gap dependence**:
κ(g) = κ_0 exp(-g/g_0)
g_0 ≈ 30-50 nm (for SOI, 220 nm height)

**Coupling length**:
L_c = π/(2|κ|)
For 3dB coupling: |κ| L_c = π/4

**Practical values** (SOI, 450 nm wide):
g = 100 nm: κ ≈ 0.05/μm, L_c ≈ 15 μm
g = 150 nm: κ ≈ 0.01/μm, L_c ≈ 75 μm

#### 7.1.7 Multi-Ring Coupled Systems

**N rings in series** (coupled-resonator optical waveguide - CROW):
CMT equations for ring amplitudes b_n:
db_n/dt = -jω_0 b_n - (γ_0 + γ_c,n + γ_c,n-1)/2 b_n
- j√(γ_c,n γ_c,n-1) (b_{n-1} + b_{n+1})

**Dispersion relation** (infinite uniform CROW):
ω(k) = ω_0 - 2√(γ_c²) cos(k a)
where a = center-to-center spacing

**Group velocity**:
v_g = 2a√(γ_c²) sin(k a)

**Bandwidth**: Δω = 4√(γ_c²)
Slow light at band edges (v_g → 0)

#### 7.1.8 Nonlinear CMT

**Kerr nonlinearity**:
db/dt = ... - jγ_K |b|² b
γ_K = (ω_0 n₂)/(c A_eff) (overlap factor)

**Two-photon absorption (TPA)**:
db/dt = ... - (β_TPA/2) |b|² b

**Free-carrier effects**:
dN/dt = (β_TPA/2ħω) |b|⁴ - N/τ_c
Δn_FC = -σ N

**Self-induced resonance shift**:
Δω_NL = γ_K |b|² + Δω_FC(N)

**Bistability**:
Hysteresis in transmission vs. input power
Critical power: P_crit ≈ (γ_b/γ_K) ħω

#### 7.1.9 Quantum CMT

**Quantum Langevin equations**:
db/dt = -jω_0 b - (γ/2) b + √γ a_in + F(t)
F(t) = noise operator (zero mean)

**Input-output relation**:
a_out = a_in - √γ b

**Quantum noise**:
⟨F†(t)F(t')⟩ = γ n_th δ(t-t')
⟨F(t)F†(t')⟩ = γ (n_th+1) δ(t-t')

**Squeezing generation**:
Pump at ω_p → parametric amplification
b_out = μ b_in + ν b_in†
|μ|² - |ν|² = 1

#### 7.1.10 CMT Limitations and Extensions

**Limitations**:
- Assumes weak coupling (|κ| ≪ ω)
- Single-mode per component
- No backscattering in bus
- Markovian bath (memoryless)

**Extensions**:
- **Scattering matrix CMT**: includes backscattering
- **Multi-mode CMT**: multiple bus/ring modes
- **Non-Markovian CMT**: structured reservoirs
- **Space-time CMT**: spatiotemporal dynamics

**Validation**:
CMT matches FDTD/FEM within 1-2%
For strong coupling: full-wave simulation needed

---

*End of Piece 1. Next: Piece 2 - Critical Coupling Condition: κ² = 1 - e^(-αL)*# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 2: Critical Coupling Condition: κ² = 1 - e^(-αL)

---

### 7.2 Critical Coupling Condition: κ² = 1 - e^(-αL)

The critical coupling condition is the fundamental design principle for microring resonators, determining when light is completely transferred from the bus waveguide to the ring (or completely extinguished in the through port). This piece derives the condition from first principles and explores its practical implications.

#### 7.2.1 Power Coupling Coefficient

**Field coupling coefficient**: κ (amplitude)
**Power coupling coefficient**: K = |κ|²
**Transmission coefficient**: T = 1 - K (for lossless coupler)

**Directional coupler** (two parallel waveguides):
Coupled-mode equations:
dA/dz = -jκ B
dB/dz = -jκ A

**Power transfer** after length L_c:
P_B/P_A = sin²(|κ| L_c)
P_A/P_A = cos²(|κ| L_c)

**3dB coupler**: |κ| L_c = π/4 → K = 0.5
**Cross state**: |κ| L_c = π/2 → K = 1

#### 7.2.2 Round-Trip Loss in Ring

**Round-trip amplitude transmission**:
r = e^{-αL/2} (field)
where α = power loss coefficient (dB/cm or 1/m), L = 2πR

**Round-trip power transmission**:
r² = e^{-αL}

**Intrinsic quality factor**:
Q_0 = 2π n_g / (λ α)
where n_g = group index, α in 1/m

**Round-trip phase shift**:
φ = β L = (2π n_eff / λ) L

#### 7.2.3 Resonant Field Buildup

**Single round-trip**:
After one round trip: b_1 = r e^{jφ} κ a_in
After N round trips: b_N = Σ_{n=1}^N r^n e^{jnφ} κ a_in

**Steady-state** (infinite sum):
b = κ a_in Σ_{n=0}^∞ (r e^{jφ})^n
= κ a_in / (1 - r e^{jφ})

**On resonance** (φ = 2πm):
b_res = κ a_in / (1 - r)

**Energy enhancement**:
|b_res|² / |a_in|² = K / (1 - r)²

#### 7.2.4 Through Port Transmission

**Through port field**:
a_out = a_in - κ* b
= a_in [1 - K / (1 - r e^{jφ})]

**Transmission coefficient**:
t(φ) = a_out/a_in = (1 - r e^{jφ} - K) / (1 - r e^{jφ})

**Power transmission**:
T(φ) = |t(φ)|² = |1 - r e^{jφ} - K|² / |1 - r e^{jφ}|²

**On resonance** (φ = 2πm):
T_res = |1 - r - K|² / |1 - r|²
= (1 - r - K)² / (1 - r)²

#### 7.2.5 Critical Coupling Derivation

**Critical coupling**: T_res = 0 (complete extinction)
Condition: 1 - r - K = 0
→ K = 1 - r

**Substitute r = e^{-αL/2}**:
K = 1 - e^{-αL/2}

**Wait** - this is for field coupling. Let's re-derive carefully.

**Power coupling coefficient K** relates to field coupling κ:
K = |κ|²

**Round-trip field attenuation**: r = e^{-αL/2}
**Round-trip power attenuation**: r² = e^{-αL}

**Field after one round trip**: b_1 = r e^{jφ} κ a_in
**Total field**: b = κ a_in / (1 - r e^{jφ})

**Through port**: a_out = a_in - κ* b = a_in - |κ|² a_in / (1 - r e^{jφ})

**On resonance**: a_out = a_in [1 - K/(1 - r)]
T_res = |1 - K/(1 - r)|²

**Critical coupling** (T_res = 0):
1 - K/(1 - r) = 0
→ K = 1 - r

**Since r = e^{-αL/2}**:
K_crit = 1 - e^{-αL/2}

**For small αL**: e^{-αL/2} ≈ 1 - αL/2
K_crit ≈ αL/2

**Alternative form** (using power round-trip):
Let ρ = r² = e^{-αL} (power round-trip)
K_crit = 1 - √ρ = 1 - e^{-αL/2}

This is the standard critical coupling condition!

#### 7.2.6 Critical Coupling in Terms of Q-Factors

**Loaded Q**: Q_L = ω_0 / (γ_0 + γ_c)
**Intrinsic Q**: Q_0 = ω_0 / γ_0
**Coupling Q**: Q_c = ω_0 / γ_c

**Critical coupling**: γ_c = γ_0
→ Q_c = Q_0
→ 1/Q_L = 1/Q_0 + 1/Q_0 = 2/Q_0
→ Q_L = Q_0/2

**Coupling coefficient**:
K = γ_c / (γ_0 + γ_c) = Q_L / Q_c

**At critical coupling**: K = 1/2 (for symmetric add-drop)
For all-pass: K_crit = 1 - e^{-αL/2}

#### 7.2.7 Practical Design Implications

**Loss-limited coupling**:
For α = 3 dB/cm = 690 1/m, R = 10 μm (L = 62.8 μm):
αL = 690 × 62.8×10⁻⁶ = 0.043
K_crit = 1 - e^{-0.043/2} = 1 - 0.979 = 0.021 (2.1%)

**Low-loss ring** (α = 0.1 dB/cm):
αL = 0.0043
K_crit = 0.00215 (0.2%)

**High-loss ring** (α = 10 dB/cm):
αL = 0.14
K_crit = 0.067 (6.7%)

**Design rule**: Lower loss → weaker coupling needed for critical coupling

#### 7.2.8 Fabrication Tolerance Analysis

**Coupling sensitivity**:
dK/dg = -K/g_0 (exponential gap dependence)
g_0 ≈ 30-50 nm

**Critical gap**:
g_crit = g_0 ln(K_0/K_crit)

**Gap variation** (σ_g = 2 nm):
σ_K/K = σ_g/g_0 ≈ 4-7%

**Critical coupling tolerance**:
For K_crit = 0.02, σ_K = 0.0008
ΔT_res/T_max ≈ 2(ΔK/K_crit) ≈ 8% per nm gap error

**Wavelength sensitivity**:
dλ_crit/dK = λ/(2Q_c) ≈ 0.1 nm/%

#### 7.2.9 Active Critical Coupling Tuning

**Thermo-optic tuning**:
dn/dT = 1.86×10⁻⁴ K⁻¹
Δn = 1.86×10⁻⁴ ΔT
ΔK/K ≈ 2 Δn/n ≈ 10⁻⁴/°C

**Carrier injection tuning**:
Δn = -8.8×10⁻²² ΔN_e
ΔK/K ≈ 2|Δn|/n

**MEMS tuning**:
Physical gap change Δg
ΔK/K = -Δg/g_0

**Closed-loop control**:
Monitor through-port power
PID adjust heater/current to maintain T=0

#### 7.2.10 Critical Coupling in Add-Drop Filters

**Add-drop configuration**:
Through: T = |(1 - r - K₁)|² / |1 - r|²
Drop: D = 4 K₁ K₂ / |1 - r|² (on resonance)

**Critical coupling for drop port**:
Maximize D → dD/dK₁ = 0 with K₂ fixed
K₁ = 1 - r (same as all-pass!)

**Symmetric add-drop** (K₁ = K₂ = K):
D_max = K² / (1 - r)²
At critical: K = 1 - r → D_max = 1 (100% drop efficiency)

**Over-coupled add-drop**:
K > 1 - r → D < 1, T > 0
Through port not fully extinguished

**Under-coupled add-drop**:
K < 1 - r → D < 1, T > 0
Drop port not fully populated

---

*End of Piece 2. Next: Piece 3 - Free Spectral Range (FSR) and Vernier Effect for Channel Selection*# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 3: Free Spectral Range (FSR) and Vernier Effect for Channel Selection

---

### 7.3 Free Spectral Range (FSR) and Vernier Effect for Channel Selection

The Free Spectral Range (FSR) is the wavelength spacing between adjacent resonance peaks of a microring resonator. For WDM applications, understanding FSR and the Vernier effect (using two rings with slightly different FSRs) is essential for channel selection and filtering.

#### 7.3.1 FSR Fundamentals

**Resonance condition**:
m λ_m = n_eff L
where m = integer mode number, L = 2πR (circumference)

**Wavelength spacing** between adjacent modes:
Δλ = λ_m - λ_{m+1}

**FSR in wavelength**:
FSR_λ = λ² / (n_g L)
where n_g = n_eff - λ dn_eff/dλ (group index)

**FSR in frequency**:
FSR_f = c / (n_g L)

**Typical values** (SOI, R = 10 μm, n_g = 4.2):
L = 62.8 μm
FSR_λ = 1550² / (4.2 × 62.8) ≈ 9.1 nm (1130 GHz)
FSR_f = 3×10⁸ / (4.2 × 62.8×10⁻⁶) ≈ 1.13 THz

**FSR scaling**:
FSR ∝ 1/R (larger rings → smaller FSR)
FSR ∝ 1/n_g

#### 7.3.2 Channel Spacing and FSR Matching

**ITU-T grid**: 50 GHz (0.4 nm), 100 GHz (0.8 nm), 200 GHz (1.6 nm)

**FSR matching requirement**:
For single-ring channel dropping:
FSR must be > signal bandwidth + guard band

**Example**: 100 GHz channels, 32 channels
Signal bandwidth: 32 × 100 GHz = 3.2 THz
Required FSR > 3.2 THz
→ R < c/(n_g FSR) = 3e8/(4.2 × 3.2e12) ≈ 22 μm

**Trade-off**:
Small R → large FSR (good for many channels)
But small R → high bending loss, large α
Practical range: R = 5-20 μm for SOI

#### 7.3.3 Vernier Effect: Dual-Ring Channel Selection

**Principle**: Two rings with slightly different FSRs
Ring 1: FSR₁ = c/(n_g L₁)
Ring 2: FSR₂ = c/(n_g L₂)

**Vernier FSR** (coincidence period):
FSR_V = FSR₁ FSR₂ / |FSR₁ - FSR₂|

**Effective FSR enhancement**:
FSR_V / FSR₁ = FSR₂ / |FSR₁ - FSR₂| ≫ 1

**Example**:
FSR₁ = 1000 GHz, FSR₂ = 1010 GHz
FSR_V = 1000×1010/10 = 101,000 GHz = 101 THz
100× enhancement!

**Channel selection**:
Only wavelengths where both rings resonate simultaneously pass through
All other channels suppressed

#### 7.3.4 Vernier Ring Design Equations

**Ring lengths**:
L₁ = m₁ λ / n_eff
L₂ = m₂ λ / n_eff

**FSR ratio**:
FSR₁/FSR₂ = L₂/L₁ = m₂/m₁

**Vernier order**:
N = m₂ - m₁ (difference in mode numbers)

**FSR_V**:
FSR_V = FSR₁ / N = FSR₂ / (N-1) (for m₂ = m₁ + N)

**Channel spacing**:
Δλ_ch = FSR₁ / M (M = number of channels per FSR)
Vernier channels: every N-th channel of ring 1

#### 7.3.5 Cascaded Vernier Rings

**Two rings in series** (add-drop):
Input → Ring 1 → Ring 2 → Through
Drop port: only when both resonate

**Transfer function**:
T(ω) = T₁(ω) T₂(ω)
Peaks only at coincident resonances

**Extinction ratio**:
ER = ER₁ × ER₂
Typical single ring ER: 20-30 dB
Vernier ER: 40-60 dB

**Bandwidth**:
Individual ring: Δλ_FWHM
Vernier passband: Δλ_V ≈ Δλ_FWHM (same)
But only every N-th channel

#### 7.3.6 Vernier Effect for Wavelength Tuning

**Tuning one ring**:
Δλ_T = λ (dn/dT) ΔT / n_g
Shift one ring's resonances relative to the other

**Channel switching**:
Vernier order N channels
Tuning range: Δλ_T = FSR₁ (full channel spacing)
Switches which channel is selected

**Tuning efficiency**:
ΔT per channel = FSR₁ / (dλ/dT)
For FSR₁ = 1000 GHz, dλ/dT = 0.1 nm/°C:
ΔT = 0.8 nm / 0.1 nm/°C = 8°C per channel

**Power consumption**:
P = C_th ΔT / τ
C_th ≈ 10⁻¹⁰ J/K, τ = 1 μs
P ≈ 0.8 mW per channel switch

#### 7.3.7 Fabrication Tolerance for Vernier

**Length mismatch**:
ΔL = L₂ - L₁
Required precision: ΔL < λ/(10 n_g)

**For λ = 1550 nm, n_g = 4.2**:
ΔL < 37 nm

**Mode number error**:
If m₁, m₂ integers, L₁/L₂ = m₁/m₂
Fabrication error → non-integer ratio → phase drift

**Phase matching condition**:
φ₁ + φ₂ = 2π integer at target λ
Δφ = (2π/λ) n_g ΔL < π/10

**Practical tolerance**:
Length control: ±5 nm (EUV)
Angle control: ±0.1°

#### 7.3.8 Multi-Vernier Cascades

**Three rings** (two Vernier stages):
FSR_V,eff = FSR_V₁ FSR_V₂ / |FSR_V₁ - FSR_V₂|
Enormous effective FSR (THz → PHz)

**Applications**:
- Ultra-narrow filtering
- Single-channel selection from 100+ channels
- Optical signal processing (format conversion)

**Complexity**:
- More rings = more loss
- Alignment sensitivity increases
- Tuning complexity: multi-dimensional

#### 7.3.9 Vernier in MRR Weight Banks

**Weight bank architecture**:
N rings with slightly different radii
Each ring tuned to different channel
Vernier effect separates channels

**Broadcast-and-weight**:
Single bus waveguide
N rings side-coupled
Each ring extracts one wavelength

**Crosstalk**:
Adjacent ring coupling
Vernier suppression of unwanted channels
ER ≈ 30-40 dB per ring
Cascaded: ER_total = ER^N

#### 7.3.10 Future: Active Vernier and Reconfigurable FSR

**Active FSR tuning**:
Carrier injection → Δn_eff → ΔFSR
ΔFSR/FSR = -Δn_g/n_g

**Reconfigurable channel spacing**:
Electrically adjust Vernier order
Change number of channels dynamically

**Integrated Vernier on SOI**:
- Two rings with microheaters
- Independent thermal control
- Channel selection in < 10 μs

**Quantum applications**:
Vernier for photon pair filtering
Entanglement purification via spectral filtering

---

*End of Piece 3. Next: Piece 4 - Thermo-Optic Coefficient: dn/dT = 1.86×10⁻⁴ K⁻¹ (Si)*# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 4: Thermo-Optic Coefficient: dn/dT = 1.86×10⁻⁴ K⁻¹ (Si)

---

### 7.4 Thermo-Optic Coefficient: dn/dT = 1.86×10⁻⁴ K⁻¹ (Si)

The thermo-optic effect is the primary tuning mechanism for silicon microring resonators. Silicon's large thermo-optic coefficient (dn/dT) enables efficient thermal tuning but also introduces thermal crosstalk and instability that must be carefully managed.

#### 7.4.1 Thermo-Optic Effect in Silicon

**Physical origin**: Temperature changes lattice vibrations → changes polarizability → changes refractive index

**Thermo-optic coefficient** (at 300K, 1550 nm):
dn/dT = 1.86×10⁻⁴ K⁻¹

**Temperature dependence**:
dn/dT(T) = dn/dT|_{300K} [1 + 0.001(T - 300)]
~0.1%/K variation

**Wavelength dependence**:
dn/dT increases slightly with λ
At 1310 nm: 1.78×10⁻⁴ K⁻¹
At 1550 nm: 1.86×10⁻⁴ K⁻¹
At 2000 nm: 2.1×10⁻⁴ K⁻¹

#### 7.4.2 Resonance Wavelength Shift

**Resonance condition**: mλ = n_eff L

**Wavelength shift with temperature**:
dλ/dT = (λ/n_g) (dn_eff/dT + n_eff dL/dT)

**For silicon waveguide**:
dL/dT = α_L L (thermal expansion)
α_L = 2.6×10⁻⁶ K⁻¹ (negligible vs dn/dT)

**Dominant term**:
dλ/dT ≈ (λ/n_g) dn/dT
= (1550 nm / 4.2) × 1.86×10⁻⁴
= 0.0686 nm/K
= 68.6 pm/K
= 8.8 GHz/K (at 1550 nm)

**Typical tuning range**:
ΔT = 100K → Δλ = 6.86 nm (880 GHz)
Covers > 1 FSR for typical rings (FSR ≈ 9 nm)

#### 7.4.3 Thermal Phase Shifter Efficiency

**Phase shift**:
Δφ = (2π/λ) Δn L = (2π/λ) (dn/dT) L ΔT

**2π phase shift requirement**:
ΔT_2π = λ / [(dn/dT) L]

**For L = 100 μm**:
ΔT_2π = 1550 / (1.86×10⁻⁴ × 100) = 83 K

**Power requirement**:
P = ΔT / R_th
R_th ≈ 10⁴ K/W (SOI, 220 nm Si, 2 μm BOX)
P_2π ≈ 8.3 mW

**Switching speed**:
τ = R_th C_th ≈ 1-10 μs

#### 7.4.4 Thermal Crosstalk in Ring Arrays

**Temperature profile** (point source in thin film):
ΔT(r) = (P/2πk) K₀(r/λ_th)
K₀ = modified Bessel function
λ_th = √(k t / h) ≈ 1.8 μm (SOI)

**Crosstalk coefficient**:
C_ij = (dλ/dT) × ΔT(d_ij) / P_j
= (λ/n_g)(dn/dT) × K₀(d_ij/λ_th)/(2πk)

**Typical values** (pitch = 2 μm):
Nearest neighbor: 5-10% of self-shift
Next-nearest: 1-2%
Beyond 10 μm: < 0.1%

**Impact on WDM**:
Ring 1 tuned → Ring 2 resonance shifts
Channel misalignment → crosstalk

#### 7.4.5 Thermal Crosstalk Mitigation

**Layout techniques**:
1. **Increased pitch**: > 5 μm for < 1% crosstalk
2. **Staggered arrangement**: Checkerboard pattern
3. **Thermal isolation trenches**: Etch through Si to BOX
   - 2-3 μm wide trenches
   - Reduces lateral conduction 10×
4. **Heat spreading layers**:
   - Diamond (k=2000 W/m·K)
   - Graphene (in-plane k=5000 W/m·K)

**Active compensation**:
1. **Feedforward**: Pre-distort heater powers
   P = C⁻¹ Δλ_desired
2. **Feedback**: Monitor ring transmission, PID control
3. **Frequency domain**: High-freq individual, low-freq coordinated

#### 7.4.6 Athermal Design

**Athermal waveguide**:
Si + polymer cladding (negative dn/dT)
Polymer: dn/dT ≈ -4×10⁻⁴ K⁻¹
Balance: Γ_Si (dn/dT)_Si + Γ_poly (dn/dT)_poly = 0

**SiN stress engineering**:
SiN stressor layer (tensile/compressive)
Stress-optic effect: Δn = C σ
C = 2.5×10⁻¹⁰ Pa⁻¹ (Si)
Tensile stress → negative dn/dT contribution

**Athermal ring resonator**:
Compensate ring resonance shift
Can achieve dλ/dT < 1 pm/K (vs 68 pm/K native)

**Trade-off**: Added process complexity, optical loss

#### 7.4.7 Thermal Dynamics and Control

**Thermal time constant**:
τ = R_th C_th
R_th ≈ 10⁴ K/W (vertical through BOX)
C_th = ρ C_p V ≈ 1.6×10⁻¹¹ J/K (10×10×0.5 μm³)
τ ≈ 10 μs

**Dynamic response**:
ΔT(t) = P R_th (1 - e^{-t/τ})

**Closed-loop control**:
1. Monitor ring transmission (photodiode at drop/thru)
2. Error = target - measured
3. PID controller → heater current
4. Bandwidth: ~1/(2πτ) ≈ 10-100 kHz

**Feedforward + feedback**:
Feedforward for large moves
Feedback for precision/disturbance rejection

#### 7.4.8 Thermal Effects on Device Performance

**Resonance broadening** (temperature fluctuations):
ΔT_rms = 1 mK → Δλ_rms = 68 fm
Corresponds to Q degradation: ΔQ/Q = Δλ/λ

**Thermal noise limit**:
k_B T² / (C_th τ) = ΔT_rms²
At 300K: ΔT_rms ≈ 0.1 mK (for τ=10μs)
Fundamental limit: Δλ ≈ 7 fm

**Power handling**:
Max ΔT before damage: ~200°C
P_max ≈ 200 / R_th ≈ 20 mW per heater

**Self-heating from optical power**:
Absorbed power: P_abs = α L P_opt
α = 3 dB/cm = 690 1/m
For P_opt = 10 mW, L = 100 μm: P_abs = 0.69 mW
ΔT = 6.9 K → Δλ = 0.47 nm

#### 7.4.9 Cryogenic Thermo-Optics

**At 4K**:
dn/dT → 0 (freeze-out of lattice vibrations)
dn/dT(4K) ≈ 10⁻⁶ K⁻¹ (100× smaller)

**Implications**:
- Thermal tuning ineffective below ~50K
- Thermal crosstalk eliminated
- Thermal stability greatly improved
- Resonance linewidth limited by other mechanisms

**Quantum applications**:
- Single-photon sources need stable resonances
- Cryogenic operation eliminates thermal noise
- But requires alternative tuning (carrier, MEMS, EO)

#### 7.4.10 Advanced Thermal Management

**Microfluidic cooling**:
Channels etched in handle wafer
Coolant flow: 1 mL/min
Thermal resistance: < 10³ K/W
Enables 10× higher power density

**Thermoelectric coolers (TEC)**:
Integrated on-chip (thin-film)
ΔT up to 50K
Power: 10-50 mW per cooler
Can actively stabilize temperature

**Phase-change materials**:
GST, VO₂ for thermal buffering
Absorb thermal transients
Passive temperature stabilization

**AI-driven thermal control**:
Neural network predicts thermal crosstalk
Real-time optimization of heater powers
Adapts to workload changes

---

*End of Piece 4. Next: Piece 5 - Two-Photon Absorption (TPA) and Free-Carrier Absorption (FCA)*# Document 7: Microring Resonator Physics and Coupled Mode Theory
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

*End of Piece 5. Next: Piece 6 - Kerr Nonlinearity: n₂ = 4.5×10⁻¹⁸ m²/W in Silicon*# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 6: Kerr Nonlinearity: n₂ = 4.5×10⁻¹⁸ m²/W in Silicon

---

### 7.6 Kerr Nonlinearity: n₂ = 4.5×10⁻¹⁸ m²/W in Silicon

The Kerr effect (third-order nonlinearity χ⁽³⁾) causes intensity-dependent refractive index changes in silicon waveguides. This effect underlies many nonlinear phenomena in microrings: self-phase modulation (SPM), cross-phase modulation (XPM), four-wave mixing (FWM), and Kerr frequency comb generation.

#### 7.6.1 Kerr Effect Fundamentals

**Nonlinear polarization**:
P_NL = ε₀ χ⁽³⁾ |E|² E

**Intensity-dependent refractive index**:
n = n₀ + n₂ I
where I = ½ c ε₀ n₀ |E|² (intensity)

**Kerr coefficient n₂** (silicon at 1550 nm):
n₂ = 4.5×10⁻¹⁸ m²/W = 4.5×10⁻¹⁴ cm²/W

**Nonlinear parameter γ**:
γ = n₂ ω₀ / (c A_eff)
= 2π n₂ / (λ A_eff)

**Typical values** (SOI, A_eff = 0.1 μm²):
γ = 2π × 4.5×10⁻¹⁸ / (1.55×10⁻⁶ × 0.1×10⁻¹²)
= 182 W⁻¹m⁻¹ ≈ 200 W⁻¹m⁻¹

**Phase shift**:
φ_NL = γ P L_eff
L_eff = (1 - e^{-αL})/α

#### 7.6.2 Self-Phase Modulation (SPM)

**Mechanism**: Pulse modulates its own phase
φ(t) = γ L_eff P(t)

**Instantaneous frequency shift**:
δω(t) = -dφ/dt = -γ L_eff dP/dt

**Spectral broadening**:
Δω ≈ γ L_eff P_peak / T₀
where T₀ = pulse width

**SPM in microrings**:
Circulating power enhanced by Q
P_circ = (Q_L/Q_c) P_in
φ_NL = γ L P_circ

**Critical power for SPM**:
P_crit ≈ 1/γ L (for φ_NL = 1 rad)
For γ = 200 W⁻¹m⁻¹, L = 100 μm:
P_crit ≈ 50 mW

#### 7.6.3 Cross-Phase Modulation (XPM)

**Mechanism**: Pump modulates probe phase
φ_probe = 2 γ L_eff P_pump

**Factor of 2** (for same polarization):
XPM is twice as strong as SPM

**XPM in microrings**:
Pump at resonance → high circulating power
Probe at different wavelength → phase shift

**All-optical switching**:
Pump pulse shifts probe resonance
Probe transmission changes from 1 to 0
Switching energy: ~pJ level

**Walk-off limitation**:
Group velocity mismatch limits interaction length
L_walkoff = T₀ / |1/v_g1 - 1/v_g2|
For Si: Δv_g/v_g ≈ 1% → L_walkoff ≈ 1 cm

#### 7.6.4 Four-Wave Mixing (FWM) in Microrings

**Phase matching condition**:
2ω_p = ω_s + ω_i
2β(ω_p) = β(ω_s) + β(ω_i) + 2γ P_p

**In microring**:
Resonance enhancement replaces phase matching
Signal/idler on adjacent ring resonances
β_s + β_i = 2β_p + 2γ P_p (ring resonances)

**FWM efficiency** (undepleted pump):
η = (γ P_p L_eff)² × (Q_L/Q_c)²

**Conversion efficiency** (microring enhanced):
η_ring = η_wg × (Q_L/Q_c)⁴
Can reach -20 dB at few mW pump

**Bandwidth** (limited by cavity):
Δω_FWM ≈ κ/2 = ω_0/(2Q_L)
For Q_L = 10⁵: Δf ≈ 10 GHz

#### 7.6.5 Kerr Frequency Combs

**Microcomb generation**:
CW pump above threshold → parametric oscillation
Sidebands generated via cascaded FWM

**Lugiato-Lefever Equation (LLE)**:
∂A/∂t = -(α/2 + jδ) A - jβ₂/2 ∂²A/∂t²
+ jγ |A|² A + √κ E_in

where δ = detuning, α = loss, β₂ = GVD

**Comb states**:
1. **Primary comb**: Single FSR spacing
2. **Soliton comb**: Mode-locked, coherent
3. **Chaotic comb**: Modulation instability

**Soliton formation** (anomalous dispersion β₂ < 0):
N_soliton = √(8γ P L_eff / |β₂| T₀²)
Stable for N = 1 (fundamental soliton)

**Comb coherence**:
Soliton combs: fully coherent, low noise
Primary combs: partially coherent

#### 7.6.6 Kerr Nonlinearity in Resonant Systems

**Resonance shift with power**:
Δω_NL = γ ω_0/n_g |A|²
= γ P_circ / n_g

**Bistability** (for δ₀ > √3):
Hysteresis loop in transmission vs. detuning
Critical power: P_crit = 8√3 δ₀³ n_g / (27 γ ω_0)

**Thermal vs Kerr bistability**:
Thermal: slow (μs), large shift
Kerr: fast (ps), smaller shift

**Regenerative oscillation**:
Self-pulsing at μ = 1 (modulation instability)
Frequency: f_rep = FSR (cavity round-trip)

#### 7.6.7 Dispersion Engineering for Kerr Effects

**GVD (β₂) control**:
β₂ = d²β/dω²
Anomalous (β₂ < 0): solitons, combs
Normal (β₂ > 0): no solitons, dark pulses

**Waveguide geometry** (SOI strip):
Height fixed (220 nm)
Width W controls β₂
W < 400 nm: β₂ < 0 (anomalous)
W > 450 nm: β₂ > 0 (normal)

**Higher-order dispersion**:
β₃ = dβ₂/dω (TOD)
β₄ = dβ₃/dω (FOD)
Controls dispersive wave emission
Engineers comb spectral envelope

#### 7.6.8 TPA Limitation on Kerr Effects

**TPA competes with Kerr**:
Same χ⁽³⁾ origin
FOM = n₂/(β_TPA λ) = γ/(β_TPA ω)

**Silicon FOM**:
n₂ = 4.5×10⁻¹⁸ m²/W
β_TPA = 0.5 cm/GW = 5×10⁻¹² m/W
λ = 1.55 μm
FOM = 4.5×10⁻¹⁸ / (5×10⁻¹² × 1.55×10⁻⁶) ≈ 0.58

**Implication**:
TPA limits peak power before Kerr effects saturate
Max φ_NL before TPA dominates: ~π

**Materials with better FOM**:
SiN: n₂ = 2.4×10⁻¹⁹, β_TPA ≈ 0 → FOM → ∞
AlGaAs: FOM ≈ 10
GaAs: FOM ≈ 5

#### 7.6.9 Kerr Effects in Quantum Applications

**Squeezing generation**:
Pump at ω_p → parametric amplification
χ⁽³⁾ Hamiltonian: H = jħg (a†² a² - h.c.)
Squeezing parameter: r = g P_p L_eff

**Entangled photon pairs** (SFWM):
Pump → signal + idler
State: |ψ⟩ = √(1-λ²) Σ λⁿ |n⟩_s |n⟩_i
λ = tanh(r)

**Single-photon generation**:
Heralded from FWM pair
CAR = coincidence/accidental ratio
Limited by Raman noise and TPA

**Kerr solitons for quantum**:
Temporal solitons as qubits
Topological protection possible

#### 7.6.10 Advanced Kerr Engineering

**Slot waveguides**:
Field concentrated in low-n slot
Lower n₂ but also lower TPA
FOM improved 2-3×

**Hybrid Si/χ⁽²⁾ materials**:
BTO, LN on Si
Pockels + Kerr combined
Electro-optic tuning of Kerr resonance

**Photonic crystal cavities**:
Slow light enhances γ_eff = γ Q²/V
γ_eff > 10⁴ W⁻¹m⁻¹ demonstrated

**2D material integration**:
Graphene, TMDs on Si
Large n₂ (10⁻¹⁶ m²/W)
Electrically tunable

**Machine learning for inverse design**:
Optimize geometry for target nonlinearity
Maximize FOM, engineer dispersion
Inverse design in minutes

---

*End of Piece 6. Next: Piece 7 - Dynamic Tuning: Carrier Injection vs. Depletion vs. Thermal*# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 7: Dynamic Tuning: Carrier Injection vs. Depletion vs. Thermal

---

### 7.7 Dynamic Tuning: Carrier Injection vs. Depletion vs. Thermal

Dynamic tuning of microring resonators is essential for modulation, switching, and wavelength routing. Three primary mechanisms—carrier injection, carrier depletion, and thermal tuning—offer different trade-offs in speed, power, extinction ratio, and integration complexity.

#### 7.7.1 Carrier Injection (Forward Bias PIN)

**Mechanism**: Forward bias injects electrons/holes into waveguide
Δn = -8.8×10⁻²² N_e - 8.5×10⁻¹⁸ N_h

**Device structure**: PIN diode along waveguide
- P-region: p++ doped
- I-region: intrinsic waveguide
- N-region: n++ doped

**Injection efficiency**:
η_inj = J_rad / J_total
J_rad ∝ N_e N_h (radiative)
J_nonrad ∝ N_e, N_h (Auger, SRH)
Typical η_inj ≈ 10-30%

**Phase shift**:
Δφ = (2π/λ) Δn L
For N = 10¹⁸ cm⁻³, L = 1 mm:
Δn ≈ -0.001, Δφ ≈ 4π

**Speed limitation**:
Carrier lifetime τ_c ≈ 1 ns (unpinched)
RC time constant: τ_RC ≈ 10-50 ps
Total: ~1 ns (1 GHz bandwidth)

**Power consumption**:
P = I V_F
I = q V_active N / τ_c
V_F ≈ 1 V
For N = 10¹⁸ cm⁻³, V = 10⁻¹⁵ m³:
I ≈ 1 mA, P ≈ 1 mW per π shift

**Extinction ratio limitation**:
FCA from injected carriers
α_FCA = 1.45×10⁻¹⁷ N_e + 1.35×10⁻¹⁷ N_h
ER = 10 log₁₀(α_off/(α_on + α_FCA))
For N = 10¹⁸ cm⁻³: α_FCA ≈ 30 dB/cm
ER < 10 dB typical

#### 7.7.2 Carrier Depletion (Reverse Bias PN)

**Mechanism**: Reverse bias widens depletion region
Carriers removed from waveguide core
Δn ∝ √(V_bi + V_R) (junction capacitance)

**Device structure**: PN junction across waveguide
- P-region: one side of waveguide
- N-region: other side
- Depletion region overlaps waveguide

**Capacitance-voltage**:
C_j = C_0 / √(1 + V_R/V_bi)
C_0 = ε A/W_0

**Phase shift**:
Δφ = (2π/λ) Δn L
Δn = -ΔN_dopant × (8.8×10⁻²² for e, 8.5×10⁻¹⁸ for h)
ΔN = C_j V_R / (q L)

**Voltage for 2π**:
V_π ≈ 10-20 V (for L = 1 mm)
Δn ≈ 0.001 needed
ΔN ≈ 10¹⁷ cm⁻³
V_R ≈ 10 V

**Speed**:
RC limited: τ_RC = R_s C_j
R_s ≈ 50 Ω, C_j ≈ 50 fF
τ_RC ≈ 2.5 ps → > 50 GHz bandwidth

**No FCA** (carriers removed):
No free-carrier absorption loss
High extinction ratio: > 20 dB
No carrier lifetime limitation

**Power consumption** (dynamic only):
P = ½ C V² f
C = 50 fF, V = 10 V, f = 10 GHz
P = 2.5 mW per modulator

#### 7.7.3 Carrier Accumulation (MOSCAP)

**Mechanism**: Gate voltage accumulates carriers at oxide interface
Similar to depletion but majority carriers only
Lower loss (no minority carriers)

**Structure**: Gate oxide (SiO₂/HfO₂) on doped Si
N-type Si + gate → accumulate electrons
P-type Si + gate → accumulate holes

**Capacitance**: C_ox = ε_ox/t_ox
For t_ox = 5 nm: C_ox ≈ 7 fF/μm²

**Voltage for 2π**:
V_π ≈ 5-10 V (thinner oxide → lower V)
But higher loss than depletion

**Speed**: RC limited, similar to depletion
Bandwidth: 10-50 GHz

**Advantage**: Lower voltage than depletion
**Disadvantage**: Interface traps, hysteresis

#### 7.7.4 Thermal Tuning (Thermo-Optic)

**Mechanism**: Heater changes temperature → dn/dT
Δn = (dn/dT) ΔT
dn/dT = 1.86×10⁻⁴ K⁻¹ (Si)

**Phase shift**:
Δφ = (2π/λ) (dn/dT) L ΔT

**2π shift**:
ΔT_2π = λ / [(dn/dT) L]
For L = 1 mm: ΔT_2π = 8.3 K

**Heater power**:
P = ΔT / R_th
R_th ≈ 10⁴ K/W (SOI)
P_2π ≈ 0.8 mW

**Speed**:
τ = R_th C_th ≈ 1-10 μs
Bandwidth: 10-100 kHz

**No FCA** (no carriers):
Pure index change
High extinction ratio possible
No carrier lifetime issues

**Advantages**:
- Low voltage (CMOS compatible)
- High efficiency (mW per 2π)
- Large tuning range (> FSR)
- Simple fabrication

**Disadvantages**:
- Slow (μs)
- Thermal crosstalk
- Static power consumption

#### 7.7.5 Comparison Summary

| Parameter | Injection | Depletion | Accumulation | Thermal |
|-----------|-----------|-----------|--------------|---------|
| Speed | ~1 GHz | >50 GHz | 10-50 GHz | ~100 kHz |
| V_π | 1-2 V | 10-20 V | 5-10 V | N/A (mW) |
| P_π (static) | ~1 mW | 0 | 0 | ~1 mW |
| P_π (dynamic) | N/A | ~10 fJ | ~5 fJ | N/A |
| ER | < 10 dB | > 20 dB | > 15 dB | > 20 dB |
| Loss (on) | High (FCA) | Low | Medium | Low |
| Voltage | Low | High | Medium | N/A |
| Integration | Native | Native | Native | Native |
| Wavelength range | FSR | FSR | FSR | >FSR |

#### 7.7.6 Hybrid Tuning Architectures

**Coarse + fine**:
- Thermal: coarse (> FSR, slow)
- Carrier: fine (within FSR, fast)
- Total range: > FSR, fast fine tuning

**Thermal + depletion**:
- Thermal for wavelength routing
- Depletion for high-speed modulation
- Best of both worlds

**Multi-section ring**:
Multiple phase shifters around ring
Thermal on one section, carrier on another
Independent control

**Cascaded rings**:
Each ring with different tuning mechanism
Collective wavelength routing

#### 7.7.7 Tuning for Modulation Formats

**NRZ/OOK**:
Thermal or depletion both work
Depletion for > 25 Gbps
Thermal for static routing

**PAM-4**:
Requires linear phase response
Depletion preferred (linear C-V)
Thermal: linear but slow

**Coherent (QPSK, 16-QAM)**:
Phase noise critical
Depletion: low phase noise
Thermal: 1/f noise from heater

**Analog modulation**:
Linearity critical
Depletion: C-V nonlinearity
Predistortion required

#### 7.7.8 Tuning for WDM Channel Selection

**Channel spacing**: 50/100 GHz
**FSR**: 1000-2000 GHz
**Tuning range needed**: > 1 channel (50-100 GHz)
**FSR tuning**: Thermal (covers > FSR)
**Fine tuning**: Carrier (within FSR)

**Channel switching time**:
Thermal: 1-10 μs
Carrier: < 1 ns
Requirement: < 1 μs for packet switching

**Power budget per channel**:
Thermal: 1 mW static
Carrier: 0.1 mW dynamic (at 10 Gbps)
Total: ~1-2 mW per channel

#### 7.7.9 Active Thermal Stabilization

**Temperature sensitivity**:
dλ/dT = 68 pm/K
For 50 GHz channel (0.4 nm):
ΔT < 0.4 nm / 68 pm/K = 5.9 K
Need active control for < 1 dB penalty

**Control loop**:
1. Monitor drop/thru power ratio
2. Error = target - measured
3. PID → heater current
4. Bandwidth: 10-100 kHz

**Dual-ring Vernier**:
One ring reference, one signal
Common-mode rejection of thermal drift
Relaxes control requirements

#### 7.7.10 Future: Novel Tuning Mechanisms

**Ferroelectric (HfZrO₂)**:
Non-volatile, fast (< ns)
Low voltage (1-2 V)
Endurance: 10¹² cycles
CMOS compatible

**Phase-change (GST, Sb₂S₃)**:
Non-volatile, large Δn
ns switching
Multi-level (analog weights)

**MEMS**:
Physical gap change
Zero static power
μs-ms speed, large Δn

**Electro-optic (LiNbO₃, BaTiO₃ on Si)**:
Pockels effect
Sub-ps, low voltage
Hybrid integration required

**2D materials (graphene, TMDs)**:
Electro-absorption, phase shift
Atomically thin
High speed, low power

**Strain engineering**:
Piezoelectric actuators
Strain-optic effect
Large tuning range, low power

---

*End of Piece 7. Next: Piece 8 - Microring Weight Bank: Broadcast-and-Weight Architecture*# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 8: Microring Weight Bank: Broadcast-and-Weight Architecture

---

### 7.8 Microring Weight Bank: Broadcast-and-Weight Architecture

The broadcast-and-weight architecture using microring resonator (MRR) weight banks is a leading approach for optical neural networks (ONNs). It leverages wavelength division multiplexing (WDM) to achieve massive parallelism, where each wavelength carries a separate data channel and microrings apply wavelength-selective weights.

#### 7.8.1 Broadcast-and-Weight Principle

**Concept**:
1. **Broadcast**: Multi-wavelength input sent on single bus waveguide
2. **Weight**: Each MRR extracts one wavelength, applies weight
3. **Sum**: Weighted signals combined at photodetector

**Input**: WDM signal with N channels
λ₁, λ₂, ..., λ_N on single bus

**Ring bank**: N rings, each resonant at one λ_k
Ring k couples λ_k to drop port with weight w_k

**Output**: Σ w_k x_k (dot product)

**Parallelism**: N wavelengths → N operations per cycle
Throughput: N × symbol rate

#### 7.8.2 MRR Weight Bank Architecture

**Layout**:
- Single bus waveguide (horizontal)
- N rings vertically stacked (side-coupled)
- Each ring: different radius → different resonance
- Dropped signals → photodetector array or summed

**Ring parameters**:
Radius R_k = m λ_k / n_eff
Gap g_k → coupling coefficient κ_k
Heater → tuning (thermal/carrier)

**Weight encoding**:
w_k = κ_k² / (Δω² + (κ_k/2)²)
At resonance (Δω = 0): w_k = 4 (max)
Off resonance: w_k ≈ 0

**Weight range**: 0 to w_max (by detuning)
Typical: 0 to 1 (normalized)

#### 7.8.3 Wavelength Assignment and FSR

**Channel spacing**: Δλ = FSR / N_channels
**FSR requirement**: FSR > N × Δλ
For N = 32, Δλ = 0.8 nm (100 GHz):
FSR > 25.6 nm → R < 3.5 μm (challenging)

**Solution**: Multiple ring banks
Each bank handles subset of channels
FSR = 10 nm, 4 banks × 8 channels

**Alternative**: Vernier rings
Two rings per weight → enhanced FSR
Select one channel per Vernier pair

#### 7.8.4 Weight Precision and Resolution

**Phase shifter resolution**:
Thermal: Δθ ≈ 0.01 rad (8-bit DAC)
Carrier: ΔV ≈ 1 mV (10-bit DAC)
Weight resolution: Δw/w ≈ 2 Δθ/θ

**Weight error sources**:
1. Phase quantization: Δθ
2. Thermal crosstalk: ΔT_xtalk
3. Fabrication variation: Δκ, ΔR
4. Temperature drift: dλ/dT

**Error budget** (for 8-bit weights):
Phase error: < 0.5° (0.009 rad)
Thermal stability: < 0.1 K
Coupling variation: < 1%

**Calibration**:
Measure weight matrix W_actual
Compute correction: W_cal = W_target W_actual⁻¹
Apply inverse to phase shifters

#### 7.8.5 Signal Flow and Detection

**Coherent detection** (complex weights):
- I/Q modulators at input
- Complex weights: w_k = a_k + j b_k
- Requires two rings per channel (or dual-pol)
- Coherent receiver (homodyne)

**Direct detection** (real positive weights):
- Intensity modulation (IM)
- Real weights: w_k ≥ 0
- Photodetector sums power
- Simpler, but limited to positive weights

**Differential detection** (bipolar weights):
- Two rings per weight: w_k = w_k⁺ - w_k⁻
- Balanced photodetector
- Real weights with sign

**Detection noise**:
Shot noise: σ_shot = √(2qI B)
Thermal noise: σ_th = √(4kT B/R_L)
RIN: σ_RIN = RIN × I

#### 7.8.6 Scaling to Large N

**Single bus limitation**:
Insertion loss: N × α_ring
Crosstalk: N × XT_ring
FSR constraint: FSR > N Δλ

**Maximum practical N**:
Loss: N < 10 dB / α_ring
For α = 0.1 dB/ring: N < 100
Crosstalk: N < ER/10
For ER = 30 dB: N < 30

**Tiling strategy**:
Multiple parallel buses
Each bus: N_bank channels
Total N = N_bus × N_bank

**Hierarchical weight banks**:
Level 1: Coarse (few channels, large weights)
Level 2: Fine (many channels, small weights)
Logarithmic scaling

#### 7.8.7 Training and Inference

**Forward pass**:
1. Encode input vector x onto WDM wavelengths
2. Propagate through ring bank
3. Detect weighted sum y = W x
4. Apply activation (optical or electronic)

**Backward pass** (training):
1. Compute error δ = ∂L/∂y
2. Backpropagate: δ W^T
3. Update weights: ΔW = -η δ x^T

**Weight update**:
Δθ_k = -η (∂L/∂w_k) (∂w_k/∂θ_k)
∂w_k/∂θ_k from ring transfer function

**In-situ training**:
- Optical forward + electronic backward
- Or all-optical backprop (phase conjugation)

**Weight drift compensation**:
Periodic recalibration
Online gradient correction
Redundancy (spare rings)

#### 7.8.8 MRR Weight Bank vs. MZI Mesh

| Parameter | MRR Bank | MZI Mesh |
|-----------|----------|----------|
| Area | O(N) | O(N²) |
| Depth | 1 ring | N MZIs |
| Loss | O(1) | O(N) |
| Weight type | Real (mostly) | Complex (unitary) |
| Parallelism | WDM (N ch) | Spatial (N modes) |
| Speed | Limited by FSR | Full bandwidth |
| Weight range | Positive (direct) | Full complex |
| Cascadability | Limited | Excellent |

**MRR advantages**:
- Compact (O(N) vs O(N²))
- Low latency (single pass)
- Natural WDM parallelism
- Low loss for large N

**MZI advantages**:
- Universal unitary
- Complex weights
- Better cascadability
- Mature calibration

#### 7.8.9 MRR Weight Bank for Convolution

**1D convolution**:
Input: WDM signal
Rings with different delays (ring lengths)
Weighted sum = convolution

**2D convolution**:
Multiple buses (rows)
Ring bank per row
Cross-bar summation

**Frequency-domain convolution**:
WDM = frequency domain
Ring weights = filter frequency response
Convolution theorem: y = F⁻¹(F(x)·F(w))

**Implementation**:
Rings as programmable optical filters
FIR filter with N taps = N rings

#### 7.8.10 Future: MRR Weight Bank Integration

**Monolithic integration**:
- Rings + heaters + detectors on SOI
- CMOS driver IC (flip-chip)
- High-density packaging

**Heterogeneous integration**:
- III-V gain for loss compensation
- Ge detectors for high-speed detection
- Polymer for athermal operation

**Advanced architectures**:
- Resonant tunneling for negative weights
- Quantum dot rings for single-photon weights
- Topological rings for robust weights

**Co-packaged MRR banks**:
Near-memory computing
HBM-style stacking
Optical I/O for weight loading

---

*End of Piece 8. Next: Piece 9 - Active Thermal Stabilization: PID Control Loop Design*# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 9: Active Thermal Stabilization: PID Control Loop Design

---

### 7.9 Active Thermal Stabilization: PID Control Loop Design

Microring resonators are extremely sensitive to temperature fluctuations, with resonance wavelengths shifting at ~68 pm/K (8.8 GHz/K). For WDM systems with 50 GHz channel spacing, temperature must be stabilized to < 1 K, preferably < 0.1 K, requiring active thermal control loops.

#### 7.9.1 Thermal Plant Model

**Thermal circuit** (per ring heater):
- Heater power P(t) → temperature ΔT(t)
- Thermal resistance R_th (K/W)
- Thermal capacitance C_th (J/K)
- Transfer function: G_th(s) = ΔT(s)/P(s) = R_th/(1 + sτ)
- τ = R_th C_th ≈ 1-10 μs

**Resonance shift**:
Δλ(s) = (dλ/dT) ΔT(s) = K_th ΔT(s)
K_th = 68 pm/K = 8.8 GHz/K

**Open-loop transfer function**:
G_ol(s) = K_th R_th / (1 + sτ)

**Disturbance rejection**:
Ambient temperature T_amb(t) → ΔT_dist(s) = T_amb(s)/(1 + sτ_amb)
τ_amb ≈ 1-10 ms (package/board level)

#### 7.9.2 PID Controller Design

**PID transfer function**:
C(s) = K_p + K_i/s + K_d s
= K_p (1 + 1/(T_i s) + T_d s)

**Closed-loop transfer function** (setpoint tracking):
T(s) = C(s)G(s) / (1 + C(s)G(s))
G(s) = K_th R_th / (1 + sτ)

**Disturbance rejection**:
S(s) = 1 / (1 + C(s)G(s)) (sensitivity function)

**Design specifications**:
- Settling time < 1 ms
- Overshoot < 10%
- Steady-state error < 1 pm
- Disturbance rejection > 40 dB at 1 Hz

#### 7.9.3 PID Tuning Methods

**Ziegler-Nichols (ultimate gain)**:
1. Set K_i = K_d = 0
2. Increase K_p until sustained oscillations (K_u)
3. Measure oscillation period T_u
4. K_p = 0.6 K_u, T_i = 0.5 T_u, T_d = 0.125 T_u

**Cohen-Coon (for first-order + delay)**:
For G(s) = K e^{-Ls}/(τs+1):
K_p = (τ/K L) (1.33 + τ/(4L))
T_i = L (2.5 + 1.5 L/τ) / (1 + 0.6 L/τ)
T_d = 0.37 L / (1 + 0.2 L/τ)

**For thermal plant (L ≈ 0, τ = 10 μs)**:
Z-N: K_u ≈ 2π/(K_th R_th) ≈ 1.5 mW/pm
K_p = 0.9 mW/pm, T_i = 10 μs, T_d = 1.25 μs

**Practical tuning** (accounting for discretization):
K_p = 0.5-1 mW/pm
K_i = 100-500 mW/pm/s
K_d = 1-10 nW·s/pm

#### 7.9.4 Digital PID Implementation

**Discrete PID** (Tustin/bilinear):
u[k] = u[k-1] + K_p(e[k] - e[k-1])
+ K_i T_s/2 (e[k] + e[k-1])
+ K_d/T_s (e[k] - 2e[k-1] + e[k-2])

**Sampling period**: T_s = 1-10 μs
Anti-windup: Clamp integral term
Derivative filter: K_d/(1 + sT_f), T_f = T_s/2

**Fixed-point implementation** (for FPGA/ASIC):
Q16.16 format for coefficients
Saturation arithmetic for output
Integral anti-windup: back-calculation

**FPGA resources** (per ring):
- 1 DSP slice (multiply-accumulate)
- 4 registers (state)
- 2 BRAMs (lookup tables)
< 1% of small FPGA

#### 7.9.5 Sensor Requirements

**Resonance monitoring methods**:
1. **Dither locking**: Sinusoidal dither + synchronous detection
   - Modulate heater at f_dither (1-10 kHz)
   - Demodulate transmission at f_dither
   - Error signal = derivative of resonance
   - Resolution: < 1 fm

2. **Side-of-filter locking**:
   - Operate at 50% transmission point
   - ΔT ∝ ΔP_trans
   - Simple but 50% power loss

3. **Wavelength monitor** (external):
   - Arrayed waveguide grating + photodiodes
   - Measures absolute wavelength
   - Calibration-free

4. **Integrated photodiode** (drop/thru ratio):
   - Monitor drop/thru power ratio
   - Ratio = f(Δλ)
   - Common-mode rejection of input power fluctuations

**Noise requirements**:
- Shot noise limited: Δλ < 1 fm
- For 1 mW, 10 MHz BW: 100 photons/μs → 1% noise
- Need > 10 μW for < 1 fm resolution

#### 7.9.6 Multi-Ring Control Strategies

**Independent control**:
- One PID per ring
- Simple but ignores crosstalk
- Works if crosstalk < 5%

**Decoupled control**:
- Measure crosstalk matrix C
- Decouple: P = C⁻¹ P_desired
- Requires accurate C matrix

**Hierarchical control**:
- Global: wafer temperature (slow, high power)
- Local: ring heaters (fast, low power)
- Two-time-scale separation

**Coordinated control** (for Vernier rings):
- Master ring: reference (fixed)
- Slave ring: tuned to match
- Error = master resonance - slave resonance

**Model predictive control (MPC)**:
- Predict thermal evolution
- Optimize heater powers over horizon
- Handles constraints (power, temp limits)
- Computationally intensive

#### 7.9.7 Stability Analysis

**Loop gain**:
L(s) = C(s)G(s) = K_p K_th R_th (1 + 1/T_i s + T_d s)/(1 + sτ)

**Phase margin**:
PM = 180° + ∠L(jω_c)
Target: PM > 45°

**Gain margin**:
GM = 1/|L(jω_180)|
Target: GM > 6 dB

**Routh-Hurwitz** (characteristic equation):
(1 + sτ)(T_i s) + K_p K_th R_th T_i (1 + T_i s + T_d T_i s²) = 0

**Stability conditions**:
K_p > 0, K_i > 0, K_d > 0
K_p K_th R_th τ > T_i (1 + K_p K_th R_th)

**Robustness to parameter variation**:
τ varies ±50% (process)
K_th varies ±10% (wavelength)
Controller must remain stable

#### 7.9.8 Performance Metrics

**Settling time** (2% criterion):
t_s ≈ 4/(ζ ω_n)
ζ = damping, ω_n = natural frequency
For PM = 60°: ζ ≈ 0.6, t_s ≈ 7/ω_n

**Steady-state error**:
e_ss = 0 (integral action)
Ramp error: e_ss = 1/K_v
K_v = lim_{s→0} s C(s)G(s) = K_p K_i K_th R_th / T_i

**Disturbance rejection**:
|S(jω)| = |1/(1 + L(jω))|
At ω = 1 Hz: |S| < 0.01 (40 dB)
Requires |L(1 Hz)| > 100

**Integral of squared error (ISE)**:
ISE = ∫ e²(t) dt
Minimized by optimal PID tuning

#### 7.9.9 Multi-Objective Optimization

**Objectives**:
1. Minimize settling time
2. Minimize overshoot
3. Minimize control effort (power)
4. Maximize robustness

**Pareto front**: Trade-offs between objectives
K_p ↑ → faster but more overshoot
K_i ↑ → better disturbance rejection but slower
K_d ↑ → better damping but noise sensitive

**Optimization** (genetic algorithm, gradient-based):
J = w_1 t_s + w_2 OS + w_3 ∫u²dt + w_4 (1/PM)

**Adaptive PID**:
Gain scheduling based on operating point
K_p(T_amb), K_i(P_optical)
Online adaptation to workload

#### 7.9.10 Advanced Control Techniques

**Feedforward + Feedback**:
- Feedforward: Predict disturbance from workload
- Feedback: Correct residual error
- Reduces integral windup

**Smith predictor** (for delay):
Compensates for measurement delay
T_d = sensor + ADC + compute delay
Predicts plant output T_d seconds ahead

**Sliding mode control**:
Robust to parameter variations
Chattering at high frequency
Good for nonlinear plant

**Adaptive control**:
Recursive least squares for plant ID
Update controller gains online
Handles aging, process variation

**Machine learning control**:
Neural network controller
Trained on simulation + experimental data
Handles complex multi-ring interactions

**Quantum-limited control**:
Fundamental limit: thermodynamic uncertainty
ΔT ΔE ≥ k_B T²/C_th
Best possible stabilization: ΔT ≈ √(k_B T²/C_th)

---

*End of Piece 9. Next: Piece 10 - Noise Figure: Spontaneous Emission Factor in Resonant Enhancement*# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 10: Noise Figure: Spontaneous Emission Factor in Resonant Enhancement

---

### 7.10 Noise Figure: Spontaneous Emission Factor in Resonant Enhancement

Microring resonators enhance optical fields by the quality factor Q, but this enhancement also amplifies noise sources including spontaneous emission, thermal noise, and quantum fluctuations. Understanding the noise figure of resonant systems is crucial for designing low-noise amplifiers, oscillators, and quantum photonic circuits.

#### 7.10.1 Resonant Enhancement of Signals and Noise

**Field enhancement** in ring:
|E|² = |E_in|² × (Q_L/Q_c)² / (1 + 4Q_L²(Δω/ω₀)²)

**On resonance** (Δω = 0):
|E|² / |E_in|² = (Q_L/Q_c)²

**For critical coupling** (Q_L = Q₀/2, Q_c = Q₀):
Enhancement = 4

**Noise enhancement**: Same factor applies to all noise sources coupled to the mode
- Spontaneous emission
- Thermal fluctuations
- Quantum vacuum fluctuations
- Pump laser noise (transferred)

#### 7.10.2 Spontaneous Emission in Resonators

**Spontaneous emission rate** (Purcell effect):
F_p = (3/4π²) (λ³/n³) (Q/V_mode)

**Enhanced spontaneous emission**:
Γ_sp = F_p Γ_0
Γ_0 = free-space rate

**Spontaneous emission factor** (β):
β = Γ_sp / (Γ_sp + Γ_nr)
where Γ_nr = non-radiative rate

**For high-Q rings** (Q > 10⁵, V ≈ (λ/n)³):
F_p ≈ 10-100
β can approach 1 (thresholdless laser)

**Spontaneous emission noise power**:
P_sp = n_sp hν (γ_0 + γ_c) (in bandwidth)
n_sp = spontaneous emission factor
= N₂/(N₂ - N₁) (population inversion)

#### 7.10.3 Noise Figure of Resonant Amplifier

**Amplifier model**:
Input signal + noise → Resonator → Output

**Noise figure** (NF):
NF = SNR_in / SNR_out
= 1 + (P_added / P_signal_out) × (G / (G-1))

**For phase-insensitive amplifier** (minimum):
NF_min = 2 n_sp (G/(G-1))
For high gain: NF_min ≈ 2 n_sp (3 dB quantum limit)

**Resonant enhancement effect**:
Gain G = (Q_L/Q_c)²
Added noise: P_added = n_sp hν (γ_0 + γ_c) B
B = bandwidth = γ_b/2π

**Noise figure with resonance**:
NF = 1 + n_sp (γ_0 + γ_c)/γ_c × (G/(G-1))
For critical coupling (γ_c = γ_0):
NF = 1 + 2 n_sp (G/(G-1))

#### 7.10.4 Quantum Noise in Resonators

**Input-output relation** (quantum Langevin):
a_out = a_in - √γ_c b
db/dt = -(jΔω + γ_b/2) b + √γ_c a_in + √γ_0 b_0 + F

where b_0 = bath noise, F = spontaneous emission noise

**Noise operators**:
⟨F†(ω)F(ω')⟩ = γ n_th δ(ω-ω')
⟨F(ω)F†(ω')⟩ = γ (n_th+1) δ(ω-ω')

**Output noise spectrum**:
S_out(ω) = |a_out(ω)|²
= |a_in|² + γ_c/(γ_b/2)² [γ n_th + γ_c |a_in|²] (simplified)

**Added noise referred to input**:
N_added = (γ/γ_c) n_th + n_sp

**Quantum limit** (T = 0, n_th = 0):
N_added = n_sp ≥ 1/2 (for phase-insensitive)
For phase-sensitive: n_sp can be < 1/2

#### 7.10.5 Thermal Noise in Resonators

**Thermal fluctuation-dissipation**:
k_B T = ½ k x² (mechanical)
k_B T = ½ C V² (electrical)
k_B T = ½ L I² (inductive)

**Thermal photon number**:
n_th = 1/(exp(hν/k_BT) - 1)
At 1550 nm, 300K: n_th ≈ 0.08
At 1550 nm, 4K: n_th ≈ 10⁻¹⁷

**Thermal noise power**:
P_th = n_th hν γ_b (in bandwidth)
For Q = 10⁵, ν = 193 THz:
γ_b/2π = 1.9 GHz
P_th = 0.08 × 1.28×10⁻¹⁹ × 1.9×10⁹ ≈ 2×10⁻¹¹ W

**Thermal phase noise**:
Δφ_th = √(k_B T / (ħ ω_0 n_circ))
For n_circ = 10⁶ photons: Δφ ≈ 10⁻⁴ rad

#### 7.10.6 Shot Noise and Quantum Limit

**Shot noise** (photon counting):
ΔN = √N
SNR = √N (for N photons)

**In resonator**:
N_circ = P_circ / (hν γ_b)
Shot noise on circulating power:
ΔP/P = 1/√N_circ

**Quantum-limited phase sensitivity**:
Δφ_min = 1/√(N_circ τ)
For N_circ = 10⁶, τ = 1 ms: Δφ = 10⁻⁶ rad

**Standard quantum limit (SQL)**:
Δφ_SQL = 1/√N (for N measurements)
Resonator can beat SQL with squeezed light

**Heisenberg limit**:
Δφ_HL = 1/N (using NOON states)
Requires non-classical states

#### 7.10.7 Noise in Microring Modulators

**Modulation noise sources**:
1. **Thermal noise** (heater Johnson-Nyquist)
   ΔT = √(4k_B T R Δf) / G_th
   
2. **Shot noise** (photodetector)
   i_shot = √(2qI B)
   
3. **RIN** (laser relative intensity noise)
   ΔP/P = RIN × √B
   
3. **Carrier noise** (injection/depletion)
   ΔN/N = 1/√N
   Δφ = (dφ/dN) ΔN

**Noise figure of modulator**:
NF_mod = 1 + (P_noise / P_signal) × (V_π/V)²

**Extinction ratio limitation**:
ER = 10 log₁₀(P_on/P_off)
P_off limited by noise floor
For 3 dB ER: noise = signal

**Extinction ratio penalty**:
ΔP_dB = 10 log₁₀(1 + 1/ER)
For ER = 10 dB: 0.4 dB penalty
For ER = 20 dB: 0.04 dB penalty

#### 7.10.8 Noise in Microring Weight Banks

**Weight noise**:
Δw/w = Δκ/κ + 2(Δφ/φ)
From: thermal, fabrication, quantization

**Accumulated noise** (N rings):
σ_total² = Σ σ_k²
For uncorrelated: σ_total = √N σ_1
For correlated (thermal): σ_total = N σ_1

**SNR at photodetector**:
SNR = (Σ w_k x_k)² / (Σ (Δw_k x_k)² + σ_det²)

**For N = 32, σ_w/w = 1%**:
Weight noise = 1% × √32 = 5.6%
Requires σ_w/w < 0.3% for 1% total noise

**Digital calibration**:
Measure W, compute W⁻¹
Apply pre-distortion
Residual error: σ_res ≈ σ_meas/√K (K measurements)

#### 7.10.9 Quantum Noise in Microring Quantum Circuits

**Single-photon source** (SFWM in ring):
Pair generation rate: R_pair = (γ P_p L_eff)²
CAR = R_pair / (R_Raman + R_dark)

**Raman noise in ring**:
Enhanced by Q: R_Raman ∝ Q²
Limits CAR to ~100-1000

**Squeezing in ring**:
Kerr Hamiltonian: H = ħχ a†² a²
Squeezing parameter: r = χ P_p L_eff
Limited by TPA/FCA: r_max ≈ 0.5 (4 dB)

**Entanglement generation**:
Two rings, coupled
Cluster state generation
Fidelity limited by loss and noise

**Quantum error correction**:
Bosonic codes (cat, GKP) in ring modes
Loss threshold: η > 50%
Requires ultra-high Q (> 10⁶)

#### 7.10.10 Noise Optimization Strategies

**For amplifiers**:
- Maximize Q_c/Q_0 ratio (overcouple)
- Minimize n_sp (population inversion)
- Cryogenic operation (n_th → 0)

**For modulators**:
- Maximize ER (depletion > injection)
- Minimize RIN (laser choice)
- Balanced detection (common-mode rejection)

**For weight banks**:
- Calibration (reduce systematic errors)
- Differential detection (cancel common-mode)
- Increase optical power (shot noise limit)

**For quantum applications**:
- Ultra-high Q (> 10⁶)
- Low TPA materials (SiN, AlGaAs)
- Phase-sensitive amplification
- Squeezed vacuum injection

**Fundamental limits**:
- Quantum Cramér-Rao bound
- Thermodynamic uncertainty relations
- Quantum Fisher information

---

*End of Piece 10. Document 7 complete (10 pieces). Next: Glue pieces into Doc07_Final.md*