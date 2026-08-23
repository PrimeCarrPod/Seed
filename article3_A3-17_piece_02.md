# A3-17: Quantum Sensing from Prime Gaps — Piece 02
## Multi-Frequency Gap Sensor Hamiltonian

The gap Hamiltonian provides a natural multi-frequency sensor where each gap value d corresponds to a sensor frequency ω_d = 1/(κd). The 128 even gaps create a frequency comb with incommensurate spacing.

**Construction A3-17.2 (Gap Sensor Hamiltonian).** The sensor Hamiltonian with external field coupling is:
```
H_sense = H_gap + H_int = Σ_d (ℏ/κd)|d⟩⟨d| + Σ_d g_d B(t) |d⟩⟨d|
```
where B(t) is the field to be sensed (magnetic, electric, gravitational), and g_d is the coupling strength for gap d. The field imprints a phase φ_d = g_d ∫ B(t) dt on each gap state.

**Theorem A3-17.3 (Incommensurate Frequency Comb).** The frequencies ω_d = 1/(κd) for d ∈ {2, 4, ..., 254} are pairwise incommensurate: ω_d/ω_{d'} = d'/d ∉ ℚ for d ≠ d'. This enables simultaneous estimation of multiple field components without aliasing.

**Proof.** Since d and d' are distinct even integers, their ratio is rational but the frequencies are rationally independent because the set {1/d} has no linear relations over ℚ with small coefficients. The minimal polynomial has degree φ(128) = 64.

**Connection to A3-10 (Quantum Computing).** The PG-QFT V_{PG} = F_{256} D F_{256}^† diagonalizes the gap Hamiltonian. The frequency-domain readout is implemented by applying V_{PG} before measurement.

**Gap Frequency Comb Properties.** The frequency spacing is Δω_{d,d+2} = 2/(κd(d+2)) ≈ 2/(κd²). For d=2: Δω ≈ 1/(2κ). For d=254: Δω ≈ 3×10⁻⁵/κ. The comb spans 4 orders of magnitude in frequency.

**Sensitivity Function.** The phase sensitivity for gap d is ∂φ_d/∂B = g_d T. The total sensitivity is the vector sum over all gaps. For uniform coupling g_d = g: S = g T √(Σ_d 1) = g T √128 ≈ 11.3 g T. For optimal coupling g_d ∝ 1/d: S_opt = g T √(Σ_d 1/d²) ≈ 0.81 g T.

**Time-Domain Signal.** The time-domain signal after evolution time T is:
```
s(t) = Σ_d |c_d|² exp[-i(ℏ/κd + g_d B)t]
```
The Fourier transform of s(t) reveals peaks at frequencies ω_d + g_d B. The PG-QFT computes this Fourier transform in quantum hardware with O(N log N) = 256 × 8 = 2048 operations.

**Gap-Selective Addressing.** Individual gap channels can be addressed by applying a control pulse resonant with ω_d. The selectivity is δω = 2π/T. For T = 1 s: δω ≈ 6 rad/s, sufficient to resolve adjacent gaps for d < 50.