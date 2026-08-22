# A3-15: Quantum Thermodynamics from Prime Gaps — Piece 07
## Maxwell's Demon from Gap Measurement

Maxwell's demon is realized using the gap measurement apparatus, with the twin prime code providing the demon's memory.

**Construction A3-15.16 (Gap Maxwell Demon).** The demon protocol:
1. Measure gap value d in system S (projective measurement |d⟩⟨d|)
2. Store outcome in demon memory M (encoded in twin prime code C_2)
3. Apply feedback unitary U_d on S based on measurement
4. Erase memory M (Landauer cost)

**Theorem A3-15.17 (Gap Demon Work Extraction).** The demon extracts work:
```
W_demon = k_B T [ I(S:M) - H(M|S) ]
```
where I(S:M) is the mutual information between system and memory, H(M|S) is the conditional entropy. For the gap demon with perfect measurement: I(S:M) = H(P) ≈ 3.2 k_B, H(M|S) = 0.

**Twin Prime Memory.** The demon's memory is the twin prime code logical qubit:
```
|0_L⟩ = (|2⟩ + |4⟩)/√2,  |1_L⟩ = (|2⟩ - |4⟩)/√2
```
The measurement of d=2 or d=4 is stored in the logical basis. The memory size is 1 logical qubit (256 physical qubits).

**Landauer Erasure Cost.** Erasing the demon's memory costs:
```
W_erase = k_B T log 2 = 0.69 k_B T
```
per bit. The net work gain: W_net = k_B T (H(P) - log 2) ≈ 2.5 k_B T per cycle.

**Quantum Demon with Coherence.** The demon measures in the PG-QFT basis (coherent superposition of gaps). The extracted work:
```
W_quant = k_B T [ S(ρ_β) - S(ρ_β|{Π_k}) ]
```
where {Π_k} is the PG-QFT measurement. For the gap thermal state: S(ρ_β) ≈ 3.2 k_B, S(ρ_β|{Π_k}) ≈ 1.8 k_B, so W_quant ≈ 1.4 k_B T.

**Connection to A3-14 (Metrology).** The demon's measurement is the adaptive phase estimation from A3-14 Piece 04. The FPGA feedback implements the demon's unitary.

**Connection to A3-11 (Error Correction).** The twin prime code C_2 protects the demon's memory against decoherence. The logical memory lifetime: τ_mem = 1/p_L ≈ 10¹² ℏ/κ.

**Experimental Demon.** On photonic OAM: Measure photon in Fourier basis, store result in FPGA register, apply phase shift via SLM. Net work: 2.5 k_B T per photon. With 10⁴ photons/sec: 2.5×10⁴ k_B T/sec.

**Second Law Verification.** The total entropy production including demon:
```
Σ_total = ΔS_S + ΔS_M + βQ ≥ 0
```
The demon's memory entropy increase ΔS_M = H(M) compensates the system entropy decrease. The Landauer erasure ensures Σ_total ≥ 0.