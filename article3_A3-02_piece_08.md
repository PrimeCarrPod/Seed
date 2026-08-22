# A3-02 Time Evolution Operator — Piece 08: Symmetry Transformations and Conserved Quantities

## 8.1 Symmetries of the Time Evolution

The free time evolution U_0(t) = exp(-iĤt/ℏ) commutes with Ĥ by construction. The symmetries of U_0(t) are the symmetries of Ĥ.

From A3-01 (Piece 06), the Hamiltonian Ĥ = Σ E(k)|k⟩⟨k| has symmetry group:
- **U(1) phases**: e^{iθ_k} for each k (255 independent phases)
- **Permutations**: k ↔ k' if E(k) = E(k') (no degeneracies, so trivial)
- **Discrete symmetries**: k ↔ -k mod 256 (time reversal)

The full symmetry group of U_0(t) is U(1)^{255} ⋊ ℤ₂ (time reversal).

## 8.2 Conserved Quantities

By Noether's theorem, each continuous symmetry gives a conserved quantity. For the U(1)_k phase rotations:

```
Q_k = |k⟩⟨k|  (projector onto residue k)
```

These are **255 conserved charges** — one for each physical residue class. The conservation law:

```
d/dt ⟨Q_k⟩ = 0
```

means the probability of finding the electron in residue class k is constant in time (for free evolution).

## 8.3 Physical Interpretation: Gap Number Conservation

The conserved charges Q_k correspond to the **gap number** operator:

```
N̂ = Σ_k k |k⟩⟨k|
```

Wait — N̂ is not conserved because [N̂, Ĥ] ≠ 0 (Ĥ = ℏ/(κN̂)). The individually conserved quantities are the projectors |k⟩⟨k|, which count the number of times each residue appears.

The total proper time operator τ̂ = κ N̂ is **not** conserved — it increases with each step. The conservation is of the **residue distribution**, not the proper time.

## 8.4 Time Reversal Symmetry

The time reversal operator T acts as:

```
T |k⟩ = |-k mod 256⟩
```

On the Hamiltonian:

```
T Ĥ T⁻¹ = Σ E(k) T|k⟩⟨k|T⁻¹ = Σ E(k) |-k⟩⟨-k| = Σ E(-k) |k⟩⟨k| = Ĥ
```

since E(-k) = ℏ/(κ(-k)) = E(k) for k mod 256 (using -k ≡ 256-k mod 256, and E(256-k) = E(k) by symmetry of the spectrum? Actually E(k) = 1/k, so E(256-k) = 1/(256-k) ≠ 1/k. Wait.)

Let me check: E(k) = ℏ/(κ·k) for k = 1,...,255. Time reversal should map k → -k mod 256 = 256-k. But E(256-k) = ℏ/(κ(256-k)) ≠ E(k). So **time reversal is NOT a symmetry of Ĥ**!

This is crucial: the prime gap spectrum is **not time-reversal symmetric**. The direction of proper time (increasing τ) is correlated with the direction of prime gaps (increasing n). The one-electron universe has a **fundamental arrow of time** from the prime gap sequence.

## 8.5 CPT and the Antiparticle Sector

Charge conjugation C maps particles to antiparticles. In the one-electron universe (A1-07), the positron is the electron moving backward in proper time. The C operator:

```
C |k⟩ = |-k mod 256⟩ = |256-k⟩
```

Parity P acts on the worldline embedding (spatial reflection), not on the internal 256-dimensional space.

CPT theorem: CPT is a symmetry. Let's check:
- T: k → -k, t → -t
- C: k → -k (particle ↔ antiparticle)
- P: trivial on internal space

CPT: k → k (identity on internal space), t → -t with particle ↔ antiparticle. This is a symmetry.

## 8.6 Symmetry Breaking by Vertices

The vertex operators V_n from Piece 06 break the U(1)^{255} symmetry. They connect different k states:

```
V_n = Σ_n g_n (|k+d_n⟩⟨k| + h.c.)
```

This explicitly breaks the individual Q_k conservation. However, the **total probability** is conserved:

```
Q_total = Σ_k |k⟩⟨k| = I
```

and the **total proper time** advances:

```
τ̂ = κ Σ_k k |k⟩⟨k|
```

The symmetry breaking pattern:
- U(1)^{255} → U(1)_{total} (global phase)
- Time reversal T: explicitly broken by gap direction
- CPT: preserved (fundamental theorem)

## 8.7 Connection to Gauge Symmetries (Article 6)

Article 6 (A6-01 through A6-40) will show that the residual U(1) symmetries correspond to gauge symmetries:
- U(1)_em: global phase rotation (common phase for all k)
- SU(2)_L: acts on qubits 1-2 (twin/cousin subspace)
- SU(3)_c: acts on qubits 3-5 (color subspace)

The symmetry breaking by vertices gives masses to gauge bosons via the Higgs mechanism (A6-06). The 256-dimensional time evolution encodes the full gauge symmetry structure.