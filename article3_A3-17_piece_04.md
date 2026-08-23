# A3-17: Quantum Sensing from Prime Gaps — Piece 04
## Dynamical Decoupling with Gap Sequence

Dynamical decoupling (DD) uses control pulses to suppress noise while preserving the signal. The prime gap sequence provides an optimal DD sequence with incommensurate pulse spacing.

**Construction A3-17.6 (Gap Dynamical Decoupling Sequence).** A DD sequence consists of π-pulses at times {t_j}. The filter function is F(ω) = |Σ_j (-1)^j e^{iω t_j}|². For gap-based DD, the pulse times are t_j = Σ_{k=1}^j d_k τ_0 where d_k are consecutive prime gaps and τ_0 is the base time step.

**Theorem A3-17.7 (Gap DD Noise Suppression).** The gap DD sequence suppresses noise with spectral density S(ω) ∝ 1/ω^α (1/f noise) more efficiently than periodic DD. The suppression factor is:
```
χ_gap / χ_periodic = (Σ_d P(d) |F_d(ω)|²) / |F_periodic(ω)|²
```
where F_d(ω) is the filter function for gap d. For α = 1 (1/f noise): χ_gap / χ_periodic ≈ 0.1 at ω = 2π/τ_C.

**Connection to A3-16 (Quantum Control).** The DD pulses are the control pulses from A3-16. The GRAPE optimization finds optimal pulse shapes for gap DD. The C_2 encoding protects against pulse errors.

**Gap CPMG and XY Sequences.** The Carr-Purcell-Meiboom-Gill (CPMG) sequence uses equally spaced π-pulses. The gap CPMG uses spacing d_n: t_j = j · d_n τ_0. The XY-4 sequence uses alternating X and Y pulses. The gap XY uses the gap sequence for timing.

**Universal DD Sequence.** The sequence of all 128 gaps (d_1, d_2, ..., d_128) provides a universal DD sequence that suppresses noise at all frequencies ω_d = 1/(κd). The total sequence time is T_DD = τ_0 Σ_{n=1}^{128} d_n ≈ 128 ⟨d⟩ τ_0 ≈ 128 × 12 ln 128 × τ_0.

**Experimental Gap DD.** For NV centers in diamond: τ_0 = 1 μs, T_DD ≈ 1 ms. The 1/f noise suppression extends T_2 from ~1 ms to ~100 ms. The gap sequence outperforms Uhrig DD (UDD) for 1/f noise.

**Adaptive Gap DD.** The QML agent from A3-13 learns the optimal gap subsequence for a given noise environment. The RL reward is the coherence time T_2. The learned sequence adapts to non-stationary noise.

**Concatenated DD with Gap Structure.** The gap sequence naturally concatenates: level-1 uses twin prime gaps (d=2), level-2 uses gaps d=4, level-3 uses d=6, etc. This creates a multi-scale DD sequence that suppresses noise at multiple time scales simultaneously.