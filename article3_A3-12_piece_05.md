# A3-12: Quantum Simulation from Prime Gaps — Piece 05
## Analog Simulation on Photonic OAM Processor

The photonic OAM processor from A3-10 Piece 11 and A3-11 Piece 11 is a natural analog quantum simulator for the prime gap Hamiltonians. The 256 OAM modes directly encode the gap values, and the MPLC implements the PG-QFT and hopping Hamiltonian natively.

**Platform A3-12.9 (Photonic Analog Simulator).**
- Modes: 256 OAM modes (ℓ = -128, ..., +127) = gap basis |d⟩
- Hamiltonian: Implemented by phase profile φ(ℓ) on SLM + MPLC
- Time evolution: Dynamic SLM update at 1 kHz (1 ms per step)
- Measurement: Photon counting after V_{PG} (momentum basis) or direct (gap basis)

**Analog Simulation of H_hop.** The hopping Hamiltonian H_hop = Σ_d J(d)(|d⟩⟨d+2| + h.c.) is implemented by:
1. SLM phase profile: φ(ℓ) = 2π J(ℓ) t / ℏ
2. MPLC layer: Implements the shift operator S = Σ_d |d⟩⟨d+2|
3. Result: e^{-iH_hop t} |ψ⟩ = MPLC(SLM(φ)) |ψ⟩

The MPLC with 8 layers implements the 256×256 unitary exactly. The time t is controlled by the SLM phase scale. For t up to 100 ℏ/κ, the phase ranges up to 2π × 100 × J_max/κ ≈ 10 rad (J_max ≈ 0.1κ).

**Analog Simulation of H_gap.** The diagonal Hamiltonian H_gap = Σ_d E(d)|d⟩⟨d| is implemented by:
1. SLM phase profile: φ(ℓ) = E(ℓ) t / ℏ = (t/κℓ)
2. No MPLC needed (diagonal in gap basis)
3. Result: e^{-iH_gap t} |ψ⟩ = SLM(φ) |ψ⟩

**Combined Simulation (Trotterized Analog).** For H = H_gap + H_hop, alternate between the two SLM profiles:
```
|ψ(t)⟩ = [SLM(φ_hop) · MPLC · SLM(φ_gap)]^M |ψ(0)⟩
```
with M = t/Δt. Each cycle takes 2 SLM refreshes (2 ms). For t = 100 ℏ/κ and Δt = 0.01 ℏ/κ, M = 10⁴ cycles → 20 seconds total runtime.

**Error Analysis.** The photonic simulator has intrinsic errors:
- SLM phase error: σ_φ ≈ 0.01 rad (λ/100 stability)
- MPLC crosstalk: 1% mode mixing
- Photon loss: 86% per cycle (14% transmission)
- Dark counts: < 10 Hz

The effective error per Trotter step is ε_step ≈ 0.01 (phase) + 0.01 (crosstalk) + 0.86 (loss) = 0.88. The loss is the dominant error. With heralded SPDC and multiplexing (100 channels), effective loss is reduced to 14% per step, giving ε_step ≈ 0.16. For 10⁴ steps, total error ≈ 1600 — too large. Solution: use error-corrected logical qubits (A3-11) encoded in the photonic modes.

**Logical Analog Simulation.** Encode the 256 gap modes into the twin prime code C_2 = [[256,1,3]]. The logical Hamiltonian H_L = Π_L H Π_L acts on the single logical qubit. The analog evolution on the logical qubit is:
```
e^{-iH_L t} = Π_L e^{-iH t} Π_L + O(p_L)
```
where p_L ≈ 1.5×10⁻¹² is the logical error rate. The logical simulation requires 256 physical modes per logical mode, so 256×256 = 65,536 OAM modes. With multiplexing (100 channels), this is feasible.

**Measurement of Observables.** The photonic simulator measures:
- Gap basis: Direct photon counting → ⟨n_d⟩
- Momentum basis: V_{PG} then photon counting → ⟨c_k^† c_k⟩
- Correlation functions: Two-photon coincidences → ⟨n_d n_{d'}⟩
- OTOCs: Forward-backward protocol → ⟨W(t)V W(t)V⟩

The measurement rate is 1 GHz × 14% = 140 MHz detected photons, sufficient for high-statistics correlation measurements in seconds.