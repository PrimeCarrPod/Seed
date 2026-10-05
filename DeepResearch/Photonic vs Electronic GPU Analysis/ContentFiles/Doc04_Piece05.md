# Document 4: RC Delay Physics and Transmission Line Theory
## Piece 5: Slow-Wave Modes in Coupled Transmission Lines (Crosstalk)

---

### 4.5 Slow-Wave Modes in Coupled Transmission Lines (Crosstalk)

Crosstalk between adjacent interconnects is a major signal integrity concern in dense ICs. The coupled transmission line theory reveals slow-wave and fast-wave modes with different velocities and impedances, determining near-end (NEXT) and far-end (FEXT) crosstalk magnitudes.

#### 4.5.1 Coupled Transmission Line Equations

**N coupled lines** (per-unit-length matrices):
∂V/∂z = -[R] I - [L] ∂I/∂t
∂I/∂z = -[G] V - [C] ∂V/∂t

In frequency domain:
dV/dz = -Z I, dI/dz = -Y V
Z = R + jωL, Y = G + jωC

**Symmetry**: [L] and [C] are symmetric, positive definite.
L_ii = self-inductance, L_ij = mutual inductance
C_ii = self-capacitance, C_ij = mutual capacitance (negative!)

#### 4.5.2 Even/Odd Mode Decomposition

For two identical coupled lines:
**Even mode** (common mode): V₁ = V₂, I₁ = I₂
- Current flows same direction
- Fields add between lines
- Higher capacitance: C_e = C_s + 2C_m
- Lower inductance: L_e = L_s - L_m
- Z₀e = √(L_e/C_e) < Z₀
- v_pe = 1/√(L_e C_e) < v_p (slow wave)

**Odd mode** (differential mode): V₁ = -V₂, I₁ = -I₂
- Current flows opposite direction
- Fields cancel between lines
- Lower capacitance: C_o = C_s - 2C_m
- Higher inductance: L_o = L_s + L_m
- Z₀o = √(L_o/C_o) > Z₀
- v_po = 1/√(L_o C_o) > v_p (fast wave)

#### 4.5.3 Mode Velocities and Impedances

**Coupling coefficients**:
k_C = C_m/C_s (capacitive coupling)
k_L = L_m/L_s (inductive coupling)

**Even mode**:
C_e = C_s(1 + 2k_C)
L_e = L_s(1 - k_L)
Z₀e = Z₀ √((1 - k_L)/(1 + 2k_C))
v_pe = v_p / √((1 + 2k_C)(1 - k_L))

**Odd mode**:
C_o = C_s(1 - 2k_C)
L_o = L_s(1 + k_L)
Z₀o = Z₀ √((1 + k_L)/(1 - 2k_C))
v_po = v_p / √((1 - 2k_C)(1 + k_L))

**Homogeneous medium** (ε_r same everywhere):
k_L = k_C → v_pe = v_po = v_p (no dispersion)
Z₀e Z₀o = Z₀²

**Inhomogeneous medium** (SiO₂/air, microstrip):
k_L < k_C
v_pe < v_po → **mode velocity dispersion**

#### 4.5.4 Near-End Crosstalk (NEXT)

**Mechanism**: Backward coupled wave
Aggressor forward wave → coupled backward wave on victim

**NEXT voltage** (for step input, length L):
V_NEXT(t) = ½ (Z₀e - Z₀o)/(Z₀e + Z₀o) × dV_agg/dt × τ_c

where τ_c = L/v_p is line delay.

**Simplified** (weak coupling, k_C, k_L ≪ 1):
V_NEXT/V_agg ≈ ¼ (k_C - k_L) × (t_r / τ_c)

where t_r = rise time.

**Key properties**:
- Proportional to aggressor slew rate dV/dt
- Independent of line length (for electrically short lines)
- Backward traveling (appears at driver end)
- Duration = 2τ_c (round trip)

**For on-chip** (inhomogeneous, k_C > k_L):
NEXT > 0 (positive pulse)

#### 4.5.5 Far-End Crosstalk (FEXT)

**Mechanism**: Forward coupled wave
Aggressor forward wave → coupled forward wave on victim

**FEXT voltage** (for ramp input):
V_FEXT(t) = ½ (L_m/L_s - C_m/C_s) × (L/v_p) × dV_agg/dt

**Simplified**:
V_FEXT/V_agg ≈ ½ (k_L - k_C) × (τ_c / t_r)

**Key properties**:
- Proportional to line length L
- Forward traveling (appears at receiver end)
- Duration = t_r (same as aggressor edge)
- Opposite polarity to NEXT for k_C > k_L

**For homogeneous medium** (k_L = k_C):
FEXT = 0 (ideal, no forward crosstalk)

**For on-chip** (k_C > k_L):
FEXT negative (opposite polarity)

#### 4.5.6 Crosstalk in Multi-Line Buses

**N-line bus**: 1 aggressor, N-1 victims
Crosstalk sums from all neighbors

**Worst-case patterns**:
- Simultaneous switching (SSN): all aggressors toggle same direction
- Alternating: aggressors toggle opposite to maximize FEXT

**Statistical crosstalk** (random data):
RMS crosstalk = √(Σ V_NEXT,i² + Σ V_FEXT,i²)

**Crosstalk-induced jitter**:
Δt_jitter = V_xtalk / (dV/dt)_victim

**Eye diagram closure**:
Eye height reduction = Σ |V_xtalk|
Eye width reduction = 2 × Δt_jitter

#### 4.5.7 Mitigation Techniques

**Spacing rules**:
- Increase S (spacing) → reduces k_C, k_L exponentially
- 3× spacing rule: S ≥ 3×W for critical nets

**Shielding**:
- Ground line between signals (G-S-G)
- Shield tied to ground at both ends
- Increases capacitance (2×C_m to shield)

**Twisted pairs / differential routing**:
- Odd mode propagation
- Common-mode rejection at receiver
- FEXT cancels in differential receiver

**Coding**:
- Invert coding (bus invert)
- Transition limiting codes
- Reduces simultaneous switching

**Repeater insertion**:
- Breaks long coupled sections
- Isolates crosstalk segments
- Adds delay, area, power

**Layer assignment**:
- Route critical nets on upper layers (thicker metal, wider spacing)
- Alternate horizontal/vertical between layers
- Avoid long parallel runs on same layer

#### 4.5.8 Crosstalk in Advanced Nodes

**FinFET/GAA impact**:
- Local interconnects: buried power rails, local routing
- Reduced spacing → higher coupling
- 3D stacking: TSV coupling, face-to-face coupling

**Low-k dielectric**:
- Reduces C_m (good for crosstalk)
- But increases R (bad for RC delay)
- Air gaps: best for crosstalk, hard to manufacture

**Backside power delivery (BSPD)**:
- Power on backside, signals on front
- Reduces signal layer congestion
- Less coupling to power rails

**Optical interconnects**:
- No electrical crosstalk
- Optical crosstalk: wavelength, mode, polarization
- Different physics, better isolation

#### 4.5.9 Measurement and Modeling

**S-parameter extraction**:
- 4-port (or N-port) VNA measurement
- De-embedding for pads, fixtures
- S_ij: port i to port j transmission/reflection

**Crosstalk metrics**:
- NEXT: S_31 (port 3 = victim near, port 1 = aggressor far)
- FEXT: S_41 (port 4 = victim far)
- Differential: S_dd, S_dc, S_cd, S_cc

**Modeling in SPICE**:
- W-element (transmission line)
- Coupled T-line models (K-coupling, mutual L/C)
- Behavioral models (IBIS, AMI)

**Statistical analysis**:
- Monte Carlo on process variations
- Worst-case corner extraction
- Yield optimization

#### 4.5.10 Future: Crosstalk-Free Interconnects

**Differential optical interconnects**:
- No electrical coupling
- Wavelength division multiplexing (WDM)
- Each channel independent

**RF/wireless on-chip**:
- Inductive/capacitive wireless links
- No physical wires → no crosstalk
- Limited bandwidth, power

**Time-division multiplexing (TDM)**:
- Share wire, no simultaneous signals
- No crosstalk by construction
- Latency overhead

**Coding theory approaches**:
- Crosstalk-aware codes
- Precoding to cancel FEXT
- Tomlinson-Harashima precoding

---

*End of Piece 5. Next: Piece 6 - Eye Diagram Analysis: Jitter Decomposition*