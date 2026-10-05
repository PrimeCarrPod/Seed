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

*End of Piece 1. Next: Piece 2 - Critical Coupling Condition: κ² = 1 - e^(-αL)*