# A3-13: Quantum Machine Learning from Prime Gaps — Piece 10
## Experimental Implementation Roadmap

The prime gap QML algorithms map naturally to near-term quantum hardware. We provide resource estimates for four platforms.

**Photonic OAM (Primary Platform).**
- 256 OAM modes: ℓ = 0..255
- PG-QFT: 17-layer MPLC (A3-12 Piece 11)
- State prep: SLM + Fourier optics for |ψ(x)⟩ = Σ_d √P(d|x) |ℓ=d⟩
- Diagonal phases: 256 phase modulators (liquid crystal or MEMS)
- Measurement: SNSPD array + mode sorter (8-bit output)
- Rate: 10^6 photons/sec → 10^6 circuit evaluations/sec
- Training time: 6144 evals/iter × 5000 iters / 10^6 = 30 sec
- Error correction: C_2 syndrome via 8-mode measurement (A3-11)

**Superconducting Transmons.**
- 256 transmons in 16×16 grid
- Frequency allocation: ω_d = ω_0 / d (d=1..256)
- Coupling: capacitive g_{dd'} = g_0 C(d, d') (A3-05 correlations)
- PG-QFT: fast flux pulses (256 ns per layer)
- Single-qubit gates: microwave drives (20 ns)
- Readout: dispersive measurement (500 ns)
- T1 > 100 μs, T2 > 50 μs → 10^3 circuit depth
- Training time: 6144 × 5000 × 1 μs = 30 sec

**Trapped Ions.**
- 256 ions in 2D array (or 1D with shuttling)
- Modes: radial phonons ω_d = ω_0 √d
- PG-QFT: Mølmer-Sørensen gates implementing F_{256}
- Individual addressing: 256 laser beams or AOD
- Coherence > 1 sec → 10^6 circuit depth
- Native all-to-all connectivity matches gap correlations
- Training time: 6144 × 5000 × 10 μs = 5 min

**Neutral Atom Arrays (Rydberg).**
- 256 atoms in 16×16 optical tweezers
- Rydberg states |r_d⟩ with n_d = n_0 + d
- Gap Hamiltonian native: H = Σ_d (ℏ/κ d) |r_d⟩⟨r_d| + Σ V_{dd'} |r_d r_{d'}⟩⟨r_d r_{d'}|
- Blockade radius R_b matches gap correlation length ξ = 150
- PG-QFT: global Rydberg pulses + local addressing
- Coherence > 10 sec → 10^7 circuit depth
- Training time: 6144 × 5000 × 1 μs = 30 sec

**Classical Precomputation.** All platforms use GPU for:
- Gap sequence {d_n}: 14.7 GB (4 bytes × 3.67B)
- Correlation matrix C_{dd'}: 256×256 = 0.5 MB
- PG-QFT matrix: 256×256 complex = 1 MB
- Precomputed once, loaded to quantum hardware

**Verification Protocol.**
1. Prepare |ψ(x)⟩ for known x, measure P(d|x) → verify state prep
2. Apply V_{PG}, measure in Fourier basis → verify PG-QFT
3. Run VQC on training set, track loss → verify training
4. Extract syndrome → verify QECC (A3-11)
5. Compare test accuracy with classical baseline → verify advantage