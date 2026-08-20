# Document 4: RC Delay Physics and Transmission Line Theory
## Piece 1: Telegrapher's Equations for Lossy On-Chip Interconnects

---

### 4.1 Telegrapher's Equations for Lossy On-Chip Interconnects

The telegrapher's equations describe voltage and current propagation along transmission lines, forming the foundation for on-chip interconnect analysis. For lossy lines with frequency-dependent parameters, these equations capture RC delay, skin effect, dielectric loss, and signal integrity degradation in nanoscale ICs.

#### 4.1.1 Derivation from Maxwell's Equations

Starting from Maxwell's equations in a transmission line geometry:
∇ × E = -∂B/∂t
∇ × H = J + ∂D/∂t

For a uniform line along z with cross-section in xy-plane:
V(z,t) = -∫_C E·dl (voltage between conductors)
I(z,t) = ∮_C H·dl (current on conductor)

Applying Faraday's and Ampere's laws to differential element dz:
∂V/∂z = -L ∂I/∂t - R I
∂I/∂z = -C ∂V/∂t - G V

where R, L, G, C are per-unit-length (p.u.l.) parameters:
- R: series resistance (conductor loss)
- L: series inductance (magnetic energy storage)
- G: shunt conductance (dielectric loss)
- C: shunt capacitance (electric energy storage)

#### 4.1.2 Frequency-Domain Telegrapher's Equations

In phasor domain (e^{jωt} convention):
dV/dz = -(R + jωL) I = -Z I
dI/dz = -(G + jωC) V = -Y V

where Z(ω) = R(ω) + jωL(ω) is series impedance
Y(ω) = G(ω) + jωC(ω) is shunt admittance

**Propagation constant**:
γ(ω) = √(Z Y) = α(ω) + jβ(ω)

**Characteristic impedance**:
Z₀(ω) = √(Z/Y)

**General solution**:
V(z) = V⁺ e^{-γz} + V⁻ e^{γz}
I(z) = (V⁺/Z₀) e^{-γz} - (V⁻/Z₀) e^{γz}

#### 4.1.3 Lossless Line Approximation (R=G=0)

γ₀ = jω√(LC) = jβ₀
β₀ = ω/v_p
v_p = 1/√(LC) (phase velocity)
Z₀ = √(L/C)

For on-chip interconnects: v_p ≈ c/√ε_eff ≈ 0.3-0.5c

#### 4.1.4 Low-Loss Approximation (R ≪ ωL, G ≪ ωC)

γ ≈ jω√(LC) [1 + (R/jωL + G/jωC)/2]
α ≈ ½ (R√(C/L) + G√(L/C)) = (R/Z₀ + G Z₀)/2
β ≈ ω√(LC) [1 + ⅛ (R/ωL - G/ωC)²]

**Attenuation constant** α determines signal loss
**Phase constant** β determines delay and dispersion

#### 4.1.5 RC-Dominant Regime (ωL ≪ R, G ≪ ωC)

For on-chip interconnects at low frequencies:
R ≫ ωL (resistive), G ≪ ωC (low dielectric loss)

γ ≈ √(R jωC) = √(ωRC/2) (1 + j)
α = β = √(ωRC/2)

**Delay per unit length**: τ = β/ω = √(RC/(2ω))
**But this is frequency-dependent!**

**Elmore delay** (step response):
τ_Elmore = 0.38 RC L² (for distributed RC line)

#### 4.1.6 Frequency-Dependent Parameters

**Resistance R(ω)**:
- DC: R_DC = ρ/(W·t) (ρ = resistivity)
- Skin effect: R(ω) = R_DC [1 + (δ/t)²/3 + ...]
  δ = √(2ρ/ωμ) = skin depth
- Proximity effect: additional increase
- Surface roughness: Hammerstad-Bekkadal model

**Inductance L(ω)**:
- Internal inductance: L_int = L_DC - L(∞)
- External inductance: from field solver
- Total L(ω) = L_ext + L_int(ω)
- L_int decreases with frequency (skin effect)

**Capacitance C(ω)**:
- Quasi-static: C(ω) ≈ C_DC
- Dielectric dispersion: ε(ω) = ε_∞ + (ε_s - ε_∞)/(1 + jωτ_D)
- Fringing fields: conformal mapping or field solver

**Conductance G(ω)**:
G(ω) = ω C(ω) tan δ(ω)
tan δ = ε''/ε' = loss tangent
For SiO₂: tan δ ≈ 0.001-0.01 at GHz
For low-k: tan δ ≈ 0.01-0.1

#### 4.1.7 Transmission Line Parameters for On-Chip Interconnects

**Typical values (7nm node, global interconnect)**:
- Width W = 40 nm, Thickness t = 100 nm
- Spacing S = 40 nm, ILD thickness H = 200 nm
- R_DC ≈ 150 Ω/μm
- C ≈ 0.15 fF/μm
- L ≈ 0.2 pH/μm
- G ≈ ω C tan δ ≈ 0.1 μS/μm at 10 GHz

**RC time constant**: RC ≈ 22.5 ps/μm²
For 1 mm wire: RC = 22.5 ns (huge!)

**LC time constant**: LC ≈ 30 fs/μm²
Wave propagation: τ ≈ L/v_p ≈ 3 ps/mm

#### 4.1.8 Repeater Insertion for RC Lines

Long wires must be buffered (repeaters) to avoid quadratic RC delay.

**Optimal repeater spacing** (Bakoglu):
L_opt = √(2 R_drv C_wire / R_wire C_drv) × something

**Simplified**: L_opt ≈ √(R_drv C_wire / (R_wire C_drv))
where R_drv = driver resistance, C_drv = driver input cap

**Delay with N repeaters**:
τ_total = N τ_stage + τ_wire
τ_stage = R_drv (C_drv + C_wire L/N)
τ_wire = 0.38 R_wire C_wire (L/N)²

Minimizing gives N_opt ∝ L, τ_min ∝ L

**Modern practice**: Repeaters every 100-200 μm
Buffer sizing: tapered (1×, 2×, 4×...)

#### 4.1.9 Crosstalk in Coupled Lines

**Coupled telegrapher's equations**:
dV/dz = -Z I
dI/dz = -Y V

For N coupled lines, Z and Y are N×N matrices:
Z = R + jωL, Y = G + jωC

**Even/odd mode decomposition**:
Even mode: Z₀e, β_e (coupled in-phase)
Odd mode: Z₀o, β_o (coupled anti-phase)

**Near-end crosstalk (NEXT)**:
V_NEXT/V_in ≈ ¼ (C_m/C + L_m/L) (τ_r / τ_wire)

**Far-end crosstalk (FEXT)**:
V_FEXT/V_in ≈ ½ (L_m/L - C_m/C) (L / v_p)

For on-chip: C_m/C dominates (capacitive coupling)
FEXT ≈ 0 for symmetric lines (C_m/C = L_m/L)

#### 4.1.10 Field Solver Extraction

**2D/3D field solvers** (HFSS, Q3D, Raphael):
- Discretize cross-section
- Solve Poisson/Laplace for C, G
- Solve magnetostatic for L, R (with eddy currents)

**Parameter extraction flow**:
1. Define geometry (layer stack, materials)
2. Run field solver at multiple frequencies
3. Extract R(ω), L(ω), C(ω), G(ω)
4. Fit to compact models (pole-residue, Foster)
5. Use in circuit simulators (SPICE, ADS)

**Wideband models**:
- Vector fitting for rational approximation
- Passivity enforcement (Brune, spectral)
- Causality: Kramers-Kronig relations

---

*End of Piece 1. Next: Piece 2 - Skin Effect and Proximity Effect in Copper Damascene Processes*