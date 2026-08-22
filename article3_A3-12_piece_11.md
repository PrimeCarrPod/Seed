# A3-12: Quantum Simulation from Prime Gaps — Piece 11
## Experimental Implementation and Benchmarking

We detail the experimental protocols for simulating prime gap Hamiltonians on the photonic OAM processor and superconducting qubits, with benchmarking against classical simulations.

**Platform A3-12.20 (Experimental Platforms).**
| Platform | Modes/Qubits | Hamiltonian | Time Scale | Error Rate |
|----------|--------------|-------------|------------|------------|
| Photonic OAM | 256 modes | H_gap, H_hop, H_ph | Δt = 1 ms (SLM), 1 ns (EOM) | p = 0.16/step |
| Superconducting | 256 transmons | H_FH, H_BH, H_QCD | Δt = 50 ns | p = 10⁻³/gate |
| Trapped Ions | 256 ions | H_gap, H_hop | Δt = 10 μs | p = 10⁻⁴/gate |

**Benchmarking Protocol A3-12.21 (Digital Simulation Verification).**
1. Classical exact diagonalization of H on 256×256 matrix (feasible)
2. Digital quantum simulation on hardware for times t = 0.1, 1, 10, 100 ℏ/κ
3. Compare observables: ⟨n_d(t)⟩, C(d,t), OTOC(t), K(τ)
4. Extract simulation error ε_sim = ||ρ_quantum(t) - ρ_exact(t)||₁
5. Verify ε_sim < ε_target = 10⁻² for t < t_max

**Analog Simulation Verification.** The analog simulator directly implements e^{-iHt} without Trotter error. The verification compares:
- Energy conservation: ⟨H⟩(t) = const
- Eigenstate thermalization: ⟨n_d(t)⟩ → thermal prediction
- OTOC growth: λ_L = 2π/β
- Spectral form factor: K(τ) ramp-plateau

**Classical Simulation Comparison.** The 256-site fermionic model is classically simulable via:
- Exact diagonalization: O(256³) = 16.7M ops
- Tensor networks (MPS): bond dimension χ = 128 for t < 100 ℏ/κ
- Quantum Monte Carlo: sign problem free for free fermions
The classical simulation provides the exact benchmark for quantum hardware.

**Quantum Advantage Regime.** The quantum simulator outperforms classical when:
- Interacting fermions (U ≠ 0): MPS χ grows exponentially with t
- Gauge theories (Piece 09): Classical simulation is #P-hard
- Non-equilibrium dynamics: Classical methods fail for t > t_Th
- Large systems: Scaling to 3500 books = 900K modes (intractable classically)

**Photonic Experiment: Fermionic Quench (t = 10 ℏ/κ).**
1. Prepare |ψ(0)⟩ = ground state of H_i (SLM + MPLC, 2 ms)
2. Quench to H_f via EOM (1 ns)
3. Evolve for t = 10 ℏ/κ (MPLC, 10 ms)
4. Measure ⟨n_d⟩ via photon counting (1 s)
5. Repeat for t = 0.1, 1, 10, 100 ℏ/κ
Total time: < 1 minute per quench protocol.

**Superconducting Experiment: Gauge Theory (Piece 09).**
1. Encode link variables U_n in transmon frequencies
2. Implement Kogut-Susskind Hamiltonian via cross-resonance gates
3. Measure Wilson loops W_C via Ramsey interferometry
4. Verify confinement: ⟨W_C⟩ ∝ e^{-σ Area(C)}
Total time: 1 hour for full benchmark suite.

**Error Mitigation.**
- Zero-noise extrapolation: Run at stretched gate times, extrapolate to zero
- Probabilistic error cancellation: Sample from quasi-probability distribution
- Virtual distillation: Prepare multiple copies, measure symmetric polynomials
For the photonic processor, the dominant error is loss (86%). Virtual distillation with 2 copies reduces loss error from 0.86 to 0.86² = 0.74. With 4 copies, 0.86⁴ = 0.55. The logical encoding (A3-11) is more effective: p_L ≈ 10⁻¹².

**Data Output and Analysis.** The simulation generates:
- Time series of ⟨n_d(t)⟩ for d = 2, 4, ..., 254
- Correlation functions C(d, t) for |d| < 50
- OTOC C(t) for W = n_d, V = n_0
- Spectral form factor K(τ) from energy measurements
All data is stored in HDF5 format, compatible with PrimeBookOne tile structure.