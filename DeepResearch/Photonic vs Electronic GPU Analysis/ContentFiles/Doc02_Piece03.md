# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 3: Photon Number Statistics: Poissonian, Sub-Poissonian, Super-Poissonian

---

### 2.3 Photon Number Statistics: Poissonian, Sub-Poissonian, Super-Poissonian

Photon number statistics fundamentally distinguish classical from quantum light. The probability distribution P(n) of detecting n photons reveals the underlying quantum state and determines the performance limits of photonic computing systems.

#### 2.3.1 Poissonian Statistics: Coherent States

For a coherent state |α⟩, the photon number distribution is Poissonian:

P(n) = e^{-n̄} n̄ⁿ / n!

where n̄ = |α|² is the mean photon number.

Properties:
- Mean: ⟨N⟩ = n̄
- Variance: Var(N) = n̄
- Mandel Q = 0
- g⁽²⁾(0) = 1
- Fano factor F = Var(N)/⟨N⟩ = 1

The Poisson distribution arises from the independent, random arrival of photons. In the limit n̄ ≫ 1, it approaches Gaussian with σ = √n̄.

Shot noise limit: ΔN/⟨N⟩ = 1/√n̄

This is the standard quantum limit (SQL) for phase-insensitive measurements with coherent light.

#### 2.3.2 Super-Poissonian Statistics: Thermal and Chaotic Light

Thermal light (blackbody, LED, ASE) has Bose-Einstein statistics:

P(n) = n̄ⁿ / (n̄ + 1)^{n+1} = (1/(n̄+1)) (n̄/(n̄+1))ⁿ

Properties:
- Mean: ⟨N⟩ = n̄
- Variance: Var(N) = n̄(n̄ + 1)
- Mandel Q = n̄
- g⁽²⁾(0) = 2 (photon bunching)
- Fano factor F = n̄ + 1

For n̄ ≪ 1 (single-mode thermal): P(0) ≈ 1, P(1) ≈ n̄
For n̄ ≫ 1: approaches Gaussian with σ = n̄ (much larger than shot noise)

Chaotic light (multi-mode thermal) has even larger fluctuations:
Var(N) = n̄ + n̄²/M where M is number of modes
g⁽²⁾(0) = 1 + 1/M

#### 2.3.3 Sub-Poissonian Statistics: Non-Classical Light

Sub-Poissonian light has Var(N) < ⟨N⟩, violating the classical inequality. This is a purely quantum effect with no classical analog.

**Fock states |n⟩**:
P(n') = δ_{n,n'}
Var(N) = 0, Q = -1, g⁽²⁾(0) = 0 (perfect antibunching)

**Single-photon states**: |1⟩
Ideal single-photon source: Q = -1, g⁽²⁾(0) = 0
Realistic: Q ≈ -0.5 to -0.9, g⁽²⁾(0) ≈ 0.1-0.5

**Squeezed vacuum**:
|ξ⟩ = S(ξ)|0⟩, S(ξ) = exp(½(ξ* a² - ξ a^†²))
ξ = r e^{iφ} (squeezing parameter)

Photon number distribution (even n only):
P(2k) = (tanh r)^{2k} / cosh r × (2k)! / (2^k k!)²
P(2k+1) = 0

Mean: ⟨N⟩ = sinh²r
Variance: Var(N) = 2 sinh²r cosh²r = 2⟨N⟩(⟨N⟩+1)
Q = ⟨N⟩/2 + 1/2 (super-Poissonian for photon number!)
But quadrature variance can be < 1/4 (squeezing)

**Squeezed coherent states**:
|α, ξ⟩ = D(α) S(ξ) |0⟩
Can have sub-Poissonian statistics for appropriate α, ξ

#### 2.3.4 Photon Statistics in Parametric Processes

**Spontaneous Parametric Down-Conversion (SPDC)**:
Pump photon → signal + idler pair

Two-mode squeezed vacuum:
|ψ⟩ = √(1-λ²) Σ_{n=0}^∞ λⁿ |n⟩_s |n⟩_i

where λ = tanh(r), r = squeezing parameter.

Individual mode statistics (traced over partner):
Thermal: P(n) = (1-λ²) λ^{2n} = n̄ⁿ/(n̄+1)^{n+1}
n̄ = λ²/(1-λ²) = sinh²r
Q = n̄, g⁽²⁾(0) = 2

Joint statistics: Perfect photon number correlation ⟨N_s N_i⟩ = ⟨N_s⟩² + ⟨N_s⟩

**Four-Wave Mixing (FWM) in Silicon**:
Two pump photons → signal + idler
Same two-mode squeezed state structure
Phase matching: 2β_p = β_s + β_i
In silicon waveguides: γ = n₂ ω/c A_eff ≈ 200-500 W⁻¹m⁻¹

#### 2.3.5 Photon Statistics in Laser Diodes

Semiconductor laser photon statistics evolve with pump current:

**Below threshold (LED-like)**:
Thermal statistics: g⁽²⁾(0) = 2, Q = n̄

**At threshold**:
Large fluctuations, critical slowing down
g⁽²⁾(0) peaks (can exceed 2)

**Above threshold**:
Coherent state: g⁽²⁾(0) → 1, Q → 0
Phase diffusion: linewidth Δν = (π h ν / P) n_sp (1 + α²)
where n_sp is spontaneous emission factor, α is linewidth enhancement factor

**Quantum-limited linewidth (Schawlow-Townes)**:
Δν_ST = (2π h ν / P) (Δν_c)²
where Δν_c is cavity linewidth

For semiconductor lasers: α-factor (Henry factor) increases linewidth:
Δν = Δν_ST (1 + α²)

#### 2.3.6 Photon Statistics with Losses

Losses (attenuation η < 1) transform statistics:

For input state with P_in(n), output:
P_out(m) = Σ_{n=m}^∞ C(n,m) η^m (1-η)^{n-m} P_in(n)

where C(n,m) = n!/(m!(n-m)!)

Effect on key states:
- **Coherent state**: Remains coherent with n̄_out = η n̄_in
- **Thermal state**: Remains thermal with n̄_out = η n̄_in
- **Fock state |n⟩**: Binomial distribution P(m) = C(n,m) η^m (1-η)^{n-m}
- **Squeezed state**: Squeezing degrades, thermal noise added

General rule: Losses always increase g⁽²⁾(0) toward 1 (make light more Poissonian).

#### 2.3.7 Sub-Poissonian Light Generation in Silicon

**Quantum dot emitters**:
InAs/GaAs QDs on silicon (via heterointegration)
g⁽²⁾(0) < 0.1 at 4K, < 0.5 at 77K
Purity limited by multi-exciton emission and phonon dephasing

**Heralded single photons from FWM/SPDC**:
Detect idler → herald signal photon
Conditional g⁽²⁾(0) = P(2,1)/P(1,1)²
With heralding efficiency η_h: g⁽²⁾(0) ≈ 2(1-η_h)

**Silicon carbide (SiC) color centers**:
V_Si, divacancy centers in 4H-SiC
Room temperature single-photon emission
g⁽²⁾(0) ≈ 0.1-0.3

**Electroluminescent single-photon sources**:
p-i-n junctions with QDs
Electrical injection, compatible with CMOS

#### 2.3.8 Photon Statistics for Optical Neural Networks

In ONNs, photon statistics affect inference accuracy:

**Shot noise** (coherent state):
ΔI/I = 1/√N_ph
N_ph = number of photons per MAC operation
For 1 fJ/MAC at 1550 nm: N_ph ≈ 8000 → SNR ≈ 90 (19.5 dB)

**Thermal noise** (ASE from amplifiers):
ΔI/I = √(n_sp) (for phase-insensitive amps)
n_sp ≥ 1 for phase-insensitive
Degrades SNR by 3 dB minimum

**Quantum noise in MZI meshes**:
Phase shifters add phase noise Δφ
Output field: E_out = E_in cos(Δφ/2)
Intensity noise: ΔI/I ≈ Δφ²/4

**Requirements for 8-bit precision**:
SNR > 50 dB → N_ph > 10⁵ per MAC
Or quantum-enhanced states (squeezed)

#### 2.3.9 Quantum Metrology with Non-Classical Light

Sub-Poissonian and squeezed states beat SQL:

**Phase estimation** (interferometer):
- Coherent: Δφ = 1/√n̄ (SQL)
- Squeezed vacuum + coherent: Δφ = e^{-r}/√n̄
- Fock state |n⟩: Δφ = 1/n (Heisenberg limit)
- NOON state (|n,0⟩ + |0,n⟩): Δφ = 1/n

**Quantum Fisher Information (QFI)**:
F_Q = 4(⟨ψ'|ψ'⟩ - |⟨ψ|ψ'⟩|²)
For pure state |ψ(θ)⟩: F_Q = 4 Var(H) where H generates parameter
Cramér-Rao bound: Var(θ_est) ≥ 1/(ν F_Q) where ν = measurements

**Silicon photonic sensors**:
Ring resonator sensors with squeezed light
Enhanced sensitivity for biosensing, gyroscopes

#### 2.3.10 Photon Statistics in Quantum Error Correction

Bosonic codes encode qubits in harmonic oscillator states:

**Cat codes**: |C_α^±⟩ ∝ |α⟩ ± |-α⟩
Photon number parity protects against single-photon loss
Logical |0⟩ = |C_α^+⟩, |1⟩ = |C_α^-⟩
Photon number distribution: only even (|0⟩) or odd (|1⟩) n

**GKP codes**: Grid states in phase space
Comb of delta functions in quadrature
Corrects small displacement errors

**Binomial codes**: Superpositions of Fock states
|0⟩ = Σ c_k |kS⟩, |1⟩ = Σ c_k |kS+1⟩
Protects against photon loss and dephasing

**Error syndromes from photon counting**:
Photon number parity measurement detects single-photon loss
Requires PNRDs or parity measurement

---

*End of Piece 3. Next: Piece 4 - Squeezed Vacuum States for Quantum-Enhanced Sensing*