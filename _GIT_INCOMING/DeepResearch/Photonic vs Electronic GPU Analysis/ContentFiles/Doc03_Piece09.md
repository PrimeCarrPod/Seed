# Document 3: Thermodynamics of Joule Heating and Landauer Limit
## Piece 9: Thermodynamic Uncertainty Relations for Precision vs. Dissipation

---

### 3.9 Thermodynamic Uncertainty Relations for Precision vs. Dissipation

Thermodynamic uncertainty relations (TURs) establish fundamental trade-offs between the precision of a current (or any observable) and the entropy production required to sustain it. These relations have profound implications for the energy efficiency of computation, where precision (low error rates) demands dissipation.

#### 3.9.1 Classical Thermodynamic Uncertainty Relation

For a steady-state current J with mean ⟨J⟩ and variance Var(J), observed over time τ:

Var(J) / ⟨J⟩² ≥ 2 / (σ τ)

where σ is the entropy production rate.

**Equivalently**:
⟨J⟩² / Var(J) ≤ (σ τ) / 2

**Precision** (signal-to-noise ratio squared):
SNR² = ⟨J⟩² / Var(J) ≤ σ τ / 2

**Key implications**:
- Higher precision → higher dissipation
- Longer measurement time → better precision for same dissipation
- Universal: holds for any current in any Markovian system

#### 3.9.2 Derivation Sketch (Large Deviation Theory)

**Scaled cumulant generating function (SCGF)**:
λ(k) = lim_{τ→∞} (1/τ) ln ⟨e^{k τ J}⟩

**Fluctuation symmetry** (Gallavotti-Cohen):
λ(k) = λ(A - k) where A is affinity

**Gärtner-Ellis theorem**: Rate function I(j) = sup_k [kj - λ(k)]
Near mean: I(j) ≈ (j - ⟨J⟩)² / (2 Var(J))

**TUR from convexity**:
λ''(0) = Var(J) τ
λ'(0) = ⟨J⟩
Using λ(k) = λ(A-k) → λ''(0) = λ''(A)
Expanding λ(A-k) gives: ⟨J⟩ A ≥ 2 Var(J)/τ

Since σ = ⟨J⟩ A: Var(J)/⟨J⟩² ≥ 2/(σ τ)

#### 3.9.3 Generalizations

**Multiple currents**:
For vector current J = (J_1, ..., J_n):
Cov(J) ≥ 2 (J J^T) / (σ τ) (matrix inequality)

**Time-dependent systems** (finite-time TUR):
Var(J) / ⟨J⟩² ≥ 2 / (σ τ) × f(τ/τ_corr)
f(x) → 1 for x ≫ 1

**Quantum TUR**:
For quantum Markovian dynamics:
Var(J) / ⟨J⟩² ≥ 2 / (σ τ) (same form!)
But σ includes quantum coherence terms

**Information-theoretic TUR**:
Using mutual information I(X;Y):
Var(J) / ⟨J⟩² ≥ 2 / (I τ)

#### 3.9.4 Application to Electronic Transport

**Electrical current in resistor**:
J = I/q, ⟨J⟩ = I/q, Var(J) = S_I/(q² τ)
S_I = 4 k_B T G (Johnson-Nyquist)

TUR: S_I / (I² τ) ≥ 2 / (σ τ)
σ = P/T = I² R / T
S_I = 4 k_B T / R

Check: 4 k_B T / (R I² τ) ≥ 2 T / (I² R τ) → 4 k_B T ≥ 2 k_B T ✓

**Shot noise limit** (non-equilibrium):
S_I = 2 q I F (F = Fano factor)
TUR: F ≥ 2 k_B T / (q V) (for V ≫ k_BT/q)

At high bias: F ≥ 0 (trivial)
At low bias: F ≥ 2 k_B T / (q V) (Johnson-Nyquist)

#### 3.9.5 Precision-Dissipation Trade-off in Logic Gates

**Bit error rate and dissipation**:
For a logic gate with output current I, measurement time τ:
Error probability ε ≈ exp(-SNR²/2) ≈ exp(-I² τ / (2 S_I))

Using TUR: SNR² ≤ σ τ / 2
ε ≥ exp(-σ τ / 4)

**Minimum dissipation for error rate ε**:
σ_min = (4/τ) ln(1/ε)

Per operation (time τ):
E_min = T σ_min τ = 4 k_B T ln(1/ε)

**Comparison with Landauer**:
Landauer: E_min = k_B T ln(2) (for erasure, ε = 0.5)
TUR: E_min = 4 k_B T ln(1/ε) (for precision)

For ε = 10⁻⁹ (1 Gb error rate):
E_min / (k_B T) = 4 ln(10⁹) ≈ 83
Landauer: ln(2) ≈ 0.69
Ratio: ~120×

#### 3.9.6 Thermodynamic Uncertainty in Neural Network Inference

**MAC operation precision**:
Output current I_out = Σ w_i x_i
Noise: shot noise + thermal noise + quantization

**SNR for MAC**:
SNR² = I_out² / Var(I_out)

**Energy per MAC**:
E_MAC = P τ = I_out² R τ

**TUR bound**:
SNR² ≤ (E_MAC / (k_B T)) / 2

**Required SNR for b-bit precision**:
SNR ≈ 2^b
E_MAC ≥ 2 k_B T (2^b)² = 2^{2b+1} k_B T

For b = 8 (8-bit):
E_MAC ≥ 2^{17} k_B T ≈ 130,000 k_B T ≈ 5.4 pJ at 300K

**Actual electronic MAC**: ~10 pJ (close to bound!)
**Photonic target**: 1 fJ (violates classical TUR? No - quantum TUR different)

#### 3.9.7 Quantum Thermodynamic Uncertainty Relations

**Quantum currents**: Operators, non-commuting
**Quantum Fisher Information** enters bound:

Var(J) ≥ (1/τ) [1/F_Q + 2/(σ τ)]?

**Recent results** (Hasegawa, 2020; Guarnieri et al., 2019):
For quantum Markovian master equations:
Var(J) / ⟨J⟩² ≥ 2 / (σ τ) (same!)

But σ = Σ_α Tr[L_α ρ L_α^†] ln(...) includes coherence

**Quantum advantage?**:
Squeezed states can reduce Var(J) for same ⟨J⟩
But σ increases due to non-Gaussian operations
No free lunch: TUR holds with proper σ definition

**Coherent vs. incoherent transport**:
Coherent (ballistic): lower noise, but σ from contacts
Incoherent (diffusive): higher noise, σ from bulk
TUR satisfied in both regimes

#### 3.9.8 TUR for Photonic Neural Networks

**Optical MAC**:
I_out ∝ |E|² (photon counting)
Shot noise: Var(I) = ⟨I⟩ (Poisson)

**SNR² = ⟨I⟩**
Energy: E = ħω ⟨I⟩ τ (photons)

**Classical TUR check**:
σ = E/(T τ) = ħω ⟨I⟩/T
TUR: ⟨I⟩ ≥ 2/(σ τ) = 2T/(ħω ⟨I⟩ τ)
→ ⟨I⟩² τ ≥ 2T/ħω

At 1550 nm (ħω = 0.8 eV), T = 300K:
2T/ħω ≈ 0.065
Easily satisfied for any reasonable photon count

**Quantum TUR for phase estimation**:
Phase sensitivity Δφ ≥ 1/√(ν F_Q)
F_Q = 4 Var(N) for phase generator N

For coherent state: F_Q = n̄, Δφ = 1/√n̄
Energy: E = n̄ ħω
Δφ = √(ħω/E)

**Heisenberg limit**: F_Q = n², Δφ = 1/n
E = n ħω, Δφ = ħω/E
Quadratic improvement!

**But**: Heisenberg scaling requires non-classical states
Generating them costs entropy production
Total σ still satisfies TUR

#### 3.9.9 Speed-Accuracy-Energy Trade-off Surface

**Three-dimensional trade-off**:
- Speed: 1/τ (throughput)
- Accuracy: 1/ε (error rate)
- Energy: E per operation

**TUR constraint**:
ε ≥ exp(-E/(4 k_B T))

**Speed constraint** (RC delay):
τ ≥ RC
E = P τ ≥ P RC

**Combined**:
ε ≥ exp(-E/(4 k_B T))
E ≥ 4 k_B T ln(1/ε)

**Pareto frontier**:
For given technology (RC, V_DD, etc.):
Plot achievable (speed, accuracy, energy)
TUR gives fundamental boundary

**Technology comparison**:
| Technology | E_min (8-bit) | Speed | Notes |
|------------|---------------|-------|-------|
| CMOS 7nm | ~10 pJ | 1 GHz | Near TUR |
| Adiabatic CMOS | ~0.1 pJ | 10 MHz | Slow |
| Photonic (coherent) | ~1 fJ | 100 GHz | Quantum noise |
| Photonic (squeezed) | ~0.1 fJ | 100 GHz | Non-classical |
| Superconducting (SFQ) | ~1 aJ | 100 GHz | Cryogenic |

#### 3.9.10 Experimental Tests of TUR

**Colloidal particle in optical trap**:
- Measure current, fluctuations
- Verify TUR at various driving forces
- Matches theory

**Quantum dot thermoelectric**:
- Electron current through dot
- Measure noise, dissipation
- TUR satisfied

**Molecular motor (kinesin)**:
- Step current, ATP consumption
- TUR relates stepping precision to ATP hydrolysis
- Efficiency ~50% of TUR bound

**Electronic circuits**:
- Ring oscillator jitter vs. power
- Phase noise vs. bias current
- TUR explains fundamental limits

---

*End of Piece 9. Next: Piece 10 - Adiabatic Computing and Reversible Logic Gates Theoretical Limits*