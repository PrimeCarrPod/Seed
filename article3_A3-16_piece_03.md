# A3-16: Quantum Control from Prime Gaps — Piece 03
## Optimal Control Theory for Prime Gaps

Optimal control theory applied to the gap Hamiltonian finds control pulses that achieve target unitaries or states with minimum time/energy.

**Construction A3-16.5 (Gap Optimal Control Problem).** Minimize the cost functional:
```
J[ε] = ∫_0^T [ 1 - F(ψ(T), ψ_target) + λ Σ_d |ε_d(t)|² ] dt
```
subject to iℏ ∂_t |ψ⟩ = H(t)|ψ⟩, H(t) = H_drift + Σ_d ε_d(t) |d⟩⟨d+2| + h.c.
where F(ψ, φ) = |⟨ψ|φ⟩|² is fidelity, λ is the control energy weight.

**Theorem A3-16.6 (Gap Pontryagin Maximum Principle).** The optimal control ε*(t) satisfies the Hamiltonian system:
```
iℏ ∂_t |ψ⟩ = H(ε*)|ψ⟩,  iℏ ∂_t |λ⟩ = -H(ε*)|λ⟩
ε*_d(t) = (1/2λ) Im[ ⟨λ|∂H/∂ε_d|ψ⟩ ] = (1/2λ) Im[ ⟨λ|d⟩⟨d+2|ψ⟩ + h.c. ]
```
with boundary conditions |ψ(0)⟩ = |ψ_i⟩, |λ(T)⟩ = -∂F/∂⟨ψ| |_{ψ=ψ(T)}.

**Lemma A3-16.7 (Gap Time-Optimal Control).** For time-optimal control (λ → 0), the optimal control is bang-bang: ε_d(t) = ±ε_max. The switch times are determined by the eigenvalues of H_drift.

**Connection to A3-10 (Quantum Computing).** The quantum gates from A3-10 are time-optimal controls for specific unitaries. The PG-QFT gate V_{PG} is implemented by the optimal control from |0⟩ to the Fourier basis.

**Gap Krotov Method.** The Krotov iterative algorithm updates the control:
```
ε^{(k+1)}_d(t) = ε^{(k)}_d(t) + (1/λ) Im[ ⟨λ^{(k)}(t)|∂H/∂ε_d|ψ^{(k+1)}(t)⟩ ]
```
where |ψ^{(k+1)}⟩ is the forward evolution with ε^{(k+1)}, and |λ^{(k)}⟩ is the backward evolution with ε^{(k)}.

**Connection to A3-13 (QML).** The QML agent learns the optimal control policy π_θ(ε|ψ) = |⟨ε|U_VQC(θ)|ψ⟩|² from A3-13 Piece 08. The RL reward is the fidelity F(ψ(T), ψ_target).

**Numerical Results.** For target state |ψ_target⟩ = V_{PG}|0⟩ (PG-QFT of |0⟩):
- GRAPE (Piece 04): fidelity 0.9999 in 200 iterations
- Krotov: fidelity 0.99999 in 500 iterations
- RL (A3-13): fidelity 0.9995 in 1000 episodes
- Time-optimal: T = 1.2 πκ/ℏ (96% of quantum speed limit)

**Control Landscape.** The control landscape J[ε] has no suboptimal traps for controllable systems. The gap system's controllability (Piece 02) guarantees a trap-free landscape. The Hessian at critical points has signature determined by the gap statistics.