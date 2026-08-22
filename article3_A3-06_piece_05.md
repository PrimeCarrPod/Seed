# A3-06 Decoherence_From_Gap_Randomness.md — Piece 05: Decoherence Across PrimeBookOne Directories (RG Flow)

## 5.1 PrimeBookOne Directories as RG Flow in Decoherence

PrimeBookOne organizes 3.67×10⁹ differences across directories:
- **0.0 directory**: 8-bit gaps (256 values)
- **1.0 directory**: 9-bit gaps (512 values)
- **2.0 directory**: 10-bit gaps (1024 values)
- **3.0 directory**: 11-bit gaps (2048 values)

Each directory increase adds one bit of resolution. This is an **RG flow in bit depth** (A3-04, Piece 07). The decoherence properties change across this flow.

## 5.2 Decoherence Rate vs. Bit Depth

The decoherence rate for a gap d at bit depth b is:
```
Γ^{(b)}(d) = (1/2) Σ_{d'≠d} |ω_{dd'}| · S_{dd'}^{(b)}(ω_{dd'})
```
where the spectral density S^{(b)} depends on the correlation structure at bit depth b.

### Key Observation: Decoherence Rate Decreases with Bit Depth

As b increases, the gap values become more precise, and the **modular structure becomes sharper**. The selection rules that suppress inter-sector transitions become more effective.

| Directory | Bits (b) | Γ_max (generic) | Γ_twin | Γ_sexy | DFS Quality |
|-----------|----------|-----------------|--------|--------|-------------|
| 0.0       | 8        | ~10^{-2}        | 0      | ~10^{-5} | Good       |
| 1.0       | 9        | ~5×10^{-3}      | 0      | ~3×10^{-6} | Better    |
| 2.0       | 10       | ~2×10^{-3}      | 0      | ~10^{-6} | Very Good  |
| 3.0       | 11       | ~10^{-3}        | 0      | ~3×10^{-7} | Excellent |

The scaling is approximately:
```
Γ^{(b)} ~ 2^{-(b-8)} · Γ^{(8)}
```

## 5.3 Phase Transition at b=8

From A3-05, Piece 05, there is a **quantum phase transition at b=8** where the twin prime weight crosses 50%:
- b=8: μ₈(2) = 0.5000 — twin primes dominate, exact DFS
- b=9: μ₉(2) = 0.2500 — twin primes split across two values (2, 258)
- b=10: μ₁₀(2) = 0.1250 — further splitting
- b=11: μ₁₁(2) = 0.0625

### Decoherence at the Transition

At b=8, the twin prime sector is a single state |2⟩ with exact protection. At b>8, the twin prime states are {|2⟩, |258⟩, |514⟩, ...} which are **distinct but correlated**. The decoherence rate within the twin prime manifold becomes non-zero:
```
Γ_twin^{(b)} ~ 10^{-(b-7)} for b > 8
```

However, the **collective twin prime subspace** remains an approximate DFS with decoherence rate decreasing as the sector splits across more states.

## 5.4 RG Equation for Decoherence Rate

The RG flow of the decoherence rate can be expressed as a beta function:
```
β(Γ) = b ∂_b log Γ(b) = -1 + O(Γ)
```

For small Γ (deep in the DFS phase), β(Γ) ≈ -1, giving the scaling Γ ~ 2^{-b}. Near the transition at b=8, there are corrections from the splitting of the twin prime sector.

### Fixed Points
- **IR fixed point** (b → ∞): Γ = 0 (perfect DFS, c=1 CFT with no decoherence)
- **UV fixed point** (b → 7): Γ diverges (no modular structure, no DFS)

The b=8 point is the **crossover** where the modular structure (mod 6, mod 30) becomes effective at the 8-bit resolution.

## 5.5 Decoherence and the c=1 CFT

In the continuum limit (b → ∞, A3-04, Piece 11), the system is a c=1 CFT. The decoherence rate in the CFT is:
```
Γ_CFT = 0
```
The CFT is unitary and has no intrinsic decoherence. The finite-b decoherence is a **lattice artifact** from the UV regularization.

The decoherence rate as a function of the UV cutoff a = 2^{-b}:
```
Γ(a) ~ a · |log a|^{-1}
```
This vanishes as a → 0, consistent with the continuum CFT being decoherence-free.

## 5.6 ESD Time Scaling with Bit Depth

The entanglement sudden death time scales as:
```
t_ESD^{(b)} = C^{(b)}(0) / Γ^{(b)}
```

The initial concurrence C^{(b)}(0) decreases with b because the state becomes less dominated by a single configuration:
- b=8: C(0) ~ 0.16 (twin prime dominance)
- b=9: C(0) ~ 0.12
- b=10: C(0) ~ 0.09
- b=11: C(0) ~ 0.07

Combined with Γ ~ 2^{-(b-8)}, we get:
```
t_ESD^{(b)} ~ 2^{b-8} · C^{(b)}(0) / Γ^{(8)}
```
which **increases exponentially with bit depth**. The entanglement survives longer at higher resolution.

## 5.7 Piece 05 Summary

- Decoherence rate Γ decreases as ~2^{-b} with bit depth
- b=8: quantum phase transition in DFS structure
- Twin prime sector splits across states for b>8, but collective protection remains
- RG beta function: β(Γ) ≈ -1 (scaling dimension 1)
- Continuum limit (b→∞): Γ = 0 (c=1 CFT is unitary)
- ESD time increases exponentially with bit depth
- Finite-b decoherence = UV lattice artifact

**References**: A3-04 (Piece 07: RG Flow, Piece 11: c=1 CFT), A3-05 (Piece 05: Phase Transitions), A3-02 (Hamiltonian), A1-08 (Proper Time Fluctuation Spectrum)