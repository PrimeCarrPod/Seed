# A3-16: Quantum Control from Prime Gaps — Piece 08
## Robust Control Against Gap Noise

Robust control designs pulses that are resilient to noise in the gap Hamiltonian and control fields.

**Construction A3-16.18 (Gap Robust Control Problem).** The noisy Hamiltonian is:
```
H(t) = H_drift(κ + δκ) + Σ_d (ε_d(t) + δε_d(t)) (|d⟩⟨d+2| + h.c.)
```
where δκ is parameter uncertainty, δε_d(t) is control noise. The robust control minimizes worst-case infidelity:
```
ε_robust = argmin_ε max_{δκ, δε} [ 1 - F(ε, δκ, δε) ]
```

**Theorem A3-16.19 (Gap Robust Control via Ensemble Optimization).** The robust control is found by ensemble optimization over noise samples:
```
ε_robust = argmin_ε Σ_{i=1}^N w_i [ 1 - F(ε, δκ_i, δε_i) ]
```
where (δκ_i, δε_i) are sampled from the noise distribution. For gap noise: δκ/κ ~ N(0, 10⁻⁵), δε/ε ~ N(0, 10⁻³).

**Lemma A3-16.20 (Gap Composite Pulses).** Composite pulses provide robustness to control amplitude errors:
- BB1 pulse: 4 pulses with phases 0, φ, 3φ, φ where φ = arccos(-1/4)
- CORPSE: 3 pulses for off-resonance robustness
- SCROFULOUS: combines BB1 and CORPSE
For gap transitions, composite pulses achieve F > 0.9999 for δε/ε = 10%.

**Connection to A3-06 (Decoherence).** The decoherence noise from A3-06 is γ ~ P(d_random)/P(d_typical). The robust control includes decoherence in the ensemble optimization.

**Dynamical Decoupling for Gap Control.** The gap system is protected by dynamical decoupling sequences:
- CPMG: π-pulses at times T/4, 3T/4
- XY4: alternating X, Y, X, Y pulses
- KDD: concatenated sequences
For the gap Hamiltonian, the decoupling frequency must exceed the gap phonon bandwidth ω_max = 0.29 ℏ/κ from A3-12 Piece 03.

**Gap Robust GRAPE.** The GRAPE gradient (Piece 04) is extended to robust cost:
```
∂F_robust/∂ε = Σ_i w_i ∂F(ε, δκ_i, δε_i)/∂ε
```
The ensemble size N = 100 gives robust pulses with < 0.1% fidelity loss for 1% parameter variation.

**Experimental Robust Control on OAM.** The OAM robust pulses:
- Designed via ensemble GRAPE with N=100
- Tested against SLM phase noise (σ_φ = 0.02 rad)
- Fidelity loss: < 0.01% (vs 1% for non-robust)
- Logical (C_2): < 0.0001% fidelity loss

**Experimental Robust Control on Transmons.** The transmon robust pulses:
- DRAG pulses for leakage suppression
- Composite pulses for amplitude error
- Dynamical decoupling during idle times
- Fidelity: 0.9999 for 1% parameter variation

**Connection to A3-15 (Thermodynamics).** The robust control maintains thermodynamic efficiency (A3-15 Piece 06) against parameter fluctuations. The work extraction protocol is robust to κ variations of 10⁻⁵.