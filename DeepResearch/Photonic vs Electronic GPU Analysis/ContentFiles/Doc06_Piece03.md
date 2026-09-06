# Document 6: Mach-Zehnder Interferometer Mesh Theory
## Piece 3: Phase Shifter Transfer Function: Thermal, Electro-Optic, MEMS

---

### 6.3 Phase Shifter Transfer Function: Thermal, Electro-Optic, MEMS

Phase shifters are the active elements that tune MZI mesh parameters. Their transfer function θ(V) or θ(I) determines the mesh's programmability, speed, power consumption, and linearity. Three primary technologies dominate: thermal (thermo-optic), electro-optic (Pockels), and MEMS.

#### 6.3.1 Thermo-Optic Phase Shifters

**Physics**: Silicon's refractive index changes with temperature
dn/dT = 1.86×10⁻⁴ K⁻¹ (at 1550 nm, 300K)

**Phase shift**:
θ = (2π/λ) Δn L = (2π/λ) (dn/dT) L ΔT

**Heater geometry**:
- Resistive heater above waveguide
- Metal (TiN, NiCr) or doped silicon
- Thermal isolation trench

**Thermal model**:
C_th dΔT/dt = P_heat - ΔT/R_th
where C_th = heat capacity, R_th = thermal resistance

**Steady-state**:
ΔT = P_heat R_th
θ = (2π/λ) (dn/dT) L R_th P_heat

**Efficiency**:
η = θ/P = (2π/λ) (dn/dT) L R_th
Typical: 1-2 rad/mW (for L=100μm, R_th=10 K/mW)

**Power for 2π**: 3-6 mW
**Switching speed**: τ = R_th C_th ≈ 1-10 μs
**Linearity**: θ ∝ P (good, but thermal crosstalk)

**Power consumption** (static):
P = θ/η
For 64×64 mesh (2016 MZIs): 2016 × 5 mW ≈ 10 W (worst case)

#### 6.3.2 Electro-Optic (Pockels) Phase Shifters

**Physics**: Pockels effect in non-centrosymmetric materials
Δn = -½ n³ r E
r = electro-optic coefficient (pm/V)

**Materials**:
- LiNbO₃: r₃₃ = 30 pm/V (bulk)
- BTO, KTP, organic polymers: r = 50-200 pm/V
- Silicon: no Pockels (centrosymmetric)
- Hybrid: LiNbO₃ on Si, BaTiO₃ on Si

**Phase shift**:
θ = (2π/λ) n³ r V L/d
where d = electrode gap

**Efficiency**:
V_π = λ d / (n³ r L)
For LiNbO₃ (r=30, n=2.2, L=1cm, d=10μm): V_π ≈ 4 V

**Speed**: Bandwidth > 50 GHz (RC limited)
**Power**: Dynamic only (capacitive)
P = ½ C V² f
C ≈ 1 pF, V = 5V, f = 10 GHz → 1.25 mW

**Advantages**: Fast, low power, no static power
**Challenges**: Hybrid integration, optical loss at interface

#### 6.3.3 MEMS Phase Shifters

**Physics**: Mechanical displacement changes optical path
- Piston: vertical displacement Δz
- θ = (2π/λ) Δz (or 2× for reflection)

**Actuation**:
- Electrostatic (comb drive, parallel plate)
- Thermal (bimorph)
- Piezoelectric

**Electrostatic comb drive**:
F = ½ V² dC/dx
Δx = F/k (k = spring constant)
Typical: Δx = 1 μm at 10 V

**Phase shift**:
θ = (2π/λ) × 2Δx (reflection)
For Δx = 1 μm, λ = 1.55 μm: θ ≈ 8 rad ≈ 1.3×2π

**Speed**: Mechanical resonance ≈ 10-100 kHz
**Power**: Near-zero static (electrostatic)
**Voltage**: 10-50 V

**Advantages**: Large phase range, low power, no thermal crosstalk
**Challenges**: Slow, mechanical reliability, stiction

#### 6.3.4 Carrier Injection/Depletion (Silicon)

**Physics**: Free carriers change refractive index
Δn = -8.8×10⁻²² N_e - 8.5×10⁻¹⁸ N_h (cm³)

**Injection (PIN diode)**:
Forward bias → inject electrons/holes
Δn ∝ I_inj
τ_on ≈ 1 ns (carrier lifetime)

**Depletion (PN diode)**:
Reverse bias → widen depletion region
Δn ∝ √V_R
τ_on ≈ 10-50 ps (RC limited)

**Accumulation (MOSCAP)**:
Gate voltage → accumulate carriers
τ_on ≈ 100 ps

**Efficiency**:
Injection: V_π ≈ 2-5 V (but high loss)
Depletion: V_π ≈ 10-20 V (low loss)

**Loss**:
α_FCA = 1.45×10⁻¹⁷ N_e + 1.35×10⁻¹⁷ N_h
Injection: high loss (carriers in waveguide)
Depletion: low loss (carriers removed)

#### 6.3.5 Phase Shifter Transfer Functions

**Thermal**:
θ(P) = η P / (1 + jωτ)  (first-order low-pass)
η = 1-2 rad/mW, τ = 1-10 μs
Static: θ = η P

**Electro-optic**:
θ(V) = (π/V_π) V  (linear, high bandwidth)
V_π = 2-5 V (hybrid)
Bandwidth: > 50 GHz

**MEMS**:
θ(V) = k V² / (1 - V²/V_pullin²)  (nonlinear)
Resonant: θ(ω) = θ_DC / (1 - (ω/ω₀)² + jω/ω₀Q)

**Carrier depletion**:
θ(V) = (π/V_π) √(V_bi + V_R)  (square-root)
V_π ≈ 10-20 V
Bandwidth: 10-50 GHz

#### 6.3.6 Phase Shifter Non-Idealities

**Nonlinearity**:
- Thermal: linear (good)
- MEMS: quadratic (needs linearization)
- Carrier: square-root (needs pre-distortion)

**Hysteresis**:
- MEMS: charge trapping, stiction
- Carrier: trap states
- Thermal: minimal

**Drift**:
- Thermal: temperature drift (ambient)
- Carrier: trap charging
- MEMS: charge accumulation

**Crosstalk**:
- Thermal: strong (thermal diffusion)
- Electro-optic: electrical crosstalk
- MEMS: mechanical crosstalk
- Carrier: electrical crosstalk

#### 6.3.7 Phase Shifter Calibration

**Characterization**:
1. Measure MZI transmission vs. control signal
2. Fit θ(V) or θ(P)
3. Build lookup table (LUT) or polynomial

**In-situ calibration**:
- Monitor output power
- Dither phase shifter
- Lock to quadrature point

**Neural network calibration**:
- Train NN: V → θ
- Accounts for crosstalk, nonlinearity
- Updates with temperature

#### 6.3.8 Multi-Phase Shifter MZI

**Two phase shifters** (for arbitrary SU(2)):
U = [e^{jφ₁} cos(θ/2)  -j e^{jφ₂} sin(θ/2)
     -j e^{jφ₂} sin(θ/2)  e^{jφ₁} cos(θ/2)]

**Common + differential**:
φ_c = (φ₁ + φ₂)/2 (common phase)
θ = φ₁ - φ₂ (differential phase)

**Implementation**:
- Common: thermal (slow, high range)
- Differential: electro-optic/carrier (fast, low range)

**Total phase range**: 2π + 2π = 4π (for full SU(2))

#### 6.3.9 Power Consumption Analysis

| Technology | Static Power | Dynamic Energy/π | Speed | Integration |
|------------|--------------|------------------|-------|-------------|
| Thermal (Si) | 3-6 mW/π | N/A | 1-10 μs | Native |
| Electro-optic (LiNbO₃) | 0 | ~1 fJ | > 50 GHz | Hybrid |
| MEMS | ~0 | ~1 pJ | 10-100 kHz | Hybrid |
| Carrier depletion | 0 | ~10 fJ | 10-50 GHz | Native |
| Carrier injection | ~1 mW/π | ~1 pJ | ~1 ns | Native |

**Mesh power** (64×64, 2016 MZIs, 2π each):
- Thermal: ~10 W
- Electro-optic: ~0 W static, ~2 mW dynamic @ 100 MHz
- Carrier depletion: ~0 W static, ~20 mW dynamic @ 100 MHz

#### 6.3.9 Cryogenic Operation

**Thermal**: dn/dT → 0 at 4K (freeze-out)
- Not usable below ~50K

**Electro-optic**: Works at 4K
- r may change slightly

**MEMS**: Works at 4K
- Materials contract, stress changes

**Carrier**: Freeze-out at 4K
- No free carriers
- Depletion still works (fixed doping)

#### 6.3.10 Future: Novel Phase Shifters

**Ferroelectric (HfZrO₂)**:
- Non-volatile, fast
- Sub-ns, low voltage
- Endurance: 10¹² cycles

**Phase-change materials (GST, Sb₂S₃)**:
- Non-volatile
- Large Δn (amorphous vs crystalline)
- ns switching, 10⁹ cycles

**2D materials (graphene, TMDs)**:
- Electro-absorption, phase shift
- Atomically thin
- High speed, low power

**Optomechanical**:
- Radiation pressure actuation
- Quantum-limited
- Cryogenic compatible

---

*End of Piece 3. Next: Piece 4 - Gradient Descent on Unitary Manifold: Wirtinger Calculus*