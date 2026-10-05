# Document 3: Thermodynamics of Joule Heating and Landauer Limit
## Piece 7: Entropy Production Rate in Steady-State Electronic Computation

---

### 3.7 Entropy Production Rate in Steady-State Electronic Computation

The entropy production rate quantifies the irreversibility of computational processes. In steady-state electronic computation, it provides a fundamental measure of energy dissipation beyond the Landauer limit, connecting microscopic transport physics to macroscopic thermodynamic efficiency.

#### 3.7.1 Entropy Production in Non-Equilibrium Steady States

For a system in contact with multiple reservoirs at temperatures T_α and chemical potentials μ_α, the entropy production rate is:

σ = Σ_α (J_{Q,α}/T_α - μ_α J_{N,α}/T_α)

where J_{Q,α} is heat current into reservoir α, J_{N,α} is particle current.

**Alternative form** (using affinities):
σ = Σ_k J_k A_k ≥ 0

where J_k are fluxes (particle, energy, spin), A_k are thermodynamic forces (affinities):
A_N = -Δ(μ/T), A_E = Δ(1/T)

**Second Law**: σ ≥ 0, with equality only at equilibrium.

#### 3.7.2 Entropy Production in a Resistor

**Simple resistor** between two reservoirs at T, μ_L and T, μ_R:
- Voltage bias: V = (μ_L - μ_R)/q
- Current: I = GV (G = conductance)
- Heat currents: J_{Q,L} = I(μ_L/q), J_{Q,R} = -I(μ_R/q)

Entropy production:
σ = J_{Q,L}/T + J_{Q,R}/T = I(μ_L - μ_R)/(qT) = IV/T = P/T

Power dissipated: P = IV = I²R
Entropy production: σ = P/T = I²R/T

**Per electron**: σ_e = qV/T = E_diss/T

#### 3.7.3 Entropy Production in MOSFET Channel

**Drift-diffusion model**:
Current density: J_n = q n μ_n E + q D_n ∇n
Energy current: J_E = J_n (E_C + 3/2 k_BT) + q μ_n n E (E_C + 5/2 k_BT) + κ ∇T

**Entropy production density**:
σ(r) = J_n · ∇(μ_n/qT) + J_E · ∇(1/T) - (μ_n/T) ∇·J_n

Simplified (isothermal, T constant):
σ = (1/T) J_n · E = (1/T) q n μ_n E²

**Total entropy production in channel**:
Σ = ∫ σ(r) d³r = (1/T) ∫ J_n · E d³r = P_diss/T

where P_diss = I_D V_DS is total power dissipation.

#### 3.7.4 Microscopic Expression: Boltzmann Equation

From BTE for electrons:
σ = -k_B ∫ d³k (∂f/∂t)_{coll} ln(f/(1-f))

Using collision integral:
(∂f/∂t)_{coll} = Σ_{k'} [W_{k'→k} f_{k'} (1-f_k) - W_{k→k'} f_k (1-f_{k'})]

**Entropy production**:
σ = (k_B/2) Σ_{k,k'} W_{k→k'} (f_k - f_{k'}) ln[f_k(1-f_{k'}) / f_{k'}(1-f_k)]

**Key properties**:
- σ ≥ 0 (H-theorem)
- σ = 0 iff f_k = f_{k'} for all connected states (detailed balance)
- Measures deviation from equilibrium distribution

#### 3.7.5 Entropy Production in Quantum Transport (NEGF)

**Meir-Wingreen formula** for entropy production:
σ = (1/ħ) ∫ dE Σ_α Tr[Σ^<_α G^> - Σ^>_α G^<] ln[(1-f_α)/f_α]

For non-interacting electrons with contact self-energies:
σ = (1/ħ) ∫ (dE/2π) Σ_{α,β} T_{αβ}(E) [f_α(E) - f_β(E)] ln[f_α(1-f_β)/f_β(1-f_α)]

where T_{αβ}(E) = Tr[Γ_α G^R Γ_β G^A] is transmission.

**Single-channel (Landauer)**:
σ = (1/h) ∫ dE T(E) [f_L - f_R] ln[(f_L(1-f_R))/(f_R(1-f_L))]

For small bias: σ ≈ (G/T) V² = P/T (matches classical)

#### 3.7.6 Entropy Production in Logic Operations

**CMOS inverter switching**:
- Charging capacitor: Q = C V_DD
- Energy from supply: E_sup = C V_DD²
- Energy stored: E_cap = ½ C V_DD²
- Energy dissipated: E_diss = ½ C V_DD²
- Entropy production: ΔS = E_diss/T = ½ C V_DD²/T

**Per logic operation** (including both transitions):
ΔS = C V_DD²/T

**Comparison with Landauer**:
Landauer: ΔS_min = k_B ln(2) ≈ 0.69 k_B
CMOS: ΔS_CMOS = C V_DD²/T

For 7nm: C ≈ 1 aF, V_DD = 0.7V, T = 300K
ΔS_CMOS ≈ 1.6×10⁻¹⁹ J/K
k_B = 1.38×10⁻²³ J/K
Ratio: ΔS_CMOS / (k_B ln 2) ≈ 170,000×

**Gap**: CMOS operates ~10⁵× above Landauer limit

#### 3.7.7 Entropy Production in Adiabatic Circuits

**Adiabatic charging** (slow, with inductor):
Energy from supply: E_sup = ½ C V_DD² (ideally)
Energy dissipated: E_diss ≈ (RC/T_sw) C V_DD²

where T_sw is switching time, RC is time constant.

**Entropy production**:
ΔS_adiabatic ≈ (RC/T_sw) C V_DD²/T

**Limit**: T_sw → ∞ gives ΔS → 0
But leakage, non-adiabatic losses set floor

**Energy-delay product**:
E·τ = (RC) C V_DD² = R C² V_DD²
Adiabatic: E·τ can be < k_B T ln(2) × τ (not violating Landauer)

#### 3.7.8 Entropy Production in Photonic Systems

**Photonic MVM (ONN)**:
- Optical loss: absorption, scattering
- Detector noise: shot noise, thermal noise
- ADC/DAC: quantization entropy

**Entropy production per MAC**:
ΔS_MAC = E_diss/T

For 1 fJ/MAC at 300K:
ΔS = 10⁻¹⁵ / 300 = 3.3×10⁻¹⁸ J/K
ΔS / (k_B ln 2) ≈ 3400×

**Quantum-limited photonic detection**:
Homodyne detection: SQL noise
Entropy production from measurement backaction
ΔS_meas ≥ k_B ln(2) per bit (quantum Landauer)

#### 3.7.9 Thermodynamic Uncertainty Relations

**Trade-off**: Precision vs. dissipation
For a current J with fluctuations:
Var(J) / ⟨J⟩² ≥ 2 k_B / (σ τ)

where τ is measurement time.

**Generalized**: (δX)² σ τ ≥ 2 k_B
Precision requires dissipation.

**Application to computing**:
Bit error rate ε requires σ ≥ (k_B/τ) ln(1/ε)
Low error → high dissipation

**Speed-accuracy-energy triangle**:
- Fast (small τ) → high σ
- Accurate (small ε) → high σ
- Low energy → low σ (conflicts with above)

#### 3.7.10 Minimum Entropy Production Principle

**Prigogine's theorem**: Near equilibrium, steady state minimizes σ
For linear regime: σ = Σ L_{ij} X_i X_j (Onsager)

**Far from equilibrium**: No general minimum principle
Maximum entropy production (MEP) conjectured for some systems

**Computing implication**:
Optimal computing schedules minimize σ for given throughput
Variational principle for computation:
Minimize ∫ σ(t) dt subject to computation completion

**Optimal protocols**:
- Adiabatic switching for logic
- Slow erasure for memory
- Reversible computing where possible

---

*End of Piece 7. Next: Piece 8 - Carnot Efficiency Limits for Heat-to-Work Conversion in Cooling Systems*