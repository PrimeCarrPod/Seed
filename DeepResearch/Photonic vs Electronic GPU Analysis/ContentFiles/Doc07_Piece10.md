# Document 7: Microring Resonator Physics and Coupled Mode Theory
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